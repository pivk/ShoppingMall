package com.situ.mall.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.constant.MallConstant;
import com.situ.mall.controller.BasicController;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.ProductType;
import com.situ.mall.service.ProductService;
import com.situ.mall.service.ProductTypeService;

@Controller
@RequestMapping(value="/productType")
public class FproductType extends BasicController<ProductType>{
	
	@Resource(name = "ProductTypeServiceImpl")
	private ProductTypeService service;
	
	@Resource(name = "ProductServiceImpl")
	private ProductService sservice;
	
	@RequestMapping("/getType")
	public String getType(ModelMap m){
		List<ProductType> type= service.seleteAll();
		m.put("type", type);
		return "product/index";
	}
	
	@RequestMapping("/product_detail")
	public String product_detail(@Param(value="name")String name,ModelMap m){
	Product product =sservice.selectByName(name);
		m.put("product", product);
		return "product/product_detail";
	}
	
	@RequestMapping("/selectByid")
	public String selectByid(int id,ModelMap m){
		Product product =sservice.getById(id);
		m.put("product", product);
		String name=product.getSub_images();	
		String[] sub_images=name.split(",");
		m.put("sub_images", sub_images);
		return "product/product_detail";
	}
	
	@RequestMapping("/productAll")
	public String productAll(int id,ModelMap m){
	List<Product> product= sservice.selectByProductTypeid(id);	
		m.put("productall",product);  
			return "product/productall";
	}
	
}
