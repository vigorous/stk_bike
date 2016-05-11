package com.stk.controller.test;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.domain.system.User;
import com.stk.service.test.TestService;

@Controller
@RequestMapping(value="/testController")
public class TestController extends BaseController {
	
	@Resource(name="testService")
	private TestService testService;
	
	@RequestMapping("/test")
	public ModelAndView test(){
		logBefore(logger,"TestController test method");
		User user = testService.findUserById(1);
		ModelAndView mv = this.getModelAndView();
		this.getRequest().setAttribute("user", user);
		mv.setViewName("test/index");
		mv.addObject("user", user);
		logAfter(logger);
		return mv;
	}
	
	/*@RequestMapping("/login_toLogin")
	public ModelAndView toLogin(){
		logBefore(logger,"TestController toLogin method");
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/admin/main");
		logAfter(logger);
		return mv;
	}*/
}
