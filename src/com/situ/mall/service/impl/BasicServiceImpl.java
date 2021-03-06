package com.situ.mall.service.impl;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.dao.BasicMapper;
import com.situ.mall.dao.ProductTypeMapper;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SelectCondition;

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
		//当前是第几页
		//private Integer pageIndex;
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
        List<T> pageList=getMapper().pagelist(map);
        pageBean.setList(pageList);
	   return  pageBean;
	}
	public PageBean<T> seleteBycondition(Integer pageindex, Integer pageSize,String name) {
		
		PageBean<T> pageBean = new PageBean<T>();
		// 当前是第几页
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageIndex", pageindex);
		map.put("pageSize", pageSize);
		map.put("name", name);
		int totalCount = getMapper().getTotalCount1(map);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount /pageSize); 
		pageBean.setTotalPage(totalPage);
 		List<T> list = getMapper().seleteBycondition(map);
		pageBean.setList(list);
		return pageBean;
		
	}

	public ServerResponse insert(T t) {
		getMapper().insert(t);
		 try {
			int row=getMapper().insert(t);
			
			if(row>0){
				return ServerResponse.createSuccess("添加商品成功");
			}
			else {
				return ServerResponse.createError("添加失败");
			}
		} catch (Exception e) {
			return ServerResponse.createError("添加失败");
		}
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
