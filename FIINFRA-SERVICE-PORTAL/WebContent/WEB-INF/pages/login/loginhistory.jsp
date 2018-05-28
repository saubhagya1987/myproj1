<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>View User Access History</title>

   <!-- <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>
<style>

#ui-id-1{
	width:168px!important;
	padding-left:20px!important;}
#ui-id-2{
	width:168px!important;
	padding-left:24px!important;}
.ui-menu-item{
	list-style:none !important;}
.ui-corner-all{
	margin-left:-10px!important;}
.ui-helper-hidden-accessible{color:#000;}

</style>  
 <!-- -responsive css-->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<!--<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />-->
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--<script src="js/jquery-1.9.1.js"></script>-->
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.position.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.menu.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.autocomplete.js"></script>-->
 <script>
	$(function() {
		var availableTags = [
			"ActionScript",
			"AppleScript",
			"Asp",
			"BASIC",
			"C",
			"C++",
			"Clojure",
			"COBOL",
			"ColdFusion",
			"Erlang",
			"Fortran",
			"Groovy",
			"Haskell",
			"Java",
			"JavaScript",
			"Lisp",
			"Perl",
			"PHP",
			"Python",
			"Ruby",
			"Scala",
			"Scheme"
		];
		$( "#tags" ).autocomplete({
			source: availableTags
		});
		
	});
	</script>

<script type="text/javascript">
	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">


</head>
<body>
<jsp:include page="../common/header.jsp" />
<!--css popup window start 1-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px; top:100px" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv')" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>

    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3>Log Trouble Ticket</h3></div>
        <div id="poptable_contactform">
        	
             <div class="full">
              <input type="text" class="form-control" placeholder="Subject">
               </div>
                <div class="full" >
               <textarea class="form-control" rows="3" placeholder="Your Question" style="height: 100px;"></textarea>
			</div>
             <div class="full">
              <input type="text" class="form-control" placeholder="Attach File" >
              
               </div>
 </div>
   <div class="topbuttonholder">
        	<form><input class="dbtn" value="Send Email"   id="loginButton" type="button">	
            <input class="dbtn" value="Cancel" onClick="popup('popUpDiv')"  id="loginButton" type="button">	</form>	
        </div>  
        
	</div>
</div>
<!--css popup window 1 close-->
<!--css popup window start 2-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:650px; height:620px; top:100px; overflow: auto;" id="popUpAlertaddnote" class="alert">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpAlertaddnote')" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
<div id="addnote">
    <div id="popupwrapper_contactform">
   		<div class="heading_contactform" ><h3>Add User</h3></div>
        <div id="poptable_contactform" style="padding:10px; height:250px;">
        <span class="searchpadding padding_top" style="float:left; width:150px;">Role Name   <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" "></span>
 <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Description    </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" "></span>
<div class="clearfix"></div>
       
        <span class="searchpadding padding_top" style="float:left; width:150px;">Access Starts Date <span class="red">*</span>   </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input name="address" type="text" id="date1" class="datepicker" style="float:left;"> <span style="float:left; margin:5px;"> <i class="calendaricon" ></i></span>
<input name="address" type="text" style="width:30px; float:left; margin:0 3px 0 0 ;"  class="form-control"  >&nbsp;
<input name="address" type="text" style="width:30px;; float:left; margin:0 3px 0 0 ;" >&nbsp;
<select name="Saving" class="form-control"  style="width:60px; float:left;">
                                <option>AM</option>	
                                <option>PM</option>
                              
        </select></span>
<div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Access Expires Date  </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input name="address" type="text" id="date1" class="datepicker" style="float:left;"> <span style="float:left; margin:5px;"> <i class="calendaricon" ></i></span>
<input name="address" type="text" style="width:30px; float:left; margin:0 3px 0 0 ;"  class="form-control"  >&nbsp;
<input name="address" type="text" style="width:30px;; float:left; margin:0 3px 0 0 ;" >&nbsp;
<select name="Saving" class="form-control"  style="width:60px; float:left;">
                                <option>AM</option>	
                                <option>PM</option>
                              
        </select></span>

        <div class="clearfix"></div>
         <span class="searchpadding padding_top" style="float:left; width:150px;">Control Options   <span class="red">*</span> </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input id="1" value="1" type="checkbox">
<span class="user">Active?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Locked?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Logged In?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Force Change Password?
</span>
 
 </div>
  <div class="topbuttonholder">
        	<input class="dbtn" value="Save & New" id="Save" type="button">	
            <input class="dbtn" value="Save & Close" id="Save" type="button">	
            <input class="dbtn" value="Cancel" id="Cancel" type="button">	
      </div>
    </div>
	</div>
    
    
    <!-- delete-->
    <div id="deletenote">
    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3> Message</h3></div>
        <div id="poptable_contactform" style="padding:10px;">
        	Do you want to delete this records selected? Please confirm.
 </div>
  <div class="topbuttonholder">
        	<form><input class="dbtn" value="Yes" id="Yes" type="button">	
            <input class="dbtn" value="No" id="No" type="button">
           	</form>	
        </div>
        </div>
	</div>
    
    <!-- delete-->
     <!-- Edit-->
    <div id="editnote">
    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3> Edit User </h3></div>
       <div id="poptable_contactform" style="padding:10px; height:250px;">
        <span class="searchpadding padding_top" style="float:left; width:150px;">Role Name   <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" "></span>
 <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Description    </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" "></span>
<div class="clearfix"></div>
       
        <span class="searchpadding padding_top" style="float:left; width:150px;">Access Starts Date <span class="red">*</span>   </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input name="address" type="text" id="date1" class="datepicker" style="float:left;"> <span style="float:left; margin:5px;"> <i class="calendaricon" ></i></span>
<input name="address" type="text" style="width:30px; float:left; margin:0 3px 0 0 ;"  class="form-control"  >&nbsp;
<input name="address" type="text" style="width:30px;; float:left; margin:0 3px 0 0 ;" >&nbsp;
<select name="Saving" class="form-control"  style="width:60px; float:left;">
                                <option>AM</option>	
                                <option>PM</option>
                              
        </select></span>
<div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Access Expires Date  </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input name="address" type="text" id="date1" class="datepicker" style="float:left;"> <span style="float:left; margin:5px;"> <i class="calendaricon" ></i></span>
<input name="address" type="text" style="width:30px; float:left; margin:0 3px 0 0 ;"  class="form-control"  >&nbsp;
<input name="address" type="text" style="width:30px;; float:left; margin:0 3px 0 0 ;" >&nbsp;
<select name="Saving" class="form-control"  style="width:60px; float:left;">
                                <option>AM</option>	
                                <option>PM</option>
                              
        </select></span>

        <div class="clearfix"></div>
         <span class="searchpadding padding_top" style="float:left; width:150px;">Control Options   <span class="red">*</span> </span>
<span  class="searchpadding padding_top " style="float:left; width:400px; ">
<input id="1" value="1" type="checkbox">
<span class="user">Active?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Locked?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Logged In?</span>
<input id="1" value="1" type="checkbox">
<span class="user">Force Change Password?
</span>
 
 </div>
  <div class="topbuttonholder">
        	<input class="dbtn" value="Save" id="Save" type="button">	
           
            <input class="dbtn" value="Cancel" id="Cancel" type="button">	
      </div>
    </div>
	</div>
</div>
<!--css popup window 2 close-->

    
      <!--Nav Menu Start--> 
 <div class="navbar-inverse">
	<div class="container">
    <div class="navbar-header">
		<button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
    	</button>
    <!--<a class="navbar-brand" href="#"> </a>-->
	</div>


			<div class="container">
				<div class="portfoliostrip collapse navbar-collapse">
					<ul class="navbar-sub">

						<li class="active"><a href="loaduser.htm">User</a></li>
						<li><a href="loadrole.htm">Role</a></li>
						<li><a href="#">Role Access List</a></li>
						<li><a href="#">Security Reports</a></li>

					</ul>
				</div>
			</div>
    </div>
 </div>
<!--Nav Menu End--> 
<!--breadcrum Menu Start--> 
</div>
</div>

 <!-- Center part start -->
 <section>

     
    <div class="container white">
    	<div class="container-head">
    	  <div class="col-md-12" style="text-align: right;"> 
             <!-- accordion start-->
           
           	  <div class="accordion pull-left col-md-12" id="accordFundSel">
                <div class="accordion-group">
                  <div class="col-md-11" style="width:96%;" > 
                 	 	<span  style="float:left;">View User Access History</span>
                  		<span  class="col-md-10" style="float:right; margin-top:-3px;"> <input name="text"  type="text" id="tags"  placeholder="Quick Search"></span>
                  </div>

                </div>
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
  
              
               <!-- accordion End -->
            </div >
          </div >
  	  <div class="container-body" style="margin-top:0px;">
        <!-- center -->


				<ul class="pagination pagination-sm">
					<!-- <li class="disabled"><a href="#">&laquo;</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li> -->
				</ul>
				

		<div class="table-responsive" id="display_table_lead" style="border:none;">
		  <div id="toreload">

						<display:table name="loginHist" uid="objPortalUser"
							class="table table-hover table-bordered table-striped"
							requestURI="#" sort="list" pagesize="10" id="data">
							
							 <display:column title="Role Name"
								property="roleName"></display:column>

                            <display:column title="Login Datetime"
								property="loginDateTime"></display:column>
							<display:column title="User ID"
								property="userId"></display:column>
							<display:column title="Login Mode"
								property="loginAccessModeId"></display:column>
								
							<display:column title="Source IP Address"
								property="sourceIPAddress"></display:column>
								
							<display:column title="Login Status"
								property="isLoginSucceesful"></display:column>	
							
							<display:column title="Failure Reason [Code]">
								<span>${data.failureText}</span>
								<span>[${data.failureCode}]</span>
								</display:column>	
																
							<display:column title="Session ID"
								property="sessionId"></display:column>	
								
							<display:column title="Session Expired?"
								property="isSessionExpired"></display:column>	
								
							<display:column title="Logout datetime"
								property="logoutDateTime"></display:column>	
								
							<display:column title="Redirect URL"
								property="redirectURLFullPath"></display:column>	
									
								
								
							
						

						</display:table>

						<!--     <table id="data" class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0">
<thead>
<tr>
<th width="13%" class="thead"> <a href="#" >Role Name
</a><a href="#"></a></th>
<th width="20%" class="thead"> <a href="#">Login Datetime
</a></th>
<th width="9%" class="thead"> <a href="#">User ID</a></th>
<th width="24%" class="thead"><a href="#">Login Mode
</a></th>
<th width="24%" class="thead"><a href="#">Source IP Address
</a></th>
<th width="24%" class="thead"><a href="#">Login Status
</a></th>
<th width="24%" class="thead"><a href="#">Failure Reason [Code]</a></th>
<th width="24%" class="thead"><a href="#">Session ID</a></th>
<th width="24%" class="thead"><a href="#">Session Expired?</a></th>
<th width="24%" class="thead"> <a href="#">Logout datetime
</a></th>
<th width="17%"  class="thead"><a href="#">Redirect URL
</a></th>
</tr></thead>
<tbody>
<tr>
<td>Sandeep</td>
<td>14/11/2013 11:34 AM</td>
<td>110011</td>
<td>SSO</td>
<td>180.00.120.9</td>
<td>Failed</td>
<td>Invalid password [01]</td>
<td>a879f778dj8734h4</td>
<td>Yes</td>
<td>18/11/2013 11:34 AM</td>
<td>https://www.fi-i.com/Fiinfra/partner/</td>
</tr>
<tr >
<td>Sachin</td>
<td>14/11/2013 10:34 AM</td>
<td>110012</td>
<td>Standard</td>
<td>180.00.120.9</td>
<td><span data-dobid="hdw">Successful</span></td>
<td>Invalid password [01]</td>
<td>a879f778dj8734h4</td>
<td>Yes</td>
<td>19/11/2013 10:34 AM</td>
<td>https://www.fi-i.com/Fiinfra/partner/</td>
</tr>
<tr>
<td>Aniket</td>
<td>14/11/2013 09:34 AM</td>
<td>110013</td>
<td>Standard</td>
<td>180.00.120.9</td>
<td>Failed</td>
<td>Invalid Login Id [02]</td>
<td>a879f778dj8734h4</td>
<td>Yes</td>
<td>20/11/2013 09:34 AM</td>
<td>https://www.fi-i.com/Fiinfra/partner/</td>
</tr>
<tr>
<td>Amir</td>
<td>14/11/2013 11:10 AM</td>
<td>110014</td>
<td>Standard</td>
<td>180.00.120.9</td>
<td>Failed</td>
<td>Invalid Login Id [02]</td>
<td>a879f778dj8734h4</td>
<td>No</td>
<td>21/11/2013 11:10 AM</td>
<td>https://www.fi-i.com/Fiinfra/partner/</td>
</tr>
<tr>
<td>Sameer</td>
<td>14/11/2013 8:30 AM</td>
<td>110015</td>
<td>Standard</td>
<td>180.00.120.9</td>
<td>Successful</td>
<td>Invalid Login Id [02]</td>
<td>a879f778dj8734h4</td>
<td>Yes</td>
<td>22/11/2013 8:30 AM</td>
<td>https://www.fi-i.com/Fiinfra/partner/</td>
</tr>
<tr>
<td>Rohan</td>
    <td>14/11/2013 8:20 AM</td>
    <td>110016</td>
    <td>SSO</td>
    <td>180.00.120.9</td>
    <td>Successful</td>
    <td>Invalid Login Id [02]</td>
    <td>a879f778dj8734h4</td>
    <td>No</td>
    <td>23/11/2013 8:20 AM</td>
    <td>https://www.fi-i.com/Fiinfra/partner/</td>
</tr>
<tr>
<td>Jagan</td>
<td>14/11/2013 8:15 AM</td>
<td>110017</td>
<td>SSO</td>
<td>180.00.120.9</td>
<td>Successful</td>
<td>Invalid Login Id [02]</td>
<td>a879f778dj8734h4</td>
<td>Yes</td>
<td>24/11/2013 8:15 AM</td>
<td>https://www.fi-i.com/Fiinfra/partner/</td>
</tr>
<tr>
<td>Mohan</td>
<td>14/11/2013 8:00 AM</td>
<td>110018</td>
<td>Standard</td>
<td>180.00.120.9</td>
<td>Successful</td>
<td>Invalid Login Id [02]</td>
<td>a879f778dj8734h4</td>
<td>Yes</td>
<td>25/11/2013 8:00 AM</td>
<td>https://www.fi-i.com/Fiinfra/partner/</td>
</tr>
</tbody></table> -->
 
        
                     
       
        <!-- Center-->    
     </div> 
     </div> 
     
    <div class="col-sm-7" >

					<ul class="pagination pagination-sm"
						style="float: left; margin-right: 20px;">
					<!-- 	<li class="disabled"><a href="#">&laquo;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li> -->
					</ul>



					<div class="topmenuleft" >
 <div  class="customDropdown">
       <span >Page Size:</span>&nbsp;
     <select  type="button" name="pageSize" id="page" value="10">
     	<option selected="selected" value="10">10</option>
     	<option value="20">20</option>
     	<option value="50">50</option>
     	<option value="100">100&nbsp;</option>
     </select> 
     </div>	
</div>
<div class="topmenuleft" >
 
  <ul>
  	<li> Export options: </li>
    <li> <a href="#" title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li>
    <li><a href="#" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li>
    <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li>
  </ul>
 
  
 
 </div>
</div>

     </div>
     
     </div>    
  </div>
    
            	
</section>           	
<!-- Center part End -->          

<footer>
	<div class="row">
    <div class="bottomstrip">
                	<div class="container">
                     <div id="powerby"><img src="images/finfra_logo.png" > </div>
                   	 <div class="copyright">2013 Freedom Wealth Solutions Pvt. Ltd. All Rights Reserved.  | <a href="#"  onClick=>Terms Of Use </a>|  <a href="#">Privacy Policy</a></div>
                </div>
              
   	  </div></div>
		  <!-- END login-form -->
		</div>
</div>
</footer>
<script>
function addNote(){

$("#addnote").show();	
$("#deletenote, #editnote").hide();	
$("#popUpAlertaddnote").css ('height','420px')
$("#popUpAlertaddnote").css ('width','650px')
}

function deleteNote(){

$("#deletenote").show();	
$("#addnote, #editnote").hide();	
$("#popUpAlertaddnote").css ('height','400px')
$("#popUpAlertaddnote").css ('width','400px')

}
function editNote(){

$("#editnote").show();	
$("#addnote, #deletenote").hide();	
$("#popUpAlertaddnote").css ('height','420px')
$("#popUpAlertaddnote").css ('width','650px')

}
function biz(){
$("#biz").show();	
$("#user, #role, #city").hide();	

}
function user(){
$("#user").show();	
$("#biz, #role, #city").hide();	

}
function role(){
$("#role").show();	
$("#biz, #user, #city").hide();		
}
	
function city(){
$("#city").show();	
$("#biz, #user, #role").hide();		
}

function biz1(){
$("#biz1").show();	
$("#user1, #role1, #city1").hide();	

}
function user1(){
$("#user1").show();	
$("#biz1, #role1, #city1").hide();	

}
function role1(){
$("#role1").show();	
$("#biz1, #user1, #city1").hide();		
}
	
function city1(){
$("#city1").show();	
$("#biz1, #user1, #role1").hide();		
}
</script>
</body>
</html>