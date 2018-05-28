<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<title>Allocation List</title>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	


	<!--css popup window start 1-->
	<!---- Add Allocation form start---->
	<div style="display: none;" id="blanket"></div>
	
			<form id="addForm" name="addForm" method="post">
			
			<input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />
			<input type="hidden" name="confirmdelete" id="confirmdelete">
			<input type="hidden" name="userName" id="userName" value="${userName}">
			<input type="hidden" name="partyID" id="partyids" value="${partyID}">
			
			
			<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    		<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Add Service Team Member Allocation</h4> 
      		</div> 
      		
      			<div class="modal-body">
				
					<span class="searchpadding padding_top" style="float: left; width: 150px;">Biz Unit <span class="red">*</span></span> 
					<span class="searchpadding padding_top" style="float: left; width: 300px;"> 
					<select name="buid" id="addbizunit" class="form-control" onchange="departmentlist();">
					</select></span>
					
					<div class="clearfix"></div>
					<span class="searchpadding padding_top" style="float: left; width: 150px;">Department <span class="red">*</span></span> 
					<span class="searchpadding padding_top" style="float: left; width: 300px;"> 
					<select name="departmentId" id="adddepartment" class="form-control" onchange="addcheckAllocation();">
					</select></span>
					
					<div class="clearfix"></div>
					<span class="searchpadding padding_top" style="float: left; width: 140px;">Access Start Date <span class="red">*</span></span> 
					<span class="searchpadding padding_top " style="float: left; width: 400px;"> 
						<input type='text' name="startDate" readonly="readonly" id="addstartDatepickerId" maxlength="20" placeholder="Start Date"/>
						<span style="float: left; margin: 5px;"></span>
					</span>
					
					<div class="clearfix"></div>
					<span class="searchpadding padding_top" style="float: left; width: 140px;">Access Expiry Date </span>
					<span class="searchpadding padding_top " style="float: left; width: 400px;"> 
						<input type='text' name="endDate" readonly="readonly" id="addexpireDatepickerId" maxlength="20" placeholder="End Date"/> 
						<span style="float: left; margin: 5px;"></span>
					</span>

					<div class="clearfix"></div>
					<span class="searchpadding padding_top" style="float: left; width: 150px;">Control Options<span class="red"> *</span></span> 
					<span class="searchpadding padding_top " style="float: left; width: 400px;"> 
						<input name="status" id="addisactive" type="checkbox"checked="checked"> 
						<span class="user">Active? </span>
					</span>
					
					<div class="clearfix"></div>
					<div class="space"></div>
				
					<div class="topbuttonholder">
						 <div style="float:right;">
						
							<button  class="btn btn-sm btn-primary" onClick="addAllocationDepartmentList(0);"><i class='ace-icon fa fa-plus'></i>Save & New</button>
							<button  class="btn btn-sm btn-primary" onClick="addAllocationDepartmentList(1);"><i class='ace-icon fa fa-plus'></i>Save & Close</button>
                    		<button  class="btn btn-sm btn-danger" onClick="resetVal();location.reload();"><i class='ace-icon fa fa-trash'></i>Cancel</button> 
					
						</div>
						<div class="clearfix"></div>
					</div>
				
				
				</div>
			</div>
			</div>
			</div>
			</form> 
		<!----- Add form end ----->
		<!-- delete form start -->
		
		<!--  <div id="deletenote">
			<div id="popupwrapper_contactform"
				style="height: 100px; width: 250px;">

				<div class="heading_contactform">
					<h3>Message</h3>
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 100px;">
					Do you want to delete this selected records? Please confirm.</div>
				<div class="topbuttonholder">
					<form>
						<input class="dbtn" value="Yes" id="Yes" type="button"
							onclick="confirmDelete();"> <input class="dbtn"
							value="No" id="No" type="button"
							onclick="popup('popUpAlertaddnote');">
					</form>
				</div>
			</div>
		</div>  -->
		
		
		<div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
       		<div class="modal-content">
        		<div class="modal-header">
            		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            		<h4 class="modal-title" id="myModalLabel">Message</h4> 
   						Do you want to delete this selected records? Please confirm.
   					<div class="clearfix"></div>
   					<div class="space"></div>
   					
     				<div style="float: right;">
      				<form>
                    	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDelete();"> Yes</button>
        				<button data-bb-handler="cancel" type="button" class="btn btn-danger btn-sm" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> No</button>
     	 			</form>
     				</div>
     				<div class="clearfix"></div>
    			</div>
   			</div>
  		</div>
 	</div>

		<!-- delete form end -->
		<!-- Edit form start -->
				
 			<input type="hidden" name="partyID" id="partyids" value="${partyID}">
 			<input type="hidden" name="oldDeptId" id="oldDeptId">
 			<input type="hidden" id="hdnteammemberId1" name="teammemberId1">

			<form id="editForm" name="editForm" method="post">
			<div class="modal fade" id="editnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
    		<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" onClick="location.reload();" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Edit Service Team Member Allocation</h4> 
      		</div> 
      	
				<div class="modal-body">
					<span class="searchpadding padding_top" style="float: left; width: 150px;">Biz Unit <span class="red">*</span>
					</span> <span class="searchpadding padding_top" style="float: left; width: 300px;"> 
					<select name="buid" id="editbizunit" class="form-control" onchange="editdepartmentlist(0,0);">
					</select></span>
					
					<div class="clearfix"></div>
					<span class="searchpadding padding_top" style="float: left; width: 150px;">Department <span class="red">*</span></span> 
					<span class="searchpadding padding_top" style="float: left; width: 300px;"> 
					<select name="departmentId" id="editdepartment" class="form-control">	
					</select></span>
					
					<div class="clearfix"></div>
					<span class="searchpadding padding_top" style="float: left; width: 140px;">Access Start Date <span class="red">*</span></span> 
					<span class="searchpadding padding_top " style="float: left; width: 400px;">
						<input type='text' name="startDate" readonly="readonly" id="editstartDatepickerId" maxlength="20" placeholder="Start Date"/> 
						<span style="float: left; margin: 5px;"></span>
					</span>
					
					<div class="clearfix"></div>
					<span class="searchpadding padding_top" style="float: left; width: 140px;">Access Expiry Date </span>
					<span class="searchpadding padding_top "style="float: left; width: 400px;"> 
					<input type='text'name="endDate" readonly="readonly" id="editexpireDatepickerId" maxlength="20" placeholder="End Date"/> 
						<span style="float: left; margin: 5px;"></span>
					</span>

					<div class="clearfix"></div>
					<span class="searchpadding padding_top" style="float: left; width: 150px;">Control Options <span class="red">*</span>
					</span> <span class="searchpadding padding_top " style="float: left; width: 400px;"> 
					<input name="status" id="editisactive" type="checkbox"> <span class="user">Active? </span>
					</span>
				    <div class="clearfix"></div> 
				    <div class="space"></div>
				
							
				<div class="topbuttonholder">
						 <div style="float:right;">
					
							<button  class="btn btn-sm btn-primary" onClick="updateMemberAllocation();"><i class='ace-icon fa fa-plus'></i>Save</button>
                    		<button  class="btn btn-sm btn-danger" onClick="resetVal();location.reload();"><i class='ace-icon fa fa-trash'></i>Cancel</button> 
					
						</div>
						<div class="clearfix"></div>
				</div>
				</div>
		</div>
		</div>
		</div>
		</form> 
		<!-- Edit form end -->
	


	<!--Nav Menu Start-->
	<div class="navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" data-target=".navbar-collapse"
					data-toggle="collapse" type="button">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!--<a class="navbar-brand" href="#"> </a>-->
			</div>

		</div>
	</div>
	<!--Nav Menu End-->
	

	<div class="page-header">
		<h1 class="pull-left">Allocation List for Member ${userName}</h1>
             <form class="form-search pull-right">
                 <span class="input-icon">
                		<input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
                		<i class="ace-icon fa fa-search nav-search-icon"></i>
                </span>
              </form>
         <div class="clearfix"></div>
	</div>
	
	<!-- Center part start -->
	<section>
			<div class="container-body" style="margin-top: 0px;">
				
				<ul class="pagination pagination-sm"></ul>
				<div class="pull-right">
					
					<button  class="btn btn-xs btn-primary" onClick="addNote();bizUnitlist();"><i class='ace-icon fa fa-plus'></i>New  Allocation</button>
                    <button  class="btn btn-xs btn-danger" onClick="deleteallocation();"><i class='ace-icon fa fa-trash'></i>Delete</button>
                    <a href="<%=request.getContextPath()%>/teammember/loadteammember.htm"> <input class="btn btn-xs btn-light bigger" id="btn_update_c" type="button" value="back" name="Cancel" ></a> 
									
									
									
				</div>
			
				<div class="clearfix"></div>
				
				<div class="table-responsive" id="display_table_lead">
					<div id="toreload">
					
							<table id="grid-table"></table>
							<div id="grid-pager"></div>
						
					</div>
				</div>
				<div class="pull-left">
     			<div class="hr-12"></div>
     				<div class="topmenuleft margin_5px" >
          				<span>Export options:</span>
          					<a class="margin_5px" onclick="getCSV()" title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-120"></i></a>
          					<a class="margin_5px" onclick="getXLS()" title="Export in Excel" alt="Export in Excel"><i class="fa fa-file-excel-o bigger-120"></i></a>
          					
                	</div>
				</div>
			
				<div class="pull-right">
				<div class="hr-12"></div>
				
					<button  class="btn btn-xs btn-primary" onClick="addNote();bizUnitlist();"><i class='ace-icon fa fa-plus'></i>New  Allocation</button>
                    <button  class="btn btn-xs btn-danger" onClick="deleteallocation();"><i class='ace-icon fa fa-trash'></i>Delete</button>
                    <a href="<%=request.getContextPath()%>/teammember/loadteammember.htm"> <input class="btn btn-xs btn-light bigger" id="btn_update_c" type="button" value="back" name="Cancel" ></a>
                    				
				</div>
			</div>
	</section>
	<!-- Center part End -->

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	

<script type="text/javascript">

/* function addNote(){

$("#addnote").show();	
$("#deletenote, #editnote").hide();	
$("#popUpAlertaddnote").css ('height','460px');
$("#popUpAlertaddnote").css ('width','650px');
$("#popUpAlertaddnote").css ('left','425px');
$("#popUpAlertaddnote").css ('top','125px');
}

function deleteNote(){

	$("#deletenote").show();	
	$("#addnote, #editnote, #uploadUser, #LoginonBehalf").hide();	
	$("#popUpAlertaddnote").css ('height','250px');
	$("#popUpAlertaddnote").css ('width','300px');
	$("#popUpAlertaddnote").css ('left','550px');
	$("#popUpAlertaddnote").css ('top','125px');
	
}
function editNote(){

	$("#editnote").show();	
	$("#addnote, #deletenote").hide();	
	$("#popUpAlertaddnote").css ('height','460px');
	$("#popUpAlertaddnote").css ('width','650px');
	$("#popUpAlertaddnote").css ('left','425px');
	$("#popUpAlertaddnote").css ('top','125px');

	}
 */
 
 function addNote(){
		$("#deletenote, #editnote").hide();	
		$('#addnote').modal('show'); 
		}

	function deleteNote(){
		$("#editnote,#addnote").hide(); 
		$('#deletenote').modal('show'); 
		}

	function editNote(){
		$("#deletenote, #addnote").hide();	
		$('#editnote').modal('show'); 
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

//select all checkbox
$(document).ready(function() {
    $('#selecctall').click(function(event) {  //on click 
        if(this.checked) { // check select status
            $('.checkbox1').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"               
            });
        }else{
            $('.checkbox1').each(function() { //loop through each checkbox
                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
            });         
        }
    });
    
});




 function addAllocationDepartmentList(closePopup)
{
	 //alert("Hiiiiiiiiiiiiiiii");
	 //alert(closePopup);
	   var Active=document.getElementById("addisactive").checked;
		//alert(Active);
		var buid = $('#addbizunit').val();
	
			/* if(addcheckAllocation()==true)
			{
				return ;
			} */
			
			
			if($('#addbizunit').val()==0)
			{
				alert('Please select BizUnit');
			}	
			else if($('#adddepartment').val()==0)
			{
				alert('Please select Department');
			}
			else if($('#addstartDatepickerId').val().trim()=="")
			{
				alert('Please select Start Date');
				$('#addstartDatepickerId').focus();
			} 
			else if(Active==false)
			{
				alert('Please check control option');
				$('#addisactive').focus();
			}
			/* else if($('#addexpireDatepickerId').val().trim()=="")
			{
  				alert('Please fill End Date');
  				$('#addexpireDatepickerId').focus();
  			} */
			else 
			{
			
	$.ajax({
		type :'POST',
		url : $('#contextPath').val()+"/teammember/addMemberAllocation.htm?buid="+buid,
		data:$('#addForm').serialize(),
		//type :"POST",
		//data:$('#userform').serialize(),
		/*  url : $('#contextPath').val()+"/teammember/addMemberAllocation.htm?partyID="+$('#partyids').val()
				+"&bizunit="+$('#addbizunit').val()
				+"&departmentId="+$('#adddepartment').val()
				+"&allocationStartDate="+$('#addstartDatepickerId').val()
				+"&allocationEndDate="+$('#addexpireDatepickerId').val()
				+"&status="+Active,  */ 
	
				
		 success : function(result) 
		 { 
			 
           alert( 'Department allocated successfully.');
           //alert(closePopup);
           if(closePopup == 1)
           {
        	   location.reload();
           }
           else
           {
        	   addNote();
        	   resetVal();
           }
           
  		 }
	  });
	}
}

 /*function addCloseAllocationDepartmentList()
{
	 
			    var Active=document.getElementById("addisactive").checked;
		 		
		 		
		 		if(addcheckAllocation()==true)
		 		{
		 			return ;
		 		}
		 		
		 		if($('#addbizunit').val()==0)
				{
					alert('Please select BizUnit');
				}	
		 		else if($('#adddepartment').val()==0)
				{
					alert('Please select Department');
				}	
		 		else if($('#addstartDatepickerId').val().trim()=="")
				{
					alert('Please fill Start Date');
					$('#addstartDatepickerId').focus();
				}	
				
				else 
			
				{	

		 	$.ajax({
		 		type :"POST",
		 		
		 		url : $('#contextPath').val()+"/teammember/addMemberAllocation.htm?partyID="+$('#partyids').val()
				+"&bizunit="+$('#addbizunit').val()
				+"&departmentId="+$('#adddepartment').val()
				+"&allocationStartDate="+$('#addstartDatepickerId').val()
				+"&allocationEndDate="+$('#addexpireDatepickerId').val()
				+"&status="+Active,  
		 	
		 				
		 		 success : function(result) 
		 		 { 
		            alert( 'Allocation Department Successfully...!');
		            //resetVal();
		            location.reload();
		   		 }
		 		
		 		
		 	  });
		 	
		 	}

	}*/

 
 function addcheckAllocation()
 {
	 var partyID1=document.getElementById("partyids").value;
	 var buid=document.getElementById("addbizunit").value;
	 var departmentId=document.getElementById("adddepartment").value;
	 
	//alert("check......................................");
  	//alert("PartyID IN check="+partyID);
  	//alert("BuID IN check="+buid);
  	///alert("DepartmentId IN check="+departmentId);
  	
  	//alert(partyID1);
  	if(partyID1==0 && buid==0 && departmentId==0)
  	{
   		return false;
  	}
  	else if(partyID1>0 && buid>0 && departmentId>0)
  	{
  		//alert("partyID="+partyID);
  		//alert("BuID="+buid);
  		//alert("DepartmentId="+departmentId);
  		//alert("check.......................................");
  		
   $.ajax
   ({         
       type: "GET",
       url: $('#contextPath').val()+"/teammember/getUniqAllocation.htm?partyID="+partyID1
       								+"&buid="+buid
									+"&departmentId="+departmentId, 
       dataType: 'json',										
       async : false,											
       contentType: 'application/json',
          success:function(result)
       { 
        	// alert(result);
        	 if(result == 1)
 			{
 			 alert('Allocated Department is already exists please select other department');
 			// +$('#addbizunit').val('');
 			 +$('#adddepartment').val('');
 			
 			}
        	/*  $(result).each(
 						function(i, obj) 
 						{
 							var  module=obj.allocationStatus;
 							//alert("Allocation Status="+allocationStatus);
 							
 							if(module == 1)
 								{
 								 alert('Allocated Department is already exists');
 								 +$('#addbizunit').val('');
 								 +$('#adddepartment').val('');
 								 
 								}
 						});	 */  
 						
 						
       }
    
    });
  }
  
 }
  
//Function from Bajirao (faqList)
function bizUnitlist()
{
	   	$.ajax({			   				
	   		 type: "POST",
	   		 url: $('#contextPath').val()+'/faq/getBupartyname.htm',
	   		 //url: $('#contextPath').val()+'/teammember/getBizunitSection.htm',
	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  { 
				   	
				   				
								$('#addbizunit').empty();
								$('#addbizunit').append('<option value="0">--Select--</option>');
								$('#adddepartment').append('<option value="0">--Select--</option>');
										$(result).each(
										function(i, obj) {
								
											var moduleid=obj.buId;
											var moduleName=obj.lastName; 
											$('#addbizunit').append('<option value="'+ moduleid+'">'+ moduleName + '</option>');		
											
							});
														
	   		  }
	   	
	   	});   
	   
}

function departmentlist()
 {
	
 	$.ajax({    	 
      type: "POST",
      url: $('#contextPath').val()+'/teammember/getDepartmentSection.htm?bizunit='+$('#addbizunit').val(),  
      dataType: 'json', 
      contentType: 'application/json',     
         success:function(result)  
      { 
      
       			$('#adddepartment').empty();         
     			$('#adddepartment').append('<option value="0">--Select--</option>');
 		
       			 $(result).each(   
    		  
       			 function(i, obj) {
       			
       				var moduleid=obj.departmentId;
       				var moduleName=obj.displayShortName;  
       				//alert(moduleid);
       				//alert(moduleName);
     	   
         $('#adddepartment').append('<option value="'+ moduleid+'">'+ moduleName + '</option>');
       
        });     

     
      }
   
   });   
 	
 } 	 
   
function editbizUnitlist(buid)
{
		//alert(buid);
	   	$.ajax({			   				
	   		 type: "GET",
	   		 url: $('#contextPath').val()+'/faq/getBupartyname.htm',
	   		 //url: $('#contextPath').val()+'/teammember/getBizunitSection.htm',
	   		 dataType: 'json',
			 contentType: 'application/json',
				   		  success:function(result)
	   		  { 
								$('#editbizunit').empty();
								//$('#editbizunit').append('<option value="0">--Select--</option>');
								
										$(result).each(
										function(i, obj) {
								
											var moduleid=obj.buId;
											var moduleName=obj.lastName; 
											
											if(buid == moduleid){
						       					$('#editbizunit').append('<option value="'+ moduleid+'" selected="selected">'+ moduleName + '</option>');
						    		      	} else{
						    		      		$('#editbizunit').append('<option value="'+ moduleid+'">'+ moduleName + '</option>');	
						    		      	}
											
											
											//$('#editbizunit').append('<option value="'+ moduleid+'">'+ moduleName + '</option>');		
											
							});
														
	   		  }
	   	
	   	});   
	   
}

function editdepartmentlist(buid,deptid)
 {
	
	var bunitid;
	
	if($('#editbizunit').val() == null){
		bunitid = buid;
	} else{
		bunitid = $('#editbizunit').val();
	}
	//alert(bunitid);
	
 	$.ajax({     
      type: "GET",
       url: $('#contextPath').val()+'/teammember/getDepartmentSection.htm?bizunit='+bunitid,  
      dataType: 'json', 
      contentType: 'application/json',     
         success:function(result)  
      { 
      
       			$('#editdepartment').empty();         
     			$('#editdepartment').append('<option value="0">--Select--</option>');
 		
       			 $(result).each(   
       			 function(i, obj) {
       			
       				var moduleid=obj.departmentId;
       				var moduleName=obj.displayShortName;  
       				//alert(moduleid);
       				//alert(moduleName);
       				if(deptid == moduleid){
       					$('#editdepartment').append('<option value="'+ moduleid+'" selected="selected">'+ moduleName + '</option>');
    		      	} else{
    		      		$('#editdepartment').append('<option value="'+ moduleid+'">'+ moduleName + '</option>');	
    		      	}
                
       
        });     

     
      }
   
   });   
 	
 } 	 
 
	function resetVal()
	{
	
		$('#addbizunit').val('');
		$('#adddepartment').val('');
		$('#addstartDatepickerId').val('');
		$('#addexpireDatepickerId').val(''); 
		//document.getElementById("addisactive").checked = false;
		//$('#addisactive').val('');
		var d = new Date();

		var month = d.getMonth()+1;
		var day = d.getDate();

		var output = (day<10 ? '0' : '') + day + '/' +
		(month<10 ? '0' : '') + month + '/' +
		d.getFullYear();

		$("#addstartDatepickerId").val(output);
	
	}

		function deleteallocation()
	  		{ 
			
			 	var selectedlvals = [];
			  	$('input:checkbox[id=chkdeleteselect]:checked').each(function() {
				  	selectedlvals.push($(this).val());
			  	});
			
				if(selectedlvals == "")
				{
				 	alert('Please select at least one item to delete');
				 	return;
				}
				else
					{
						deleteNote();
					}
				document.getElementById("confirmdelete").value = selectedlvals;
			    
			  };
			   
			   
		function confirmDelete()
			 {
			/* if(validateDeleteAllocation()==true)
	 		{
	 			return ;
	 		}
			else
				{ */
			    /* var selvals= document.getElementById("confirmdelete").value;
			    //alert('Delete Value:-'+selvals);
			    $.ajax({
			    type : 'POST',
			    url : $('#contextPath').val()+"/teammember/deleteAllocationList.htm?Lists="+selvals,
			     success : function(result) 
			    {
			    	    alert('Deleted Successfully....!');
			    	    location.reload();	
			    	
			     }
			    });  */
				var selectedlvals= document.getElementById("confirmdelete").value;
			    alert(selectedlvals);
				 
			   	  $.ajax({
						   type : 'POST',
						   url : $('#contextPath').val()+"/teammember/deleteAllocationList.htm?selectedlvalz="+selectedlvals,
			 			   success : function(result)
				            {
			 				  	alert('Department allocation deleted successfully');
							 	location.reload();
		                   }
				   }); 
				//}  
			  }
		
 
		 function validateDeleteAllocation()
		 {
			 var partyID=document.getElementById("partyids").value;
			
			//alert("check......................................");
		  	//alert("PartyID IN check="+partyID);
		  	
		   $.ajax
		   ({         
		       type: "GET",
		       url: $('#contextPath').val()+"/teammember/getValidateAllocation.htm?partyID="+partyID,
		       								
		       dataType: 'json',										
		       async : false,											
		       contentType: 'application/json',
		          success:function(result)
		       { 
		        	 // alert(result)
		        	 $(result).each(
		 						function(i, obj) 
		 						{
		 							var  module=obj.deletelist;
		 							//alert("Allocation Status="+deletelist);
		 							
		 							if(module > 0)
		 								{
		 								 alert('You can not delete this Assigned department ');
		 								// popup('popUpAlertaddnote');
		 								}
		 						});	  
		 						
		 						
		       }
		    
		    });
		  }
		  
		
		

function updateAllocation(buid,depid,startDate,endDate,active,bizunit,departmentName,teamId)
{
	//alert("HI.....................!");
		var partyid=document.getElementById("partyids").value;
	 	//var teammemberId=document.getElementById("hdnteammemberId").value; 
	 	document.getElementById("hdnteammemberId1").value=teamId;
	 	document.getElementById("oldDeptId").value = depid;
	 	
// 		alert("PartyID="+partyid); 
// 		alert("TeamMemberID="+teamId);  
// 		alert("BuID="+buid);
// 		alert("DepartmentID="+depid);
// 		alert("StartDate="+startDate);
// 		alert("ExpireDate="+endDate);
// 		alert("Active="+active);
	    
	    
	    if(active=='true')
		{
    	   document.getElementById("editisactive").checked = true;	
    	   
		}
	   else
		{
			document.getElementById("editisactive").checked = false;
			
		} 

	   
	 	//$("#editbizunit").val(buid);
	    $("#editdepartment").val(depid);
	    $("#editstartDatepickerId").val(startDate);
	   	$("#editexpireDatepickerId").val(endDate);
	   	$("#editisactive").val(active);
	       
		//$('#editdepartment').empty();
		//$('#editdepartment').append('<option value="'+ depid+'">'+ departmentName + '</option>');
		editbizUnitlist(buid);
		editdepartmentlist(buid,depid);
		//$('#editdepartment').append('<option value="0">--Select--</option>');
		
		//$('#editbizunit').empty();
		//$('#editbizunit').append('<option value="'+ buid+'">'+ bizunit + '</option>');
		//$("#editbizunit").val(buid);
		//$('#editbizunit').append('<option value="0">--Select--</option>'); 
	    	
}

function updateMemberAllocation()
{
	//alert('partyID='+$('#partyids').val());
    //alert('teammemberId='+$('#hdnteammemberId').val());
    //alert('bizunit='+$('#editbizunit').val());
    //alert('departmentId='+$('#editdepartment').val());
	//alert('allocationStartDate='+$('#editstartDatepickerId').val());
	//alert('allocationEndDate='+$('#editexpireDatepickerId').val());
	
	 var stcheck=document.getElementById("editisactive").checked;
	 var teamId = document.getElementById("hdnteammemberId1").value;
	// alert(teamId);
	 if(stcheck == true)
		{
		 	document.getElementById("editisactive").checked = true;
		}
	   else
		{
		   document.getElementById("editisactive").checked = false;
		} 
	 
	//alert("status="+stcheck); 
	
	 if(editcheckAllocation()==true)
		{
			return ;
		}
	 if($('#editbizunit').val()== 0)
		 {
		 	alert("Please select BizUnit");
		 }
	 else if($('#editdepartment').val()== 0)
	 	{
	 		alert("Please select Department");
	 	}
	 else if(stcheck==false){
			alert('Please check control option');
			$('#addisactive').focus();
		}
	
	 else
		 {
		
		 $.ajax({ 
			 type :'POST',
				url : $('#contextPath').val()+"/teammember/updateMemberAllocation.htm?teammemberId="+$('#hdnteammemberId1').val()+"&buid="+$('#editbizunit').val(),
				data:$('#editForm').serialize(),
	      /* type: "POST",   			     
	      url: $('#contextPath').val()+"/teammember/updateAllocationdepartment.htm?teammemberId="+$('#hdnteammemberId').val()
	      		+"&bizunit="+$('#editbizunit').val()
				+"&departmentId="+$('#editdepartment').val()
				+"&allocationStartDate="+$('#editstartDatepickerId').val()
				+"&allocationEndDate="+$('#editexpireDatepickerId').val()
				+"&status="+stcheck, */   
	                
	      success:function(result)
	      { 
	    	  alert('Member allocation updated successfully.');
			  location.reload();
	      }
	   
	   });
	}
}

function editcheckAllocation()
{
	 var partyID=document.getElementById("partyids").value;
	 var buid=document.getElementById("editbizunit").value;
	 var departmentId=document.getElementById("editdepartment").value;
	 var olddepartmentId=document.getElementById("oldDeptId").value;
	//alert("check......................................");
 	//alert("PartyID IN check="+partyID);
 	//alert("BuID IN check="+buid);
 	///alert("DepartmentId IN check="+departmentId);
 	//alert("Old Dept Id : "+olddepartmentId + " New Dept id : " + departmentId);
 
 	if(partyID==0 && buid==0 && departmentId==0)
 	{
  		return false;
 	}
 	
 	else if(partyID>0 && buid>0 && departmentId>0 && (olddepartmentId != departmentId))
 	{
 		//alert("partyID="+partyID);
 		//alert("BuID="+buid);
 		//alert("DepartmentId="+departmentId);
 		//alert("check.......................................");
 		
  $.ajax
  ({         
      type: "GET",
      url: $('#contextPath').val()+"/teammember/getUniqAllocation.htm?partyID="+partyID
      								+"&buid="+buid
									+"&departmentId="+departmentId, 
      dataType: 'json',										
      async : false,											
      contentType: 'application/json',
         success:function(result)
      { 
       	 // alert(result)
       	  if(result == 1)
 			{
 			 alert('Allocated Department is already exists please select other department');
 			// $('#editbizunit').val('');
			 $('#editdepartment').val(0);
			 return true;
 			} 
       	/*  $(result).each(
						function(i, obj) 
						{
							var  module=obj.allocationStatus;
							//alert("Allocation Status="+allocationStatus);
							
							if(module == 1)
								{
								 alert('Allocated Department is already exists');
								 +$('#editbizunit').val('');
								 +$('#editdepartment').val('');
								 
								}
						});	   */
						
						
      }
   
   });
  return false;
 }
 
}


function getXLS()
{
		window.location.href = "<%=request.getContextPath()%>/teammember/allocationListExport.htm?partyID=${partyID}&userName=${userName}&type=CSV";
}
function getCSV()
{
		window.location.href = "<%=request.getContextPath()%>/teammember/allocationListExport.htm?partyID=${partyID}&userName=${userName}&type=excel";
}

$(document).ready(function(){
	var d = new Date();

	var month = d.getMonth()+1;
	var day = d.getDate();

	var output = (day<10 ? '0' : '') + day + '/' +
	(month<10 ? '0' : '') + month + '/' +
	d.getFullYear();

	$("#addstartDatepickerId").val(output);
    $("#addstartDatepickerId").datepicker({
        showOn: 'button',
        minDate : '0',
        buttonText: 'Show date',
        buttonImageOnly: true,
        buttonImage: '../images/calendar.gif',
        dateFormat: 'dd/mm/yy',
        constrainInput: true,
        
        onSelect: function(selected) 
        {
            $("#addexpireDatepickerId").datepicker("option","minDate", selected)
         }
    });

    $(".ui-datepicker-trigger").mouseover(function() {
        $(this).css('cursor', 'pointer');
    });
});

$(document).ready(function(){
    $("#addexpireDatepickerId").datepicker({
        showOn: 'button',
        minDate : '0',
        buttonText: 'Show date',
        buttonImageOnly: true,
        buttonImage: '../images/calendar.gif',
        dateFormat: 'dd/mm/yy',
        constrainInput: true
    });

    $(".ui-datepicker-trigger").mouseover(function() {
        $(this).css('cursor', 'pointer');
    });
});

$(document).ready(function(){
    $("#editstartDatepickerId").datepicker({
        showOn: 'button',
        minDate : '0',
        buttonText: 'Show date',
        buttonImageOnly: true,
        buttonImage: '../images/calendar.gif',
        dateFormat: 'dd/mm/yy',
        constrainInput: true,
        
        onSelect: function(selected) 
        {
            $("#editexpireDatepickerId").datepicker("option","minDate", selected)
         }
    });

    $(".ui-datepicker-trigger").mouseover(function() {
        $(this).css('cursor', 'pointer');
    });
});

$(document).ready(function(){
    $("#editexpireDatepickerId").datepicker({
        showOn: 'button',
        minDate : '0',
        buttonText: 'Show date',
        buttonImageOnly: true,
        buttonImage: '../images/calendar.gif',
        dateFormat: 'dd/mm/yy',
        constrainInput: true
    });

    $(".ui-datepicker-trigger").mouseover(function(){
        $(this).css('cursor', 'pointer');
    });
});

function changePageSize(){
	
	var partyid = $('#partyids').val();
	var userName=$('#userName').val();
	
 	$("#toreload").load('${pageContext.request.contextPath}/teammember/allocationList.htm #toreload', 
 	{
	   object: '${object}',
	   pageSize: $('#page').val(),
	   partyID:partyid,
	   userName:userName,

	}, 
	function( response, status, xhr ) {
      try{
        //closePopupWebApp('');
      }catch(e){
        // closePopupWebApp('');       
      }
     });
}




var grid_data='${allocationList}';
//alert("grid data="+grid_data);
index=JSON.parse(grid_data);
/*var index=new Array();
$(grid_data).each(function(i,obj) {
	var object = {};
	object.name = obj.name;
	object.pingOwner=obj.pingOwner;
	object.notifyTemplateID=obj.notifyTemplateID;
	index.push(object);
	
});*/


var subgrid_data = 
[
 {id:"1", name:"sub grid item 1", qty: 11},
 {id:"2", name:"sub grid item 2", qty: 3},
 {id:"3", name:"sub grid item 3", qty: 12},
 {id:"4", name:"sub grid item 4", qty: 5},
 {id:"5", name:"sub grid item 5", qty: 2},
 {id:"6", name:"sub grid item 6", qty: 9},
 {id:"7", name:"sub grid item 7", qty: 3},
 {id:"8", name:"sub grid item 8", qty: 8}
];

jQuery(function($) {
	var grid_selector = "#grid-table";
	var pager_selector = "#grid-pager";
	
	//resize to fit page size
	$(window).on('resize.jqGrid', function () {
		$(grid_selector).jqGrid( 'setGridWidth', $(".page-content").width() );
    })
	//resize on sidebar collapse/expand
	var parent_column = $(grid_selector).closest('[class*="col-"]');
	$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
		if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
			//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
			setTimeout(function() {
				$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
			}, 0);
		}
    })
	
	//if your grid is inside another element, for example a tab pane, you should use its parent's width:
	/**
	$(window).on('resize.jqGrid', function () {
		var parent_width = $(grid_selector).closest('.tab-pane').width();
		$(grid_selector).jqGrid( 'setGridWidth', parent_width );
	})
	//and also set width when tab pane becomes visible
	$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	  if($(e.target).attr('href') == '#mygrid') {
		var parent_width = $(grid_selector).closest('.tab-pane').width();
		$(grid_selector).jqGrid( 'setGridWidth', parent_width );
	  }
	})
	*/
	
	



	jQuery(grid_selector).jqGrid({
		//direction: "rtl",

		//subgrid options
		subGrid : false,
		//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
		//datatype: "xml",
		subGridOptions : {
			//plusicon : "ace-icon fa fa-plus center bigger-110 blue",
			minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
			openicon : "ace-icon fa fa-chevron-right center orange"
		},
		//for this example we are using local data
		subGridRowExpanded: function (subgridDivId, rowId) {
			var subgridTableId = subgridDivId + "_t";
			$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
			$("#" + subgridTableId).jqGrid({
				datatype: 'local',
				data: subgrid_data,
				colNames: ['No','Item Name','Qty'],
				colModel: [
					{ name: 'id', width: 50 },
					{ name: 'name', width: 150 },
					{ name: 'qty', width: 50 }
				]
			});
		},
		


		data: index,
		datatype: "local",
		height: 250,
		//colNames:[' ', 'ID','Last Sales','Name', 'Stock', 'Ship via','Notes'],
		colNames:[' ',' ','BizUnit','Department','Start Date','End Date','Status'],
		colModel:[
				/* {name:'myac',index:' ', width:50, fixed:true, sortable:false, resize:false,
				formatter:'actions', 
				formatoptions:{ 
					keys:true,
					delbutton: false,//disable delete button
					//delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
					editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
				}}, */
				{name:'myac',index:' ', width:50, fixed:true, sortable:false, resize:false,
				formatter: function(cellvalue, options,rowObject) {
		              return '<a href="#" onclick="editNote();updateAllocation('+rowObject.buId+',\''+rowObject.departmentId+'\',\''+rowObject.startDate+'\',\''+rowObject.endDate+'\',\''+rowObject.status+'\',\''+rowObject.bizunit+'\',\''+rowObject.departmentName+'\',\''+rowObject.teammemberId+'\');" id="SPEditServiceTeamAllocationLink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
		              									
		          }},
				{name:'chkeditselected', index:'checkbox', width:50, sortable:false,formatter:function(cellvalue, options,rowObject) {
					return '<input role="checkbox" type="checkbox"  class="cbox" id="chkdeleteselect" value="'+rowObject.teammemberId+'" name="chkdeleteselect[]">';
				
				}},
	/* 			{name:'favouriteTemplate', index:'favouriteTemplate',formatter:function(cellvalue, options,rowObject) {
				var html='';
			    if(rowObject.favouriteTemplate==1)
			    	html+= '<i class="favoriteicon" title="Favorite"></i><br/><br/>';
			    if(rowObject.mostUsedTemplate==1)
			    	html+= '<i class="mostusedNewicon" title="Most Used"></i><br/><br/>';
			    if(rowObject.mostPopularTemplate==1)
			    	html+= '<i class="popularicon" title="Most Popular"></i><br/><br/>';
			    return html;
			}}, */
			//{name:'ListMember', index:'editLink'/* ,formatter:imageFormat,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/addPing.htm?notifyTemplateId='} */},
			{name:'bizunit',index:'bizunit'},
			{name:'departmentName',index:'departmentName',},
			{name:'startDate',index:'startDate',},
			{name:'endDate',index:'endDate',},
			{width:'100',formatter:function(cellvalue, options,rowObject){
			   if(rowObject.status==true)
			   {
			       return  '<span  class="label label-success";>' + "Active" + '</span>';
			   }
			   else 
			   {
			       return '<span class="label label-danger";>' + "InActive" + '</span>';
			   }
			        
			}},  
			    
			  
			    
		
			/*{name:'sdate',index:'sdate',width:90, editable:true, sorttype:"date",unformat: pickDate},
			{name:'name',index:'name', width:150,editable: true,editoptions:{size:"20",maxlength:"30"}},
			{name:'stock',index:'stock', width:70, editable: true,edittype:"checkbox",editoptions: {value:"Yes:No"},unformat: aceSwitch},
			{name:'ship',index:'ship', width:90, editable: true,edittype:"select",editoptions:{value:"FE:FedEx;IN:InTime;TN:TNT;AR:ARAMEX"}},
			{name:'note',index:'note', width:150, sortable:false,editable: true,edittype:"textarea", editoptions:{rows:"2",cols:"10"}}*/ 
		], 

		viewrecords : true,
		rowNum:10,
		rowList:[10,20,50,100,1000],
		pager : pager_selector,
		altRows: true,
		//toppager: true,
		
		//multiselect: true,
		//multikey: "ctrlKey",
        multiboxonly: true,

        loadComplete : function() {
            var table = this;
            setTimeout(function(){
             styleCheckbox(table);
             
             updateActionIcons(table);
             updatePagerIcons(table);
             enableTooltips(table);
            }, 0);
           },
           
           
		editurl: "/dummy.html",//nothing is saved
		//caption: "jqGrid with inline editing"

		autowidth: true,
        shrinkToFit: true,	



		/**
		,
		grouping:true, 
		groupingView : { 
			 groupField : ['name'],
			 groupDataSorted : true,
			 plusicon : 'fa fa-chevron-down bigger-110',
			 minusicon : 'fa fa-chevron-up bigger-110'
		},
		caption: "Grouping"
		*/

	});
	$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
	
	

	//enable search/filter toolbar
	//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
	//jQuery(grid_selector).filterToolbar({});


	//switch element when editing inline
	function aceSwitch( cellvalue, options, cell ) {
		setTimeout(function(){
			$(cell) .find('input[type=checkbox]')
				.addClass('ace ace-switch ace-switch-5')
				.after('<span class="lbl"></span>');
		}, 0);
	}
	//enable datepicker
	function pickDate( cellvalue, options, cell ) {
		setTimeout(function(){
			$(cell) .find('input[type=text]')
					.datepicker({format:'yyyy-mm-dd' , autoclose:true}); 
		}, 0);
	}
	
	
	
	
	
	
	

	//navButtons
	jQuery(grid_selector).jqGrid('navGrid',pager_selector,
		{ 	//navbar options
			edit: false,
			editicon : 'ace-icon fa fa-pencil blue',
			add: false,
			addicon : 'ace-icon fa fa-plus-circle purple',
			del: false,
			delicon : 'ace-icon fa fa-trash-o red',
			search: true,
			searchicon : 'ace-icon fa fa-search orange',
			refresh: false,
			refreshicon : 'ace-icon fa fa-refresh green',
			view: false,
			viewicon : 'ace-icon fa fa-search-plus grey',
		},
		{
			//edit record form
			//closeAfterEdit: true,
			//width: 700,
			recreateForm: true,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			}
		},
		{
			//new record form
			//width: 700,
			closeAfterAdd: true,
			recreateForm: true,
			viewPagerButtons: false,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
				.wrapInner('<div class="widget-header" />')
				style_edit_form(form);
			}
		},
		{
			//delete record form
			recreateForm: true,
			beforeShowForm : function(e) {
				var form = $(e[0]);
				if(form.data('styled')) return false;
				
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
				style_delete_form(form);
				
				form.data('styled', true);
			},
			onClick : function(e) {
				//alert(1);
			}
		},
		{
			//search form
			recreateForm: true,
			afterShowSearch: function(e){
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
				style_search_form(form);
			},
			afterRedraw: function(){
				style_search_filters($(this));
			}
			,
			multipleSearch: true,
			/**
			multipleGroup:true,
			showQuery: true
			*/
		},
		{
			//view record form
			recreateForm: true,
			beforeShowForm: function(e){
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
			}
		}
	)


	
	function style_edit_form(form) {
		//enable datepicker on "sdate" field and switches for "stock" field
		form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
		
		form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
				   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
				  //.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');

				
		//update buttons classes
		var buttons = form.next().find('.EditButton .fm-button');
		buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
		buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
		buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
		
		buttons = form.next().find('.navButton a');
		buttons.find('.ui-icon').hide();
		buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
		buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
	}

	function style_delete_form(form) {
		var buttons = form.next().find('.EditButton .fm-button');
		buttons.addClass('btn btn-sm btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
		buttons.eq(0).addClass('btn-danger').prepend('<i class="ace-icon fa fa-trash-o"></i>');
		buttons.eq(1).addClass('btn-default').prepend('<i class="ace-icon fa fa-times"></i>')
	}
	
	function style_search_filters(form) {
		form.find('.delete-rule').val('X');
		form.find('.add-rule').addClass('btn btn-xs btn-primary');
		form.find('.add-group').addClass('btn btn-xs btn-success');
		form.find('.delete-group').addClass('btn btn-xs btn-danger');
	}
	function style_search_form(form) {
		var dialog = form.closest('.ui-jqdialog');
		var buttons = dialog.find('.EditTable')
		buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
		buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
		buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
	}
	
	function beforeDeleteCallback(e) {
		var form = $(e[0]);
		if(form.data('styled')) return false;
		
		form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
		style_delete_form(form);
		
		form.data('styled', true);
	}
	
	function beforeEditCallback(e) {
		var form = $(e[0]);
		form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
		style_edit_form(form);
	}



	//it causes some flicker when reloading or navigating grid
	//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
	//or go back to default browser checkbox styles for the grid
	function styleCheckbox(table) {
	/**
		$(table).find('input:checkbox').addClass('ace')
		.wrap('<label />')
		.after('<span class="lbl align-top" />')


		$('.ui-jqgrid-labels th[id*="_cb"]:first-child')
		.find('input.cbox[type=checkbox]').addClass('ace')
		.wrap('<label />').after('<span class="lbl align-top" />');
	*/
	}
	

	//unlike navButtons icons, action icons in rows seem to be hard-coded
	//you can change them like this in here if you want
	function updateActionIcons(table) {
		/**
		var replacement = 
		{
			'ui-ace-icon fa fa-pencil' : 'ace-icon fa fa-pencil blue',
			'ui-ace-icon fa fa-trash-o' : 'ace-icon fa fa-trash-o red',
			'ui-icon-disk' : 'ace-icon fa fa-check green',
			'ui-icon-cancel' : 'ace-icon fa fa-times red'
		};
		$(table).find('.ui-pg-div span.ui-icon').each(function(){
			var icon = $(this);
			var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
			if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
		})
		*/
	}
	
	//replace icons with FontAwesome icons like above
	function updatePagerIcons(table) {
		var replacement = 
		{
			'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
			'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
			'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
			'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
		};
		$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
			var icon = $(this);
			var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
			
			if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
		})
	}

	function enableTooltips(table) {
		$('.navtable .ui-pg-button').tooltip({container:'body'});
		$(table).find('.ui-pg-div').tooltip({container:'body'});
	}

	//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');

	$(document).one('ajaxloadstart.page', function(e) {
		$(grid_selector).jqGrid('GridUnload');
		$('.ui-jqdialog').remove();
		
	});
});



</script>	




</body>
</html>