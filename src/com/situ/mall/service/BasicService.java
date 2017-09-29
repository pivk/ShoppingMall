package com.situ.mall.service;

import java.util.List;

import com.situ.mall.util.PageBean;

public interface BasicService<T> {

	
	PageBean<T> pagelist(int pageindex, int pageSize);
	
	List<T> seleteAll();

	public T selectByName(String name);
	
	public void insert(T t);
	
	public T getById(int id);
	
	public void update(T t);
	
	public void deleteAll(String[] idArray);
	
	public void delete(int id);
	
	public int getTotalCount();

	
}
