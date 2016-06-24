package com.stk.controller.business.terminaldata;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/system/tmlData")
public class VirtualIdController extends BaseController {
	/**
	 * 跳转到虚拟身份查询页
	 * @return
	 */
	@RequestMapping("/virtualIdQuery")
	public ModelAndView virtualIdQuery(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/virtualIdQuery");
		return mv;
	}
}
