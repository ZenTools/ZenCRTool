<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.beingjavaguys.domain.User"%>
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
    
    
    <!-- <link href="assets/css/bootstrap.css" rel="stylesheet">
    external css
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    Custom styles for this template
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet"> -->
        
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
                     
                        <a class="active" href="javascript:;" >
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>

                  
                  <li class="sub-menu">
                           <a href="home.html">
                          <i class="fa fa-home"></i>
                          <span>Home</span>
                      </a>

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
          
          	 <h3><!-- <i class="fa fa-angle-right"></i> --> Upcoming CRs</h3> 
          <div class="row mt">
                  <div class="col-md-12">
                     <div class="content-panel"> 
                          <table id ="dashDetails" class="table table-striped table-advance table-hover">
	                  	  	  <h4>List of CR of this Month </h4>
	                  	  	  <hr>
                              <thead>
                           
                              <tr>
                                  <th><i class="fa fa-refresh"></i> Change Id</th>
                                  <th><i class="fa fa-clock-o"></i> Start Date</th>
                                  <th><i class="fa fa-clock-o"></i> End Date</th>
                                  <th><i class=" fa fa-edit"></i>Status</th>
                                  <th></th>
                              </tr>
                              </thead>
                              <tbody>
                              <%
                               
                              HashMap dashDeaitls = (HashMap)request.getAttribute("cr_details");
                              Iterator iter =  dashDeaitls.keySet().iterator();
                              int i=1;
                              String crNo=null;
                              HashMap uniqueCr = new HashMap();
                              int m=1;
                              int start=1;
                              int end=5;
                              int k=1;
                          
                               while( iter.hasNext())
                              { 
                            	  
                            	  
                            	  dummyDetails d= (dummyDetails)dashDeaitls.get(iter.next());
                            	  
                            	    crNo=d.getCrId(); 
                            	    String row=crNo+"row";
                            	    String crDate=d.getStartDate();
                            	    String crEndDate=d.getEndDate();
                            	    //String crPriority=d.getCrPriority();
                            	    String crStatus=d.getCrStatus();
                            	    String app=d.getApp();
                            	    pageContext.setAttribute("crNo", crNo);
                            	    pageContext.setAttribute("crDate", crDate);
                            	    pageContext.setAttribute("crEndDate", crEndDate);
                            	    //pageContext.setAttribute("crPriority", crPriority);
                            	    pageContext.setAttribute("crStatus", crStatus);
                            	    pageContext.setAttribute("row", row);
                            	    pageContext.setAttribute("app", app);
                            	    k++;
                            	    
                            	    
                            	  /*  System.out.println(crNo);
                            	   System.out.println(row);
                            	   System.out.println(crDate);
                            	   System.out.println(crStatus);
                            	   System.out.println(app);
                            	   System.out.println(row); */
                            	   
                            	   
                            	   
                            	                       	 
                            	  %>
                            	 
                            	 
                            	    <td><a href=<%= "\"crSpecDetails.html?crId="  + crNo +  "\"" %> > ${crNo}</a></td> 
                            	    
                            	                          	                         	  
                            	   <%-- <td>${crPriority} </td>  --%>
                            	   <td>${crDate} </td> 
                            	   <td>${crEndDate} </td> 
                            	   <%if(crStatus.equals("Pending")){ %>
                            	    
                            	    <td><span class="label label-warning label-mini">P</span></td>
                            	   <td> <button name ="crName" type="button"  class = "btn btn-info" id=${crNo} onclick="crDiv('${crNo}')">Assess</button></td>
                            	   <%} else {%>
                            	   <td><span class="label label-success label-mini">${crStatus}</span></td>
                            	   <%} %>
                            	  </tr>
                            	  
                            	
                            	 <!--  class="btn btn-warning" -->
                            	                                    
                             <% } 
                                
                              %> 
                           
                            	  
                        
                              </tbody>
                          </table>
                          <div class="text-center">
                        <ul class="pagination pagination-lg">
    <li><a href="#">&laquo;</a></li>
    <%int totalRec=dashDeaitls.size();
    int pages=(int) Math.ceil(totalRec * 1.0 / 5); 
 
    for(int n=1;n<pages;n++)
    {
    	 pageContext.setAttribute("pageNo", n);
    %>
    <li><a href="#" onclick="dashDisplay(${pageNo})">${pageNo}</a></li>
    <%} %>
    <li><a href="#">&raquo;</a></li>
</ul>
             </div>             
                          
                          
                       </div><!-- /content-panel  -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->
          	
			
		</section><!--/wrapper -->
		
		 <!--footer start-->
       <footer class="site-footer">
          <div class="text-center"> 
             Zensar Technologies
              <!-- <a href="www.google.com" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a> -->
        </div> 
      </footer>
   <!--  <h1></h1> -->
      <!--footer end-->
		 
      </section><!-- /MAIN CONTENT -->
       <!--main content end-->
     
    
             

    
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
      <script src="js/jqueryuitouchpunchmin.js"></script>
   
    <script src="js/bootstrapmin.js"></script>
   <!--  <script src="js/jquerycustommin.js"></script> -->
    <script src="js/jqueryuitouchpunchmin.js"></script>
    <script class="include" type="text/javascript" src="js/dcjqaccordion.js"></script>
    <script src="js/scrollTomin.js"></script>
     <script src="js/sparkline.js"></script>
    <script src="js/nicescroll.js" type="text/javascript"></script>
     <script src="js/respondmin.js" type="text/javascript"></script>
     <script src="assets/js/jqueryui192custommin.js"></script>
      <script src="js/jqueryuitouchpunchmin1.js" type="text/javascript"></script>
     
    



 



<script type="text/javascript">
      $(document).ready(function(){
  
   
    
    
   
});

    function crDiv(crId){
    	
    	
    	 
    	 
       
    }
    
    
    function dashDisplay(pageNo){
    	
    	
   	 var page=pageNo;
   	 console.log(pageNo);
   	 
   
   	
   	
        
    }
    	 
    
    </script>		 		
          		






















    <!--common script for all pages-->
    <script src="js/commonscripts.js"></script>
    
    
    <!-- <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script> -->
    

    <!--script for this page-->
    
  <!-- <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script> -->




  </body>
</html>
	
	
  

 