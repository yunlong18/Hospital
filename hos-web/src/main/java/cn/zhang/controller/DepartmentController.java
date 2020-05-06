package cn.zhang.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.TDepartment;
import cn.zhang.pojo.TDoctor;
import cn.zhang.service.DepartmentManagerService;
import cn.zhang.service.DoctorService;

@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentManagerService departmentManagerService;
	
	@Autowired
	private DoctorService  doctorService;

	@RequestMapping("/department/department-Info")
	public String showDepartmentInfo(Integer id,@RequestParam(defaultValue="1") Integer currentPage,@RequestParam(defaultValue="5") Integer pageSize, Model model){
		TDepartment department = departmentManagerService.getDepartmentById(id);
		PageBean<TDoctor> pageBean = doctorService.getPageBeanByDepartmentId(id, currentPage, pageSize);
		model.addAttribute("department", department);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("depId", department.getId());
		return "department-Info";
	}

	@RequestMapping("/department/department-navigation")
	public String showDepartmentNavigation(Model model){
		List<TDepartment> parentDeparment = departmentManagerService.listParentDeparment();
		Map<String, List<TDepartment>> map = new LinkedHashMap<>();
		for (TDepartment department : parentDeparment) {
			List<TDepartment> departmentList = departmentManagerService.listDepartmentByPid(department.getId());
			map.put(department.getDepName(), departmentList);
		}

		model.addAttribute("parentDeparment", parentDeparment);
		model.addAttribute("childDepartments", map);
		return "department-navigation";
	}
}
