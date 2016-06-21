package com.stk.controller.business.vehicledata;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//报警记录查询
@Controller
@RequestMapping(value="/police/")
public class PoliceController {
	@RequestMapping(value="select")
	public ModelAndView select(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/vehicledata/police");
		return mv;
	}
}
