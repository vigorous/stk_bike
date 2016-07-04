package com.stk.controller.business.systemset;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.LogVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.stk.controller.base.BaseController;

@Controller
@RequestMapping(value="/systemLog")
public class SystemLogController extends BaseController {
	
/*	*//**
	 * 跳转到系统日志列表页
	 * @return
	 *//*
	@RequestMapping(value="/systemLogList")
	public ModelAndView systemLogList(Model model,Integer currentPage,Integer showCount){
		//造数据
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
		ModelAndView mav = this.getModelAndView();
		mav.setViewName("business/systemSet/systemLog/systemLogList");
		return mav;
	}
	*/
	/*
	 * 查询所有日志信息
	 * */
	@RequestMapping(value="/systemLogList")
	 public ModelAndView systemLogList(Page page){
		
		return null;
		 
	 }
}
