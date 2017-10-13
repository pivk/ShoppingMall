package com.situ.mall.controller.front;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.controller.BasicController;
import com.situ.mall.pojo.Order_item;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.User;
import com.situ.mall.service.Order_itemService;
import com.situ.mall.service.ProductService;
import com.situ.mall.service.ShippingService;
import com.situ.mall.vo.BuyCartVO;
import com.situ.mall.vo.CartItemVO;
@Controller
@RequestMapping(value = "/order")
public class ForderController extends BasicController<Order_item>{
	@Resource(name = "Order_itemServiceImpl")
	private Order_itemService service;
 
	@Resource(name = "ShippingServiceImpl")
	private ShippingService sservice;
	
	@Autowired
	private ProductService productService;

	@RequestMapping("/index")
	public String index(ModelMap m,
			HttpServletRequest request, HttpServletResponse response) {
		
		
	    HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");
		m.put("shipping",sservice.getById(user.getId()));
		// springmvc
		ObjectMapper objectMapper = new ObjectMapper();
		// 只有对象里面不是null的才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		BuyCartVO buyCartVO = null;
		Cookie[] cookies = request.getCookies();
		// 1.如果cookie有这个购物车对象，那就从cookie里面取出这个购物车对象
		if (null != cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("buy_cart_cookie".equals(cookie.getName())) {
					// 之前已经有购物车
					// "{\"items\":[{\"product\":{\"id\":45},\"amount\":1}],\"productId\":45}"
					String value = cookie.getValue();
					try {
						buyCartVO = objectMapper.readValue(value, BuyCartVO.class);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		List<CartItemVO> items = buyCartVO.getItems();
		for (CartItemVO item : items) {
			Product product = productService.getById(item.getProduct().getId());
			item.setProduct(product);
		}
		m.put("buyCartVO",buyCartVO );	
		return "order/order";
	}
	
}