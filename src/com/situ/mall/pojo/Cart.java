package com.situ.mall.pojo;

import java.util.Date;

public class Cart {
  private  int id;
  private int user_id;
  private int quantity;
  private int checked;
  private int product_id;
  private Date create_time;
  private  Date update_time;
  private User user;
  private Product product;
  
  public Cart() {
	// TODO Auto-generated constructor stub
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
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getChecked() {
	return checked;
}
public void setChecked(int checked) {
	this.checked = checked;
}
public int getProduct_id() {
	return product_id;
}
public void setProduct_id(int product_id) {
	this.product_id = product_id;
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
