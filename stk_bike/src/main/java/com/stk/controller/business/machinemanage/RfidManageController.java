package com.stk.controller.business.machinemanage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/rfidManage")
public class RfidManageController extends BaseController {
	
	/**
	 * 跳转到RFID设备管理列表页
	 * @return
	 */
	@RequestMapping(value="/rfidManageList")
	public ModelAndView rfidManageList(Model model,Integer currentPage,Integer showCount){
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
		mav.setViewName("business/machineManage/rfidManage/rfidManageList");
		return mav;
	}
	
	/**
	 * 跳转到设备日志列表页
	 * @return
	 */
	@RequestMapping(value="/machineLogList")
	public ModelAndView machineLogList(Model model,Integer currentPage,Integer showCount){
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
		mav.setViewName("business/machineManage/rfidManage/machineLogList");
		return mav;
	}
	
	/**
	 * 跳转到点位分布详情页
	 * @return
	 */
	@RequestMapping(value="/pointDistrDetail")
	public ModelAndView pointDistrDetail(){
		ModelAndView mav = this.getModelAndView();
		mav.setViewName("business/machineManage/rfidManage/pointDistrDetail");
		return mav;
	}
	
	/**
	 * 跳转到机具编辑页
	 * @return
	 */
	@RequestMapping(value="/machineForm")
	public String machineForm(){
		return "business/machineManage/rfidManage/machineForm";
	}
}
