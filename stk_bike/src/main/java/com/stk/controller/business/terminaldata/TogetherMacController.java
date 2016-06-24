package com.stk.controller.business.terminaldata;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/system/tmlData")
public class TogetherMacController extends BaseController {
	/**
	 * 跳转到同行终端MAC查询页
	 * @return
	 */
	@RequestMapping("/togetherMacQuery")
	public ModelAndView togetherMacQuery(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/togetherMacQuery");
		return mv;
	}
}
