package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Product;

public interface ProductService extends BasicService<Product>{
	 List<Product> selectByProductTypeid(int id);
}