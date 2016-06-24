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
import com.stk.controller.base.BaseController;
import com.stk.domain.system.User;
import com.stk.service.system.menu.MenuService;
import com.stk.util.AppUtil;
import com.stk.util.Const;
import com.stk.util.PageData;

@Controller
//@RequestMapping(value="/loginController")
public class LoginController extends BaseController {
	
	@Resource(name="menuService")
	private MenuService menuService;
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("/login_toLogin")
	public ModelAndView toLogin(){
		logBefore(logger,"LoginController toLogin method");
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/admin/login");
		logAfter(logger);
		return mv;
	}
	
	/**
	 * 用户登录
	 * @return
	 */
	@RequestMapping(value="/login" , produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object login(){
		String errInfo = "success";
		
		logBefore(logger,"LoginController login method");
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		//ModelAndView mv = this.getModelAndView();
		//mv.setViewName("system/admin/main");
	    UserVO userVO = new UserVO();
	    userVO.setUSERNAME(pd.getString("name"));
	    userVO.setPASSWORD(pd.getString("password"));
		try {
			boolean isLogin = FacadeFactory.getUserFacade().login(userVO);
			if(isLogin){
				Subject currentUser = SecurityUtils.getSubject();  
				Session session = currentUser.getSession();
				//测试用的User对象
				User user = new User();
				user.setId(1);
				user.setName(pd.getString("name"));
				user.setPassword(pd.getString("password"));
				session.setAttribute(Const.SESSION_USER,user);
			}else{
				errInfo = "usererror";
			}
		} catch (Exception e) {
			errInfo = "身份验证失败！";
		}
		//shiro加入身份验证
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
	 * @param changeMenu
	 * @return
	 */
	@RequestMapping("/main/{changeMenu}")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu){
		logBefore(logger,"LoginController login_index method " + changeMenu);
		ModelAndView mv = this.getModelAndView();
		
		try {
			//获取菜单信息
			//List<MenuVO> firstMenuList = menuService.queryFirstMenu();
			
			if("index".equals(changeMenu)){
				mv.setViewName("system/admin/main");
				//mv.addObject("firstMenuList",firstMenuList);
			}
		} catch (Exception e) {
			logDebug(logger,e);
		}
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/test")
	public ModelAndView test(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/admin/test");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/change")
	public ModelAndView change(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/admin/change");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/nearHot")
	public ModelAndView nearHot(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/nearHotQuery");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/tmlSelect")
	public ModelAndView tmlSelect(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/tmlSelectQuery");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/humanTraffic")
	public ModelAndView humanTraffic(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/humanTraffic");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/virtualId")
	public ModelAndView virtualId(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/virtualIdQuery");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/tmlTrance")
	public ModelAndView tmlTrance(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/tmlTranceQuery");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/togetherMac")
	public ModelAndView togetherMac(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/togetherMacQuery");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/macProtect")
	public ModelAndView macProtect(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/macProtect");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/relations")
	public ModelAndView relations(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/relationsQuery");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/tmlRelation")
	public ModelAndView tmlRelation(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/tmlRelationQuery");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/macByEplate")
	public ModelAndView macByEplate(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/togetherByEplate");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/eplateByMac")
	public ModelAndView eplateByMac(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/togetherByMac");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/macFootHold")
	public ModelAndView macFoot(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/macFootHold");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/rfidFootHold")
	public ModelAndView rfidFoot(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/rfidFootHold");
		logAfter(logger);
		return mv;
	}
	
	@RequestMapping("/virtualIdAnalysis")
	public ModelAndView virtualIdAnalysis(){
		logBefore(logger,"LoginController test method");
		PageData pd = new PageData(this.getRequest());
		log(logger,"pd="+pd.toString());
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/tmlData/virtualIdAnalysis");
		logAfter(logger);
		return mv;
	}
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "system/admin/tab";
	}
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 */
	@RequestMapping(value="/login_default")
	public String defaultPage(){
		return "system/admin/default";
	}
}
