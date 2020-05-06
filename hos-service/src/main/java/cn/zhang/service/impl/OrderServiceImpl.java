package cn.zhang.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zhang.common.utils.E3Result;
import cn.zhang.mapper.TOrderMapper;
import cn.zhang.pojo.TOrder;
import cn.zhang.pojo.TOrderExample;
import cn.zhang.pojo.TOrderExample.Criteria;
import cn.zhang.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private TOrderMapper orderMapper;
	
	@Override
	public E3Result insertOrder(TOrder order) {
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
		return E3Result.ok();
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
		return E3Result.ok();
	}

	@Override
	public E3Result deleteOrder(Long orderId) {
		orderMapper.deleteByPrimaryKey(orderId);
		return E3Result.ok();
	}

}
