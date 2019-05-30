package org.jsp.app.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Users 
{
	@Id
	@Column(length=5, name="login_id")
	private String loginID;
	@Column(length=10)
	private String password;
	@Column(length=5)
	private String role;
	public Users() 
	{
		super();
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
}
