package com.stk.controller.business.systemset;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.PoliceOfficeVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.PoliceFacade;
import com.sse.bikemanagement.facade.PoliceOfficeFacade;
import com.stk.controller.base.BaseController;
import com.stk.util.UuidUtil;

@Controller
@RequestMapping(value="/unitManage")
public class UnitManageController extends BaseController {
	
	/**
	 * 跳转到单位管理列表页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/unitManageList")
	public ModelAndView unitManageList(Page page) throws Exception{
		PoliceOfficeFacade policeOfficeFacade = FacadeFactory.getPoliceOfficeFacade();
		List<PoliceOfficeVO> list = policeOfficeFacade.queryAllPoliceOffice(page);
		ModelAndView mv = this.getModelAndView();
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("business/systemSet/unitManage/unitManageList");
		return mv;
	}
	
	/**
	 * 跳转到单位管理新建页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/addUnitPage")
	public String addUnitPage(Model model) throws Exception{
		PoliceFacade policeFacade = FacadeFactory.getPoliceFacade();
		model.addAttribute("oper", "add");
		return "business/systemSet/unitManage/unitManageForm";
	}
	
	/**
	 * 跳转到单位管理详情页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/unitDetailPage")
	public String unitDetailPage(Model model, PoliceOfficeVO policeOfficeVO) throws Exception{
		PoliceOfficeFacade policeOfficeFacade = FacadeFactory.getPoliceOfficeFacade();
		policeOfficeVO = policeOfficeFacade.queryPoliceOfficeByID(policeOfficeVO);
		model.addAttribute("policeOfficeVO", policeOfficeVO);
		return "business/systemSet/unitManage/unitManageDetail";
	}
	
	/**
	 * 跳转到单位管理编辑页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/editUnitPage")
	public String editUnitPage(Model model, PoliceOfficeVO policeOfficeVO) throws Exception{
		PoliceOfficeFacade policeOfficeFacade = FacadeFactory.getPoliceOfficeFacade();
		policeOfficeVO = policeOfficeFacade.queryPoliceOfficeByID(policeOfficeVO);
		PoliceFacade policeFacade = FacadeFactory.getPoliceFacade();
		model.addAttribute("policeOfficeVO", policeOfficeVO);
		model.addAttribute("oper", "edit");
		return "business/systemSet/unitManage/unitManageForm";
	}
	
	/**
	 * 新建单位
	 * @param policeOfficeVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addUnit")
	@ResponseBody
	public Boolean addUnit(PoliceOfficeVO policeOfficeVO) throws Exception{
		policeOfficeVO.setPOLICE_OFFICE_ID(UuidUtil.get32UUID());
		PoliceOfficeFacade policeOfficeFacade = FacadeFactory.getPoliceOfficeFacade();
		Boolean flag = policeOfficeFacade.addPoliceOffice(policeOfficeVO);
		return flag;
	}
	
	/**
	 * 编辑单位
	 * @param policeOfficeVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editUnit")
	@ResponseBody
	public Boolean editUnit(PoliceOfficeVO policeOfficeVO) throws Exception{
		PoliceOfficeFacade policeOfficeFacade = FacadeFactory.getPoliceOfficeFacade();
		Boolean flag = policeOfficeFacade.modifyPoliceOffice(policeOfficeVO);
		return flag;
	}
	
	/**
	 * 删除单位
	 * @param policeOfficeVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteUnit")
	@ResponseBody
	public Boolean deleteUnit(PoliceOfficeVO policeOfficeVO) throws Exception{
		PoliceOfficeFacade policeOfficeFacade = FacadeFactory.getPoliceOfficeFacade();
		Boolean flag = policeOfficeFacade.deletePoliceOffice(policeOfficeVO);
		return flag;
	}
	
	/**
	 * 验证单位编号是否存在
	 * @param policeOfficeVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/isExistUnitNo")
	@ResponseBody
	public Boolean isExistUnitNo(PoliceOfficeVO policeOfficeVO) throws Exception{
		PoliceOfficeFacade policeOfficeFacade = FacadeFactory.getPoliceOfficeFacade();
		List<PoliceOfficeVO> policeOfficeList = policeOfficeFacade.queryAllPoliceOffice();
		Boolean flag = false;
		for (PoliceOfficeVO policeOffice : policeOfficeList) {
			if(policeOffice.getPOLICE_OFFICE_NO().equals(policeOfficeVO.getPOLICE_OFFICE_NO())){
				flag = true;
				return flag;
			}
		}
		return flag;
	}
}
