package com.situ.mall.dao;


import org.springframework.stereotype.Repository;

import com.situ.mall.pojo.User;

@Repository("UserMapper")
public interface UserMapper extends BasicMapper<User>{
 
	User seleteByusername(User user);
  
}
