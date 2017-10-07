package com.situ.mall.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.ProductType;

@Repository("ProductTypeMapper")
public interface ProductTypeMapper extends BasicMapper<ProductType>{
    List<ProductType> seleteByparent(int id);
    
    List<ProductType> seleteAllson();
	
    List<ProductType> seleteAllfather();

	
}
