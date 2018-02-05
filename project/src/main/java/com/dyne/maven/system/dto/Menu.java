package com.dyne.maven.system.dto;

import java.util.List;

import com.dyne.maven.system.po.Module;

public class Menu {
    private Long moduleId;
    private String moduleName;
    private String moduleUri;
    private Long moduleBaseId;
    private String moduleCode;
    private Long orderBy;
    private String moduleDescription;
    private List<Menu> childMenu;

    public Menu() {
    }

    public Menu(Module module) {
        this.moduleId = module.getId();
        this.moduleName = module.getModuleName();
        this.moduleUri = module.getModuleUri();
        this.moduleBaseId = module.getModuleBaseid();
        this.moduleCode = module.getModuleCode();
        this.orderBy = module.getOrderby();
        this.moduleDescription = module.getModuleDescription();
    }

    public List<Menu> getChildMenu() {
        return childMenu;
    }

    public void setChildMenu(List<Menu> childMenu) {
        this.childMenu = childMenu;
    }

    public String getModuleDescription() {
        return moduleDescription;
    }

    public void setModuleDescription(String moduleDescription) {
        this.moduleDescription = moduleDescription;
    }

    public Long getModuleId() {
        return moduleId;
    }

    public void setModuleId(Long moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getModuleUri() {
        return moduleUri;
    }

    public void setModuleUri(String moduleUri) {
        this.moduleUri = moduleUri;
    }

    public Long getModuleBaseId() {
        return moduleBaseId;
    }

    public void setModuleBaseId(Long moduleBaseId) {
        this.moduleBaseId = moduleBaseId;
    }

    public String getModuleCode() {
        return moduleCode;
    }

    public void setModuleCode(String moduleCode) {
        this.moduleCode = moduleCode;
    }

    public Long getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(Long orderBy) {
        this.orderBy = orderBy;
    }

	@Override
	public String toString() {
		return "Menu [moduleId=" + moduleId + ", moduleName=" + moduleName + ", moduleUri=" + moduleUri
				+ ", moduleBaseId=" + moduleBaseId + ", moduleCode=" + moduleCode + ", orderBy=" + orderBy
				+ ", moduleDescription=" + moduleDescription + ", childMenu=" + childMenu + "]";
	}
    
    
}
