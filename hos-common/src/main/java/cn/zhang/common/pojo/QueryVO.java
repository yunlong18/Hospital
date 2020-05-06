package cn.zhang.common.pojo;

import java.io.Serializable;

/**
 * 对查询条件进行封装
 * */
public class QueryVO implements Serializable{

	private Integer pageSize;
	private Integer currentPage;
	
	private String userTel;
	private String doctorRealName;
	private Long categoryId;
	private Long doctorId;
	private Integer depId;
	private Boolean is_history;
	
	public Integer getStartIndex(){
		return (currentPage - 1) * pageSize;
	}

	public Boolean getIs_history() {
		return is_history;
	}

	public void setIs_history(Boolean is_history) {
		this.is_history = is_history;
	}

	public Integer getDepId() {
		return depId;
	}

	public void setDepId(Integer depId) {
		this.depId = depId;
	}

	public Long getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Long doctorId) {
		this.doctorId = doctorId;
	}

	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public String getDoctorRealName() {
		return doctorRealName;
	}
	public void setDoctorRealName(String doctorRealName) {
		this.doctorRealName = doctorRealName;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	
}
