package com.stk.controller.system.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sse.bikemanagement.entity.MenuVO;
import com.sse.bikemanagement.entity.UserVO;
import com.sse.bikemanagement.facade.FacadeFactory;
import com.sse.bikemanagement.facade.MenuFacade;
import com.stk.controller.base.BaseController;
import com.stk.domain.system.User;
import com.stk.service.system.menu.MenuService;
import com.stk.util.AppUtil;
import com.stk.util.Const;
import com.stk.util.PageData;

@Controller
// @RequestMapping(value="/loginController")
public class LoginController extends BaseController {

	@Resource(name = "menuService")
	private MenuService menuService;

	/**
	 * 跳转到登录页面
	 * 
	 * @return
	 */
	@RequestMapping("/login_toLogin")
	public ModelAndView toLogin() {
		logBefore(logger, "LoginController toLogin method");
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/admin/login");
		logAfter(logger);
		return mv;
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object login() {
		String errInfo = "success";

		logBefore(logger, "LoginController login method");
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData(this.getRequest());
		log(logger, "pd=" + pd.toString());
		// ModelAndView mv = this.getModelAndView();
		// mv.setViewName("system/admin/main");
		UserVO userVO = new UserVO();
		userVO.setUSERNAME(pd.getString("name"));
		userVO.setPASSWORD(pd.getString("password"));
		try {
			boolean isLogin = FacadeFactory.getLoginFacade().login(userVO);
			if (isLogin) {
				Subject currentUser = SecurityUtils.getSubject();
				Session session = currentUser.getSession();
				session.setAttribute(Const.SESSION_USER, userVO);
			} else {
				errInfo = "usererror";
			}
		} catch (Exception e) {
			errInfo = "身份验证失败！";
		}
		// shiro加入身份验证
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(pd.getString("name"), pd.getString("password"));
		try {
			subject.login(token);
		} catch (AuthenticationException e) {
			errInfo = "身份验证失败！";
		}
		logAfter(logger);
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**
	 * 访问首页
	 * 
	 * @param changeMenu
	 * @return
	 */
	@RequestMapping("/main/{changeMenu}")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu) {
		logBefore(logger, "LoginController login_index method " + changeMenu);
		ModelAndView mv = this.getModelAndView();
		try {
			MenuFacade menuFacade = FacadeFactory.getMenuFacade();
			MenuVO menuVO = new MenuVO();
			UserVO userVO = new UserVO();
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			UserVO user = (UserVO) session.getAttribute(Const.SESSION_USER);
			userVO.setROLE_ID(user.getROLE_ID());
			// 车辆管理
			if ("01".equals(changeMenu)) {
				// 获取菜单信息
				List<MenuVO> list = menuFacade.findRFIDMenu(menuVO, userVO);
				mv.addObject("list", list);
				mv.addObject("menu_type", "01");
				mv.setViewName("system/admin/main");
				// 智能终端数据分析
			} else if (("02".equals(changeMenu))) {
				// 获取菜单信息
				List<MenuVO> list = menuFacade.findMACMenu(menuVO, userVO);
				mv.addObject("list", list);
				mv.addObject("menu_type", "02");
				mv.setViewName("system/admin/main");
			}
		} catch (Exception e) {
			logDebug(logger, e);
		}
		logAfter(logger);
		return mv;
	}

	@RequestMapping("/test")
	public ModelAndView test() {
		logBefore(logger, "LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger, "pd=" + pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/admin/test");
		logAfter(logger);
		return mv;
	}

	@RequestMapping("/change")
	public ModelAndView change() {
		logBefore(logger, "LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger, "pd=" + pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/admin/change");
		logAfter(logger);
		return mv;
	}

	/**
	 * 进入tab标签
	 * 
	 * @return
	 */
	@RequestMapping(value = "/tab")
	public String tab() {
		return "system/admin/tab";
	}

	/**
	 * 进入首页后的默认页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login_default")
	public String defaultPage() {
		return "system/admin/default";
	}
}
