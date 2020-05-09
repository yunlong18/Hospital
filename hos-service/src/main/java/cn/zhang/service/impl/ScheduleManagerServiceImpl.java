package cn.zhang.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import cn.zhang.common.jedis.JedisClient;
import cn.zhang.common.utils.JsonUtils;
import cn.zhang.constant.RedisKeyPrefixConsts;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import cn.zhang.common.pojo.QueryVO;
import cn.zhang.common.pojo.SourceNumber;
import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.constant.OrderConsts;
import cn.zhang.constant.PageConsts;
import cn.zhang.constant.TimeConsts;
import cn.zhang.mapper.ScheduleMapper;
import cn.zhang.mapper.TScheduleMapper;
import cn.zhang.pojo.ScheduleResult;
import cn.zhang.pojo.TDepartment;
import cn.zhang.pojo.TDoctor;
import cn.zhang.pojo.TSchedule;
import cn.zhang.pojo.TScheduleExample;
import cn.zhang.pojo.TScheduleExample.Criteria;
import cn.zhang.service.DepartmentManagerService;
import cn.zhang.service.DoctorManagerService;
import cn.zhang.service.ScheduleManagerService;

@Service
public class ScheduleManagerServiceImpl implements ScheduleManagerService {

    @Autowired
    private TScheduleMapper tScheduleMapper;
    @Autowired
    private ScheduleMapper scheduleMapper;
    @Autowired
    private DepartmentManagerService departmentManagerService;
    @Autowired
    private DoctorManagerService doctorManagerService;

    @Autowired
    private JedisClient jedisClient;


    @Override
    public PageBean<ScheduleResult> getPageBean(QueryVO queryVO) {
        if (queryVO != null) {
            if (queryVO.getCurrentPage() == null || "".equals(queryVO.getCurrentPage())) {
                queryVO.setCurrentPage(PageConsts.DERAULT_CURRENTPAGE);
            }
            if (queryVO.getPageSize() == null || "".equals(queryVO.getPageSize())) {
                queryVO.setPageSize(PageConsts.DEFAULT_PAGESIZE);
            }
            PageBean<ScheduleResult> pageBean = new PageBean(queryVO.getCurrentPage(),
                    queryVO.getPageSize());
            List<ScheduleResult> list = scheduleMapper.selectAllSchedule(queryVO);
            for (ScheduleResult schedule : list) {
                Integer timeInterval = schedule.getTimeInterval();
                timeInterval = timeInterval / TimeConsts.MINUTES_TO_MILLISECONDS;
                schedule.setTimeInterval(timeInterval);
            }
            pageBean.setList(list);
            Long countTotal = scheduleMapper.countTotal(queryVO);
            pageBean.setTotalCount(countTotal);
            pageBean.setTotalPage((int) Math.ceil((1.0 * pageBean.getTotalCount())
                    / pageBean.getPageSize()));
            return pageBean;
        } else {
            PageBean<ScheduleResult> pageBean = new PageBean();
            // 设置默认参数
            pageBean.setCurrentPage(PageConsts.DERAULT_CURRENTPAGE);
            pageBean.setPageSize(PageConsts.DEFAULT_PAGESIZE);
            List<ScheduleResult> list = scheduleMapper.selectAllSchedule(queryVO);
            for (ScheduleResult schedule : list) {
                Integer timeInterval = schedule.getTimeInterval();
                timeInterval = timeInterval / TimeConsts.MINUTES_TO_MILLISECONDS;
                schedule.setTimeInterval(timeInterval);
            }
            pageBean.setList(list);
            Long countTotal = scheduleMapper.countTotal(queryVO);
            pageBean.setTotalCount(countTotal);
            pageBean.setTotalPage((int) Math.ceil((1.0 * pageBean.getTotalCount())
                    / pageBean.getPageSize()));

            return pageBean;
        }
    }

    @Override
    public E3Result deleteSchedules(String ids) {
        if (StringUtils.isBlank(ids)) {
            return E3Result.build(400, "至少选择一个");
        }
        String[] scheduleIds = ids.split(",");
        for (String id : scheduleIds) {
            tScheduleMapper.deleteByPrimaryKey(Long.valueOf(id));
        }
        return E3Result.ok();
    }

    @Override
    public E3Result saveSchedule(TSchedule schedule) {

        // 判断当前schedule是否有id
        if (schedule.getId() != null) {
            tScheduleMapper.updateByPrimaryKeySelective(timeIntervalToMilliseconds(schedule));
            return E3Result.ok();
        }
        tScheduleMapper.insert(timeIntervalToMilliseconds(schedule));
        return E3Result.ok();
    }

    @Override
    public TSchedule getScheduleById(Long id) {
        TSchedule schedule = tScheduleMapper.selectByPrimaryKey(id);
        return timeIntervalToMinutes(schedule);
    }

    // 用于将分钟转化为毫秒值
    private TSchedule timeIntervalToMilliseconds(TSchedule schedule) {
        Integer timeInterval = schedule.getTimeInterval();
        timeInterval = timeInterval * TimeConsts.MINUTES_TO_MILLISECONDS;
        schedule.setTimeInterval(timeInterval);
        return schedule;
    }

    // 用于将医生时间间隔的毫秒数转化为分钟
    private TSchedule timeIntervalToMinutes(TSchedule schedule) {
        Integer timeInterval = schedule.getTimeInterval();
        timeInterval = timeInterval / TimeConsts.MINUTES_TO_MILLISECONDS;
        schedule.setTimeInterval(timeInterval);
        return schedule;
    }

    @Override
    public List<TSchedule> listScheduleByDoctorId(Long id) {
        TScheduleExample example = new TScheduleExample();
        Criteria criteria = example.createCriteria();
        criteria.andDoctorIdEqualTo(id);
        criteria.andWorkDateGreaterThan(new Date());
        example.setOrderByClause(OrderConsts.SCHEDULE_ORDER_BY_WORK_DATE + ","
                + OrderConsts.SCHEDULE_ORDER_BY_WORK_TIME);
        List<TSchedule> schedules = tScheduleMapper.selectByExample(example);
        return schedules;
    }

    @Override
    public List<SourceNumber> listSourceNumberByScheduleId(Long scheduleId) throws ParseException {
        // 获取医生当前排班
        TSchedule schedule = tScheduleMapper.selectByPrimaryKey(scheduleId);
        // 根据医生id查询医生信息
        TDoctor doctor = doctorManagerService.getDoctorById(schedule.getDoctorId());
        // 获取部门信息
        TDepartment department = departmentManagerService.getDepartmentById(doctor.getDepId());
        // 获取部门的上班时间
        String startWork = department.getFromDate();
        // 获取部门的下班时间
        String endWork = department.getToDate();
        // 获取医生号源的时间间隔
        Integer timeInterval = schedule.getTimeInterval();
        // 获取坐诊日期
        Date date = schedule.getWorkDate();
        // 判断医生当前是上午还是下午坐诊
        if (!schedule.getWorkTime()) {
            return listSourceNumber(startWork, TimeConsts.DEPARTMENT_OFF_DUTY_TIME_MORNING,
                    timeInterval, date, scheduleId);
        } else {
            return listSourceNumber(TimeConsts.DEPARTMENT_WORKING_HOURS_AFTERNOON,
                    endWork, timeInterval, date, scheduleId);
        }
    }

    private List<SourceNumber> listSourceNumber(String startWork, String endWork, Integer timeInterval,
                                                Date initDate, Long scheduleId) {

        try {
            // 判断缓存中是否已经存在号源信息
            String s = jedisClient.get(RedisKeyPrefixConsts.DOCTOR_SCHEDULE_PREFIX + scheduleId);
            // 如果已经存在号源信息，直接转换成集合返回
            if (StringUtils.isNotBlank(s)) {
                List<SourceNumber> sourceNumbers = JsonUtils.jsonToList(s, SourceNumber.class);
                return sourceNumbers;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        Calendar calendar = Calendar.getInstance();
        // 设置上班日期为初始化时间 当前参数例如：2020-04-22 00:00:00
        calendar.setTime(initDate);
        // 获取起始时间的 时和分例如：09:00 分别为09和00
        Integer offsetHour = Integer.valueOf(startWork.split(":")[0]);
        Integer offsetMinute = Integer.valueOf(startWork.split(":")[1]);
        // 使当前时间偏移上面获取的时和分 ，当前时间为 2020-04-22 09:00:00
        calendar.add(Calendar.HOUR_OF_DAY, offsetHour);
        calendar.add(Calendar.MINUTE, offsetMinute);
        // 获取上面时间对应的毫秒值，用于计算
        long startTimeMill = calendar.getTimeInMillis();
        // 下面的过程是获取结束时间的毫秒值，用于计算
        Integer offsetHour2 = Integer.valueOf(endWork.split(":")[0]);
        Integer offsetMinute2 = Integer.valueOf(endWork.split(":")[1]);
        // 先将时间的时针回溯到00，再进行偏移
        calendar.add(Calendar.HOUR_OF_DAY, -offsetHour + offsetHour2);
        // 将分钟回溯到00，再进行偏移
        calendar.add(Calendar.MINUTE, -offsetMinute + offsetMinute2);
        long endTimeMill = calendar.getTimeInMillis();
        List<SourceNumber> list = new ArrayList<SourceNumber>();
        for (Long i = startTimeMill; i < endTimeMill; i += timeInterval) {
            SourceNumber sourceNumber = new SourceNumber();
            sourceNumber.setScheduleId(scheduleId);
            sourceNumber.setDate(initDate);
            sourceNumber.setStartTime(new Date(i));
            // 边界值判断,如果最后的时间大于了结束时间，则将该号源废除
            if (i + timeInterval > endTimeMill) {
                continue;
            } else {
                sourceNumber.setEndtTime(new Date(i + timeInterval));
            }
            list.add(sourceNumber);
        }
        // 将生成的号源集合存放到缓存中
        jedisClient.set(RedisKeyPrefixConsts.DOCTOR_SCHEDULE_PREFIX + scheduleId,
                JsonUtils.objectToJson(list));
        // 设置过期时间为一天
        jedisClient.expire(RedisKeyPrefixConsts.DOCTOR_SCHEDULE_PREFIX + scheduleId,
                TimeConsts.SOURCE_NUMBER_REDIS_EXPIRE);
        // 初始化一个存放被预约号源的key
        jedisClient.set(RedisKeyPrefixConsts.DELETE_DOCTOR_SCHEDULE_PREFIX + scheduleId, "");
        // 设置过期时间
        jedisClient.expire(RedisKeyPrefixConsts.DELETE_DOCTOR_SCHEDULE_PREFIX + scheduleId,
                TimeConsts.SOURCE_NUMBER_REDIS_EXPIRE);
        return list;
    }

    @Override
    public void clearAgoSchedule() {
        TScheduleExample example = new TScheduleExample();
        example.createCriteria().andWorkDateLessThan(new Date());
        tScheduleMapper.deleteByExample(example);
    }


}
