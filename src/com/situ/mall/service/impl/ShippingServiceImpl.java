package com.situ.mall.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.situ.mall.dao.ShippingMapper;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.service.ShippingService;

@Service("ShippingServiceImpl")
public class ShippingServiceImpl extends BasicServiceImpl<Shipping> implements ShippingService {

	@Resource(name="ShippingMapper")
	private ShippingMapper mappper;





	

}
