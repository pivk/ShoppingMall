package com.situ.mall.dao;

import java.util.List;
import java.util.Map;

import com.situ.mall.vo.SelectCondition;

public interface BasicMapper<T> {
	
	List<T> pagelist(Map<String, Integer> map);
	
	List<T> seleteAll();
	
	List<T> seleteBycondition(Map<String, Object> map);
	
	 T selectByName(String name);
	
	 int insert(T t);
	
	 T getById(int id);
	
	 void update(T t);
	
	 void deleteAll(String[] idArray);
	
	 void delete(int id);
	
	 int getTotalCount();
	
	 int getTotalCount1(Map<String, Object> map);
}
