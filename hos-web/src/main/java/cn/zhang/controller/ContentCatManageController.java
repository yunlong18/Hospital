package cn.zhang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zhang.common.pojo.TreeNode;
import cn.zhang.common.utils.E3Result;
import cn.zhang.service.ContentCatManagerService;

@Controller
public class ContentCatManageController {

	@Autowired 
	private ContentCatManagerService contentCatService;
	
	@RequestMapping("/contentCat/list")
	@ResponseBody
	public List<TreeNode> getNodeList(){
		List<TreeNode> nodeList = contentCatService.getNodeList();
		return nodeList;
	}
	
	@RequestMapping("/contentCat/addNode")
	@ResponseBody
	public E3Result addNode(Long pId, String name){
		E3Result e3Result = contentCatService.addNode(pId, name);
		return e3Result;
	}
	
	@RequestMapping("/contentCat/editNode")
	@ResponseBody
	public E3Result editNode(Long id,String name){
		E3Result e3Result = contentCatService.editNode(id, name);
		return e3Result;
	}
	
	@RequestMapping("/contentCat/deleteNodeById")
	@ResponseBody
	public E3Result deleteNodeById(Long id){
		E3Result e3Result = contentCatService.deleteNodeById(id);
		return e3Result;
	}
}
