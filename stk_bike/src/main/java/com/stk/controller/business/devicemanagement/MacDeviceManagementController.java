package com.stk.controller.business.devicemanagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/business/deviceManagement/macDeviceManagement/")
public class MacDeviceManagementController {
	@RequestMapping(value="macDeviceManagementList")
	public ModelAndView select(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/deviceManagement/macDeviceManagement/macDeviceManagementList");
		return mv;
	}
	@RequestMapping(value="macDeviceManagementForm")
	public String add(){
		return "business/deviceManagement/macDeviceManagement/macDeviceManagementForm";
	}
}
