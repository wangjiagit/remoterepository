package com.dyne.maven.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyne.maven.system.dao.RoleMapper;
import com.dyne.maven.system.po.Role;
import com.dyne.maven.system.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleMapper roleDao;

    @Override
    public List<Role> selectRoleList() {
        return roleDao.selectRoleList();
    }

    @Override
    public int insert(Role record) {
        return roleDao.insert(record);
    }

    @Override
    public Role selectByPrimaryKey(Long id) {
        return roleDao.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKey(Role record) {
        return roleDao.updateByPrimaryKey(record);
    }

    @Override
    public int deletelRoles(Long[] ids) {
        return roleDao.deletelRoles(ids);
    }

    // 查询所有角色
    @Override
    public List<Role> selectALLrole() {
        return roleDao.selectAllRole();
    }

}
