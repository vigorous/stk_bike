package com.stk.controller.business.bikefunctionmanage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.BikeVO;
import com.sse.bikemanagement.entity.BrandVO;
import com.sse.bikemanagement.entity.LostBikeVO;
import com.sse.bikemanagement.entity.OwnerVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.PoliceOfficeVO;
import com.sse.bikemanagement.entity.PoliceVO;
import com.sse.bikemanagement.entity.RegisterVO;
import com.sse.bikemanagement.entity.UserVO;
import com.sse.bikemanagement.facade.BikeFacade;
import com.sse.bikemanagement.facade.BrandFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.PoliceFacade;
import com.sse.bikemanagement.info.BikeInfoVO;
import com.stk.controller.base.BaseController;
import com.stk.domain.system.User;
import com.stk.util.Const;
import com.stk.util.UuidUtil;

@Controller
@RequestMapping(value = "/bike/")
// 车辆管理
public class BikeController extends BaseController {
	@RequestMapping(value = "select")
	public ModelAndView select(Page page, BikeVO bikeVO,OwnerVO ownerVO,RegisterVO registerVO,PoliceOfficeVO policeOfficeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		BikeFacade bf = FacadeFactory.getBikeFacade();
		List<BikeInfoVO> list = bf.queryBikeInfoByPage(page, bikeVO,ownerVO,registerVO,policeOfficeVO);
		mv.addObject("list", list);
		mv.addObject("page", page);
		mv.addObject("bikeEid",bikeVO.getBIKE_EID());
		mv.addObject("bikeNo",bikeVO.getBIKE_NO());
		mv.addObject("bikeType",bikeVO.getBIKE_TYPE());
		mv.addObject("bikeName",ownerVO.getOWNER_NAME());
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
	//编辑车辆信息
	@RequestMapping(value = "editbike")
	public ModelAndView editbike(BikeVO bikeVO) throws Exception{
		BikeFacade bf = FacadeFactory.getBikeFacade();
		BikeInfoVO li=bf.queryBikeInfoByBikeID(bikeVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", li);
		mv.setViewName("business/bikefunctionmanage/addBike");
		return mv;
	}
	//查看详情
	@RequestMapping(value = "selectbike")
	public ModelAndView selectbike(BikeVO bikeVO) throws Exception{
		BikeFacade bf = FacadeFactory.getBikeFacade();
		BikeInfoVO li=bf.queryBikeInfoByBikeID(bikeVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", li);
		mv.setViewName("business/bikefunctionmanage/bikeMsg");
		return mv;
	}
	// 添加车辆
	@RequestMapping(value = "addBikeInfo")
	@ResponseBody
	public Boolean addBikeInfo(BikeVO bikeVO, OwnerVO ownerVO, RegisterVO registerVO) throws Exception {
		Boolean bo = true;
		BikeFacade bf = FacadeFactory.getBikeFacade();
		String BIKE_ID=UuidUtil.get32UUID();
		String OWNER_ID=UuidUtil.get32UUID();
		bikeVO.setBIKE_ID(BIKE_ID);
		ownerVO.setOWNER_ID(OWNER_ID);
		registerVO.setREGISTER_ID(UuidUtil.get32UUID());
		registerVO.setBIKE_ID(BIKE_ID);
		registerVO.setOWNER_ID(OWNER_ID);
		registerVO.setPOLICE_OFFICE_ID("cb0ced786c1642c89c74b99a4c0b8ffb");
		bikeVO.setBIKE_STATUS("00");
		bikeVO.setBIKE_FLAG("00");
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
	@ResponseBody
	public Boolean modifyBikeInfo(BikeVO bikeVO, OwnerVO ownerVO, RegisterVO registerVO) throws Exception {
		Boolean bo = true;
		registerVO.setPOLICE_OFFICE_ID("cb0ced786c1642c89c74b99a4c0b8ffb");
		bikeVO.setBIKE_STATUS("00");
		bikeVO.setBIKE_FLAG("00");
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
		UserVO user = (UserVO) session.getAttribute(Const.SESSION_USER);
		PoliceFacade policeFacade = FacadeFactory.getPoliceFacade();
		list = policeFacade.queryPoliceByPoliceOfficeID("cb0ced786c1642c89c74b99a4c0b8ffb");
		return list;
	}
	//根据经办人ID查询经办人所有信息
	@RequestMapping(value = "queryPoliceByID/{id}")
	@ResponseBody
	public PoliceVO  queryPoliceByID(@PathVariable("id") String id,PoliceVO vo) throws Exception {
		PoliceFacade policeFacade = FacadeFactory.getPoliceFacade();
		vo.setPOLICE_ID(id);
		PoliceVO PoliceVO = policeFacade.queryPoliceByID(vo);
		return PoliceVO;
	}
	@RequestMapping(value="dcExcel",method=RequestMethod.GET)  
    public ModelAndView toDcExcel(ModelMap model, HttpServletRequest request,HttpServletResponse response) throws Exception, IOException{  
		ExcelServlet excelServlet=new ExcelServlet();
		excelServlet.doGet(request, response);
       ModelAndView mv = new ModelAndView();
       return mv;  
   }  
}
