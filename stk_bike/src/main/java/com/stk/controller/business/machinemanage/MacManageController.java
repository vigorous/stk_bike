package com.stk.controller.business.machinemanage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/macManage")
public class MacManageController {
	
	@RequestMapping(value="/macManageList")
	public ModelAndView macManageList(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/machineManage/macManage/macManageList");
		return mv;
	}
	
	@RequestMapping(value="/macManageForm")
	public String macManageForm(){
		return "business/machineManage/macManage/macManageForm";
	}
}
