package com.dyne.maven.base.result;

import java.util.HashMap;
import java.util.Map;

/**
 * Author: D.Yang
 * Email: koyangslash@gmail.com
 * Date: 16/8/31
 * Time: 下午5:50
 * Describe: 封装Json返回信息
 */
public class JsonResult {
    private boolean success;
    private String status;
    private String msg;
    private Map<String,Object> data;

    
    public JsonResult() {
        data = new HashMap<>();
    }
    
    public void put(String key,Object value) {
        data.put(key, value);
    }
    
    public Object get(String key) {
        return data.get(key);
    }

    public boolean getSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String,Object> getData() {
        return data;
    }

    public void setData(Map<String,Object> data) {
        this.data = data;
    }

}
