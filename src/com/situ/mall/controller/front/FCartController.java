package com.situ.mall.controller.front;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.ProductService;
import com.situ.mall.vo.CartVo;
import com.situ.mall.vo.Cart_item;

@Controller
@RequestMapping(value = "/cart")
public class FCartController{
	@Resource(name = "ProductServiceImpl")
	private ProductService service;
	
	@RequestMapping("/addcart")
	public String addcart(Integer productId,Integer amount,Model m
			,HttpServletRequest req,HttpServletResponse resp){
		//springmvc
		ObjectMapper objectMapper = new ObjectMapper();
		//只有对象里面不是null的才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		
	  CartVo cartVo=null;
	  Cookie[] cookies=req.getCookies();
	  if(null!=cookies&&cookies.length>0){
		  for (Cookie cookie : cookies) {
			if ("buy_cart_cookie".equals(cookie.getName())) {
				String value=cookie.getValue();
				try {
					cartVo=objectMapper.readValue(value, CartVo.class);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		 
		  
		  if(cartVo==null){
			  cartVo=new CartVo();
		  }
		 
		  if (null!=productId) {
			 Product productTemp=service.getById(productId);
			 Product product=new Product();
			 product.setId(productId);
			 product.setStock(productTemp.getStock());
			 Cart_item cart_item=new Cart_item();
			 cart_item.setProduct(product);
			 cart_item.setAmount(amount);
			 cartVo.additems(cart_item);
			 cartVo.setProductId(productId);
			 StringWriter stringWriter=new StringWriter();
			
			 try {
				objectMapper.writeValue(stringWriter, cartVo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
			 Cookie cookie=new Cookie("buy_cart_cookie", stringWriter.toString());
			 
			 cookie.setMaxAge(60*60*24);
			 cookie.setPath("/");
			 resp.addCookie(cookie);
					 
		}
		  List<Cart_item> items=cartVo.getItems();
		  for (Cart_item cart_item : items) {
			Product product=service.getById(cart_item.getProduct().getId());
			cart_item.setProduct(product);
		}
	  }
		
		return "shoppingCar/cart";
	}

	
}
