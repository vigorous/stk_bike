package com.stk.controller.business.systemsetting;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.dao.impl.NoticeDAOImpl;
import com.sse.bikemanagement.entity.NoticeVO;
import com.sse.bikemanagement.entity.Page;
import com.stk.controller.base.BaseController;

@Controller
@RequestMapping(value="/business/systemSetting/bulletinManagement")
public class BulletinManagementController extends BaseController {
	
	/**
	 * 跳转到公告管理列表页
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/bulletinManagementList")
	public ModelAndView bulletinManagementList(Model model,Integer currentPage,Integer showCount) throws IOException{
		Page page = new Page();
		NoticeDAOImpl noticeDAOImpl = new NoticeDAOImpl();
		List<NoticeVO> list = noticeDAOImpl.queryAllNotice(page);
		model.addAttribute("list",list);
		model.addAttribute("page", page);
		ModelAndView mav = this.getModelAndView();
		mav.setViewName("business/systemSetting/bulletinManagement/bulletinManagementList");
		return mav;
	}
	
	/**
	 * 跳转到公告管理编辑页
	 * @return
	 */
	@RequestMapping(value="/bulletinManagementForm")
	public String bulletinManagementForm(){
		return "business/systemSetting/bulletinManagement/bulletinManagementForm";
	}
}
