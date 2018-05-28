<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Client</title>
 
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

<script type="text/javascript">
//select all checkbox
/* $(document).ready(function() {
	
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
    }); */
    
    
    
   /*  $('#addquickSearch').blur(function(){
		 var arr = extractLast($('#addquickSearch').val());
		 this.value = this.value.replace(arr, '');
		 this.value = this.value.replace(/;/, '');
		
	  }); 

	$('#addquickSearch').click(function(){
		$('#addquickSearch').val('');
		$('#partyId').val(0);
	  }); 
    
});
 */
function addNote(){
	$("#deletenote, #editnote").hide();	
	$('#addnote').modal('show'); 
/* 
	$("#addnote").show();	
	
	$("#popUpAlertaddnote").css ('height','260px');
	$("#popUpAlertaddnote").css ('width','500px');
	$("#popUpAlertaddnote").css ('left','485px');
	$("#popUpAlertaddnote").css ('top','125px'); */
	}

function selectForMove()
{ 
	$("#addquickSearch").val('');
	$("#partyId").val(0);
	var selectedlvals = [];
  	$('input:checkbox[id=chkdeleteselect]:checked').each(function() {
		selectedlvals.push($(this).val());
  	});

	if(selectedlvals == ""){
		alert('Please select at least one client');
	 	return;
  	}else{
  		//document.getElementById("selectedPartyIds").value = selectedlvals;
  		$('#selectedPartyIds').val(selectedlvals);
  		addNote();
  		//popup('popUpAlertaddnote');
  		//getPartnerList();
	}
    
  }



function getPartnerList(){
	
	var searchString = $('#addquickSearch').val();
	if(searchString!=""){
	var event = window.event ? window.event : e;
	
	if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
		return;
	if(event.keyCode==13){
		search();
		return;
	}
	 $('.ui-autocomplete').css('z-index','9999999999999999');
	/*  alert($('#contextPath').val()); */
	$.ajax
	({
    	type: "GET",
      	//url:$('#contextPath').val()+'/partnersp/getPartnerListForChange.htm?id='+id+'&searchString='+searchString,
      			
      	url:$('#contextPath').val()+'/partnersp/getPartnerListForChange.htm?addquickSearch='+searchString,
      	dataType: 'json',
      	contentType: 'application/json',
        success:function(result)
      	{ 		   
        	var userLabelValueList = new Array();
        	$(result).each(function(i, obj) {
	     		//var recordType = obj.recordType;
	      		//var partyId = obj.partyId;
        		var object = {};
				object.value = obj.partyID;

				object.label = obj.partnerName;
				userLabelValueList.push(object);
	     	});
        	
        	
        	
        	 $("#addquickSearch")
			    // don't navigate away from the field on tab when selecting an item
			    .bind( "keydown", function( event ) {
			      if ( event.keyCode === $.ui.keyCode.TAB &&
			    		 
			    	$( this ).data( "ui-autocomplete" ).menu.active ) { 
			        event.preventDefault();
			      }
			    })
			   
			    
			    .autocomplete({
			      minLength: 0,
			      source: function( request, response ) {
			       last=extractLast(request.term);
			       if(last==null || last=='' || last==' ')
					{
						return false;
					}
			       response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
			      },
			      focus: function() {
			        // prevent value inserted on focus
			        return false;
			      },
			     
			      select: function( event, ui ) {
			    	  var terms = split( this.value );
				        
				        console.log('terms='+terms);
				        
				        // remove the current input
				        terms.pop();
				        // add the selected item 
				        terms.push(ui.item.label);
//				        	partyId=ui.item.value;
				        	$('#partyId').val(ui.item.value)
					
				        terms.push( "" );
				        this.value = terms.join( ";" );
				        
				        var labelArr = $(this).data('label') || new Array();
				        labelArr.push(ui.item);
				        $(this).data('label',labelArr);
				        console.log($(this).data());
				        
				        return false;
			      }
			    });
        	
        	
        	
        	
        	
      	}
   });
	}
}
function split( val ) {
    return val.split( /;\s*/ );
} 
function extractLast( term ) {
    return split( term ).pop();
}
function autovalid(){
	$('#addquickSearch').val('');
	$('#addquickSearch').focus();
	 $('#partyId').val(0);
	alert('Please select valid Partner.');
	
}

function SwitchPartner(){
	var selectedOpp= document.getElementById("selectedPartyIds").value;
	var PartyId = $('#partyId').val();
	//alert(selectedOpp +":" + PartyId);
	if(PartyId!=0){
	
	$.ajax({
		type: "POST",
 		url: $('#contextPath').val()+'/partnersp/changePartnerForOPPOrClient.htm?selectedOpp='+selectedOpp+"&PartyId="+PartyId,
 		dataType: 'json',
		contentType: 'application/json',
		success:function(result)
		{
			$("#addnote").hide();
			 bootbox.dialog({
					message: "<span class='bigger-110'>Please select valid Partner</span>",
					buttons: 			
					{
						"click" :
						{
							"label" : "OK!",
							"className" : "btn-sm btn-primary",
							"callback": function() {
								 location.reload();
								 document.getElementById("addForm").reset();	
							}
						}
					}
				});		  
			/* alert('Partner changed successfully');
		  window.location.reload(); */
		}
	});
	} else {
		$('#addquickSearch').focus();
		alert('Please select valid Partner');
	}
}

/* var hidePopupTimeoutId;
$(".choose3").live("mouseover", function () {
    clearTimeout( hidePopupTimeoutId );
    $(".popupnewclient3").show();
}); */


/* $(".choose3").live("mouseout", function () {
    hidePopupTimeoutId = setTimeout( function() {
        $(".popupnewclient3").hide();
    },500);
});

$(".popupnewclient3").live("mouseenter", function() {
    clearTimeout( hidePopupTimeoutId );
});
 */

// $(".popupnewclient3").live("mouseleave", function() {
//     $(".popupnewclient3").hide();
// });


// var hidePopupTimeoutId;
// $(".choose1").live("mouseover", function () {
//     clearTimeout( hidePopupTimeoutId );
//     $(".popupnew1").show();
// });


// $(".choose1").live("mouseout", function () {
//     hidePopupTimeoutId = setTimeout( function() {
//         $(".popupnew1").hide();
//     },500);
// });

// $(".popupnew1").live("mouseenter", function() {
//     clearTimeout( hidePopupTimeoutId );
// });


// $(".popupnew1").live("mouseleave", function() {
//     $(".popupnew1").hide();
// });

// $(".choose2").live("mouseover", function () {
//     clearTimeout( hidePopupTimeoutId );
//     $(".popupnew2").show();
// });


// $(".choose2").live("mouseout", function () {
//     hidePopupTimeoutId = setTimeout( function() {
//         $(".popupnew2").hide();
//     },500);
// });

// $(".popupnew2").live("mouseenter", function() {
//     clearTimeout( hidePopupTimeoutId );
// });


// $(".popupnew2").live("mouseleave", function() {
//     $(".popupnew2").hide();
// });

/* $(".popupnewclient3").live("onclick", function() {
    $(".popupnewclient3").hide();
});


var hidePopupTimeoutId;
$(".choose1").live("onclick", function () {
    clearTimeout( hidePopupTimeoutId );
    $(".popupnew1").show();
});


$(".choose1").live("onclick", function () {
    hidePopupTimeoutId = setTimeout( function() {
        $(".popupnew1").hide();
    },500);
});

$(".popupnew1").live("onclick", function() {
    clearTimeout( hidePopupTimeoutId );
});


$(".popupnew1").live("onclick", function() {
    $(".popupnew1").hide();
});

$(".choose2").live("onclick", function () {
    clearTimeout( hidePopupTimeoutId );
    $(".popupnew2").show();
});


$(".choose2").live("onclick", function () {
    hidePopupTimeoutId = setTimeout( function() {
        $(".popupnew2").hide();
    },500);
});

$(".popupnew2").live("onclick", function() {
    clearTimeout( hidePopupTimeoutId );
});


$(".popupnew2").live("onclick", function() {
    $(".popupnew2").hide();
}); */

function clientsearch()
{
	var id=0;
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++)
	{
	var sParameterName = sURLVariables[i].split('=');
	if (sParameterName[0] == 'partyId')
	{
		id= sParameterName[1];
	 }
	}
	    var value = $('#search').val();
   //alert('value='+value+" : partyId " + id );   
	window.location.href = $('#contextPath').val()+"/partnersp/getClientList.htm?partyId="+id+"&value="+value;
}
</script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
	<%-- <jsp:include page="../common/common_popup.jsp" /> --%>
 	
 	
 	<%-- <div style="display: none; width: 500px; height: 300px; top:105px; overflow: auto; left:485px !important;"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div> --%>
		
		<!-- --------------------Add form start----------------------------- -->
		<form id="addForm" name="addForm">
		<input type="hidden" name="selectedPartyIds" id="selectedPartyIds">
		<!-- <div id="addnote"> -->
		
			<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Change Partner</h4> </div>
     						 
      <div class="modal-body">  
			<!-- <div id="popupwrapper_contactform">
				<div class="heading_contactform">
					<h3>Change Partner</h3> -->
				
				<div id="poptable_contactform" style="padding: 10px; height: 140px;">
					<span class="searchpadding padding_top"
						style="float: left; width: 150px;">Select Partner <span
						class="red">*</span>
					</span> 
					<span class="searchpadding padding_top"	style="float: left; width: 178px;">
						<input type="text" id="addquickSearch" name="addquickSearch" class="form-control" placeholder="Quick Search" onKeyUp="getPartnerList();">
						
					</span> 
					<span class="searchpadding padding_top"	style="float: left; margin-top: 7px;">
						<!-- <i class="searchiconblue"></i> --> 
						<input  type="hidden" id="partyId" name="partyId">
					</span>
					

				</div>
				<div class="topbuttonholder">
				 <button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="SPAddNewBroadCastLink" onclick="SwitchPartner();"> Save</button>
				<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
					<!-- <input class="dbtn" value="Save" id="Save" type="button" onclick="SwitchPartner();"> 
					<input class="dbtn" value="Cancel" id="Cancel" type="button" onClick="popup('popUpAlertaddnote')"> -->
				</div>
			</div>
		</div></div></div>
		</form>
	
 <!-- Center part start -->
 
 
 
 <section>
  <div> 
    	<div class="container-head">
    	  <div class="col-md-12" style="text-align: right;">  <!-- accordion start-->
           
           	  <div class="accordion pull-left col-md-12" id="accordFundSel">
                <div class="accordion-group">
                  <div class="page-header clearfix">
           					 <h1 class="pull-left">Client</h1>
           						 <div class="nav-search pull-right" id="">
              					<form class="form-search">
               				<!--  <span class="input-icon"> -->
               			 <%-- <input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}"> --%>
               			<!--  <i class="ace-icon fa fa-search nav-search-icon"></i></span> -->
               		 </form>
           		 </div>
         		 </div>
<!--                   <div class="accordion-heading"> <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordFundSel" href="#collapseFundSel"> <span style=" margin-top:0px;" class="searchicon"  alt="Search" title="Search"></span> </a> </div> -->
                  <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
                    <div class="accordion-inner table-responsive">
                    <div style="width: 1000px;">
                        <!--1 search start -->
                       
                          <div class="filterbox searchpadding" style="width:300px;">
                            <div class="head"> </div>
                           <div class="drop_box_body">
                            <span class="searchtext"> Last Name</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" /> 
                            <span class="searchtext"> First Name</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                            <span class="searchtext"> PAN ID</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                            <span class="searchtext"> Mobile Number</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                             <br>
                         	</div>
                         </div>
                        <div class="filterbox searchpadding">
                          <div class="head">Entity Stage</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox"  checked>
                                Data Collection </li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Plan Writing</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox"  checked>
                                Plan Approval</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Action Plan Generation</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Ready for Execution</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Execution in Progress</li>
                             
                            </ul>
                          </div>
                        </div>
                        
                        <div class="filterbox searchpadding">
                          <div class="head">Member Category</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Client </li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Premium Client</li>
                             
                             
                            </ul>
                          </div>
                        </div>
                      
                       </div>
                       
                      </div>
          
                    <!-- accordion-inner END -->
                                    
                      <div class="col-md-1">
                      <button type="button" id="updatefilterlist" class="btn">Show</button>
                    </div>
                   
                  </div>
                  <!-- accordion-body END -->
                </div>
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
 
              
               <!-- accordion End -->
            </div >
          </div >
  	  <div class="container-body">
        <!--center -->
        
        <ul class="pagination pagination-sm">
        </ul>
        

<div class="topmenu"  style="float:right">
 	<!-- <div class="dropdown pull-left"> <a class="dropdown-toggle" href="#" data-toggle="dropdown" >
 			<input data-params="{}" type="button" class="dbtn createNewBtn" value="  More Action" title="More Action" alt="More Action"></a>
			<ul class="dropdown-menu" style="min-width:100px; padding: 0 20px 0 0; margin-left: 0px;">
	        	<li id="SPClientMassEmailLink"><a href="send_mass_email.html"><i class="emailicon"></i><span class="user">Mass Email</span></a></li>
	         	<li id="SPClientMassSMSLink"><a href="send_mass_sms.html"><i class="callicon"></i><span class="user">Mass SMS</span></a></li>
	            <li id="SPClientBulkDCRemindLink"><a href="#"><i class="datacollectionicon"> </i><span class="user">Bulk DC Reminder </span></a></li>
            </ul>
     </div> -->
 </div>
<div class="topmenu" style="float:right;">
			<a href="#">
 				<input id="SPMoveClient" data-params="{}" type="button" class="btn btn-primary btn-sm" value="  Change Partner"
						onClick="selectForMove();" title="Change Partner" alt="Change Partner">
			</a>
<!--  <input type="text" id="search" > <input type="button" value="search" onclick="clientsearch()"> -->
<%-- <a id="SPClientAddLink" href="<%=request.getContextPath()%>/addClient.htm"> 
	<input data-params="{}" type="button" class="dbtn createNewBtn" value="  New Client" title="New Client">
</a>
<input id="SPClientDeleteLink" data-params="{}" type="button" class="dbtn deleteBtn" value="  Delete"  title="Delete" onclick="deleteClients()">
<input id="SPClientBulkActvLink" type="button" class="dbtn createNewBtn" value="  Bulk Activation" title="Bulk Activation" onclick="bulkActivation()"> --%>
</div>
		<div class="table-responsive" id="display_table_lead" style="border:none;">
		  <div id="toreload">
		  
		  <table id="grid-table"></table>
		<div id="grid-pager"></div>
			                    
       
        <!-- Center-->    
     </div> 
     
    </div> 
<div class="col-sm-7">
 <ul class="pagination pagination-sm"  style="float:left; margin-right:20px;"></ul>	
<!-- <div class="topmenuleft">
 <div  class="customDropdown">
       <span >Page Size:</span>&nbsp;
     	<select  type="button" name="pageSize" id="page" onchange="pagesizeurl()" value="10">
     	<option selected="selected" value="10">10</option>
     	<option value="20">20</option>
     	<option value="50">50</option>
     	<option value="500">500</option>
     	<option value="1000">1000</option>
     	<option value="10000">Show All&nbsp;</option>
     </select> 
     </div>	
</div> -->

<!-- <div class="topmenuleft" > -->
 
<!--   <ul> -->
<!--   	<li> Export options: </li> -->
<!--     <li> <a href="#" title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li> -->
<!--     <li><a href="#" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li> -->
<!--     <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li> -->
<!--   </ul> --> 
<!--  </div> -->

</div>
<!-- <div class="topmenu">        	 -->
<!-- 	<a id="SPClientAddLink" href="add_client.html"><input data-params="{}" type="button" class="dbtn createNewBtn" value="  New Client" title="New Task"></a> -->
<!-- 	<input data-params="{}" type="button" class="dbtn deleteBtn" value="  Delete"  title="Delete"> -->
<!-- </div> -->
     </div>
     
     </div>    
           	
</section>           	
<!-- Center part End -->
  
<jsp:include page="../common/footer.jsp" />

	
</body>
	<!-- inline scripts related to this page -->
		<script type="text/javascript">
			var grid_data = ${clientDatas};
			
			
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
						plusicon : "ace-icon fa fa-plus center bigger-110 blue",
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
					
			
			
					data: grid_data,
					datatype: "local",
					height: 250,
					colNames:[' ','Name','City','PAN No.','Created Date','Email Id','Contact Number','Stage'],
					colModel:[
						{name:'checkbox', index:'checkbox',width:40,sortable:false,formatter:function(cellvalue, options,rowObject) {
   							 return '<input role="checkbox" type="checkbox" id="chkdeleteselect" class="cbox" value="'+rowObject.partyid+'" name="chkdeleteselect[]">';
						}},
						{name:'name',index:'name', width:120,formatter:viewProfile},
						/* {name:'panNo',index:'panNo', width:60, sorttype:"int", editable: true} */
						{name:'city',index:'city'},
						{name:'panNo',index:'panNo',},
						{name:'createdDate',index:'createdDate'},
						{name:'email',index:'email'},
						{name:'mobile',index:'mobile'},
						{name:'stage',index:'stage',sortable:false, width:75,formatter:function(cellvalue, options,rowObject) {
							var html='';
						    if(rowObject.stage=='Open'){
						    	html= '<div class="progress progress-striped pos-rel" title="0%"> <div class="progress-bar progress-bar-success" style="width: 0%">"'+rowObject.stage+'"</div></div>';
						    }
						    if(rowObject.stage=='DCT Activated'){
							   	html= '<div class="progress progress-striped pos-rel" title="25%"> <div class="progress-bar progress-bar-success" style="width: 25%"></div></div>';
						    }
							if(rowObject.stage=='DCT Partially Filled'){
								html= '<div class="progress progress-striped pos-rel" title="50%"> <div class="progress-bar progress-bar-success" style="width: 50%"></div></div>';
							}
							if(rowObject.stage=='Execution Open'){
							    html= '<div class="progress progress-striped pos-rel" title="90%"> <div class="progress-bar progress-bar-success" style="width: 90%"></div></div>';
							}
							if(rowObject.stage=='Execution Complete'){
							    html= '<div class="progress progress-striped pos-rel" title="100%"> <div class="progress-bar progress-bar-success" style="width: 100%"></div></div>';
							}
							if(rowObject.stage=='DCT Completed' || rowObject.stage=='DCT Submitted'){
							    html= '<div class="progress progress-striped pos-rel" title="75%"> <div class="progress-bar progress-bar-success" style="width: 75%"></div></div>';
							}
							
						    return html;
						}},
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
				
				
				function viewProfile( cellvalue, options, cell ){
					
					return '<a onclick="viewOpportunityProfileDetails('+cell.name+')">&nbsp; '+cellvalue+'</a>';
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
			
			
			
			
			
			
			
			
			
			
			
			
			
			var contactTypeList;
			var stageList;


			function getPopUpAction(id)
			{
				$("#"+id).show();		
			}

			function pagesizeurl(){
				//var pageSize=$('#page').val();	
				//window.location.href= $('#contextPath').val()+'/opportunity/getOpportunitiesList.htm?pageSize='+pageSize;
				setResult('');	
			}

			function setResult(filterRuleCriteria){
				var id=0;
				
				var sPageURL = window.location.search.substring(1);
				var sURLVariables = sPageURL.split('&');
				for (var i = 0; i < sURLVariables.length; i++)
				{
				var sParameterName = sURLVariables[i].split('=');
				if (sParameterName[0] == 'partyId')
				{
					id= sParameterName[1];
				 }
				
				}
				
				//alert(id);
				  openPopupWebApp('centerLoadingImage', 25, 35);
				  $("#toreload").load('${pageContext.request.contextPath}/partnersp/getClientList.htm #toreload', {
				   object: '${object}',
				   pageSize: $('#page').val(), 
				   partyId:id,
				   value:$('#search').val(),
				   filterRule: filterRuleCriteria
				     }, function( response, status, xhr ) {
				      try{
				        closePopupWebApp('');
				      }catch(e){
				         closePopupWebApp('');       
				      }
				     });
				 }

			function redirectDcActivation(partyId)
			{
					//window.location.href= $('#contextPath').val()+'/opportunity/redirectDcActivation.htm?partyId='+partyId+'&buId='+buId;
					$('#partyIds').val(partyId);
					$.ajax({
						type : 'POST',
						url : $('#contextPath').val()+"/opportunity/redirectDcActivation.htm",
						data : $('#bulkActivateForm').serialize(),
						success : function(result) {
							//alert(result);
							var recordCount=result[0];
							var isExistAnyUser=result[1];
							var isAlreadyActivated=result[2];
							if(recordCount>0){
//			 					localStorage.setItem('actionName',
//			 							window.location.pathname);
								showAlertMessage1("Success",
										"<br/>"+" DC activated. ",
										"confirmation", reloadPage);
								
							}else if(isAlreadyActivated==1){
								showAlertMessage1("Error",
										"<br/>"+" DC already activated. ",
										"error", doNothing);
							}else if(isExistAnyUser==1){
								showAlertMessage1("Error",
										"<br/>"+" Username already exist. Please change EmailId and then try again.",
										"error", doNothing);
							}
							
						}
					});
					
					
			}

			function redirectDcInput(partyId,buId,pname)
			{
					window.location.href= $('#contextPath').val()+'/opportunity/redirectDcInput.htm?partyId='+partyId+'&buId='+buId+'&pname='+pname;				
				
			}
			function viewClientProfileDetails(partyId){
				//alert(partyId);
				//window.location.href= $('#contextPath').val()+'/clientprofile.htm?partyId='+partyId;
			}

			/**
			 * deletes multiple users after taking confirmation.
			 */
			function deleteClients() {
				list = new Array();
				$('#data :checked').each(function(i, obj) {
					list[i] = $(this).attr('id');
				});
				if (list.length == 0) {
					showAlertMessage1("Message",
							"Please select at least one Client to delete.",
							"information", doNothing);
				} else{
					var message = "";
					if (list.length == 1) {
						message = "Do you want to delete this Client?";
					} else {
						message = "Do you want to delete these Clients?";
					}
					showAlertMessage1("Message", "<br/>" + message, "question",
							doNothing1);
					$('.ZebraDialog_Button1').attr('href','javascript:deleteClientsTrue()');
					$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
//			 		$('.ZebraDialog_Question').css('background-size', '149px');
//			 		$('.ZebraDialog_Question').css('background-position-x', '5px');
//			 		$('.ZebraDialog_Question').css('background-position-y', '2px');
//			 		$('.ZebraDialog_Question').css('background-position', '5px 2px');
				}
			}

			function deleteClientsTrue() {
				var message = "";
				if (list.length == 1) {
					message = "Client successfully deleted.";
				} else {
					message = "Clients successfully deleted.";
				}
				setTimeout(function() {
					$.ajax({
						type : 'POST',
						url : $('#contextPath').val()+"/client/deleteClients.htm?partyIds=" + list,
						success : function(result) {
							if(result=='success'){
								localStorage.setItem('actionName',
										window.location.pathname);
								showAlertMessage1("Success",
										'<br/>' + message,
										"confirmation", redirectFunction1);
								
							}else{
								showAlertMessage1("Error",
										"The connection to the server has been lost. Please try again later.",
										"error", doNothing);
							}
							
						}
					});
				}, 500);
			}


			function redirectDcActivation(partyId)
			{
					//window.location.href= $('#contextPath').val()+'/opportunity/redirectDcActivation.htm?partyId='+partyId+'&buId='+buId;
					$('#partyIds').val(partyId);
					$.ajax({
						type : 'POST',
						url : $('#contextPath').val()+"/opportunity/redirectDcActivation.htm",
						data : $('#bulkActivateForm').serialize(),
						success : function(result) {
							//alert(result);
							var recordCount=result[0];
							var isExistAnyUser=result[1];
							var isAlreadyActivated=result[2];
							if(recordCount>0){
//			 					localStorage.setItem('actionName',
//			 							window.location.pathname);
								showAlertMessage1("Success",
										"<br/>"+" DC activated. ",
										"confirmation", reloadPage);
								
							}else if(isAlreadyActivated==1){
								showAlertMessage1("Error",
										"<br/>"+" DC already activated. ",
										"error", doNothing);
							}else if(isExistAnyUser==1){
								showAlertMessage1("Error",
										"<br/>"+" Username already exist. Please change EmailId and then try again.",
										"error", doNothing);
							}
							
						}
					});
					
					
			}

			function bulkActivation() {
				list = new Array();
				$('#data :checked').each(function(i, obj) {
					list[i] = $(this).attr('id');
				});
				if (list.length == 0) {
					showAlertMessage1("Message",
							"Please select at least one Client.",
							"information", doNothing);
				} else{
					var message = "";
					if (list.length == 1) {
						message = "Do you want to activate these Client?";
					} else {
						message = "Do you want to activate these Clients?";
					}
					showAlertMessage1("Message", "<br/>" + message, "question",
							doNothing1);
					$('.ZebraDialog_Button1').attr('href','javascript:activateOpportunityTrue()');
					$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
//			 		$('.ZebraDialog_Question').css('background-size', '149px');
//			 		$('.ZebraDialog_Question').css('background-position-x', '5px');
//			 		$('.ZebraDialog_Question').css('background-position-y', '2px');
//			 		$('.ZebraDialog_Question').css('background-position', '5px 2px');
				}
			}

			function activateOpportunityTrue() {
				var message = "";
				if (list.length == 1) {
					message = "Client successfully Activated.";
				} else {
					message = list.length + "Clients successfully Activated.";
				}
				setTimeout(function() {
					$('#partyIds').val(list);
					$.ajax({
						type : 'POST',
						url : $('#contextPath').val()+"/opportunity/redirectDcActivation.htm",
						data : $('#bulkActivateForm').serialize(),
						success : function(result) {
							//alert(result);
							var recordCount=result[0];
							var isExistAnyUser=result[1];
							var isAlreadyActivated=result[2];
							if(recordCount>0){
//			 					localStorage.setItem('actionName',
//			 							window.location.pathname);
								showAlertMessage1("Success",
										"<br/>"+" DC activated. ",
										"confirmation", reloadPage);
								
							}else if(isAlreadyActivated==1){
								showAlertMessage1("Error",
										"<br/>"+" DC already activated for one or more Client from the list. ",
										"error", doNothing);
							}else if(isExistAnyUser==1){
								showAlertMessage1("Error",
										"<br/>"+" Username already exist for one or more Client from the list. Please change EmailId and then try again.",
										"error", doNothing);
							}
							
						}
					});
					
				}, 500);
				
			}

			function openEt(partyId){
				$('#partyIdToSend').val(partyId);	 
				$('#getApDataForm').attr('action',$('#contextPath').val()+"/et/getApDetails.htm");
				$('#getApDataForm').submit();	
			} 


			function reloadPage(){
				location.reload();
			}

			function preConvertClientPopup(partyId,contactTypeID){
				var currentContactType='';
				$('#convertToContactType').empty();
				$('#convertToContactType').append('<option value="0">--Select--</option>');
				$(contactTypeList).each(function(i,obj) {
					var codeTypeId=obj.codeTypeId;
					var codeValue=obj.codeValue;
					var codevalueId=obj.codeValueId;
					if(codeTypeId==15 && codevalueId>contactTypeID){
						$('#convertToContactType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
					}
				});
				if(contactTypeID==15003){
					currentContactType='Client';
				}else{
					currentContactType='Premium Client';
				}
				
				openConvertClientPopup(currentContactType,partyId)
			}
			function sendEmail(partyId,name,email){
				$('#partyIdForNotification').val(partyId);
				$('#nameForNotification').val(name);
				$('#notifyToForNotification').val(email)
				$('#notifyType').val('email')
				$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
				$('#sendNotificationForm').submit();
			}

			function sendSMS(partyId,name,phone){
				$('#partyIdForNotification').val(partyId);
				$('#nameForNotification').val(name);
				$('#notifyToForNotification').val(phone);
				$('#notifyType').val('sms')
				$('#sendNotificationForm').attr('action','${pageContext.request.contextPath}/sendnotification.htm');
				$('#sendNotificationForm').submit();
			
			
			}
			
		</script>
		
	<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
</form>
<%-- <jsp:include page="../common/footer.jsp" /> --%>
<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>

<form id="bulkActivateForm"> 
		<input type="hidden" id="partyIds" name="partyIds">
		<input type="hidden" id="roleId" name="roleId" value="15">
</form>
	
<form method="post" id="getApDataForm" name="getApDataForm"> 
		<input type="hidden" id="partyIdToSend" name="partyId">		
</form>	
<form id="sendNotificationForm" name="sendNotificationForm" method="post"> 
		<input type="hidden" id="partyIdForNotification" name="partyId">	
		<input type="hidden" id="nameForNotification" name="name">		
		<input type="hidden" id="notifyTargetForNotification" name="notifyTarget" value="Client">	
		<input type="hidden" id="notifyToForNotification" name="notifyTo">
		<input type="hidden" id="notifyType" name="notifyType">		
			
	</form>
	
		<div style="display: none;" id="blanket"></div>
		<div style="display: none; width:644px; height:370px; overflow:auto;" id="popUpConvertClient" class="popUpQuery" >
		<div class="close" style="margin-right:10px; margin-bottom:30px;"><a onClick="cloeseConvertClientPopup()" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
		<!-- -->
		<div class="row"><br><br>
		 <div class="list-group" id="changePasswordDetailsDiv" >
		 <a class="list-group-item active">Convert Opportunity</a>
		 <form id="convertClientForm">
					 <table class="table table-striped" cellpadding="5" cellspacing="5"  style="width: 98%;margin-left: 10px;margin-top: 10px;">
		                	<tr>
		                    	<td width="32%" style="border-top: none !important;">Current Contact Type</td>
		               	      <td width="68%" style="border-top: none !important;"><span id="currentContactType"></span></td>
		                </tr>
		                <tr>
		                    	<td width="32%" style="border-top: none !important;">Convert to Contact Type <span class="red">*</span></td>
		               	  		<td width="68%" style="border-top: none !important;"><select id="convertToContactType" name="convertToContactType" class="form-control" validate="select" emsg="Convert to Contact Type"/></td>
		                </tr>
		                 <tr>
		                    	<td width="32%" style="border-top: none !important;">Convert Note <span class="red">*</span></td>
		               	  		<td width="68%" style="border-top: none !important;"><textarea style="height: 100px;" class="form-control"  id="convertNote" validate="1" emsg="Convert Note" name="convertNote"></textarea></td>
		                </tr>
		                 <tr>
		                      <td colspan="2" align="right" style="border-top: none !important;"> <input id="cancel" class="btn dbtn" type="button" value="Update" name="change_password_div" onclick="convertContact('convertClientForm','Contact')">  <input id="save" class="btn dbtn" type="button" value="Cancel" name="change_password_div" onClick="cloeseConvertClientPopup()" ></td>
		                    </tr>
		              </table>
		              <input type="hidden" id="contactPartyId" name="partyId">
		              <input type="hidden" id="sectionName" name="sectionName" value="Client">
		              
		   </form>
			</div>
		       </div>
		</div>
	
</body>
</html>

</html>