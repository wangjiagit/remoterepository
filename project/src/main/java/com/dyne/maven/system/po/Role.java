package com.dyne.maven.system.po;

import java.io.Serializable;
import java.util.List;

public class Role implements Serializable{
    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6793271658671408555L;

	private Long id;

    private String roleName;

    private String roleCode;

    private String roleDescription;
    
    private List<Permission> permissions;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode == null ? null : roleCode.trim();
    }

    public String getRoleDescription() {
        return roleDescription;
    }

    public void setRoleDescription(String roleDescription) {
        this.roleDescription = roleDescription == null ? null : roleDescription.trim();
    }

	public List<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + ", roleCode=" + roleCode + ", roleDescription="
				+ roleDescription + ", permissions=" + permissions + "]";
	}
    
    
}