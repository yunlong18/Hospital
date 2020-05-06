package cn.zhang.service;

import java.util.List;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TContent;
public interface ContentManagerService {

	PageBean<TContent> listContentByQueryVO(QueryVO queryVo);
	
	E3Result saveContent(TContent content);
	
	TContent getContentById(Long id);
	
	E3Result deleteContentByIds(String ids);
	
	List<TContent> listContentByCategoryId(Long id);
}
