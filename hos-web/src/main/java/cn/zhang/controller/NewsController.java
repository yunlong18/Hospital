package cn.zhang.controller;

import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TContent;
import cn.zhang.service.ContentManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NewsController {

    @Autowired
    private ContentManagerService contentManagerService;
    @Value("${PROTAL_LUNBO_NEWS_ID}")
    private Long PROTAL_LUNBO_NEWS_ID;
    @Value("${NEWS_LIST_ID}")
    private Long NEWS_LIST_ID;


    @RequestMapping("/news/newsDetails")
    public String showNewDetails(Long id, Model model){
        TContent content = contentManagerService.getContentById(id);
        model.addAttribute("content",  content);
        return "news-details";
    }

    @RequestMapping("/news/newCenter")
    public String showNewsCenter(QueryVO queryVO, Model model){
        queryVO.setCategoryId(NEWS_LIST_ID);
        queryVO.setPageSize(9);
        PageBean<TContent> pageBean = contentManagerService.listContentByQueryVO(queryVO);
        model.addAttribute("pageBean", pageBean);
        return "news-center";
    }


}
