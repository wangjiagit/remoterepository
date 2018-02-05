package com.dyne.maven.system.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyne.maven.system.dao.ModuleMapper;
import com.dyne.maven.system.po.Module;
import com.dyne.maven.system.po.User;
import com.dyne.maven.system.service.ModuleService;

@Service
public class ModuleServiceImpl implements ModuleService {
    @Autowired
    ModuleMapper moduleDao;

    @Override
    public List<Module> selectMenuByUser(User user) {
        return moduleDao.selectMenuByUser(user);
    }

    // 获取当前角色下的模块以及查询全部模块
    @Override
    public List<Map<String, Object>> getRoleModule(Long id) {
        return moduleDao.getRoleModule(id);
    }

    @Override
    public Module getModuleById(Long id) {
        return moduleDao.selectModuleById(id);
    }

    @Override
    public List<Map<String, Object>> selectAllModule() {
        return moduleDao.selectAllModule();
    }

    @Override
    public int addModule(Module module) {
        if (module.getId() != null) {
            // 判断是否为根节点 （跟目录ID为0）
            if (module.getId() == 0) {
                module.setModuleBaseid(null);
            }
            /*
             * if(module.getModuleShortcutMenu()==1){
             * moduleMapper.updateShortcutMenu(module); }
             */
            return moduleDao.updateByPrimaryKey(module);
        } else {
            return moduleDao.insert(module);
        }
    }

    @Override
    public int delModuleById(Long id) {
        return moduleDao.deleteByPrimaryKey(id);
    };

    @Override
    public int updateBaseIdByPrimaryKey(Module module) {
        return moduleDao.updateBaseIdByPrimaryKey(module);
    }
}
