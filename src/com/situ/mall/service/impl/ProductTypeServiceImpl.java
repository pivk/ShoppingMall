package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProductTypeMapper;
import com.situ.mall.pojo.ProductType;
import com.situ.mall.service.ProductTypeService;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SelectCondition;

@Service("ProductTypeServiceImpl")
public class ProductTypeServiceImpl extends BasicServiceImpl<ProductType> implements ProductTypeService {

	@Resource(name="ProductTypeMapper")
	private ProductTypeMapper mappper;

	
	public List<ProductType> seleteByparent(int id) {
		
		return mappper.seleteByparent(id);
	}


	public List<ProductType> seleteAllson() {
		
		return mappper.seleteAllson();
	}


	public List<ProductType> seleteAllfather() {
		// TODO Auto-generated method stub
		return mappper.seleteAllfather();
	}
	
 



	

}
