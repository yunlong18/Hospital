package cn.zhang.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.zhang.common.utils.E3Result;
import cn.zhang.common.utils.PageBean;
import cn.zhang.mapper.TContentCategoryMapper;
import cn.zhang.mapper.TContentMapper;
import cn.zhang.pojo.QueryVO;
import cn.zhang.pojo.TContent;
import cn.zhang.pojo.TContentCategory;
import cn.zhang.pojo.TContentExample;
import cn.zhang.pojo.TContentExample.Criteria;
import cn.zhang.service.ContentManagerService;

@Service
public class ContentManagerServiceImpl implements ContentManagerService {
	
	@Autowired
	private TContentCategoryMapper contentCategoryMapper;
	@Autowired
	private TContentMapper contentMapper;

	@Override
	public PageBean<TContent> listContentByQueryVO(QueryVO queryVo) {
		
		TContentExample example = new TContentExample();
		Criteria criteria = example.createCriteria();
		example.setOrderByClause("sort_order desc");
		if(queryVo != null){
			if(queryVo.getCurrentPage() == null){
				queryVo.setCurrentPage(1);
			}
			if(queryVo.getPageSize() == null){
				queryVo.setPageSize(10);
			}
			if(queryVo.getCategoryId() != null){
				// 判断当前分类是否为父节点，如果是，则没有任何内容
				TContentCategory contentCategory = contentCategoryMapper.selectByPrimaryKey(queryVo.getCategoryId());
				if(contentCategory.getIsParent()){
					return null;
				}
				criteria.andCategoryIdEqualTo(queryVo.getCategoryId());
			}
			
			PageBean<TContent> pageBean = new PageBean<>(queryVo.getCurrentPage(), queryVo.getPageSize());
			PageHelper pageHelper = new PageHelper();
			pageHelper.startPage(queryVo.getCurrentPage(), queryVo.getPageSize());
			List<TContent> contentList = contentMapper.selectByExampleWithBLOBs(example);
			pageBean.setList(contentList);
			PageInfo<TContent> pageInfo = new PageInfo<>(contentList);
			pageBean.setTotalCount(pageInfo.getTotal());
			pageBean.setTotalPage((int) Math.ceil((1.0 * pageBean.getTotalCount()) / pageBean.getPageSize()));
			return pageBean;
		}else {
			PageBean<TContent> pageBean = new PageBean<>(1,10);
			PageHelper pageHelper = new PageHelper();
			pageHelper.startPage(1, 10);
			List<TContent> list = contentMapper.selectByExample(example);
			pageBean.setList(list);
			PageInfo<TContent> pageInfo = new PageInfo<>(list);
			pageBean.setTotalCount(pageInfo.getTotal());
			pageBean.setTotalPage((int) Math.ceil(1.0 * pageInfo.getTotal() / pageBean.getPageSize()));
			return pageBean;
		}
	}

	@Override
	public E3Result saveContent(TContent content) {
		
		//判断当前操作是保存还是修改
		if(content.getId() != null){
			// 修改操作
			content.setUpdated(new Date());
			contentMapper.updateByPrimaryKeySelective(content);
			return E3Result.ok();
		}
		// 补全content内容
		content.setCreated(new Date());
		content.setUpdated(new Date());
		contentMapper.insertSelective(content);
		
		return E3Result.ok();
	}

	@Override
	public TContent getContentById(Long id) {
		TContent content = contentMapper.selectByPrimaryKey(id);
		return content;
	}

	@Override
	public E3Result deleteContentByIds(String ids) {
		if(StringUtils.isNotBlank(ids)){
			String[] contentIds = ids.split(",");
			for (String id : contentIds) {
				contentMapper.deleteByPrimaryKey(Long.valueOf(id));
			}
			return E3Result.ok();
		}
		return E3Result.build(400, "参数有误");
	}

	@Override
	public List<TContent> listContentByCategoryId(Long id) {
		
		TContentExample example = new TContentExample();
		example.createCriteria().andCategoryIdEqualTo(id);
		List<TContent> list = contentMapper.selectByExample(example);
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

}
