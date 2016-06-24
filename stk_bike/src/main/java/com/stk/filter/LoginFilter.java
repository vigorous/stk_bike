package com.stk.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stk.controller.base.BaseController;
import com.stk.util.Const;

/**
 * 登录验证过滤器
 */
public class LoginFilter extends BaseController implements Filter {

	/**
	 * 初始化
	 */
	public void init(FilterConfig fc) throws ServletException {
		//FileUtil.createDir("d:/FH/topic/");
	}
	
	public void destroy() {

	}

	@SuppressWarnings("unused")
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		logBefore(logger, "LoginFilter start...");
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		StringBuffer requestURL = request.getRequestURL();
//		if(requestURL){
//			HttpSession session = request.getSession();
//			Object object = session.getAttribute(Const.SESSION_USER);
//		}
		chain.doFilter(req, res); // 调用下一过滤器
		logAfter(logger);
	}

}
