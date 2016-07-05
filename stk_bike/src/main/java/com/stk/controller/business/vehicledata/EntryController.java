package com.stk.controller.business.vehicledata;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.MachineVO;
import com.sse.bikemanagement.entity.MonitorBikeVO;
import com.sse.bikemanagement.entity.MonitorMachineVO;
import com.sse.bikemanagement.entity.MonitorRuleVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.PoliceOfficeVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.MonitorRuleFacade;
import com.sse.bikemanagement.facade.PoliceOfficeFacade;
import com.sse.bikemanagement.info.MonitorRuleInfoVO;

//布防设置
@Controller
@RequestMapping(value = "/entry/")
public class EntryController {
	@RequestMapping(value = "select")
	public ModelAndView select(Page page) throws Exception {
		ModelAndView mv = new ModelAndView();
		MonitorRuleFacade facade = FacadeFactory.getMonitorRuleFacade();
		List<MonitorRuleInfoVO> monitorList = facade.queryMonitorRuleInfoByPage(page);

		// 查询所有公安局名称
		PoliceOfficeFacade policeOfficeFacade = FacadeFactory.getPoliceOfficeFacade();
		List<PoliceOfficeVO> policeList = policeOfficeFacade.queryAllPoliceOffice();
		mv.addObject("policeList", policeList);
		mv.addObject("monitorList", monitorList);
		mv.addObject("page", page);
		mv.setViewName("business/vehicledata/entry");
		return mv;
	}

	/**
	 * 跳转到品牌管理添加页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "entryForm")
	public String add() {
		return "business/vehicledata/entryForm";
	}

	// 添加布防
	@RequestMapping(value = "addMonitorRuleInfo")
	@ResponseBody
	public boolean addMonitorRuleInfo(MonitorRuleVO monitorRuleVO, MonitorMachineVO monitorMachineVOList,
			MonitorBikeVO monitorBikeVOList) throws Exception {
		MonitorRuleFacade facade = FacadeFactory.getMonitorRuleFacade();
		List<MonitorMachineVO> listmonitor = new ArrayList<MonitorMachineVO>();
		List<MonitorBikeVO> listbike = new ArrayList<MonitorBikeVO>();
		listmonitor.add(monitorMachineVOList);
		listbike.add(monitorBikeVOList);
		facade.addMonitorRuleInfo(monitorRuleVO, listmonitor, listbike);
		return false;
	}

	// 查询所有公安局名称
	@RequestMapping(value = "queryAllPoliceOffice")
	@ResponseBody
	public List<PoliceOfficeVO> queryAllPoliceOffice() throws Exception {
		// 查询所有公安局名称
		PoliceOfficeFacade policeOfficeFacade = FacadeFactory.getPoliceOfficeFacade();
		List<PoliceOfficeVO> policeList = policeOfficeFacade.queryAllPoliceOffice();
		return policeList;
	}

	// 根据公安局ID查询机具
	// 查询所有公安局名称
	@RequestMapping(value = "queryMachineByPoliceOffceID")
	@ResponseBody
	public List<MachineVO> queryMachineByPoliceOffceID(PoliceOfficeVO vo) throws Exception {
		// 查询所有公安局名称
		MonitorRuleFacade facade = FacadeFactory.getMonitorRuleFacade();
		List<MachineVO> policeList = facade.queryMachineByPoliceOffceID(vo);
		System.out.println(policeList.size());
		return policeList;
	}

}