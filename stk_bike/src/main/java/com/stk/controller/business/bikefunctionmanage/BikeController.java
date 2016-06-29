package com.stk.controller.business.bikefunctionmanage;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.sse.bikemanagement.entity.BikeVO;
import com.sse.bikemanagement.entity.LostBikeVO;
import com.sse.bikemanagement.entity.OwnerVO;
import com.sse.bikemanagement.facade.BikeFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.stk.controller.base.BaseController;
import com.stk.util.UuidUtil;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.RegisterVO;
@Controller
@RequestMapping(value="/bike/")
//车辆管理
public class BikeController extends BaseController{
	@RequestMapping(value="select")
	public ModelAndView select(Page page,BikeVO vo) throws Exception{
		ModelAndView mv=new ModelAndView();
		BikeFacade bf=FacadeFactory.getBikeFacade();
		List<BikeVO> list =bf.queryBikeByPage(page, vo);
		mv.addObject("list",list);
		mv.addObject("page", page);
		mv.setViewName("business/bikefunctionmanage/bikeManager");
		return mv;
	}
	@RequestMapping(value="/bikeMsg")
	public String machineForm(){
		return "dialog/bikeMsg";
	}
	@RequestMapping(value="addbike")
	public ModelAndView addbike(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/bikefunctionmanage/addBike");
		return mv;
	}
	@RequestMapping(value="addBikeInfo")
	public Boolean addBikeInfo (BikeVO bikeVO, OwnerVO ownerVO, RegisterVO registerVO) throws Exception{
		bikeVO.setBIKE_ID(UuidUtil.get32UUID());
		Boolean bo = true;
		BikeFacade bf=FacadeFactory.getBikeFacade();
		bo=	bf.addBikeInfo(bikeVO, ownerVO, registerVO);
		return bo;
	}
	@RequestMapping(value="deleteBikeInfo")
	public Boolean deleteBikeInfo(BikeVO bikeVO, OwnerVO ownerVO, RegisterVO registerVO,LostBikeVO lostBikeVO) throws Exception{
		Boolean bo = true;
		BikeFacade bf=FacadeFactory.getBikeFacade();
		bo=	bf.deleteBikeInfo(bikeVO, ownerVO, registerVO, lostBikeVO);
		return bo;
	}
	@RequestMapping(value="modifyBikeInfo")
	public Boolean modifyBikeInfo(BikeVO bikeVO, OwnerVO ownerVO, RegisterVO registerVO) throws Exception{
		Boolean bo = true;
		BikeFacade bf=FacadeFactory.getBikeFacade();
		bo=	bf.modifyBikeInfo(bikeVO, ownerVO, registerVO);
		return bo;
	}
}
