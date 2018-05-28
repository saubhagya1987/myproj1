<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Product Manufacturer List</title>
 
<%-- <!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>--> --%>


<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">-->
<link href="<%=request.getContextPath()%>/css/style_serviceportal.css"	rel="stylesheet">
<%-- <link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/css/popup.css" />
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/pop.js"></script>
 --%>
<!--<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>-->


 
<script>
	$(document).ready(function() {
		
		//getType(-1);
		
	});//document ready function ends here
	
	function addNote() {
		/* $('#addnote').modal('show');  */
		
		$("#addnote").modal({
		     backdrop: 'static',
		     keyboard: false
		 });
		
	}
	
	function changePageSize(){
		var searchtext=$('#searchtext').val();
		var prodtypeid=$('#typeId').val();;
	 	$("#toreload").load('${pageContext.request.contextPath}/product/product_manufacturer.htm #toreload', {
		   object: '${object}',
		   pageSize: $('#page').val(),
		   searchtext:searchtext,
		   type:prodtypeid,

	}, function( response, status, xhr ) {
	      try{
	    	  $("#csvExp").attr("href", "${pageContext.request.contextPath}/product/productMfgExport.htm?type=CSV&searchTextVal="+searchtext+"&id="+prodtypeid);
	    		$("#excelExp").attr("href", "${pageContext.request.contextPath}/product/productMfgExport.htm?type=excel&searchTextVal="+searchtext+"&id="+prodtypeid);
	      }catch(e){
	        // closePopupWebApp('');       
	      }
	     });
	}
	
	
	
	
	
	function resetValues(){
		/* document.getElementById("").innerHTML="Add"; */
		$('#manufacturerName').val('');
		$('#shortName').val('');
		$('#partyId').val(0);
		//show add buttons
		$('#editbuttons').fadeOut('fast');
		$('#addbuttons').fadeIn('slow');
		getType(0);
		
	}
	
	function saveMfg(isToClose,action){
		if(checkRequiredVals() == true){
			doAdd(isToClose,action);
		} 
	}
	 
	function checkRequiredVals(){
		
		if ($('#manufacturerName').val().trim()=="") {
			alert("Please enter manufacturer name.");
			$('#manufacturerName').focus();
	        return false;
	    }
		if ($('#mfgTypeId').val().trim()=="") {
			alert("Please select type.");
			$('#mfgTypeId').focus();
	        return false;
	    }
		
		return true;
	}
	
	
	function showButtons(id){   
		  //show add buttons    
		  
		  if(id == 0){ //show add buttons
		   $('#editbuttons').fadeOut('fast');
		   $('#addbuttons').fadeIn('slow');
		   }    
		  if(id == 1){//show edit buttons
		   $('#addbuttons').fadeOut('fast');  
		   $('#editbuttons').fadeIn('slow'); 
		   
		   }
		      
		 }
	
	function updateProdMfg(partyId,manufacturerName,mfgTypeId,shortName){
		/* $('#addnote').modal('show');  */
		$("#addnote").modal({
		     backdrop: 'static',
		     keyboard: false
		 });
		
		/* document.getElementById("title1").innerHTML="Edit"; */
		$('#partyId').val(partyId);
		$('#manufacturerName').val(manufacturerName);
		/* $('#shortName').val(shortName); */
		
		var shortnm = $('#shortName').val();
		$('#shortName').val(shortnm.trim());
		getType(mfgTypeId); 
		//show edit buttons
		$('#addbuttons').fadeOut('fast'); 
		$('#editbuttons').fadeIn('slow');
	}
	 
	function doAdd(closePopup,action){
		//trim
		var mfgname = $('#manufacturerName').val();
		var shortnm = $('#shortName').val();
		$('#manufacturerName').val(mfgname.trim());
		$('#shortName').val(shortnm.trim());
		$.ajax({
				type :'GET',
				url:$('#contextPath').val()+'/product/addOrUpdateProductManufacturer.htm',
				data:$('#mfgForm').serialize(), 
				success : function(result){  
					//alert(result); 
					if(result == 'fail'){
						alert('Error occurred please try again.');
						window.location.reload();
					} else{
			            if(closePopup==1 && action=='edit'){
			            	bootbox.dialog({
			            		  
		 						message: "<span class='bigger-110'>Record added successfully</span>",
		 						buttons: 			
		 						{
		 							"click" :
		 							{
		 								"label" : "OK!",
		 								"className" : "btn-sm btn-primary",
		 								"callback": function() {
		 									window.location.reload();
		 								}
		 							}
		 						}
		 					});
			            } else if(closePopup==1 && action=='add'){
			            	bootbox.dialog({
			            		  
		 						message: "<span class='bigger-110'>Record added successfully</span>",
		 						buttons: 			
		 						{
		 							"click" :
		 							{
		 								"label" : "OK!",
		 								"className" : "btn-sm btn-primary",
		 								"callback": function() {
		 									window.location.reload();
		 								}
		 							}
		 						}
		 					});
			               	//alert('Record added successfully');
			               	
			            } else{
			            	$('#success-msg').empty();	
						    $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><strong><i class="ace-icon fa fa-check"></i></strong>Record added successfully.</div>');
							 
			            	 //	alert('Record added successfully');
			            	resetValues();
			            	 addNote().show();
			            }
					}
		  		}
		});
	}
	
	//get source
	function getType(id)
	{
		//alert(id);
		$.ajax
		({
	    	type: "GET",
	      	url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=45',
	      	dataType: 'json',
	      	contentType: 'application/json',
	        success:function(result)
	      	{ 		
	        	
	        	
	        		$('#mfgTypeId').empty();
	        		$(result).each(function(i, obj) {
	    	     		var mfgtype = obj.codeValue;
	    	      		var mfgtypeId = obj.codeValueId;
	    		      	if(id == mfgtypeId){
	    		      		$('#mfgTypeId').append('<option value="'+ mfgtypeId+'" selected="selected">'+ mfgtype + '</option>');
	    	      		} else{
	    	      			$('#mfgTypeId').append('<option value="'+ mfgtypeId+'">'+ mfgtype + '</option>');	
	    	      		}
	    	     		});
	        	
	        	
	      	}
	   });
	}
</script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!--css popup window start 2-->
	<div style="display: none;" id="blanket"></div>
	
	
 	<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h3> Product Manufacturer</h3>
      </div> 
      	<div id="success-msg"></div>
      <div class="modal-body">    
			<!-- <div id="popupwrapper_contactform">  -->
  <input type="hidden" name="confirmdelete" id="confirmdelete" >  
 <form id="mfgForm" method="post">
				
				<input type="hidden" name="partyId" id="partyId">
				<!-- 
			<div id="popupwrapper_contactform"> -->
				<!-- <div class="heading_contactform">
		
				</div> -->
				<!-- <div id="poptable_contactform" style="height: 160px;"> -->
					
					
					
					<span class="searchpadding padding_top" style="float:left; width:150px;">Manufacturer Name    <span class="red">*</span> </span>
					<span  class="searchpadding padding_top" style="float:left; width:192px;">
						<input id="manufacturerName" name="manufacturerName" type="text" class="form-control">
					</span>
					<div class="clearfix"></div>
					
					<span class="searchpadding padding_top" style="float:left; width:150px;">Type <span class="red">*</span> </span>
					<span  class="searchpadding padding_top" style="float:left; width:192px;">
						<select name="mfgTypeId" class="form-control" id="mfgTypeId">
	                       
                               
        				</select>
					</span>
        			<div class="clearfix"></div> 
					
					<span class="searchpadding padding_top" style="float:left; width:150px;">Short Name  </span>
					<span  class="searchpadding padding_top" style="float:left; width:192px;">
						<input id="shortName" name="shortName" type="text" class="form-control">
					</span>
					<div class="clearfix"></div>					
<!-- 
				</div> -->
				
				
				<div class="modal-footer" id="addbuttons">
	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="saveMfg(0,'add');">	Save &amp; New</button>
	<button data-bb-handler="close" type="button" class="btn btn-primary btn-sm" id="Save" onclick="saveMfg(1,'add');" >Save &amp; Close</button>
	<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div> 
	  
	<div class="modal-footer" id="editbuttons">
	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="saveMfg(1,'edit');">	Save </button>
	
	<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div>

				<!-- </div> -->
			</form> 
   <!--  </div>   --> 
	</div>     
	   
	
	  
	        
     </div>
      
     </div></div> 
	
	<!--css popup window 2 close-->


	
	<!-- Center part start -->
	
		   
						<div class="page-header">
							<h1 class="pull-left">Product Manufacturer</h1>
							  <div class="nav-search pull-right" id="">
              <form class="form-search">
               
              </form>
               <div class="clearfix"></div>
          </div>  
                       	 
                         </div>
		 <section>
			<div class="container-body" >
				<!-- center -->
				<div style="display: inline-block;padding-left: 0;margin: 0px 0 10px 0;">
					<span class="searchpadding padding_top" style="float:left; width:100px;">Type  <span class="red">*</span> </span>
					<span class="searchpadding padding_top" style="float:left;width:150px;">
						<select id="typeId" name="typeId" class="form-control" onchange="changePageSize();">
             				<option value="0"> --All--  </option>
		                 	<c:forEach var="item" items="${mfgTypeList}">
		                 		<option value="${item.mfgTypeId}" <c:if test="${item.mfgTypeId==typeid}"> selected="selected" </c:if> >${item.mfgType}</option>
		                 	</c:forEach>
		   				</select>
					</span>
					<div class="clearfix"></div>
				</div> 
				
				<div class="topmenu">

					<a id="SPProdMfgAddLink" href="#" onClick="addNote();getType(0);resetValues();">
						<input data-params="{}"	type="button"  class="btn btn-primary btn-xs createNewBtn"
						value="  New Manufacturer  "
						onClick="showButtons(0);" title="New Manufacturer"
						alt="New Manufacturer"> 
					</a> 
					  
				</div> 
					<div class="clearfix"></div>

				<div class="table-responsive" id="display_table_lead">
					<div id="toreload"> 
					
						<table id="grid-table"></table>
						<div id="grid-pager"></div>                    
                   
						
					</div>
				</div>

			<!-- 	<div class="col-sm-7"> -->
					<%--  <div class="topmenuleft">
						<div class="customDropdown">
							<span>Page Size:</span>&nbsp; 
							<select  name="pageSize" id="page" onchange="changePageSize();">
								<option value="10" <c:if test="${size==10}"> selected="selected" </c:if>>10</option>
								<option value="20" <c:if test="${size==20}"> selected="selected" </c:if>>20</option>
								<option value="50" <c:if test="${size==50}"> selected="selected" </c:if>>50</option>
								<option value="100" <c:if test="${size==100}"> selected="selected" </c:if>>100</option>
								<option value="500" <c:if test="${size==500}"> selected="selected" </c:if>>500</option>
								<option value="10000">Show All&nbsp;</option>
							</select>
						</div>
					</div> --%>
									<div class="clearfix"></div>
					<div class="topmenuleft">
						<ul>
							<li>Export options:</li>
							<li><a id="csvExp" href="<%=request.getContextPath()%>/product/productMfgExport.htm?type=CSV&searchTextVal=${searchTextVal}" title="Export in CSV" alt="Export in CSV">
							<i class="fa fa-file-pdf-o bigger-140"></i></a>
							</li>
							<li><a id="excelExp" href="<%=request.getContextPath()%>/product/productMfgExport.htm?type=excel&searchTextVal=${searchTextVal}" title="Export in Excel" alt="Export in Excel"> 
							<i class="fa fa-file-excel-o bigger-140"></i></a></li>
						</ul>
					</div>
				<!-- </div><div class="clearfix"></div> -->
				
				<div class="topmenu">
					<a id="SPProdMfgAddLink" href="#" onClick="addNote();getType(0);resetValues();">
						<input data-params="{}"	type="button" class="btn btn-primary btn-xs createNewBtn"
						value="  New Manufacturer  "
						onClick="showButtons(0);" title="New Manufacturer"
						alt="New Manufacturer">
					</a> 
				</div> 
			 </div> 
		
	</section>
	<!-- Center part End -->

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	
	<script type="text/javascript">



    var grid_data='${mfgList}';
//alert(grid_data);
	index=JSON.parse(grid_data);
  

/* var subgrid_data = 
[
 {id:"1", name:"sub grid item 1", qty: 11},
 {id:"2", name:"sub grid item 2", qty: 3},
 {id:"3", name:"sub grid item 3", qty: 12},
 {id:"4", name:"sub grid item 4", qty: 5},
 {id:"5", name:"sub grid item 5", qty: 2},
 {id:"6", name:"sub grid item 6", qty: 9},  
 {id:"7", name:"sub grid item 7", qty: 3},
 {id:"8", name:"sub grid item 8", qty: 8} 
]; */

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
		height: 300,
		ignoreCase: true,
		//colNames:[' ', 'ID','Last Sales','Name', 'Stock', 'Ship via','Notes'],
		colNames:[' ','Manufacturer Name','Type','Short Name'],
		colModel:[   
		         
						 {name:'mfgTypeId',index:'mfgTypeId',width:50,formatter:function(cellvalue, options,rowObject) {
							return '<a href="#" onclick="showButtons(1);updateProdMfg('+rowObject.partyId+',\''+rowObject.manufacturerName+'\',\''+rowObject.mfgTypeId+'\',\''+rowObject.shortName+'\');" id="'+rowObject.mfgTypeId+'"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
						}},
						
		
					{name:'manufacturerName',index:'manufacturerName'},   
					{name:'mfgType',index:'mfgType'}, 
					{name:'shortName',index:'shortName', formatter:function(cellvalue, options,rowObject) {
		     	  	    
					    if(rowObject.shortName==null)          
					    	return '<span >'+"NA<br>"+'</span>';
					    else
					    	return rowObject.shortName;   }},
			 
			 
		],     

		viewrecords : true, 
		rowNum:10, 
		rowList:[10,20,50,100,1000],
		pager : pager_selector,
		altRows: true,
		autowidth:false,
		//toppager: true,
		
		//multiselect: true,
		//multikey: "ctrlKey",
        multiboxonly: true, 

		loadComplete : function() {
			var table = this;
			setTimeout(function(){
				styleCheckbox(table);
				if($('#selectAll').attr('id')==undefined)
				$('#jqgh_grid-table_checkbox').before('<br/><input  type="checkbox" id="selectAll">');
				updateActionIcons(table);
				updatePagerIcons(table);
				enableTooltips(table);
				$('#selectAll').click(function(event) {  //on click 
			        if(this.checked) { // check select status
			            $('.cbox').each(function(i,obj) { //loop through each checkbox
			                this.checked = true;  //select all checkboxes with class   "checkbox1"    
						$(obj).attr('checked','checked');
			            });
			        }else{
			            $('.cbox').each(function(i,obj) { //loop through each checkbox
			                this.checked = false; //deselect all checkboxes with class "checkbox1"
			            	$(obj).removeAttr('checked');
			            });         
			        }
			        $('#selectAll').checked = true;
			    });
				
			}, 0); 
			
		}, 

		editurl: "/dummy.html",//nothing is saved
		//caption: "jqGrid with inline editing"

		autowidth: true,
      //  shrinkToFit:false,	


		 

	});
	$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size
	
	

	

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
$('#menu-wplook-sub-menu9').addClass('active');
$('#SPProductManufacturerLink').addClass('active');
</script>
	
	
</body>
</html>