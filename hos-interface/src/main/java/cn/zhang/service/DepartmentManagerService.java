package cn.zhang.service;

import java.util.List;

import cn.zhang.common.pojo.TreeNode;
import cn.zhang.common.utils.E3Result;
import cn.zhang.pojo.TDepartment;

public interface DepartmentManagerService {

	List<TreeNode> getNodeList();
	
	E3Result editNode(Long id, String name);
	
	E3Result addNode(Long pId, String name);
	
	E3Result deleteNodeById(Integer id);
	
	TDepartment getDepartmentById(Integer id);
	
	TDepartment saveDepartment(TDepartment department);
	
	List<TDepartment> listParentDeparment();
	
	List<TDepartment> listDepartmentByPid(Integer id);
}
