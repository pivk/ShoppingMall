package com.situ.mall.controller.front;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.constant.MallConstant;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.ProductService;
import com.situ.mall.vo.BuyCartVO;
import com.situ.mall.vo.CartItemVO;

@Controller
@RequestMapping("/cart")
public class FCartController {
	@Autowired
	private ProductService productService;

	@RequestMapping("/addCart")
	public String addCart(Integer productId, Integer amount, Model model, HttpServletRequest request,
			HttpServletResponse response) {

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
		// 2.如果cookie没有这个购物车对象,才需要new BuyCartVO
		if (buyCartVO == null) {
			buyCartVO = new BuyCartVO();
		}

		// 把商品数量放到购物车里面
		if (null != productId) {
			Product productTemp = productService.getById(productId);
			Product product = new Product();
			product.setId(productId);
			product.setStock(productTemp.getStock());

			CartItemVO cartItemVO = new CartItemVO();
			cartItemVO.setProduct(product);
			cartItemVO.setAmount(amount);

			buyCartVO.addItem(cartItemVO);
			buyCartVO.setProductId(productId);

			// 把购物车对象BuyCartVO以json形式写到cookie里面
			StringWriter stringWriter = new StringWriter();
			try {
				objectMapper.writeValue(stringWriter, buyCartVO);
			} catch (IOException e) {
				e.printStackTrace();
			}
			// 将购物车json数据放到cookie里面
			Cookie cookie = new Cookie("buy_cart_cookie", stringWriter.toString());
			// 默认关闭浏览器cookie销毁
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
			// 将cookie发送给浏览器
			response.addCookie(cookie);
		}

		// 放到域对象中返回到前端展示的这个购物车，需要将Product对象填满数据才行
		List<CartItemVO> items = buyCartVO.getItems();
		for (CartItemVO item : items) {
			Product product = productService.getById(item.getProduct().getId());
			item.setProduct(product);
		}

		model.addAttribute("buyCartVO", buyCartVO);
		return "/shoppingCar/cart";
	}
	
	

	@RequestMapping("/delCart")
	public String delCart(Integer productId, HttpServletRequest request, HttpServletResponse response) {
		// springmvc
		ObjectMapper objectMapper = new ObjectMapper();
		// 只有对象里面不是null的才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		BuyCartVO buyCartVO = null;
		Cookie[] cookies = request.getCookies();
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
	if (buyCartVO != null) {
				Product product = new Product();
				product.setId(productId);
				
				CartItemVO cartItem = new CartItemVO();
				cartItem.setProduct(product);
			
				buyCartVO.delItem(cartItem);
				// 流
				StringWriter str = new StringWriter();
				// 对象json写的过程中 json是子串流
				try {
					objectMapper.writeValue(str, cartItem);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				Cookie cookie = new Cookie("buy_cart_cookie", str.toString());
				cookie.setMaxAge(60 * 60 * 24);
				cookie.setPath("/");
				
				response.addCookie(cookie);
			}
			return "redirect:/cart/addCart.shtml";
		}

	     
	
	
	

	}


