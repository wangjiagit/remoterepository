package com.dyne.maven.system.service;

import java.util.List;
import java.util.Map;

import com.dyne.maven.system.po.Module;
import com.dyne.maven.system.po.User;

/**
* @ClassName: ModuleService
* @Description: 模块service
* @author 王嘉
* @date 2018年1月24日 上午10:49:14
*
*/ 
public interface ModuleService {

    /**
    * @Title: selectMenuByUser
    * @Description: 根据人员查询菜单
    * @param user
    * @return List<Module>
    * @throws
    */ 
    List<Module> selectMenuByUser(User user);

    /**
    * @Title: getRoleModule
    * @Description: 获取当前角色下的模块以及查询全部模块
    * @param id
    * @return List<Map<String,Object>>
    * @throws
    */ 
    List<Map<String,Object>> getRoleModule(Long id);
    
    /**
    * @Title: getModuleById
    * @Description: 根据模块id查出模块
    * @param id
    * @return Module
    * @throws
    */ 
    Module getModuleById(Long id);
    
    /**
    * @Title: selectAllModule
    * @Description: 查询所有的模块
    * @return List<Map<String,Object>>
    * @throws
    */ 
    List<Map<String,Object>> selectAllModule();
    
    /**
    * @Title: addModule
    * @Description: 添加模块
    * @param module
    * @return int
    * @throws
    */ 
    int addModule(Module module);
    
    /**
    * @Title: delModuleById
    * @Description: 根据id删除模块
    * @param id
    * @return int
    * @throws
    */ 
    int delModuleById(Long id);
 
    /**
    * @Title: updateBaseIdByPrimaryKey
    * @Description: 改变节点（移动模块节点）
    * @param module
    * @return int
    * @throws
    */ 
    int updateBaseIdByPrimaryKey(Module module);
}
