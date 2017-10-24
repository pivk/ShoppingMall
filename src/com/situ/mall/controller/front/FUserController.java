package com.situ.mall.controller.front;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.controller.BasicController;
import com.situ.mall.pojo.User;
import com.situ.mall.service.UserService;
import com.situ.mall.util.Md5Utils;

@Controller
@RequestMapping(value = "/user")
public class FUserController extends BasicController<com.situ.mall.pojo.User>{
	@Resource(name = "UserServiceImpl")
	private UserService service;

	@Override
	public String add(ModelMap m, HttpServletRequest req) {
	
		return "/login/register";
	}
	
	@RequestMapping("/insert1")
	public String insert1(User t, ModelMap m, HttpServletRequest req) {
		 t.setPassword(Md5Utils.getMd5(t.getPassword()));
		 t.setRole(1);
		 service.insert(t);
		 return "/login/login";
	}

	 @RequestMapping("/logout")
	 public String logout (){
		 return "/login/login";
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
			return "/login/login";
		}

		else if (!checkCode.equalsIgnoreCase(checkCodeSession)) {
			session.setAttribute("err1", "验证码错误");
			return "/login/login";
		}
		else if (info==null) {
			session.setAttribute("err2", "账户密码错误");
			return   "/login/login";
		}
		else {
			session.setAttribute("user", info);
		return "redirect:/productType/getType.shtml";
		}
          
		 
	}
}
