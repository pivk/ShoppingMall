package com.situ.mall.dao;


import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.Order;

@Repository("OrderMapper")
public interface OrderMapper extends BasicMapper<Order>{
  
}
