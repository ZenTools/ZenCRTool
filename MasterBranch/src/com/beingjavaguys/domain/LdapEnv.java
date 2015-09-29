package com.beingjavaguys.domain;

public class LdapEnv {



	/*
	 * Initial context implementation to use.
	 */
	    public static String INITCTX = "com.sun.jndi.ldap.LdapCtxFactory";

	/*
	 * Host name and port number of LDAP server
	 */
//	public static String MY_SERVICE = "ldap://cisco.com:3268";
	    public static String MY_SERVICE = "ldap://ldap.cisco.com:389";

	/*
	 * Subtree to search
	 */
//	public static String MY_SEARCHBASE = "cn=users, dc=dev,dc=cisco,dc=com";
	    public static String MY_SEARCHBASE = "ou=active, ou=employees, ou=people, o=cisco.com";


}