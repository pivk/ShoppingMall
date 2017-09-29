package com.situ.mall.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProductTypeMapper;
import com.situ.mall.pojo.ProductType;
import com.situ.mall.service.ProductTypeService;

@Service("ProductTypeServiceImpl")
public class ProductTypeServiceImpl extends BasicServiceImpl<ProductType> implements ProductTypeService {

	@Resource(name="ProductTypeMapper")
	private ProductTypeMapper mappper;

	

}
