package com.stk.controller.business.systemset;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.MenuVO;
import com.sse.bikemanagement.entity.Page;
import com.sse.bikemanagement.entity.RoleVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.MenuFacade;
import com.sse.bikemanagement.facade.RoleFacade;
import com.sse.bikemanagement.info.RoleInfoVO;
import com.stk.controller.base.BaseController;
import com.stk.util.UuidUtil;

@Controller
@RequestMapping(value="/roleManage")
public class RoleManageController extends BaseController {
	
	/**
	 * 跳转到角色管理列表页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/roleManageList")
	public ModelAndView roleManageList(Page page) throws Exception{
		RoleFacade roleFacade = FacadeFactory.getRoleFacade();
		List<RoleInfoVO> list = roleFacade.queryAllRole(page);
		ModelAndView mv = this.getModelAndView();
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("business/systemSet/roleManage/roleManageList");
		return mv;
	}
	
	/**
	 * 跳转到角色管理新建页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/addRolePage")
	public String addRolePage(Model model) throws Exception{
		String role_Id = UuidUtil.get32UUID();
		model.addAttribute("role_Id", role_Id);
		model.addAttribute("oper", "add");
		return "business/systemSet/roleManage/roleManageForm";
	}
	
	/**
	 * 跳转到角色管理详情页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/roleDetailPage")
	public String roleDetailPage(Model model, RoleVO roleVO) throws Exception{
		RoleFacade roleFacade = FacadeFactory.getRoleFacade();
		model.addAttribute("roleVO", roleVO);
		return "business/systemSet/roleManage/roleManageDetail";
	}
	
	/**
	 * 跳转到角色管理编辑页
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/editRolePage")
	public String editRolePage(Model model, RoleVO roleVO) throws Exception{
		model.addAttribute("roleVO", roleVO);
		model.addAttribute("oper", "edit");
		return "business/systemSet/roleManage/roleManageForm";
	}
	
	/**
	 * 新建角色
	 * @param roleInfoVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addRole", method = RequestMethod.POST)
	@ResponseBody
	public Boolean addRole(@RequestBody RoleInfoVO roleInfoVO) throws Exception{
		RoleFacade roleFacade = FacadeFactory.getRoleFacade();
		Boolean flag = roleFacade.addRole(roleInfoVO.getRoleVO(), roleInfoVO.getMenuVOs());
		return flag;
	}
	
	/**
	 * 编辑角色
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editRole", method = RequestMethod.POST)
	@ResponseBody
	public Boolean editRole(@RequestBody RoleInfoVO roleInfoVO) throws Exception{
		RoleFacade roleFacade = FacadeFactory.getRoleFacade();
		Boolean flag = roleFacade.modifyRole(roleInfoVO.getRoleVO(), roleInfoVO.getMenuVOs());
		return flag;
	}
	
	/**
	 * 删除角色
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteRole", method = RequestMethod.POST)
	@ResponseBody
	public Boolean deleteRole(RoleVO roleVO) throws Exception{
		RoleFacade roleFacade = FacadeFactory.getRoleFacade();
		Boolean flag = roleFacade.deleteRole(roleVO);
		return flag;
	}
	
	/**
	 * 批量删除角色
	 * @param roleVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/batchDeleteRole", method = RequestMethod.POST)
	@ResponseBody
	public Boolean batchDeleteRole(@RequestBody List<RoleVO> list) throws Exception{
		RoleFacade roleFacade = FacadeFactory.getRoleFacade();
		Boolean flag = roleFacade.deleteRole(list);
		return flag;
	}
	
	/**
	 * 查询所有菜单
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/findAllMenu", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> findAllMenu(RoleVO roleVO) throws Exception{
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		MenuFacade menuFacade = FacadeFactory.getMenuFacade();
		List<MenuVO> menuList = menuFacade.findAllMenu();
		RoleFacade roleFacade = FacadeFactory.getRoleFacade();
		List<MenuVO> checkedMenuList = roleFacade.queryMenuByRoleID(roleVO);
		if(menuList != null){
			for (MenuVO menu : menuList) {
				Map<String, Object> menuMap = new HashMap<String, Object>();
				menuMap.put("id", menu.getMENU_ID());
				menuMap.put("pId", 0);
				menuMap.put("name", menu.getMENU_NAME());
				if(roleVO.getROLE_ID() != null && checkedMenuList != null){
					for (MenuVO checkedMenu : checkedMenuList) {
						if(menu.getMENU_ID().equals(checkedMenu.getMENU_ID())){
							menuMap.put("checked", true);
							break;
						}
					}
				}
				list.add(menuMap);
				List<MenuVO> menuItemList = menu.getSubMenus();
				if(menuItemList != null){
					for (MenuVO menuItem : menuItemList) {
						Map<String, Object> menuItemMap = new HashMap<String, Object>();
						menuItemMap.put("id", menuItem.getMENU_ID());
						menuItemMap.put("pId", menuItem.getPARENT_ID());
						menuItemMap.put("name", menuItem.getMENU_NAME());
						if(roleVO.getROLE_ID() != null && checkedMenuList != null){
							for (MenuVO checkedMenu : checkedMenuList) {
								if(menuItem.getMENU_ID().equals(checkedMenu.getMENU_ID())){
									menuItemMap.put("checked", true);
									break;
								}
							}
						}
						list.add(menuItemMap);
					}
				}
			}
		}
		return list;
	}
}
