package com.situ.mall.service;

import java.util.List;

import com.situ.mall.dao.ProductTypeMapper;
import com.situ.mall.pojo.ProductType;

public interface ProductTypeService extends BasicService<ProductType>{
    
	List<ProductType> seleteByparent(int id);
	
	List<ProductType> seleteAllson();
	
    List<ProductType> seleteAllfather();

}
