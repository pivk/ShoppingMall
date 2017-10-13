package com.situ.mall.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.tomcat.util.http.mapper.Mapper;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.Order_itemMapper;
import com.situ.mall.pojo.Order_item;
import com.situ.mall.service.Order_itemService;

@Service("Order_itemServiceImpl")
public class Order_itemServiceImpl extends BasicServiceImpl<Order_item> implements Order_itemService {

	@Resource(name="Order_itemMapper")
	private Order_itemMapper mappper;

	public List<Order_item> seleteByusername(int id) {
		return mappper.seleteByusername(id);
	}

	@Override
	public List<Order_item> getByorderno(long orderno) {
		// TODO Auto-generated method stub
		return mappper.getByorderno(orderno);
	}





	

}
