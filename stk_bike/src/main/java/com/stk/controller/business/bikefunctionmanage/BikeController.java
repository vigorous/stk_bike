package com.stk.controller.business.bikefunctionmanage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;
@Controller
@RequestMapping(value="/bike/")
//车辆管理
public class BikeController extends BaseController{
	@RequestMapping(value="select")
	public ModelAndView select(Model model, Integer currentPage,Integer showCount){
		ModelAndView mv=new ModelAndView();
		Page page = new Page();
		if(currentPage == null){
			page.setCurrentPage(1);
		}else{
			page.setCurrentPage(currentPage);
		}
		if(showCount == null){
			page.setShowCount(10);
		}else{
			page.setShowCount(showCount);
		}
		page.setTotalPage(10);
		page.setTotalResult(100);
		
		model.addAttribute("page", page);
		mv.setViewName("business/bikefunctionmanage/bikeManager");
		return mv;
	}
	
	/**
	 * 跳转到车辆详细信息弹窗页
	 * @return
	 */
	@RequestMapping(value="/bikeMsg")
	public String machineForm(){
		return "dialog/bikeMsg";
	}
}
