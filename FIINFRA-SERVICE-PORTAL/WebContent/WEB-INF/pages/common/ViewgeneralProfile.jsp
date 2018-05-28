<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page language="java" import="java.util.*" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>View General Profile </title>

<script type="text/javascript">

	function getThemes(id)
	{
		     
		      
		      $.ajax({
		  		type : "POST",
		  		url : $('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=92',
		  		success : function(result) {
		  			
		  			$('#theme').empty();
		  			
		  			
		  			$(result).each(function(i,obj) {
		  				var codeTypeId=obj.codeTypeId;
		  				var codeValue=obj.codeValue;
		  				var codevalueId=obj.codeValueId;		
		  				
		  				
		  			   if(id == codevalueId)
					    {
				    		$('#theme').append('<option value="'+codevalueId+'" selected="selected">'+codeValue+'</option>');
				      	} else{
				      		$('#theme').append('<option value="'+codevalueId+'">'+codeValue+'</option>');	
				      	}
		  			
		  					
		  				
		  				
		  			});

	   }
		      });
		     
		     
		 	//var select = document.getElementById("theme");
		 	
		
	}
	
	
	
function f2(el) 
{
    el.value = el.value.toLowerCase();
}



function applyTheme()
{
	$('body').append('<link rel="stylesheet" href="'+$('#contextPath').val()+'/css/'+$("#theme option:selected").text()+'.css" />');
}

</script>



</head>
<body>

 <script src="<%=request.getContextPath()%>/js/jstree/jstree.min.js"></script> 
<input type="hidden" id="hideid1" value="${sessionScope.userSession.themeName}">
<input type="hidden" id="hideid" value="${theme}">
<%HttpSession hes=request.getSession();%>
<input type="hidden" name="abc" id="abc" value="<%=hes.getAttribute("partyId")%>">
<input type="hidden" name="partyIds" id="partyIds" value="<%=hes.getAttribute("partyId")%>">
<jsp:include page="../common/header.jsp" />
<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
<!--css popup window start 1-->



<div class="page-header">
		<h1 class="pull-left">User Profile for ${userSession.name}</h1>
         
           <div class="clearfix"></div>
	</div>



<div class="row">

<div class="col-md-2" >
		<div class="list-group">
				<a class="list-group-item active" href="#">Section</a>  	
               <%--  <a id="SPBUProfileSettingsLink" class="list-group-item" href="<%=request.getContextPath()%>/setting/loadprofile_setting.htm?partyId=<%=hes.getAttribute("partyId")%>">Settings</a> --%>
                
                   <a id="SPGeneralProfileLink" href="#" class="list-group-item"><strong>Profile</strong></a>
             
                	<a id="SPchangepwdLink" class="list-group-item" href="<%=request.getContextPath()%>/common/loaduserpassword.htm">Change Password</a>
                 <a id="SPManageHierachyLink" href="<%=request.getContextPath()%>/manageheirachy.htm" class="list-group-item">Manage Hierarchy </a>
	   </div>
</div>
	<div class="col-md-9">
    		     <div class="list-group">
        			<a class="list-group-item active" href="#">Profile </a>
					<div class="list-group-item">
  					<div class="clearfix"></div>
  					<div class="topmenu">
    				</div>
    
    		<div class="clearfix"></div>
 			<div class="row">
 			
 			
 			
 			<form name="addform" id="addform">
 			<input type="hidden" id="themName" name="themName">
 			<input type="hidden" class="form-control"  name="panNo" id="panNo"  value="${panNo}" >
 			<input type="hidden" class="form-control"  name="arn" id="arn"   value="${arn}" >
 	 <div  class="col-md-2 searchpadding padding_top" >First Name  <span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="firstName" id="firstName" value="${firstName}" ></div>
 	<div class="clearfix"></div>
 	<div class="space"></div>
 	
            <div  class="col-md-2 searchpadding padding_top" >Last Name  <span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="lastName" id="lastName" value="${lastName}" ></div>
 	<div class="clearfix"></div>
 	<div class="space"></div>
    <!-- row 1 end-->
 	<div  class="col-md-2 searchpadding padding_top">User Name<span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" readonly = "true" class="form-control" name="userName" id="userName"  value="${userName}" ></div>
 <div class="clearfix"></div>
 <div class="space"></div>
  <!-- row 2 end-->
 	<div  class="col-md-2 searchpadding padding_top">Biz Unit<span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" readonly = "true" class="form-control" name="partyName" id="partyName" value="${partyName}" ></div>
 <div class="clearfix"></div>
 <div class="space"></div>
 <!-- row 3 end-->
 	<div  class="col-md-2 searchpadding padding_top" >Communication Email-ID <span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control"  name="emailID" id="emailID" value="${emailID}" >
</div>
 <div class="clearfix"></div>
 <div class="space"></div>
  <!-- row 4 end-->
 	<div  class="col-md-2 searchpadding padding_top">Communication Name <span class="red">*</span>  </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="emailName" id="emailName" value="${emailName}" >
</div>
 <div class="clearfix"></div>
 <div class="space"></div>
  <!-- row 5 end-->
 	<div  class="col-md-2 searchpadding padding_top">Contact Number <span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="contactMobile" id="contactMobile"  value="${contactMobile}">
</div>

<%--  <div class="clearfix"></div>
 <div class="space"></div>
 <!-- row 3 end-->
 	<div  class="col-md-2 searchpadding padding_top" >PAN no.<span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control"  name="panNo" id="panNo"  value="${panNo}"  >
</div>


 <div class="clearfix"></div>
 <div class="space"></div>
 <!-- row 3 end-->
 	<div  class="col-md-2 searchpadding padding_top" >ARN <span class="red">*</span> </div> 
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control"  name="arn" id="arn"   value="${arn}" >
</div> --%>



 <div class="clearfix"></div>
 <div class="space"></div>
 <!-- row 3 end-->
 	<div  class="col-md-2 searchpadding padding_top" >Themes <span class="red">*</span> </div> 
	<div  class="col-md-8 searchpadding padding_top"><select name="theme" class="form-control" id="theme" style="border:none;background:none;box-shadow:none;" onchange="applyTheme()">
                      </select>
                     
</div>


  <input type="hidden" name="themeName" id="themeName">
 <div class="clearfix"></div>	 <div class="clearfix"></div>	 <div class="clearfix"></div>
 
  			  <div class="pull-right">
    
<div class="clearfix"></div>
 
 <div class="space"></div>
    <button id="SPBUProfileEdit" class="btn btn-sm btn-primary" onclick="updateProfile();"><i class="ace-icon fa fa-plus"></i>Save</button>
    
    
    
    <a href="<%=request.getContextPath()%>/welcome/redirect.htm"><input class="btn btn-sm btn-danger" id="btn_update_c" type="button" value="Cancel" name="Cancel" ></a>
    

    </div>
 	
<div class="space"></div>

       </form>

 			
     </div>                                      
      

  
    </div>
    
	 <div class="clearfix"></div>
	</div>
	</div></div>  
   	
<!-- 
<!--css popup window 1 close-->
<!-- css popup window start 2
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:650px; height:620px; top:100px; overflow: auto;" id="popUpAlertaddnote" class="alert">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpAlertaddnote')" href="#"><img alt="" src="images/btn_close.gif" /></a></div>
Edit
    <div id="editnote">
    <div id="popupwrapper_contactform">
   		
  		<div class="heading_contactform"><h3> Edit BU </h3></div>
      <div id="poptable_contactform" style="padding:10px; height:450px;">
        	<span  class="searchpadding padding_top" style="float:left; width:150px;">Biz Unit    <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left;">
<input type="text" class="form-control" placeholder="Biz Unit  "></span>
</span>
        <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Short Name  <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder="Short Name"></span>
 <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Company Name  <span class="red">*</span>  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder="Company Name
"></span>
<div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Address  <span class="red">*</span></span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder="Address">
</span>
<div class="clearfix"></div>
<span class="searchpadding padding_top" style="float:left; width:150px;">  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" ">
</span>
<div class="clearfix"></div>
<span class="searchpadding padding_top" style="float:left; width:150px;">  </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" ">
</span>
<div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;">Country  <span class="red">*</span></span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<select name="Saving" class="form-control" style="width:300px; float:left;">
                                <option>India</option>	
                                 <option>India</option>
                                
                               
        </select>
</span>
        <div class="clearfix"></div>
         <span  class="searchpadding padding_top" style="float:left; width:150px;">State 
 <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left;">
<select name="Saving" class="form-control" style="width:300px; float:left;">
                                <option>Maharashtra</option>	
                                <option>Manipur</option>
                                <option>Meghalaya</option>
                               
        </select></span>
         <div class="clearfix"></div>
         <span  class="searchpadding padding_top" style="float:left; width:150px;">City  <span class="red">*</span> </span>
<span  class="searchpadding padding_top" style="float:left;width:300px; ">
<select name="Saving" class="form-control" style="width:300px; float:left;">
                                <option>Mumbai</option>	
                                <option>Pune</option>
                              
                               
        </select></span>
        <div class="clearfix"></div>
        <span class="searchpadding padding_top" style="float:left; width:150px;"> Zip Code <span class="red">*</span>   </span>
<span  class="searchpadding padding_top" style="float:left; width:300px;">
<input type="text" class="form-control" placeholder=" ">
</span>




<div class="clearfix"></div>
     
         
 
 </div>
  <div class="topbuttonholder">
        	<input class="dbtn" value="Save" id="Save" type="button">	
           
            <input class="dbtn " onClick="popup('popUpAlertaddnote')" value="Cancel" id="Cancel" type="button">	
      </div>
    </div>
	</div>
</div> -->
 
      
<%-- 

<div class="container">
	<div class="portfoliostrip collapse navbar-collapse">
    	<ul class="navbar-sub">
        <!-- 	<li id="SPBizUnitLink" class="active"><a href="#.html">Biz Unit</a></li>
            <li id="SPDepartmentLink"><a href="#">Department</a></li>
            <li id="SPServiceTeamLink"><a href="#"> Service Team</a></li> -->
	<li class="active"><a  href="<%=request.getContextPath()%>/bizunit/loadBizUnitList.htm?buId=${sessionScope.userSession.buId}">Biz Unit</a></li> 
            <li ><a href="<%=request.getContextPath()%>/departmentlist/getDepartmentlist.htm?buId=${sessionScope.userSession.buId}">Department</a></li>
            <li><a href="<%=request.getContextPath()%>/teammember/loadteammember.htm"> Service Team</a></li>
            	<li id="SPBizUnitLink" class="active"><a  href="<%=request.getContextPath()%>/bizunit/loadBizUnitList.htm?buId=${sessionScope.userSession.buId}">Biz Unit</a></li> 
            <li id="SPDepartmentLink"><a href="<%=request.getContextPath()%>/departmentlist/getDepartmentlist.htm?buId=${sessionScope.userSession.buId}">Department</a></li>
            <li id="SPServiceTeamLink"><a href="<%=request.getContextPath()%>/teammember/loadteammember.htm"> Service Team</a></li>
            

        </ul>
	</div>        
  </div> --%>   
 <!-- Center part start -->
 <%-- <div class="container white">
    	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;"><span style="float:left;">User Profile for ${userSession.name}
 </span>
           </div >
          </div >
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      
        <!-- center -->
      
      <div class="col-md-3 sidebar-offcanvas" role="navigation" style="margin-top:10px;padding-left:10px;">
            <div class="list-group">
        		<a class="list-group-item active" href="#">Sections</a>
                <a id="SPGeneralProfileLink" href="#" class="list-group-item"><strong>Profile</strong></a>
             
                	<a id="SPchangepwdLink" class="list-group-item" href="<%=request.getContextPath()%>/common/loaduserpassword.htm">Change Passward</a>
   </div>
           
        </div>
        <div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >

 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">General </a>
                <!-- accordion start-->
           
           	  <div class="accordion pull-left col-md-12" id="accordFundSel" style="margin-left:-5px;">
                <div class="accordion-group">
                  <div class="pull-left fundtool_left_col_head ">  </div>
                  <div class="accordion-heading" style="float:right;"> <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordFundSel" href="#collapseFundSel"> <!-- <span style=" margin-top:0px;" class="searchiconb"  alt="Search" title="Search"></span> --> </a> </div>
                  <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
                    <div class="accordion-inner table-responsive">
                      <div style="width: 1500px;">
                        <!--1 search start -->
                       
                        <div class="filterbox searchpadding">
                          <div class="head">Biz Unit</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Shubhchintak </li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                FFreedom Golden Practice</li>
                             
                            </ul>
                          </div>
                        </div>
                        
                        <div class="filterbox searchpadding">
                          <div class="head">Company Name</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                             
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Axis AMC</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                FFreedom</li>
                             
                            </ul>
                          </div>
                         </div>
                        
                        <div class="filterbox searchpadding">
                          <div class="head">Short Name</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                SHUBH </li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                FFGP</li>
                             
                            </ul>
                          </div>
                        </div>
                         
                         
                          <div class="filterbox searchpadding">
                          <div class="head">Others</div>
                         <div class="drop_box_body" style="padding-top:10px;">
                           Country:

                            <input name="text" type="text" id="fname" class="form-control" value=""> 
                             State:


                            <input name="text" type="text" id="fname" class="form-control" value=""> 
                            City:
                            <input name="text" type="text" id="fname" class="form-control" value=""> 
                            Zip Code:
                              <input name="text" type="text" id="fname" class="form-control" value=""> 
                             <br>
                          </div>
                         </div>
                         
                         
                         
                       </div>
                    
                      <!-- accordion-inner END --> 
                  <div class="col-md-1">
                      <button type="button" id="updatefilterlist" class="btn">Show</button>
                    </div>
                   
                    </div>
                    
                   
                    
                  </div>
                  <!-- accordion-body END -->
                </div>
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
   <!-- accordion End -->
                
                
  <div class="list-group-item">
  <div class="clearfix"></div>
  <div class="topmenu">
  <!-- <a id="SPBUProfileEdit" href="#" onClick="editNote();" >
    <input  type="button" class="dbtn createNewBtn" value="  Edit"   onClick="popup('popUpAlertaddnote')" title="Save" alt="Save"></a>
    -->
    </div>
    
    <div class="clearfix"></div>
 	<div class="row">
 	<form name="addform">
 	 <div  class="col-md-2 searchpadding padding_top" >First Name  <span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="firstName" id="firstName" value="${firstName}" ></div>
 	<div class="clearfix"></div>
 	
 	
            <div  class="col-md-2 searchpadding padding_top" >Last Name  <span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="lastName" id="lastName" value="${lastName}" ></div>
 	<div class="clearfix"></div>
    <!-- row 1 end-->
 	<div  class="col-md-2 searchpadding padding_top">User Name<span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" readonly = "true" class="form-control" name="userName" id="userName"  value="${userName}" ></div>
 <div class="clearfix"></div>
  <!-- row 2 end-->
 	<div  class="col-md-2 searchpadding padding_top">Biz Unit<span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" readonly = "true" class="form-control" name="partyName" id="partyName" value="${partyName}" ></div>
 <div class="clearfix"></div>
 <!-- row 3 end-->
 	<div  class="col-md-2 searchpadding padding_top" >Communication Email-ID <span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control"  name="emailID" id="emailID" value="${emailID}" >
</div>
 <div class="clearfix"></div>
  <!-- row 4 end-->
 	<div  class="col-md-2 searchpadding padding_top">Communication Name <span class="red">*</span>  </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="emailName" id="emailName" value="${emailName}" >
</div>
 <div class="clearfix"></div>
  <!-- row 5 end-->
 	<div  class="col-md-2 searchpadding padding_top">Contact Number <span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="contactMobile" id="contactMobile" maxlength="10" value="${contactMobile}">
</div>

 <div class="clearfix"></div>
 <!-- row 3 end-->
 	<div  class="col-md-2 searchpadding padding_top" >PAN no.<span class="red">*</span> </div>
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control"  name="panNo" id="panNo"  value="${panNo}"  >
</div>


 <div class="clearfix"></div>
 <!-- row 3 end-->
 	<div  class="col-md-2 searchpadding padding_top" >ARN <span class="red">*</span> </div> 
	<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control"  name="arn" id="arn"   value="${arn}" >
</div>



 <div class="clearfix"></div>
 <!-- row 3 end-->
 	<div  class="col-md-2 searchpadding padding_top" >Themes <span class="red">*</span> </div> 
	<div  class="col-md-8 searchpadding padding_top"><select name="theme" class="form-control" id="theme" style="border:none;background:none;box-shadow:none;" onchange="applyTheme()">
                      </select>
                     
</div>
  <input type="hidden" name="themeName" id="themeName">
 <div class="clearfix"></div>	 <div class="clearfix"></div>	 <div class="clearfix"></div>	


       </form>     </div>                                      
      
 
 
 	
    <div class="topmenu">
    <input  type="button" class="dbtn" value="  Save" onclick="updateProfile()"  title="Save" alt="Save">
    <a href="<%=request.getContextPath()%>/welcome/redirect.htm" class="pagerLink">
    <input  type="button" class="dbtn" value="  Cancel"  title="Cancel" alt="Cancel" ></a>
    </div>
	 <div class="clearfix"></div>
</div>


</div></div>      	<br/><br/>
       	</div>
</div>       --%>     	
<!-- Center part End -->          

<footer>
<jsp:include page="../common/footer.jsp" />
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
</footer>
<script>
function addNote(){

$("#addnote").show();	
$("#deletenote, #editnote").hide();	

$("#popUpAlertaddnote").css ('height','620px');
$("#popUpAlertaddnote").css ('width','650px');

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
$("#popUpAlertaddnote").css ('height','620px')
$("#popUpAlertaddnote").css ('width','650px')

}

function validate()
{	var n = $('#contactMobile').val().length;

if (isNaN($('#contactMobile').val()))
	{
	showAlertMessage("Message", "<br/>Please Enter digit", "information");
	$('#contactMobile').focus();
	$('#contactMobile').val('');
	return false;
	}
	
	if (n!=10)
		{
		showAlertMessage("Message", "<br/>Please Enter contact number of 10 digit", "information");
		$('#contactMobile').focus();
		return false;
		}
	//alert("fdgfgf");
	if($('#firstName').val()=='')
	{
		showAlertMessage("Message", "<br/>Please enter first Name", "information");
		$('#firstName').focus();
		return false;
	}
	
	if($('#lastName').val()=='')
	{
		showAlertMessage("Message", "<br/>Please enter last Name", "information");
		$('#lastName').focus();
		return false;
	}
	if($('#emailID').val()=='')
		{
		showAlertMessage("Message", "<br/>Please Enter Communication email ID", "information");
		$('#emailID').focus();
		return false;
		}
	
	if($('#contactMobile').val()=='')
	{
	showAlertMessage("Message", "<br/>Please Enter contact Mobile", "information");
	$('#contactMobile').focus();
	return false;
	}

	return true;
}

function updateProfile()
{
	

	//$('#istoClose').val(isclose);
		$.validator.addMethod("alphaNumeric", function (value, element) {
		    return this.optional(element) || /^[ a-zA-Z]+$/.test(value);
		}, " Only letters allowed.");

		
		$.validator.addMethod("alphaNumeric1", function (value, element) {
		    return this.optional(element) || /^[ ,.0-9a-zA-Z]+$/.test(value);
		}, "Special character not allowed.");
		
		var validator=$('#addform').validate({
			errorElement: 'div',
			errorClass: 'help-block',
			focusInvalid: false,
			ignore: "",
			 icon: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
			},
			rules: {
				firstName: {
					required:true,
					alphaNumeric:true
					//alphanumeric: true
					
			},
			
			lastName: {
				required:true,
				alphaNumeric:true
				
		},
		
		emailID: {
						required:true,
						email:true
						
				},
				emailName: {
					required:true,
					alphaNumeric1:true
					
				},
				contactMobile: {
					required:true,
					number: true,
					maxlength:13,
					minlength:10,
				},
							
						arn:
						{
							required:true,
							number:true,
							maxlength:5,
							minlength:4
						}/* ,
						panNo:
							{
							required:true
							}
				 */
			},

			messages: {
				lastName: {
					required: "Please enter last name."				
				},
				firstName: {
					required: "Please enter first name."				
				},
				arn: {
					required: "Please enter short arn."				
				},
				emailName:{
					required: "Please enter email."
				},
				
				emailName:{
					required: "Please enter ommuication email name."
				},
				contactMobile:
					{
					required: "Please enter contact nubmer."
					}/* ,
					panNo:
						{
						required: "Please enter pan card nubmer."
						} */
				
				
				
			},


			highlight: function (e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},

			success: function (e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},

			errorPlacement: function (error, element) {
				if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
					var controls = element.closest('div[class*="col-"]');
					if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
					else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
				}
				else if(element.is('.select2')) {
					error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
				}
				else if(element.is('.chosen-select')) {
					error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
				}
				else error.insertAfter(element.parent());
			},

			submitHandler: function (form) {
				
				if(validator.form())
				{
					
					
					var theme = $('#theme :selected').text();
					
					$('#themName').val(theme);
					
						
						$.ajax({
							type :'POST',
							data:$('#addform').serialize(),
							url : $('#contextPath').val() +'/common/updateProfile.htm',/* ?lastName='+$('#lastName').val()+
						    "&emailID="+$('#emailID').val()+
						     "&emailName="+$('#emailName').val()+
						     "&contactMobile="+$('#contactMobile').val()+
						     "&panNo="+$('#panNo').val()+
						     "&firstName="+$('#firstName').val()+
						     "&arn="+$('#arn').val()+
						     "&theme="+$('#theme :selected').val()+
						     "&themename="+$('#themename :selected').text(), */
							
							 success : function(result) 
							 {
						        
					          $('#common_popup_div,#shadow_div_web_app').remove();
					        	   bootbox.dialog({
															message: "<span class='bigger-110'>Profile saved successfully.</span>",
															buttons: 			
															{
																"click" :
																{
																	"label" : "OK!",
																	"className" : "btn-sm btn-primary",
																	"callback": function() {
																		 location.reload();
																		 
																	}
																}
															}
														});
							}
					  
						}); 
					}
				
			},
			invalidHandler: function (form) {
				
			}
		});
		
}

	
	/* var theme = $('#theme :selected').text();
	
	$('#themName').val(theme);
	if(validate()==true){
		
		$.ajax({
			type :'POST',
			data:$('#addform').serialize(),
			url : $('#contextPath').val() +'/common/updateProfile.htm',/* ?lastName='+$('#lastName').val()+
		    "&emailID="+$('#emailID').val()+
		     "&emailName="+$('#emailName').val()+
		     "&contactMobile="+$('#contactMobile').val()+
		     "&panNo="+$('#panNo').val()+
		     "&firstName="+$('#firstName').val()+
		     "&arn="+$('#arn').val()+
		     "&theme="+$('#theme :selected').val()+
		     "&themename="+$('#themename :selected').text(), 
			
			 success : function(result) 
			 {
		        
	          $('#common_popup_div,#shadow_div_web_app').remove();
	        	   bootbox.dialog({
											message: "<span class='bigger-110'>Profile saved successfully.</span>",
											buttons: 			
											{
												"click" :
												{
													"label" : "OK!",
													"className" : "btn-sm btn-primary",
													"callback": function() {
														 location.reload();
														 
													}
												}
											}
										});
			}
	  
		}); 
	} */


	
function reload()
{
	location.reload();
}

$(document).ready(function(){	
	var id=$('#hideid').val();
	//alert(id);
	getThemes(id);
	
});
</script>


</body>
</html>