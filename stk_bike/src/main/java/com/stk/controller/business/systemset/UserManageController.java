package com.stk.controller.business.systemset;

import java.io.IOException;
import java.util.List;

import javax.jws.WebParam.Mode;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.PoliceOfficeVO;
import com.sse.bikemanagement.entity.RoleVO;
import com.sse.bikemanagement.entity.UserVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.UserFacade;
import com.sse.bikemanagement.info.UserInfoVO;
import com.stk.controller.base.BaseController;
import com.stk.util.UuidUtil;

@Controller
@RequestMapping(value = "/userManage")
public class UserManageController extends BaseController {

	/*
	 * 查询所有用户信息
	 */
	@RequestMapping(value = "/userManageList")
	public ModelAndView userManageList(Page page) throws Exception {
		List<UserInfoVO> userInfoList = FacadeFactory.getUserFacade().queryAllUsers(page, new UserVO());
		ModelAndView mv = this.getModelAndView();
		mv.addObject("page", page);
		mv.addObject("list", userInfoList);
		mv.setViewName("business/systemSet/userManage/userManageList");
		return mv;

	}
	/**
	 * 跳转到用户管理编辑页
	 * 
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/userManagePage")
	public String userManageForm(Model model,UserVO userVO) throws Exception {
		UserInfoVO userInfoVO=FacadeFactory.getUserFacade().queryUserByID(userVO);
		List<RoleVO> roleVoList=FacadeFactory.getRoleFacade().queryAllRole();
		List<PoliceOfficeVO> policeList=FacadeFactory.getPoliceOfficeFacade().queryAllPoliceOffice();
		model.addAttribute("roleVoList", roleVoList);
		model.addAttribute("userInfoVO", userInfoVO);
		model.addAttribute("policeList", policeList);
		model.addAttribute("oper", "edit");
		return "business/systemSet/userManage/userManageForm";
	}

	/*
	 * 跳转到用户管理详情页
	 * */
	@RequestMapping(value="/userDetailPage")
	public String userDetailPage(Model model,UserVO userVO) throws Exception{
		UserInfoVO userInfoVO=FacadeFactory.getUserFacade().queryUserByID(userVO);
		List<RoleVO> roleVoList=FacadeFactory.getRoleFacade().queryAllRole();
		List<PoliceOfficeVO> policeList=FacadeFactory.getPoliceOfficeFacade().queryAllPoliceOffice();
		model.addAttribute("roleVoList", roleVoList);
		model.addAttribute("userInfoVO", userInfoVO);
		model.addAttribute("policeList", policeList);
		return "business/systemSet/userManage/userManageDetail";
	}
	
	/*
	 *跳转到用户管理新建页
	 */
	@RequestMapping(value = "/addUserPage")
	public String addUserPage(Model model) throws IOException, Exception {
		List<RoleVO> roleVoList=FacadeFactory.getRoleFacade().queryAllRole();
		List<PoliceOfficeVO> policeList=FacadeFactory.getPoliceOfficeFacade().queryAllPoliceOffice();
		model.addAttribute("policeList", policeList);
		model.addAttribute("roleVoList", roleVoList);
		model.addAttribute("oper", "add");
		return "business/systemSet/userManage/userManageForm";
	}


	/*
	 * 新建用户
	 */
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	@ResponseBody
	public Boolean addUser(UserVO userVO) throws IOException, Exception {
		userVO.setUSER_ID(UuidUtil.get32UUID());
		boolean flag = FacadeFactory.getUserFacade().addUser(userVO);
		return flag;
	}

	/*
	 * 编辑用户
	 * */
	
	@RequestMapping(value="/editUser", method = RequestMethod.POST)
	@ResponseBody
	public Boolean editUser(Model model, UserVO userVO) throws IOException, Exception{
		boolean flag=FacadeFactory.getUserFacade().modifyUser(userVO);
		model.addAttribute("oper", "edit");
		return flag;
		
	}
	
	/*
	 * 删除用户
	 * 
	 **/
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
	@ResponseBody
	public Boolean deleteUser(UserVO userVO) throws Exception {
		UserFacade userFacade;
		boolean flag = false;
		userFacade = FacadeFactory.getUserFacade();
		flag = userFacade.deleteUser(userVO);
		return flag;
	}

}
