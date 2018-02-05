package com.dyne.maven.system.service;

import java.util.List;
import java.util.Map;

import com.dyne.maven.system.po.Permission;

public interface PermissionService {

    /**
    * @Title: selectPermissonByModuleID
    * @Description: 根据模块ID查询权限
    * @param id
    * @return List<Permission>
    * @throws
    */ 
    List<Permission> selectPermissonByModuleID(Long id);

    /**
    * @Title: addPermission
    * @Description: 添加权限
    * @param permission
    * @return int
    * @throws
    */ 
    int addPermission(Permission permission);

    /**
    * @Title: selectPermissionById
    * @Description: 根据权限ID查询权限详细信息
    * @param id
    * @return Permission
    * @throws
    */ 
    Permission selectPermissionById(Long id);

    /**
    * @Title: deleteByIds
    * @Description: 批量删除
    * @param ids
    * @return int
    * @throws
    */ 
    int deleteByIds(Long[] ids);

    /**
    * @Title: selectPermissonByModuleIDAndRoleId
    * @Description: 根据模块id和角色id查询权限
    * @param map
    * @return List<Permission>
    * @throws
    */ 
    List<Permission> selectPermissonByModuleIDAndRoleId(Map<String, Object> map);

    /**
    * @Title: selectByPermissionModuleIdList
    * @Description: 根据模块id 查询权限
    * @param pageMap
    * @return List<Permission>
    * @throws
    */ 
    List<Permission> selectByPermissionModuleIdList(Map<String, Object> pageMap);

    /**
    * @Title: updateRoleAndPermission
    * @Description: 批量修改角色拥有的权限
    * @param addIds
    * @param delIds
    * @param roleId
    * @return int
    * @throws
    */ 
    int updateRoleAndPermission(Long[] addIds, Long[] delIds, Long roleId);

    /**
    * @Title: addRoleAllPermission
    * @Description: 给角色添加所有的权限
    * @param id
    * @param roleId
    * @return String
    * @throws
    */ 
    String addRoleAllPermission(String id, Long roleId);
}
