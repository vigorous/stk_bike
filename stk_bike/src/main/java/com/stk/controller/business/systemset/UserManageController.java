package com.stk.controller.business.systemset;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.UserVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.UserFacade;
import com.stk.controller.base.BaseController;
import com.stk.entity.Page;
import com.stk.util.UuidUtil;

@Controller
@RequestMapping(value = "/userManage")
public class UserManageController extends BaseController {

	/**
	 * 跳转到用户管理列表页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userManageList")
	public ModelAndView userManageList(Model model, Integer currentPage, Integer showCount) {
		// 造数据
		Page page = new Page();
		if (currentPage == null) {
			page.setCurrentPage(1);
		} else {
			page.setCurrentPage(currentPage);
		}
		if (showCount == null) {
			page.setShowCount(10);
		} else {
			page.setShowCount(showCount);
		}
		page.setTotalPage(10);
		page.setTotalResult(100);

		model.addAttribute("page", page);
		ModelAndView mav = this.getModelAndView();
		mav.setViewName("business/systemSet/userManage/userManageList");
		return mav;
	}

	/**
	 * 跳转到用户管理编辑页
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userManageForm")
	public String userManageForm() {
		return "business/systemSet/userManage/userManageForm";
	}

	/*
	 * 查询所有角色
	 * */
	@RequestMapping(value="/addUserPage")
	public String addUserPage(Model model) throws IOException, Exception{
		FacadeFactory.getRoleFacade().queryAllRole(null);
		return null;
	}
	
	
	/*
	 * 添加用户
	 * 
	 */
	@RequestMapping(value = "/addUser")
	@ResponseBody
	public Boolean addUser(UserVO userVO) throws IOException, Exception {
	    userVO.setUSER_ID(UuidUtil.get32UUID());
		boolean flag=FacadeFactory.getUserFacade().addUser(userVO);
		return flag;
	}

	/*
	 * 删除用户
	 * 
	 **/
	@RequestMapping(value = "/deleteUser")
	@ResponseBody
	public Boolean deleteUser(UserVO userVO) throws Exception {
		UserFacade userFacade;
		boolean flag = false;
		userFacade = FacadeFactory.getUserFacade();
		flag = userFacade.deleteUser(userVO);
		return flag;
	}

}
