package cn.zhang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zhang.common.pojo.QueryVO;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.ScheduleResult;
import cn.zhang.service.ScheduleManagerService;

@Controller
public class DoctorScheduleController {
	
	@Autowired
	private ScheduleManagerService scheduleManagerService;
	
	@RequestMapping("/doctorSchedule/list")
	public String showScheduleInfo(QueryVO queryVO, Model model){
		PageBean<ScheduleResult> pageBean = scheduleManagerService.getPageBean(queryVO);
		model.addAttribute("pageBean", pageBean);
		return "doctor/schedule-list";
	}
}
