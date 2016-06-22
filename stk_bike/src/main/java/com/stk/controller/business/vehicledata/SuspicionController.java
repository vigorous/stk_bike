package com.stk.controller.business.vehicledata;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
//嫌疑车辆分析
@Controller
@RequestMapping(value="/suspicion/")
public class SuspicionController extends BaseController{
	@RequestMapping(value="select")
	public ModelAndView select(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/vehicledata/suspicion");
		return mv;
	}
}
