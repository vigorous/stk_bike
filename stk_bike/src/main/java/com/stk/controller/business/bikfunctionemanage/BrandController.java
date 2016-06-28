package com.stk.controller.business.bikfunctionemanage;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.dao.BrandDAO;
import com.sse.bikemanagement.entity.BrandVO;
import com.sse.bikemanagement.facade.BrandFacade;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.stk.controller.base.BaseController;
import com.stk.entity.UuidUtil;
@Controller
@RequestMapping(value="/brand/")
//品牌管理
public class BrandController extends BaseController{
	private static BrandFacade bf=new BrandFacade();
	@RequestMapping(value="select")
	public ModelAndView select() throws Exception{
		//BrandFacade brandFacade = FacadeFactory.getBrandFacade();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("business/bikfunctionemanage/brandManager");
		return mv;
	}
	/**
	 * 跳转到品牌管理添加页面
	 * @return
	 */
	@RequestMapping(value="brandManagerForm")
	public String add(){
		BrandVO brandVO =new BrandVO();
		return "business/bikfunctionemanage/brandManagerForm";
	}
	@RequestMapping(value="save",method = RequestMethod.POST)
	@ResponseBody
	public Boolean  save(BrandVO bv) throws Exception{
		bv.setBRAND_ID(UuidUtil.get32UUID());
		Boolean bo = true;
		try {
			bf=FacadeFactory.getBrandFacade();
			bo = bf.addBrand(bv);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bo;
	}
}
