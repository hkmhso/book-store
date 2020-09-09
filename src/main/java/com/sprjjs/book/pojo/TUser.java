package com.sprjjs.book.pojo;

import java.io.Serializable;

public class TUser implements Serializable{
	private static final long serialVersionUID = -8141893558610357515L;

	private String phone;

    private String uname;

    private String upwd;

    private String email;

    private Integer role;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd == null ? null : upwd.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

	@Override
	public String toString() {
		return "TUser [phone=" + phone + ", uname=" + uname + ", upwd=" + upwd + ", email=" + email + ", role=" + role
				+ "]";
	}
    
}