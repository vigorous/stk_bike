package com.stk.controller.business.bikfunctionemanage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
@Controller
@RequestMapping(value="/bike/")
public class BikeController extends BaseController{
	@RequestMapping(value="select")
	public ModelAndView select(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/bikemanage/bikeManager");
		return mv;
	}
}
