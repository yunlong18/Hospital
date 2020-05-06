package cn.zhang.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.zhang.common.pojo.TreeNode;
import cn.zhang.common.utils.E3Result;
import cn.zhang.pojo.TDepartment;
import cn.zhang.service.DepartmentManagerService;

@Controller
public class DepartmentManageController {

	@Autowired
	private DepartmentManagerService departmentService;
	@Value("${PICTURE_RELATIVE_PATH}")
	private String PICTURE_RELATIVE_PATH;
	
	@RequestMapping("/department/nodeList")
	@ResponseBody
	public List<TreeNode> getNodeList(){
		List<TreeNode> nodeList = departmentService.getNodeList();
		return nodeList;
	}
	
	@RequestMapping("/department/getDepartmentToView")
	public String getDepartmentById(Integer id, Model model){
		TDepartment department = departmentService.getDepartmentById(id);
		model.addAttribute("department", department);
		return "admin/department-list";
	}
	
	@RequestMapping("/department/editNode")
	@ResponseBody
	public E3Result editNode(Long id, String name){
		
		E3Result e3Result = departmentService.editNode(id, name);
		return e3Result;
	}
	@RequestMapping("/department/addNode")
	@ResponseBody
	public E3Result addNode(Long pId, String name){
		
		E3Result e3Result = departmentService.addNode(pId, name);
		return e3Result;
	}
	
	@RequestMapping("/department/deleteNodeById")
	@ResponseBody
	public E3Result deleteNodeById(Integer id){
		E3Result e3Result = departmentService.deleteNodeById(id);
		return e3Result;
	}
	
	@RequestMapping("/department/getDepartmentToJson")
	@ResponseBody
	public TDepartment getDepartMentById(Integer id){
		TDepartment department = departmentService.getDepartmentById(id);
		return department;
	}
	
	@RequestMapping("/department/toEdit")
	public String toEdit(Integer id, Model model){
		TDepartment department = departmentService.getDepartmentById(id);
		model.addAttribute("department", department);
		return "admin/department-edit";
	}
	
	@RequestMapping("/department/saveDepartment")
	public String saveDepartment(MultipartFile upload, TDepartment department, HttpServletRequest request, Model model) throws IllegalStateException, IOException{

		// 判断是否上传照片
		if(StringUtils.isNotBlank(upload.getOriginalFilename())){
			StringBuffer requestURL = request.getRequestURL();
			String protocol = requestURL.substring(0, 7);
			String realPath = protocol + requestURL.substring(7).split("/")[0] + PICTURE_RELATIVE_PATH;

			String filename = upload.getOriginalFilename();
			String realPath2 = request.getSession().getServletContext().getRealPath(PICTURE_RELATIVE_PATH);
			File file = new File(realPath2);
			if(!file.exists()){
				file.mkdirs();
			}
			// 随机生成一个文件名 再加上原文件名
			filename = UUID.randomUUID().toString().replaceAll("-", "") + filename;
			upload.transferTo(new File(realPath2, filename));
			department.setPic(realPath + filename);
		}

		TDepartment department2 = departmentService.saveDepartment(department);
		model.addAttribute("department", department2);
		return "admin/department-list";
		
	}
	
	
	
	
	
	
}
