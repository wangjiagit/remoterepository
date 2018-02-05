package com.dyne.maven.system.service;

import java.util.List;

import com.dyne.maven.system.po.Role;

/**
* @ClassName: RoleService
* @Description: 角色Service
* @author 王嘉
* @date 2018年1月24日 上午10:51:05
*
*/ 
public interface RoleService {

    /**
    * @Title: selectRoleList
    * @Description: 查询角色列表
    * @return List<Role>
    * @throws
    */ 
    List<Role> selectRoleList();
    
    /**
    * @Title: insert
    * @Description: 添加角色
    * @param record
    * @return int
    * @throws
    */ 
    int insert(Role record);
    
    /**
    * @Title: selectByPrimaryKey
    * @Description: 根据ID查询角色信息
    * @param id
    * @return Role
    * @throws
    */ 
    Role selectByPrimaryKey(Long id);
    
    /**
    * @Title: updateByPrimaryKey
    * @Description: 修改角色信息
    * @param record
    * @return int
    * @throws
    */ 
    int updateByPrimaryKey(Role record);
   
    /**
    * @Title: deletelRoles
    * @Description: 批量删除角色
    * @param ids
    * @return int
    * @throws
    */ 
    int deletelRoles(Long[] ids);
 
    /**
    * @Title: selectALLrole
    * @Description: 查询所有角色
    * @return List<Role>
    * @throws
    */ 
    List<Role> selectALLrole();
}
