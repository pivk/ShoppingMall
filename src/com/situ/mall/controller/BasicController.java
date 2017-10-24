package com.situ.mall.controller;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.service.BasicService;
import com.situ.mall.vo.PageBean;

public class BasicController<T> {

	private String getTypeName() {
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		Class cls = (Class) type.getActualTypeArguments()[0];
		return cls.getSimpleName();
	}

	private BasicService<T> getService() {
		try {
			Field f = getClass().getDeclaredField("service");
			f.setAccessible(true);
			return (BasicService<T>) f.get(this);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

   //修改中转
	@RequestMapping("/edit")
	public String edit(int id, ModelMap m, HttpServletRequest req) {
		m.put("info", getService().getById(id));
		return add(m, req);
	}
	
	//新增中转
	@RequestMapping("/add")
	public String add(ModelMap m, HttpServletRequest req) {
		return  getTypeName() + "/edit";
	}

	
	@RequestMapping("/delete")
	public String delete(int id, ModelMap m, HttpServletRequest req) {
		getService().delete(id);
		return "redirect:/" + getTypeName() + "/pagelist.action";
	}
    
	

	
	@RequestMapping("/pagelist")
	public String  pagelist(ModelMap m,String pageIndex, String pageSize, HttpServletRequest req,
			HttpServletResponse resp) {
		String PageIndexStr = pageIndex;
		String PageSizeStr = pageSize;
		int PageIndex;
		if (PageIndexStr != null && !PageIndexStr.equals("")) {
			PageIndex = Integer.parseInt(PageIndexStr);
		} else {
			PageIndex = 1;
		}
		int PageSize;
		if (PageSizeStr != null && !PageSizeStr.equals("")) {
			PageSize = Integer.parseInt(PageSizeStr);
		} else {
			PageSize = 6;
		}
		PageBean<T> pageBean = (PageBean<T>) getService().pagelist(PageIndex, PageSize);
		m.put("list", pageBean.getList());
		m.put("pageBean", pageBean);
		return  getTypeName() + "/index";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public ServerResponse<T>  insert(T t, ModelMap m, HttpServletRequest req) {
				
			return  getService().insert(t);
		
	}
	
	
	@RequestMapping("/searchByCondition")
	public String searchByCondition(Integer pageIndex, Integer pageSize,String name , ModelMap m, HttpServletRequest req) {
		Integer pageIndexStr = pageIndex;
		Integer pageSizeStr = pageSize;
		int PageIndex;
		if (pageIndexStr != null) {
		  PageIndex = pageIndexStr;
		}else {
			PageIndex=1;
		}
		Integer PageSize;// 默认每一页数量
		if (pageSizeStr != null) {
			PageSize = pageSizeStr;
		}else {
			PageSize= 10;
		}

		PageBean<T> pageBean = (PageBean<T>) getService().seleteBycondition(PageIndex, PageSize, name);
		m.put("list", pageBean.getList());
		m.put("pageBean", pageBean);
		System.out.println(pageBean);
		return getTypeName() + "/index";
	}
	
	@RequestMapping(value = "/deleteAll")
	public String deleteAll(ModelMap m,HttpServletRequest req) {
		String[] deleteIds = req.getParameterValues("selectIds");
		getService().deleteAll(deleteIds);
		return "redirect:/" + getTypeName() + "/pagelist.action";
	}

	@RequestMapping("update")
	public String update(T t, ModelMap m, HttpServletRequest req) {
		getService().update(t);
		return "redirect:/" + getTypeName() + "/pagelist.action";
	}
	
}
