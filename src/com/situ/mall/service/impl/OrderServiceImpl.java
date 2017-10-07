package com.situ.mall.service.impl;

import javax.annotation.Resource;

import org.apache.tomcat.util.http.mapper.Mapper;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.OrderMapper;
import com.situ.mall.pojo.Order;
import com.situ.mall.service.OrderService;

@Service("OrderServiceImpl")
public class OrderServiceImpl extends BasicServiceImpl<Order> implements OrderService {

	@Resource(name="OrderMapper")
	private OrderMapper mappper;



	

}
