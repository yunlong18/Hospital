package cn.zhang.service;

import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.TDoctor;

public interface DoctorService {

	PageBean<TDoctor> getPageBeanByDepartmentId(Integer id, Integer currentPage, Integer pageSize);
}
