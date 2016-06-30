package com.stk.controller.business.realalarm;

import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.StatisticsBikeVO;
import com.sse.bikemanagement.entity.UserVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.FirstPageFacade;
import com.stk.controller.base.BaseController;
import com.stk.entity.Page;
import com.stk.util.Const;
import com.stk.util.DateUtil;
import com.stk.util.PageData;
import com.stk.util.Tools;

@Controller
@RequestMapping(value="/survey")
public class SurveyController extends BaseController {
	
	/**
	 * 跳转到概况列表页
	 * @return
	 */
	@RequestMapping(value="/surveyList")
	public ModelAndView surveyList(Page page)throws Exception{
		
		FirstPageFacade f = FacadeFactory.getFirstPageFacade();
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		UserVO user = (UserVO)session.getAttribute(Const.SESSION_USER);
		
		PageData pd = new PageData(this.getRequest());
		
		Date sTime = null;
		Date eTime = null;
		String startTime = pd.getString("START_TIME");
		String endTime = pd.getString("END_TIME");
		String bikeSource = pd.getString("BIKE_SOURCE");
		
		//如果日期为空，则设置一个默认值
		if(Tools.notEmpty(startTime)){
			sTime = DateUtil.fomatDate(startTime);
		}else{
			sTime = DateUtil.fomatDate("1970-01-01");
		}
		if(Tools.notEmpty(endTime)){
			eTime = DateUtil.fomatDate(endTime);
		}else{
			eTime = DateUtil.fomatDate("2030-01-01");
		}
		
		List<StatisticsBikeVO> list = f.statisticsBikeByPoliceOffice(user.getPOLICE_OFFICE_ID(), sTime, eTime, bikeSource);
		ModelAndView mv = this.getModelAndView();
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("business/realAlarm/survey/surveyList");
		return mv;
	}
}
