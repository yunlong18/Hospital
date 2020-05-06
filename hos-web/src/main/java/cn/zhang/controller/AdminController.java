package cn.zhang.controller;

import cn.zhang.common.utils.E3Result;
import cn.zhang.pojo.TAdmin;
import cn.zhang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/adminSelf/login")
    public String login(String userName, String userPassword, HttpServletRequest request){
        E3Result e3Result = adminService.login(userName, userPassword);
        if(e3Result.getStatus() != 200){
            request.setAttribute("userName",userName);
            request.setAttribute("userPassword",userPassword);
            request.setAttribute("error",e3Result.getMsg());
            return "admin/login";
        }
        request.getSession().setAttribute("admin", e3Result.getData());
        return "redirect:/admin/index.html";
    }

    @RequestMapping("/adminSelf/logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("admin");
        return "redirect:/admin/login.html";
    }

    @RequestMapping("/adminSelf/changePassword")
    public String changePassword(String oldPassword, String newPassword, HttpServletRequest request){
        TAdmin admin = (TAdmin) request.getSession().getAttribute("admin");
        E3Result e3Result = adminService.changePassword(admin, oldPassword, newPassword);
        if(e3Result.getStatus() != 200){
            request.setAttribute("error", e3Result.getMsg());
            return "admin/changePassword";
        }
        request.getSession().removeAttribute("admin");
        return "redirect:/admin/login.html";
    }


}
