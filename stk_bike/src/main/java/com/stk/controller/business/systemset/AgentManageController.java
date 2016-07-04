package com.stk.controller.business.systemset;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.PoliceVO;
import com.sse.bikemanagement.entity.UserVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.info.UserInfoVO;
import com.stk.controller.base.BaseController;

@Controller
@RequestMapping(value="/agentManage")
public class AgentManageController extends BaseController {
	
	/**
	 * 跳转到经办人管理列表页
	 * @return
	 * @throws Exception 
	 *//*
	@RequestMapping(value="/agentManageList")
	public ModelAndView agentManageList(Model model,Integer currentPage,Integer showCount){
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
		mav.setViewName("business/systemSet/agentManage/agentManageList");
		return mav;
	}*/
	
	/*
	 *跳转到经办人管理列表页 
	 * */
	public ModelAndView agentManageList(Page page) throws Exception{
		List<PoliceVO> policeInfoList = FacadeFactory.getPoliceFacade().queryAllPolice(page, new PoliceVO());
		ModelAndView mv = this.getModelAndView();
		mv.addObject("page", page);
		mv.addObject("list", policeInfoList);
		mv.setViewName("business/systemSet/userManage/userManageList");
		return mv;
	}
	
	
	/**
	 * 跳转到经办人管理编辑页
	 * @return
	 */
	@RequestMapping(value="/agentManageForm")
	public String agentManageForm(){
		return "business/systemSet/agentManage/agentManageForm";
	}
}
