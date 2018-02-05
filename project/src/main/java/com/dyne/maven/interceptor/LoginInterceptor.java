package com.dyne.maven.interceptor;

import com.dyne.maven.util.Constants;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception ex)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		Object sessionUser = request.getSession().getAttribute(Constants.WEB_USER_SESSION);
		if (sessionUser == null) {
			response.sendRedirect(request.getContextPath() + "/manage/goLogin.do");
			return false;
		}
		return true;
	}
}