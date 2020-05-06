package cn.zhang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	@RequestMapping("/{page}")
	public String showIndex(@PathVariable String page){
		return page;
	}

	@RequestMapping("/admin/{page}")
	public String showIndex(@PathVariable String page, Long categoryId, Model model){
		model.addAttribute("categoryId", categoryId);
		return "admin/" + page;
	}

	@RequestMapping("/doctor/{page}")
	public String showDoctor(@PathVariable String page){
		return "doctor/" + page;
	}

	@RequestMapping("/doctorIndex/{page}")
	public String showDoctorIndex(@PathVariable String page){
		return "doctor/" + page;
	}

	@RequestMapping("/adminIndex/{page}")
	public String adminIndex(@PathVariable String page){
		return "admin/" + page;
	}
}
