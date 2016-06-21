package com.stk.controller.business.vehicledata;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;

//隐匿车辆查询
@Controller
@RequestMapping(value="/hidden/")
public class HiddenController extends BaseController{
	@RequestMapping(value="select")
	public ModelAndView select(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/vehicledata/hidden");
		return mv;
	}
}
