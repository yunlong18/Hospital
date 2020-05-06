package cn.zhang.controller;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TOrder;
import cn.zhang.service.OrderManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DoctorOrderController {

    @Autowired
    private OrderManagerService orderManagerService;

    @RequestMapping("/doctorOrder/list")
    public String showOrderList(QueryVO queryVO, Model model){
        PageBean<TOrder> pageBean = orderManagerService.getPageBean(queryVO);
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("userTel", queryVO.getUserTel());
        model.addAttribute("is_history", queryVO.getIs_history());
        return "doctor/order";
    }

    @RequestMapping("/orderManager/updateState")
    public @ResponseBody
    E3Result updateState(Integer state, Long id) {
        return orderManagerService.updateState(state, id);
    }

    @RequestMapping("/orderManager/updateVisitState")
    public @ResponseBody
    E3Result updateVisitState(Integer visitState, Long id) {
        return orderManagerService.updateVisitState(visitState, id);
    }

    @RequestMapping("/orderManager/updateDoctorMessage")
    @ResponseBody
    public E3Result updateDoctorMessage(Long id, String doctorMessage){
        return orderManagerService.updateDoctorMessage(id, doctorMessage);
    }
}
