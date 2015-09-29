<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.beingjavaguys.domain.User"%>
<%@page import="com.beingjavaguys.domain.CRInfo"%>

<%@page import="com.beingjavaguys.domain.dummyDetails"%>
<%@ page import="java.util.HashMap" %>
<%@ page import=" java.util.Iterator"%>

<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script> -->
<script src="js/ajaxJquery.js"></script>

	 
	<%
	   User user=new User();
    		if(request.getSession().getAttribute("name")==null)
    			response.sendRedirect("index.jsp");
    		
    		
    		
    		
	%> 
	<c:set var="now" value="<%=new java.util.Date()%>" />
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
                     
                        <a href="dashboard.html" >
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>

                  
                  <li class="sub-menu">
                           <a href="home.html">
                          <i class="fa fa-home"></i>
                          <span>Home</span>
                      </a>
                      <!-- <ul class="sub">
                          <li class="active"><a  href="blank.html">Blank Page</a></li>
                          <li><a  href="login.html">Login</a></li>
                          <li><a  href="lock_screen.html">Lock Screen</a></li>
                      </ul> -->
                  </li>
                 
                  <li class="sub-menu">
                      
                      <a class="active" href="javascript:;" >
                          <i class="fa fa-th"></i>
                          <span>Details</span>
                      </a>
                      
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      
      <!-- $(document).ready(function() {
      $(".div1").hide(); 
    $('.CRQ000000222973').click(function() {
        $(".div1").show();
    });
}); -->



      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
    
      <section id="main-content">
          <section class="wrapper site-min-height">
          	 <h3><!-- <i class="fa fa-angle-right"></i> --> CR Assessment  </h3> 
          <div class="row mt">
                  <div class="col-md-12">
                      <div class="content-panel">
                      
                      <%HashMap dashDeaitls = (HashMap)request.getAttribute("cr_details");
                              Iterator iter =  dashDeaitls.keySet().iterator();
                              int i=1;
                              
                              
                               while(iter.hasNext())
                              { 
                            	   
                            	 
                            	   CRInfo d= (CRInfo)dashDeaitls.get(iter.next());
                            	  
                            	    String crNo=d.getCrNum();
                            	    String apps=d.getAppName();
                            	    String email=d.getEmail();
                            	  
                            	    pageContext.setAttribute("crNo", crNo);
                            	    pageContext.setAttribute("apps", apps);
                            	    pageContext.setAttribute("email", email);
                            	    
                            	    
                              
                            	                                	 
                            	  %>
                            	  
                            	  <table class="table table-striped table-advance table-hover">
                            	  
                            	  <tr>
                                                  <th>CR ID</th>
                                                   <td>${crNo} </td>
                                </tr> 
                                <tr>
                                                  <th>APPS</th>
                                                   <td>${apps} </td>
                                </tr> 
                                <tr>
                                                  <th>email</th>
                                                   <td>${email} </td>
                                </tr> 
                                <%} %>
                            	  </table>
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  <!-- <div class="showback"> 
      					<h4><i class="fa fa-angle-right"></i> Modal Example</h4>
						Button trigger modal
						<button class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">
						 Assess
						</button>
						
						Modal
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						   <div class="modal-dialog"> 
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						        <h4 class="modal-title" id="myModalLabel">Insert CR Details</h4>
						      </div>
						      <div class="modal-body">
						        <div class="form-group">
                        <div class="form-group">
  <table width="400px" height="150px">  
  <tr>                    
  <td><label for="usr">CCO ID:</label></td>
  <td><input type="text" class="form-control" id="usr"></td>
  </tr>
</div>
<div class="form-group">
  <tr>
  <td><label for="email">email:</label></td>
  <td><input type="email" class="form-control" id="email"></td>
  </tr>
</div>
  
  </table>
  
</div> 




						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary">Save</button>
						      </div>
						    </div>
						  </div>
						 </div>   			
      				</div>
      				
      				
      				
      				
      				
      				
      				
      				
      				

                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                            	  
                                               </div>/content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->
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
	
	
  

 