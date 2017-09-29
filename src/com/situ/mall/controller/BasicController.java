package com.situ.mall.controller;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.service.BasicService;
import com.situ.mall.util.PageBean;

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

	
	@RequestMapping("/zindex")
	public String zindex() {
		return getTypeName() + "/index";
	}


	@RequestMapping("/edit")
	public String edit(int id, ModelMap m, HttpServletRequest req) {
		m.put("info", getService().getById(id));
		return add(m, req);
	}
	
	
	@RequestMapping("/add")
	public String add(ModelMap m, HttpServletRequest req) {
		m.put("info1",getService().seleteAll());
		return  getTypeName() + "/edit";
	}

	
	@RequestMapping("/delete")
	public String delete(int id, ModelMap m, HttpServletRequest req) {
		getService().delete(id);
		return "redirect:/" + getTypeName() + "/index";
	}
    
	
	
	@RequestMapping("/index")
	@ResponseBody
	 public List<T> index(ModelMap m){
	       List<T> t=getService().seleteAll();
         return t;
	}
	
	@RequestMapping("/pagelist")
	@ResponseBody
	public PageBean<T>   pagelist(String pageindex, String pageSize, HttpServletRequest req,
			HttpServletResponse resp) {
		String PageIndexStr = pageindex;
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
			PageSize = 3;
		}
		PageBean<T> pageBean = (PageBean<T>) getService().pagelist(PageIndex, PageSize);
		return pageBean;
	}

	@RequestMapping("/insert")
	public String insert(T t, ModelMap m, HttpServletRequest req) {
		if (getService().selectByName(((Field) t).getName()) == null) {
			getService().insert(t);
			return "redirect:/" + getTypeName() + "/index";
		} else {
			m.put("err1", "名字已经存在");
			return "redirect:/" + getTypeName() + "/edit";
		}
	}
	
	@RequestMapping(value = "/deleteAll")
	public String deleteAll(ModelMap m,HttpServletRequest req) {
		String[] deleteIds = req.getParameterValues("selectIds");
		getService().deleteAll(deleteIds);
		return "redirect:/" + getTypeName() + "/index";
	}

	@RequestMapping("update")
	public String update(T t, ModelMap m, HttpServletRequest req) {
		getService().update(t);
		return "redirect:/" + getTypeName() + "/index";
	}
	
}
