package com.stk.controller.business.realalarm;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/stolenAlarm")
public class StolenAlarmController extends BaseController {
	
	/**
	 * 跳转到被盗车辆报警列表页
	 * @return
	 */
	@RequestMapping(value="/stolenAlarmList")
	public ModelAndView stolenAlarmList(Model model,Integer currentPage,Integer showCount){
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
		mav.setViewName("business/realTimeAlarm/stolenAlarm/stolenAlarmList");
		return mav;
	}
}
