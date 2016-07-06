package com.stk.controller.business.machinemanage;

import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.MacMachineVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.PlaceVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.stk.controller.base.BaseController;
import com.stk.util.PageData;

@Controller
@RequestMapping(value = "/placeManage")
public class PlaceManageController extends BaseController {

	/**
	 * 跳转到场所管理列表页
	 * 
	 * @return
	 * @throws Exception
	 * @throws IOException
	 */
	@RequestMapping(value = "/placeManageList")
	public ModelAndView placeManageList(Page page) throws IOException, Exception {
		PageData pageData = new PageData(this.getRequest());
		String placeNo = pageData.getString("PLACE_NO");
		String placeName = pageData.getString("PLACE_NAME");
		PlaceVO placeVO = new PlaceVO();
		placeVO.setPLACE_NO(placeNo);
		placeVO.setPLACE_NAME(placeName);
		List<PlaceVO> placeList = FacadeFactory.getPlaceFacade().queryPlaceByPage(page, placeVO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("page", page);
		mav.addObject("placeList", placeList);
		mav.setViewName("business/machineManage/placeManage/placeManageList");
		return mav;
	}

	/*
	 * 跳转到场所管理编辑页
	 * */
	@RequestMapping(value="placeManageForm")
	public String placeManageForm(Model model, PlaceVO policeVO) throws IOException, Exception{
		PlaceVO placeVO=FacadeFactory.getPlaceFacade().queryPlaceByID(policeVO.getPLACE_ID());
		List<MacMachineVO> macList= FacadeFactory.getPlaceFacade().queryMacMachineByPage(placeVO.getPLACE_NO());
		model.addAttribute("placeVO", placeVO);
		model.addAttribute("macList", macList);
		model.addAttribute("oper", "edit");
		return "business/machineManage/placeManage/placeMsgDialog";
	}
	
	/*
	 * 删除场所
	 */
	@RequestMapping(value = "/deletePlace", method = RequestMethod.POST)
	@ResponseBody
	public Boolean deltePlace(PlaceVO placeVO) throws IOException, Exception {
		boolean flag = FacadeFactory.getPlaceFacade().deletePlaceByID(placeVO);
		return flag;
	}

	/*
	 * 批量删除场所
	 */
	@RequestMapping(value = "/batchDeletePlace", method = RequestMethod.POST)
	@ResponseBody
	public Boolean batchDeletePlace(@RequestBody List<PlaceVO> list) throws IOException, Exception {
		boolean flag = FacadeFactory.getPlaceFacade().deleteMorePlace(list);
		return flag;

	}

}
