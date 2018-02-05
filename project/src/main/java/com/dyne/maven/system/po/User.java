package com.dyne.maven.system.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class User implements Serializable {
    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1874289760220856933L;

	private Long id;

    private String name;
    
    private String password;

    private String userName;

    private String sex;

    private String phone;

    private String photo;

    private String email;

    private Date createTime;
    
    private List<Module> modules;
    
    private List<String> permissionCodes;
    
    private List<Role> roles;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	public List<String> getPermissionCodes() {
		return permissionCodes;
	}

	public void setPermissionCodes(List<String> permissionCodes) {
		this.permissionCodes = permissionCodes;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", userName=" + userName + ", sex="
				+ sex + ", phone=" + phone + ", photo=" + photo + ", email=" + email + ", createTime=" + createTime
				+ ", modules=" + modules + ", permissionCodes=" + permissionCodes + ", roles=" + roles + "]";
	}
    
    
}