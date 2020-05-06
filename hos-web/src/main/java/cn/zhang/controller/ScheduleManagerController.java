package cn.zhang.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zhang.common.pojo.QueryVO;
import cn.zhang.common.pojo.SourceNumber;
import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.ScheduleResult;
import cn.zhang.pojo.TSchedule;
import cn.zhang.service.ScheduleManagerService;

@Controller
public class ScheduleManagerController {

	@Autowired
	private ScheduleManagerService scheduleManagerService;
	@Value("${DOCTOR_SCHEDULE_PREFIX}")
	private String DOCTOR_SCHEDULE_PREFIX;

	@RequestMapping("/scheduleManager/list")
	public String showScheduleList(QueryVO queryVO, Model model) {
		PageBean<ScheduleResult> pageBean = scheduleManagerService.getPageBean(queryVO);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("userTel", queryVO.getUserTel());
		return "admin/schedule-list";
	}

	@RequestMapping("/scheduleManager/deleteSchedules")
	@ResponseBody
	public E3Result deleteSchedules(String ids) {
		return scheduleManagerService.deleteSchedules(ids);
	}

	@RequestMapping("/scheduleManager/saveSchedule")
	public String saveSchedule(TSchedule schedule) throws ParseException {
		scheduleManagerService.saveSchedule(schedule);
		return "redirect:/scheduleManager/list.html";
	}
	
	@RequestMapping("/scheduleManager/toEdit")
	public String toEdit(Long id, Model model) {
		TSchedule schedule = scheduleManagerService.getScheduleById(id);
		model.addAttribute("schedule", schedule);
		return "admin/schedule-edit";
	}
	
	@RequestMapping("/scheduleManager/sourceNumber")
	@ResponseBody
	public E3Result sourceNumber(Long scheduleId, HttpServletRequest request) throws ParseException {
		List<SourceNumber> list = null;
		// 判断session中是否有号源列表
		list = (List<SourceNumber>)request.getSession().getAttribute(DOCTOR_SCHEDULE_PREFIX + scheduleId);
		if (list != null){
			return E3Result.ok(list);
		}
		list = scheduleManagerService.listSourceNumberByScheduleId(scheduleId);
		request.getSession().setAttribute(DOCTOR_SCHEDULE_PREFIX + scheduleId, list);
		return E3Result.ok(list);
	}
}
