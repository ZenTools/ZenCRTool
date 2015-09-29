package com.beingjavaguys.dao;
import com.beingjavaguys.domain.LdapEnv;
import com.beingjavaguys.domain.User;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.naming.AuthenticationException;
import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

import javax.naming.NamingException;
import org.springframework.ui.freemarker.FreeMarkerConfigurationFactoryBean;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.WebApplicationContext;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionfactory;
	
	
	

	@Override
	public int saveUser(User user) {
		//sessionfactory.getCurrentSession().saveOrUpdate(user);
		String userName=user.getFirstName();
		String password=user.getLastName();
		if(userName.equals("Admin") && password.equals("Admin"))
		return 1;
		else
			return 0;
		
	}

	@Override
	public String getUser() {
		String model="";
		
		/*@SuppressWarnings("unchecked")
		List<User> userlist = sessionfactory.getCurrentSession()
				.createCriteria(User.class).list();
		return userlist;*/
		
		return model;
	}
	
	@Override
	 public boolean validateUser(String userName ,String passWord) throws NamingException {
    	System.out.println("In validateUser(String userName ,String passWord)");
        Hashtable env = new Hashtable(5, 0.75f);
       
        boolean authenticateflag = false;
        String dn = "uid=" + userName + "," + LdapEnv.MY_SEARCHBASE;
        env.put(Context.INITIAL_CONTEXT_FACTORY, LdapEnv.INITCTX);
        /* Specify host and port to use for directory service */
        env.put(Context.PROVIDER_URL, LdapEnv.MY_SERVICE);
        /* Set the referral property to "follow" referrals automatically */
        env.put(Context.REFERRAL, "follow");
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
   		env.put(Context.SECURITY_PRINCIPAL, dn);
   		env.put(Context.SECURITY_CREDENTIALS, passWord);
        DirContext ctx = null;
        try {
            /* get a handle to an Initial DirContext */
        	
            ctx = new InitialDirContext(env);
            System.out.println("ctx---->> "+ctx);
            authenticateflag = true;
           } 
        catch (AuthenticationException authEx) {
        	
        	authenticateflag = false;
     	     
    	}
        catch (NamingException e) {
           // throw new NamingException("Error fetching jndi dir context", e);
        }
        System.out.println("authenticateflag---->> "+authenticateflag);
        return authenticateflag;
    }
	
	@Override
	public String[] getEmpNames(DirContext ctx, String filter) throws NamingException {
	    String[] name = new String[2];
	    try {
	        /* specify search constraints to search subtree */
	        SearchControls constraints = new SearchControls();
	        constraints.setSearchScope(SearchControls.SUBTREE_SCOPE);
	        /* search for all entries with given uid*/
	        NamingEnumeration results = ctx.search(LdapEnv.MY_SEARCHBASE,filter, constraints);
	        /* for each entry print out name + all attrs and values */
	        while (results != null && results.hasMore()) {
	            SearchResult si = (SearchResult) results.next();
	            Attributes attrs = si.getAttributes();
	            if (attrs == null) {
	                System.out.println("No attributes");
	            } else {
	                /* Set the specified attribute*/
	                String retAttr1 = new String("givenName");
	                String retAttr2 = new String("sn");
	                Attribute attr1 = (Attribute) attrs.get(retAttr1);
	                Attribute attr2 = (Attribute) attrs.get(retAttr2);
	                name[0] = (String) attr1.get();
	                name[1] = (String) attr2.get();
	            }
	        }
	    } catch (NamingException e) {
	    	System.out.println("Exception occured in getEmpNames " +e.getMessage());
	        throw e;
	    }
	    return name;
	}

}
