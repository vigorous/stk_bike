package com.stk.controller.business.vehicledata;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//车辆轨迹查询
@Controller
@RequestMapping(value="/guiji/")
public class GuijiController {
	@RequestMapping(value="select")
	public ModelAndView select(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/vehicledata/guiji");
		return mv;
	}
}
