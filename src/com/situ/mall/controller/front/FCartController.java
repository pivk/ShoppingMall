package com.situ.mall.controller.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.controller.BasicController;
import com.situ.mall.pojo.Cart;
import com.situ.mall.service.CartService;

@Controller
@RequestMapping(value = "/Cart")
public class FCartController extends BasicController<Cart>{
	@Resource(name = "CartServiceImpl")
	private CartService service;
  
@Override
public String pagelist(ModelMap m, String pageIndex, String pageSize, HttpServletRequest req,
		HttpServletResponse resp) {
	return "shoppingCar/cart";
}

@Override
public String insert(Cart t, ModelMap m, HttpServletRequest req) {
    
	 
	return "redirect:/Cart/pagelist.shtml";
}
}
