package com.stk.controller.business.vehicledata;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.BikeVO;
import com.sse.bikemanagement.entity.FocusRecordVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.FocusRecordFacade;
import com.sse.bikemanagement.info.FocusRecordInfoVO;

//报警记录查询
@Controller
@RequestMapping(value = "/police/")
public class PoliceController {
	@RequestMapping(value = "select")
	public ModelAndView select(Page page, FocusRecordVO focusRecordVO, BikeVO bikeVO, Date startTime, Date endTime)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		FocusRecordFacade facade = FacadeFactory.getFocusRecordFacade();
		List<FocusRecordInfoVO> recordList = facade.queryFocusRecordInfoByPage(page, focusRecordVO, bikeVO, startTime,
				endTime);
		mv.addObject("recordList", recordList);
		mv.addObject("page", page);
		mv.setViewName("business/vehicledata/police");
		return mv;
	}
}
