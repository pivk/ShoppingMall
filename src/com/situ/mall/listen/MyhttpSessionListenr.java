package com.situ.mall.listen;

import java.util.List;

import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.situ.mall.pojo.User;

public class MyhttpSessionListenr implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
           HttpSession session =se.getSession();
           ServletContext servlet=session.getServletContext();
           List<User> onlintUser=(List<User>) servlet.getAttribute("onlineUserlist");
           	User user= (User) session.getAttribute("user");
           	if(user!=null){
           		onlintUser.remove(user);
           	}
           
           
	}

}
