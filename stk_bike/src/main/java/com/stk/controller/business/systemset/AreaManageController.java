package com.stk.controller.business.systemset;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.DistrictVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.facade.DistrictFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.stk.controller.base.BaseController;

@Controller
@RequestMapping(value="/areaManage")
public class AreaManageController extends BaseController {
	
	/**
	 * 跳转到区域管理列表页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/areaManageList")
	public ModelAndView areaManageList(Page page) throws Exception{
		DistrictFacade districtFacade = FacadeFactory.getDistrictFacade();
		List<DistrictVO> list = districtFacade.queryAllDistrict(page);
		ModelAndView mv = this.getModelAndView();
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("business/systemSet/areaManage/areaManageList");
		return mv;
	}
	
	/**
	 * 跳转到区域管理编辑页
	 * @return
	 */
	@RequestMapping(value="/areaManageForm")
	public String areaManageForm(){
		return "business/systemSet/areaManage/areaManageForm";
	}
	
	@RequestMapping(value="/addArea")
	public Boolean addArea(DistrictVO districtVO) throws Exception{
		DistrictFacade districtFacade = FacadeFactory.getDistrictFacade();
		Boolean flag = districtFacade.addDistrict(districtVO);
		return flag;
	}
}
