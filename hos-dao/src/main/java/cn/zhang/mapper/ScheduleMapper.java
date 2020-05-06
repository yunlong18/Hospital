package cn.zhang.mapper;

import java.util.List;

import cn.zhang.common.pojo.QueryVO;
import cn.zhang.pojo.ScheduleResult;

public interface ScheduleMapper {
	
	List<ScheduleResult> selectAllSchedule(QueryVO queryVO);
	Long countTotal(QueryVO queryVO);
}
