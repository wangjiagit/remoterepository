package com.dyne.maven.system.dao;

import java.util.HashMap;
import java.util.List;

import com.dyne.maven.system.po.Permission;
import com.dyne.maven.system.po.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Long id);

    int insertSelective(Role record);

    int updateByPrimaryKeySelective(Role record);

    // 查询角色列表
    List<Role> selectRoleList();
    // 添加角色
    int insert(Role record);
    // 根据ID查询角色信息
    Role selectByPrimaryKey(Long id);
    // 修改角色信息
    int updateByPrimaryKey(Role record);
    //批量删除角色
    int deletelRoles(Long[] ids);
    //批量删除当前角色下的权限然后批量添加
    int deletePermissionsByMap(HashMap<String,Object> map);
    int addPermissionsByMidMap(HashMap<String,Object> map);
    int addPermissionsByPidMap(HashMap<String,Object> map);
    //根据id删除角色
    public int deleteByRoleId(Long roleId);
    //根据角色id得到权限
    List<Permission> getPermissionByRoleIds(List<String> ids);
    //根据角色id添加所有权限
    public int insertPermissionByRoleIds(Role role);
    //查询所有角色
    List<Role> selectAllRole();
}