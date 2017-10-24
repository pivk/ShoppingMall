package com.situ.mall.service;

import java.util.Map;

/**
 * @author 郝振
 *静态化网页
 */

public interface IStatisPageService {

	/**
	 * 商品详情页静态化
	 * @param root 数据
	 * @param id  商品的id
	 * 
	 */
	public boolean productIndex(Map<String,Object> root,Integer id);
}
