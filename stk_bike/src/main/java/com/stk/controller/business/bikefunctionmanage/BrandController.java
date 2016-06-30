
package com.stk.controller.business.bikefunctionmanage;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.BrandVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.facade.BrandFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.stk.controller.base.BaseController;
import com.stk.util.UuidUtil;

@Controller
@RequestMapping(value = "/brand/")
// 品牌管理
public class BrandController extends BaseController {
	@RequestMapping(value = "select")
	public ModelAndView select(Page page, BrandVO brandVO) throws Exception {
		BrandFacade bf = FacadeFactory.getBrandFacade();
		BrandVO vo = new BrandVO();
		List<BrandVO> li = bf.queryBrandByPage(page, vo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("li", li);
		mv.addObject("page", page);
		mv.setViewName("business/bikefunctionmanage/brandManager");
		return mv;
	}

	/**
	 * 跳转到品牌管理添加页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "brandManagerForm")
	public ModelAndView add() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("business/bikefunctionmanage/brandManagerForm");
		return mv;
	}

	@RequestMapping(value = "addBrand", method = RequestMethod.POST)
	@ResponseBody
	public Boolean addBrand(BrandVO bv) throws Exception {
		bv.setBRAND_ID(UuidUtil.get32UUID());
		Boolean bo = true;
		BrandFacade bf = FacadeFactory.getBrandFacade();
		bo = bf.addBrand(bv);
		return bo;
	}

	@RequestMapping(value = "modifyBrand/{id}", method = RequestMethod.POST)
	@ResponseBody
	public Boolean modifyBrand(@PathVariable("id") String id, BrandVO vo) throws Exception {
		Boolean bo = true;
		BrandFacade bf = FacadeFactory.getBrandFacade();
		vo.setBRAND_ID(id);
		bo = bf.modifyBrand(vo);
		return bo;
	}

	@RequestMapping(value = "deleteBrand/{id}")
	@ResponseBody
	public Boolean deleteBrand(@PathVariable("id") String id) throws Exception {
		BrandVO vo = new BrandVO();
		vo.setBRAND_ID(id);
		Boolean bo = true;
		BrandFacade bf = FacadeFactory.getBrandFacade();
		bo = bf.deleteBrand(vo);
		return bo;
	}

	@RequestMapping(value = "brandManagerForm/{id}")
	public ModelAndView end(@PathVariable("id") String id, Page page) throws Exception {
		ModelAndView mv = new ModelAndView();
		BrandFacade bf = FacadeFactory.getBrandFacade();
		BrandVO vo = bf.queryBrandByID(id);
		mv.addObject("vo", vo);
		mv.setViewName("business/bikefunctionmanage/brandManagerForm");
		return mv;
	}
}
