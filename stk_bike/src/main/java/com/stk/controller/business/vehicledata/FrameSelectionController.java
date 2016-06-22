package com.stk.controller.business.vehicledata;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//嫌疑车辆框选分析
@Controller
@RequestMapping(value="/frameSelection/")
public class FrameSelectionController {
	@RequestMapping(value="select")
	public ModelAndView select(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/vehicledata/frameSelection");
		return mv;
	}
}
