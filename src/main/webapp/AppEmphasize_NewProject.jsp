<!DOCTYPE html>
<html lang="en">
<head>

   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
 <link rel="stylesheet" href="styles/styles.css" type="text/css" />
    
     <!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

        <!-- ========== PAGE STYLES ========== -->
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
        <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
        <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
        <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
        <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
        <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >

        <!-- ========== MODERNIZR ========== -->
        <script src="js/modernizr/modernizr.min.js"></script>
    <style type="text/css">
            .breadcrumb-div {
                background-color: #e7e7e7;
                color: #010101; }
                #nav_userid{
             color:green;
             }
               
              #nav_role{
              color:blue;
              }  
        </style>


</head>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed AppEmphazize NewProject JSP PAGE-----[INFO]");  %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.ArrayList" %>

<%@page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="onboard.DBconnection" %>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.jsp");
}
%>

 
<form class="form-signin" name="loginForm" method="post" >

<script>

function valid1()
{
 
var project_name = document.getElementsByName("projectname")[0].value;
 
var description = document.getElementsByName("descr")[0].value;
var application_no = document.getElementsByName("appno")[0].value;
var ProjectStartdate = document.getElementsByName("Intdate")[0].value;
var PlanStartdate = document.getElementsByName("Plandate")[0].value;
var ExecuteStartdate = document.getElementsByName("Execdate")[0].value;
var HyperStartdate = document.getElementsByName("Hyperdate")[0].value;
var ProjectEnddate = document.getElementsByName("Enddate")[0].value;
var flag=0;

<%
String[] values_name = new String[5];
ArrayList<String> zoom = new ArrayList<String>();
int i=0;
int count=0;
    String project_name=request.getParameter("projectname"); 
    HttpSession details=request.getSession();
    String roles=(String)details.getAttribute("role");
    DBconnection d=new DBconnection();
    Connection con = (Connection)d.getConnection();
Statement st= con.createStatement(); 


ResultSet rs=st.executeQuery("select projectname from AppEmphazize_ProjectDetails ");
while (rs.next())
{
zoom.add(rs.getString(1));
    
}   


for (String z : zoom) {

%>

if (project_name == "<%= z %>" ) 
 
{
flag=1;
 
}

<% } %> 

 

if (project_name == "" || description == "" || ProjectStartdate == "" || ProjectEnddate == "" )
{
alert("Please fill the mandatory fields");
return false;
}
 
else if (flag == 1)
{
alert("Project Already Exists");
return false;
}
else
{
var f=document.loginForm;
    f.method="post";
    f.action='Project';
    f.submit();   
}
}


function validation(pro_name)
{

if (project_name == Pro_name)
{
alert("Project Already Exists");
}
else
{
var f=document.loginForm;
    f.method="post";
    f.action='Project';
    f.submit(); 
}
 
 
}
</script>
 
 
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

                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
 <ul class="nav navbar-nav navbar-right">
       <%
                         String uname=(String)details.getAttribute("username");
                         String role=(String)details.getAttribute("role");%>                   
	<li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
<li><a href="Logout" class=" text-center"><i class="fa fa-sign-out"></i> Logout</a>
                        </li>
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
                                        <a href="AppEmphasize_EditProject.jsp"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a></li>
                                            <li><a href="AppEmphasize_Application.jsp"> <span>Application Details</span></a></li>
                                        </ul>
                                    </li>

                                  <li class="has-children">
                                        <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application Complexity </span></a></li>                         
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
                                        <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application Complexity</span></a></li>
                                             </ul>
                                    </li>
                                     <li class="has-children">
                                        <a href="Applications.jsp"><i class="fa fa-archive"></i> <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Applications.jsp"> <span>Screen/Report Requirements</span></a></li>
                                            <li><a href="Applications.jsp"> <span>Archive Requirements</span></a></li>
                                        </ul>
                                    </li>
                                    <li class="has-children"><a href="Archive_Execution.jsp">Archive Execution Module</a>
               </li> 
                                </ul>
										
                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->
            
            
            
					
<!-- Projects List Start -->

                    <div class="main-page">
                        <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-sm-6">
                                    <h2 class="title">New Project</h2>
                                    <p class="sub-title">One stop solution for perfect admin!</p>
                                </div>
                                
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-sm-6">
                                    <ul class="breadcrumb">
                                        <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>
                                        <li class="active">New Projects</li>
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

                                <div class="row">
                                    <div class="col-md-12">

                                        <div class="panel">
                                            <div class="panel-heading">
                                                <div class="panel-title">
                                                    <h5>Project Information </h5>
                                                </div>
                                            </div>
                                        <div class="panel-body p-20">
                                        
                   
                                        <form role="form">
                                        
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput198">
                                           <div class="required_fie">   Project Name&nbsp;<span class="text-danger"></span> </div> 
</label>
               <input type="text" class="form-control" id="formInput198" placeholder="Project Name" name="projectname" required/>
              
                                        </div>
                                        <%@ page import="java.sql.*"%>

                                
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput229">
                                            <div class="required_fie">Description&nbsp;<span class="text-danger"></span></div>
</label>
                                            <input type="text" class="form-control" id="formInput229" placeholder="Description" name="descr" required>
                                        </div>
                                       <div class="form-group row log-date">
          <div class="col-md-12">
            <label >No of Applications</label>
            <input placeholder="No of Applications" id="date" name="appno" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
         
		<div class="form-group row log-date">
          <div class="col-md-12" id="basicExample">
            <label class="control-label"><div class="required_fie">Initiate Start Date&nbsp;<span class="text-danger"></span></div></label>
            <input placeholder="mm/dd/yyyy" id="Intdate" name="Intdate" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" type="text" required/>
          </div>
        </div>  
        
        
        
        <div class="form-group row log-date">
          <div class="col-md-12" id="basicExample">
            <label class="control-label required">Plan Start Date</label>
            <input placeholder="mm/dd/yyyy" id="P_S_date" name="Plandate" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" type="text">
          </div>
        </div>    
        
        <div class="form-group row log-date">
          <div class="col-md-12" id="basicExample">
            <label class="control-label required">Execution Start Date</label>
            <input placeholder="mm/dd/yyyy" id="Exec_start_date" name="Execdate" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" type="text">
          </div>
        </div>            
        
        <div class="form-group row log-date">
          <div class="col-md-12" id="basicExample">
            <label class="control-label required">Hypercare Start Date</label>
            <input placeholder="mm/dd/yyyy" id="Hyper_care_date" name="Hyperdate" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" type="text">
          </div>
        </div>  
        
        <div class="form-group row log-date">
          <div class="col-md-12" id="basicExample">
            <label class="control-label required"><div class="required_fie">Project End Date&nbsp;<span class="text-danger"></span></div></label>
            <input placeholder="mm/dd/yyyy" id="Project_end_date" name="Enddate" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" type="text" required>
          </div>
        </div>                 
                            
                        <br/>                
                       <button type="button" class="btn btn-primary btn pull-left" onclick="valid1()">Save</button>&nbsp;
                    <button type="button" class="btn btn-default" onclick="location.href='Project_List.jsp';">Back</button>
                                     
                                </div>                                 
                            </div>                             
                        </div>            
                                                                           </form>                               
                
                                    <!-- /.col-md-6 -->

                                </div>
                                <!-- /.row -->

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
            
		
        <!-- ========== COMMON JS FILES ========== -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <script src="js/jquery-ui/jquery-ui.min.js"></script>
        <script src="js/bootstrap/bootstrap.min.js"></script>
        <script src="js/pace/pace.min.js"></script>
        <script src="js/lobipanel/lobipanel.min.js"></script>
        <script src="js/iscroll/iscroll.js"></script>


        <script type="text/javascript">
            $(document).ready(function() {
                $(".lis").click(function() {
                    $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
                    $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
                });
                $(".gr").click(function() {
                    $(".cbp-vm-switcher").addClass("cbp-vm-view-grid");
                    $(".cbp-vm-switcher").removeClass("cbp-vm-view-list");
                });
            });
        </script>
      

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
        <script src="js/production-chart.js"></script>
        <script src="js/traffic-chart.js"></script>
        <script src="js/task-list.js"></script>

        <!-- ========== THEME JS ========== -->
        <script src="js/main.js"></script>
       
       
        <!-- ========== PAGE JS FILES ========== -->
        <script src="js/prism/prism.js"></script>
        <script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/datepair.js"></script>
        <script type="text/javascript" src="js/date-picker/moment.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


        <!-- ========== THEME JS ========== -->
        
<script type="text/javascript">
    $('.datepicker').datepicker({
    format: 'mm/dd/yyyy',
    startDate: '-3d'
});
</script>


        <!-- ========== THEME JS ========== -->
        <script>
            $(function($) {

                // 1st  datepicker
                $('#basicExample .time').timepicker({
                'showDuration': true,
                'timeFormat': 'g:ia'
                });

                $('#basicExample .date').datepicker({
                'format': 'm/d/yyyy',
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