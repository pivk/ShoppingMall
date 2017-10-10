package com.situ.mall.controller.front;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.controller.BasicController;
import com.situ.mall.pojo.Order_item;
import com.situ.mall.service.Order_itemService;
@Controller
@RequestMapping(value = "/orderItem")
public class ForderController extends BasicController<Order_item>{
	@Resource(name = "Order_itemServiceImpl")
	private Order_itemService service;

	@RequestMapping("index")
	public String index(ModelMap m, int id) {
		m.put("order", service.seleteByusername(id));
		return "shoppingCar/cart";

	}

	@RequestMapping("insert")
	public String insert(Order_item t, ModelMap m, HttpServletRequest req) {
		service.insert(t);
		return "redirect:/orderItem/index.shtml" + "?id=" + t.getUser_id();

	}
	
	
}