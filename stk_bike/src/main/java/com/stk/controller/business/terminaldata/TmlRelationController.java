package com.stk.controller.business.terminaldata;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/system/tmlData")
public class TmlRelationController extends BaseController {
	/**
	 * 跳转到终端关系数据查询页
	 * @return
	 */
	@RequestMapping("/tmlRelationQuery")
	public ModelAndView tmlRelationQuery(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/tmlRelationQuery");
		return mv;
	}
}
