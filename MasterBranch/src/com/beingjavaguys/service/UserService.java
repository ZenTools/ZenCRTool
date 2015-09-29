package com.beingjavaguys.service;
import java.util.HashMap;
import java.util.Set;
import java.util.Vector;

import javax.naming.NamingException;
import javax.naming.directory.DirContext;

import java.util.List;

import com.beingjavaguys.domain.User;

public interface UserService {
	public int addUser(User user);

	public String getUser();
	
	 public boolean validateUser(String userName,String passWord) throws Exception ;
	 public String[] getEmpNames(String empId) throws  NamingException;
}
