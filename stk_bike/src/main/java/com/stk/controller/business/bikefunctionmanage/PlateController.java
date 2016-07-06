package com.stk.controller.business.bikefunctionmanage;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.CardVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.PoliceOfficeVO;
import com.sse.bikemanagement.entity.PoliceVO;
import com.sse.bikemanagement.entity.UserVO;
import com.sse.bikemanagement.facade.CardFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.PoliceFacade;
import com.sse.bikemanagement.facade.PoliceOfficeFacade;
import com.stk.controller.base.BaseController;
import com.stk.domain.system.Superior;
import com.stk.util.Const;
import com.stk.util.DateUtil;
import com.stk.util.PageData;
import com.stk.util.UuidUtil;

@Controller
@RequestMapping(value = "/plate/")
// 电子车牌发卡管理
public class PlateController extends BaseController {
	@RequestMapping(value = "select")
	public ModelAndView select(Page page, CardVO vo, String startTime, String endTime) throws Exception {
		ModelAndView mv = new ModelAndView();
		CardFacade cardFacade = FacadeFactory.getCardFacade();
		CardVO cov = new CardVO();
		Date startDate = null;
		Date endDate = null;
		try {
			if (startTime != null || !startTime.equals("")) {
				startDate = DateUtil.fomatDates(startTime);
			}
			if (endTime != null || !endTime.equals("")) {
				endDate = DateUtil.fomatDates(endTime);
			}
		} catch (NullPointerException e) {

		}
		List<CardVO> list = cardFacade.queryCardByPage(page, cov, startDate, endDate);
		mv.addObject("list", list);
		mv.addObject("page", page);
		// 存储时间
		mv.addObject("startTime", startTime);
		mv.addObject("endTime", endTime);
		mv.setViewName("business/bikefunctionmanage/plateManager");
		return mv;
	}

	@RequestMapping(value = "plateManagerForm")
	public ModelAndView plateManagerForm() throws Exception {
		PoliceVO vos;
		ModelAndView mv = new ModelAndView();
		// 获取session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		UserVO user = (UserVO) session.getAttribute(Const.SESSION_USER);
		PoliceFacade cardFacade = FacadeFactory.getPoliceFacade();
		// 查询所有公安局
		PoliceOfficeFacade facade = FacadeFactory.getPoliceOfficeFacade();
		List<PoliceOfficeVO> PoliceOfficeList = facade.queryAllPoliceOffice();
		List<PoliceVO> policeList = cardFacade.queryAllPolice();
		mv.addObject("policeList", policeList);
		mv.addObject("PoliceOfficeList", PoliceOfficeList);
		mv.setViewName("business/bikefunctionmanage/plateManagerForm");
		return mv;
	}

	// 添加发卡单位
	@RequestMapping(value = "addCard", method = RequestMethod.POST)
	@ResponseBody
	public boolean addCard() throws Exception {
		PageData pd = new PageData(this.getRequest());
		CardVO vo = new CardVO();
		String APPLY_ORG_NAME = pd.getString("APPLY_ORG_NAME");
		String AUTH_ORG_NAME = pd.getString("AUTH_ORG_NAME");
		String APPLY_TIME = pd.getString("APPLY_TIME");
		String CARD_BEGIN_NO = pd.getString("CARD_BEGIN_NO");
		String CARD_END_NO = pd.getString("CARD_END_NO");
		// String APPLY_NUM = pd.getString("APPLY_NUM");
		String POLICE_ID = pd.getString("POLICE_ID");
		String POLICE_NAME = pd.getString("POLICE_NAME");
		String APPLY_ORG_ID = pd.getString("APPLY_ORG_ID");
		String AUTH_ORG_ID = pd.getString("AUTH_ORG_ID");
		
		vo.setAPPLY_ORG_ID(APPLY_ORG_ID);
		vo.setAPPLY_ORG_NAME(APPLY_ORG_NAME);
		vo.setAPPLY_TIME(new Timestamp(DateUtil.fomatDates(APPLY_TIME).getTime()));
		vo.setCARD_BEGIN_NO(CARD_BEGIN_NO);
		vo.setCARD_END_NO(CARD_END_NO);
		vo.setPOLICE_ID(POLICE_ID);
		vo.setCARD_ID(UuidUtil.get32UUID());
		vo.setPOLICE_NAME(POLICE_NAME);
		vo.setAUTH_ORG_NAME(AUTH_ORG_NAME);
		// vo.setAPPLY_NUM(Integer.parseInt(APPLY_NUM));
		vo.setAUTH_ORG_ID(AUTH_ORG_ID);
		CardFacade card = FacadeFactory.getCardFacade();
		// 根据经办人id查询公安信息
		boolean flag = card.addCard(vo);
		return flag;
	}

	// 根据经办人ID查询经办人信息

	// 添加发卡单位
	@RequestMapping(value = "queryPoliceByID", method = RequestMethod.POST)
	@ResponseBody
	public PoliceVO queryPoliceByID(PoliceVO vo) throws Exception {
		PoliceFacade facade = FacadeFactory.getPoliceFacade();
		PoliceVO policeVO = facade.queryPoliceByID(vo);
		return policeVO;
	}

	// 根据公安局id查询上级单位信息
	@RequestMapping(value = "queryParentPoliceOfficeByID", method = RequestMethod.POST)
	@ResponseBody
	public Superior queryParentPoliceOfficeByID(PoliceOfficeVO vo) throws Exception {
		Superior superior = new Superior();
		PoliceOfficeFacade facade = FacadeFactory.getPoliceOfficeFacade();
		// 当前姓名
		PoliceOfficeVO officeVO = facade.queryPoliceOfficeByID(vo);
		// 上级
		PoliceOfficeVO policeVO = facade.queryParentPoliceOfficeByID(vo);
		try {
			superior.setUp_name(policeVO.getPOLICE_OFFICE_NAME());
		} catch (Exception e) {
		}
		superior.setName(officeVO.getPOLICE_OFFICE_NAME());
		return superior;
	}

}
