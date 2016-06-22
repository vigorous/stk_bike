package com.stk.service.system.menu.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.sse.bikemanagement.entity.MenuVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.MenuFacade;
import com.stk.service.system.menu.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

	private static MenuFacade mf = new MenuFacade();
	
	@Override
	public List<MenuVO> queryFirstMenu() throws Exception {
		mf = FacadeFactory.getMenuFacade();
//		List<MenuVO> list = mf.selectAllMenu();
		List<MenuVO> parentMenuVO = new ArrayList<MenuVO>();
		
		//获取一级菜单
//		for(MenuVO menuVO : list){
//			//如果菜单等级长度为2代表是一级菜单
//			if(menuVO.getMenu_Level().length() == 2){
//				parentMenuVO.add(menuVO);
//			}
//		}
		return parentMenuVO;
	}

	@Override
	public List<MenuVO> querySecondMenu(MenuVO menuVO) throws Exception {
		return null;
	}

}
