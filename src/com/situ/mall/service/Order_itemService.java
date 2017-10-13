package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Order_item;

public interface Order_itemService extends BasicService<Order_item>{
    List<Order_item> seleteByusername(int  id);

	List<Order_item> getByorderno(long orderno);

}
