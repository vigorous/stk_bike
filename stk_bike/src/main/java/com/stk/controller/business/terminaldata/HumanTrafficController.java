package com.stk.controller.business.terminaldata;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/system/tmlData")
public class HumanTrafficController extends BaseController {
	/**
	 * 跳转到人流量统计页
	 * @return
	 */
	@RequestMapping("/humanTraffic")
	public ModelAndView humanTraffic(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/humanTraffic");
		return mv;
	}
}