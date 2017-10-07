package com.situ.mall.pojo;

import java.util.Date;

import com.situ.mall.util.Values;

public class ProductType {

	private Integer id;
	private Integer parent_id;
	private String name;
	private String status_name;
	private int status;
	private Date create_time;
	private Date update_time;
	private ProductType productType;
	public ProductType() {

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}


	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	public ProductType getProductType() {
		return productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParent_id() {
		return parent_id;
	}

	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}

	@Override
	public String toString() {
		return "ProductType [id=" + id + ", parent_id=" + parent_id + ", name=" + name + ", status=" + status
				+ ", create_time=" + create_time + ", update_time=" + update_time + ", productType=" + productType
				+ "]";
	}



	public String getStatus_name() {
		return  Values.statusa[status];	
		}

}