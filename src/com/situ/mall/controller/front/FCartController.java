package com.situ.mall.controller.front;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.controller.BasicController;
import com.situ.mall.pojo.Cart;
import com.situ.mall.pojo.ProductType;
import com.situ.mall.service.CartService;

@Controller
@RequestMapping(value = "/Cart")
public class FCartController extends BasicController<Cart>{
	@Resource(name = "CartServiceImpl")
	private CartService service;
  
	@RequestMapping("/turn")
	public String turn(ModelMap m){
	
		return "shoppingCar/cart";
	}
}
