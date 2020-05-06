package cn.zhang.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TDoctor;
import cn.zhang.pojo.TDoctorDesc;
import cn.zhang.service.DoctorManagerService;

@Controller
public class DoctorMangeController {

	@Autowired
	private DoctorManagerService doctorservice;
	@Value("${PICTURE_RELATIVE_PATH}")
	private String PICTURE_RELATIVE_PATH;
	
	@RequestMapping("/doctor/list")
	public String getList(Model model, QueryVO queryVo){
		
		PageBean<TDoctor> pageBean = doctorservice.getList(queryVo);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("doctorRealName", queryVo.getDoctorRealName());
		return "admin/doctor-list";
	}

	@RequestMapping("/doctor/list1")
	public String getList1(Model model, QueryVO queryVo){

		PageBean<TDoctor> pageBean = doctorservice.getList(queryVo);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("doctorRealName", queryVo.getDoctorRealName());
		return "admin/doctor-list1";
	}
	
	@RequestMapping(value="/doctor/saveDoctor", method=RequestMethod.POST)
	public String saveDoctor(MultipartFile upload, TDoctor doctor, TDoctorDesc doctorDesc, HttpServletRequest request, 
								HttpServletResponse response) throws IllegalStateException, IOException{

		if(!upload.isEmpty()){
			// 获取保存到数据库中的文件地址
			StringBuffer requestURL = request.getRequestURL();
			String protocol = requestURL.substring(0, 7);
			String realPath = protocol + requestURL.substring(7).split("/")[0] + PICTURE_RELATIVE_PATH;
			// 获取文件存储的绝对路径
			String path = request.getSession().getServletContext().getRealPath(PICTURE_RELATIVE_PATH);
			File file = new File(path);
			if(!file.exists())
				file.mkdirs();
			
			// 获取原始文件名
			String fileName = upload.getOriginalFilename();
			// 为文件设置一个唯一的文件名
			fileName = UUID.randomUUID().toString().replace("-", "") + fileName;
			// 上传文件
			File file2 = new File(path, fileName);
			upload.transferTo(file2);
			doctor.setImage(realPath + fileName);
		}
		
		doctorservice.saveDoctor(doctor, doctorDesc);
		return "redirect:/doctor/list.html";
	}
	
	@RequestMapping("/doctor/toEdit")
	public String getDoctorById(Long doctorId, Model model){
		TDoctor doctor = doctorservice.getDoctorById(doctorId);
		model.addAttribute("doctor", doctor);
		return "admin/doctor-edit";
	}
	
	@RequestMapping("/doctor/doctorDesc")
	@ResponseBody
	public E3Result getDoctorDescById(Long doctorId){
		E3Result e3Result = doctorservice.getDoctorDescById(doctorId);
		return e3Result;
	}
	
	@RequestMapping("/doctor/deleteDoctor")
	@ResponseBody
	public E3Result deleteDoctorByIds(String ids){
		E3Result e3Result = doctorservice.deleteDoctorByIds(ids);
		return e3Result;
	}
	
	
}
