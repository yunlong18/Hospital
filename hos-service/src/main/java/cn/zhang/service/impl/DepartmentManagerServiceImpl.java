package cn.zhang.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zhang.common.pojo.TreeNode;
import cn.zhang.common.utils.E3Result;
import cn.zhang.mapper.TDepartmentMapper;
import cn.zhang.pojo.TDepartment;
import cn.zhang.pojo.TDepartmentExample;
import cn.zhang.pojo.TDepartmentExample.Criteria;
import cn.zhang.service.DepartmentManagerService;

@Service
public class DepartmentManagerServiceImpl implements DepartmentManagerService {
	
	@Autowired
	private TDepartmentMapper tDepartmentMapper;

	@Override
	public List<TreeNode> getNodeList() {
		
		TDepartmentExample example = new TDepartmentExample();
		List<TDepartment> list = tDepartmentMapper.selectByExample(example);
		
		List<TreeNode> nodeList = new ArrayList<>();
		if(list != null & list.size() > 0){
			for (TDepartment department : list) {
				
				TreeNode node = new TreeNode();
				node.setId(department.getId().longValue());
				node.setpId(department.getPid().longValue());
				node.setName(department.getDepName());
				node.setOpen(department.getIsParent() ? false : true);
				node.setParent(department.getIsParent() ? true : false);
				nodeList.add(node);
			}
		}
		
		return nodeList;
	}

	@Override
	public E3Result editNode(Long id, String name) {
		TDepartment tDepartment = new TDepartment();
		tDepartment.setDepName(name);
		tDepartment.setId(id.intValue());
		tDepartmentMapper.updateByPrimaryKeySelective(tDepartment);
		return E3Result.ok();
	}

	@Override
	public E3Result addNode(Long pId, String name) {
		
		// 判断当前节点的父类是否为叶子节点，如果是将其修改为父类节点
		TDepartment parentDepartment = tDepartmentMapper.selectByPrimaryKey(pId.intValue());
		if(!parentDepartment.getIsParent()){
			parentDepartment.setIsParent(true);
			tDepartmentMapper.updateByPrimaryKey(parentDepartment);
		}
		TDepartment tDepartment = new TDepartment();
		tDepartment.setPid(pId.intValue());
		tDepartment.setDepName(name);
		tDepartment.setIsParent(false);
		tDepartmentMapper.insert(tDepartment);
		return E3Result.ok(tDepartment);
	}
	
	@Override
	public E3Result deleteNodeById(Integer id) {
		
		TDepartmentExample example = new TDepartmentExample();
		example.createCriteria().andPidEqualTo(id);
		List<TDepartment> list2 = tDepartmentMapper.selectByExample(example);
		if(list2 != null && list2.size() > 0){
			return E3Result.build(400, "请先删除子分类");
		}
		// 获取当前节点的父节点，查看是否还存在子节点，如果不存在，将其修改为叶子节点
		TDepartment node = tDepartmentMapper.selectByPrimaryKey(id);
		example.createCriteria().andPidEqualTo(node.getPid());
		List<TDepartment> list = tDepartmentMapper.selectByExample(example);
		if(list == null || list.size() <= 1){
			TDepartment parentNode = tDepartmentMapper.selectByPrimaryKey(node.getPid());
			parentNode.setIsParent(false);
			tDepartmentMapper.updateByPrimaryKeySelective(parentNode);
		}
		tDepartmentMapper.deleteByPrimaryKey(id);
		
		return E3Result.ok();
	}

	@Override
	public TDepartment getDepartmentById(Integer id) {
		TDepartment department = tDepartmentMapper.selectByPrimaryKey(id);
		return department;
	}

	@Override
	public TDepartment saveDepartment(TDepartment department) {
		tDepartmentMapper.updateByPrimaryKeySelective(department);
		TDepartment department1 = tDepartmentMapper.selectByPrimaryKey(department.getId());
		return department1;
	}

	@Override
	public List<TDepartment> listParentDeparment() {
		TDepartmentExample example = new TDepartmentExample();
		Criteria criteria = example.createCriteria();
		criteria.andPidNotEqualTo(0);
		criteria.andIsParentEqualTo(true);
		List<TDepartment> list = tDepartmentMapper.selectByExampleWithBLOBs(example);
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	@Override
	public List<TDepartment> listDepartmentByPid(Integer id) {
		
		TDepartmentExample example = new TDepartmentExample();
		Criteria criteria = example.createCriteria();
		criteria.andPidEqualTo(id);
		
		List<TDepartment> list = tDepartmentMapper.selectByExampleWithBLOBs(example);
		if(list != null && list.size() > 0)
			return list;
		return null;
	}
	
	
}
