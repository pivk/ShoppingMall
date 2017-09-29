package com.situ.mall.service.impl;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.situ.mall.dao.BasicMapper;
import com.situ.mall.util.PageBean;

public class BasicServiceImpl<T> {

	private BasicMapper<T> getMapper() {
		try {
			Field f = getClass().getDeclaredField("mappper");
			f.setAccessible(true);
			return (BasicMapper<T>) f.get(this);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
	public PageBean<T> pagelist(int pageindex, int pageSize) {
		PageBean<T> pageBean = new PageBean<T>();
		// 当前是第几页
		// private Integer pageIndex;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pageindex", pageindex);
		map.put("pageSize", pageSize);
		pageBean.setPageIndex(pageindex);
		pageBean.setPageSize(pageSize);
		int totalCount = getMapper().getTotalCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize);
		pageBean.setTotalPage(totalPage);
		int index = (pageindex - 1) * pageSize;
		List<T> pageList = getMapper().pagelist(map);
		pageBean.setList(pageList);
		return pageBean;

	}

	public void insert(T t) {
		getMapper().insert(t);
	}
	

	public T getById(int id) {
		return getMapper().getById(id);
	}

	
	public void update(T t) {
		getMapper().update(t);
	}

	public void delete(int id) {
		getMapper().delete(id);
	}
	
	public void deleteAll(String[] idArray) {
		getMapper().deleteAll(idArray);
		
	}

	public T selectByName(String name) {
		return getMapper().selectByName(name);
	}
	
	
	public List<T> seleteAll() {
		return getMapper().seleteAll();
	}
	
	public int getTotalCount() {
		return getMapper().getTotalCount();	
	}
	
}
