package com.stk.controller.business.terminaldata;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/system/tmlData")
public class EplateByMacController extends BaseController {
	/**
	 * 跳转到终端MAC找电子车牌页
	 * @return
	 */
	@RequestMapping("/togetherByMac")
	public ModelAndView togetherByMac(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/togetherByMac");
		return mv;
	}
}
