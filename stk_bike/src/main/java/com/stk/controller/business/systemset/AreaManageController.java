package com.stk.controller.business.systemset;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/areaManage")
public class AreaManageController extends BaseController {
	
	/**
	 * 跳转到区域管理列表页
	 * @return
	 */
	@RequestMapping(value="/areaManageList")
	public ModelAndView areaManageList(Model model,Integer currentPage,Integer showCount){
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
		mav.setViewName("business/systemSet/areaManage/areaManageList");
		return mav;
	}
	
	/**
	 * 跳转到区域管理编辑页
	 * @return
	 */
	@RequestMapping(value="/areaManageForm")
	public String areaManageForm(){
		return "business/systemSet/areaManage/areaManageForm";
	}
}
