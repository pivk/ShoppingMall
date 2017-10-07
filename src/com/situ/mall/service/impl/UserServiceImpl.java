package com.situ.mall.service.impl;

import javax.annotation.Resource;

import org.apache.tomcat.util.http.mapper.Mapper;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.UserMapper;
import com.situ.mall.pojo.User;
import com.situ.mall.service.UserService;

@Service("UserServiceImpl")
public class UserServiceImpl extends BasicServiceImpl<User> implements UserService {

	@Resource(name="UserMapper")
	private UserMapper mappper;

	public User seleteByusername(User user) {
		return	 mappper.seleteByusername(user);

	}



	

}
