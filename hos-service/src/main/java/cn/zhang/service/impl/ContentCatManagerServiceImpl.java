package cn.zhang.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.zhang.common.pojo.TreeNode;
import cn.zhang.common.utils.E3Result;
import cn.zhang.mapper.TContentCategoryMapper;
import cn.zhang.mapper.TContentMapper;
import cn.zhang.pojo.TContent;
import cn.zhang.pojo.TContentCategory;
import cn.zhang.pojo.TContentCategoryExample;
import cn.zhang.pojo.TContentExample;
import cn.zhang.service.ContentCatManagerService;

@Service
public class ContentCatManagerServiceImpl implements ContentCatManagerService {

	@Autowired
	private TContentCategoryMapper tContentCategoryMapper;
	@Autowired
	private TContentMapper contentMapper;

	@Override
	public List<TreeNode> getNodeList() {
		
		TContentCategoryExample example = new TContentCategoryExample();
		List<TContentCategory> list = tContentCategoryMapper.selectByExample(example);
		List<TreeNode> nodeList = new ArrayList<>();
		// 封装数据格式
		if(list != null && list.size() > 0){
			for(TContentCategory contentCategory : list){
				TreeNode node = new TreeNode();
				node.setId(contentCategory.getId());
				node.setpId(contentCategory.getPid());
				node.setName(contentCategory.getName());
				node.setOpen(contentCategory.getIsParent() ? false : true);
				node.setParent(contentCategory.getIsParent() ? true : false);
				nodeList.add(node);
			}
		}
		
		return nodeList;
	}
	@Override
	public E3Result addNode(Long pId, String name) {
		
		// 判断当前节点的父节点是否为叶子节点，如果是，将其修改为非叶子节点
		TContentCategory parentContentCategory = tContentCategoryMapper.selectByPrimaryKey(pId);
		if(!parentContentCategory.getIsParent()){
			parentContentCategory.setIsParent(true);
			tContentCategoryMapper.updateByPrimaryKeySelective(parentContentCategory);
		}
		// 创建一个新的节点
		TContentCategory contentCategory = new TContentCategory();
		contentCategory.setPid(pId);
		contentCategory.setName(name);
		contentCategory.setIsParent(false);
		// 状态。可选值:1(正常),2(删除)
		contentCategory.setStatus(1);
		// 排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数
		contentCategory.setSortOrder(1);
		contentCategory.setCreated(new Date());
		contentCategory.setUpdated(new Date());
		
		tContentCategoryMapper.insert(contentCategory);
		return E3Result.ok(contentCategory);
	}
	@Override
	public E3Result editNode(Long id, String name) {
		
		TContentCategory contentCategory = new TContentCategory();
		contentCategory.setName(name);
		contentCategory.setId(id);
		tContentCategoryMapper.updateByPrimaryKeySelective(contentCategory);
		return E3Result.ok();
	}
	@Override
	public E3Result deleteNodeById(Long id) {

		TContentExample contentExample = new TContentExample();
		contentExample.createCriteria().andCategoryIdEqualTo(id);
		List<TContent> contentList = contentMapper.selectByExample(contentExample);
		// 判断该分类下面是否还存在内容
		if(contentList != null && contentList.size() > 0){
			return E3Result.build(400, "请先删除该分类的内容");
		}
		TContentCategoryExample example = new TContentCategoryExample();
		example.createCriteria().andPidEqualTo(id);
		List<TContentCategory> list2 = tContentCategoryMapper.selectByExample(example);
		if(list2 != null && list2.size() > 0){
			return E3Result.build(400, "请先删除子节点");
		}
		// 清空条件
		example.clear();
		// 获取当前节点的父节点，查看是否还存在子节点，如果不存在，将其修改为叶子节点
		TContentCategory node = tContentCategoryMapper.selectByPrimaryKey(id);
		example.createCriteria().andPidEqualTo(node.getPid());
		List<TContentCategory> list = tContentCategoryMapper.selectByExample(example);
		if(list == null || list.size() <= 1){
			TContentCategory parentNode = tContentCategoryMapper.selectByPrimaryKey(node.getPid());
			parentNode.setIsParent(false);
			tContentCategoryMapper.updateByPrimaryKeySelective(parentNode);
		}
		tContentCategoryMapper.deleteByPrimaryKey(id);
		
		return E3Result.ok();
	}

}
