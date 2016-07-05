package com.stk.controller.business.bikefunctionmanage;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.LostBikeVO;
import com.sse.bikemanagement.entity.OwnerVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.LostBikeFacade;
import com.sse.bikemanagement.info.LostBikeInfoVO;
import com.stk.controller.base.BaseController;

@Controller
@RequestMapping(value = "/stolen/")
// 被盗车辆管理
public class StolenController extends BaseController {
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-DD HH:MM:SS");

	@RequestMapping(value = "select")
	public ModelAndView select(Page page, LostBikeVO lostBikeVO, OwnerVO ownerVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		LostBikeFacade bikeFacade = FacadeFactory.getLostBikeFacade();
		List<LostBikeInfoVO> stolenList = bikeFacade.queryLostBike(page, lostBikeVO, ownerVO);
		// 根据车辆id查询车辆信息
		mv.addObject("stolenList", stolenList);
		mv.addObject("page", page);
		mv.setViewName("business/bikefunctionmanage/stolenManager");
		return mv;
	}

	// 删除被盗车辆信息
	@RequestMapping(value = "deleteLostBike/{LOST_BIKE_ID}")
	@ResponseBody
	public boolean deleteLostBike(@PathVariable("LOST_BIKE_ID") String LOST_BIKE_ID, LostBikeVO lostBikeVO)
			throws Exception {
		LostBikeFacade bikeFacade = FacadeFactory.getLostBikeFacade();
		lostBikeVO.setLOST_BIKE_ID(LOST_BIKE_ID);
		boolean flag = bikeFacade.deleteLostBike(lostBikeVO);
		return flag;
	}
}
