package com.dyne.maven.system.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dyne.maven.base.controller.BaseController;
import com.dyne.maven.base.result.JsonResult;
import com.dyne.maven.system.po.Module;
import com.dyne.maven.system.service.ModuleService;

/**
* @ClassName: ModuleController
* @Description: 模块controller
* @author 王嘉
* @date 2018年1月24日 上午10:49:46
*
*/ 
@Controller
@RequestMapping("/module")
public class ModuleController extends BaseController{
	 @Autowired
    private ModuleService moduleService;


    
    /**
    * @Title: goModuleList
    * @Description: 显示模块列表页面
    * @return ModelAndView
    * @throws
    */ 
    @RequestMapping(value="/getMenu")
    public ModelAndView goModuleList(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("manage/module/moduleList");
        return mav;
    }

    /**
     * 通过模块id查询模块详细信息
     * @param id 当前模块id
     * @return
     */
    @RequestMapping(value="/getModuleById")
    public ModelAndView getModuleById(Long id){
        ModelAndView mav = new ModelAndView();
        Module module = moduleService.getModuleById(id);
        mav.addObject("module", module);
        mav.setViewName("manage/module/addModule");
        return mav;
    }
	    
 
    /**
    * @Title: getAllModule
    * @Description: 查询全部模块
    * @return String
    * @throws
    */ 
    @RequestMapping(value="/getAllModule",produces = "application/json;charset=UTF-8")
    public @ResponseBody  JsonResult getAllModule(){
        List<Map<String,Object>> moduleList = moduleService.selectAllModule();
        JsonResult result = renderSuccess();
        result.put("zNodes", moduleList);
        return result;
    }
	
    /**
     * 获取当前角色下的模块以及查询全部模块
     * @param id 角色Id
     * @return
     */
    @RequestMapping(value="/getRoleModule",produces="text/html;charset=UTF-8")
    public @ResponseBody JsonResult getRoleModule(Long id){
        //获取当前角色下的模块以及查询全部模块
        List<Map<String,Object>> moduleList =  moduleService.getRoleModule(id);
        JsonResult result = renderSuccess();
        result.put("zNodes", moduleList);
        return result;
    }
    
    /**
     * 跳转添加模块页
     * @param id 当前模块id
     * @return
     */
    @RequestMapping(value="/gotoAddModule")
    public ModelAndView gotoAddModule(Long id){
        //创建视图
        ModelAndView mav = new ModelAndView();
        //创建模块对象
        Module module = new Module();
        //放入父节点id
        module.setModuleBaseid(id);
        mav.addObject("module",module);
        mav.setViewName("manage/module/addModule");
        return mav;
    }
        
    /**
     * 添加模块信息
     * @param module 模块对象
     * @return
     */
    @RequestMapping(value="/addModule",method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView addModule(Module module){
        //创建视图
        ModelAndView mav = new ModelAndView();
        //添加模块
        moduleService.addModule(module);
        mav.setViewName("redirect:getMenu");
        return mav;
    }
        
    /**
     * 删除模块
     * @param id 当前模块id
     * @return
     */
    @RequestMapping(value="/deleteModule",produces = "text/html;charset=UTF-8")
    public @ResponseBody JsonResult delModuleById(Long id){
        //删除模块
        moduleService.delModuleById(id);
        return renderSuccess();
    }
        
    /**
     * 移动模块节点
     * @param id 子节点Id
     * @param id pId
     * @return
     */
    @RequestMapping(value="/moveModule",produces = "text/html;charset=UTF-8")
    public @ResponseBody JsonResult moveModule(Long id,Long pId){
        Module  module = new Module();
    	module.setId(id);
        module.setModuleBaseid(pId);
        //修改模块节点
        moduleService.updateBaseIdByPrimaryKey(module);
        return renderSuccess();
    }
        
}
