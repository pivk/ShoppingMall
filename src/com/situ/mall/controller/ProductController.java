package com.situ.mall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.Product;
import com.situ.mall.service.ProductService;
import com.situ.mall.service.ProductTypeService;

@Controller
@RequestMapping(value = "/Product")
public class ProductController extends BasicController<Product> {
	@Resource(name = "ProductServiceImpl")
	private ProductService service;
	
	@Resource(name = "ProductTypeServiceImpl")
	private ProductTypeService sservice;
	
   @Override
	public String add(ModelMap m, HttpServletRequest req) {
	       m.put("type",sservice.seleteAllson());
		   return super.add(m, req);
	}
   

   
   
}
