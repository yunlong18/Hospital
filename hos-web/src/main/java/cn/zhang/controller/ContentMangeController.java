package cn.zhang.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TContent;
import cn.zhang.service.ContentManagerService;

@Controller
public class ContentMangeController {

	@Autowired
	private ContentManagerService contentService;

	@RequestMapping("/content/getContentList")
	public String getContentList(QueryVO queryVo, Model model) {

		PageBean<TContent> pageBean = contentService.listContentByQueryVO(queryVo);
		if (pageBean != null) {
			model.addAttribute("pageBean", pageBean);
			model.addAttribute("categoryId", queryVo.getCategoryId());
			return "admin/content-list";
		}
		return null;
	}

	@RequestMapping("/content/addContent")
	public String addContent(MultipartFile upload, TContent content, HttpServletRequest request)
			throws IllegalStateException, IOException {

		String fileName = upload.getOriginalFilename();
		if (StringUtils.isNotBlank(fileName)) {
			// 获取服务器地址
			StringBuffer requestURL = request.getRequestURL();
			String protal = requestURL.substring(0, 7);
			String realPath = protal + requestURL.substring(7).split("/")[0] + "/upload/";

			// 获取绝对路径
			String path = request.getSession().getServletContext().getRealPath("/upload/");
			File file = new File(path);
			if (!file.exists())
				file.mkdirs();
			fileName = UUID.randomUUID().toString() + fileName;
			upload.transferTo(new File(path, fileName));
			content.setPic(realPath + fileName);
		}

		contentService.saveContent(content);
		return "redirect:/content/getContentList.html?categoryId=" + content.getCategoryId();
	}

	@RequestMapping("/content/toEdit")
	public String toEdit(Long id, Model model) {

		TContent content = contentService.getContentById(id);
		model.addAttribute("content", content);
		model.addAttribute("categoryId", content.getCategoryId());
		return "admin/content-edit";
	}
	
	@RequestMapping("/content/deleteContent")
	@ResponseBody
	public E3Result deleteContentByIds(String ids) {
		
		E3Result e3Result = contentService.deleteContentByIds(ids);
		return e3Result;
	}

}
