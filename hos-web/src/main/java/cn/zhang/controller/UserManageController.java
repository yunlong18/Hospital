package cn.zhang.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TUser;
import cn.zhang.service.UserManagerService;

@Controller
public class UserManageController {

	@Autowired
	private UserManagerService userService;

	@RequestMapping("/user/list")
	public String getList(Model model, QueryVO queryVo) {
		
		PageBean<TUser> page = userService.getList(queryVo);
		model.addAttribute("pageBean", page);
		model.addAttribute("userTel", queryVo.getUserTel());
		return "admin/user-list";
	}

	@RequestMapping("/user/list1")
	public String getList1(Model model, QueryVO queryVo) {

		PageBean<TUser> page = userService.getList(queryVo);
		model.addAttribute("pageBean", page);
		model.addAttribute("userTel", queryVo.getUserTel());
		return "admin/user-list1";
	}
	
	@RequestMapping("/user/toEdit")
	public String editUser(Model model, Integer id) {
		
		TUser user = userService.getUserById(id);
		model.addAttribute("user", user);
		return "admin/user-edit";
	}
	
	@RequestMapping("/user/saveUser")
	public void saveOrUpdateUser(HttpServletRequest request, HttpServletResponse response, TUser user) throws IOException {
		userService.saveOrUpdateUser(user);
		response.sendRedirect(request.getContextPath() + "/user/list.html");
	}
	
	@RequestMapping("/user/deleteUsers")
	public @ResponseBody E3Result deleteUserByIds(String ids) {
		return userService.deleteUserByIds(ids);
	}
}








