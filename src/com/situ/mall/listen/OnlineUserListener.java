package com.situ.mall.listen;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.situ.mall.pojo.User;

public class OnlineUserListener implements ServletContextListener{
    //ServletContext创建的时候调用
    @Override
    public void contextInitialized(ServletContextEvent sce) {
       //创建在线学生列表集合
       //每当用户登录时候，就往集合中添加。
       List<User> onlineUserlist = new ArrayList<User>();
       //放到ServletContext域对象中
       ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("onlineUserlist", onlineUserlist);
    }
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
       
    }
}
