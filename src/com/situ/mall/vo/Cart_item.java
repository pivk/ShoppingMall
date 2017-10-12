package com.situ.mall.vo;

import com.situ.mall.pojo.Product;

/**
 * @author 郝振
 *
 */
public class Cart_item {
  private Product product;
  private Integer amount;
  
 public Cart_item() {
	// TODO Auto-generated constructor stub
}

public Product getProduct() {
	return product;
}

public void setProduct(Product product) {
	this.product = product;
}

public Integer getAmount() {
	return amount;
}

public void setAmount(Integer amount) {
	this.amount = amount;
}

@Override
public String toString() {
	return "Cart_item [product=" + product + ", amount=" + amount + "]";
}

 
 
 
}
