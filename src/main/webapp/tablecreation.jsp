<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed TableCreation JSP PAGE-----[INFO]");  %>

  <%
            String connectionURL = "jdbc:mysql://localhost:3306/Onboarding";
            Connection connection = null;
             Statement statement = null;
                        try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(connectionURL, "root", "password123");

                statement = connection.createStatement();
    
             
                String query1 = "CREATE TABLE `AppEmphazize_ApplicationInfo` ( `appname` varchar(255) DEFAULT NULL, `complexity` varchar(255) DEFAULT NULL, `est_db_size` varchar(255) DEFAULT NULL, `est_cst` varchar(255) DEFAULT NULL, `prjname` varchar(255) DEFAULT NULL, est_scrn varchar(255) DEFAULT NULL )";
                       statement.executeUpdate(query1);
                       
                       String query2 = "CREATE TABLE `ArchiveExecution_Defaultvalues` ( `seq_num` int(11) DEFAULT NULL, `level` int(11) DEFAULT NULL, `name` varchar(255) DEFAULT NULL, `mem_ass` varchar(255) DEFAULT NULL, `act_srt_date` varchar(255) DEFAULT NULL, `act_end_date` varchar(255) DEFAULT NULL, `pln_srt_date` varchar(255) DEFAULT NULL, `pln_end_date` varchar(255) DEFAULT NULL, `hours` varchar(255) DEFAULT NULL, `id` varchar(255) DEFAULT NULL, `ref_id` varchar(255) DEFAULT NULL, `stats` varchar(255) DEFAULT NULL, `planned_hrs` varchar(255) DEFAULT NULL )";
                       statement.executeUpdate(query2);
                       
                       String query3 = "CREATE TABLE `ArchiveExecution_Details` ( `seq_num` int(11) DEFAULT NULL, `level` int(11) DEFAULT NULL, `name` varchar(255) DEFAULT NULL, `mem_ass` varchar(255) DEFAULT NULL, `act_srt_date` varchar(255) DEFAULT NULL, `act_end_date` varchar(255) DEFAULT NULL, `pln_srt_date` varchar(255) DEFAULT NULL, `pln_end_date` varchar(255) DEFAULT NULL, `hours` varchar(255) DEFAULT NULL, `id` varchar(255) DEFAULT NULL, `ref_id` varchar(255) DEFAULT NULL, `stats` varchar(255) DEFAULT NULL, `planned_hrs` varchar(255) DEFAULT NULL, `projects` varchar(255) DEFAULT NULL, `progressbar` varchar(255) DEFAULT NULL, `stats_date` varchar(255) DEFAULT NULL, `comments` varchar(255) DEFAULT NULL )";
                       statement.executeUpdate(query3);
                     
                       
                       String query5="CREATE TABLE `details` ( `level` int(11) DEFAULT NULL, `name` varchar(255) DEFAULT NULL, `id` varchar(255) DEFAULT NULL, `ref_id` varchar(255) DEFAULT NULL, `indx` int(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`indx`) )";
                       statement.executeUpdate(query5);
                       
                       String query6="CREATE TABLE `dummy` ( `value` varchar(255) DEFAULT NULL )";
                       statement.executeUpdate(query6);
                       
                       String query7="CREATE TABLE `AppEmphazize_ProjectDetails` ( `projectname` varchar(255) DEFAULT NULL, `descr` varchar(255) DEFAULT NULL, `appno` varchar(255) DEFAULT NULL, `Startdate` varchar(255) DEFAULT NULL, `Intdate` varchar(255) DEFAULT NULL, `Plandate` varchar(255) DEFAULT NULL, `Execdate` varchar(255) DEFAULT NULL, `Hyperdate` varchar(255) DEFAULT NULL, `Enddate` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`) )";
                       statement.executeUpdate(query7);
                       
                       String query8="CREATE TABLE `Role_Details` ( `role` varchar(255) DEFAULT NULL, `admin` varchar(255) DEFAULT NULL, `app_emp` varchar(255) DEFAULT NULL, `intake` varchar(255) DEFAULT NULL, `arch_exe` varchar(255) DEFAULT NULL, `decomm` varchar(255) DEFAULT NULL, `prgm_governance` varchar(255) DEFAULT NULL, `reporting` varchar(255) DEFAULT NULL, `finance` varchar(255) DEFAULT NULL )";
                       statement.executeUpdate(query8);
                       
                       String query9="CREATE TABLE `Intake_TechnicalDetails` ( `datatype` varchar(255) DEFAULT NULL, `pname` varchar(255) DEFAULT NULL, `archneed` varchar(255) DEFAULT NULL, `formatsp` varchar(255) DEFAULT NULL, `mlang` varchar(255) DEFAULT NULL, `loclang` varchar(255) DEFAULT NULL, `dataretain` varchar(255) DEFAULT NULL, `systemdoc` varchar(255) DEFAULT NULL, `userdoc` varchar(255) DEFAULT NULL, `techdoc` varchar(255) DEFAULT NULL, `traindoc` varchar(255) DEFAULT NULL, `supportdoc` varchar(255) DEFAULT NULL, `datadic` varchar(255) DEFAULT NULL, `testcasedoc` varchar(255) DEFAULT NULL, `testrec` varchar(255) DEFAULT NULL, `designspec` varchar(255) DEFAULT NULL, `validityplan` varchar(255) DEFAULT NULL, `dataloc` varchar(255) DEFAULT NULL, `servername` varchar(255) DEFAULT NULL, `prodinstance` varchar(255) DEFAULT NULL, `prodinstanceloc` varchar(255) DEFAULT NULL, `infraengage` varchar(255) DEFAULT NULL, `sourcearch` varchar(255) DEFAULT NULL, `apphost` varchar(255) DEFAULT NULL, `retenduration` varchar(255) DEFAULT NULL, `clientapp` varchar(255) DEFAULT NULL, `extcustfacing` varchar(255) DEFAULT NULL, `url` varchar(255) DEFAULT NULL, `dbsize` varchar(255) DEFAULT NULL, `nooftable` varchar(255) DEFAULT NULL, `noofrec` varchar(255) DEFAULT NULL, `xmlcount` varchar(255) DEFAULT NULL, `anyvpn` varchar(255) DEFAULT NULL, `vpnacces` varchar(255) DEFAULT NULL, `appintegrate` varchar(255) DEFAULT NULL, `integname` varchar(255) DEFAULT NULL, `decomdate` varchar(255) DEFAULT NULL, `appname` varchar(255) DEFAULT NULL, `projectname` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT, `reqspec` varchar(255) DEFAULT NULL, PRIMARY KEY (`id`) )";
                       statement.executeUpdate(query9);
                       
                       String query10="CREATE TABLE `Admin_UserDetails` ( `uname` varchar(255) DEFAULT NULL, `fname` varchar(255) DEFAULT NULL, `lname` varchar(255) DEFAULT NULL, `email` varchar(255) DEFAULT NULL, `pwd` varchar(255) DEFAULT NULL, `projects` varchar(255) DEFAULT NULL, `roles` varchar(255) DEFAULT NULL, `stats` varchar(255) DEFAULT NULL, `question` varchar(255) DEFAULT NULL, `answer` varchar(255) DEFAULT NULL, `application` varchar(255) DEFAULT NULL )";
                       statement.executeUpdate(query10);
                       
                       String query11="CREATE TABLE `AppEmphazize_ApplicationPrioritization` ( `prj_name` varchar(255) DEFAULT NULL, `IA_lic_cst` varchar(255) DEFAULT NULL, `IA_maint_cst` varchar(255) DEFAULT NULL, `Infrastrct_cst` varchar(255) DEFAULT NULL, `strg_est` varchar(255) DEFAULT NULL, `lab_cst` varchar(255) DEFAULT NULL, `proj_name` varchar(255) DEFAULT NULL, `data_size` varchar(255) DEFAULT NULL, `data_source` varchar(255) DEFAULT NULL, `curnt_users` varchar(255) DEFAULT NULL, `complexity` varchar(255) DEFAULT NULL, `est_archive` varchar(255) DEFAULT NULL, `est_scrn` varchar(255) DEFAULT NULL, `est_db_size` varchar(255) DEFAULT NULL, `est_hrs` varchar(255) DEFAULT NULL, `est_cst` varchar(255) DEFAULT NULL, `ttl_IA_cst` varchar(255) DEFAULT NULL, `ttl_infra_cst` varchar(255) DEFAULT NULL, `ttl_IA_prdct_cst` varchar(255) DEFAULT NULL, `ttl` varchar(255) DEFAULT NULL, `ttl_cst_fr_app` varchar(255) DEFAULT NULL, `add_cst_fr_contigency` varchar(255) DEFAULT NULL, `add_cst` varchar(255) DEFAULT NULL, `IA_app_sprt_cst` varchar(255) DEFAULT NULL, `est_archive_cst` varchar(255) DEFAULT NULL, `id` int(4) NOT NULL AUTO_INCREMENT, `sum` int(11) DEFAULT NULL, `read_date` varchar(255) DEFAULT NULL, `sme_date` varchar(255) DEFAULT NULL, `priorities` varchar(255) DEFAULT NULL, `no_of_app_complexity` varchar(255) DEFAULT NULL, PRIMARY KEY (`id`) )";
                       statement.executeUpdate(query11);
                       
                       String query12="CREATE TABLE `logs` (   `USER_ID` varchar(20) NOT NULL,   `DATED` varchar(25) NOT NULL,   `LOGGER` varchar(50) NOT NULL,   `LEVEL` varchar(10) NOT NULL,   `MESSAGE` varchar(1000) NOT NULL,   `roles` varchar(255) DEFAULT NULL )";
                       statement.executeUpdate(query12);
                       
                       String query13="CREATE TABLE `visits` (   `uname` varchar(255) DEFAULT NULL,   `date` varchar(255) DEFAULT NULL,   `module` varchar(255) DEFAULT NULL,   `count` varchar(255) DEFAULT NULL, `time` varchar(255) DEFAULT NULL, `Projects` varchar(255) DEFAULT NULL, `Applications` varchar(255) DEFAULT NULL)";
                       statement.executeUpdate(query13);
                       
                       String query14=" CREATE TABLE `Intake_ArchivalRequirement` ( `legalholds` varchar(255) DEFAULT NULL, `dataapp` varchar(255) DEFAULT NULL, `dataloc` varchar(255) DEFAULT NULL, `reconsttools` varchar(255) DEFAULT NULL, `viewblob` varchar(255) DEFAULT NULL, `fieldprop` varchar(255) DEFAULT NULL, `fieldtype` varchar(255) DEFAULT NULL, `splchars` varchar(255) DEFAULT NULL, `foreignlang` varchar(255) DEFAULT NULL, `clob` varchar(255) DEFAULT NULL, `unstructarch` varchar(255) DEFAULT NULL, `accrole` varchar(255) DEFAULT NULL, `dataview` varchar(255) DEFAULT NULL, `complctrl` varchar(255) DEFAULT NULL, `errctrl` varchar(255) DEFAULT NULL, `metadata` varchar(255) DEFAULT NULL, `advsearch` varchar(255) DEFAULT NULL, `searchparam` varchar(255) DEFAULT NULL, `appname` varchar(255) DEFAULT NULL, `projectname` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT, PRIMARY KEY (`id`) )";
                       statement.executeUpdate(query14);
                       
                       String query15="CREATE TABLE `Intake_NewRequirements` ( `requirements` varchar(255) DEFAULT NULL, `appname` varchar(255) DEFAULT NULL    )";
                       statement.executeUpdate(query15);
                       
                       String query16="CREATE TABLE `Intake_BuisnessCustomization` (   `label` varchar(255) DEFAULT NULL,   `type_of_box` varchar(255) DEFAULT NULL,   `mandatory` varchar(255) DEFAULT NULL,   `no_of_box` varchar(255) DEFAULT NULL,   `checkbox_labels` varchar(255) DEFAULT NULL,   `no_of_Rbox` varchar(255) DEFAULT NULL,   `radiobox_labels` varchar(255) DEFAULT NULL,   `no_of_drpdwn` varchar(255) DEFAULT NULL,   `dropdown_labels` varchar(255) DEFAULT NULL, `panels` varchar(255) DEFAULT NULL,   `idname` varchar(255) DEFAULT NULL,   `appname` varchar(255) DEFAULT NULL, `projectname` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT,   PRIMARY KEY (`id`) )"; 
                       statement.executeUpdate(query16);
                       
                       String query17 = "CREATE TABLE `Intake_BuisnessDetails` (   `legappname` varchar(255) DEFAULT NULL,   `reftoapp` varchar(255) DEFAULT NULL,   `tid` varchar(255) DEFAULT NULL,   `descr` varchar(255) DEFAULT NULL,   `vendor` varchar(255) DEFAULT NULL,   `expdate` varchar(255) DEFAULT NULL,   `noticeperiod` varchar(255) DEFAULT NULL,   `contractvalue` varchar(255) DEFAULT NULL,   `rod` varchar(255) DEFAULT NULL,   `cmnt` varchar(255) DEFAULT NULL,   `hasdep` varchar(255) DEFAULT NULL,   `dbsize` varchar(255) DEFAULT NULL,   `dataloc` varchar(255) DEFAULT NULL,   `siteloc` varchar(255) DEFAULT NULL,   `needarch` varchar(255) DEFAULT NULL,   `archcmnt` varchar(255) DEFAULT NULL,   `sourceoft` varchar(255) DEFAULT NULL,   `reccode` varchar(255) DEFAULT NULL,   `triggerdate` varchar(255) DEFAULT NULL,   `retentionperiod` varchar(255) DEFAULT NULL,   `retentiontable` varchar(255) DEFAULT NULL,   `retentionname` varchar(255) DEFAULT NULL,   `legalholds` varchar(255) DEFAULT NULL,   `wholegal` varchar(255) DEFAULT NULL,   `archexp` varchar(255) DEFAULT NULL,   `useforBI` varchar(255) DEFAULT NULL,   `creditacc` varchar(255) DEFAULT NULL,   `financialacc` varchar(255) DEFAULT NULL,   `dob` varchar(255) DEFAULT NULL,   `driverlic` varchar(255) DEFAULT NULL,   `email` varchar(255) DEFAULT NULL,   `family` varchar(255) DEFAULT NULL,   `gender` varchar(255) DEFAULT NULL,   `geoloc` varchar(255) DEFAULT NULL,   `img` varchar(255) DEFAULT NULL,   `income` varchar(255) DEFAULT NULL,   `ipadrs` varchar(255) DEFAULT NULL,   `martialstatus` varchar(255) DEFAULT NULL,   `mobid` varchar(255) DEFAULT NULL,   `name` varchar(255) DEFAULT NULL,   `phno` varchar(255) DEFAULT NULL,   `mailadrs` varchar(255) DEFAULT NULL,   `physic` varchar(255) DEFAULT NULL,   `race` varchar(255) DEFAULT NULL,   `religion` varchar(255) DEFAULT NULL,   `sexualpref` varchar(255) DEFAULT NULL,   `ssn` varchar(255) DEFAULT NULL,   `others` varchar(255) DEFAULT NULL,   `expl` varchar(255) DEFAULT NULL,   `localreq` varchar(255) DEFAULT NULL,   `localcountry` varchar(255) DEFAULT NULL,   `localinf` varchar(255) DEFAULT NULL,   `datacenters` varchar(255) DEFAULT NULL,   `extaccess` varchar(255) DEFAULT NULL,   `who` varchar(255) DEFAULT NULL,   `uname` varchar(255) DEFAULT NULL,   `roledesc` varchar(255) DEFAULT NULL,   `accreason` varchar(255) DEFAULT NULL,   `accfreq` varchar(255) DEFAULT NULL,   `sysreq` varchar(255) DEFAULT NULL,   `appname` varchar(255) DEFAULT NULL,   `projectname` varchar(255) DEFAULT NULL,   `app_data_arch` varchar(255) DEFAULT NULL,   `BItarget` varchar(255) DEFAULT NULL,   `BIengagement` varchar(255) DEFAULT NULL,   `id` int(11) NOT NULL AUTO_INCREMENT,   PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;";
                    		   statement.executeUpdate(query17);
                    		   String query18="CREATE TABLE `Intake_TechnicalCustomization` (   `label` varchar(255) DEFAULT NULL,   `type_of_box` varchar(255) DEFAULT NULL,   `mandatory` varchar(255) DEFAULT NULL,   `no_of_box` varchar(255) DEFAULT NULL,   `checkbox_labels` varchar(255) DEFAULT NULL,   `no_of_Rbox` varchar(255) DEFAULT NULL,   `radiobox_labels` varchar(255) DEFAULT NULL,   `no_of_drpdwn` varchar(255) DEFAULT NULL,   `dropdown_labels` varchar(255) DEFAULT NULL, `panels` varchar(255) DEFAULT NULL,   `idname` varchar(255) DEFAULT NULL,   `appname` varchar(255) DEFAULT NULL, `projectname` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT,   PRIMARY KEY (`id`) )"; 
                               statement.executeUpdate(query18);
                               String query19="CREATE TABLE `Intake_ArchivalRequirementCustomization` (   `label` varchar(255) DEFAULT NULL,   `type_of_box` varchar(255) DEFAULT NULL,   `mandatory` varchar(255) DEFAULT NULL,   `no_of_box` varchar(255) DEFAULT NULL,   `checkbox_labels` varchar(255) DEFAULT NULL,   `no_of_Rbox` varchar(255) DEFAULT NULL,   `radiobox_labels` varchar(255) DEFAULT NULL,   `no_of_drpdwn` varchar(255) DEFAULT NULL,   `dropdown_labels` varchar(255) DEFAULT NULL, `panels` varchar(255) DEFAULT NULL,   `idname` varchar(255) DEFAULT NULL,   `appname` varchar(255) DEFAULT NULL, `projectname` varchar(255) DEFAULT NULL, `id` int(11) NOT NULL AUTO_INCREMENT,   PRIMARY KEY (`id`) )"; 
                               statement.executeUpdate(query19);
                        %> 
        <%	} catch (Exception ex) {
      
        	 System.err.println("[ERROR]-----Got an exception!-----Tables are already created----[ERROR]");
            } finally {
                // close all the connections.
                statement.close();
                connection.close();
            }
            %>
   