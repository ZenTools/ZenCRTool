package com.beingjavaguys.service;

import java.util.Hashtable;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import com.beingjavaguys.dao.UserDao;
import com.beingjavaguys.dao.UserDaoImpl;
import com.beingjavaguys.domain.User;
import com.beingjavaguys.domain.LdapEnv;;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	

	@Override
	public int addUser(User user) {
		int authenticationValue=userDao.saveUser(user);
		return authenticationValue;
	}

	@Override
	public String getUser() {
		return userDao.getUser();
	}

	
	@Override
	public boolean validateUser(String userName,String passWord) throws Exception {
		
		boolean authenticationValue=userDao.validateUser(userName, passWord);
		return authenticationValue;
		
	}
	
	@Override
	public String[] getEmpNames(String empId) throws  NamingException{
		String name[]=userDao.getEmpNames(getContext(), "(uid=" + empId + ")");
		return name;
	}
	
	private DirContext getContext() {
		Hashtable env = new Hashtable(5, 0.75f);
		env.put(Context.INITIAL_CONTEXT_FACTORY, LdapEnv.INITCTX);
		/* Specify host and port to use for directory service */
		env.put(Context.PROVIDER_URL, LdapEnv.MY_SERVICE);
		/* Set the referral property to "follow" referrals automatically */
		env.put(Context.REFERRAL, "follow");
		DirContext ctx = null;
		try {
			/* get a handle to an Initial DirContext */
			ctx = new InitialDirContext(env);

		} catch (NamingException e) {
			System.out.println("getting Context "+e.getMessage());
		}
		return ctx;
	}
}
