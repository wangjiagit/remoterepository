package com.dyne.maven.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;


/**
* @ClassName: ExceptionLoggerAspect
* @Description: TODO
* @author 王嘉
* @date 2018年1月21日 下午8:35:52
*
*/
@Aspect
@Component
public class ExceptionLoggerAspect {
    // 本地异常日志记录对象 
    private static final Logger logger = LoggerFactory.getLogger(LogAspect. class); 
    
    
    /**
    * @Title: doAfterThrowing
    * @Description: TODO
    * @param joinPoint
    * @param e void
    * @throws
    */ 
    @AfterThrowing(throwing="ex",pointcut="execution(* com.dyne.maven.*.controller.*.*(..))")
    public void doAfterThrowing(JoinPoint joinPoint, Throwable ex) {
        String params = "";
        if (joinPoint.getArgs() != null && joinPoint.getArgs().length > 0) {
            for (int i = 0; i < joinPoint.getArgs().length; i++) {
                params += JSONObject.toJSONString(joinPoint.getArgs()[i]) + ";";
            }
        }
        logger.error("异常方法:{}异常代码:{}异常信息:{}参数:{}",
                new Object[] { joinPoint.getTarget().getClass().getName() + joinPoint.getSignature().getName(),
                        ex.getClass().getName(), ex.getMessage(), params });
    }
}
