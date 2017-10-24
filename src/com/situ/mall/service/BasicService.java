package com.situ.mall.service;

import java.util.List;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.pojo.User;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SelectCondition;

public interface BasicService<T> {

	
	PageBean<T> pagelist(int pageindex, int pageSize);
	
	List<T> seleteAll();

	T selectByName(String name);
	
	ServerResponse  insert(T t);
	
	PageBean<T> seleteBycondition(Integer pageindex, Integer pageSize,String name);

	 T getById(int id);
	
	 void update(T t);
	
	 void deleteAll(String[] idArray);
	
	 void delete(int id);
	




	
}
