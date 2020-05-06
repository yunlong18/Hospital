package cn.zhang.controller;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TFeedback;
import cn.zhang.service.FeedManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FeedManagerController {

    @Autowired
    private FeedManagerService feedManagerService;

    @RequestMapping("/feedbackManager/list")
    public String showFeedbackList(QueryVO queryVO, Model model){

        PageBean<TFeedback> pageBean = feedManagerService.getPageBean(queryVO);
        model.addAttribute("pageBean", pageBean);
        return "admin/feedback-list";
    }

    @RequestMapping("/feedbackManager/deleteFeedbacks")
    @ResponseBody
    public E3Result deleteFeedbackByIds(String ids){
        E3Result e3Result = feedManagerService.deleteFeedbackByIds(ids);
        return E3Result.ok();
    }

    @RequestMapping("/feedbackManager/deleteFeedback")
    @ResponseBody
    public E3Result deleteFeedbackById(Long id){
        return feedManagerService.deleteFeedbackById(id);
    }
}
