package com.stk.controller.business.systemsetting;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/business/systemSetting/agentManagement")
public class AgentManagementController extends BaseController {
	
	/**
	 * 跳转到经办人管理列表页
	 * @return
	 */
	@RequestMapping(value="/agentManagementList")
	public ModelAndView agentManagementList(Model model,Integer currentPage,Integer showCount){
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
		mav.setViewName("business/systemSetting/agentManagement/agentManagementList");
		return mav;
	}
	
	/**
	 * 跳转到经办人管理编辑页
	 * @return
	 */
	@RequestMapping(value="/agentManagementForm")
	public String agentManagementForm(){
		return "business/systemSetting/agentManagement/agentManagementForm";
	}
}
