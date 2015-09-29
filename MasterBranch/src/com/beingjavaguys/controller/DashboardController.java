package com.beingjavaguys.controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


import java.util.ArrayList;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import oracle.jdbc.driver.OracleTypes;

import org.springframework.ui.freemarker.*;
import org.apache.catalina.connector.Request;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.beingjavaguys.domain.FreemarkerTest;
import com.beingjavaguys.domain.User;
import com.beingjavaguys.domain.dummyDetails;
import com.beingjavaguys.sendMail.MailUtility;
import com.beingjavaguys.service.UserService;
//import org.springframework.ui.freemarker.FreeMar











@Controller
public class DashboardController
{
	
	@Autowired
	private WebApplicationContext mAppContext;

	@Autowired
	private UserService userService;


	@Autowired
	private SessionFactory sessionFactory;
	
@RequestMapping("/dashboard")

	public ModelAndView saveUserData(@ModelAttribute("user") User user,
			BindingResult result,HttpServletRequest request) throws Exception {
	          System.out.println("in dashboard controller");
	          Map m1=new HashMap();
	          Map pageMap=new HashMap();
	          Map uniqueCr=new HashMap();
	          
	          String userName=(String) request.getSession().getAttribute("name")   ;
	          System.out.println(userName);
	          ResultSet rs = null;
	          
	          Connection con = sessionFactory.openSession().connection();
	          String cr="CRQ000000188825";
	          CallableStatement cs = con.prepareCall("{ call CR_CCOID_PACKAGE.dashboard_details(?,?) }");
						
				
				/*System.out.println(noOfpages);*/
				cs.setString(1,userName ); // first parameter index start with 1
				cs.registerOutParameter(2, OracleTypes.CURSOR); // impacted CRs
				/*cs.registerOutParameter(3, OracleTypes.CURSOR); // Non impacted CRs
				cs.registerOutParameter(4, OracleTypes.VARCHAR); // CRs not found in DB
*/				cs.execute(); // call stored procedure
				rs =(ResultSet)cs.getObject(2);
				dummyDetails details = null;
				int i=1,j=1;
				int itr=0;
				
				while(rs.next()){
					
					
					String obj="obj"+ i;
					
					/*if(!uniqueCr.containsValue(rs.getString(1)))
					{*/
						
					details = new dummyDetails();
					details.setCrId(rs.getString(1));
					details.setStartDate(rs.getString(2));
					details.setEndDate(rs.getString(3));
					/*details.setCrPriority(rs.getString(7));*/
					details.setCrStatus(rs.getString(4));
					/*details.setApp(rs.getString(3));*/
					m1.put(obj, details);
					i++;
					System.out.println(obj);
					}				
					
					
					/*uniqueCr.put(obj, rs.getString(1));*/
					
					System.out.println("Size of the Map >> "+m1.size());
				/*}*/
				
				
			
	          request.setAttribute("cr_details", m1);
	          
	          return new  ModelAndView("dashboard","cr_deatils",m1);
	          
         
	          
				}
}
