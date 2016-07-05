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
import com.sse.bikemanagement.entity.PoliceVO;
import com.sse.bikemanagement.entity.UserVO;
import com.sse.bikemanagement.facade.CardFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.stk.controller.base.BaseController;
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
		mv.setViewName("business/bikefunctionmanage/plateManager");
		return mv;
	}

	@RequestMapping(value = "plateManagerForm")
	public ModelAndView plateManagerForm() throws Exception {
		List<CardVO> policeList = null;
		PoliceVO vos;
		ModelAndView mv = new ModelAndView();
		// 获取session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		UserVO user = (UserVO) session.getAttribute(Const.SESSION_USER);
		CardFacade cardFacade = FacadeFactory.getCardFacade();
		// 获取警局所属的经销商ID
		CardVO cov = new CardVO();
		Page page = new Page();
		policeList = cardFacade.queryCardByPage(page, cov, null, null);
		mv.addObject("policeList", policeList);
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
		String APPLY_NUM = pd.getString("APPLY_NUM");
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
		vo.setAPPLY_NUM(Integer.parseInt(APPLY_NUM));
		vo.setAUTH_ORG_ID(AUTH_ORG_ID);
		CardFacade card = FacadeFactory.getCardFacade();
		// 根据经办人id查询公安信息
		boolean flag = card.addCard(vo);
		return flag;
	}

}
