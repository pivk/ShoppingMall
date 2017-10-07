package com.situ.mall.dao;


import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.Product;

@Repository("ProductMapper")
public interface ProductMapper extends BasicMapper<Product>{

}
