package com.situ.mall.service.impl;

import javax.annotation.Resource;

import org.apache.tomcat.util.http.mapper.Mapper;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.Pay_infoMapper;
import com.situ.mall.pojo.Pay_info;
import com.situ.mall.service.Pay_infoService;

@Service("Pay_infoServiceImpl")
public class Pay_infoServiceImpl extends BasicServiceImpl<Pay_info> implements Pay_infoService {

	@Resource(name="Pay_infoMapper")
	private Pay_infoMapper mappper;





	

}
