package com.stk.controller.business.realtimealarm;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/business/realTimeAlarm/deploymentMacAlarm")
public class DeploymentMacAlarmController extends BaseController {
	
	/**
	 * 跳转到布防MAC报警列表页
	 * @return
	 */
	@RequestMapping(value="/deploymentMacAlarmList")
	public ModelAndView deploymentMacAlarmList(Model model,Integer currentPage,Integer showCount){
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
		mav.setViewName("business/realTimeAlarm/deploymentMacAlarm/deploymentMacAlarmList");
		return mav;
	}
}
