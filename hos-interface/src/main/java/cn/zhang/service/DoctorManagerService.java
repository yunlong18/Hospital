package cn.zhang.service;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TDoctor;
import cn.zhang.pojo.TDoctorDesc;

import java.util.List;


public interface DoctorManagerService {

	// 获取医生列表
	PageBean<TDoctor> getList(QueryVO queryVo);
	
	// 添加医生信息
	void saveDoctor(TDoctor doctor, TDoctorDesc doctorDesc);
	
	TDoctor getDoctorById(Long doctorId);

	E3Result getDoctorDescById(Long doctorId);
	
	E3Result deleteDoctorByIds(String ids);

	List<TDoctor> listDoctorByDepId(Integer depId);
	
}
