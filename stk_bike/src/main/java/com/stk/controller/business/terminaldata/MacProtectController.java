package com.stk.controller.business.terminaldata;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stk.controller.base.BaseController;
import com.stk.entity.Page;

@Controller
@RequestMapping(value="/system/tmlData")
public class MacProtectController extends BaseController {
	/**
	 * 跳转到mac布防设置页
	 * @return
	 */
	@RequestMapping("/macProtect")
	public ModelAndView macProtect(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/macProtect");
		return mv;
	}
	
	/**
	 * 跳转到mac布防弹窗编辑页
	 * @return
	 */
	@RequestMapping(value="/macProtectEdit")
	public String machineForm(){
		return "system/tmlData/macProtectEdit";
	}
}
