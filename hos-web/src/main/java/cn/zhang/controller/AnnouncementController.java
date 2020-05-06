package cn.zhang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TContent;
import cn.zhang.service.ContentManagerService;

@Controller
public class AnnouncementController {

	@Autowired
	private ContentManagerService contentManagerService;
	@Value("${ANNOUNCEMENT_CATEGORY_ID}")
	private Long ANNOUNCEMENT_CATEGORY_ID;
	
	@RequestMapping("/announcement/list")
	public String showAnnouncement(QueryVO queryVO, Model model){
		queryVO.setCategoryId(ANNOUNCEMENT_CATEGORY_ID);
		PageBean<TContent> pageBean = contentManagerService.listContentByQueryVO(queryVO);
		model.addAttribute("pageBean", pageBean);
		return "announcement";
	}
	
	@RequestMapping("/announcement/announcementDetails")
	public String showAnnouncementDetails(Long id, Model model){
		TContent content = contentManagerService.getContentById(id);
		model.addAttribute("content", content);
		return "news-details";
	}
}
