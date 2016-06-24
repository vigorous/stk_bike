package com.stk.controller.business.vehicledata;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//布防设置
@Controller
@RequestMapping(value="/entry/")
public class EntryController {
	@RequestMapping(value="select")
	public ModelAndView select(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/vehicledata/entry");
		return mv;
	}
	/**
	 * 跳转到品牌管理添加页面
	 * @return
	 */
	@RequestMapping(value="entryForm")
	public String add(){
		return "business/vehicledata/entryForm";
	}
}