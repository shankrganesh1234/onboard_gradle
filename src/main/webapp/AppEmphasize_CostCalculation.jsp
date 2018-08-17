<!DOCTYPE html>
<html lang="en">
<head>

<title>Project Information</title>
 <meta charset="UTF-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <script src="js/jquery/jquery-2.2.4.min.js"></script>
    
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
        </style>
<script src="js_in_pages/tree1.js"></script>
  
</head>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed AppEmphazize_CostCalculation JSP PAGE-----[INFO]");  %>
    <%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="onboard.DBconnection" %>

<%
double ans=0.0;
try {
HttpSession details=request.getSession();
String roles=(String)details.getAttribute("role");
String info=(String)details.getAttribute("app_emp");
String appno=(String)details.getAttribute("appno");
String projectname=(String)details.getAttribute("nameofproject");
String det=(String)session.getAttribute("theName");
String appl=(String)details.getAttribute("applications");
String prj=(String)details.getAttribute("projects");
//System.out.println("-- "+info+"-- "+appno+"---"+projectname+"---"+det);
 
DBconnection d=new DBconnection();
Connection conn = (Connection)d.getConnection();
String query = "SELECT * from AppEmphazize_ApplicationPrioritization where prj_name='"+projectname+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query3 = "select * from AppEmphazize_ProjectDetails where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
//System.out.println(projectname);
String query1="";
if(prj.equals("all"))
	 query1 = "select * from AppEmphazize_ApplicationInfo where prjname = '"+projectname+"'";
else
	 query1 = "select * from AppEmphazize_ApplicationInfo where prjname = '"+prj+"' and appname='"+appl+"'";
//System.out.println(query1);
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);
String query2= "SELECT * from AppEmphazize_ApplicationPrioritization where prj_name='"+projectname+"'";
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);
PreparedStatement statement =  conn.prepareStatement("select sum(ttl_cst_fr_app) from AppEmphazize_ApplicationPrioritization where prj_name='"+projectname+"'");
ResultSet result = statement.executeQuery();
result.next();
String sum=result.getString(1);
{
%>


<script type="text/javascript">
  var total;
 function updatesum() {
var datasize=document.loginForm.data_size.value;
  var currentuser=document.loginForm.curnt_users.value;
  
var temp,temp1,temp2,temp3,total,result;
if(datasize.charAt(0)=='<' && currentuser.charAt(1)=='1'&&currentuser.length<=3)
{
document.loginForm.complexity.value ="Low";
}
if(datasize.charAt(0)=='<' && currentuser.charAt(1)=='2')
{
document.loginForm.complexity.value ="Low";
}
if(datasize.charAt(0)=='<' && currentuser.charAt(1)=='5')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(datasize.charAt(0)=='<' && currentuser.charAt(1)=='1'&&currentuser.length==4)
{
document.loginForm.complexity.value ="Low to Medium";
}
if(datasize.charAt(0)=='<' && currentuser.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium";
}
if(datasize.charAt(0)=='1' && currentuser.charAt(1)=='1'&&currentuser.length<=3)
{
document.loginForm.complexity.value ="Low";
}
if(datasize.charAt(0)=='1' && currentuser.charAt(1)=='2')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(datasize.charAt(0)=='1' && currentuser.charAt(1)=='5')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(datasize.charAt(0)=='1' && currentuser.charAt(1)=='1'&&currentuser.length==4)
{
document.loginForm.complexity.value ="Medium";
}
if(datasize.charAt(0)=='1' && currentuser.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium";
}
if(datasize.charAt(0)=='2' && currentuser.charAt(1)=='1'&&currentuser.length<=3)
{
document.loginForm.complexity.value ="Low to Medium";
}
if(datasize.charAt(0)=='2' && currentuser.charAt(1)=='2')
{
document.loginForm.complexity.value ="Low to Medium";
}
if(datasize.charAt(0)=='2' && currentuser.charAt(1)=='5')
{
document.loginForm.complexity.value ="Medium";
}
if(datasize.charAt(0)=='2' && currentuser.charAt(1)=='1'&&currentuser.length==4)
{
document.loginForm.complexity.value ="Medium";
}
if(datasize.charAt(0)=='2' && currentuser.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium to High";
}
if(datasize.charAt(0)=='5' && currentuser.charAt(1)=='1'&&currentuser.length<=3)
{
document.loginForm.complexity.value ="Low to Medium";
}
if(datasize.charAt(0)=='5' && currentuser.charAt(1)=='2')
{
document.loginForm.complexity.value ="Medium";
}
if(datasize.charAt(0)=='5' && currentuser.charAt(1)=='5')
{
document.loginForm.complexity.value ="Medium";
}
if(datasize.charAt(0)=='5' && currentuser.charAt(1)=='1'&&currentuser.length==4)
{
document.loginForm.complexity.value ="Medium to High";
}
if(datasize.charAt(0)=='5' && currentuser.charAt(0)=='1')
{
document.loginForm.complexity.value ="Medium to High";
}
if(datasize.charAt(0)=='>' && currentuser.charAt(1)=='1'&&currentuser.length<=3)
{
document.loginForm.complexity.value ="Medium";
}
if(datasize.charAt(0)=='>' && currentuser.charAt(1)=='2')
{
document.loginForm.complexity.value ="Medium";
}
if(datasize.charAt(0)=='>' && currentuser.charAt(1)=='5')
{
document.loginForm.complexity.value ="Medium to High";
}
if(datasize.charAt(0)=='>' && currentuser.charAt(1)=='1'&&currentuser.length==4)
{
document.loginForm.complexity.value ="Medium to High";
}
if(datasize.charAt(0)=='>' && currentuser.charAt(0)=='1')
{
document.loginForm.complexity.value ="High";
}
if(document.loginForm.complexity.value=="Low")
{
//document.loginForm.est_archive.value =700;
document.loginForm.est_scrn.value ="<=5";
result=1;
}
if(document.loginForm.complexity.value=="Low to Medium")
{
//document.loginForm.est_archive.value =1000;
document.loginForm.est_scrn.value ="<=10";
result=2;
}
if(document.loginForm.complexity.value=="Medium")
{
//document.loginForm.est_archive.value =1400;
document.loginForm.est_scrn.value ="<=20";
result=3;
}
if(document.loginForm.complexity.value=="Medium to High")
{
//document.loginForm.est_archive.value =1800;
document.loginForm.est_scrn.value ="<=25";
result=4;
}
if(document.loginForm.complexity.value=="High")
{
//document.loginForm.est_archive.value =2500;
document.loginForm.est_scrn.value ="<=30";
result=5;
}
var appnumber=<%=appno%>;
document.loginForm.est_db_size.value=(document.loginForm.no_of_app_complexity.value*0.001*document.loginForm.strg_est.value).toFixed(2);
document.loginForm.est_hrs.value =(document.loginForm.no_of_app_complexity.value*document.loginForm.est_archive.value).toFixed(2);
temp=(100*document.loginForm.est_hrs.value);
document.loginForm.est_cst.value="$"+temptoFixed(2);
temp1=document.loginForm.est_db_size.value*document.loginForm.IA_lic_cst.value;
document.loginForm.ttl_IA_cst.value ="$"+temp1.toFixed(2);
temp2=10000*document.loginForm.est_db_size.value;
document.loginForm.ttl_infra_cst.value="$"+temp2.toFixed(2);
temp3=5*temp3*0.01*document.loginForm.IA_maint_cst.value
document.loginForm.ttl_IA_prdct_cst.value ="$"+temp3.toFixed(2);
total=temp+temp1+temp2+temp3;
document.loginForm.ttl.value="$"+total.toFixed(2);
document.loginForm.tootal.value=total.toFixed(2);
document.loginForm.ttl_cst_fr_app.value=<%=sum%>+(total.toFixed(2)-0);
document.loginForm.est_archive_cst.value="$"+document.loginForm.ttl_cst_fr_app.value.toFixed(2); 
}
function add()
{
var sum;
sum=(document.loginForm.ttl_cst_fr_app.value-0)+(document.loginForm.add_cst_fr_contigenccurrentuser.value-0)+(document.loginForm.add_cst.value-0)+(document.loginForm.IA_app_sprt_cst.value-0);
document.loginForm.est_archive_cst.value="$"+sum.toFixed(2); 
}
</script>
 
<form class="form-signin" name="loginForm" method="post">

        <div class="main-wrapper">
            
            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
            
                    <div class="row">
                        <div class="navbar-header no-padding">
                			
           <%if (rs3.next()) {%>
                    <a class="navbar-brand" href="Project_list.jsp" id="sitetitle">
                			    <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                			</a>
             <%        String q2="select * from ArchiveExecution_Details where level=1 and projects='"+projectname+"'order by seq_num";
Statement s2 = conn.createStatement();
ResultSet rss = s2.executeQuery(q2);
while(rss.next())
{
session.setAttribute(rss.getString(3),rss.getString(15));
}%>

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
                           <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %></a>
				

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
<li><a href="Archive_Execution.jsp"><i class="fa fa-suitcase"></i> <span>Archive Execution Module</span></a>
               </li> 
                                </ul>		
                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->
            
       
 <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>

   <script>
  $(function () {
    // 6 create an instance when the DOM is ready
    $('#jstree').jstree();
    // 7 bind to events triggered on the tree
    $('#jstree').on("changed.jstree", function (e, data) {
      console.log(data.selected);
    });
    // 8 interact with the tree - either way is OK
    $('button').on('click', function () {
      $('#jstree').jstree(true).select_node('child_node_1');
      $('#jstree').jstree('select_node', 'child_node_1');
      $.jstree.reference('#jstree').select_node('child_node_1');
    });
  });
  </script>

  </script>
  
<!-- Projects List Start -->

                        <section>

                                <div class="row">
                                	<div class="container">
                                    <div class="col-md-12">

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

<br>
<div class="row">

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Initiate</label></center>
  <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar" style="width: <%=initiate%>%" aria-valuenow="<%=initiate %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=initiate %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Plan</label></center>
  <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar1" style="width: <%=plan%>%" aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=plan %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Execute</label></center>
  <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar2" style="width: <%=execute %>%" aria-valuenow="<%=execute %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=execute %>%</span></div>
</div></div></div>

 <div class="col-md-3">
 <div class="form-group">
 <center><label >Closure</label></center>
 <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-stripedss-bar" role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=hypercare %>%</span></div>
</div></div></div>
</div><jsp:include page="progress_details.jsp" >
<jsp:param name="Initiate" value="<%=initiate %>"/>
<jsp:param name="Plan" value="<%=plan %>"/>
<jsp:param name="Execute" value="<%=execute %>"/>
<jsp:param name="Hypercare" value="<%=hypercare %>"/>
</jsp:include>


<div class="row">
        
            <div class="row bs-wizard" style="border-bottom:0;">
                
                <div class="col-xs-3 bs-wizard-step complete">
                  <div class="text-center bs-wizard-stepnum">Project Information</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot" style="color:white">1</a>
                </div>
                
                <div class="col-xs-3 bs-wizard-step active"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Application Complexity </div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">2</a>
                  <div class="bs-wizard-info text-center"></div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- complete -->
                  <div class="text-center bs-wizard-stepnum">Prioritized Applications</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">3</a>
                  <div class="bs-wizard-info text-center"></div>
                </div>
                
                <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                  <div class="text-center bs-wizard-stepnum">Final</div>
                  <div class="progress"><div class="progress-bar"></div></div>
                  <a href="#" class="bs-wizard-dot">4</a>
                  <div class="bs-wizard-info text-center"></div>
                </div>
            </div>
               <br/>
                    <div class="panel-group" id="panels1"> 
                <!-- <div class="panel-heading"> 
                                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse1" onclick="switchColors0();"> Parameters   </a> </h4> 
                            </div>  
                                                       
                             <div id="collapse1" class="panel-collapse collapse in"> 
                                <div class="panel-body text-left">
                                
                                <%if(rs.next()){
                                
                                	%>
                                    
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526"><div class="required">Project Name&nbsp;<span class="text-danger">*</span></div></label>
                                            <input type="text" class="form-control" id="prj_name"  name="prj_name" value="<%=projectname %>" required>
                                        </div>
                                       
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526"><div class="required">IA License cost per TB($)&nbsp;<span class="text-danger">*</span></div></label>
                                            <input type="text" class="form-control" id="IA_lic_cst"  name="IA_lic_cst" value="<%=rs.getString("IA_lic_cst")%>" required>
                                        </div>
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput526"><div class="required">IA Maintenance Cost Per Year(%)&nbsp;<span class="text-danger">*</span></div></label>
                                            <input type="text" class="form-control" id="IA_maint_cst"  name="IA_maint_cst" value="<%=rs.getString("IA_maint_cst")%>" required>
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput316"><div class="required">Infra Structure Cost per TB($)&nbsp;<span class="text-danger">*</span></div></label>
                                              <input type="text" class="form-control" id="Infrastrct_cst"  name="Infrastrct_cst" value="<%=rs.getString("Infrastrct_cst")%>" required> 
                                         </div>
                                        <div class="form-group">
                                       
                                            <label class="control-label" for="formInput526"><div class="required">Storage Estimate(%)&nbsp;<span class="text-danger">*</span></div></label>
                                            <input type="text" class="form-control" id="strg_est"  name="strg_est" value="<%=rs.getString("strg_est")%>" required>
                                      
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526"><div class="required">Labor Cost Per Hour for IA Dev Team($)&nbsp;<span class="text-danger">*</span></div></label>
                                            <input type="text" class="form-control" id="lab_cst"  name="lab_cst" value="<%=rs.getString("lab_cst")%>" required>
                                        </div>
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput526"><div class="required">Number of Applications based on Complexity&nbsp;<span class="text-danger">*</span></div></label>
                                            <input type="text" class="form-control" id="no_of_app_complexity"  name="no_of_app_complexity" value="<%=rs.getString("no_of_app_complexity")%>" required>
                                        </div>
                                        <div>
                                        <button type="button"  class="btn btn-primary  pull-right" data-toggle="modal" data-target="#myModal" id="btt" onclick="switchColors();"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" style="color:white">  Next</a><span class="glyphicon glyphicon-chevron-right"></span></button>
                                        </div>
                                                                        </div>                                 
                            </div>                             
                        </div> -->
                               <div class="panel panel-default"> 
                            <div class="panel-heading"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2" onclick="switchColors();">    Application Complexity   </a> </h4> 
                            </div>                             
                            <div id="collapse2" class="panel-collapse collapse"> 
                                <div class="panel-body text-left">
                                
                                
  <div class="table-responsive" id="table-scroll"> 
    
    <!-- Initialization 
                * js-dynamitable => dynamitable trigger (table)
                -->
    <table class="js-dynamitable     table table-bordered" id="myTable">
      
      <!-- table heading -->
      <thead>
        
        <!-- Sortering
                        * js-sorter-asc => ascending sorter trigger
                        * js-sorter-desc => desending sorter trigger
                        -->
        <tr>
          <th>Application Name<span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction1()"></span></th>
          <th>Complexity <span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction2()"></span></th>
          <th>Estimated Number of Screens <span class="js-sorter-desc     glyphicon glyphicon-chevron-down pull-right"></span> <span class="js-sorter-asc     glyphicon glyphicon-chevron-up pull-right"></span> <span class="glyphicon glyphicon-search pull-right" onClick="myFunction3()"></span></th>
          </tr>
        
      
      <!-- table body -->
      <tbody>   
        
      
          <%
 
while(rs1.next()){ 
	
%>

        <tr>
        
          <td class="edit_row" style="cursor:pointer" id="1"><%=rs1.getString("appname") %></td>
          <td class="row_s" style="cursor:pointer" id="2"><%=rs1.getString("complexity") %></td>
          <td class="row_t" style="cursor:pointer" id="3"><%=rs1.getString("est_scrn") %></td>
         
       
         
        </tr>
        <% } 
        
 
        %>
        
    </tbody>
    </table>
    <script>
var edit_row = document.querySelectorAll('#myTable .edit_row');
for(var i=0; i<edit_row.length; i++) {
  edit_row[i].addEventListener('click', function(e){
    var tr_parent = this.parentNode;
    document.getElementById('proj_name').value = tr_parent.querySelector('.edit_row').innerHTML;
    var projectname_value=document.getElementById('proj_name').value;
    var knt=0;
 <%
 String query8= "SELECT * from AppEmphazize_ApplicationPrioritization where prj_name='"+projectname+"'";
 Statement st8 = conn.createStatement();
 ResultSet rs8 = st8.executeQuery(query8);
 while(rs8.next())
 {
	 %>
	 valuess="<%=rs8.getString("proj_name")%>";
	 if(valuess==projectname_value)
		 {
		 
		 knt++;
		 
		 document.getElementById('complexity').value = "<%= rs8.getString("complexity") %>";
		    document.getElementById('curnt_users').value = "<%= rs8.getString("curnt_users") %>";
		    document.getElementById('data_size').value = "<%= rs8.getString("data_size") %>";
		    document.getElementById('RO_DATE').value = "<%= rs8.getString("read_date") %>";
		    document.getElementById('SME_DATE').value = "<%= rs8.getString("sme_date") %>";
		    document.getElementById('est_scrn').value = "<%= rs8.getString("est_scrn") %>";
		    }
<% }
 %>
 if(knt==0){
    document.getElementById('complexity').value = " ";
    document.getElementById('curnt_users').value = " ";
    document.getElementById('data_size').value = " ";
    document.getElementById('RO_DATE').value = " ";
    document.getElementById('SME_DATE').value = " ";
    document.getElementById('est_scrn').value = " ";
 }
    }, false);
}
</script>
     
  </div>
  <br />
  
  										 <div class="form-group"> 
                                            <label class="control-label" for="formInput526"><div class="required">Project Name&nbsp;<span class="text-danger">*</span></div></label>
                                            <input type="text" class="form-control" id="prj_name"  name="prj_name" value="<%=projectname %>" required>
                                        </div>
  										<div class="form-group"> 
                                            <label class="control-label" for="formInput526"><div class="required">Number of Applications based on Complexity&nbsp;<span class="text-danger">*</span></div></label>
                                            <input type="text" class="form-control" id="no_of_app_complexity"  name="no_of_app_complexity" value="<%=rs.getString("no_of_app_complexity")%>" required>
                                        </div>
                                 
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput664">Application Name</label>
                                            <input type="text" class="form-control" id="proj_name"  name="proj_name">
                                        </div>                                         
                  
                                              <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Data Size&nbsp;<span class="text-danger">*</span></label>                                             
                                            <select id="data_size" class="form-control" name="data_size" onChange="updatesum()" required > 
                                            <option></option>
                                                <option><100 GB</option>                                                 
                                                <option>100 to 250 GB</option>
                                                <option>250 to 500 GB</option>
                                                <option>500 to 1 TB</option>
                                                <option>>1 TB</option>                                                 
                                            </select>
                                        </div>                    
                                       
                                        
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664"><b>Data Source</b></label> 
                                            </div>
                                            <div class="checkbox"> 
                                            <label class="Data Source"> 
                                                <input type="checkbox" name="data_source" value="regulardb" <%=rs.getString("data_source")%>>Regular DB</label><br />
                                            <label class="Data Source">     <input type="checkbox" name="data_source" value="erp" <%=rs.getString("data_source")%>>ERP</label><br />
                                                <label class="Data Source"> <input type="checkbox" name="data_source" value="product" <%=rs.getString("data_source")%>>Product based 
                                                </label>  <br />                          
                                        </div>
                                        
                                      
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Current users&nbsp;<span class="text-danger">*</span></label>                                             
                                            <select id="curnt_users" class="form-control" name="curnt_users" onChange="updatesum()" required> 
                                            <option></option>
                                                <option><10</option>                                                 
                                                <option><25</option>
                                                <option><50</option>
                                                <option><100</option> 
                                                <option>100 to 500</option>                                                 
                                            </select>
                                        </div>                    
                                       
                                       <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Complexity&nbsp;<span class="text-danger">*</span></label>                                             
                                            <select id="complexity" class="form-control" name="complexity" onChange="updatesum()" required>
                                                <option></option>
                                                <option>Low</option>                                                 
                                                <option>Low to Medium</option>
                                                <option>Medium</option>
                                                <option>Medium to High</option> 
                                                <option>High</option>                                                 
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="formInput664">Read Only Date</label>                                             
                                            <input placeholder="mm/dd/yyyy" type="text" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" id="RO_DATE"  name="read_date" onChange="updatesum()"> 
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="formInput664">SME Availability Date</label>                                             
                                            <input placeholder="mm/dd/yyyy" type="text" class="form-control" id="SME_DATE"  name="sme_date" onChange="updatesum()"> 
                                        </div>          
                                        
                                    
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Number of Screen</label>                                             
                                            <input type="text" class="form-control" id="est_scrn"  name="est_scrn" onChange="updatesum()" > 
                                        </div>
                                                                                                                     
                                </div>                                 
                            </div>                             
                        </div>
                   
                        
                                                 
                         <input type="text" id="pwqej" value="<%= info %>" style="display:none">  
                        <br/>
                      <script>
                      function OnButton1()
                      {
                          document.loginForm.action = "Displaydb"
                          document.loginForm.submit();   
                          document.loginForm.submit();     
                      }
                      </script>
         
                                                                                            
                                   
                                   
<button type="button" class="btn btn-success pull-right" onclick="OnButton1()">Save & Continue ...</button>

        
                            
     
                    <a href="root1.jsp" class="btn btn-default" class="btn pull-right">Cancel</a>
                                      <% } %> 
                                      
</div>

				    </div>
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
            


                            <script>
 if(document.getElementById('pwqej').value=="R")
checkk();
 </script>
                             <%
}
}}
catch(Exception e){}
%>

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