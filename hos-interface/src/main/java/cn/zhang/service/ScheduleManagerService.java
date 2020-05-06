package cn.zhang.service;

import cn.zhang.common.pojo.QueryVO;
import cn.zhang.common.pojo.SourceNumber;
import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.ScheduleResult;
import cn.zhang.pojo.TSchedule;

import java.text.ParseException;
import java.util.List;
public interface ScheduleManagerService {

	PageBean<ScheduleResult> getPageBean(QueryVO queryVO);
	E3Result deleteSchedules(String ids);
	E3Result saveSchedule(TSchedule schedule);
	TSchedule getScheduleById(Long id);
	List<TSchedule> listScheduleByDoctorId(Long id);
	List<SourceNumber> listSourceNumberByScheduleId(Long scheduleId) throws ParseException ;
	void clearAgoSchedule();
}
