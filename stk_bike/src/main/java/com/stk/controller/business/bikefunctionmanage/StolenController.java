package com.stk.controller.business.bikefunctionmanage;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.BikeVO;
import com.sse.bikemanagement.entity.LostBikeVO;
import com.sse.bikemanagement.entity.OwnerVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.facade.BikeFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.LostBikeFacade;
import com.sse.bikemanagement.facade.LowPowerBikeFacade;
import com.sse.bikemanagement.info.BikeInfoVO;
import com.sse.bikemanagement.info.LostBikeInfoVO;
import com.stk.controller.base.BaseController;

@Controller
@RequestMapping(value = "/stolen/")
// 被盗车辆管理
public class StolenController extends BaseController {
	@RequestMapping(value = "select")
	public ModelAndView select(Page page, LostBikeVO lostBikeVO, OwnerVO ownerVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		LostBikeFacade bikeFacade = FacadeFactory.getLostBikeFacade();
		List<LostBikeInfoVO> stolenList = bikeFacade.queryLostBike(page, lostBikeVO, ownerVO);
		// 根据车辆id查询车辆信息
		// for (int i = 0; i < stolenList.size(); i++) {
		// LowPowerBikeFacade fa = FacadeFactory.getLowPowerBikeFacade();
		// BikeVO BikeVO = new BikeVO();
		// BikeVO.setBIKE_EID(stolenList.get(i).getLostBikeVO().getLOST_BIKE_EID());
		// BikeInfoVO bikeinfovo = fa.queryBikeInfo(BikeVO);
		// stolenList.get(i).getLostBikeVO().setOWNER_ID(bikeinfovo.getOwnerVO().getOWNER_NAME());
		// 截取字符串
		// }
		mv.addObject("stolenList", stolenList);
		mv.addObject("page", page);
		mv.setViewName("business/bikefunctionmanage/stolenManager");
		return mv;
	}
}
