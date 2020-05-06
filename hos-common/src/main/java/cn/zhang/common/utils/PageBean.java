package cn.zhang.common.utils;

import java.io.Serializable;
import java.util.List;

public class PageBean<T> implements Serializable{
	
	// 当前页
	private Integer currentPage;
	// 总页数 
	private Integer totalPage;
	// 每页显示的条数
	private Integer pageSize;
	// 总记录数
	private Long totalCount;
	// 当前页的记录集合
	private List<T> list;
	
	public PageBean(){}
	
	public PageBean(Integer currentPage, Integer pageSize) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
	}

	public Long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}
	
	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}
	
	
}
