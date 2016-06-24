package com.stk.controller.business.terminaldata;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/system/tmlData")
public class MacFootHoldController extends BaseController {
	/**
	 * 跳转到MAC落脚点分析页
	 * @return
	 */
	@RequestMapping("/macFootHold")
	public ModelAndView macFootHold(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/macFootHold");
		return mv;
	}
}
