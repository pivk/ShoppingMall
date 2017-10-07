package com.situ.mall.dao;


import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.Cart;

@Repository("CartMapper")
public interface CartMapper extends BasicMapper<Cart>{
  
}
