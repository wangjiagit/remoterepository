package com.dyne.maven.system.po;

import java.io.Serializable;
import java.util.List;

public class Module implements Serializable {
    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -8571584600588348602L;

	private Long id;

    private String moduleName;

    private String moduleUri;

    private Long moduleBaseid;

    private String moduleCode;

    private Long orderby;

    private String moduleDescription;
    
    private List<Permission> permissions;
    
    private List<Module> moduleList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName == null ? null : moduleName.trim();
    }

    public String getModuleUri() {
        return moduleUri;
    }

    public void setModuleUri(String moduleUri) {
        this.moduleUri = moduleUri == null ? null : moduleUri.trim();
    }

    public Long getModuleBaseid() {
        return moduleBaseid;
    }

    public void setModuleBaseid(Long moduleBaseid) {
        this.moduleBaseid = moduleBaseid;
    }

    public String getModuleCode() {
        return moduleCode;
    }

    public void setModuleCode(String moduleCode) {
        this.moduleCode = moduleCode == null ? null : moduleCode.trim();
    }

    public Long getOrderby() {
        return orderby;
    }

    public void setOrderby(Long orderby) {
        this.orderby = orderby;
    }

    public String getModuleDescription() {
        return moduleDescription;
    }

    public void setModuleDescription(String moduleDescription) {
        this.moduleDescription = moduleDescription == null ? null : moduleDescription.trim();
    }

	public List<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}

	
	public List<Module> getModuleList() {
		return moduleList;
	}

	public void setModuleList(List<Module> moduleList) {
		this.moduleList = moduleList;
	}

	@Override
	public String toString() {
		return "Module [id=" + id + ", moduleName=" + moduleName + ", moduleUri=" + moduleUri + ", moduleBaseid="
				+ moduleBaseid + ", moduleCode=" + moduleCode + ", orderby=" + orderby + ", moduleDescription="
				+ moduleDescription + ", permissions=" + permissions + ", moduleList=" + moduleList + "]";
	}


    
    
}