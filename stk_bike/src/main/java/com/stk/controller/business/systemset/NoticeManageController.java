package com.stk.controller.business.systemset;

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
@RequestMapping(value="/noticeManage")
public class NoticeManageController extends BaseController {
	
	/**
	 * 跳转到公告管理列表页
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/noticeManageList")
	public ModelAndView noticeManageList(Page page) throws IOException{
		NoticeDAOImpl noticeDAOImpl = new NoticeDAOImpl();
		List<NoticeVO> list = noticeDAOImpl.queryAllNotice(page);
		ModelAndView mv = this.getModelAndView();
		mv.addObject("page", page);
		mv.addObject("list",list);
		mv.setViewName("business/systemSet/noticeManage/noticeManageList");
		return mv;
	}
	
	/**
	 * 跳转到公告管理编辑页
	 * @return
	 */
	@RequestMapping(value="/noticeManageForm")
	public String noticeManageForm(){
		return "business/systemSet/noticeManage/noticeManageForm";
	}
}
