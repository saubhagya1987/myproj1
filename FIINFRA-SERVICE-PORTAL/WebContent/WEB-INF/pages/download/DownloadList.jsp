<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
	<title>Download - List</title>
</head>


<body>
	<jsp:include page="../common/header.jsp" />
		<input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />

<!--css popup window start 1-->
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width: 450px; height: 380px; top: 100px" id="popUpDiv">
		<div id="popupwrapper_contactform">
			<div class="heading_contactform">
				<h3>Log Trouble Ticket</h3>
			</div>
			<div id="poptable_contactform">

				<div class="full">
					<input type="text" class="form-control" placeholder="Subject">
				</div>
				<div class="full">
					<textarea class="form-control" rows="3" placeholder="Your Question"
						style="height: 100px;"></textarea>
				</div>
				<div class="full">
					<input type="text" class="form-control" placeholder="Attach File">

				</div>
			</div>
			<div class="topbuttonholder">
				<form>
					<input class="dbtn" value="Send Email" id="loginButton"
						type="button"> <input class="dbtn" value="Cancel"
						onClick="popup('popUpDiv')" id="loginButton" type="button">
				</form>
			</div>

		</div>
	</div>
<!--css popup window 1 close-->

<!--css popup window start 2-->


<!-- --------------------Add DownLoad----------------------------- -->





	<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Add Download</h4>
				</div>
				
				<div id="success-msg"></div>
				<div id="form-box">
					<form id="myForm" method="post" class="form-horizontal"
						action="<%=request.getContextPath()%>/download/addNewDownload.htm"
						enctype="multipart/form-data">
						<input type="hidden" name="confirmdelete" id="confirmdelete"
							value=""> <input type="hidden" id="hiddenPartyId"
							name="hiddenPartyIdName" value="" /> <input type="hidden"
							id="hdnDownloadSectionId" name="hdnDownloadSectionName" value="" />
						<input type="hidden" id="hiddenIsToClose" name="hiddenIsToClose"
							value="<%=request.getAttribute("hiddenIsToClosee")%>" />

						<div class="modal-body">


							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Biz Unit ">Biz Unit <span class="red">*</span></label>
									<div class="col-sm-9">





										<!-- <span  class="searchpadding padding_top" style="float:left; width:150px;">Biz Unit <span class="red">*</span> </span> -->

										<select name="bizUnitName" class="form-control" id="bizUnitId">

										</select>


									</div>
								</div>
							</div>



							<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Download Section ">Download Section <span
									class="red">*</span></label>
								<div class="col-sm-9">


									<!-- <span class="searchpadding padding_top" style="float:left; width:150px;">Download Section  <span class="red">*</span> </span> -->
									
										<select name="downloadSectionName" class="form-control"id="downloadSectionId"></select>
									
								</div>
							</div>
						</div>
						<!-- <div class="clearfix"></div> -->

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Document Name">Document Name <span class="red">*</span></label>
								<div class="col-sm-9">
									 <input type="text"
										class="form-control" id="documentNameId" name="documentName"
										maxlength="255">
									
								</div>
							</div>
						</div>



						<!-- <div class="clearfix"></div> -->
						<!-- <input type="hidden" id="broadDesphidden" name="descriptionNote"> -->
						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Description Note">Description Note <span
									class="red">*</span></label>
								<div class="col-sm-9">
									<!-- <div class="wysiwyg-editor" id="descriptionNoteId"  name="descriptionNote"></div> -->
									
										 <textarea	class="form-control" rows="5" id="descriptionNoteId"
											name="descriptionNote"  maxlength="400"></textarea>



								</div>
							</div>
						</div>
						<!--  <div class="clearfix"></div> -->



						<!-- --------------upload file--------------------- -->

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Upload File">Upload File <span class="red">*</span></label>
								<div class="col-sm-9">


									<!-- <span class="searchpadding padding_top" style="float:left; width:150px;">Upload File <span class="red">*</span> </span> -->
									<span class="searchpadding padding_top"
										style="float: left; width: 300px;"> <input type="file"
										id="fileid" name="file"
										style="height: 0px; width: 0px; overflow: hidden;" /> <input
										type="text" id="ftxtid" class="form-control"> <span
										class="user" id="ftype"></span></span> <span
										style="float: left; margin-top: 7px; width: 100px;"> <input
										class="dbtn" value="Browse" id="fbtnid" type="button"
										onclick="getFile();"></span>

								</div>
							</div>
						</div>



						<!-- ---------------upload file------------------- -->


						<!--  <div class="clearfix"></div> -->
						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Sharing Options">Sharing Options <span class="red">*</span></label>
								<div class="col-sm-9">
								
									<span class="searchpadding padding_top "
										style="float: left; width: 400px;"> <input id="viewId"
										name="viewName" type="checkbox"><span class="user">View</span>
										<input id="downloadId" name="downloadName" type="checkbox"><span
										class="user">Download</span> <input id="emailId"
										name="emailName" type="checkbox"><span class="user">Email</span>
									</span>


								</div>
							</div>
						</div>
						<!-- <div class="clearfix"></div> -->

						<!-- <div class="clearfix"></div> -->
						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Portal Options">Portal Options <span class="red">*</span></label>
								<div class="col-sm-9">



									<!-- <span class="searchpadding padding_top" style="float:left; width:150px;">Portal Options   <span class="red">*</span> </span> -->
									<span class="searchpadding padding_top "
										style="float: left; width: 400px;"> <input
										id="serviceId" name="serviceName" type="checkbox"><span
										class="user">Service Portal</span> <input id="partnerId"
										name="partnerName" type="checkbox"><span class="user">Partner
											Portal</span> <input id="clientId" name="clientName" type="checkbox"><span
										class="user">Client Portal</span>
									</span>

								</div>
							</div>
						</div>
						<!-- <div class="clearfix"></div> -->

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Portal Options">Expires On <span class="red">*</span></label>
								<div class="col-sm-9">



									<!-- <span class="searchpadding padding_top" style="float:left; width:150px;">Expires On<span class="red">*</span> </span> -->
									<!-- <input name="address" type="text" id="dateId" class="datepicker"> -->
										<input type='text' id='datepickerId' name="datepickerName"/> <!--<input type="text" id="datepickerId" maxlength="20">-->

										<!-- <i class="calendaricon"></i> -->

								</div>
							</div>
						</div>
						

						<div class="topbuttonholder">
							<div style="float: right;">
								
								<button data-bb-handler="confirm" type="button"
									class="btn btn-primary btn-sm" id="saveNdNewId"
									onclick="submitAddDownload(0);">Save & New</button>
								<button data-bb-handler="confirm" type="button"
									class="btn btn-primary btn-sm" id="Save & Close"
									onclick="submitAddDownload(1);">Save & Close</button>
								<button data-bb-handler="cancel" type="button" 	class="btn btn-sm btn-danger" type="button"  onclick="refresh()"  data-dismiss="modal" aria-label="Close"> 
									<i class="ace-icon fa fa-close"></i> Cancel </button>



							</div>
							<div class="clearfix"></div>
						</div>
					
				</div></form>
			</div>
		</div></div>
	</div>


	<!-- --------------------Add DownLoad----------------------------- -->
    <!-- delete-->
   <!--  <div id="deletenote"> -->
   
   <div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
       		<div class="modal-content">
        		<div class="modal-header">
            		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            		<h4 class="modal-title" id="myModalLabel">Message</h4> 
   					Do you want to delete this Document ? Please confirm.
   					<div class="clearfix"></div>
   					<div class="space"></div>
   					
     				<div style="float: right;">
      				<form>
                    	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDelete();"><i class="ace-icon fa fa-check"></i> Yes</button>
        				<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> No</button>
     	 			</form>
     				</div>
     				<div class="clearfix"></div>
    			</div>
   			</div>
  		</div>
 	</div>
   
   
		
    <!----------------------- Edit  Download--------------------------------------------------->
    
    
    <!-- <div id="editnote"> -->
	<div class="modal fade" id="editnote" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="success-msg"></div>
				<div id="form-box">
					<form id="myFormEdit" method="post"
						action="<%=request.getContextPath()%>/download/editDocument.htm"
						enctype="multipart/form-data">
						<div class="modal-header">
						<input type="hidden" id="hdndocumentId" name="hdndocumentIdNm">
						<input type="hidden" id="hdnsizekbId" name="hdnsizekbNm">
						<input type="hidden" id="hdnbasepathId" name="hdnbasepathNm">
						<input type="hidden" id="hiddenEditIsToClose"
							name="hiddenEditIsToClose"
							value="<%=request.getAttribute("hiddenEditIsToClosee")%>" /> <input
							type="hidden" id="isToClose" name="isToClose"
							value="<%=request.getParameter("isToClose")%>" /> <input
							type="hidden" id="saveNnew" name="saveNnew" /> <input
							type="hidden" id="isToClosee" name="isToClosee"
							value="<%=request.getParameter("isToClosee")%>" />
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Edit Download</h4>
						
						
						
						
						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Portal Options">Biz Unit <span class="red">*</span></label>
								<div class="col-sm-9">
									<select name="editBizUnitName" class="form-control"
										id="editBizUnitId">

									</select>

								</div>
							</div>
						</div>


						<!--  <div class="clearfix"></div> -->
						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Portal Options">Download Section <span class="red">*</span></label>
								<div class="col-sm-9">
									<select name="editDownloadSectionName" class="form-contr"
										id="editDownloadSectionId">

									</select>

								</div>
							</div>
						</div>




						<!-- <div class="clearfix"></div> -->
						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Portal Options">Document Name <span class="red">*</span></label>
								<div class="col-sm-9">



									<!-- <span class="searchpadding padding_top" style="float:left; width:150px;"><span id="editDocumentNametxtId" >Document Name </span> <span class="red">*</span> </span> -->

									<input type="text" class="form-control" id="editDocumentNameId"
										name="editDocumentNametxtName" maxlength="255">

								</div>
							</div>
						</div>



						<!--  <div class="clearfix"></div> -->


						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Portal Options">Description Note <span class="red">*</span></label>
								<div class="col-sm-9">

									<!-- <div class="wysiwyg-editor" id="editDescriptionNoteId"></div> -->

									<!-- <span class="searchpadding padding_top" style="float:left; width:150px;"><span id="editDescriptionNotetxtId">Description Note</span>   <span class="red">*</span> </span> -->

									<textarea class="form-control" rows="5" id="editDescriptionNoteId" name="editDescriptionNote" maxlength="400"></textarea>


								</div>
							</div>
						</div>



						<!--  <div class="clearfix"></div> -->

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Portal Options">Upload File <span class="red">*</span></label>
								<div class="col-sm-9">




									<!-- <span class="searchpadding padding_top" style="float:left; width:150px;">Upload File <span class="red">*</span> </span> -->
									<div class="col-sm-6">
										<input type="file" id="editfileid" name="editfile"
											style="height: 0px; width: 0px; overflow: hidden;" /> <input
											type="text" id="editftxtid" name="editftxtid"
											class="form-control"> <span class="user"
											id="editftype"></span>
									</div>
									<div class="col-sm-3">
										<input class="dbtn" value="Browse" id="editfbtnid"
											type="button" onclick="getEditFile();">
									</div>

								</div>
							</div>
						</div>

						<!-- <div class="clearfix"></div> -->

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Portal Options">Sharing Options <span class="red">*</span></label>
								<div class="col-sm-9">


									<!-- <span class="searchpadding padding_top" style="float:left; width:150px;">Sharing Options   <span class="red">*</span> </span> -->
									<span class="searchpadding padding_top "
										style="float: left; width: 400px;"> <input
										id="editViewId" name="editViewName" type="checkbox"> <span
										class="user">View</span> <input id="editDownloadId"
										name="editEmailName" type="checkbox"><span
										class="user">Download</span> <input id="editEmailId"
										name="editDownloadName" type="checkbox"><span
										class="user">Email</span>
									</span>


								</div>
							</div>
						</div>

						

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Portal Options">Portal Options <span class="red">*</span></label>
								<div class="col-sm-9">



									<!--  <span class="searchpadding padding_top" style="float:left; width:150px;">Portal Options   <span class="red">*</span> </span> -->
									<span class="searchpadding padding_top "
										style="float: left; width: 400px;"> <input
										id="editserviceId" name="editserviceName" type="checkbox"><span
										class="user">Service Portal</span> <input id="editpartnerId"
										name="editpartnerName" type="checkbox"><span
										class="user">Partner Portal</span> <input id="editclientId"
										name="editclientName" type="checkbox"><span
										class="user">Client Portal</span>
									</span>

								</div>
							</div>
						</div>
						<!-- <div class="clearfix"></div> -->

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Portal Options">Expires On <span class="red">*</span></label>
								<div class="col-sm-9">


									<!--  <span class="searchpadding padding_top" style="float:left; width:150px;">Expires On<span class="red">*</span> </span> -->
									<span class="searchpadding padding_top "
										style="float: left; width: 400px;"> <input type="text"
										id="editdatepickerId" name="editDatepickerName"
										class="datepicker" maxlength="20"> <!--  <i class="calendaricon"></i> --></span>

								</div>
							</div>
						</div>




						<div style="float: right">

							<button data-bb-handler="confirm" type="button"
								class="btn btn-primary btn-sm" id="Save"
								onclick="submitEditDownload(1);">Save</button>
							<button data-bb-handler="cancel" type="button"
								class="btn btn-sm btn-danger" type="button" class="close"
								data-dismiss="modal" aria-label="Close">
								<i class="ace-icon fa fa-close"></i> Cancel
							</button>
						</div>
						
						<div class="clearfix"></div>
					
				</div></form>
			</div>
		</div>
	</div></div>




	<!-- end edit downLoad-->

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

       </div>
 </div>
      
  
   
<!--Nav Menu End--> 
<!--breadcrum Menu Start--> 


 <!-- Center part start -->

    	<div class="container-head">
    	  <div class="col-md-12" style="text-align: right;"> 
             <!-- accordion start-->
           
           	  <div class="accordion pull-left col-md-12" id="accordFundSel">
                <div class="accordion-group">
                
      
          <div class="page-header clearfix">
            <h1 class="pull-left">Download List</h1>
            <div class="nav-search pull-right" id="">
              <form class="form-search">
                
              </form>
          </div>  
                
                
     
                  <!-- accordion-body END -->
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

</ul>
	
<div class="topmenu" style="float:right">
<a id="SPAddNewDownloadLink" href="#" onClick="addNote();" ><input data-params="{}" type="button" class="btn btn-sm btn-primary" value="  New Download" title="New Download"  alt="New Download"></a>


 <a id="SPDeleteDownloadLink" href="#" onClick="">
						<input data-params="{}" type="button" class="btn btn-sm btn-danger"
						value="  Delete" onClick="deleteDownloadItems();" title="Delete"
						alt="Delete" />
					</a>
<!-- <input type="hidden" name="confirmdelete" id="confirmdelete"> -->
</div>

		<div class="table-responsive" id="display_table_lead" style="border:none;">
		  <div id="toreload">
		  
		<table id="grid-table"></table>
		<div id="grid-pager"></div>
		  
        <!-- Center-->    
     </div> 
     </div> 
     
    <div class="col-sm-7" >


<div class="topmenuleft" ><br/>
 
  <ul>
  	 <span> Export options:</span>
  	
  	<a href="<%=request.getContextPath()%>/download/downloadCSV.htm" title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-120"></i></a>
	<a href="<%=request.getContextPath()%>/download/downloadExecl.htm"title="Export in Excel" alt="Export in Excel" ><i class="fa fa-file-excel-o bigger-120"></i></a>
  	
<!-- <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li> -->
  </ul>
 
  
 
 </div>
</div>
<div class="topmenu" style="float:right"><br/>
	<a id="SPAddNewDownloadLink" href="#" onClick="addNote();" ><input data-params="{}" type="button" class="btn btn-sm btn-primary" value="  New Download" title="New Download"    alt="New Download"></a>
	<a id="SPDeleteDownloadLink" href="#" onClick="">
						<input data-params="{}" type="button" class="btn btn-sm btn-danger"
						value="  Delete" onClick="deleteDownloadItems();" title="Delete"
						alt="Delete" />
					</a>
	<!-- <input type="hidden" name="confirmdelete" id="confirmdelete"> -->
</div>	



     </div>
     
     </div>    
 
    
            	
</section>           	
<!-- Center part End --> 
         
<footer>
  <jsp:include page="../common/footer.jsp" />
 </footer>

	
	
	
	
<script>

//alert("hieeeeeee");
var grid_data=${downloadList};
//index=grid_data;
//console.log('grid_data:---'+grid_data);
index=grid_data;


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
	
    
    $('#addnote').on('hide.bs.modal', function (e) {
  //if (!data) return e.preventDefault() // stops modal from being shown
 			 refresh();
		})
		$('#editnote').on('hide.bs.modal', function (e) {
  //if (!data) return e.preventDefault() // stops modal from being shown
 			 refresh();
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
		//width:600,
		//colNames:['Biz Unit'],
		colNames:[' ',' ','Biz Unit','Download Section','Document Name [Type]','File Name','Share Options','Source System','Listing Expires On'],
		//colNames:['Section ',' ','Section1','Broadcast Title','Start/Expiry Datetime','Show Popup on Login','Update on','Source System'],
		 colModel:[
			 /*  {name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
				formatter:function(cellvalue, options,rowObject) {
				    return '<a onclick="openActionPopup(rowObject.popUpAlertaddnote)"></a>'}, 
				formatoptions:{ 
				keys:true,
				//delbutton: false,//disable delete button

				delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
				editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
				}
			},   
 */			//{name:'notifyTemplateID', index:'editLink',formatter:imageFormat,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/addPing.htm?notifyTemplateId='}},
			
			/*  {formatter:function(cellvalue, options,rowObject) {
			    return '<a onclick="openActionPopup(rowObject.popUpAlertaddnote)"></a>';
			}}, 
			 */
			 
			
			 {name:'myac',index:' ', width:50, fixed:true, sortable:false, resize:true,
			     formatter: function(cellvalue, options,rowObject) {
			    	 return '<a href="#" onclick="editNote();sendToEditDownload('+rowObject.documentId+',\''+rowObject.downloadModuleID+'\',\''+rowObject.party+'\',\''+rowObject.listingExpiresOn+'\',\''+rowObject.bizUnit+'\',\''+rowObject.downloadModuleName+'\',\''+rowObject.downloadModuleID+'\',\''+rowObject.documentName+'\',\''+rowObject.fileName+'\',\''+rowObject.isShareView+'\',\''+rowObject.isShareDownload+'\',\''+rowObject.isShareEmail+'\',\''+rowObject.downloadDescription+'\',\''+rowObject.fileSizeKB+'\',\''+rowObject.fileStoragePathURI+'\',\''+rowObject.sourceSystemid+'\');" id="SPEditDownloadLink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
			                
			<%-- {name : 'myac',index :'',width : 60, fixed : true, sortable : false, resize : false,
			formatter:function(cellvalue, options,rowObject) {
		    	return '<a href="#" onclick="editNote();sendToEditBroadcast('+rowObject.id+',\''+rowObject.sectionName+'\',\''+rowObject.broadCastSectionId+'\',\''+rowObject.broadCastTitle+'\',\''+rowObject.startDate+'\',\''+rowObject.expiryDate+'\',\''+rowObject.buPartyId+'\',\''+rowObject.loginPopUpDisplay+'\',\''+rowObject.roleID+'\',\''+rowObject.cityId+'\',\''+rowObject.partyRecordTypeId+'\',\''+rowObject.sourceIdList+'\');" id="SPEditBroadCastLink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>'; --%>
		    	                                                            
			}},
			
			
			{
				name : 'checkbox',
				width : 60,
				index : 'checkbox',
				sortable : false,
				formatter : function(cellvalue,
						options, rowObject) {
					return '<input role="checkbox" type="checkbox"  class="checkbox1" id="chkdeleteselect" value="'+rowObject.documentId+'" name="chkdeleteselect[]">';
				}
			},
			
			
			 
			 
			/*  {name:'checkbox', width:50, index:'checkbox',sortable:false,formatter:function(cellvalue, options,rowObject) {
			    return '<input role="checkbox" type="checkbox"  class="checkbox1" id="'+rowObject.chkdeleteselect+'" name="chkdeleteselect[]">';
			}},  
			 */
			
			
			//{name:'notifyTemplateID', index:'editLink',formatter:imageFormat,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/popUpAlertaddnote?notifyTemplateId='}},
			{name:'bizUnit',index:'bizUnit'},
			{name:'downloadModuleName',index:'downloadModuleName'},
			{name:'documentName',index:'documentName'},
			{name:'fileName',index:'fileName',width:400},
			
			//{name:'startDate',index:'startDate'},
			
			 {width:180,formatter:function(cellvalue, options,rowObject) {
			   // return '<input role="checkbox" type="checkbox"  class="checkbox1" id="'+rowObject.startDate+',\''+rowObject.expiryDate+'" name="chkdeleteselect[]">';
				var html='';
						    if(rowObject.isShareView==true){
						    	html+= '<input checked edit:false role="checkbox" type="checkbox"  class="checkbox1" id="1" name="1" disabled><span class="user">View</span><br/>';
						    }else{
						    	html+= '<input role="checkbox" edit:false type="checkbox"  class="checkbox1" id="1" name="1" disabled><span class="user">View</span><br/>';
						    }
						    if(rowObject.isShareDownload==true){
						    	html+= '<input checked edit:false role="checkbox" type="checkbox"  class="checkbox1" id="1" name="1" disabled><span class="user">Download</span><br/>';
						    }else{
						    	html+= '<input role="checkbox"   edit:false type="checkbox"  class="checkbox1" id="1" name="1" disabled><span class="user">Download</span><br/>';
						    }
						    if(rowObject.isShareEmail==true){
						    	html+= '<input checked edit:false role="checkbox" type="checkbox"  class="checkbox1" id="1" name="1" disabled><span class="user">Email</span>';
						    }else{
						    	html+= '<input role="checkbox" edit:false type="checkbox"  class="checkbox1" id="1" name="1" disabled><span class="user">Email</span>';
						    }
						    return html;
			 }},  
			//{name:'listingExpiresOn',index:'listingExpiresOn'}
			
			
			{width:180,formatter:function(cellvalue, options,rowObject) {
				var i=0;
				var string = "";
				
				var str =rowObject.sourceSystemid;
	        	var arr = str.split(",");
	        	var i;
	        	var a=new Array();
	        	for(i=0;i<arr.length;i++)
	        	{
	        	    a[i]=arr[i];
	        	  
					if (a[i]==31001) {
					if(string != ""){
					 string=string.concat("\nPartner Portal");
					}else{
						string= string.concat( "Partner Portal");
					}
			    }
				if(a[i]==31003){
					if(string != ""){
						string= string.concat( "\nService Portal");
						
					}else{
						string= string.concat( "Service Portal");
						
					}
					 
				}
				if(a[i]==31004){
					if(string != ""){
						string= string.concat( "\nClient Portal");
						
						}else{
							string=	 string.concat("Client Portal");
							
						}
				
				}
				}
				
				return string;
			    //return '<a onclick="openActionPopup('+rowObject.loginPopUpDisplay+'\')"></a>';
			}} ,
			
			{name:'listingExpiresOn',index:'listingExpiresOn'},
			 
			
			/*{name:'action',index:'action',formatter:function(cellvalue, options,rowObject) {
			    return '<a onclick="openActionPopup('+rowObject.notifyTemplateID+',\''+rowObject.pingOwner+'\',\''+rowObject.active+'\',\''+rowObject.name+'\',\''+rowObject.favouriteTemplate+'\')">Action</a>';
			}}, */
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
        shrinkToFit:false,	



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

function openActionPopup(notifyTemplateID,pingOwner,active,name,favouriteTemplate){
	//alert(notifyTemplateID);
	$('#notifyTemplateIdHidden').val(notifyTemplateID);
	$('#notifyTemplateNameHidden').val(name);
	if(pingOwner=='Partner'){
		if(active=='true'){
			$('#suspendrow').removeClass('hide');
			$('#reactivaterow').attr('class','hide');
		}else{
			$('#reactivaterow').removeClass('hide');
			$('#suspendrow').attr('class','hide');
		}
	}
	$('#ScheduleRow').removeClass('hide');
	$('#DeliveryHistoryRow').removeClass('hide');
	$('#CloneRow').removeClass('hide');
	$('#ScheduleLink a').attr('href','${pageContext.request.contextPath}/addNewSchedulePing.htm?notifyTemplateID_P='+notifyTemplateID);
	$('#DeliveryHistoryLink a').attr('href','${pageContext.request.contextPath}/ping/getDelivaryHistory.htm?notifyTemplateId='+notifyTemplateID);
	if(favouriteTemplate!=1){
		$('#MarkasFavouriteRow').removeClass('hide');
		$('#UnMarkasFavouriteRow').attr('class','hide');
	}else{
		$('#UnMarkasFavouriteRow').removeClass('hide');
		$('#MarkasFavouriteRow').attr('class','hide');
	}
	$( ".action_dialog" ).removeClass('hide').dialog({
		resizable: false,
		modal: true,
        width: "auto",
	});
}
























 /* var $1=$.noConflict();  */

 function pagesizeurl(){
  var pageSize=$('#page').val(); 
   window.location.href= $('#contextPath').val()+'/download/loaddownloadlist.htm?pageSize='+pageSize;
 }
 
 
 
function addNote(){

	
	$("#deletenote, #editnote").hide();	
	$('#addnote').modal('show');
	
	/* $("#addnote").show();	
	$("#deletenote, #editnote").hide();
	$("#tags").hide();
	$("#popUpAlertaddnote").css('height', '560px');
	$("#popUpAlertaddnote").css('width', '650px'); */
	
	
	//$("#popUp Alertaddnote").css ('left','425px');
	//$("#popUpAlertaddnote").css ('top','100px');
	if($('#isToClose').val()=="0")
		{
		
		var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
		$('#popUpAlertaddnote').css('top',height+50);
		var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
		$('#popUpAlertaddnote').css('margin-left', width/3);
		}else{
			var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
			$('#popUpAlertaddnote').css('top',height+50);
			var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
			$('#popUpAlertaddnote').css('margin-left', width/3);
		}
}

function deleteNote(){
	
	

	$(" #editnote,#addnote").hide();	
	$('#deletenote').modal('show'); 	

/* 	$("#deletenote").show();	
	$("#addnote, #editnote").hide();	
// 	$("#popUpAlertaddnote").css ('left','425px');
// 	$("#popUpAlertaddnote").css ('top','200px');
	$("#popUpAlertaddnote").css('height', '370px');
	var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
	$('#popUpAlertaddnote').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2); */
	}

function editNote(){
	
	$("#deletenote,#addnote").hide();	
	$('#editnote').modal('show'); 
}
	/* $("#editnote").show();	
	$("#addnote, #deletenote").hide();
// 	$("#popUpAlertaddnote").css ('left','425px');
// 	$("#popUpAlertaddnote").css ('top','100px');
	$("#popUpAlertaddnote").css('height', '560px')
	$("#popUpAlertaddnote").css('width', '650px')
	var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
	$('#popUpAlertaddnote').css('top',height+50);
	var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
	$('#popUpAlertaddnote').css('margin-left', width/3);
 */



function addDownloadSection(action,ids)
{
	 //alert(action);
	   	$.ajax(
	   			{ 				
	   		  type: "POST",
	   		url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=24',
	   		 dataType: 'json',
			  contentType: 'application/json',
				   		  success:function(result)
	   		  { 
				   			 if(action=='edit')
				   			 {
						        	var id = '#editDownloadSectionId';
						        	$('#editDownloadSectionId').empty();
						        }else{
						        	
						        	var id = '#downloadSectionId';
						       	 $('#downloadSectionId').empty();
						       	 $('#downloadSectionId').append('<option value="0">--Select--</option>');
						        	//$('#downloadSectionId').empty();
						        }
				   			// alert(id);
				   		//	 alert(ids);
						      $(result).each(function(i, obj) {
						          var module=obj.codeValue;
							        var modulename=obj.codeValueId;
								    if(ids == modulename)
								    {
							      		$(id).append('<option value="'+ modulename+'" selected="selected">'+ module + '</option>');
							      	} else{
							      		$(id).append('<option value="'+ modulename+'">'+ module + '</option>');	
							      	}
								 //  $('#common_popup_div,#shadow_div_web_app').remove();
								   });
				   			 
							//	$('#').empty();
							//	 $('#').empty();						
									
					
						
	   		  }
	   	
	   	});
	  
	   
}


 function addNewDownload(action,ids)
 {	
	//alert(action);
	// alert(ids);
 			 				
 	   	$.ajax(
 	   			{
 	   					///download/getPartyByPartyId.htm   				
 	   		  type: "POST",
 	   		  url: $('#contextPath').val()+'/download/getPartyByPartyId.htm',	
 	   		 dataType: 'json',
 			  contentType: 'application/json',
 				   		  success:function(result)
 	   		  { 
 				   			
 				   			 if(action=='edit')
 				   			 {
 						        	var id = '#editBizUnitId';
 						        	$('#editBizUnitId').empty();
 						        }else{
 						        	
 						        	var id = '#bizUnitId';
 						        	$('#bizUnitId').empty();
 						        	 $('#bizUnitId').append('<option value="0">--Select--</option>');
 						        }
 				   			//alert("hieee");
 				   			  
 				   			//$('#bupartyname').empty();
 				   			
 				   		  //$('#partyname').empty();
 										$(result).each(function(i, obj) {
 								
 											var bupartyid=obj.buId;
 									
 											var bupartyname=obj.lastname; 
 											
 											//alert(bupartyid);
 											// alert(bupartyname);
 										    if(ids == bupartyid)
 										    {
 									      		$(id).append('<option value="'+ bupartyid+'" selected="selected">'+ bupartyname + '</option>');
 									      	} else{
 									      		$(id).append('<option value="'+ bupartyid+'">'+ bupartyname + '</option>');	
 									      	}
 										///	$('#bupartyname').append('<option value="'+bupartyid+'">'+ bupartyname + '</option>');
 										//	$('#').append('<option value="'+bupartyid+'">'+ bupartyname + '</option>');
 									
 											
 											
 											

 							});
 	   		  }
 	   	
 	   	});
 	   

 	   
 	   
 	   
 	   
 }


function submitAddDownload(isToClose){
	/* document.getElementById("broadDesphidden").value = $('#descriptionNoteId').html(); */


	$('#hiddenIsToClose').val(isToClose);
	 	if(addDownloadRequiredValidation() == true){
 		
		var form = document.getElementById('myForm');
		form.submit();
			resetval();
		
		
	 } 
 	
  }
function resetval()
{
	
	    $('#documentNameId').val('');
		$('#descriptionNoteId').val('');
		$('#ftxtid').val('');
		$('#bizUnitId').empty();
      	 $('#downloadSectionId').empty();
		document.getElementById('viewId').checked=false;
		document.getElementById('downloadId').checked=false;
		document.getElementById('emailId').checked=false;
		
		
		document.getElementById('serviceId').checked=false;
		document.getElementById('partnerId').checked=false;
		document.getElementById('clientId').checked=false;
		
		document.getElementById("ftype").innerHTML='';
		$('#fileid').val('');	
		
		$('#datepickerId').val('');
		
}

  
  
  function submitEditDownload(isToClose){
	  
	  var documentIdd = $('#hdndocumentId').val();
	  
	  var  fileName= $('#editftxtid').val();
	  
	  
	  $.ajax
		 ({
	              
	      type: "GET",
	      url: $('#contextPath').val()+"/download/getFileName.htm?hdndocumentIdd="+documentIdd+"&editftxtid="+fileName, 
	      dataType: 'json',
	      async : false,
	      contentType: 'application/json',
	         success:function(result)
	      { 
	        	/* alert("result  is::"+result); */
     
     				if(result==1)
				     {
     					/* showAlertMessage("Message", "<br/>Role Name Already Exist", "information"); */
     					alert("Role Name Already Exist");
				         $('#hdndocumentId').val('');
				         return true;
				        
				     }
	      }
	   
	   });
	  
	  
	  
	  
	  
	  
	  
	  
	  $('#hiddenEditIsToClose').val(isToClose);
	if(editDownloadRequiredValidation() == true){
		var formEdit = document.getElementById('myFormEdit');
		formEdit.submit();
	 }
  }

	
	  
	  
		 $(document).ready(function(){
			 if($('#isToClose').val()=="0"){
		
				
				 $('#success-msg').empty();	
				$('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>Record inserted successfully.</p></div>');
				document.getElementById("myForm").reset();
				addNote();
				
			 }
			 //alert("ssssss:::"+$('#hiddenIsToClose').val());
           if($('#isToClose').val()=="1"){
        	   $("#addnote").hide();
				 bootbox.dialog({
						message: "<span class='bigger-110'>Record inserted successfully</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-sm btn-primary",
								"callback": function() {
									 refresh();
									 document.getElementById("myForm").reset();	
								}
							}
						}
					});
        	   
           
				
			 }
           if($('#isToClosee').val()=="1"){
			bootbox.dialog({
				message: "<span class='bigger-110'>Record Updated successfully</span>",
				buttons: 			
				{
					"click" :
					{
						"label" : "OK!",
						"className" : "btn-sm btn-primary",
						"callback": function() {
							 refresh();
							 document.getElementById("myForm").reset();	
						}
					}
				}
			});
        	   
			 }
          
			
		});
	
  

 /* For file Type & size */
	var fSize;
	$(document).ready(function(){
	    $('#fbtnid').mouseleave(function(){
	    	var filename = $('#fileid').val().replace(/.*(\/|\\)/, '');
	    	var fType= filename.split(".");
	    	//alert("fType:"+fType[1]);
	    	fSize = document.getElementById('fileid').files[0].size/1024; //size in kb
	    	document.getElementById("ftype").innerHTML = "Type: "+fType[1]+", "+"Size: "+Math.floor(fSize)+"kb";
	    	
	    	
	    	 var url = document.getElementById("fileid").value;
	         var filename = url.replace(/^.*\\/, "");
	         document.getElementById("ftxtid").value= filename;
	         if(fSize>9765){
	        	/*  showAlertMessage("Message", "<br/>file size should not be greater than 9765 kb", "information"); */
	        	alert("file size should not be greater than 9765 kb");
	        	 $('#fileid').val('');
	        	 $('#ftxtid').val('');
	         }
	    	
	    });
	});


	var editfSize;
	$(document).ready(function(){
	    $('#editfbtnid').mouseleave(function(){
	    	var filename = $('#editfileid').val().replace(/.*(\/|\\)/, '');
	    	var fType= filename.split(".");
	    	//alert("fType:"+fType[1]);
	    	editfSize = document.getElementById('editfileid').files[0].size/1024; //size in kb
	    	document.getElementById("editftype").innerHTML = "Type: "+fType[1]+", "+"Size: "+Math.floor(editfSize)+"kb";
	    	 var url = document.getElementById("editfileid").value;
	         var filename = url.replace(/^.*\\/, "");
	         document.getElementById("editftxtid").value= filename;
	         if(editfSize>9765){
	        	 /* showAlertMessage("Message", "<br/>file size should not be greater than 9765 kb", "information"); */
	        	 alert("file size should not be greater than 9765 kb");
	        	 $('#editfileid').val('');
	        	 $('#editftxtid').val('');
	         }
	    	
	    });
	});
	
	
	/* For file Type & size */
	function getFile(){
	
        document.getElementById("fileid").click();
	
    }
	
	function getEditFile(){
		
        document.getElementById("editfileid").click();
	
    }
	
	
	

	
	
	function addDownloadRequiredValidation(){
		/* start add download */
		
		 if ($('#bizUnitId').val().trim()=="0" || $('#bizUnitId').val().trim()=="") {
			/*  showAlertMessage("Message", "<br/>Biz Unit is required.", "information"); */
	         return false;
	     } 
		
		 
		 if ($('#downloadSectionId').val()=="0" || $('#downloadSectionId').val()==null || $('#downloadSectionId').val().trim()=="") {
			// if ($('#downloadSectionId').val()==null) {
			/* showAlertMessage("Message", "<br/>Download Section is required.", "information"); */
			alert("Download Section is required.");
	         return false;
	     } 
		
		 if ($('#documentNameId').val().trim()=="") {
			/* showAlertMessage("Message", "<br/>Document name is required.", "information"); */
			alert("Document name is required");
			 return false;
	     } 
		 
		  if ($('#descriptionNoteId').val().trim()=="") {
			 /* showAlertMessage("Message", "<br/>Description note is required.", "information");*/ 
			 alert("Description note is required.");
	         return false;
	     }
		 
		 if ($('#fileid').val().trim()=="") {
			/*  showAlertMessage("Message", "<br/>Please select a file!", "information"); */
			alert("Please select a file!");
	         return false;
	     } 
		 
		 if ($('#datepickerId').val().trim()=="") {
			 /* showAlertMessage("Message", "<br/>Expires On field Should Not be Blank!", "information"); */
			 alert("Expires On field Should Not be Blank!");
	         return false;
	     } 
	
		 
		  var viewId = document.getElementById('viewId').checked;
		  var downloadId = document.getElementById('downloadId').checked;
		  var emailId = document.getElementById('emailId').checked;
		 if(viewId != true && downloadId  !=true && emailId !=true) {
			/*  showAlertMessage("Message", "<br/>Sharing Options minimum one field should be required!", "information"); */
			alert("Sharing Options minimum one field should be required!");
	         return false;
	         } 
		 
		 
		  var serviceId = document.getElementById('serviceId').checked;
		  var partnerId = document.getElementById('partnerId').checked;
		  var clientId = document.getElementById('clientId').checked;
		 if(serviceId != true && partnerId  !=true && clientId !=true) {
			 /* showAlertMessage("Message", "<br/>Portal Options minimum one field should be required!", "information"); */
			 alert("Portal Options minimum one field should be required!");
	         return false;
	         } 
		  return true;
		    /* end add download  */
		    //alert("Record inserted successfully");
	}
	
	
function editDownloadRequiredValidation()
{
	 /* start edit download */
	 	 
	  if ($('#editBizUnitId').val().trim()=="0" || $('#editBizUnitId').val().trim()=="") {
		  /* showAlertMessage("Message", "<br/>Biz Unit is required.", "information"); */
		  alert("Biz Unit is required.");
	         return false;
	     } 
	  
	  if ($('#editDownloadSectionId').val().trim()=="0" || $('#editDownloadSectionId').val().trim()=="") {
		  /* showAlertMessage("Message", "<br/>Download Section is required.", "information"); */
		  alert("Download Section is required.")
	         return false;
	     } 
	 
	 if ($('#editDocumentNameId').val().trim()=="") {
		 /* showAlertMessage("Message", "<br/>Document name is required.", "information"); */
		 alert("Document name is required.");
         return false;
     } 
	 
	 if ($('#editDescriptionNoteId').val().trim()=="") {
		 /* showAlertMessage("Message", "<br/>Description note is required.", "information"); */
		 alert("Description note is required.");
         return false;
     } 
	 
	  if ($('#editftxtid').val().trim()=="") {
		  /* showAlertMessage("Message", "<br/>Please select a file!", "information"); */
		  alert("Please select a file!");
         return false;
      }  
	 
	 if ($('#editdatepickerId').val().trim()=="") {
		 /* showAlertMessage("Message", "<br/>Expires On field Should Not be Blank!", "information"); */
		 alert("Expires On field Should Not be Blank!");
         return false;
     } 
	
	  var viewId = document.getElementById('editViewId').checked;
	  var downloadId = document.getElementById('editDownloadId').checked;
	  var emailId = document.getElementById('editEmailId').checked;
	 if(viewId != true && downloadId  !=true && emailId !=true) {
		 /* showAlertMessage("Message", "<br/>Sharing Options minimum one field should be required!", "information"); */
		 alert("Sharing Options minimum one field should be required!");
         return false;
         }
	 
	  var editserviceId = document.getElementById('editserviceId').checked;
	  var editpartnerId = document.getElementById('editpartnerId').checked;
	  var editclientId = document.getElementById('editclientId').checked;
	 if(editserviceId != true && editpartnerId  !=true && editclientId !=true) {
		 /* showAlertMessage("Message", "<br/>Portal Options minimum one field should be required!", "information"); */
		 alert("Portal Options minimum one field should be required!");
         return false;
         } 
	  return true;
         /* end edit download */
	   return true;
   }

    
 	$(document).ready(function() {
 		    $("#datepickerId").datepicker({
 		        showOn: 'button',
 		        minDate : '0',
 		        buttonText: 'Show date',
 		        buttonImageOnly: true,
 		       minDate : '0',
 		        buttonImage: 'http://jqueryui.com/resources/demos/datepicker/images/calendar.gif',
 		        dateFormat: 'dd/mm/yy',
 		        constrainInput: true,
 		       // minDate: 0
 		    });

 		    $(".ui-datepicker-trigger").mouseover(function() {
 		        $(this).css('cursor', 'pointer');
 		    });
 		});
 	
 	$(document).ready(function() {
		    $("#editdatepickerId").datepicker({
		        showOn: 'button',
		        buttonText: 'Show date',
		        buttonImageOnly: true,
		        buttonImage: 'http://jqueryui.com/resources/demos/datepicker/images/calendar.gif',
		        dateFormat: 'dd/mm/yy',
		        constrainInput: true,
		       minDate: 0
		    });


 $(".ui-datepicker-trigger").mouseover(function() {
		        $(this).css('cursor', 'pointer');
		    });
		}); 
	
 	/* start code to delete added download items  */
	
 	function deleteDownloadItems() {
			var selectedlvals = [];
			$('input:checkbox[id=chkdeleteselect]:checked').each(function() {
				selectedlvals.push($(this).val());
			});
		/* 	 var slvals = []
		 	  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
		 	  slvals.push($(this).val());
		 	  }) */
			
		 //alert('Selected Checkbox values are: ' + selectedlvals);
			if (selectedlvals == "") {
				alert('Please select at least one item to delete');
				return;
			}
			else{
				
				deleteNote();
			}
			document.getElementById("confirmdelete").value = selectedlvals;
			/* popup('popUpAlertaddnote'); */
		};



 		 function confirmDelete()
 		{
 			 var selectedlvals= document.getElementById("confirmdelete").value;
 			 //alert(selectedlvals);
 			   //alert('selectedlvals::'+selectedlvals);
 			   	  $.ajax({
 				   type : 'POST',
 				   url : $('#contextPath').val()+"/download/deleteDownloadList.htm?selectedlvalz="+selectedlvals,
 			
 					success : function(result) {
 						$("#deletenote").hide();
						 bootbox.dialog({
								message: "<span class='bigger-110'>Deleted Successfully</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											 location.reload();
											 document.getElementById("myForm").reset();	
										}
									}
								}
							});
 					}
 		      
 		   }); 
 		 }
 		 
function reload()
{
	location.reload();
}
 		 /* end code to delete added download items  */
	
	 function refresh(){
		 window.location.href = "<%=request.getContextPath()%>/download/loaddownloadlist.htm";
	 }
	 
      $('#documentNameId').blur(function(){
	    	   if ($('#documentNameId').val().match(/[^a-zA-Z0-9. ]/g)) {
	                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	             }
	        }); 
      
          $('#editDocumentNameId').blur(function(){
	    	   if ($('#editDocumentNameId').val().match(/[^a-zA-Z0-9. ]/g)) {
	                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	             }
	        }); 
          
           $('#descriptionNoteId').blur(function(){
	    	   if ($('#descriptionNoteId').val().match(/[^a-zA-Z0-9. ]/g)) {
	                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	             }
	        }); 
          $('#editDescriptionNoteId').blur(function(){
	    	   if ($('#editDescriptionNoteId').val().match(/[^a-zA-Z0-9. ]/g)) {
	                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
	             }
	        });  
          
	      function sendToEditDownload(documentId,ab,bizU,expireDate,bizUnit,downloadModuleName,downloadModuleID,documentName,fileName,isShareView,isShareDownload,isShareEmail,downloadDescription,fileSizeKB,fileStoragePathURI,sourceSystemid)
          {
        	  
        	  /* var description=$('#textarea'+documentId).html();
			console.log('description:-----'+description);
			$('#editDescriptionNoteId').html(description.replace(/&lt;/g, "<").replace(/&gt;/g, ">")); */
        	 	addNewDownload('edit',bizU);
        	  addDownloadSection('edit',ab);
        	
        	//document.getElementById("editfileid").value=fileName;
        	document.getElementById("editdatepickerId").value=expireDate;
        	//alert(expireDate);
        	document.getElementById("editDescriptionNoteId").value=downloadDescription;
        	//alert(downloadDescription);
      		document.getElementById("hdndocumentId").value=documentId;
      		document.getElementById("hdnsizekbId").value=fileSizeKB;
      		document.getElementById("hdnbasepathId").value=fileStoragePathURI;
      		document.getElementById("editDocumentNameId").value=documentName;
      		//alert(documentName);
      		
      		
      		
      		
      		document.getElementById("editftxtid").value=fileName;
      		//alert(fileName);
      		
	    	var fType= fileName.split(".");
	    	
	    	document.getElementById("editftype").innerHTML = "Type: "+fType[1]+", "+"Size: "+fileSizeKB+"kb";
	    	    		
      		
      		
      		if(isShareView!='false'){
      			document.getElementById("editViewId").checked=true;
      		}
      		if(isShareDownload!='false'){
          		document.getElementById("editDownloadId").checked=true;
      		}
      		if(isShareEmail!='false'){
          		document.getElementById("editEmailId").checked=true;
      		}
     

      		var str = sourceSystemid;
        	var arr = str.split(",");
        	var i;
        	var a=new Array();
        	for(i=0;i<arr.length;i++)
        	{
        	    a[i]=arr[i];
        	    if(a[i]==31003)
        	    	{
        	    	document.getElementById("editserviceId").checked=true;
        	    	}else if(a[i]==31001)
        	    	{
            	    	document.getElementById("editpartnerId").checked=true;
            	    	}else if(a[i]==31004)
            	    	{
                	    	document.getElementById("editclientId").checked=true;
                	    	}
        	}
      		

        	
        	
      		$('#editBizUnitId').empty();
//     		$('#editBizUnitId').append('<option value="'+ name+'">'+ bizUnit + '</option>');
//     	    $('#editBizUnitId').append('<option value="0">--Select--</option>');
    	
    	     $('#editBizUnitId').append('<option value="'+ name+'">'+bizUnit  + '</option>');
       
    	  //   editBizUnitId
    	    // editDownloadSectionId
    	
    		$('#editDownloadSectionId').empty();
    		//$('#editDownloadSectionId').append('<option value="'+ downloadModuleName+'">'+ downloadModuleName + '</option>');
    		  /* $('#editDownloadSectionId').append('<option value="'+ downloadmoduleid+'">'+ downloadModuleName + '</option>'); */
//     		$('#editDownloadSectionId').append('<option value="0">--Select--</option>');
          		 
          }
    
          function isDate(txtDate)
          {
            var currVal = txtDate;
             if(currVal == ''){
            	 return false; 
             }
              
            //Declare Regex  
            var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/; 
            var dtArray = currVal.match(rxDatePattern); // is format OK?
            if (dtArray == null)
               return false;
           
            //Checks for dd/mm/yyyy format.
           var dtMonth = dtArray[3];
           var dtDay= dtArray[1];
           var dtYear = dtArray[5];

           /* alert("dtMonth:"+dtMonth);
              alert("dtDay:"+dtDay);
              alert("dtYear:"+dtYear); */
           
           if (dtMonth > 12 || dtMonth < 1)
                return false;
             if (dtDay > 31 || dtDay < 1)
                return false;
             if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31)
                return false;
             if (dtMonth == 2)
            {
               var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
               if (dtDay> 29 || (dtDay ==29 && !isleap))
                    return false;
            }
           
            return true;
          }
          $(document).ready(function(){
          addNewDownload('add',0);
          addDownloadSection('add',0);
          //editNewDownload();
      	});
          $(document).ready(function(){
        	  $('#datepickerId').change(function(){
     	    	 if(isDate($('#datepickerId').val())){
     	    		 
     	    	 }else{
     	    		 /* showAlertMessage("Message", "<br/>Please enter valid date.", "information"); */
     	    		 alert("Please enter valid date.");
     	    	 }
      	            
     	    });
        	});
          
          $(document).ready(function(){
        	  $('#editdatepickerId').change(function(){
     	    	 if(isDate($('#editdatepickerId').val())){
     	    		 
     	    	 }else{
     	    		 /* showAlertMessage("Message", "<br/>Please enter valid date.", "information"); */
     	    		 alert("Please enter valid date");
     	    	 }
      	            
     	    });
        	});
     
	 
</script>
<script>
    window.onunload = refreshParent;
    function refreshParent() {
    	alert("hieeee");
  
        window.opener.location.reload();
    }
</script>



</body>
</html>