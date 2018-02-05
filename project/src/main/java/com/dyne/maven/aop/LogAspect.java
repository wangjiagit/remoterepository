package com.dyne.maven.aop;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSONObject;
import com.dyne.maven.system.po.User;
import com.dyne.maven.util.Constants;

/**
* @ClassName: LogAspect
* @Description: TODO
* @author 王嘉
* @date 2018年1月21日 下午8:58:37
*
*/ 
@Aspect
@Component
public class LogAspect {
    // 本地异常日志记录对象 
    private static final Logger logger = LoggerFactory.getLogger(LogAspect. class);
    
    /**
    * @Title: doLog
    * @Description: TODO
    * @param joinPoint void
    * @throws
    */ 
    @Before("@annotation(com.dyne.maven.annotation.Log)")
    public void doLog(JoinPoint joinPoint) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
        HttpSession session = request.getSession();
        
        //读取session中的用户  
        User user=(User)session.getAttribute(Constants.WEB_USER_SESSION);

        String params = "";
        if (joinPoint.getArgs() != null && joinPoint.getArgs().length > 0) {
            for (int i = 0; i < joinPoint.getArgs().length; i++) {
                params += JSONObject.toJSONString(joinPoint.getArgs()[i]) + ";";
            }
        }
        logger.info("进入方法:{}操作人:{}操作日期:{}参数:{}",
                new Object[] { joinPoint.getTarget().getClass().getName() +"."+ joinPoint.getSignature().getName(),
                        user.getName(), new Date(), params });
    }
}
