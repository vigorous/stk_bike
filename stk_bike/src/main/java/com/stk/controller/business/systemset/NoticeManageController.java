package com.stk.controller.business.systemset;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.DistrictVO;
import com.sse.bikemanagement.entity.NoticeVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.UserVO;
import com.sse.bikemanagement.facade.DistrictFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.NoticeFacade;
import com.sse.bikemanagement.info.NoticeInfoVO;
import com.stk.controller.base.BaseController;
import com.stk.util.Const;

@Controller
@RequestMapping(value="/noticeManage")
public class NoticeManageController extends BaseController {
	
	/**
	 * 跳转到公告管理列表页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/noticeManageList")
	public ModelAndView noticeManageList(Page page, NoticeVO noticeVO) throws Exception{
		NoticeFacade noticeFacade = FacadeFactory.getNoticeFacade();
		List<NoticeInfoVO> list = noticeFacade.queryAllNotice(page, noticeVO);
		ModelAndView mv = this.getModelAndView();
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("business/systemSet/noticeManage/noticeManageList");
		return mv;
	}
	
	/**
	 * 跳转到公告管理新建页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/addNoticePage")
	public String addNoticePage(Model model) throws Exception{
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		UserVO userVO = (UserVO)session.getAttribute(Const.SESSION_USER);
		model.addAttribute("userVO", userVO);
		model.addAttribute("oper", "add");
		return "business/systemSet/noticeManage/noticeManageForm";
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
