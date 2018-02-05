package com.dyne.maven.system.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dyne.maven.base.controller.BaseController;
import com.dyne.maven.base.result.JsonResult;
import com.dyne.maven.system.po.Permission;
import com.dyne.maven.system.service.PermissionService;

/**
 * @ClassName: PermissionController
 * @Description: 权限controller
 * @author 王嘉
 * @date 2018年1月24日 上午10:54:10
 *
 */
@Controller
@RequestMapping("/permission")
public class PermissionController extends BaseController {

    @Autowired
    private PermissionService permissionService;

    /**
     * @Title: moduleList 
     * @Description: 跳转到权限（ztree） 
     * @return ModelAndView 
     * @throws
     */
    @RequestMapping(value = "/goPermission")
    public ModelAndView goPermission() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("manage/permission/permissionPage");
        return mav;
    }

    /**
     * @Title: getPermissionByModuleId
     * @Description:跳转到查询模块页(根据模块ID查询该模块下的权限)
     * @param id 
     * @return ModelAndView 
     * @throws
     */
    @RequestMapping(value = "/getPermissionByModuleId")
    public ModelAndView getPermissionByModuleId(Long id) {
        ModelAndView mav = new ModelAndView();
        // 查出当前模块下的权限
        List<Permission> perList = permissionService.selectPermissonByModuleID(id);
        mav.addObject("perList", perList);
        mav.addObject("moduleId", id);
        mav.setViewName("manage/permission/permissionList");
        return mav;
    }

    /**
     * @Title: gotoAddPermission
     * @Description: 跳转添加权限 
     * @param moduleId @return
     * ModelAndView @throws
     */
    @RequestMapping(value = "/gotoAddPermission")
    public ModelAndView gotoAddPermission(Long moduleId) {
        ModelAndView mav = new ModelAndView();
        Permission permission = new Permission();
        permission.setModuleid(moduleId);
        mav.addObject("permission", permission);
        mav.setViewName("manage/permission/addPermission");
        return mav;
    }

    /**
     * @Title: addPermission 
     * @Description: 添加权限
     * @param permission 
     * @return String
     * @throws
     */
    @RequestMapping(value = "/addPermission", produces = "text/html;charset=UTF-8")
    public @ResponseBody JsonResult addPermission(Permission permission) {
        // 添加或编辑权限
        permissionService.addPermission(permission);
        return renderSuccess();
    }

    /**
     * @Title: gotoEditPermission @Description: 跳转修改权限 @param id @return
     * ModelAndView @throws
     */
    @RequestMapping(value = "/gotoEditPermission")
    public ModelAndView gotoEditPermission(Long id) {
        ModelAndView mav = new ModelAndView();
        Permission permission = permissionService.selectPermissionById(id);
        mav.addObject("permission", permission);
        mav.setViewName("manage/permission/addPermission");
        return mav;
    }

    /**
     * @Title: delPermissions 
     * @Description: 批量删除权限
     * @param ids 
     * @return String 
     * @throws
     */
    @RequestMapping(value = "/delPermission", produces = "text/html;charset=UTF-8")
    public @ResponseBody JsonResult delPermissions(Long[] ids) {
        permissionService.deleteByIds(ids);
        return renderSuccess();
    }

    /**
     * @Title: getRoleAndPermissionByModuleId 
     * @Description: 添加角色和权限时跳转到查询权限页
     * @param id 模块ID 
     * @param roleId 角色ID 
     * @return ModelAndView 
     * @throws
     */
    @RequestMapping(value = "/getRoleAndPermissionByModuleId")
    public ModelAndView getRoleAndPermissionByModuleId(Long id, Long roleId) {
        ModelAndView mav = new ModelAndView();
        // 查询角色拥有的权限
        // 创建Map集合
        Map<String, Object> map = new HashMap<>();
        map.put("moduleId", id);
        map.put("roleId", roleId);
        // 查出当前模块下当前角色的权限
        List<Permission> per = permissionService.selectPermissonByModuleIDAndRoleId(map);
        List<Long> pid = new ArrayList<>();
        for (int i = 0; i < per.size(); i++) {
            pid.add(per.get(i).getId());
        }
        Map<String, Object> pageMap = new HashMap<>();
        pageMap.put("moduleId", id);
        List<Permission> permissionList = permissionService.selectByPermissionModuleIdList(pageMap);
        for (int i = 0; i < permissionList.size(); i++) {
            permissionList.get(i).setPidList(pid);
        }
        mav.addObject("moduleId", id);
        mav.addObject("roleId", roleId);
        mav.addObject("pidList", pid);
        mav.addObject("permissionList", permissionList);
        mav.setViewName("manage/role/rolePermissionList");
        return mav;
    }

    /**
    * @Title: addRoleAndPermission
    * @Description: 批量给用户加权限
    * @param addIds 添加的权限id
    * @param delIds 删除的权限id
    * @param roleId 角色id
    * @return JsonResult
    * @throws
    */ 
    @RequestMapping(value = "/addRoleAndPermission", produces = "text/html;charset=UTF-8")
    public @ResponseBody JsonResult addRoleAndPermission(Long[] addIds, Long[] delIds, Long roleId) {
        permissionService.updateRoleAndPermission(addIds, delIds, roleId);
        return renderSuccess();
    }

    /**
    * @Title: addRoleAllPermission
    * @Description: 给定角色添加全部权限
    * @param id 模块id
    * @param roleId 角色id
    * @return String
    * @throws
    */ 
    @RequestMapping(value = "/addRoleAllPermission", produces = "text/html;charset=UTF-8")
    public @ResponseBody String addRoleAllPermission(String id, Long roleId) {
        String result = permissionService.addRoleAllPermission(id, roleId);
        if ("success".equals(result)) {
            return "redirect:/role/getRole.do";
        } else {
            return null;
        }
    }

}
