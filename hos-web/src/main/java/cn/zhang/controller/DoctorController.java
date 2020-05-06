package cn.zhang.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TCredit;
import cn.zhang.pojo.TDepartment;
import cn.zhang.pojo.TDoctor;
import cn.zhang.pojo.TSchedule;
import cn.zhang.pojo.TUser;
import cn.zhang.service.CreditService;
import cn.zhang.service.DepartmentManagerService;
import cn.zhang.service.DoctorManagerService;
import cn.zhang.service.ScheduleManagerService;

@Controller
public class DoctorController {
	
	@Autowired
	private DoctorManagerService doctorManagerService;
	@Autowired
	private DepartmentManagerService departmentManagerService;
	@Autowired
	private ScheduleManagerService scheduleManagerService;
	@Autowired
	private CreditService creditService;

	@RequestMapping("/doctor/doctorInfo")
	private String showDoctorInfo(Long id, HttpServletRequest request){
		TUser user = (TUser) request.getSession().getAttribute("user");
		TDoctor doctor = doctorManagerService.getDoctorById(id);
		E3Result e3Result = doctorManagerService.getDoctorDescById(id);
		List<TSchedule> scheduleList = scheduleManagerService.listScheduleByDoctorId(id);
		// 判断用户否为空，不为空时才进行信誉分的查询
		if (user != null) {
			TCredit credit = creditService.getCreditByUserId(user.getId());
			request.setAttribute("credit", credit);
		}
		request.setAttribute("scheduleList", scheduleList);
		request.setAttribute("doctorDesc", e3Result.getData());
		request.setAttribute("doctor", doctor);
		request.setAttribute("depId", doctor.getDepId());
		request.setAttribute("user", user);
		return "doctor-info";
	}
	
	@RequestMapping("/doctor/department")
	@ResponseBody
	public E3Result getDepartmentById(Integer id){
		TDepartment department = departmentManagerService.getDepartmentById(id);
		return E3Result.ok(department);
	}

	@RequestMapping("/doctor/doctorNavigation")
	public String showDoctorNavigation(Model model){

		List<TDepartment> parentDepartment = departmentManagerService.listParentDeparment();
		// 创建一个装有Map的list集合
		Map<String, Map<TDepartment, List<TDoctor>>> departmentDoctors = new LinkedHashMap<>();
		// 遍历父部门，查询下面的子部门
		for (TDepartment department: parentDepartment) {
			List<TDepartment> childDepartments = departmentManagerService
					.listDepartmentByPid(department.getId());
			// 查询该部门下的所有医生
			Map<TDepartment, List<TDoctor>> map = new LinkedHashMap<>();
			for (TDepartment childDepartment : childDepartments) {
				List<TDoctor> doctors = doctorManagerService
						.listDoctorByDepId(childDepartment.getId());
				map.put(childDepartment, doctors);
			}
			departmentDoctors.put(department.getDepName(), map);
		}
		// 将查询的数据保存到model中，传递给页面
		model.addAttribute("parentDepartment", parentDepartment);
		model.addAttribute("departmentDoctors", departmentDoctors);
		return "doctor-navigation";
	}

	@RequestMapping("/doctor/doctorTeam")
	public String showDoctorTeam(QueryVO queryVO, Model model){
		PageBean<TDoctor> pageBean = doctorManagerService.getList(queryVO);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("depId", queryVO.getDepId());
		return "doctor-team";
	}
}
