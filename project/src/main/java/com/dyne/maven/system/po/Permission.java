package com.dyne.maven.system.po;

import java.io.Serializable;
import java.util.List;

public class Permission implements Serializable{
    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 4013391283397548229L;

	private Long id;

    private String permissionName;

    private String permissionCode;

    private String permissionDescription;

    private Long moduleid;
    
    private Module module;
    
    private List<Role> roles;

    private List<Long> pidList;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName == null ? null : permissionName.trim();
    }

    public String getPermissionCode() {
        return permissionCode;
    }

    public void setPermissionCode(String permissionCode) {
        this.permissionCode = permissionCode == null ? null : permissionCode.trim();
    }

    public String getPermissionDescription() {
        return permissionDescription;
    }

    public void setPermissionDescription(String permissionDescription) {
        this.permissionDescription = permissionDescription == null ? null : permissionDescription.trim();
    }

    public Long getModuleid() {
        return moduleid;
    }

    public void setModuleid(Long moduleid) {
        this.moduleid = moduleid;
    }

	public Module getModule() {
		return module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	
	public List<Long> getPidList() {
		return pidList;
	}

	public void setPidList(List<Long> pidList) {
		this.pidList = pidList;
	}

	@Override
	public String toString() {
		return "Permission [id=" + id + ", permissionName=" + permissionName + ", permissionCode=" + permissionCode
				+ ", permissionDescription=" + permissionDescription + ", moduleid=" + moduleid + ", module=" + module
				+ ", roles=" + roles + ", pidList=" + pidList + "]";
	}

    
}