package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProductMapper;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.ProductService;

@Service("ProductServiceImpl")
public class ProductServiceImpl extends BasicServiceImpl<Product> implements ProductService {

	@Resource(name="ProductMapper")
	private ProductMapper mappper;

	@Override
	public List<Product> selectByProductTypeid(int id) {
		// TODO Auto-generated method stub
		return mappper.selectByProductTypeid(id);
	}




  
	

}
