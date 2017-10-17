package com.situ.mall.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.listen.OnlineUserListener;
import com.situ.mall.pojo.User;
import com.situ.mall.service.UserService;
import com.situ.mall.util.Md5Utils;

@Controller
@RequestMapping(value = "/User")
public class UserController extends BasicController<com.situ.mall.pojo.User>{
	@Resource(name = "UserServiceImpl")
	private UserService service;

	 @RequestMapping("/logout")
	 public String logout (HttpServletRequest req, HttpServletResponse resp ){
			HttpSession session = req.getSession(false);
		 if(session!=null){
			 User user=(User)session.getAttribute("user");
			 List<User> onlineUser=(List<User>) req.getServletContext();
			 onlineUser.remove(user);
			 session.invalidate();
		 }
		 
		 return "login/login";
	 }
		@RequestMapping("/insert1")
		public String insert1(User t, ModelMap m, HttpServletRequest req) {
			 t.setPassword(Md5Utils.getMd5(t.getPassword()));
			 t.setRole(0);
			 return "/login/register";
		} 
	 
	 @RequestMapping("/main")
	 public String main (){
		 return "login/main";
	 }
	 
	 @RequestMapping("/editpass")
	 public String editpass (){
		 return "login/changePwd";
	 }
	 

	 public String edit(int id, ModelMap m, HttpServletRequest req,HttpServletResponse repose) {
		return  "login/userInfo";
	}
	 
	
	@RequestMapping("/login")
	public String  login(HttpServletRequest req, HttpServletResponse resp ,String password,String username,String checkCode,ModelMap m){
		String checkCodeSession = (String) req.getSession().getAttribute("checkCodeSession");
		HttpSession session = req.getSession();
          User user=new User();
          user.setUsername(username);
          user.setPassword(password);
         
	    User info=service.seleteByusername(user);
		if ( checkCode == null || checkCode.equals("")|| username == null || username.equals("")
			|| password == null || password.equals("")) {
			return "login/login";
		}

		else if (!checkCode.equalsIgnoreCase(checkCodeSession)) {
			session.setAttribute("err1", "验证码错误");
			return "login/login";
		}
		else if (info==null) {
			session.setAttribute("err2", "账户密码错误");
			return   "login/login";
		}
		else {
			session.setAttribute("user", user);
			List<User> onlineUserlist=(List<User>) req.getServletContext().getAttribute("onlineUserlist");
			 onlineUserlist.add(user);
			 
			 session.setAttribute("num", onlineUserlist.size());
			 return "index";
		}
		 
	}
}
