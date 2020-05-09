package cn.zhang.service.impl;

import java.lang.reflect.Array;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import cn.zhang.common.jedis.JedisClient;
import cn.zhang.common.pojo.SourceNumber;
import cn.zhang.common.utils.JsonUtils;
import cn.zhang.constant.FormatDateConsts;
import cn.zhang.constant.RedisKeyPrefixConsts;
import cn.zhang.pojo.TSchedule;
import cn.zhang.service.ScheduleManagerService;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import cn.zhang.common.utils.E3Result;
import cn.zhang.mapper.TOrderMapper;
import cn.zhang.pojo.TOrder;
import cn.zhang.pojo.TOrderExample;
import cn.zhang.pojo.TOrderExample.Criteria;
import cn.zhang.service.OrderService;

import javax.xml.transform.Source;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private TOrderMapper orderMapper;
	@Autowired
	private ScheduleManagerService scheduleManagerService;
	@Autowired
	private JedisClient jedisClient;

	@Override
	public E3Result insertOrder(TOrder order, Long schedule) {
		// 生成主键id
		Long id = System.currentTimeMillis() + RandomUtils.nextLong(0, 1000);
		order.setId(id);
		// 补全信息
		order.setCreated(new Date());
		// 预约状态：0为预约中；1为预约成功；2为预约失败
		order.setState(0);
		// 就诊状态: 0为未就诊；1为已就诊；2为爽约
		order.setVisitState(0);
		// 是否为历史订单
		order.setHistoryState(false);
		orderMapper.insert(order);
		// 删除被预约的号源
		deleteOrderedSourceNumber(order, schedule);
		return E3Result.ok();
	}

	private void deleteOrderedSourceNumber(TOrder order, Long schedule) {
		// 获取缓存中该排班的所有号源
		String sourceNumberJson = jedisClient.get(RedisKeyPrefixConsts.DOCTOR_SCHEDULE_PREFIX + schedule);
		// 获取存放被预约的号源
		String deletedSourceNumberJson = jedisClient.get(RedisKeyPrefixConsts.DELETE_DOCTOR_SCHEDULE_PREFIX + schedule);
		List<SourceNumber> deletedSourceNumbers = null;
		if (StringUtils.isBlank(deletedSourceNumberJson)) {
			deletedSourceNumbers = new ArrayList<>();
		} else {
			deletedSourceNumbers = JsonUtils.jsonToList(deletedSourceNumberJson, SourceNumber.class);
		}
		if (StringUtils.isNotBlank(sourceNumberJson)) {
			List<SourceNumber> sourceNumbers = JsonUtils.jsonToList(sourceNumberJson, SourceNumber.class);
			for (SourceNumber sourceNumber : sourceNumbers) {
				if (dateToString(order.getOrderDate(), FormatDateConsts.DATA_FORMAT_TO_HOUR_MINUTE).equals(sourceNumber.getStartTime_x())) {
					// 从号源集合中删除
					sourceNumbers.remove(sourceNumber);
					// 添加到存放被预约的号源集合中
					deletedSourceNumbers.add(sourceNumber);
					break;
				}
			}
			// 更新缓存中的数据
			jedisClient.set(RedisKeyPrefixConsts.DOCTOR_SCHEDULE_PREFIX + schedule, JsonUtils.objectToJson(sourceNumbers));
			jedisClient.set(RedisKeyPrefixConsts.DELETE_DOCTOR_SCHEDULE_PREFIX + schedule, JsonUtils.objectToJson(deletedSourceNumbers));
		}
	}

	/**
	 * 将字符串根据指定的格式转换为日期
	 * @param source 要转换的字符串
	 * @param pattern 转换的格式
	 * */
	private Date stringToDate(String source , String pattern) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.parse(source);
	}

	/**
	 * 将日期根据指定的格式转换位字符串
	 * @param date 要转换的日期
	 * @param pattern 转换的格式
	 * */
	private String dateToString(Date date , String pattern) {
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		return format.format(date);
	}

	@Override
	public List<TOrder> listOrderByUserId(Integer id, Boolean isHistory) {
		TOrderExample example = new TOrderExample();
		Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(id);
		if(isHistory != null){
			criteria.andHistoryStateEqualTo(isHistory);
		}
		List<TOrder> list = orderMapper.selectByExample(example);
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	@Override
	public E3Result updateOrder(Long orderId) {
		TOrder order = orderMapper.selectByPrimaryKey(orderId);
		// 是否让为历史订单：true/false
		order.setHistoryState(true);
		// 订单的状态：0为预约中；1为预约成功；2为预约失败；3取消预约
		order.setState(3);
		orderMapper.updateByPrimaryKeySelective(order);
		// 恢复号源状态
		refreshSourceNumber(order);
		return E3Result.ok();
	}

	/**
	 * 恢复号源的状态
	 * */
	private void refreshSourceNumber(TOrder order) {
		// 获取该医生所有的排班对象
		List<TSchedule> tSchedules = scheduleManagerService.listScheduleByDoctorId(order.getDoctorId());
		for (TSchedule tSchedule : tSchedules) {
			if (tSchedules != null && tSchedules.size() > 0) {
				// 查询指定日期的排班
				if (dateToString(order.getOrderDate(), FormatDateConsts.DATA_FORMAT_TO_YEAR_MONTH_DAY)
						.equals(tSchedule.getWorkDate_x())) {
					// 判断该订单是上午还是下午
					if (dateToString(order.getOrderDate(), FormatDateConsts.DATA_FORMAT_TO_HOUR_MINUTE)
							.compareTo(FormatDateConsts.JUDGE_SOURCE_NUMBER_RANGE) < 0 && !tSchedule.getWorkTime()) {
						// 从缓存中获取该排班的号源
						String s = jedisClient.get(RedisKeyPrefixConsts.DOCTOR_SCHEDULE_PREFIX + tSchedule.getId());
						List<SourceNumber> sourceNumbers = JsonUtils.jsonToList(s, SourceNumber.class);
						if (StringUtils.isBlank(s)) {
							sourceNumbers = new ArrayList<>();
						}
						// 从缓存中获取该排班已经被预约的号源集合
						String s1 = jedisClient.get(RedisKeyPrefixConsts.DELETE_DOCTOR_SCHEDULE_PREFIX + tSchedule.getId());
						List<SourceNumber> deletedSourceNumbers = JsonUtils.jsonToList(s1, SourceNumber.class);
						for (SourceNumber deletedSourceNumber : deletedSourceNumbers) {
							if (dateToString(order.getOrderDate(), FormatDateConsts.DATA_FORMAT_TO_HOUR_MINUTE)
									.equals(deletedSourceNumber.getStartTime_x())) {
								deletedSourceNumbers.remove(deletedSourceNumber);
								sourceNumbers.add(deletedSourceNumber);
								Collections.sort(sourceNumbers);
								jedisClient.set(RedisKeyPrefixConsts.DOCTOR_SCHEDULE_PREFIX + tSchedule.getId(),
										JsonUtils.objectToJson(sourceNumbers));
								jedisClient.set(RedisKeyPrefixConsts.DELETE_DOCTOR_SCHEDULE_PREFIX + tSchedule.getId(),
										JsonUtils.objectToJson(deletedSourceNumbers));
								break;
							}
						}
					} else {
						// 从缓存中获取该排班的号源
						String s = jedisClient.get(RedisKeyPrefixConsts.DOCTOR_SCHEDULE_PREFIX + tSchedule.getId());
						List<SourceNumber> sourceNumbers = JsonUtils.jsonToList(s, SourceNumber.class);
						if (StringUtils.isBlank(s)) {
							sourceNumbers = new ArrayList<>();
						}
						// 从缓存中获取该排班已经被预约的号源集合
						String s1 = jedisClient.get(RedisKeyPrefixConsts.DELETE_DOCTOR_SCHEDULE_PREFIX + tSchedule.getId());
						List<SourceNumber> deletedSourceNumbers = JsonUtils.jsonToList(s1, SourceNumber.class);
						for (SourceNumber deletedSourceNumber : deletedSourceNumbers) {
							if (dateToString(order.getOrderDate(), FormatDateConsts.DATA_FORMAT_TO_HOUR_MINUTE)
									.equals(deletedSourceNumber.getStartTime_x())) {
								deletedSourceNumbers.remove(deletedSourceNumber);
								sourceNumbers.add(deletedSourceNumber);
								Collections.sort(sourceNumbers);
								jedisClient.set(RedisKeyPrefixConsts.DOCTOR_SCHEDULE_PREFIX + tSchedule.getId(),
										JsonUtils.objectToJson(sourceNumbers));
								jedisClient.set(RedisKeyPrefixConsts.DELETE_DOCTOR_SCHEDULE_PREFIX + tSchedule.getId(),
										JsonUtils.objectToJson(deletedSourceNumbers));
								break;
							}
						}
					}
				}
			}

		}
	}

	@Override
	public E3Result deleteOrder(Long orderId) {
		orderMapper.deleteByPrimaryKey(orderId);
		return E3Result.ok();
	}

}
