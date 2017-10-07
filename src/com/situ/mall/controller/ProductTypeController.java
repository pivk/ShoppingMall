package com.situ.mall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.ProductType;
import com.situ.mall.service.ProductTypeService;

@Controller
@RequestMapping(value = "/ProductType")
public class ProductTypeController extends BasicController<ProductType> {
	@Resource(name = "ProductTypeServiceImpl")
	private ProductTypeService service;

	@Override
	public String add(ModelMap m, HttpServletRequest req) {
		m.put("info1",service.seleteAllfather());
		return    "ProductType/edit";
	}
 
	
	   @RequestMapping("/selectParent")
	   public @ResponseBody List<ProductType> selectParent(int id) {
	      return service.seleteByparent(id);
	   }
	   
	
}
