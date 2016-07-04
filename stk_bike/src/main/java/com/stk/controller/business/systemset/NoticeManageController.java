package com.stk.controller.business.systemset;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.NoticeVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.UserVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.NoticeFacade;
import com.sse.bikemanagement.info.NoticeInfoVO;
import com.stk.controller.base.BaseController;
import com.stk.util.Const;
import com.stk.util.UuidUtil;

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
	 * 跳转到公告管理详情页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/noticeDetailPage")
	public String noticeDetailPage(Model model, NoticeVO noticeVO) throws Exception{
		NoticeFacade noticeFacade = FacadeFactory.getNoticeFacade();
		NoticeInfoVO noticeInfoVO = noticeFacade.queryNoticeByID(noticeVO);
		model.addAttribute("noticeInfoVO", noticeInfoVO);
		return "business/systemSet/noticeManage/noticeManageDetail";
	}
	
	/**
	 * 跳转到公告管理编辑页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/editNoticePage")
	public String editNotice(Model model, NoticeVO noticeVO) throws Exception{
		NoticeFacade noticeFacade = FacadeFactory.getNoticeFacade();
		NoticeInfoVO noticeInfoVO = noticeFacade.queryNoticeByID(noticeVO);
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		UserVO userVO = (UserVO)session.getAttribute(Const.SESSION_USER);
		model.addAttribute("noticeInfoVO", noticeInfoVO);
		model.addAttribute("userVO", userVO);
		model.addAttribute("oper", "edit");
		return "business/systemSet/noticeManage/noticeManageForm";
	}
	
	/**
	 * 新建公告
	 * @param noticeVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addNotice", method = RequestMethod.POST)
	@ResponseBody
	public Boolean addNotice(NoticeVO noticeVO) throws Exception{
		noticeVO.setNOTICE_ID(UuidUtil.get32UUID());
		noticeVO.setCREATE_TIME(new Timestamp(new Date().getTime()));
		noticeVO.setUPDATE_TIME(new Timestamp(new Date().getTime()));
		NoticeFacade noticeFacade = FacadeFactory.getNoticeFacade();
		Boolean flag = noticeFacade.addNotice(noticeVO);
		return flag;
	}
	
	/**
	 * 编辑公告
	 * @param noticeVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editNotice", method = RequestMethod.POST)
	@ResponseBody
	public Boolean editNotice(NoticeVO noticeVO) throws Exception{
		noticeVO.setUPDATE_TIME(new Timestamp(new Date().getTime()));
		NoticeFacade noticeFacade = FacadeFactory.getNoticeFacade();
		Boolean flag = noticeFacade.modifyNotice(noticeVO);
		return flag;
	}
	
	/**
	 * 删除公告
	 * @param noticeVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteNotice", method = RequestMethod.POST)
	@ResponseBody
	public Boolean deleteNotice(NoticeVO noticeVO) throws Exception{
		NoticeFacade noticeFacade = FacadeFactory.getNoticeFacade();
		Boolean flag = noticeFacade.deleteNotice(noticeVO);
		return flag;
	}
}
