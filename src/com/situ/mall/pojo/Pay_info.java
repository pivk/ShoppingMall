package com.situ.mall.pojo;

import java.util.Date;

public class Pay_info {
 private int id;
 private int user_id;
 private long order_no;
 private int pay_platform;
 private String platform_number;
 private String platform_status;
 private Date create_time;
 private Date update_time;
 private User user;
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
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
public int getPay_platform() {
	return pay_platform;
}
public void setPay_platform(int pay_platform) {
	this.pay_platform = pay_platform;
}
public String getPlatform_number() {
	return platform_number;
}
public void setPlatform_number(String platform_number) {
	this.platform_number = platform_number;
}
public String getPlatform_status() {
	return platform_status;
}
public void setPlatform_status(String platform_status) {
	this.platform_status = platform_status;
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
