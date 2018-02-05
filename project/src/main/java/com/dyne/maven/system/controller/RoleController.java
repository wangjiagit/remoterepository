package com.dyne.maven.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dyne.maven.base.controller.BaseController;
import com.dyne.maven.base.result.JsonResult;
import com.dyne.maven.system.po.Role;
import com.dyne.maven.system.service.RoleService;


/**
* @ClassName: RoleController
* @Description: 角色Controller
* @author 王嘉
* @date 2018年1月24日 上午10:50:17
*
*/ 
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController{
    @Autowired
    private RoleService roleService;
    
    /**
     * 查询角色列表
     * @return
     */
    @RequestMapping("/selectRoleList")
    public ModelAndView selectRoleList() {
    	ModelAndView mav = new ModelAndView();
        List<Role> roleList = roleService.selectRoleList();

        //获取角色的长度
        int num = roleList.size();
        //存值
        mav.addObject("num",num);
        mav.addObject("roleList", roleList);
        mav.setViewName("manage/role/roleList");
        return mav;
    }
    
    /**
     * 跳转添加角色页面
     * @return
     */
    @RequestMapping("/goAddRole")
    public ModelAndView goAddRole() {
    	ModelAndView mav = new ModelAndView();
        mav.setViewName("manage/role/addRole");
        return mav;
    }
    
    /**
    * @Title: addRole
    * @Description: 添加角色
    * @param role
    * @return JsonResult
    * @throws
    */ 
    @RequestMapping(value="/addRole",produces = "text/html;charset=UTF-8")
    public @ResponseBody JsonResult addRole(Role role){
        //保存角色
        int  addResult = roleService.insert(role);
        //当保色角色成功后返回执行条数，为1则成功，其他为失败
        if (1 == addResult) {
            return renderSuccess();// 保存成功
        } else {
            return renderError();// 保存失败
        }
    }
    
    /**
     * 跳转到编辑角色(编辑角色权限)
     * @param id 角色Id
     * @return
     */
    @RequestMapping(value="/goUpdateRole")
    public ModelAndView goUpdateRole(Long id){
        ModelAndView mav = new ModelAndView();
        mav.addObject("roleId", id);
        //跳转页面
        mav.setViewName("manage/role/roleModuleList");
        return mav;
    }
    
    /**
    * @Title: delRoles
    * @Description: 删除角色(批量删除)
    * @param ids
    * @return String
    * @throws
    */ 
    @RequestMapping(value="/delRoles",produces = "text/html;charset=UTF-8")
    public @ResponseBody JsonResult delRoles(Long[] ids){
        //删除角色
        roleService.deletelRoles(ids);
        return renderSuccess();
    }
}
