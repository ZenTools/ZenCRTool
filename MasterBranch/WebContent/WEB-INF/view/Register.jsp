<%@page import="com.beingjavaguys.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="respondmin.js"></script>
    <![endif]-->
<title>Being Java Guys | Registration Form</title>
</head>
<body>
<center>
<br><br><br><br><br><br>

<br><br>
<c:url var="userRegistration" value="saveUser.html"/>
<form:form id="registerForm" modelAttribute="user" method="post" action="${userRegistration}">
<table width="400px" height="150px">
<tr>
<td><form:label path="firstName">User ID</form:label></td>
<td><form:input  path="firstName"/></td>
</tr>
<tr>
<td><form:label path="lastName">Password</form:label></td>
<td><form:input  path="lastName"/></td>
</tr>

<tr><td></td><td>
<input type="submit" value="LOGIN" />
</td></tr>
</table>

</form:form>
<!-- <br>
<a href="userList.html" >Click Here to see User List</a> -->
</center>
</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>CR-Automation Tool</title>

    <!-- Bootstrap core CSS -->
   <link href="css/bootstrap.css" rel="stylesheet" >
   <!--  <link rel="stylesheet" type="text/css" media="screen" href="/css/bootstrap.css" /> -->
   <%--  <link rel="stylesheet" href="<%=request.getContextPath()%>css/bootstrap.css"> --%>
    <!--external css-->
    <link href="css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="respondmin.js"></script>
    <![endif]-->
  </head>

  <body>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
     
      
       
       

      
        
     
        
	  
	  <div id="login-page">
	 
        
	 
	  	<div class="container">
	  	  
		    <%--  <form class="form-login" action="index.html">  --%>
		    <c:url var="userRegistration" value="saveUser.html"/>
             <form:form id="registerForm" class="form-login" modelAttribute="user" method="post" action="${userRegistration}"> 
		        
		        <h2 class="form-login-heading">sign in now</h2>
		        <center><h4 style="color: #3399FF"><b>${message}</b></h4></center> 
		        <div class="login-wrap">
		            <input type="text" class="form-control" placeholder="User ID" name="firstName" autofocus >
		            		            <br>
		            <input type="password" class="form-control" placeholder="Password" name="lastName">
		            
		             <label class="checkbox">
		                <span class="pull-right">
		            <!--   <a data-toggle="modal" href="login.html#myModal"> Forgot Password?</a>  -->
		
		                </span>
		            </label> 
		            <button class="btn btn-theme btn-block"  type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
		            <hr>
		        
		            
		
		        </div>
		
		         
		
		      </form:form>	  	
	  	
	  	</div>
	  </div>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrapmin.js"></script>

    <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="js/jquerybackstretchmin.js"></script>
    <script>
        $.backstretch("imgs/cyberattack-map.jpg", {speed: 500});
    </script>


  </body>
</html>
