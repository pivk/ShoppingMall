package com.situ.mall.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.constant.MallConstant;
import com.situ.mall.dao.ProductMapper;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IStatisPageService;
import com.situ.mall.service.ProductService;

@Service("ProductServiceImpl")
public class ProductServiceImpl extends BasicServiceImpl<Product> implements ProductService  {

	@Resource(name="ProductMapper")
	private ProductMapper mappper;
	
	@Autowired
    private IStatisPageService staticPageService;
	
	@Override
	public List<Product> selectByProductTypeid(int id) {
		// TODO Auto-generated method stub
		return mappper.selectByProductTypeid(id);
	}

	
	
	@Override
	public ServerResponse show(Integer id) {
		   if(null==id){
			   return ServerResponse.createError("商品id不存在");
		   }
		   
		   Product product=mappper.getById(id);
		   if(null==product){
			   return ServerResponse.createError("该商品不存在");
			   
		   }
		   Map root=new HashMap<>();
		   root.put("product", product);
		 //按照“，”分割subImages，
		 		String subImagesStr = product.getSub_images();
		 		if (null != subImagesStr && !subImagesStr.equals("")) {
		 			String[] subImages = subImagesStr.split(",");
		 			for (int i = 0; i < subImages.length; i++) {
		 				subImages[i] = MallConstant.SERVER_ADDRES + subImages[i];
		 			}
		 			root.put("subImages", subImages);
		 		}
				if(staticPageService.productIndex(root, product.getId())){
					return ServerResponse.createSuccess("静态化页面成功");
				}
				
				
				return ServerResponse.createError ("静态化页面失败");
	}


}
