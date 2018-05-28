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
<title>DC Collateral</title>
 

<script type="text/javascript">

function resetval()
{
	
	    $('#addquickSearchpart').val('');
		$('#addquickSearchHiddenpart').val('');
		$('#addquickSearch').val('');
		$('#addquickSearchHidden').val('');
		$('#documentNameId').val('');
		$('#descriptionNoteId').val('');
		$('#statusId').empty();
      		
}

function deleteTestomonial()
	{ 
		  var selectedlvals = [];
		  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
			  selectedlvals.push($(this).val());
		  });
		
		if(selectedlvals == ""){
			alert("Please select at least one Item for delete");
			return;
		}
		  document.getElementById("confirmdelete").value = selectedlvals;
		  //popup('popUpAlertaddnote');
	};


		 function confirmDelete()
		{
			 var selectedlvals= document.getElementById("confirmdelete").value;
			 //  alert('selectedlvals::'+selectedlvals);
			   	  $.ajax({
				   type : 'POST',
				   url : $('#contextPath').val()+"/testimonial/deleteTestimonial.htm?selectedlvalz="+selectedlvals,
			
				  success : function(result)
	            {
					  
					  $("#deletenote").hide();
						 bootbox.dialog({
								message: "<span class='bigger-110'>Record Deleted successfully</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											 refresh();
											 //document.getElementById("myForm").reset();	
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

</script>

</head>
<body>
<jsp:include page="../common/header.jsp" />
<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />

<!--css popup window start 1-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px; top:100px" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv');" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>

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

<!-- --------------------Add Testimonial----------------------------- -->



<!-- <div id="addnote"> -->
	<div class="modal fade" id="addnote" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Add DC Collateral</h4>
				</div>
				<div id="success-msg"></div>
				<div id="form-box">
					<form id="myForm" method="post"
						action="<%=request.getContextPath()%>/dccolletral/loaddccolletralist.htm"
						enctype="multipart/form-data">
						<input type="hidden" name="confirmdelete" id="confirmdelete"
							value=""> <input type="hidden" id="hiddenPartyId"
							name="hiddenPartyIdName" value="" /> <input type="hidden"
							id="hdnDownloadSectionId" name="hdnDownloadSectionName" value="" />
						<input type="hidden" id="hiddenIsToClose" name="hiddenIsToClose"
							value="<%=request.getAttribute("hiddenIsToClosee")%>" /> <input
							type="hidden" id="isToClose" name="isToClose"
							value="<%=request.getParameter("isToClose")%>" />

						<div class="modal-body">
							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Section ">Section <span class="red">*</span></label>
									<div class="col-sm-9">
										<span class="searchpadding padding_top" style="float: left;">
											<select name="dccolletralSection" class="form-control"
											id="secId">
										</select>
										</span>

									</div>
								</div>
							</div>
							<!-- <div class="clearfix"></div> -->

							<!-- --------------upload file--------------------- -->


							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Upload File ">Upload File <span class="red">*</span></label>
									<div class="col-sm-9">
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


							<span class="searchpadding padding_top"
								style="float: left; width: 150px;"></span> <span
								class="searchpadding padding_top "
								style="float: left; width: 150px;"> <!-- <input id="newTagId" name="newTagName" type="checkbox"><a href="#" style="color:#333;"><span class="user">Show New Tag against the document</span></a> --></span>

							<div class="topbuttonholder" style="float: right">


								<button data-bb-handler="confirm" type="button"
									class="btn btn-primary btn-sm" id="saveNdNewId"
									onclick="submitAddDownload(0);">Save & New</button>
								<button data-bb-handler="confirm" type="button"
									class="btn btn-primary btn-sm" id="Save & Close"
									onclick="submitAddDownload(1);">Save & Close</button>
								<button data-bb-handler="cancel" type="button"
									class="btn btn-sm btn-danger" type="button" class="close"
									data-dismiss="modal" aria-label="Close">
									<i class="ace-icon fa fa-close"></i> Cancel
								</button>


							</div>
							<div class="clearfix"></div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- --------------------Add DownLoad over----------------------------- -->
     <!-- delete-->
     
     <div class="modal fade" id="deletenote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  			<div class="modal-dialog">
   			 <div class="modal-content">
      		<div class="modal-header">
       			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<h4 class="modal-title" id="myModalLabel">Message</h4> 
		<!-- <div id="deletenote"> -->
			Do you want to delete this DC Colletral? Please confirm.
					<div style="float: right;">
						<form>
							<!-- <input class="dbtn" value="Yes" id="Yes" type="button"
								onclick="confirmDelete();popup('popUpAlertaddnote');" />  -->
								<!-- <input
								class="dbtn" value="No" id="No" type="button"
								onclick="popup('popUpAlertaddnote');"/> -->
								<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Yes" onclick="confirmDelete();"> Yes</button>
								<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> No</button>
								
						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
  
    
    <!-- delete-->
   
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

 <!-- <div class="container-head"> 
    	  <div class="col-md-12" style="text-align: right;"> 
             <!-- accordion start-->
           <!-- 
           	  <div class="accordion pull-left col-md-12" id="accordFundSel">
                <div class="accordion-group"> 
                 -->
                
          <div class="page-header ">
            <h1 class="pull-left">DC Collateral List</h1>
            <div class="nav-search pull-right" id="">
              <form class="form-search">
               
              </form>
               <div class="clearfix"></div>
          </div>  

     
    
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
  
              
               <!-- accordion End -->
         <!--    </div >
          </div > -->
   <section>
  	  <div class="container-body" >
        <!-- center -->
        
        
        <ul class="pagination pagination-sm">

</ul>
	
	
			
	<div class="topmenu" style="float:right">
	
<a id="SPAddDCColletralLink" href="#" onClick="addNote();" ><input data-params="{}" type="button" class="btn btn-sm btn-primary" value="   New DC Collateral" title=" New DC Collateral"  alt=" New DC Collateral"></a>


 <a id="SPDeleteDCColletralLink" href="#" onClick="">
						<input data-params="{}" type="button" class="btn btn-sm btn-danger"
						value="  Delete" onClick="deleteDCcolletral();" title="Delete"
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
 
     
    


<div class="topmenuleft" style="float:left" >
 
  <ul><br/>
  	<span>Export options: </span>
 	<a href="<%=request.getContextPath()%>/dccolletral/CSV.htm" title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-120"></i></a>
	<a href="<%=request.getContextPath()%>/dccolletral/Execl.htm"title="Export in Excel" alt="Export in Excel" ><i class="fa fa-file-excel-o bigger-120"></i></a>
  	
 <!-- <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li>  -->
  </ul>
 
  
 
 </div>

<div class="topmenu" style="float:right"><br/>

<a id="SPAddNewTestimonialLink" href="#" onClick="addNote();" ><input data-params="{}" type="button" class="btn btn-sm btn-primary" value="   New DC Collateral" title=" New DC Collateral"  alt=" New DC Collateral"></a>


 <a id="SPDeleteTestimonialLink" href="#" onClick="">
						<input data-params="{}" type="button" class="btn btn-sm btn-danger"
						value="  Delete" onClick="deleteDCcolletral();" title="Delete"
						alt="Delete" />
					</a>
	<!-- <a id="SPAddNewTestimonialLink" href="#" onClick="addNote();" ><input data-params="{}" type="button" class="dbtn createNewBtn" value="  New DC Collateral" title="New DC Collateral"   onClick="popup('popUpAlertaddnote');"  alt="New DC Colletral"></a>
	<a id="SPDeleteTestimonialLink" href="#" onClick="deleteNote();" ><input data-params="{}" type="button" class="dbtn deleteBtn" value="  Delete"  title="Delete"  onClick="deleteTestomonial();"  alt="Delete"></a> -->
	<!-- <input type="hidden" name="confirmdelete" id="confirmdelete"> -->
</div>	



     </div>
     
    <!--  </div>    
  </div> -->
    
            	
</section>           	
<!-- Center part End -->          

<footer>
  <jsp:include page="../common/footer.jsp" />
 </footer>






<script>
//alert("hieeeeeee");
var grid_data=${dccolletral};
//index=grid_data;
//console.log('grid_data:---'+grid_data);
index=grid_data;
//alert("hieeeeeee");
//console.log('data:---'+index)
/*var index=new Array();
$(grid_data).each(function(i,obj) {
	var object = {};
	object.sectionName = obj.sectionName;
	//object.pingOwner=obj.pingOwner;
	//object.notifyTemplateID=obj.notifyTemplateID;
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
	     $('#addnote').on('hide.bs.modal', function (e) {
  //if (!data) return e.preventDefault() // stops modal from being shown
 			 refresh();
		})
	
		



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
			ignoreCase: true,
			//width:600,
			//colNames:['Biz Unit'],
			colNames:[' ','BizUnit Name','Section Name','File Name','Uploaded By','Uploaded Date'],
			colModel:[
		
			{name:'checkbox',width:50, index:'checkbox',sortable:false,formatter:function(cellvalue, options,rowObject) {
			    return '<input role="checkbox" type="checkbox"  class="cbox" id="chkdeleteselect" value="'+rowObject.documentId+'" name="chkdeleteselect">';
			}},
			
			{name:'buId',index:'buId',width:150},
			{name:'sectionid',index:'sectionid',width:230},
			{name:'fileName',index:'fileName',width:400},
			{name:'createdname',index:'createdname'},
			{name:'createddate',index:'createddate',width:200}
			
			
		 

		], 

			viewrecords : true,
			rowNum:10,
			rowList:[10,20,50,100],
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

			autowidth: false,
	        shrinkToFit:false,	



			

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

/*  function pagesizeurl(){
  var pageSize=$('#page').val(); 
  window.location.href= $('#contextPath').val()+'/dccolletral/loaddccolletralist.htm?pageSize='+pageSize;
   //window.location.href= $('#contextPath').val()+'/testimonial/loadtestimonialsList.htm';
 } */
 /* 
 function PCurl(){
	 var partnerId=$('#quickSearchHiddenpart').val();
	 var clientId =$('#quickSearchHidden').val();
	 
	  window.location.href= $('#contextPath').val()+'/testimonial/loadtestimonialsList.htm?partnerId='+partnerId+"&clientId="+clientId;
	   //window.location.href= $('#contextPath').val()+'/testimonial/loadtestimonialsList.htm';
	 } */
	 

function addNote(){
		 

	//$("#deletenote, #editnote").hide();	
//	$('#addnote').modal('show');
	
		 $("#addnote").modal({
		     backdrop: 'static',
		     keyboard: false
		 });

	
	
}

function deleteNote(){
	
	
	$(" #editnote,#addnote").hide();	
	$('#deletenote').modal('show'); 	
	/* $("#deletenote").show();	
	$("#addnote, #editnote").hide();	
// 	$("#popUpAlertaddnote").css ('left','425px');
// 	$("#popUpAlertaddnote").css ('top','200px');
	$("#popUpAlertaddnote").css('height', '370px');
	var height = ($(window).height() / 2) - (parseInt($('#popUpAlertaddnote').css('height'))/2);
	$('#popUpAlertaddnote').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpAlertaddnote').css('width'))/2);
	$('#popUpAlertaddnote').css('margin-left', width/3); */
			
}

function refresh(){
	<%--  window.location.href = "<%=request.getContextPath()%>/dccolletral/addDCcolletral.htm"; --%>
	 window.location.href = "<%=request.getContextPath()%>/dccolletral/loaddccolletralist.htm";
}

 
 
 function getSection(secid)
	{
	
		 $.ajax
		 ({
	              
	      type: "POST",
	      url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=39',
	      dataType: 'json',
	      contentType: 'application/json',
	         success:function(result)
	      { 
	        
	        
	      
	        	var id = '#secId';
	        	$('#secId').empty();
	        	 $("#secId").append('<option value="0">----Select----</option>');
	        
	        
	        $(result).each(function(i, obj) {
	     	var sectionName = obj.codeValue;
	      	var sectionid = obj.codeValueId;
	      	
	      	if(secid == sectionid){
	      		$(id).append('<option value="'+ sectionid+'" selected="selected">'+ sectionName + '</option>');
	      	} else{
	      		$(id).append('<option value="'+ sectionid+'">'+ sectionName + '</option>');	
	      	}
	      	
	
	     });
	      }
	   
	   });
		
	}
 
 function submitAddDownload(isToClose){

		$('#hiddenIsToClose').val(isToClose);
		 	if(addDownloadRequiredValidation() == true){
	 		
			var form = document.getElementById('myForm');
			form.submit();

				resetval();
			
			
		 } 
	 	
	  }
 

	
	function addDownloadRequiredValidation(){
		/* start add download */
		//alert("$('#dccolletralSection').val()"+$('#dccolletralSection').val());
		
		
		 
		 if ($('#secId').val()=="0" || $('#secId').val()==null || $('#secId').val().trim()=="") {
			// if ($('#downloadSectionId').val()==null) {
			/* showAlertMessage("Message", "<br/>DC Colletral Section is required.", "information"); */	
			alert("DC Colletral Section is required.");
	         return false;
	     } 
		
		 if ($('#fileid').val().trim()=="") {
			/*  showAlertMessage("Message", "<br/>Please select a file!", "information"); */
			alert("Please select a file!");
	         return false;
	     } 
		 
		
	 
		  return true;
		    /* end add download  */
		    //alert("Record inserted successfully");
	}
	
	$(document).ready(function(){
		 if($('#isToClose').val()=="0"){
	
			 // popup('popUpAlertaddnote');
			// if($('#saveNnew').val()==1){
			//	alert("Data saved successfully.");
			getSection(1);
			 $('#success-msg').empty();	
				$('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>Record inserted successfully.</p></div>');
				document.getElementById("myForm").reset();
			addNote();
				
			//showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation");
			
			//$('#saveNnew').val(0);			
			//}
				
					  //To show popup on load while 'Save & New'
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
      
     
		
	});

 
 
 
 
 function getFile(){
		
     document.getElementById("fileid").click();
	
 }

 /* For file Type & size */
	var fSize;
	$(document).ready(function(){
	    $('#fbtnid').mouseleave(function(){
	    	var filename = $('#fileid').val().replace(/.*(\/|\\)/, '');
	    	/* alert(filename); */
	    	var fType= filename.split(".");
	    	//alert("fType:"+fType[1]);
	    	fSize = document.getElementById('fileid').files[0].size/1024; //size in kb
	    	document.getElementById("ftype").innerHTML = "Type: "+fType[1]+", "+"Size: "+Math.floor(fSize)+"kb";
	    	
	    	
	    	 var url = document.getElementById("fileid").value;
	         var filename = url.replace(/^.*\\/, "");
	         document.getElementById("ftxtid").value= filename;
	         if(fSize>9765){
	        	 /* showAlertMessage("Message", "<br/>file size should not be greater than 9765 kb", "information"); */
	        	 alert("file size should not be greater than 9765 kb");
	        	 $('#fileid').val('');
	        	 $('#ftxtid').val('');
	         }
	    	/* var fv = document.getElementById("fileid").value;
	    	document.getElementById("ftxtid").value= fv; */
	    	//alert("fv:"+fv);
	    });
	});


	function deleteDCcolletral()
 	{ /* 
 		  var selectedlvals = [];
 		  $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
 			  selectedlvals.push($(this).val());
 		  });
 		 //alert('Selected Checkbox values are: ' + selectedlvals);
 		if(selectedlvals == ""){
			// alert('Please select at least one Item for delete');
			 showAlertMessage("Message", "<br/>Please select at least one Item for delete", "information");
			return;
		  }else{
				
				deleteNote();
		}
 		  document.getElementById("confirmdelete").value = selectedlvals;
 		  //popup('popUpAlertaddnote');
 		   */
 		  
 		  
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
 			   //alert('selectedlvals::'+selectedlvals);
 			   	  $.ajax({
 				   type : 'POST',
 				   url : $('#contextPath').val()+"/dccolletral/deleteDCcolletral.htm?selectedlvalz="+selectedlvals,
 			
 				  success : function(result)
		            {
 					  
 					 $("#deletenote").hide();
 					 bootbox.dialog({
 							message: "<span class='bigger-110'>Record deleted  Successfully.</span>",
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
 	        	   
 					  
 					//alert('Record deleted successfully');
 					// showAlertMessage("Information", "<br/>Record deleted successfully", naval);
 					 //showAlertMessage("Success", "<br/>Record deleted  Successfully.","confirmation", refresh);
 					  /* alert('Record deleted  Successfully.');
 						location.reload();  */
 				//	location.reload();
 					  //location.reload();
//  					  refresh();
		            	/* var a=0;
		            	$(result).each(
								function(i, obj) {
									a++;
									
								});
		            	     alert(a+' Record are delete'); */
		                  }
 		      
 		   }); 
 		 }
 		 

 
	$(document).ready(function() {
		getSection(0);
	});
</script>

<!-- Quick Search for Add  -->
	<script type="text/javascript">  

		
	$('#menu-wplook-sub-menu9').addClass('active');
	  $('#SPDCColletaralLink').addClass('active');
		</script>
		
		
</body>
</html>