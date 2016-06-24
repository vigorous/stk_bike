package com.stk.controller.business.terminaldata;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/system/tmlData")
public class RfidFootHoldController extends BaseController {
	/**
	 * 跳转到RFID落脚点分析页
	 * @return
	 */
	@RequestMapping("/rfidFootHold")
	public ModelAndView rfidFootHold(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/rfidFootHold");
		return mv;
	}
}
