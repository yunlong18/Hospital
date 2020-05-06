package cn.zhang.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.mapper.TDoctorDescMapper;
import cn.zhang.mapper.TDoctorMapper;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TDoctor;
import cn.zhang.pojo.TDoctorDesc;
import cn.zhang.pojo.TDoctorDescExample;
import cn.zhang.pojo.TDoctorExample;
import cn.zhang.pojo.TDoctorExample.Criteria;
import cn.zhang.service.DoctorManagerService;
import org.springframework.util.DigestUtils;

@Service
public class DoctorManagerServiceImpl implements DoctorManagerService {

	@Autowired
	private TDoctorMapper tDoctorMapper;
	@Autowired
	private TDoctorDescMapper tDoctorDescMapper;
	
	@Override
	public PageBean<TDoctor> getList(QueryVO queryVO) {
		TDoctorExample example = new TDoctorExample();
		Criteria criteria = example.createCriteria();
		if(queryVO != null){
			if(queryVO.getPageSize() == null || "".equals(queryVO.getPageSize())){
				queryVO.setPageSize(10);
			}
			if(queryVO.getCurrentPage() == null || "".equals(queryVO.getCurrentPage())){
				queryVO.setCurrentPage(1);
			}
			if(queryVO.getDoctorRealName() != null && StringUtils.isNotBlank(queryVO.getDoctorRealName())){
				criteria.andDoctorRealnameEqualTo(queryVO.getDoctorRealName());
			}
			if(queryVO.getDepId() != null){
				criteria.andDepIdEqualTo(queryVO.getDepId());
			}
			PageBean<TDoctor> pageBean = new PageBean<>(queryVO.getCurrentPage(), queryVO.getPageSize());
			PageHelper pageHelper = new PageHelper();
			pageHelper.startPage(queryVO.getCurrentPage(), queryVO.getPageSize());
			List<TDoctor> list = tDoctorMapper.selectByExample(example);
			pageBean.setList(list);
			
			PageInfo<TDoctor> pageInfo = new PageInfo<>(list);
			long totalCount = pageInfo.getTotal();
			pageBean.setTotalCount(totalCount);

			Integer totalPage = (int) Math.ceil(1.0 * totalCount / queryVO.getPageSize());
			pageBean.setTotalPage(totalPage);
			return pageBean;
		}else {
			PageBean<TDoctor> pageBean = new PageBean<>(1,10);
			PageHelper pageHelper = new PageHelper();
			pageHelper.startPage(1, 10);
			List<TDoctor> list = tDoctorMapper.selectByExample(example);
			pageBean.setList(list);
			PageInfo<TDoctor> pageInfo = new PageInfo<>(list);
			pageBean.setTotalCount(pageInfo.getTotal());
			pageBean.setTotalPage((int) Math.ceil(1.0 * pageInfo.getTotal() / pageBean.getPageSize()));
			return pageBean;
		}
	}

	@Override
	public void saveDoctor(TDoctor doctor, TDoctorDesc doctorDesc) {
		// 判断是否存在主键id
		if(doctor.getId() != null){
			// 存在，则是修改数据
			if(StringUtils.isNotBlank(doctor.getUserPassword()))
				doctor.setUserPassword(DigestUtils.md5DigestAsHex(doctor.getUserPassword().getBytes()));
			tDoctorMapper.updateByPrimaryKeySelective(doctor);
			TDoctorDesc desc = tDoctorDescMapper.selectByPrimaryKey(doctor.getId());
			desc.setDoctorDetails(doctorDesc.getDoctorDetails());
			desc.setUpdateDate(new Date());
			tDoctorDescMapper.updateByPrimaryKeySelective(desc);
			return ;
		}
		
		// 不存在则是添加记录,生成主键id
		Long id = System.currentTimeMillis() + RandomUtils.nextLong(0, 1000);
		doctor.setId(id);
		doctor.setUserPassword(DigestUtils.md5DigestAsHex(doctor.getUserPassword().getBytes()));
		tDoctorMapper.insert(doctor);
		// 补全信息
		doctorDesc.setDoctorId(id);
		doctorDesc.setCreateDate(new Date());
		doctorDesc.setUpdateDate(new Date());
		tDoctorDescMapper.insert(doctorDesc);
	}

	@Override
	public TDoctor getDoctorById(Long doctorId) {
		TDoctorExample example = new TDoctorExample();
		example.createCriteria().andIdEqualTo(doctorId);
		List<TDoctor> list = tDoctorMapper.selectByExampleWithBLOBs(example);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public E3Result getDoctorDescById(Long doctorId) {
		TDoctorDescExample example = new TDoctorDescExample();
		example.createCriteria().andDoctorIdEqualTo(doctorId);
		List<TDoctorDesc> list = tDoctorDescMapper.selectByExampleWithBLOBs(example);
		if(list != null && list.size() > 0){
			return E3Result.ok(list.get(0).getDoctorDetails());
		}
		return E3Result.ok();
	}

	@Override
	public E3Result deleteDoctorByIds(String ids) {
		String[] doctorIds = ids.split(",");
		for (String id : doctorIds) {
			tDoctorMapper.deleteByPrimaryKey(Long.valueOf(id));
		}
		return E3Result.ok();
	}

	@Override
	public List<TDoctor> listDoctorByDepId(Integer depId) {
		TDoctorExample example = new TDoctorExample();
		example.createCriteria().andDepIdEqualTo(depId);
		PageHelper pageHelper = new PageHelper();
		pageHelper.startPage(1, 5);
		List<TDoctor> doctors = tDoctorMapper.selectByExample(example);
		return doctors;
	}

}
