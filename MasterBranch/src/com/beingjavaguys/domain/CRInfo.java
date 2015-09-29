package com.beingjavaguys.domain;

public class CRInfo {
	private String crNum, appName,email;

	public String getCrNum() {
		return crNum == null?"":crNum;
	}

	public void setCrNum(String crNum) {
		this.crNum = crNum;
	}

	public String getAppName() {
		return appName == null?"":appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getEmail() {
		return email == null?"":email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
}
