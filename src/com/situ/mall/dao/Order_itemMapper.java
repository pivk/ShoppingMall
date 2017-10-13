package com.situ.mall.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.Order_item;

@Repository("Order_itemMapper")
public interface Order_itemMapper extends BasicMapper<Order_item>{
    List<Order_item> seleteByusername(int  id);
	List<Order_item> getByorderno(long orderno);

}
