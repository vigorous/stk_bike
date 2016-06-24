package com.stk.controller.business.terminaldata;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/system/tmlData")
public class VirIdAnalysisController extends BaseController {
	/**
	 * 跳转到虚拟身份关联分析页
	 * @return
	 */
	@RequestMapping("/virIdAnalysis")
	public ModelAndView virIdAnalysis(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/virIdAnalysis");
		return mv;
	}
}
