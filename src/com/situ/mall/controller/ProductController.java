package com.situ.mall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.ProductService;
import com.situ.mall.service.ProductTypeService;
import com.situ.mall.util.Values;

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
	       m.put("statuslist", Values.statusa);
		   return super.add(m, req);
	}
   
   @Override
	public String edit(int id, ModelMap m, HttpServletRequest req) {
		    Product product=service.getById(id);
		    m.put("info", product);
			String name=product.getSub_images();	
			String[] sub_images=name.split(",");
			m.put("sub_images", sub_images);	
			return super.edit(id, m, req);
	}

   
	@RequestMapping("/show")
	@ResponseBody
	public ServerResponse show(Integer id) {
		return service.show(id);
	}
   
}
