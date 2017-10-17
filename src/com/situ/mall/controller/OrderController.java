package com.situ.mall.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.Order_item;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.User;
import com.situ.mall.service.OrderService;
import com.situ.mall.service.Order_itemService;
import com.situ.mall.service.ProductService;
import com.situ.mall.vo.BuyCartVO;
import com.situ.mall.vo.CartItemVO;

@Controller
@RequestMapping(value = "/Order")
public class OrderController extends BasicController<Order>{
	@Resource(name = "Order_itemServiceImpl")
	private Order_itemService order_itemservice;
	
	@Resource(name = "OrderServiceImpl")
	private OrderService service;
	
	@Resource(name = "ProductServiceImpl")
	private ProductService productservice;
	
	@RequestMapping("/addoder")
	public String addorder(ModelMap m,HttpServletRequest request,Order order){

              order.setStatus(0);
              order.setPostage(12);
              HttpSession session=request.getSession();
              User user = (User) session.getAttribute("user");
              order.setUser_id(user.getId());
              SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss:SSS");
               long time=System.currentTimeMillis();
               
               order.setOrder_no(time);
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
	
    		// 2.如果cookie没有这个购物车对象,才需要new BuyCartVO
    		if (buyCartVO == null) {
    			buyCartVO = new BuyCartVO();
    		}

    		List<CartItemVO> items = buyCartVO.getItems();
    		for (CartItemVO item : items){
                Order_item orderitem=new Order_item();
    			Product product = productservice.getById(item.getProduct().getId());
    			orderitem.setUser_id(user.getId());
    			orderitem.setOrder_no(time);
                orderitem.setProduct_id(product.getId());
                orderitem.setProduct_image(product.getFulUrl());
                orderitem.setQuantity(item.getAmount());
                orderitem.setCurrent_unit_price(product.getPrice().doubleValue());
                orderitem.setTotal_price(item.getAmount()*item.getAmount());
                order_itemservice.insert(orderitem);
    		}
    		service.insert(order);  
    		return "Order/success";
    		}
     
	
	@RequestMapping("/displayinfo")
	public String displayinfo(ModelMap m,HttpServletRequest request,long orderno){
		List<Order_item> order= order_itemservice.getByorderno(orderno);
		 m.put("info", order);
		return "/Order/edit";
	}

             
}
		




