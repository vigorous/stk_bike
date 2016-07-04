package com.stk.controller.business.systemset;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.PoliceOfficeVO;
import com.sse.bikemanagement.entity.PoliceVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.info.PoliceInfoVO;
import com.sse.parser.mac.utils.UUIDUtil;
import com.stk.controller.base.BaseController;
import com.stk.util.UuidUtil;

@Controller
@RequestMapping(value = "/agentManage")
public class AgentManageController extends BaseController {

	/**
	 * 跳转到经办人管理列表页
	 * 
	 * @return
	 * @throws Exception
	 *//*
		 * @RequestMapping(value="/agentManageList") public ModelAndView
		 * agentManageList(Model model,Integer currentPage,Integer showCount){
		 * //造数据 Page page = new Page(); if(currentPage == null){
		 * page.setCurrentPage(1); }else{ page.setCurrentPage(currentPage); }
		 * if(showCount == null){ page.setShowCount(10); }else{
		 * page.setShowCount(showCount); } page.setTotalPage(10);
		 * page.setTotalResult(100);
		 * 
		 * model.addAttribute("page", page); ModelAndView mav =
		 * this.getModelAndView();
		 * mav.setViewName("business/systemSet/agentManage/agentManageList");
		 * return mav; }
		 */

	/*
	 * 跳转到经办人管理列表页
	 */
	@RequestMapping(value = "/agentManageList")
	public ModelAndView agentManageList(Page page) throws Exception {
		List<PoliceInfoVO> policeInfoList = FacadeFactory.getPoliceFacade().queryAllPolice(page, new PoliceVO());
		ModelAndView mv = this.getModelAndView();
		mv.addObject("page", page);
		mv.addObject("list", policeInfoList);
		mv.setViewName("business/systemSet/agentManage/agentManageList");
		return mv;
	}

	/*
	 * 跳转到经办人管理新建页
	 * */
	@RequestMapping(value="/addAgentPage")
	public String addPolicePage(Model model) throws Exception{
		List<PoliceOfficeVO> officeList=FacadeFactory.getPoliceOfficeFacade().queryAllPoliceOffice();
		model.addAttribute("officeList", officeList);
		model.addAttribute("oper", "add");
		return "business/systemSet/agentManage/agentManageForm";
	}
	
	/**
	 * 跳转到经办人管理编辑页
	 * 
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/agentManageForm")
	public String agentManageForm(Model model,PoliceVO policeVO) throws Exception {
		PoliceVO vo=FacadeFactory.getPoliceFacade().queryPoliceByID(policeVO);
		List<PoliceOfficeVO> officeList=FacadeFactory.getPoliceOfficeFacade().queryAllPoliceOffice();
		model.addAttribute("policeVO", vo);
		model.addAttribute("officeList", officeList);
		model.addAttribute("oper", "edit");
		return "business/systemSet/agentManage/agentManageForm";
	}

	/*
	 * 新建经办人
	 */
	@RequestMapping(value = "/addAgent" ,method = RequestMethod.POST)
	@ResponseBody
	public Boolean addAgent(PoliceVO policeVO) throws Exception {
		policeVO.setPOLICE_ID(UuidUtil.get32UUID());
		boolean flag = FacadeFactory.getPoliceFacade().addPolice(policeVO);
		return flag;

	}

	/*
	 * 删除经办人
	 */
	@RequestMapping(value = "/deleteAgent",method = RequestMethod.POST)
	@ResponseBody
	public Boolean deleteAgent(PoliceVO policeVO) throws Exception {
		boolean flag = FacadeFactory.getPoliceFacade().deletePolice(policeVO);
		return flag;
	}

	/*
	 * 编辑经办人
	 */
	@RequestMapping(value = "/editAgent",method = RequestMethod.POST)
	@ResponseBody
	public Boolean editAgent(PoliceVO policeVO) throws Exception {
		boolean flag = FacadeFactory.getPoliceFacade().modifyPolice(policeVO);
		return flag;
	}
}
