package com.beingjavaguys.dao;

import java.util.HashMap;
import java.util.Set;
import java.util.Vector;

import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

import java.util.List;

import com.beingjavaguys.domain.User;
import com.beingjavaguys.domain.LdapEnv;;;

public interface UserDao {
public int saveUser ( User user );
public String getUser();
public boolean validateUser(String userName,String passWord) throws Exception ;

public String[] getEmpNames(DirContext ctx, String filter)throws NamingException ;
}
