package com.situ.mall.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.situ.mall.pojo.ProductType;
import com.situ.mall.service.ProductTypeService;

@Controller
@RequestMapping(value = "/ProductType")
public class ProductTypeController extends BasicController<ProductType> {
	@Resource(name = "ProductTypeServiceImpl")
	private ProductTypeService service;


}
