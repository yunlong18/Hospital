package cn.zhang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zhang.common.utils.E3Result;
import cn.zhang.pojo.TFeedback;
import cn.zhang.pojo.TUser;
import cn.zhang.service.UserManagerService;
import cn.zhang.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private UserManagerService userManagerService;
	@Value("${REGEX_MOBILE}")
	private String REGEX_MOBILE;

	@RequestMapping(value="/user/register", method=RequestMethod.POST)
	public String register(TUser user, Model model){
		E3Result e3Result = userService.register(user);
		if(e3Result.getStatus() == 200){
			return "redirect:/login.html";
		}
		model.addAttribute("error", e3Result.getMsg());
		return "register1";
	}
	
	@RequestMapping("/user/checkUserName")
	@ResponseBody
	public E3Result checkUserName(String userName){
		E3Result e3Result = userService.checkUserName(userName);
		return e3Result;
	}
	
	@RequestMapping("/user/login")
	public String login(String userName, String userPassword, Model model,
			HttpServletRequest request){
		
		E3Result e3Result = userService.login(userName, userPassword);
		if(e3Result.getStatus() == 200){
			HttpSession session = request.getSession();
			session.setAttribute("user", e3Result.getData());
			return "redirect:/portal/index.html";
		} else {
			model.addAttribute("username", userName);
			model.addAttribute("userPassword", userPassword);
			model.addAttribute("error", e3Result.getMsg());
			return "login";
		}
	}
	
	@RequestMapping("/user/logout")
	@ResponseBody
	public E3Result login(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return E3Result.ok();
	}

	@RequestMapping("/user/selfManager")
	public String selfManager(HttpServletRequest request){
		return "self-manager";
	}

	@RequestMapping("/user/updateUser")
	@ResponseBody
	public E3Result updateUser(TUser user, HttpServletRequest request){
		TUser sessionUser = (TUser) request.getSession().getAttribute("user");
		if(StringUtils.isBlank(user.getUserRealname()) || StringUtils.isBlank(user.getUserTel()) ||
			!user.getUserTel().matches(REGEX_MOBILE)){
			return E3Result.build(400, "信息有误");
		}
		sessionUser.setUserRealname(user.getUserRealname());
		sessionUser.setUserTel(user.getUserTel());
		return userManagerService.saveOrUpdateUser(user);
	}

	@RequestMapping("/user/updateUserPassword")
	@ResponseBody
	public E3Result updateUserPassword(String oldPassword, String newPassword, HttpServletRequest request){
		TUser user = (TUser)request.getSession().getAttribute("user");
		E3Result e3Result = userService.updateUserPassword(user, oldPassword, newPassword);
		if(e3Result.getStatus() != 200){
			request.setAttribute("error", e3Result.getMsg());
			return e3Result;
		} else {
			request.getSession().setAttribute("user", e3Result.getData());
			return e3Result;
		}
	}

	@RequestMapping("/user/commitMessage")
	@ResponseBody
	public E3Result commitMessage(TFeedback feedback){
		return userService.insertFeedBack(feedback, REGEX_MOBILE);
	}

}

















