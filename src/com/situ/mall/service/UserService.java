package com.situ.mall.service;

import com.situ.mall.pojo.User;

public interface UserService extends BasicService<User>{
	 User	seleteByusername(User user);

}
