package com.dyne.maven.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dyne.maven.base.controller.BaseController;
import com.dyne.maven.base.result.JsonResult;
import com.dyne.maven.system.po.User;
import com.dyne.maven.system.service.UserService;
import com.dyne.maven.util.Constants;

@Controller
@RequestMapping("/manage")
public class LoginController extends BaseController{
    @Autowired
    private UserService userService;
    
    /**
     * 跳转至登录页面
     *
     * @return
     */
    @RequestMapping("goLogin")
    public ModelAndView goLogin() {
        return new ModelAndView("login");
    }
    
    /**
     * 判断登录成功
     * @param user
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView loginUser(HttpServletRequest request,User user) {
    	ModelAndView mav = new ModelAndView();
        User userInfo= userService.loginUser(user);
        if (null != userInfo ) {
        	request.getSession().setAttribute(Constants.WEB_USER_SESSION, userInfo);
            mav.setViewName("main");
        } else {
            mav.setViewName("login");
        }
        return mav;
    }
    
    /**
     * 加载主页面
     * @return
     */
    @RequestMapping("/welcome")
    public ModelAndView welcome() {
        return new ModelAndView("welcome");
    }
    
    // 注销登录
    @RequestMapping(value="/logoff", produces = "text/html;charset=UTF-8")
    public @ResponseBody JsonResult logoff(HttpServletRequest  request){
        HttpSession session = request.getSession(false);//防止创建Session 
        session = request.getSession();
        session.removeAttribute(Constants.WEB_USER_SESSION);
        return renderSuccess();
    }
}
