package com.stk.controller.business.terminaldata;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/system/tmlData")
public class MacByEplateController extends BaseController {
	/**
	 * 跳转到电子车牌找同行终端MAC页
	 * @return
	 */
	@RequestMapping("/togetherByEplate")
	public ModelAndView togetherByEplate(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/togetherByEplate");
		return mv;
	}
}