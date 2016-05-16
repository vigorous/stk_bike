package com.stk.controller.system.login;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.domain.system.User;
import com.stk.util.AppUtil;
import com.stk.util.Const;
import com.stk.util.PageData;

@Controller
//@RequestMapping(value="/loginController")
public class LoginController extends BaseController {
	
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("/login_toLogin")
	public ModelAndView toLogin(){
		logBefore(logger,"LoginController toLogin method");
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/admin/login");
		logAfter(logger);
		return mv;
	}
	
	/**
	 * 用户登录
	 * @return
	 */
	@RequestMapping(value="/login" , produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object login(){
		String errInfo = "success";
		
		logBefore(logger,"LoginController login method");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		//ModelAndView mv = this.getModelAndView();
		//mv.setViewName("system/admin/main");
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		//测试用的User对象
		User user = new User();
		user.setId(1);
		user.setName(pd.getString("name"));
		user.setPassword(pd.getString("password"));
		session.setAttribute(Const.SESSION_USER,user);
		
		//shiro加入身份验证
		Subject subject = SecurityUtils.getSubject(); 
	    UsernamePasswordToken token = new UsernamePasswordToken(pd.getString("name"), pd.getString("password")); 
	    try { 
	        subject.login(token); 
	    } catch (AuthenticationException e) { 
	    	errInfo = "身份验证失败！";
	    }
		logAfter(logger);
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}
	/**
	 * 访问首页
	 * @param changeMenu
	 * @return
	 */
	@RequestMapping("/main/{changeMenu}")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu){
		logBefore(logger,"LoginController login_index method " + changeMenu);
		ModelAndView mv = this.getModelAndView();
		if("index".equals(changeMenu)){
			mv.setViewName("system/admin/main");
		}
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/test")
	public ModelAndView test(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/admin/test");
		logAfter(logger);
		return mv;
	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "system/admin/tab";
	}
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 */
	@RequestMapping(value="/login_default")
	public String defaultPage(){
		return "system/admin/default";
	}
}
