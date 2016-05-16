package com.stk.service.system.menu;

import java.util.List;
import com.sse.bikemanagement.entity.MenuVO;

public interface MenuService {
	/**
	 * 查询所有一级菜单
	 * @return List<MenuVO>
	 * @throws Exception
	 */
	public List<MenuVO> queryFirstMenu() throws Exception;
	/**
	 * 根据一级菜单查询二级子菜单
	 * @param menuVO
	 * @return List<MenuVO>
	 * @throws Exception
	 */
	public List<MenuVO> querySecondMenu(MenuVO menuVO) throws Exception;
}
