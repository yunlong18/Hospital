package cn.zhang.service;

import java.util.List;

import cn.zhang.common.pojo.TreeNode;
import cn.zhang.common.utils.E3Result;

public interface ContentCatManagerService {

	List<TreeNode> getNodeList();
	// 添加节点
	E3Result addNode(Long pId, String name);
	E3Result editNode(Long id, String name);
	E3Result deleteNodeById(Long id);
}
