package com.stk.controller.business.systemset;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.DistrictVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.facade.DistrictFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.info.DistrictInfoVO;
import com.stk.controller.base.BaseController;
import com.stk.util.UuidUtil;

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
		List<DistrictInfoVO> list = districtFacade.queryAllDistrict(page);
		ModelAndView mv = this.getModelAndView();
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("business/systemSet/areaManage/areaManageList");
		return mv;
	}
	
	/**
	 * 跳转到区域管理新建页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/addAreaPage")
	public String addAreaPage(Model model) throws Exception{
		DistrictFacade districtFacade = FacadeFactory.getDistrictFacade();
		List<DistrictVO> districtList = districtFacade.queryAllDistrict();
		model.addAttribute("districtList", districtList);
		model.addAttribute("oper", "add");
		return "business/systemSet/areaManage/areaManageForm";
	}
	
	/**
	 * 跳转到区域管理详情页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/areaDetailPage")
	public String areaDetailPage(Model model, DistrictVO districtVO) throws Exception{
		DistrictFacade districtFacade = FacadeFactory.getDistrictFacade();
		districtVO = districtFacade.queryDistrictByID(districtVO);
		List<DistrictVO> districtList = districtFacade.queryAllDistrict();
		model.addAttribute("districtVO", districtVO);
		model.addAttribute("districtList", districtList);
		return "business/systemSet/areaManage/areaManageDetail";
	}
	
	/**
	 * 跳转到区域管理编辑页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/editAreaPage")
	public String editAreaPage(Model model, DistrictVO districtVO) throws Exception{
		DistrictFacade districtFacade = FacadeFactory.getDistrictFacade();
		districtVO = districtFacade.queryDistrictByID(districtVO);
		List<DistrictVO> districtList = districtFacade.queryAllDistrict();
		model.addAttribute("districtVO", districtVO);
		model.addAttribute("districtList", districtList);
		model.addAttribute("oper", "edit");
		return "business/systemSet/areaManage/areaManageForm";
	}
	
	/**
	 * 新建区域
	 * @param districtVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addArea", method = RequestMethod.POST)
	@ResponseBody
	public Boolean addArea(DistrictVO districtVO) throws Exception{
		districtVO.setDISTRICT_ID(UuidUtil.get32UUID());
		DistrictFacade districtFacade = FacadeFactory.getDistrictFacade();
		Boolean flag = districtFacade.addDistrict(districtVO);
		return flag;
	}
	
	/**
	 * 编辑区域
	 * @param districtVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editArea", method = RequestMethod.POST)
	@ResponseBody
	public Boolean editArea(DistrictVO districtVO) throws Exception{
		DistrictFacade districtFacade = FacadeFactory.getDistrictFacade();
		Boolean flag = districtFacade.modifyDistrict(districtVO);
		return flag;
	}
	
	/**
	 * 删除区域
	 * @param districtVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteArea", method = RequestMethod.POST)
	@ResponseBody
	public Boolean deleteArea(DistrictVO districtVO) throws Exception{
		DistrictFacade districtFacade = FacadeFactory.getDistrictFacade();
		Boolean flag = districtFacade.deleteDistrict(districtVO);
		return flag;
	}
	
	/**
	 * 批量删除区域
	 * @param districtVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/batchDeleteArea", method = RequestMethod.POST)
	@ResponseBody
	public Boolean batchDeleteArea(@RequestBody List<DistrictVO> list) throws Exception{
		DistrictFacade districtFacade = FacadeFactory.getDistrictFacade();
		Boolean flag = districtFacade.deleteMoreDistrict(list);
		return flag;
	}
	
	/**
	 * 验证区域编号是否存在
	 * @param districtVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/isExistAreaNo", method = RequestMethod.POST)
	@ResponseBody
	public Boolean isExistAreaNo(DistrictVO districtVO) throws Exception{
		DistrictFacade districtFacade = FacadeFactory.getDistrictFacade();
		List<DistrictVO> districtList = districtFacade.queryAllDistrict();
		Boolean flag = false;
		for (DistrictVO district : districtList) {
			if(district.getDISTRICT_NO().equals(districtVO.getDISTRICT_NO())){
				flag = true;
				return flag;
			}
		}
		return flag;
	}
}
