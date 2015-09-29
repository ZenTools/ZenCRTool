package com.beingjavaguys.controller;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import oracle.jdbc.driver.OracleTypes;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.beingjavaguys.domain.CRInfo;
import com.beingjavaguys.domain.User;
import com.beingjavaguys.domain.dummyDetails;
import com.beingjavaguys.service.UserService;
import com.sun.mail.iap.Response;



@Controller
public class CRAssesController
{
	
	@Autowired
	private WebApplicationContext mAppContext;

	@Autowired
	private UserService userService;


	@Autowired
	private SessionFactory sessionFactory;
	
@RequestMapping(value="/crSpecDetails"  )
public ModelAndView getCrDetails(@ModelAttribute("dummyDetails") dummyDetails Details,
		BindingResult result,HttpServletRequest request) throws Exception {
System.out.println("In asses cntrller");

  if(Details.getCrId()==null)
	return new ModelAndView("crSpecDetails");
  else
  {
	 
	  Map m1=new HashMap();
      ResultSet rs = null;
      Connection con = sessionFactory.openSession().connection();
      String crNumber=Details.getCrId();
     int i=0;
      CallableStatement cs = con
				.prepareCall("{ call CR_AUTOMATION_PACKAGE.run_cr_specific_new(?,?,?,?) }");
		
		cs.setString(1, crNumber); // first parameter index start with 1
		cs.registerOutParameter(2, OracleTypes.CURSOR); // impacted CRs
		cs.registerOutParameter(3, OracleTypes.CURSOR); // Non impacted CRs
		cs.registerOutParameter(4, OracleTypes.VARCHAR); // CRs not found in DB
		cs.execute(); // call stored procedure
		rs =(ResultSet)cs.getObject(2);
		CRInfo crInfo = null;
		while(rs.next()){
			String obj="obj"+ i++;
			crInfo = new CRInfo();
			
			crInfo.setCrNum(rs.getString(2));
			crInfo.setAppName(rs.getString(1));
			crInfo.setEmail(rs.getString(4));
			
			
				
			
			
			
			m1.put(obj, crInfo);
		}
			
			
		
			
			/*System.out.println(m1);*/
		
		
		System.out.println("map");
		System.out.println(m1.keySet());
		System.out.println(m1.values());
		
		
      request.setAttribute("cr_details", m1);
      
     
      
	  
	  return new ModelAndView("assessment");
	  
  }
}

}