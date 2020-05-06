package cn.zhang.quartz;

import org.springframework.beans.factory.annotation.Autowired;
import cn.zhang.service.ScheduleManagerService;

public class TimingDeleteSchedule {
	
	@Autowired
	private ScheduleManagerService scheduleManagerService;
	
	public void run(){
		scheduleManagerService.clearAgoSchedule();
	}
}
