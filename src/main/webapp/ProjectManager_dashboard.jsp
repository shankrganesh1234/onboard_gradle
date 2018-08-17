<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
<title>ProjectManager Dashboard</title>
 <meta charset="UTF-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
         
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

        <!-- ========== PAGE STYLES ========== -->
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
        <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
        <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
        <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <link rel="stylesheet" href="css/RoleDashboard/RoleDashboard.css">
       

        <!-- ========== MODERNIZR ========== -->
        <script src="js/modernizr/modernizr.min.js"></script>
         <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
             <script type="text/javascript" src="js/paging.js"></script> 
       
  	
	<script type="text/javascript" src="js_in_pages/tree.js"></script>
	<!-- graph -->
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>
  
  <style>
   .breadcrumb-div {
                background-color: #e7e7e7;
                color: #010101; }
                #nav_userid{
             color:green;
             }
              


.pg-normal { 
color: white; 
font-size: 15px; 
cursor: pointer; 
background: #269af8; 
padding: 2px 4px 2px 4px; 
}

.pg-selected { 
color: #fff; 
font-size: 15px; 
background: #269af8; 
padding: 2px 4px 2px 4px; 
}

.btn-group{
float:right;
}

</style>
 
  <body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed ProjectManagaer_Dashboard JSP PAGE-----[INFO]");  %>
<%@page language="java"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%@ page import="onboard.daterange" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%
//daterange dt = new daterange();
//dt.range_calc("5/1/2018","5/30/2018");
%>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.jsp");
}
%>


<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>


<%
    DBconnection d=new DBconnection();
    Connection con = (Connection)d.getConnection();
    Statement st_distinct= con.createStatement(); 
HttpSession details=request.getSession();
String roles=(String)details.getAttribute("role");
String uname=(String)details.getAttribute("username");
String info=(String)details.getAttribute("app_emp");
String proname=(String)details.getAttribute("nameofproject");

try {
String det=(String)session.getAttribute("theName");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding", "root", "password123");
String query = "select * from AppEmphazize_ProjectDetails";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query3 = "select * from AppEmphazize_ProjectDetails where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query2 = "select * from logs where USER_ID='"+uname+"'";
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);
String query1 = "SELECT role FROM Role_Details";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);
String query4 = "select count(*) from AppEmphazize_ProjectDetails";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
String query5 = "select count(mem_ass) from archiveexecution_details where mem_ass!=''";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);
String query6 = "select count(roles) from logs";
Statement st6 = conn.createStatement();
ResultSet rs6 = st6.executeQuery(query6);
String query7 = "select count(*) from AppEmphazize_ApplicationInfo";
Statement st7 = conn.createStatement();
ResultSet rs7 = st6.executeQuery(query7);

String query8 = "select * from AppEmphazize_ProjectDetails";
Statement st8 = conn.createStatement();
ResultSet rs8 = st8.executeQuery(query8);


if(rs.next()){
%>
 


 <div class="main-wrapper">
            
            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
							<a class="navbar-brand" href="Project_List.jsp" id="sitetitle">
                			    <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                			</a>
                			 <span class="small-nav-handle hidden-sm hidden-xs"><i class="fa fa-outdent"></i></span>
                			 
                			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                				<span class="sr-only">Toggle navigation</span>
                				<i class="fa fa-ellipsis-v"></i>
                			</button>
                            <button type="button" class="navbar-toggle mobile-nav-toggle" >
                				<i class="fa fa-bars"></i>
                			</button>
                		</div>
                        <!-- /.navbar-header -->
                			 
                    <% if(rs3.next()){
                    details.setAttribute("appno",rs3.getString("appno"));
                    details.setAttribute("projectname",rs3.getString("projectname"));
                    %>
                    <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %></a>
																					  
					   
                    <%
                    String q2="select * from ArchiveExecution_Details where level=1 and projects='"+rs3.getString("projectname")+"'order by seq_num";
                    Statement s2 = conn.createStatement();
                    ResultSet rss = s2.executeQuery(q2);
                    while(rss.next())
                    {
                    session.setAttribute(rss.getString(3),rss.getString(15));
                    }
                    
                    } %>
                    
                			
                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
					 <ul class="nav navbar-nav navbar-right">
					 	<%
                         
                         String role=(String)details.getAttribute("role");%>                   
	<li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
							<li> <a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a> </li>
                     </ul>
					
                		</div>
                		<!-- /.navbar-collapse -->
                    </div>
                    <!-- /.row -->
            	</div>
            	<!-- /.container-fluid -->
            </nav>
 
           
              
            <div class="content-wrapper">
                <div class="content-container">
            
                    <!-- ========== LEFT SIDEBAR ========== -->
                    <div class="left-sidebar fixed-sidebar bg-primary box-shadow tour-three">
                        <div class="sidebar-content" id='jqxWidget'>
							
                            <div class="sidebar-nav">
                                <ul class="side-nav color-gray">
                                    <li class="nav-header">
                                        <span class="">Main Category</span>
                                    </li>
                                    <li id='home' item-selected='true'>
                                        <a href="Project_List.jsp"><i class="fa fa-home"></i> <span>Home</span> </a>
                                    </li>

                                    <li class="nav-header">
                                        <a href="AppEmphasize_EditProject.jsp"><span class="">App Emphasize Module</span></a>
                                    </li>
                                    <li class="has-children">
                                        <a href="AppEmphasize_EditProject.jsp" ><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a></li>
                                            <li><a href="AppEmphasize_Application.jsp"> <span>Application Details</span></a></li>
                                        </ul>
                                    </li>

                                  <li class="has-children">
                                        <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application Complexity</span></a></li>
                                             </ul>
                                    </li>

                                    <li>
                                        <a href="AppEmphasize_PrioritizedApplications.jsp"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
                                    </li>

 <li class="nav-header">
                                        <a href='Applications.jsp'><span class="">Intake Module</span></a>
                                    </li>

                                    <li class="has-children">
                                        <a href="Applications.jsp"><i class="fa fa-magic"></i> <span>Business</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Applications.jsp"> <span>Application Information</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Legacy Retention Information</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Archive Data Management</span></a></li>
                                            <li><a href="Applications.jsp"> <span>System Requirements</span></a></li>
                                        </ul>
                                    </li>

                                    <li class="has-children">
                                        <a href="Applications.jsp"><i class="fa fa-bars"></i> <span>Technical</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Applications.jsp"> <span>Application Data Information</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Infrastructure & Environment Inforamation</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Technical Information</span></a></li>
                                        </ul>
                                    </li>
                                     <li class="has-children">
                                        <a href="Applications.jsp"><i class="fa fa-archive"></i> <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Applications.jsp"> <span>Screen/Report Requirements</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Archive Requirements</span></a></li>
                                        </ul>
                                    </li>
   <li class="has-children"><a href="Archive_Execution.jsp"><i class="fa fa-suitcase"></i> <span>Archive Execution Module</span></a>
               </li> 
               
                <li class="has-children">
                                        <a href="Applications.jsp"><i class="fa fa-archive"></i> <span>Dashboards</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                          
                                            <li><a href="ProjectManager_dashboard.jsp" class="active-menu"> <span>Project Manager Dashboard</span></a></li>
                                          
                                        </ul>
                                    </li>
                                </ul>
										
                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->
        <%
String initiate=(String)session.getAttribute("Ideation and Initiate");
String plan=(String)session.getAttribute("Plan");
String execute=(String)session.getAttribute("Execute");
String hypercare=(String)session.getAttribute("Closure");
if(initiate == null)
initiate="0";
if(plan == null)
plan="0";
if(execute == null)
execute="0";
if(hypercare == null)
hypercare="0";
%>    
<script>
function javascript_conv()
{
	var initiate =<%= initiate %>;
	var plan = <%= plan %>;
	var execute = <%= execute %>;
    var hypercare = <%= hypercare %>;
    
	}
</script>
            
                    <div class="main-page">
                     <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-sm-6">
                                    <h2 class="title">Dashboard</h2>
                                   
                                </div>
                                
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-sm-6">
                                    <ul class="breadcrumb">
                                        <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>
                                        <li class="active">Role Dashboard</li>
                                    </ul>
                                </div>
                                <!-- /.col-sm-6 -->
                                <div class="col-sm-6 text-right hidden-xs">
                                    <a href="#" class="pl-20"><i class="fa fa-cog"></i> Settings</a>
                                </div>
                                <!-- /.col-sm-6 -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
                    
         <section>
         <br>
            <div class="container-fluid">
              <div class="row">
              <div class="col-lg-4 col-md-4">
                        <div class="cardo card-primary">
                            <div class="card-body">
                            
                                <div class="ui-widgetf">
								  <h1 class="ui-valuef"><%  while(rs4.next()){ %>
								  
								  <%= rs4.getString(1) %>
								  
								  <%}%> </h1>
								  <span class="ui-label">No of Projects</span>
								</div> 
                            </div>
                        </div>
                    </div>
                    
                    <!-- col -->
                    
                    <div class="col-lg-4 col-md-4">
                        <div class="cardo card-second">
                            <div class="card-body">
                               <div class="ui-widgets">
						    <h1 class="ui-values"> <%  while(rs7.next()){ %><%= rs7.getString(1) %><%}%> </h1>
						     <span class="ui-label">No of Applications</span>
						</div>
                            </div>
                        </div>
                    </div>
              
                   <div class="col-lg-4 col-md-4">
                   
                        <div class="cardo card-orange">
                       
                            <div class="card-body">
                            
                               <div class="ui-widgett">
                                
							  <h1 class="ui-valuet"><%  while(rs5.next()){ %><%= rs5.getString(1) %><%}%></h1> 
							  <span class="ui-label">No of Resource Assigned</span>
							  
							</div>
                            </div>
                        </div>
                    </div>
              </div>
                
   </div> 
        <!-- table -->
        <br>
 
       <br>
        
        <!-- graph -->
      <div class="container-fluid" >
      <div class="row">
                  <div class="col-lg-7 col-md-7">
       <div class="card">
                            <div class="card-body">
                                  <div class="row" id="rowdate">
						             <div class="col-lg-8 col-md-12">
						                         <h3 class="title">&nbsp;&nbsp;Project Details</h3>
											</div>	 
											<div class="col-lg-4 col-md-12">
											<div class="btn-group">
						                         <button id="column" class="btn btn-default btn-sm" onclick="myColumnchart()">
												    <span class="fa fa-bar-chart fa-2x"></span>
												 </button> 
												 <button href="#" id="grid" class="btn btn-default btn-sm" onclick="myTablechart()">
												 <span class="fa fa-table fa-2x"></span>
												 </button>
						                    </div>
						                    </div>
                                  </div>
                                  <br>
                                  <br>
                                  <!-- charts -->
                                <!-- bar chart -->  <div class="container-fluid" >
                                  <div class="row" id="rowbarchart" >
                                   <div class="col-lg-12 col-md-12">
                         <div class="col-lg-2 col-md-2">
                              <label>FromDate</label>
                         </div>
                         <div class="col-lg-2 col-md-2" id="fromdate">
                         <p> <input type="text" data-provide="datepicker" class="form-control" id="fromDate" placeholder="Select date"></p>
                         </div>
						 <div class="col-lg-2 col-md-1">
							<label>ToDate</label>
						 </div>
                         <div class="col-lg-2 col-md-2">
                         <p> <input type="text" data-provide="datepicker" class="form-control" id="toDate" onchange="getDateValue(this.id,'fromDate')" placeholder="Select date"></p>
                         </div>
                         <div class="col-lg-2 col-md-2">
		                     <label>Projects</label>
                         </div>
                         <div class="col-lg-2 col-md-2">
                             <span>
                                  <select class="form-control" id="projectvaluepie" onChange="application_bar(this.value,'barchart')"></select>
                             </span>
                         </div>
                     </div>
                          <br><br> 
					 <div id="tooltip_action" style="width:750px;padding:20px ;height:350px;"></div>	   
                                  </div>
                                  </div>  <!-- bar chart -->
                                  <!-- end of barchart row -->
                                  <!-- start of table row -->
                             
                                   <!-- bar chart -->  <div class="container-fluid" id="rowtable" hidden>
                          <div class="row">
                          <div class="col-lg-12 col-md-12">
                                  <div id="portlet" class="panel-collapse">
                                <div class="portlet-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Project Name</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th>Status</th>
                                                <th>Assign</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <%
                                            while(rs.next())
                                            {
                                            	
                                            String query9 = "select * from archiveexecution_details where level='1' and projects='"+rs.getString(1)+"' order by seq_num";
                                            Statement st9 = conn.createStatement();
                                            ResultSet rs9 = st9.executeQuery(query9);
                                            System.out.println("query9 :" + query9 );
                                            
                                            while(rs8.next())
                                            {
                                            	  
                                            
                    
                                            	
                                            	%>
                                            <tr>
                                                <td><%=rs8.getString(10)%></td>
                                                <td><%=rs8.getString(1)%></td>
                                                <td><%=rs8.getString(5)%></td>
                                                <td><%=rs8.getString(9)%></td>
                                                <td>Ideation and Initiate</td>
                                                <td>Arun</td>
                                                
                                            </tr>
                                      <%}
                                                   
                    }
                    
                    %>
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            </div>
                                  </div>
                           
				   
                                 
                                  </div>  <!-- bar chart -->
                                  
                            </div>
            </div>
        				  
				       
                                
                       
                    </div>
                    
                  
                            <!-- piechart -->
                    <div class="col-lg-5 col-md-5">
              
                          <div class="card">
                            <div class="card-body">
                            
                            
                                <div class="row">
                               
                                  <div class="col-lg-6 col-md-6">
                                     <h3 >Percentage (%)</i></h3>
                                      
                                      </div>
                                 
                                    <br><br><br>
                                     <div class="col-lg-12 col-md-12" id="content">
                                    <div class="col-lg-4 col-md-4">
           <p> <input type="text" data-provide="datepicker" class="form-control" id="fromDatepie" placeholder="Select from date"></p>
          </div>

          <div class="col-lg-4 col-md-4">
           <p>  <input type="text" data-provide="datepicker" class="form-control" id="toDatepie" onchange="getDateValuepie(this.id,'fromDatepie')" placeholder="Select to date"></p>
          </div>
        
          <div class="col-lg-4 col-md-4" id="project_list1">
          <span>
		          <select class="form-control" id="projectvaluepiechart" onChange="application_bar(this.value,'piechart')"> 
						      </select> 
</span>
          </div>
										  
										    </div>
                                    <div id="piechart" style="width:100%; height:350px;padding:10px;"></div> 
                                   
                                </div>
                            </div>
                        </div>
                        
                   
                   
                   
                </div>
                    
           
                                    </div><!-- end of row-->
      
      
      
      </div>    <!-- end of container fluid -->
    
      
  <!-- FromDate and todate Picker -->
  <script type="text/javascript">

   function getDateValue(){
	 
	   var fromD = document.getElementById("fromDate").value;
	   var toD = document.getElementById("toDate").value;
	   
	   console.log("FROMDATE : " + fromD + " TODATE " +toD);
	  
	   $.ajax({
           url:'/onboard/daterange',
           data:{fromD:fromD,toD : toD},
           type:'POST',
           cache:false,    
           success:function(value){
               console.log("data",value);
               var num=value.split(",");
               var select = document.getElementById("projectvaluepie"); 
               //append the project list in to dropdown
               select.innerHTML = "<select> <option value='' disabled selected>--ProjectList--</option>";
               var myarray = value.split(',');
               
               for(var i = 0; i < num.length; i++)
               {
              var opt = num[i];
                select.innerHTML += "<option value=\"" + opt + "\">" + opt + "</option>";
               }
              
               select.innerHTML+="</select>";
               demo(num);
           },
           error:function(){
               console.log('error');
           }
       });
	   
   }
   </script>
          <script type="text/javascript">

   function application_bar(x,name){
	  window.alert("project dropdown "+x);
	   $.ajax({
           url:'/onboard/application_graph',
           data:{projects:x},
           type:'POST',
           cache:false,    
           success:function(value){
               console.log("data",value);
               var num=value.split("/");
               var cnt0=0,cnt1=0,cnt2=0,cnt3=0;
               alert(num[0]);
               alert(num[1]);
               alert(num[2]);
               alert(num[3]);
               if(num[0]===undefined)
            	   cnt0=0;
               else if(num[0]!="")
            	    cnt0=num[0].split(',').length-1;
               
               if(num[1]===undefined)
            	   cnt1=0;
               else if(num[1]!="")
            	    cnt1=num[1].split(',').length-1;
               
               if(num[2]===undefined)
            	   cnt2=0;
               else if(num[2]!="")
            	    cnt2=num[2].split(',').length-1;
               
               if(num[3]===undefined)
            	   cnt3=0;
               else if(num[3]!="")
            	    cnt3=num[3].split(',').length-1;
                alert(cnt0+" "+cnt1+" "+cnt2+" "+cnt3);
                if(name=="barchart"){
                	alert("barchart");
                           var dataTable = new google.visualization.DataTable();
    		   dataTable.addColumn('string', 'Status');
    		   dataTable.addColumn('number', 'Visits');
    		   // A column for custom tooltip content
    		   dataTable.addColumn({type: 'string', role: 'tooltip'});
    		   dataTable.addRows([
    			   ['Requirements',cnt0,"Applications:'"+num[0]+"'"], 
    			   ['Development',cnt1,"Applications:'"+num[1]+"'"],
    			   ['Testing', cnt2,"Applications:'"+num[2]+"'"],
    			   ['Deployment',cnt3,"Applications:'"+num[3]+"'"] 

    			   ]);

    		   var options = { legend: 'none' };
    		   var chart = new google.visualization.ColumnChart(document.getElementById('tooltip_action'));
    		   chart.draw(dataTable, options);
                }
                else
                	{
    		   var dataTable = new google.visualization.DataTable();
    		   dataTable.addColumn('string', 'Status');
    		   dataTable.addColumn('number', 'Visits');
    		   // A column for custom tooltip content
    		   dataTable.addColumn({type: 'string', role: 'tooltip'});
    		   dataTable.addRows([
    			   ['Requirements',cnt0,"Applications:'"+num[0]+"'"], 
    			   ['Development',cnt1,"Applications:'"+num[1]+"'"],
    			   ['Testing', cnt2,"Applications:'"+num[2]+"'"],
    			   ['Deployment',cnt3,"Applications:'"+num[3]+"'"] 

    			   ]);

    		   var options = { legend: 'bottom',
		    		      is3D: true}
    		   var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    		   chart.draw(dataTable, options);
                	}    	 
           },
           error:function(){
               console.log('error');
           }
       });
	   
   }
   </script>
   <!-- get Piechart value -->
     
   
   <script type="text/javascript">

   function getDateValuepie(){
		
		var piefrom = document.getElementById("fromDatepie").value;
		var pieto = document.getElementById("toDatepie").value;
		
		//console.log("Piechartfromdate : " +piefrom + "Piecharttodate :" + pieto );
		 $.ajax({
	         url:'/onboard/piedaterange',
	         data:{piefrom:piefrom,pieto : pieto},
	         type:'POST',
	         cache:false,
	         success:function(value){
	             console.log("project data : ", value);
	             var num=value.split(",");
	             var select = document.getElementById("projectvaluepiechart"); 
	             //append the project list in to dropdown
	             select.innerHTML = "<select> <option value='' disabled selected>--ProjectList--</option>";
	             var myarray = value.split(',');
	             
	             for(var i = 0; i < myarray.length; i++)
	             {
	            	 var opt = myarray[i];
	         	    select.innerHTML += "<option value=\"" + opt + "\">" + opt + "</option>";
	             }
	            
	             select.innerHTML+="</select>";
	             
	             dateRange(num);
	             
	         },
	         error:function(){
	             console.log('error');
	         }
	     }
	 );
		
	}

   </script>
   
   <script>
   var projectname1=[];
   var projectname2=[];
   var projectname3=[];
   var projectname4=[];
   var level1=[];
   var progressbar=[];
   var status=[];
   var mem_ass=[];
   var num_ass=[];
   var count1=0,count2=0,count3=0,count4=0;
     <%
     String Project_names[]=new String[20];
     String dbquery="select projectname from AppEmphazize_ProjectDetails";
     Statement dst = conn.createStatement();
     ResultSet drs = dst.executeQuery(dbquery);
     int ttl_cnt=0;
     while(drs.next()){ 
    	 Project_names[ttl_cnt]=drs.getString("projectname");
     %>
     <%
     String db_query="select * from ArchiveExecution_Details where level=1 and projects='"+drs.getString("projectname")+"'";
     Statement db_st = conn.createStatement();
     ResultSet db_rs = db_st.executeQuery(db_query);
     String db_query1="select count(*) from ArchiveExecution_Details where projects='"+drs.getString("projectname")+"' and mem_ass!=''";
     Statement db_st1 = conn.createStatement();
     ResultSet db_rs1 = db_st1.executeQuery(db_query1);
     if(db_rs1.next()){%>
   	  num_ass.push("<%=db_rs1.getString(1)%>");
   	  <%}
     while(db_rs.next())
     {
     	if(db_rs.getString("name").equals("Ideation and Initiate") && !db_rs.getString("progressbar").equals("100")){ %>
     		count1++;
     	     projectname1.push("<%=drs.getString(1)%>");
     		progressbar.push("<%=db_rs.getString("progressbar")%>");
     		
     	<%	break;
     	}
     	else if(db_rs.getString("name").equals("Plan") && !db_rs.getString("progressbar").equals("100"))
     	{ %>
     	count2++;
        projectname2.push("<%=drs.getString(1)%>");
 		  progressbar.push(<%=db_rs.getString("progressbar")%>);
 				
     	<%	break;
     	}
     	else if(db_rs.getString("name").equals("Execute") && !db_rs.getString("progressbar").equals("100"))
     	{ %>
     	  count3++;
          projectname3.push("<%=drs.getString(1)%>");
 		  progressbar.push("<%=db_rs.getString("progressbar")%>");
 		 
     	<%	break;
     	}
     	else if(db_rs.getString("name").equals("Closure") && !db_rs.getString("progressbar").equals("100"))
     	{ %>
     	  count4++;
          projectname4.push("<%=drs.getString(1)%>");
 		  progressbar.push("<%=db_rs.getString("progressbar")%>");
 		 
     	<%	break;
     	}
     	
     }
  
     ttl_cnt++;
     }
  %>
 
      google.charts.load('current', {'packages':['corechart']});
 google.charts.setOnLoadCallback(draw_Chart);
 function draw_Chart() {
   var dataTable = new google.visualization.DataTable();
   dataTable.addColumn('string', 'Status');
   dataTable.addColumn('number', 'Visits');
   // A column for custom tooltip content
   dataTable.addColumn({type: 'string', role: 'tooltip'});
   dataTable.addRows([
	   ['Ideation and Initiate',count1,"Projects:'"+projectname1+"'"], 
	   ['Plan',count2,"Projects:'"+projectname2+"'"],
	   ['Execute', count3,"Projects:'"+projectname3+"'"],
	   ['Hypercare', count4,"Projects:'"+projectname4+"'"] 

	   ]);

   var options = { legend: 'none' };
   var chart = new google.visualization.ColumnChart(document.getElementById('tooltip_action'));
   chart.draw(dataTable, options);
 }
 function demo(num)
 {
	 var project_Name1=[];
	 var project_Name2=[];
	 var project_Name3=[];
	 var project_Name4=[];
	 var cnt1=0,cnt2=0,cnt3=0,cnt4=0;
	   for(var i=0;i<num.length;i+=1){
		   for(var j=0;j<count1;j+=1)
			   {
		   if(num[i]==projectname1[j])
			   {
			   project_Name1.push(projectname1[j]);
			   cnt1++;
			   }
			   }
		   for(var j=0;j<count2;j+=1)
		   {
	   if(num[i]==projectname2[j])
		   {
		   project_Name2.push(projectname2[j]);
		   cnt2++;
		   }
		   }
		   for(var j=0;j<count3;j+=1)
		   {
	   if(num[i]==projectname3[j])
		   {
		   project_Name3.push(projectname3[j]);
		   cnt3++;
		   }
		   }
		   for(var j=0;j<count4;j+=1)
		   {
	   if(num[i]==projectname4[j])
		   {
		   project_Name4.push(projectname4[j]);
		   cnt4++;
		   }
		   }
	   }
		   var dataTable = new google.visualization.DataTable();
		   dataTable.addColumn('string', 'Status');
		   dataTable.addColumn('number', 'Visits');
		   // A column for custom tooltip content
		   dataTable.addColumn({type: 'string', role: 'tooltip'});
		   dataTable.addRows([
			   ['Ideation and Initiate',cnt1,"Projects:'"+project_Name1+"'"], 
			   ['Plan',cnt2,"Projects:'"+project_Name2+"'"],
			   ['Execute', cnt3,"Projects:'"+project_Name3+"'"],
			   ['Hypercare', cnt4,"Projects:'"+project_Name4+"'"] 

			   ]);

		   var options = { legend: 'none' };
		   var chart = new google.visualization.ColumnChart(document.getElementById('tooltip_action'));
		   chart.draw(dataTable, options);
	 
	   //alert("num is "+num);
 }
      </script>
      
 
      
     
    <!-- Piechart -->
    
    <script type="text/javascript">
    var projectName1=[];
    var projectName2=[];
    var projectName3=[];
    var projectName4=[];
    var level2=[];
    var progressBar=[];
    var status1=[];
    var mem_Ass=[];
    var num_Ass=[];
    var count1p=0,count2p=0,count3p=0,count4p=0;
    <%
    String Project_Names[]=new String[20];
    String dbQuery="select projectname from AppEmphazize_ProjectDetails";
    Statement dstp = conn.createStatement();
    ResultSet drsp = dst.executeQuery(dbquery);
    int ttl_cntp=0;
    while(drsp.next()){ 
   	 Project_Names[ttl_cntp]=drsp.getString("projectname");
   	  	 
    %>
    <%
    String db_query="select * from ArchiveExecution_Details where level=1 and projects='"+drsp.getString("projectname")+"'";
    Statement db_st = conn.createStatement();
    ResultSet db_rs = db_st.executeQuery(db_query);
    String db_query1="select count(*) from ArchiveExecution_Details where projects='"+drsp.getString("projectname")+"' and mem_Ass!=''";
    Statement db_st1 = conn.createStatement();
    ResultSet db_rs1 = db_st1.executeQuery(db_query1);
    if(db_rs1.next()){%>
    num_Ass.push("<%=db_rs1.getString(1)%>");
    <%}
    while(db_rs.next())
    {
    	if(db_rs.getString("name").equals("Ideation and Initiate") && !db_rs.getString("progressbar").equals("100")){ %>
    		count1p++;
    	     projectName1.push("<%=drsp.getString(1)%>");
    		progressbar.push("<%=db_rs.getString("progressbar")%>");
    		<%	break;
     	}
     	else if(db_rs.getString("name").equals("Plan") && !db_rs.getString("progressbar").equals("100"))
     	{ %>
     	count2p++;
        projectName2.push("<%=drsp.getString(1)%>");
 		  progressbar.push(<%=db_rs.getString("progressbar")%>);
 				
     	<%	break;
     	}
     	else if(db_rs.getString("name").equals("Execute") && !db_rs.getString("progressbar").equals("100"))
     	{ %>
     	  count3p++;
          projectName3.push("<%=drsp.getString(1)%>");
 		  progressbar.push("<%=db_rs.getString("progressbar")%>");
 		 
     	<%	break;
     	}
     	else if(db_rs.getString("name").equals("Closure") && !db_rs.getString("progressbar").equals("100"))
     	{ %>
     	  count4p++;
          projectName4.push("<%=drsp.getString(1)%>");
 		  progressbar.push("<%=db_rs.getString("progressbar")%>");
    		
    <%	break;
     	}
     	
     }
  
     ttl_cntp++;
     }
  %>
    
    
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(draw_Chart);
  function draw_Chart() {
    var dataTable = new google.visualization.DataTable();
    dataTable.addColumn('string', 'Status');
    dataTable.addColumn('number', 'Visits');
    // A column for custom tooltip content
    dataTable.addColumn({type: 'string', role: 'tooltip'});
    dataTable.addRows([
    	  ['Ideation and Initiate',count1p,"Projects:'"+projectName1+"'"], 
   	   ['Plan',count2p,"Projects:'"+projectName2+"'"],
   	   ['Execute', count3p,"Projects:'"+projectName3+"'"],
   	   ['Hypercare', count4p,"Projects:'"+projectName4+"'"] 
 	   ]);

    var options = { legend: 'bottom',
    		      is3D: true,
    		
    };
    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    chart.draw(dataTable, options);
  }
    
  
  function dateRange(num){
	  
	  var project_Name1=[];
		 var project_Name2=[];
		 var project_Name3=[];
		 var project_Name4=[];
		 var cnt1=0,cnt2=0,cnt3=0,cnt4=0;
		   for(var i=0;i<num.length;i+=1){
			   for(var j=0;j<count1;j+=1)
				   {
			   if(num[i]==projectname1[j])
				   {
				   project_Name1.push(projectname1[j]);
				   cnt1++;
				   }
				   }
			   for(var j=0;j<count2;j+=1)
			   {
		   if(num[i]==projectname2[j])
			   {
			   project_Name2.push(projectname2[j]);
			   cnt2++;
			   }
			   }
			   for(var j=0;j<count3;j+=1)
			   {
		   if(num[i]==projectname3[j])
			   {
			   project_Name3.push(projectname3[j]);
			   cnt3++;
			   }
			   }
			   for(var j=0;j<count4;j+=1)
			   {
		   if(num[i]==projectname4[j])
			   {
			   project_Name4.push(projectname4[j]);
			   cnt4++;
			   }
			   }
		   }
			   var dataTable = new google.visualization.DataTable();
			   dataTable.addColumn('string', 'Status');
			   dataTable.addColumn('number', 'Visits');
			   
			   // A column for custom tooltip content
			   dataTable.addColumn({type: 'string', role: 'tooltip'});
			   dataTable.addRows([
				   ['Ideation and Initiate',cnt1,"Projects:'"+project_Name1+"'"], 
				   ['Plan',cnt2,"Projects:'"+project_Name2+"'"],
				   ['Execute', cnt3,"Projects:'"+project_Name3+"'"],
				   ['Hypercare', cnt4,"Projects:'"+project_Name4+"'"] 

				   ]);

			   var options = { legend: 'bottom',
		    		      is3D: true}
			   var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			   chart.draw(dataTable, options);
	  
	  
	  
	  
	  
  }
  
   </script>
 

    
   <script>
function myColumnchart(){
	
	
	var x = document.getElementById("rowtable").style.display='none';
	var y = document.getElementById("rowbarchart").style.display='block';
	
	
	
   
	
}

</script>

<script>
function myTablechart(){
	
	
	var x = document.getElementById("rowtable").style.display='block';
	var y = document.getElementById("rowbarchart").style.display='none';
	
   
	
}

</script> 
    
    
      
  <%
}

}
catch(Exception e){}
%>    
           
 
      

                        </section>
                        <!-- /.section -->

                    </div>
                    <!-- /.main-page -->
                 
<!-- Project List End -->

                </div>
                <!-- /.content-container -->
            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /.main-wrapper -->
                          
         </div>
         
   
       <!-- ========== COMMON JS FILES ========== -->
       
      
       
       
        
        
       
        <script src="js/jquery-ui/jquery-ui.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>

        <!-- ========== PAGE JS FILES ========== -->
        <script src="js/prism/prism.js"></script>
        <script src="js/waypoint/waypoints.min.js"></script>
        <script src="js/counterUp/jquery.counterup.min.js"></script>
        <script src="js/amcharts/amcharts.js"></script>
        <script src="js/amcharts/serial.js"></script>
        <script src="js/amcharts/plugins/export/export.min.js"></script>
        <link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all" />
        <script src="js/amcharts/themes/light.js"></script>
        <script src="js/toastr/toastr.min.js"></script>
        <script src="js/icheck/icheck.min.js"></script>
        <script src="js/bootstrap-tour/bootstrap-tour.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>
        <script src="js/production-chart.js"></script>
        <script src="js/traffic-chart.js"></script>
        <script src="js/task-list.js"></script>
       
        <!-- ========== PAGE JS FILES ========== -->
        
        <script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/datepair.js"></script>
        <script type="text/javascript" src="js/date-picker/moment.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

        <!-- ========== THEME JS ========== -->
        <script>
            $(function($) {

                // 1st  datepicker
                $('#basicExample .time').timepicker({
                'showDuration': true,
                'timeFormat': 'g:ia'
                });

                $('#basicExample .date').datepicker({
                'format': 'd/m/yyyy',
                'autoclose': true
                });

                var basicExampleEl = document.getElementById('basicExample');
                var datepair = new Datepair(basicExampleEl);

                // 2nd  datepicker
                $('#datetimepicker1').datetimepicker({
                    debug: true
                });

                // 3rd  datepicker
                $('#datetimepicker9').datetimepicker({
                viewMode: 'years'
                });

                // 4th  datepicker
                $('#datetimepicker10').datetimepicker({
                viewMode: 'years',
                format: 'MM/YYYY'
                });

                // 5th  datepicker
                $('#datetimepicker11').datetimepicker({
                daysOfWeekDisabled: [0, 6]
                });

                // 6th  datepicker
                $('#datetimepicker12').datetimepicker({
                    inline: true,
                    sideBySide: true
                });
            });
        </script>
       
        

        
</body>
</html>