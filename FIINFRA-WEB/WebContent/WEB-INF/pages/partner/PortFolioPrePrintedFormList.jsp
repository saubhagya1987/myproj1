<!DOCTYPE html>
<html lang="en"><head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>PortFolio : Preprinted Form</title>
<script type="text/javascript">
var hidePopupTimeoutId;
$(".choose1").live("click", function (e) {
    $("#documentIdToDownload").val($(this).attr('id'));
    clearTimeout( hidePopupTimeoutId );
    var id='#docId_'+$(this).attr('id');
    $(id).show();
    return false; // prevent default click action from happening!
    e.preventDefault(); 
});


$(".popupform").live("mouseenter", function() {
    clearTimeout( hidePopupTimeoutId );
});

$(".choose1").live("click", function() {
    $(".popupform").css ('position','fixed');
    $(".popupform").css ('top','240px');
    $(".popupform").css ('display','inline');
});


$(".popupform").live("mouseleave", function() {
    $(".popupform").hide();
});
</script>
<style>
	 .ui-autocomplete {
	    max-height: 270px;
	    overflow-y: auto;
	    /* prevent horizontal scrollbar */
	    overflow-x: hidden;
	    /* add padding to account for vertical scrollbar */
	    padding-right: 20px;
		}
		/* IE 6 doesn't support max-height
		 * we use height instead, but this forces the menu to always be this tall
		 */
		* html .ui-autocomplete {
		    height: 100px;
		}
    </style>
</head>
<body>
      <jsp:include page="../common/header.jsp"></jsp:include>
	
 <!-- Center part start -->
 <section>

    
    	  <div class="page-header">
				<h1>Preprinted Form</h1>
			</div>
       
	  	      


    <div class="tabbable">
    <ul class="nav nav-tabs" id="">
      <li class="dropdown"> <a id="myportfolio" data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="false">My Portfolio <i class="ace-icon fa fa-caret-down bigger-110 width-auto"></i></a>
        <ul class="dropdown-menu dropdown-info" id="myportfolioMenu">
          <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/folio/foliopage.htm'">MF Portfolio</a> </li>
          <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath() %>/folio/openclientportfolio.htm'">Client Portfolio </a> </li>
        </ul>
      </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getTxnSource.htm'">RTA File Uploads </a> </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/getbulkuploadtransactiohistorydetails.htm?queueId=0'">Transaction History </a> </li>
      <li> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/loadreportAdWiseCilentPortfolioSummary.htm'">Reports</a> </li>
      <li class="active"> <a data-toggle="tab" onclick="window.location.href='<%=request.getContextPath()%>/et/loadAvailablePrePrintedForms.htm?clientPartyId=0&ownerPartyId=${sessionScope.userSession.partyId}'">Preprinted Form</a> </li>
      <li id="autoAllocatedAssetsLink"> <a onclick="window.location.href='<%=request.getContextPath()%>/et/assetAutoAllocation.htm'">Auto Allocated Assets</a> </li>
      <li id="autoAllocatedAssetsLink"> <a onclick="showPasswordDialog();">MF Auto Upload Configuration</a> </li>
    </ul>
    <div class="tab-content">
      <div id="" class="tab-pane fade in active clearfix">
       
	      <jsp:include page="PortFolioPrePrintedActions.jsp"></jsp:include> 
<form name="saveEtForm" id="saveEtForm">
        <div class="col-md-9"  style="margin-top:0px; padding-left:10px;" >
			
 <!-- center -->
       
<div class="list-group">
  <a class="list-group-item active" href="#">Preprinted Form <span id="hdnClientName"></span> <input class="col-md-7" name="searchtext" type="text" id="quickSearch" placeholder="Search Client Name" onkeyup="quickSearchContacts();" style="float:right;width: 300px;margin-top:-6px;"></a>
  <div class="list-group-item">
       
    <div class="row">
    		<div class="col-xs-pull-9">
             
              <div class="col-xs-pull-9 searchpadding padding_top">
               <div class="executionhead">Available pre-printed forms
</div>
</div>
										<div class="table-responsive"  id="display_table_lead">
											<div id="toreload">
												                     
    <table id="grid-table"></table>

	<div id="grid-pager"></div>

											</div>

										</div>
            </div>
    </div>
    


               </div>

 

</div>
</div></form>
      </div>
      <div id="" class="tab-pane fade"> </div>
      <div id="" class="tab-pane fade"> </div>
      <div id="" class="tab-pane fade"> </div>
    </div>
  </div>
       	
       	
      </section>
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />
<form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm" enctype="multipart/form-data">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>

<input type="hidden" id="fpActionPlanId" value="${param.fpActionPlanId}"/>
<script>


function enableTf2(){

$("#stageType, #save1, #cancel1").show();
$('#manufacturer, #product, #scheme, #option, #investmenttype, #investmentamount, #frequency, #allocation ').removeAttr("disabled", true);
}

$('#PortFolio').addClass('active');
$('#loadAvailablePrePrintedForms').css('font-weight','bold');



function split( val ) {
    return val.split( /;\s*/ );
} 
function extractLast( term ) {
    return split( term ).pop();
}


function quickSearchContacts(){
	setTimeout(function(){closePopupWebApp('');},200);
	
	$.ajax({
	  url: $('#contextPath').val()+"/et/quickSearchContacts.htm?searchString="+$('#quickSearch').val(),
	  method:"post",
	  success:function(result){
			 availableTags = new Array();
			 $(result).each(function(i,obj){
				 
				 var object = {};
					object.value = obj.partyId;
					object.label = obj.fName+' '+obj.lName +'['+obj.panNo+' '+obj.emailId+']';
				 availableTags.push(object);
			 }); 
			 
			$('#quickSearch')
		    // don't navigate away from the field on tab when selecting an item
		    .bind( "keydown", function( event ) {
		      if ( event.keyCode ===  $.ui.keyCode.TAB &&
		          $( this ).data( "ui-autocomplete" ).menu.active ) {
		        event.preventDefault();
		      }
		    })
		    .autocomplete({
		      minLength: 0,
		      source: function( request, response ) {
		        // delegate back to autocomplete, but extract the last term
		    	  response(  $.ui.autocomplete.filter(availableTags, request.term) );
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
			        $('#clientPartyIdHidden').val(ui.item.value);
 					/* add placeholder to get the comma-and-space at the end */
			        terms.push( "" );
			        this.value = terms.join( "" );
			        
			        var labelArr = $(this).data('label') || new Array();
			        labelArr.push(ui.item);
			        $(this).data('label',labelArr);
			        console.log($(this).data());
			        return false;
		      }
		    });
	    }
	});
	
	 function split( val ) {
		    return val.split( /;\s*/ );
		} 
		function extractLast( term ) {
		    return split( term ).pop();
		} 
      }
 
$(document).ready(function() {
	var v = '<%=request.getAttribute("quickSearchHidden")%>';
	if(v!='null' && v!=null && v!=""){
	$("#hdnClientName").html(" for "+v);
	}
});

function showFormList(){
	window.location.href= $('#contextPath').val()+'/et/loadAvailablePrePrintedForms.htm?quickSearchHidden='+$('#quickSearchHidden').val()+'&clientPartyId='+$('#clientPartyIdHidden').val();
}
	function viewDoc() {
	   var docId=$("#documentIdToDownload").val();
		window.location.href= $('#contextPath').val()+'/common/downloadDocument.htm?docId='+docId;
	}

function emailDoc(docId,partyid){
	if(docId!=0 && partyid!=0){
		$.ajax({
			type : "GET",
			url : $('#contextPath').val()+'/et/sendEmail.htm?docId='+docId+'&partyId='+partyid,
			dataType : "json",
			success : function(data){
				$('#actionpopupalert').modal('hide') ;
				if(data=='success'){
				
					showAlertMessage1("Success", "Email has been sent successfully"+'\n',"confirmation", doNothing);
				
				}else{
					showAlertMessage1("Error",data.error+'\n',"confirmation", doNothing);
				}
			} 
		});
	}
	
}

$('#quickSearch').keypress(function(event) {
    if (event.which == 13) {
    	if($('#clientPartyIdHidden').val()=="0"){
    		window.location.href= $('#contextPath').val()+'/et/loadAvailablePrePrintedForms.htm?clientPartyId=0&ownerPartyId='+${sessionScope.userSession.partyId};
    		event.preventDefault();
    	}else{
	    	var clientName=$("#quickSearch").val().split("[")[0];
	    	$("#quickSearchHidden").val(clientName);
	    	showFormList();
	    	event.preventDefault();
    	}
    }
});

</script>
<script type="text/javascript">
			var grid_data =${formList};
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
				jQuery(grid_selector).jqGrid({
					subGrid : false,
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
					colNames:['Product','Form Name','Generated On','Action'],
					colModel:[
						
						{name:'productId',index:'productId', width:460,},
						{name:'formName',index:'formName', width:670,},
						{name:'generatedOn',index:'generatedOn', width:150,},
						{name:'action',index:'action', width:60,formatter:function(cellvalue, options,rowObject) {
						    return '<a onclick="openActionPopup('+rowObject.docId+','+rowObject.partyId+')">Action</a>';
						}},
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,50,100,1000],
					pager : pager_selector,
					altRows: true,
			        multiboxonly: true,
			
					loadComplete : function() {
						var table = this;
						setTimeout(function(){
							
							updateActionIcons(table);
							updatePagerIcons(table);
							enableTooltips(table);
						}, 0);
					},
			
					editurl: "/dummy.html",//nothing is saved
					//caption: "jqGrid with inline editing"
			
					autowidth: true,
		            shrinkToFit:false,	
				});
				$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
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
						search: false,
						searchicon : 'ace-icon fa fa-search orange',
						refresh: false,
						refreshicon : 'ace-icon fa fa-refresh green',
						view: false,
						viewicon : 'ace-icon fa fa-search-plus grey',
					},
					{
						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
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
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:false})
					
					form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
			
					//update buttons classes
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-xs').find('[class*="-icon"]').hide();//ui-icon, s-icon
					buttons.eq(0).addClass('btn-primary').prepend('<i class="ace-icon fa fa-check"></i>');
					buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')
					
					buttons = form.next().find('.navButton a');
					buttons.find('.ui-icon').hide();
					buttons.eq(0).append('<i class="ace-icon fa fa-chevron-left"></i>');
					buttons.eq(1).append('<i class="ace-icon fa fa-chevron-right"></i>');		
				}
			
				function style_delete_form(form) {
					var buttons = form.next().find('.EditButton .fm-button');
					buttons.addClass('btn btn-xs btn-white btn-round').find('[class*="-icon"]').hide();//ui-icon, s-icon
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
					buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-xs btn-info').find('.ui-icon').attr('class', 'ace-icon fa fa-retweet');
					buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-xs btn-inverse').find('.ui-icon').attr('class', 'ace-icon fa fa-comment-o');
					buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-xs btn-purple').find('.ui-icon').attr('class', 'ace-icon fa fa-search');
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
			
				$(document).one('ajaxloadstart.page', function(e) {
					$(grid_selector).jqGrid('GridUnload');
					$('.ui-jqdialog').remove();
				});
			});
	     
		function openActionPopup(docId, partyId) {
			$("#documentIdToDownload").val(docId);
			$('#ViewdocId a').attr('onClick', 'viewDoc()');
			$('#dwnloaddocId a').attr('onClick', 'viewDoc()');
			$('#emailDocId a').attr('onClick',
					'emailDoc(' + docId + ',' + partyId + ')');
			$('#actionpopupalert').modal('show') ;

		}
		
     </script>
     
     <div class="modal fade" id="actionpopupalert" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Action List</h4>
										</div>
										<div class="modal-body">
											<table class="table table-bordered table-striped">
			<tr>
				<td id="ViewdocId">
					<i class="outputreport_icon"></i>
					<a href="#" style="color: #333;">
						<span class="user">View</span>
					</a>
				</td>
			</tr>
			<tr>
				<td id="dwnloaddocId">
					<i class="download_icon"></i>
					<a href="#" style="color: #333;">
						<span class="user">Download</span>
					</a>
				</td>
			</tr>
			<tr>
				<td id="emailDocId">
					<i class="emailicon"></i>
					<a href="#" style="color: #333;">
						<span class="user">Email</span>
					</a>
				</td>
			</tr>

		</table>
										</div></div></div></div>
										
<input type="hidden" id="clientPartyIdHidden" value="0">
<input type="hidden" id="quickSearchHidden" value="0">
</body>
</html>