package com.situ.mall.vo;

import java.io.Serializable;

public class SelectCondition implements Serializable {

	private Integer pageSize;
	private Integer pageIndex;
	private Integer status;
	private String name;
	
	  public SelectCondition() {
		// TODO Auto-generated constructor stub
	}
	

	
	public Integer getStatus() {
		return status;
	}



	public void setStatus(Integer status) {
		this.status = status;
	}



	public Integer getPageSize() {
		return pageSize;
	}


	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}


	public Integer getPageIndex() {
		return pageIndex;
	}


	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	


}
