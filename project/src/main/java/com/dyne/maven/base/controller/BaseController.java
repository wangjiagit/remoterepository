package com.dyne.maven.base.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.dyne.maven.base.editor.DateEditor;
import com.dyne.maven.base.result.JsonResult;
import com.dyne.maven.system.po.User;
import com.dyne.maven.util.Constants;

public class BaseController {
	 /**
     * 日期转换
     * @param binder
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new DateEditor());
    }
    
    /**
    * @Title: getUser
    * @Description: 获取当前登录用户
    * @return User
    * @throws
    */ 
    public User getUser(){
        return  (User)getRequest().getSession().getAttribute(Constants.WEB_USER_SESSION);
    }
    
    /**
    * @Title: getRequest
    * @Description: 获取Request
    * @return HttpServletRequest
    * @throws
    */ 
    public HttpServletRequest getRequest() {
    	return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
    }
    
    /**
     * 渲染失败数据
     *
     * @return result
     */
    protected JsonResult renderError() {
        JsonResult result = new JsonResult();
        result.setSuccess(false);
        result.setStatus("500");
        return result;
    }

    /**
     * 渲染失败数据（带消息）
     *
     * @param msg 需要返回的消息
     * @return result
     */
    protected JsonResult renderError(String msg) {
        JsonResult result = renderError();
        result.setMsg(msg);
        return result;
    }

    /**
     * 渲染成功数据
     *
     * @return result
     */
    protected JsonResult renderSuccess() {
        JsonResult result = new JsonResult();
        result.setSuccess(true);
        result.setStatus("200");
        return result;
    }

    /**
     * 渲染成功数据（带信息）
     *
     * @param msg 需要返回的信息
     * @return result
     */
    protected JsonResult renderSuccess(String msg) {
        JsonResult result = renderSuccess();
        result.setMsg(msg);
        return result;
    }

    /**
     * 渲染成功数据（带数据）
     *
     * @param obj 需要返回的对象
     * @return result
     */
    protected JsonResult renderSuccess(Map<String,Object> data) {
        JsonResult result = renderSuccess();
        result.setData(data);
        return result;
    }
}
