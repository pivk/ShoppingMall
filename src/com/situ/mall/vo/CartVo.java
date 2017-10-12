package com.situ.mall.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class CartVo {
	// 购物项集合

   private List<Cart_item> items;
	// 继续购物，最后一次产品的id

   private Integer productId;

    public void additems(Cart_item cartItem) {
		boolean isExit=false;
		for (Cart_item cart_item : items) {
			if (cart_item.getProduct().getId()==cart_item.getProduct().getId()) {
				isExit=true;
				int amount=cart_item.getAmount()+cart_item.getAmount();
				if(amount<=cart_item.getProduct().getStock()){
					 cart_item.setAmount(amount);
				}else {
					cart_item.setAmount(cart_item.getProduct().getStock());
				}
			}
		}
		if(isExit==false){
			items.add(cartItem);
		}
		
			}
   

    @JsonIgnore
	public double getTotalPrice() {
		Double totalPrice = 0.0;
		for (Cart_item item : items) {
			totalPrice += item.getAmount() * item.getProduct().getPrice().doubleValue();
		}
		return totalPrice;
	}
    
    public List<Cart_item> getItems() {
		return items;
	}


	public void setItems(List<Cart_item> items) {
		this.items = items;
	}


public Integer getProductId() {
	return productId;
}

public void setProductId(Integer productId) {
	this.productId = productId;
}


   
	  
}
