package com.beingjavaguys.controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import oracle.jdbc.OracleTypes;

import org.springframework.ui.freemarker.*;
import org.apache.commons.collections.CollectionUtils;
import org.apache.catalina.connector.Request;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
/*import org.springframework.web.context.WebApplicationContext;*/
import org.springframework.web.servlet.ModelAndView;

import com.beingjavaguys.domain.CRInfo;
import com.beingjavaguys.domain.FreemarkerTest;
import com.beingjavaguys.domain.User;
import com.beingjavaguys.sendMail.MailUtility;
import com.beingjavaguys.service.UserService;
//import org.springframework.ui.freemarker.FreeMarkerConfigurationFactoryBean;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.freemarker.*;
import org.apache.catalina.connector.Request;
import org.apache.commons.collections.CollectionUtils;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
/*import org.springframework.web.context.WebApplicationContext;*/
import org.springframework.web.servlet.ModelAndView;

import com.beingjavaguys.domain.FreemarkerTest;
import com.beingjavaguys.domain.User;

import com.beingjavaguys.sendMail.MailUtility;
import com.beingjavaguys.service.UserService;



























import freemarker.template.Template;

// import freemarker.template.Template;

@Controller
public class HomeController {

	
	@Autowired
	private WebApplicationContext mAppContext;
	
	@Autowired
	private UserService userService;


	@Autowired
	private SessionFactory sessionFactory;

	
	
	
	@RequestMapping("/register")
	public ModelAndView getRegisterForm(@ModelAttribute("user") User user,
			BindingResult result) throws SQLException {

		/*
		 * Connection con = sessionFactory.openSession().connection();
		 * CallableStatement cs =
		 * con.prepareCall("{ call CR_AUTOMATION_PACKAGE.run_cr_specific(?,?,?) }"
		 * ); cs.registerOutParameter(1, java.sql.Types.VARCHAR);
		 * cs.setString(2,"CRQ000000208074"); // first parameter index start
		 * with 1 cs.setString(3,"dhhariha@cisco.com"); // second parameter
		 * cs.execute(); // call stored procedure cs.getString(1);
		 * System.out.println("ssvshfs"+cs.execute()+cs.getString(1));
		 */

		return new ModelAndView("Register");
	}
	
	/*@RequestMapping("/dashboard")
	public ModelAndView getDashboard(@ModelAttribute("user") User user,
			BindingResult result) throws SQLException {

		
		 * Connection con = sessionFactory.openSession().connection();
		 * CallableStatement cs =
		 * con.prepareCall("{ call CR_AUTOMATION_PACKAGE.run_cr_specific(?,?,?) }"
		 * ); cs.registerOutParameter(1, java.sql.Types.VARCHAR);
		 * cs.setString(2,"CRQ000000208074"); // first parameter index start
		 * with 1 cs.setString(3,"dhhariha@cisco.com"); // second parameter
		 * cs.execute(); // call stored procedure cs.getString(1);
		 * System.out.println("ssvshfs"+cs.execute()+cs.getString(1));
		 

		return new ModelAndView("dashboard");
	}
*/
	
	@RequestMapping("/home")
	public ModelAndView getHome(@ModelAttribute("user") User user,
			BindingResult result) throws SQLException {

		/*
		 * Connection con = sessionFactory.openSession().connection();
		 * CallableStatement cs =
		 * con.prepareCall("{ call CR_AUTOMATION_PACKAGE.run_cr_specific(?,?,?) }"
		 * ); cs.registerOutParameter(1, java.sql.Types.VARCHAR);
		 * cs.setString(2,"CRQ000000208074"); // first parameter index start
		 * with 1 cs.setString(3,"dhhariha@cisco.com"); // second parameter
		 * cs.execute(); // call stored procedure cs.getString(1);
		 * System.out.println("ssvshfs"+cs.execute()+cs.getString(1));
		 */

		return new ModelAndView("home");
	}
	@RequestMapping("/saveUser")
	public ModelAndView saveUserData(@ModelAttribute("user") User user,
			BindingResult result,HttpServletRequest request) throws Exception {

		/*
		 * System.out.println(user.getFirstName()); int
		 * val=userService.addUser(user); user.setMsg("WelCome!!!");
		 */

		/*
		 * String userName=user.getFirstName(); String
		 * password=user.getLastName(); if(userName.equals("Admin") &&
		 * password.equals("Admin")) return new
		 * ModelAndView("redirect:/home.html"); else return new
		 * ModelAndView("redirect:/index.jsp");
		 */

		// System.out.println("Save User Data");

		// return new ModelAndView("redirect:/userList.html");

		// return new ModelAndView("redirect:/home.html");
		/*
		 * if(val==1) //return new ModelAndView("redirect:/validate.html");
		 * return new ModelAndView("home"); else return new
		 * ModelAndView("redirect:/index.jsp");
		 */

		String userName = user.getFirstName();
		String password = user.getLastName();
         
		 boolean val=userService.validateUser(userName, password); 
		 HttpSession session=request.getSession();
           
           session.setAttribute("name", userName);
          
           System.out.println(session);
           System.out.println(session.getAttribute("name"));
		
		if (val == true) {
			
	

		
			String name[]=userService.getEmpNames(userName);
			 System.out.println(name[0]);
			 
			String greet = "Welcome"+" "+name[0]; 
           	
			
			

			/*return new ModelAndView("dashboard", "greetings",greet);*/
			/*return new ModelAndView("dashboard");*/
		 return new ModelAndView("redirect:/dashboard.html");

		}
		// return new ModelAndView("redirect:/validate.html");

		else {

			return new ModelAndView("Register", "message", "Login Failed...");
		}

	}

	
	@RequestMapping("/crSpecific")
	public ModelAndView getCrSpecificDetails(@ModelAttribute("user") User user,
			BindingResult result,HttpServletRequest request) {
		String crNumber = user.getCrNumber();
		String email = user.getEmailId();
		String fName = user.getFirstName();
		String resultMsg;
		boolean bool = false;
		ResultSet rs = null;
		String notFoundCRs;
		List<CRInfo> lCRResult = new ArrayList<CRInfo>();
		List<String> allCRs = new ArrayList<String>();
		List<String> foundCRs = new ArrayList<String>();
		
		System.out.println(crNumber + email);
		Connection con = sessionFactory.openSession().connection();
		try {
			 
			 if(request.getSession().getAttribute("name")==null)
			 {
				 System.out.println("invalid session");
				 return new ModelAndView("redirect:/index.jsp");

			 }
			 System.out.println("in call");
			CallableStatement cs = con
					.prepareCall("{ call CR_AUTOMATION_PACKAGE.run_cr_specific_new(?,?,?,?) }");
			System.out.println("crNumber*****"+crNumber);
			cs.setString(1, crNumber); // first parameter index start with 1
			cs.registerOutParameter(2, OracleTypes.CURSOR); // impacted CRs
			cs.registerOutParameter(3, OracleTypes.CURSOR); // Non impacted CRs
			cs.registerOutParameter(4, java.sql.Types.VARCHAR); // CRs not found in DB
			cs.execute(); // call stored procedure
			rs =(ResultSet)cs.getObject(2);
			
			CRInfo crInfo = null;
			String crNum = "";
			while(rs.next()){
				bool = true;
				crInfo = new CRInfo();
				
				crNum = rs.getString(2);
				crInfo.setCrNum(crNum);
				crInfo.setAppName(rs.getString(1));
				crInfo.setEmail(rs.getString(4));
				
				foundCRs.add(crNum);
				
				lCRResult.add(crInfo);
			}
			
			StringTokenizer st = new StringTokenizer(crNumber,",");
			String notindb = "";
			while(st.hasMoreTokens()){
				allCRs.add(st.nextToken());
			}
			Collection<String> notfoundCRs = CollectionUtils.subtract(allCRs, foundCRs);
		    System.out.println(notfoundCRs);
		    for(Iterator ite=notfoundCRs.iterator(); ite.hasNext();){
		    	notindb = notindb +ite.next()+",";
		    }
		    System.out.println("notfoundCRs >> "+notindb);
			
			String impactResult = buildImpactHTML(lCRResult, crNumber,notindb);
			
			if (bool) {
				resultMsg = "CR deatils are sent to :" + email;
				user.setMsg(resultMsg);
				user.setCrNumber(" ");
				user.setEmailId(" ");
				
				FreemarkerTest lFreemarkerTest = (FreemarkerTest) mAppContext
						.getBean("FreemarkerTest");
				Template template = lFreemarkerTest.FreemarkerTemplate();
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("ToName", request.getSession().getAttribute("name"));
				map.put("SenderName", "RMG");
				map.put("data", impactResult);

				// String body =
				// FreeMarkerTemplateUtils.processTemplateIntoString(template, map);
				String body = FreeMarkerTemplateUtils.processTemplateIntoString(
						template, map);
			
				
				MailUtility.sendEmail("rmg@cisco.com", email,
						"CR Assessment based on input: "+crNumber, body);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			try {
				con.close();

			} catch (SQLException sqlee) {
				sqlee.printStackTrace();
			}
		}

		// user.setCrNumber(" ");
		// user.setEmailId(" ");
		System.out.println(user.getMsg());
		// System.out.println(resultMsg);
		return new ModelAndView("home");

	}

	//This need to be replaced by JSP
	private String buildImpactHTML(List lCRResult, String crNumber, String notindb){
		CRInfo crInfo = null;
		StringBuffer resultStr =  new StringBuffer("");
        
		if(!lCRResult.isEmpty()){
			resultStr.append(" <tr></tr><tr></tr>CR Assessment based on input: "+crNumber +" \n");
		    
		    resultStr.append("<table class=\"bordered\"> ");
		    resultStr.append("<thead><tr><th>Change ID</th> <th>Assessment</th>");
		    resultStr.append("</tr>    </thead> ");
		    
		     for(Iterator ite=lCRResult.iterator(); ite.hasNext();){
				 crInfo = (CRInfo)ite.next();
				 
				 resultStr.append(" <tr><td>"+crInfo.getCrNum()+"</td>");
				    resultStr.append(" <td>"+crInfo.getAppName()+"</td></tr>");
			}
		    resultStr.append(" </table >");
			if(notindb!="" && notindb !=null){
			    resultStr.append("<table class=\"bordered\"><thead><tr><th>Below CRs are not available in Database</th>");
			    resultStr.append("</tr></thead>");
			    resultStr.append("<tr><td>"+notindb+"</td></tr></table>");
			}
		    
	    }
        return resultStr.toString();
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/byWeekly")
	public ModelAndView getWeeklyDetails(@ModelAttribute("user") User user,
			BindingResult result,HttpServletRequest request) {
		if(request.getSession().getAttribute("name")==null)
		{
			 System.out.println("invalid session");
			 return new ModelAndView("redirect:/index.jsp");
			 
		}		 
		String week = user.getWeek();
		String email = user.getEmailId();
		String rsltmsg;
		System.out.println(week + email);
		Connection con = sessionFactory.openSession().connection();
		try {

			CallableStatement cs = con
					.prepareCall("{ call CR_AUTOMATION_PACKAGE.run_end_to_end(?,?,?) }");
			cs.registerOutParameter(1, java.sql.Types.VARCHAR);
			cs.setString(2, week); // first parameter index start with 1
			cs.setString(3, email); // second parameter
			cs.execute(); // call stored procedure
			cs.getString(1);
			System.out.println("ssvshfs" + cs.execute() + cs.getString(1));
			if (cs.getString(1) != null) {
				rsltmsg = "CR deatils are sent to :" + email;
				user.setMsg(rsltmsg);
				user.setWeek("");
				user.setEmailId("");
			}
		} catch (Exception e) {
		}

		finally {
			try {
				con.close();

			} catch (SQLException sqlee) {
				sqlee.printStackTrace();
			}
		}
		return new ModelAndView("home");

	}

	/*
	 * @RequestMapping("/userList") public ModelAndView getUserList() {
	 * Map<String, Object> model = new HashMap<String, Object>();
	 * model.put("user", userService.getUser()); return new
	 * ModelAndView("UserDetails", model);
	 * 
	 * }
	 */

	/*
	 * @RequestMapping("/home") public ModelAndView gethome() {
	 * System.out.println("in home");
	 * 
	 * 
	 * return new ModelAndView("redirect:/home1.html");
	 * 
	 * }
	 */
	
	@RequestMapping("/logout")
	public ModelAndView endSession(@ModelAttribute("user") User user,
			BindingResult result,HttpServletRequest request) throws SQLException {
		
	      /*sessionFactory.getCurrentSession().close();*/
		/*System.out.println("in logout controller");
		
	    
	    System.out.println( request.getSession());
	    
	   String attr= (String)request.getSession().getAttribute("name");
	   System.out.println(attr);
	    request.getSession().getId();
	   request.getSession().removeAttribute("name");
	   String attr1= (String)request.getSession().getAttribute("name");
	  request.getSession().invalidate();
	    
	    System.out.println(attr1);*/
		
		request.getSession().removeAttribute("name");
	     
	      return new ModelAndView("redirect:/index.jsp");
}

}
