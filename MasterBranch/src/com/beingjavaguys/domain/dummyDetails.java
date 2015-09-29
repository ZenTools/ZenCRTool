package com.beingjavaguys.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


public class dummyDetails {

	
 String crId=null;
 String startDate;
 String endDate;
 String crPriority;
 String crStatus;
 String App;
 
 
 
 
 
 
 


public String getEndDate() {
	return endDate;
}
public void setEndDate(String endDate) {
	this.endDate = endDate;
}
public String getApp() {
	return App;
}
public void setApp(String app) {
	App = app;
}
public String getCrStatus() {
	return crStatus;
}
public void setCrStatus(String crStatus) {
	this.crStatus = crStatus;
}
public String getCrPriority() {
	return crPriority;
}
public void setCrPriority(String crPriority) {
	this.crPriority = crPriority;
}
public String getCrId() {
	return crId;
}
public void setCrId(String crId) {
	this.crId = crId;
}
public String getStartDate() {
	return startDate;
}
public void setStartDate(String startDate) {
	this.startDate = startDate;
}
@Override
public String toString() {
	return 
			  getCrId()  + getStartDate() +"\n" ;
			
}





}