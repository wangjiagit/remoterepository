package com.dyne.maven.system.dao;

import java.util.List;
import java.util.Map;

import com.dyne.maven.system.po.Permission;

public interface PermissionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Permission record);

    int insertSelective(Permission record);

    int updateByPrimaryKey(Permission record);
    
    // 根据模块ID查询权限
 	List<Permission> selectPermissonByModuleID(Long id);
    //添加权限
    int addPermission (Permission permission);
    // 根据权限ID查询权限详细信息
    Permission selectPermissionById(Long id);
    // 批量删除
    int deleteByIds(Long[] ids);
    //根据模块id和角色id查询权限
    List<Permission> selectPermissonByModuleIDAndRoleId(Map<String,Object> map);
    //伪分页查询权限
    List<Permission> selectByPermissionModuleIdList(Map<String,Object> pageMap);
    // 修改权限
    int updatePermission(Permission permission);
    //给角色添加所有的权限
    String addRoleAllPermission(String id,Long roleId);
}