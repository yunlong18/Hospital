package cn.zhang.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zhang.pojo.TCredit;
import cn.zhang.pojo.TUser;
import cn.zhang.service.CreditService;

@Controller
public class CreditController {

	@Autowired
	private CreditService creditService;
	@RequestMapping("/credit/creditInfo")
	public String showCreditInfo(HttpServletRequest request){
		TUser user = (TUser) request.getSession().getAttribute("user");
		if (user != null) {
			TCredit credit = creditService.getCreditByUserId(user.getId());
			request.setAttribute("credit", credit);
			return "credit-info";
		}
		return "error";
	}
}
