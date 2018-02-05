package com.dyne.maven.system.dao;

import java.util.List;
import java.util.Map;

import com.dyne.maven.system.po.Module;
import com.dyne.maven.system.po.User;

public interface ModuleMapper {
   
    int insertSelective(Module record);

    Module selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Module record);

    // 根据人员查询菜单
    List<Module> selectMenuByUser(User user);
    // 获取当前角色下的模块以及查询全部模块
    List<Map<String,Object>> getRoleModule(Long id);
    // 根据模块id查出模块
    Module selectModuleById(Long id);
    // 查询所有的模块（菜单树）
    List<Map<String,Object>> selectAllModule();
    // 根据id修改模块
    int updateByPrimaryKey(Module module);
    // 添加模块
    int insert(Module module);
    // 根据id删除模块
    int deleteByPrimaryKey(Long id);
    //根据id修改父节点
    int updateBaseIdByPrimaryKey(Module module);
}
