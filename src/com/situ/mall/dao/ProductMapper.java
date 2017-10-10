package com.situ.mall.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.Product;

@Repository("ProductMapper")
public interface ProductMapper extends BasicMapper<Product>{

	List<Product> selectByProductTypeid(int id);


}
