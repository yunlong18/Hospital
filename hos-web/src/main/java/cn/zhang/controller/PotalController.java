package cn.zhang.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zhang.pojo.TContent;
import cn.zhang.pojo.TDepartment;
import cn.zhang.service.ContentManagerService;
import cn.zhang.service.DepartmentManagerService;

@Controller
public class PotalController {
	
	@Autowired
	private ContentManagerService contentService;
	
	@Autowired
	private DepartmentManagerService departmentManagerService;
	@Value("${PROTAL_LUNBO_ID}")
	private Long PROTAL_LUNBO_ID;
	@Value("${PROTAL_LUNBO_NEWS_ID}")
	private Long PROTAL_LUNBO_NEWS_ID;
	@Value("${NEWS_LIST_ID}")
	private Long NEWS_LIST_ID;

	@RequestMapping("/portal/index")
	public String showPotal(Model model){
		// 查询首页轮播图列表
		List<TContent> contentList = contentService.listContentByCategoryId(PROTAL_LUNBO_ID);
		model.addAttribute("contentList", contentList);
		// 查询首页轮播新闻列表
		List<TContent> contentList1 = contentService.listContentByCategoryId(PROTAL_LUNBO_NEWS_ID);
		model.addAttribute("contentList1", contentList1);
		// 查询首页新闻列表
		List<TContent> contentList2 = contentService.listContentByCategoryId(NEWS_LIST_ID);
		model.addAttribute("contentList2", contentList2);
		// 查询首页部门列表
		List<TDepartment> parentDepartment = departmentManagerService.listParentDeparment();
		model.addAttribute("parentDepartment", parentDepartment);
		List<List<TDepartment>> childDepartments = new ArrayList<>();
		for (TDepartment tDepartment : parentDepartment) {
			List<TDepartment> childDepartment = departmentManagerService.listDepartmentByPid(tDepartment.getId());
			childDepartments.add(childDepartment);
		}
		model.addAttribute("childDepartments", childDepartments);
		return "portal";
	}
}
