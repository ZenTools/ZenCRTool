<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.beingjavaguys.domain.User"%>
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script> -->
<script src="js/ajaxJquery.js"></script>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
<style type="text/css">
  div {display: none}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<br></br>
<form:form id="home" name="crspecifiv"   modelAttribute="user">

<label><c:out value="${user.msg}" /></label>
<br></br>
<label><input type="radio" name="group1" class="CR-specific">Cr Specific</label>
<br></br>
<label><input type="radio" name="group1" class="byWeekly">ByWeekly</label>

</form:form>

<script type="text/javascript">
function callCrspecificDB(){
	document.crspecifiv.action="crspecific.html";
	
}
function callbyweeklyDB(){
	document.byweekly.action="byweekly.jsp";
	
}

    $('.CR-specific').click(function () {
    	$('.div2').hide();
        $('.div1').show();
    });
    $('.byWeekly').click(function () {
    	$('.div1').hide();
        $('.div2').show();
    });
</script>
< <c:url var="userRegistration" value="saveUser.html"/>
<form:form id="registerForm" modelAttribute="user" method="post" action="${userRegistration}"> >

<div class="div1">
<c:url var="crSpec" value="crSpecific.html"/>

<form:form id="crDetails" name="crspecifiv"   modelAttribute="user" method="post"   action="${crSpec}">
<h3>Please insert CR details</h3>

<!-- <b>CR No</b>          <input type="text" name="CR-no" >
<br></br>
<b>Email ID </b><input type="text" name="email" >
<br></br> -->

<table width="400px" height="150px">
<tr>

<td><form:label path="crNumber">User ID</form:label></td>
<td><form:input  path="crNumber"/></td>
</tr>
<tr>
<td><form:label path="emailId">Password</form:label></td>
<td><form:input  path="emailId"/></td>

</tr>
<tr><td></td><td>
<button type="submit" class="btn btn-success" name="cr-specific" >Submit</button>
</td></tr>
</table>


</form:form>

</div>
<div class="div2">
<c:url var="byWeek" value="byWeekly.html"/>
<form:form id="weekly" name="byweekly" modelAttribute="user"  method="post"  action="${byWeek}">


<!-- <h3>Please insert Week details</h3>
<b>Week</b>          <input type="text" name="week" >
<br></br>
<b>Email ID </b><input type="text" name="email" >
<br></br>
<button type="submit" class="btn btn-success" name="byweekly" onclick="callbyweeklyDB()">Submit</button> -->

<table width="400px" height="150px">
<tr>
<td><form:label path="Week">Week</form:label></td>
<td><form:input  path="Week"/></td>
</tr>
<tr>
<td><form:label path="emailId">Email Id</form:label></td>
<td><form:input  path="emailId"/></td>

</tr>
<tr><td></td><td>
<button type="submit" class="btn btn-success" name="byweekly" >Submit</button>
</td></tr>
</table>

</form:form>


</div>
  

</body>
</html> --%>



        
    
   <!--  <link href="css/bootstrap.css" rel="stylesheet">
   
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="css/gritter.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css">    css changed
    
    
    <link href="css/style.css" rel="stylesheet"> css changed
    <link href="css/style-responsive.css" rel="stylesheet">

    <script src="css/Chart.js"></script>
    
    
 
    js placed at the end of the document so the pages load faster
    <script src="js/jquery.js"></script>
    <script src="js/jquerymin.js"></script>
    <script src="js/bootstrapmin.js"></script>
    <script class="include" type="text/javascript" src="js/dcjqaccordion.js"></script>
    <script src="js/scrollTomin.js"></script>
    <script src="js/nicescroll.js" type="text/javascript"></script>
    <script src="js/sparkline.js"></script>


    common script for all pages
    <script src="js/commonscripts.js"></script>
    
    <script type="text/javascript" src="js/jquerygritter.js"></script>
    <script type="text/javascript" src="js/gritterconf.js"></script>

    script for this page
    <script src="js/sparklinechart.js"></script>    
	<script src="js/zabutocalendar.js"></script>	
	
	 -->
	 
	<%
	   User user=new User();
    		if(request.getSession().getAttribute("name")==null)
    			response.sendRedirect("index.jsp");
	%> 
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
    <link href="css/bootstrap.css" rel="stylesheet">
    <!--external css-->
   <link href="css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
     <link href="css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a  class="logo"><b>CR Automation Tool</b></a>
            
             
             <a  class="greet"><b>${greetings}</b></a>
            <%--  <center><h6 style="color: #3399FF"><b>${greetings}</b></h6></center>  --%>
            <!--logo end-->
          
        
         
           <%-- 
              <h4><b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${greetings}</b></h4> --%>
             
           
        
           
              
           
            <div class="top-menu">
            <c:url var="logout" value="logout.html"/>

<form:form id="log" name="log"   modelAttribute="user" method="post"   action="${logout}">
                 
            	<ul class="nav pull-right top-menu">            	           	   
            	             	     
                    <li><input type="submit" class="logout" name="logout"  value="Logout" ></li> 
                    
            	</ul>
            	
            	  </form:form>
            	  
               
            </div>
            
            
            
            
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="profile.html"><img src="imgs/cr-logo.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered"></h5>
              	  	
                  <li class="mt">
                      <a href="dashboard.html">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>

                  <!-- <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>UI Elements</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="general.html">General</a></li>
                          <li><a  href="buttons.html">Buttons</a></li>
                          <li><a  href="panels.html">Panels</a></li>
                      </ul>
                  </li> -->

                  <!-- <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-cogs"></i>
                          <span>Components</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="calendar.html">Calendar</a></li>
                          <li><a  href="gallery.html">Gallery</a></li>
                          <li><a  href="todo_list.html">Todo List</a></li>
                      </ul>
                  </li> -->
                  <li class="sub-menu">
                      <a class="active" href="javascript:;" >
                          <i class="fa fa-home"></i>
                          <span>Home</span>
                      </a>
                      <!-- <ul class="sub">
                          <li class="active"><a  href="blank.html">Blank Page</a></li>
                          <li><a  href="login.html">Login</a></li>
                          <li><a  href="lock_screen.html">Lock Screen</a></li>
                      </ul> -->
                  </li>
                  <!-- <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-tasks"></i>
                          <span>Forms</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="form_component.html">Form Components</a></li>
                      </ul>
                  </li> -->
                  <!-- <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-th"></i>
                          <span>Data Tables</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="basic_table.html">Basic Table</a></li>
                          <li><a  href="responsive_table.html">Responsive Table</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>Charts</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="morris.html">Morris</a></li>
                          <li><a  href="chartjs.html">Chartjs</a></li>
                      </ul>
                  </li> -->

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
    
      <section id="main-content">
          <section class="wrapper site-min-height">
          	<!-- <h3><i class="fa fa-angle-right"></i> Blank Page</h3> -->
          	<div class="row mt">
          		<div class="col-lg-12">
          		<form:form id="home" name="crspecifiv"   modelAttribute="user">
    <div class="alert alert-success">

      

      <b> <label><c:out value="${user.msg}" /></label> </b>

        </div>

       <br></br>
        <h4><label><input type="radio" name="group1" class="CR-specific"  >Cr Specific</label>   &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <label><input type="radio" name="group1" class="byWeekly">ByWeekly</label></h4>
        <br></br>
        <!-- <label><input type="radio" name="group1" class="byWeekly">ByWeekly</label> -->
         
</form:form>


<script type="text/javascript">
/* function callCrspecificDB(){
	document.crspecifiv.action="crspecific.html";
	
}
function callbyweeklyDB(){
	document.byweekly.action="byweekly.jsp";
	
} */

$(document).ready(function(){
    $(".div1").hide(); 
    $(".div2").hide(); 
});


    $('.CR-specific').click(function () {
    	$('.div2').hide();
        $('.div1').show();
    });
    $('.byWeekly').click(function () {
    	$('.div1').hide();
        $('.div2').show();
    });
</script>
<c:url var="userRegistration" value="saveUser.html"/>
<form:form id="registerForm" modelAttribute="user" method="post" action="${userRegistration}">
</form:form>

<div class="div1" >
<c:url var="crSpec" value="crSpecific.html"/>

<form:form id="crDetails" name="crspecifiv"   modelAttribute="user" method="post"   action="${crSpec}">


 
         


<!-- <b>CR No</b>          <input type="text" name="CR-no" >
<br></br>
<b>Email ID </b><input type="text" name="email" >
<br></br> -->




<div class="row mt">
     <div class="col-lg-5">
     
     
     
     <div class="form-panel">
             <!--   <h4 class="mb"><i class="fa fa-angle-right"></i> Inline Form</h4> -->
               
               <form class="form-inline" role="form">
               
 <table width="400px" height="150px">
<h4>Please insert CR details</h4>
<tr>
<td><form:label path="crNumber">CR number</form:label></td>
<td><form:input  path="crNumber"/> <a class="fa fa-info-circle " data-toggle="tooltip" data-placement="right" title="Use comma seperated values in case of multiple CRs"></a></td>
</tr>
<tr>
<td><form:label path="emailId">Email ID</form:label></td>
<td><form:input  path="emailId" type="email"/></td>
</tr>
<tr><td></td><td>
<button type="submit" class="btn btn-success" name="cr-specific" >Submit</button>
</td></tr>
</table>
</form>
 </div>
</div>
</div>
</form:form>

</div>
<div class="div2">
<c:url var="byWeek" value="byWeekly.html"/>
<form:form id="weekly" name="byweekly" modelAttribute="user"  method="post"  action="${byWeek}">


<!-- <h3>Please insert Week details</h3>
<b>Week</b>          <input type="text" name="week" >
<br></br>
<b>Email ID </b><input type="text" name="email" >
<br></br>
<button type="submit" class="btn btn-success" name="byweekly" onclick="callbyweeklyDB()">Submit</button> -->



<div class="row mt">
     <div class="col-lg-5">
     
     
     
     <div class="form-panel">
             <!--   <h4 class="mb"><i class="fa fa-angle-right"></i> Inline Form</h4> -->
               
               <form class="form-inline" role="form">

<h4>Please insert CR details</h4>
<table width="400px" height="150px">
<tr>
<td><form:label path="Week">Week</form:label></td>
<td><form:input  path="Week"/></td>
</tr>
<tr>
<td><form:label path="emailId">Email Id</form:label></td>
<td><form:input  path="emailId" type="email"/></td>

</tr>
<tr><td></td><td>
<button type="submit" class="btn btn-success" name="byweekly" >Submit</button>
</td></tr>
</table>


</form>
 </div>
</div>
</div>

</form:form>


</div>
          		</div>
          	</div>
			
		</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->
      
      
          		
          		
          		
          		
          	
			
		

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
             Zensar Technologies
              <a href="blank.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrapmin.js"></script>
    <script src="js/jquerycustommin.js"></script>
    <script src="js/jquerytouch-punchmin.js"></script>
    <script class="include" type="text/javascript" src="js/dcjqaccordion.js"></script>
    <script src="js/scrollTomin.js"></script>
    <script src="js/nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="js/commonscripts.js"></script>

    <!--script for this page-->
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>




  </body>
</html>
	
	
  

 