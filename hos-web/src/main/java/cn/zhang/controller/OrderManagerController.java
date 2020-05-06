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
public class OrderManagerController {

    @Autowired
    private OrderManagerService orderManagerService;

    @RequestMapping("/orderManager/list")
    public String showOrderList(QueryVO queryVO, Model model){
        PageBean<TOrder> pageBean = orderManagerService.getPageBean(queryVO);
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("doctorRealname", queryVO.getDoctorRealName());
        model.addAttribute("is_history", queryVO.getIs_history());
        return "admin/order-list";
    }

    @RequestMapping("/orderManager/toEdit")
    public String editOrder(Model model, Long id) {

        TOrder order = orderManagerService.getOrderById(id);
        model.addAttribute("order", order);
        return "admin/order-edit";
    }

    @RequestMapping("/orderManager/saveOrder")
    public String saveOrder(TOrder order) {
        orderManagerService.saveOrder(order);
        return "redirect:/orderManager/list.html?is_history=" + order.getHistoryState();
    }

    @RequestMapping("/orderManager/deleteOrders")
    public @ResponseBody
    E3Result deleteOrderByIds(String ids) {
        return orderManagerService.deleteOrderByIds(ids);
    }

}
