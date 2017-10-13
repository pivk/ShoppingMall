package com.situ.mall.pojo;

import java.util.Date;

public class Order_item {
 private int id;
 private int user_id;
 private long order_no;
 private int product_id;
 private int quantity;
 private String product_name;
 private String product_image;
 private double current_unit_price; 
 private double total_price;
 private Date create_time;
  private Date update_time;
  private User user;
  private Product product;
  
  public Order_item() {
	// TODO Auto-generated constructor stub
}
  
  
  
public String getProduct_name() {
	return product_name;
}



public void setProduct_name(String product_name) {
	this.product_name = product_name;
}



public String getProduct_image() {
	return product_image;
}



public void setProduct_image(String product_image) {
	this.product_image = product_image;
}



public double getCurrent_unit_price() {
	return current_unit_price;
}


public void setCurrent_unit_price(double current_unit_price) {
	this.current_unit_price = current_unit_price;
}



public User getUser() {
	return user;
}

public void setUser(User user) {
	this.user = user;
}

public Product getProduct() {
	return product;
}

public void setProduct(Product product) {
	this.product = product;
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public long getOrder_no() {
	return order_no;
}
public void setOrder_no(long order_no) {
	this.order_no = order_no;
}
public int getProduct_id() {
	return product_id;
}
public void setProduct_id(int product_id) {
	this.product_id = product_id;
}

public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public double getTotal_price() {
	return total_price;
}
public void setTotal_price(double total_price) {
	this.total_price = total_price;
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



  
}
