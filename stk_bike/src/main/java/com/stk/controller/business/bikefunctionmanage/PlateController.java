package com.stk.controller.business.bikefunctionmanage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping(value="/plate/")
//电子车牌发卡管理
public class PlateController {
	@RequestMapping(value="select")
	public ModelAndView select(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/bikefunctionmanage/plateManager");
		return mv;
	}
	@RequestMapping(value="plateManagerForm")
	public ModelAndView plateManagerForm(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/bikefunctionmanage/plateManagerForm");
		return mv;
	}
}
