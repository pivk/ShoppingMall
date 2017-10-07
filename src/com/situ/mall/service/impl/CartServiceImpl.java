package com.situ.mall.service.impl;

import javax.annotation.Resource;

import org.apache.tomcat.util.http.mapper.Mapper;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.CartMapper;
import com.situ.mall.pojo.Cart;
import com.situ.mall.service.CartService;

@Service("CartServiceImpl")
public class CartServiceImpl extends BasicServiceImpl<Cart> implements CartService {

	@Resource(name="CartMapper")
	private CartMapper mappper;




	

}
