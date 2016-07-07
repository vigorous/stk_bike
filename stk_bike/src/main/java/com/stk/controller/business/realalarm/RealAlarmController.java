package com.stk.controller.business.realalarm;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.RealTimeAlarmFacade;
import com.sse.bikemanagement.info.RealTimeAlarmInfoVO;
import com.stk.controller.base.BaseController;

@Controller
@RequestMapping(value="/realAlarm")
public class RealAlarmController extends BaseController {
	
	/**
	 * 跳转到实时报警列表页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/realAlarmList")
	public ModelAndView realAlarmList(Page page) throws Exception{
		RealTimeAlarmFacade realTimeAlarmFacade = FacadeFactory.getRealTimeAlarmFacade();
		List<RealTimeAlarmInfoVO> list = realTimeAlarmFacade.queryRealTimeAlarmInfoByPage(page);
		ModelAndView mv = this.getModelAndView();
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("business/realAlarm/realAlarm/realAlarmList");
		return mv;
	}
}
