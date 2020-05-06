package cn.zhang.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.zhang.common.utils.PageBean;
import cn.zhang.mapper.TDoctorMapper;
import cn.zhang.pojo.TDoctor;
import cn.zhang.pojo.TDoctorExample;
import cn.zhang.service.DoctorService;

@Service
public class DoctorServiceImpl implements DoctorService {

	@Autowired
	private TDoctorMapper tDoctorMapper;
	
	@Override
	public PageBean<TDoctor> getPageBeanByDepartmentId(Integer id, Integer currentPage, Integer pageSize) {
		
		TDoctorExample example = new TDoctorExample();
		example.createCriteria().andDepIdEqualTo(id);
		
		PageBean<TDoctor> pageBean = new PageBean<>(currentPage, pageSize);
		PageHelper pageHelper = new PageHelper();
		pageHelper.startPage(currentPage, pageSize);
		List<TDoctor> list = tDoctorMapper.selectByExampleWithBLOBs(example);
		pageBean.setList(list);
		
		PageInfo<TDoctor> pageInfo = new PageInfo<>(list);
		pageBean.setTotalCount(pageInfo.getTotal());
		pageBean.setTotalPage((int) Math.ceil((1.0 * pageBean.getTotalCount())/pageBean.getPageSize()));
		return pageBean;
	}

}
