package com.situ.mall.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProductMapper;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.ProductService;

@Service("ProductServiceImpl")
public class ProductServiceImpl extends BasicServiceImpl<Product> implements ProductService {

	@Resource(name="ProductMapper")
	private ProductMapper mappper;



	

}
