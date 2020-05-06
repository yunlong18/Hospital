package cn.zhang.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.zhang.common.utils.E3Result;
import cn.zhang.pojo.TDoctor;
import cn.zhang.pojo.TDoctorDesc;
import cn.zhang.service.DoctorManagerService;
import cn.zhang.service.DoctorSelfService;

@Controller
public class DoctorSelfController {

    @Autowired
    private DoctorSelfService doctorSelfService;
    @Autowired
    private DoctorManagerService doctorManagerService;
    @Value("${PICTURE_RELATIVE_PATH}")
    public String PICTURE_RELATIVE_PATH;

    @RequestMapping("/doctorSelf/login")
    public String login(String userName, String userPassword, HttpServletRequest request){
        E3Result e3Result = doctorSelfService.login(userName, userPassword);
        if(e3Result.getStatus() != 200){
            request.setAttribute("error", e3Result.getMsg());
            request.setAttribute("userName", userName);
            request.setAttribute("userPassword", userPassword);
            return "doctor/login";
        }
        request.getSession().setAttribute("doctorUser", e3Result.getData());
        return "redirect:/doctor/index.html";
    }

    @RequestMapping("/doctorSelf/logout")
    public String logout(String userName, String userPassword, HttpServletRequest request){
        request.getSession().removeAttribute("doctorUser");
        return "redirect:/doctor/login.html";
    }

    @RequestMapping("/doctorSelf/changePassword")
    public String changePassword(String oldPassword, String newPassword, HttpServletRequest request){
        TDoctor doctor = (TDoctor) request.getSession().getAttribute("doctorUser");
        E3Result e3Result = doctorSelfService.changePassword(doctor, oldPassword, newPassword);
        if(e3Result.getStatus() != 200){
            request.setAttribute("error", e3Result.getMsg());
            return "doctor/changePassword";
        }
        request.getSession().removeAttribute("doctorUser");
        return "redirect:/doctor/login.html";
    }

    @RequestMapping("/doctorSelf/toEdit")
    public String toEdit(Long doctorId, Model model){

        TDoctor doctor = doctorManagerService.getDoctorById(doctorId);
        model.addAttribute("doctor", doctor);
        return "/doctor/self-manager";
    }
    
    @RequestMapping("/doctorSelf/saveDoctor")
    public String saveDoctor(MultipartFile upload, TDoctor doctor, TDoctorDesc doctorDesc,
                                HttpServletRequest request) throws IOException {
        
        // 获取文件名
        String fileName = upload.getOriginalFilename();
        // 判断是否上传文件
        if(StringUtils.isNotBlank(fileName)){
            // 获取请求url
            StringBuffer requestURL = request.getRequestURL();
            // 获取协议头
            String protocol = requestURL.substring(0, 7);
            // 获取整个路径并切割出域名
            String realPath = requestURL.substring(7).split("/")[0] + PICTURE_RELATIVE_PATH;
            // 获取文件存放的地址
            String path = request.getSession().getServletContext().getRealPath(PICTURE_RELATIVE_PATH);
            // 创建文件对象，并判断路径是否存在，不存在创建。
            File file = new File(path);
            if(!file.exists()){
                file.mkdirs();
            }
            // 生成一个唯一的名称
            fileName = UUID.randomUUID().toString().replace("-", "") + fileName;
            File file2 = new File(path, fileName);
            upload.transferTo(file2);
            doctor.setImage(realPath + fileName);
        }
        doctorManagerService.saveDoctor(doctor, doctorDesc);
        return "redirect:/doctor/index.html";
    }
}
