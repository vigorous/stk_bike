package com.stk.controller.business.bikefunctionmanage;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.BikeVO;
import com.sse.bikemanagement.entity.BrandVO;
import com.sse.bikemanagement.entity.LostBikeVO;
import com.sse.bikemanagement.entity.OwnerVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.PoliceVO;
import com.sse.bikemanagement.entity.RegisterVO;
import com.sse.bikemanagement.facade.BikeFacade;
import com.sse.bikemanagement.facade.BrandFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.PoliceFacade;
import com.stk.controller.base.BaseController;
import com.stk.domain.system.User;
import com.stk.util.Const;
import com.stk.util.UuidUtil;

@Controller
@RequestMapping(value = "/bike/")
// 车辆管理
public class BikeController extends BaseController {
	@RequestMapping(value = "select")
	public ModelAndView select(Page page, BikeVO vo) throws Exception {
		ModelAndView mv = new ModelAndView();
		BikeFacade bf = FacadeFactory.getBikeFacade();
		List<BikeVO> list = bf.queryBikeByPage(page, vo);
		mv.addObject("list", list);
		mv.addObject("page", page);
		mv.setViewName("business/bikefunctionmanage/bikeManager");
		return mv;
	}

	@RequestMapping(value = "/bikeMsg")
	public String machineForm() {
		return "dialog/bikeMsg";
	}

	@RequestMapping(value = "addbike")
	public ModelAndView addbike() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("business/bikefunctionmanage/addBike");
		return mv;
	}

	// 添加车辆
	@RequestMapping(value = "addBikeInfo")
	public Boolean addBikeInfo(BikeVO bikeVO, OwnerVO ownerVO, RegisterVO registerVO) throws Exception {
		bikeVO.setBIKE_ID(UuidUtil.get32UUID());
		Boolean bo = true;
		BikeFacade bf = FacadeFactory.getBikeFacade();
		bo = bf.addBikeInfo(bikeVO, ownerVO, registerVO);
		return bo;
	}

	// 删除车辆
	@RequestMapping(value = "deleteBikeInfo")
	public Boolean deleteBikeInfo(BikeVO bikeVO, OwnerVO ownerVO, RegisterVO registerVO, LostBikeVO lostBikeVO)
			throws Exception {
		Boolean bo = true;
		BikeFacade bf = FacadeFactory.getBikeFacade();
		bo = bf.deleteBikeInfo(bikeVO, ownerVO, registerVO, lostBikeVO);
		return bo;
	}

	// 修改车辆信息
	@RequestMapping(value = "modifyBikeInfo")
	public Boolean modifyBikeInfo(BikeVO bikeVO, OwnerVO ownerVO, RegisterVO registerVO) throws Exception {
		Boolean bo = true;
		BikeFacade bf = FacadeFactory.getBikeFacade();
		bo = bf.modifyBikeInfo(bikeVO, ownerVO, registerVO);
		return bo;
	}

	// 查询所有品牌返回list对象
	@RequestMapping(value = "selectBrandVO")
	@ResponseBody
	public List<BrandVO> selectBrand() throws Exception {
		BrandFacade bf = FacadeFactory.getBrandFacade();
		List<BrandVO> li = bf.queryAllBrand();
		return li;
	}

	// 根据公安局ID查询经办人信息
	@RequestMapping(value = "queryPoliceByPoliceOfficeID")
	@ResponseBody
	public List<PoliceVO> queryPoliceByPoliceOfficeID() throws Exception {
		List<PoliceVO> list = null;
		// 获取session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		PoliceFacade policeFacade = FacadeFactory.getPoliceFacade();
		list = policeFacade.queryPoliceByPoliceOfficeID("cb0ced786c1642c89c74b99a4c0b8ffb");
		return list;
	}

}
