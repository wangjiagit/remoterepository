package com.dyne.maven.quartz;

import org.springframework.stereotype.Service;

/**
 * Created by wanglianli on 2017/11/3.
 */
@Service
public class TestTask {

    public void testJob(){
        System.out.println("我在做一个测试任务");
    }
}