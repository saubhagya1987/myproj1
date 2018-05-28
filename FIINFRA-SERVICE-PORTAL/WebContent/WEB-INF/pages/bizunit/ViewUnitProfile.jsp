<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page language="java" import="java.util.*" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
		<title>View User Profile- General</title>
 
	

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">



</head>
<body>
<jsp:include page="../common/header.jsp" />
<%HttpSession hes=request.getSession();%>

<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
<input type="hidden" name="abc" id="abc" value="<%=hes.getAttribute("partyId")%>">
<input type="hidden" name="partyIds" id="partyIds" value="<%=hes.getAttribute("partyId")%>">
<input type="hidden" name="oldname" id="oldname" value="<%=request.getAttribute("disBizName")%>">





<div class="page-header">
		<h1 class="pull-left">Biz Unit Profile for <%=hes.getAttribute("nameBizUnit")%></h1>
         
           <div class="clearfix"></div>
	</div>

<div class="row">

<div class="col-md-2" >
		<div class="list-group">
				<a class="list-group-item active" href="#">Section</a>
                <a id="SPBUProfileGeneralLink" href="#" class="list-group-item"><strong>General</strong></a>
              	<a id="SPBUProfileWhiteLabelLink" href="loadwhitelabel.htm?partyId=<%=hes.getAttribute("partyId")%>" class="list-group-item">White Label</a>  	
                <a id="SPBUProfileSettingsLink" class="list-group-item" href="<%=request.getContextPath()%>/setting/loadprofile_setting.htm?partyId=<%=hes.getAttribute("partyId")%>">Settings</a>
                <a id="SPBUProfileAssumptionsLink" href="<%=request.getContextPath()%>/loadAssumptions.htm" class="list-group-item">Assumptions</a>  
  	            <%-- <a id="SPProductRecommendationsLink"  href="<%=request.getContextPath()%>/partner/recommendation/getProductRecommendations.htm?partyId=<%=hes.getAttribute("partyId")%>"  class="list-group-item">Product Recommendation</a> --%>
	   </div>
</div>
	<div class="col-md-9">
    		     <div class="list-group">
        			<a class="list-group-item active" href="#">General </a>
					<div class="list-group-item">
  					<div class="clearfix"></div>
  					<div class="topmenu">
    				</div>
    
    		<div class="clearfix"></div>
 			<div class="row">
 			<form name="addform" id="addform">
 	
 			<input type="hidden" id="hiddenctyId" name="hiddenctyId" value="${cityId}">
 			<input type="hidden" id="hiddenstId" name="hiddenstId" value="${stateId}">
 	
            <div  class="col-md-2 searchpadding padding_top" >Biz Unit    <span class="red">*</span> </div>
			<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="lastName" id="disBizName" value="<%=request.getAttribute("disBizName")%>" placeholder="biz unit" onchange="getEditUniqueBu()"></div>
	 		<div class="clearfix"></div>
    		<div class="space"></div>
    <!-- row 1 end-->  		  
 			<div  class="col-md-2 searchpadding padding_top">Short Name  <span class="red">*</span> </div>
			<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="shortName" id="disShortName"  value="<%=request.getAttribute("disShortName")%>" placeholder="shortname"></div>
 			<div class="clearfix"></div>
  <!-- row 2 end-->
  			<div class="space"></div>
 			<div  class="col-md-2 searchpadding padding_top">Company Name  <span class="red">*</span> </div>
			<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="companyName" id="disCompanyName" value="<%=request.getAttribute("disCompanyName")%>" placeholder="company name"></div>
 			<div class="clearfix"></div>
 <!-- row 3 end-->
 			<div class="space"></div>
 			<div  class="col-md-2 searchpadding padding_top" >Address  <span class="red">*</span> </div>
			<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control"  name="street" id="disAdd1" value="<%=request.getAttribute("disAdd1")%>" placeholder="Address">
			</div>
 			<div class="clearfix"></div>
  <!-- row 4 end-->
  			<div class="space"></div>
 			<div  class="col-md-2 searchpadding padding_top">  </div>
			<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="disAdd2" id="disAdd2" value="<%=request.getAttribute("disAdd2")%>" >
			</div>
 			<div class="clearfix"></div>
  <!-- row 5 end-->
  			<div class="space"></div>
 			<div  class="col-md-2 searchpadding padding_top"> </div>
			<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control" name="disAdd3" id="disAdd3" value="<%=request.getAttribute("disAdd3")%>">
			</div>
 			<div class="clearfix"></div>
  <!-- row 6 end-->
  			<div class="space"></div>
 			<div  class="col-md-2 searchpadding padding_top"> Country</div>
			<div  class="col-md-8 searchpadding padding_top">
    		<select name="disCountry" id="disCountry"  onfocus="getCountry()" class="form-control" >
                                <option value="<%=request.getAttribute("disCountryId")%>"> <%=request.getAttribute("disCountry")%></option>	
		    </select>
			</div>
 			<div class="clearfix"></div>
 <!-- row 7 end-->
 			<div class="space"></div>
 			<div  class="col-md-2 searchpadding padding_top" > State</div>
			<div  class="col-md-8 searchpadding padding_top" >
    			<select name="disState" id="disState"  class="form-control" onchange="getCity(0,this.value);">
		        </select>
			</div>
 			<div class="clearfix"></div>
 <!-- row 8 end-->
 			<div class="space"></div>
 			<div  class="col-md-2 searchpadding padding_top" > City</div>
			<div  class="col-md-8 searchpadding padding_top" >
    		<select name="disCity" id="disCity"  class="form-control" >
                            <%-- <option value="<%=request.getAttribute("disCityId")%>"> <%=request.getAttribute("disCity") %></option>  --%>  
	        </select>
			</div>
 			<div class="clearfix"></div> 
 <!-- row 9 end-->
 			<div class="space"></div>
 			<div  class="col-md-2 searchpadding padding_top" >  Zip Code <span class="red">*</span></div>
			<div  class="col-md-8 searchpadding padding_top" >
    		<input type="text" name="zipcode" id="disZip"  value="<%=request.getAttribute("disZip")%>"  class="form-control"  placeholder=" ">
			</div>
			 <div class="clearfix"></div>
 <!-- row 10 end-->
 			<div class="space"></div>
 			<div  class="col-md-2 searchpadding padding_top" >Email-ID<span class="red">*</span> </div>
			<div  class="col-md-8 searchpadding padding_top"><input type="text" class="form-control"  name="emailId" id="emailid" onchange="f2(this);" value="<%=request.getAttribute("disEmail")%>"  >
			</div>
			 <div class="clearfix"></div>
 <!-- row 11 end-->
 			<div class="space"></div>
 			<div  class="col-md-2 searchpadding padding_top" >Contact Number<span class="red">*</span> </div> 
			<div  class="col-md-8 searchpadding padding_top">
			<input type="text" class="form-control"  name="contactno" id="contactno"   value="<%=request.getAttribute("disContact")%>" >
			</div>
			<div class="clearfix"></div>
 <!-- row 12 end-->
 			<div class="space"></div>
 			<div  class="col-md-2 searchpadding padding_top" >Twitter Link</div> 
			<div  class="col-md-8 searchpadding padding_top">
			<input type="text" class="form-control"  name="twitter" id="baba"   onchange="f2(this);" value="<%=request.getAttribute("distwitter")%>" >
			</div>
			 <div class="clearfix"></div>	
       
                                           
      

    <div class="pull-right">
    
<div class="clearfix"></div>
 
 <div class="space"></div>
    <button id="SPBUProfileEdit" class="btn btn-sm btn-primary" onclick="updateBizUnit();"><i class="ace-icon fa fa-plus"></i>Save</button>
    <%-- <a href="<%=request.getContextPath()%>/bizunit/loadBizUnitList.htm" class="pagerLink"><button  class="btn btn-sm btn-danger"><i class="fa fa-times"></i>Cancel</button></a> --%>
    
    
    <a href="<%=request.getContextPath()%>/bizunit/loadBizUnitList.htm"><input class="btn btn-sm btn-danger" id="btn_save_c" type="button" value="Cancel" name="Cancel" ></a>
    </div>
    </form></div>
	 <div class="clearfix"></div>
	</div>
	</div></div>  
   	</div> 	

<footer>
	<jsp:include page="../common/footer.jsp" />
	<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
</footer>

</body>

<script type="text/javascript">

$( document ).ready(function() {
	var cityid = $('#hiddenctyId').val();
	var stateid = $('#hiddenstId').val();
	getCity(cityid,stateid);
	getState();
});




function getEditUniqueBu()
{
	
	if($('#disBizName').val().trim()==""||$('#disBizName').val()==$('#oldname').val())
		{
		
		}
			else
		{
	$.ajax(
   			{ 				
   		  type: "POST",
   		  url:$('#contextPath').val()+'/bizunit/getUniqueBizUnit.htm?addBizName='+$('#disBizName').val(),	
   	   		 dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   			//  alert(result);
			   			if(result==1)
			   				{
			   				//alert('BizUnit Already Exist');
			   				
			   				bootbox.dialog({
			   				  	message: "<span class='bigger-110'>BizUnit Already Exist.</span>",
			   					buttons: 			
			   					{
			   						"click" :
			   						{
			   							"label" : "OK!",
			   							"className" : "btn-sm btn-primary",
			   							"callback": function() {
			   				//				location.reload();
			   							}
			   						}
			   					}
			   				});
			   				
			   				
			   				//$('#editBizUnitName').val('');
			   				$('#disBizName').val($('#oldname').val());
			   				$('#disBizName').focus();
			   				}

					
   		  }
   	
   	});
		}
}



function getCity(cityid,stateid)
{
	
	
	$.ajax(
   			{ 				
   		  type: "POST",
   		url: $('#contextPath').val()+'/bizunit/getValueFromParentId.htm?parentId='+stateid,		  
   		 dataType: 'json',
		  contentType: 'application/json',
			   		  success:function(result)
   		  { 
			   			
			   			$('#disCity').empty();
							$(result).each(
									function(i, obj) {
										var module = obj.codeValueId;
										var modulename=obj.codeValue;
										if(cityid == module ){
											$('#disCity').append('<option value="'+ module+'" selected = "selected">'+ modulename + '</option>');
										} else{
											$('#disCity').append('<option value="'+ module+'">'+ modulename + '</option>');
										}
										
									});					
							$('#hiddenstId').val(0);
					
   		  }
   	
   	});
	
}

function getState()
{
	
	var stateid = $('#hiddenstId').val();
	
	$.ajax(
   	{ 				
   	  type: "POST",
   	  url: $('#contextPath').val()+'/bizunit/getValueFromParentId.htm?parentId='+$('#disCountry').val(),
   	  dataType: 'json',
	  contentType: 'application/json',
		 success:function(result)
   		  { 
			   			$('#disState').empty();
							$(result).each(
									function(i, obj) {
										var module = obj.codeValueId;
										var modulename=obj.codeValue;
										if(stateid == module){
											$('#disState').append('<option value="'+ module+'" selected="selected">'+ modulename + '</option>');
										}else{
											$('#disState').append('<option value="'+ module+'">'+ modulename + '</option>');
										}
										
		  });	
							//getCity();
   		  }
   	});
}
function f2(el) 
{
    el.value = el.value.toLowerCase();
}
function getCountry()
{
  		$.ajax(
   		{ 				
   		  type: "POST",
   		  url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=3',	
   		  dataType: 'json',
		  contentType: 'application/json',
		  success:function(result)
   		  { 
			   			$('#disCountry').empty();
							$(result).each(
								function(i, obj) {
								        var module=obj.codeValue;
								        var modulename=obj.codeValueId;
										$('#disCountry').append('<option value="'+ modulename+'">'+ module + '</option>');
									});					
						//	getState();
   		  }
   		});
}
           
function updateBizUnit()
{

	$.validator.addMethod("alphaNumeric", function (value, element) {
	    return this.optional(element) || /^[ a-zA-Z]+$/.test(value);
	}, " Only letters allowed.");


	$.validator.addMethod("alphaNumeric1", function (value, element) {
	    return this.optional(element) || /^[()/ ,.0-9a-zA-Z]+$/.test(value);
	}, "Special character not allowed.");
	
	
	$.validator.addMethod("alphaNumeric2", function (value, element) {
	    return this.optional(element) || /^[@_0-9a-zA-Z]+$/.test(value);
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
			lastName: {
				required:true,
				alphaNumeric:true
				//alphanumeric: true
				
		} ,
		
		companyName: {
			required:true,
			alphaNumeric:true
			
	},
	
				shortName: {
					required:true,
					alphaNumeric:true
					
			},
			street: {
				required:true,
				alphaNumeric1:true
				
			},
			zipcode: {
				required:true,
				number: true,
				maxlength:6,
				minlength:6,
			},
			emailId:
				{
				required:true,
				email:true
				},
				contactno:
					{
					required:true,
					number:true,
					maxlength:14,
					minlength:10,
					},
					twitter:
						{
						required:false,
						maxlength:14,
						alphaNumeric2:true
						}
			
			
		},

		messages: {
			lastName: {
				required: "Please enter a bu name."				
			} ,
			companyName: {
				required: "Please enter a company name."				
			},
			shortName: {
				required: "Please enter a short name."				
			},
			street:{
				required: "Please enter a address."
			},
			
			zipcode:{
				required: "Please enter a zipcode."
			},
			emailId:
				{
				required: "Please enter a emailId."
				},
				
				contactno:
				{
				required: "Please enter a contact number."
				}
				
			
			
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

		submitHandler: function (form) 
		{

			   var partyId=$('#partyIds').val(); 
			  

			   var str = $('#emailid').val();
			   var res = str.toLowerCase();
			  
			  $.ajax({
				type :'POST',  
				 url: $('#contextPath').val()+'/bizunit/updateBizUnitGeneral.htm?partyId='+partyId+
			    "&editBizUnitName="+$('#disBizName').val()+
			 "&editShortName="+$('#disShortName').val()+
			 "&editCompanyName="+$('#disCompanyName').val()+
			 "&editAddress1="+$('#disAdd1').val()+
			 "&editAddress2="+$('#disAdd2').val()+
			 "&editAddress3="+$('#disAdd3').val()+
			 "&editZipCode="+$('#disZip').val()+
			 "&editCountry="+$('#disCountry').val()+
			 "&editState="+$('#disState').val()+
			 "&editCity="+$('#disCity').val()+
			 "&emailid="+res+
			 "&contactno="+$('#contactno').val() +
			 "&twitter="+$('#baba').val() 
			 
			  ,
			  		success : function(result)
						{
			  			
			  			bootbox.dialog({
							  	message: "<span class='bigger-110'>Record updated successfully.</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
							//				location.reload();
										}
									}
								}
							});
				
				}
			});

		},
		invalidHandler: function (form)
		{
		
			
		}
	});
	
}
/* function updateBizUnit1()
{
  
	if(editValidation()==true)
	{
	
	
   var partyId=$('#partyIds').val(); 
  

   var str = $('#emailid').val();
   var res = str.toLowerCase();
  
  $.ajax({
	type :'POST',  
	 url: $('#contextPath').val()+'/bizunit/updateBizUnitGeneral.htm?partyId='+partyId+
    "&editBizUnitName="+$('#disBizName').val()+
 "&editShortName="+$('#disShortName').val()+
 "&editCompanyName="+$('#disCompanyName').val()+
 "&editAddress1="+$('#disAdd1').val()+
 "&editAddress2="+$('#disAdd2').val()+
 "&editAddress3="+$('#disAdd3').val()+
 "&editZipCode="+$('#disZip').val()+
 "&editCountry="+$('#disCountry').val()+
 "&editState="+$('#disState').val()+
 "&editCity="+$('#disCity').val()+
 "&emailid="+res+
 "&contactno="+$('#contactno').val() +
 "&twitter="+$('#baba').val() 
 
  ,
  		success : function(result)
			{
  			
  			bootbox.dialog({
				  	message: "<span class='bigger-110'>Record updated successfully.</span>",
					buttons: 			
					{
						"click" :
						{
							"label" : "OK!",
							"className" : "btn-sm btn-primary",
							"callback": function() {
				//				location.reload();
							}
						}
					}
				});
	
	}
});
}
}
 */
//VALIDATION
function editvalidEmail() 
{
	//   var email = $('#emailid').val().toLowerCase(); 
	   var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;
	    if (filter.test($('#emailid').val())) 
	    {
	        return true;
	    }
	    else 
	    {
	        return false;
	    }
}

function editValidation()
{
	var myLength = $("#disZip").val().length;
	var abc=$("#disZip").val();
	var mob=$("#contactno").val();
	  if ( $('#disBizName').val().trim()=="") 
	  {
			 alert("Please Enter BizUnit Name");
			 $('#disBizName').val('');
			 $('#disBizName').focus();
	         return false;
	     } 
	  if ( $('#disShortName').val().trim()=="") 
	  {
			 alert("Please Enter Short Name");
			 $('#disShortName').val('');
			 $('#disShortName').focus();
	         return false;
	     } 
	  if ( $('#disCompanyName').val().trim()=="") 
	  {
			 alert("Please Enter Company Name");
			 $('#disCompanyName').val('');
			 $('#disCompanyName').focus();
	         return false;
	     } 
	  if ( $('#disAdd1').val().trim()=="") 
	  {
			 alert("Please Enter Address ");
			 $('#disAdd1').val('');
			 $('#disAdd1').focus();
	         return false;
	     } 
	
	  if ( $('#disZip').val().trim()=="") 
	  {
			 alert("Please Enter Zipcode ");
			 $('#disZip').val('');
			 $('#disZip').focus();
	         return false;
	     } 
  
	  if (isNaN(abc)) 
	  {
			 alert("Please Enter Numeric Value in zipcode.");
			 $('#disZip').val('');
			 $('#disZip').focus();
	         return false;
	     } 
	  
	  if (myLength!=6) 
	  {
			 alert("Please Enter Valid  ZipCode");
			 $('#disZip').val('');
			 $('#disZip').focus();
	         return false;
	     } 
	  
	  if(10>mob.length||mob.length>13)
		  {
			 alert("Please Enter Valid Contact Number.");
			 $('#contactno').val('');
			 $('#contactno').focus();
	         return false;
		  }
	  
	if(isNaN(mob))
		{
		 alert("Please Enter Numeric Value in Contact Number.");
		 $('#contactno').val('');
		 $('#contactno').focus();
         return false;
		}

	if($('#contactno').val().trim()=="")
		{
		alert("Please Enter Contact Number.");
		 $('#contactno').val('');
		 $('#contactno').focus();
       return false;
		}
	
	
	
	if($('#emailid').val().trim()=="")
		{
		alert("Please Enter Email-Id.");
		 $('#emailid').val('');
		 $('#emailid').focus();
       return false;
		}
	if(editvalidEmail()==false)
		{
		alert("Please Enter Valid Email.");
		 $('#emailid').val('');
		 $('#emailid').focus();
        return false;
		}
	
return true;
}


</script>
</html>