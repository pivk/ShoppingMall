package com.situ.mall.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;
import com.situ.mall.service.IStatisPageService;
import freemarker.template.Configuration;
import freemarker.template.Template;
@Service
 public class StaticPageServiceImpl implements IStatisPageService,ServletContextAware{
	@Autowired
	private FreeMarkerConfigurer freeMarkerConfigurer;
	
	
	private ServletContext servletContext;
	
	
	@Override
	public boolean productIndex(Map<String, Object> root, Integer id) {
		//配置对象
	 Configuration configuration=freeMarkerConfigurer.getConfiguration();
	 Template template=null;
	 try {
		template=configuration.getTemplate("product_detail.ftl");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return false;
	}
		//生成的静态文件
		 String path="/resources/html"+id+".html";
		 File file=new  File(servletContext.getRealPath(path));
		 File parentFile=file.getParentFile();
		 if(!parentFile.exists()){
			 parentFile.mkdirs();
		 }
		//生成的静态文件
			Writer out =null;
			try {
				out=new OutputStreamWriter(new FileOutputStream(file),"UTF-8");  
				template.process(root, out);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
						return false;
			} finally{
				if(out!=null){
					try {
						out.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		   return true;
		}


	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext=servletContext;
	}

	}