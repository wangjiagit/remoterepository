package com.dyne.maven.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyne.maven.system.dao.PermissionMapper;
import com.dyne.maven.system.dao.RoleMapper;
import com.dyne.maven.system.po.Permission;
import com.dyne.maven.system.service.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    PermissionMapper permissionDao;
    @Autowired
    RoleMapper roleDao;

    @Override
    public List<Permission> selectPermissonByModuleID(Long id) {
        return permissionDao.selectPermissonByModuleID(id);
    }

    @Override
    public int addPermission(Permission permission) {
        // 判断是添加还是编辑修改
        Integer result = 0;
        if (null == permission.getId()) {
            result = permissionDao.addPermission(permission);
        } else {
            result = permissionDao.updatePermission(permission);
        }
        return result;
    }

    @Override
    public Permission selectPermissionById(Long id) {
        return permissionDao.selectPermissionById(id);
    }

    @Override
    public int deleteByIds(Long[] ids) {
        return permissionDao.deleteByIds(ids);
    }

    @Override
    public List<Permission> selectPermissonByModuleIDAndRoleId(Map<String, Object> map) {
        return permissionDao.selectPermissonByModuleIDAndRoleId(map);
    }

    @Override
    public List<Permission> selectByPermissionModuleIdList(Map<String, Object> pageMap) {
        return permissionDao.selectByPermissionModuleIdList(pageMap);
    }

    @Override
    public int updateRoleAndPermission(Long[] addIds, Long[] delIds, Long roleId) {
        Integer result = 0;
        try {
            Integer resultDel = 0;
            Integer resultAdd = 0;
            if (null != delIds && 0 < delIds.length) {
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("delIds", delIds);
                map.put("roleId", roleId);
                // 第一步先删除
                resultDel = roleDao.deletePermissionsByMap(map);
            }
            if (null != addIds && 0 < addIds.length) {
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("addIds", addIds);
                map.put("roleId", roleId);
                // 第二步保存操作后的iD数组
                resultAdd = roleDao.addPermissionsByPidMap(map);
            }
            if (0 < resultDel || 0 < resultAdd) {
                result = 1;
            }
        } catch (Exception e) {
            throw new RuntimeException();
        }
        return result;
    }

    /*
     * 给角色添加所有的权限
     */
    @Override
    public String addRoleAllPermission(String id, Long roleId) {
        int insertResult = 0;
        String result = "false";
        // 按角色删除旧权限
        roleDao.deleteByRoleId(roleId);
        // 转换long类型的数组
        if (null != id && "" != id) {
            String[] str1 = id.split(",");
            Long[] ids = new Long[str1.length];
            for (int i = 0; i < str1.length; i++) {
                ids[i] = Long.valueOf(str1[i]);
            }

            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("addIds", ids);
            map.put("roleId", roleId);
            // 第二步保存操作后的iD数组
            insertResult = roleDao.addPermissionsByMidMap(map);
        }


        if (insertResult > 0) {
            result = "success";
        }
        return result;
    }



}
