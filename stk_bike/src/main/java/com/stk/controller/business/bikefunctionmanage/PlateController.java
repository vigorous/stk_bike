package com.stk.controller.business.bikefunctionmanage;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.CardVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.facade.CardFacade;
import com.sse.bikemanagement.facade.FacadeFactory;

@Controller
@RequestMapping(value = "/plate/")
// 电子车牌发卡管理
public class PlateController {
	@RequestMapping(value = "select")
	public ModelAndView select(Page page, CardVO vo) throws Exception {
		ModelAndView mv = new ModelAndView();
		CardFacade cardFacade = FacadeFactory.getCardFacade();
		List<CardVO> list = cardFacade.queryCardByPage(page, vo, null, null);
		mv.addObject("li", list);
		mv.addObject("page", page);
		mv.setViewName("business/bikefunctionmanage/plateManager");
		return mv;
	}
	@RequestMapping(value="plateManagerForm")
	public ModelAndView plateManagerForm(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/bikefunctionmanage/plateManagerForm");
		return mv;
	}
}
