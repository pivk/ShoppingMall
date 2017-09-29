package com.situ.mall.dao;

import java.util.List;
import java.util.Map;

public interface BasicMapper<T> {
	
	List<T> pagelist(Map<String, Integer> map);
	
	List<T> seleteAll();
	
	public T selectByName(String name);
	
	public void insert(T t);
	
	public T getById(int id);
	
	public void update(T t);
	
	public void deleteAll(String[] idArray);
	
	public void delete(int id);
	
	public int getTotalCount();
}
