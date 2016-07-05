package com.stk.controller.business.systemset;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.LogVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.info.LogInfoVO;
import com.stk.controller.base.BaseController;
import com.stk.util.DateUtil;
import com.stk.util.PageData;

@Controller
@RequestMapping(value = "/systemLog")
public class SystemLogController extends BaseController {

	/*
	 * 查询日志信息
	 */
	@RequestMapping(value = "/systemLogList")
	public ModelAndView systemLogList(Page page) throws Exception {
		Date startDate = null;
		Date endDate = null;
		PageData pd = new PageData(this.getRequest());
		String content = pd.getString("OPERATION_CONTENT");
		String startTime=pd.getString("startTime");
		String endTime=pd.getString("endTime");
		LogVO logVO=new LogVO();
		logVO.setOPERATION_CONTENT(content);
		if (startTime == null) {
			startDate = DateUtil.fomatDates("2015-01-01");
		}else{
			startDate = DateUtil.fomatDates(startTime);
		}
		if (endTime == null) {
			endDate = DateUtil.fomatDates("2099-01-01");
		}else{
			endDate = DateUtil.fomatDates(endTime); 
		}
		ArrayList<LogInfoVO> logList = FacadeFactory.getLogFacade().queryAllLog(page, logVO, startDate, endDate);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("page", page);
		modelAndView.addObject("logList", logList);
		modelAndView.setViewName("business/systemSet/logManage/logManageList");
		return modelAndView;
	}

}
