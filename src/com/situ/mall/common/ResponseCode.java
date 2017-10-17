package com.situ.mall.common;

public enum ResponseCode {

	SUCCESS(0,"SUCCESS"),
	ERROR(1,"ERROR"),
	NEED_LOGIN(2,"NEED_LOGIN");
	
	
	private int code;
	private String desc;
	private ResponseCode(int cod,String desc) {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getCode() {
		return code;
	}

	public String getDesc() {
		return desc;
	}

	
	
}
