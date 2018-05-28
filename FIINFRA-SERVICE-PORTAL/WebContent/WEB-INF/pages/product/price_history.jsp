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
		<title>Product Price History </title>


		
	<%-- 	<link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" /> --%>
		<!--<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />-->
		<!-- -responsive css-->
		
	<%-- 	<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
		
		<link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>  --%>
		<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
		
	
	<script>
		function addNote(){
		
		$("#addnote").modal('show');	
		/* $("#deletenote, #editnote").hide();	
		$("#popUpAlertaddnote").css ('height','350px');
		$("#popUpAlertaddnote").css ('width','650px');
		$("#popUpAlertaddnote").css ('left','355px');
		$("#popUpAlertaddnote").css ('top','93px'); */
		}
		
		function deleteNote(){
		
		/* $("#deletenote").show();	
		$("#addnote, #editnote").hide();	
		$("#popUpAlertaddnote").css ('height','250px');
		$("#popUpAlertaddnote").css ('width','300px');
		$("#popUpAlertaddnote").css ('left','526px');
		$("#popUpAlertaddnote").css ('top','192px'); */
		}
		function editNote(){
		
		/* $("#editnote").show();	
		$("#addnote, #deletenote").hide();	
		$("#popUpAlertaddnote").css ('height','350px')
		$("#popUpAlertaddnote").css ('width','650px') */
		}
		
	</script>
	
	</head>
	<body>
	<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />  
	<!--css popup window start 2--><!-- addnote starts --> 
<!-- 	<div style="display: none;" id="blanket"></div> -->
	
<div class="modal fade" id="addnote" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"> Product Price &#45; ${prodName} </h4> 
      </div> 
      <div class="modal-body">    
			<!-- <div id="popupwrapper_contactform">  -->
   
 	 <form id="addPriceForm" method="post"> 
 				<input type="hidden" name="productId" id="masterProductId" value="${productId}" />
				<input type="hidden" name="prodname" id="prodname" value="${prodName}" /> 
				<input type="hidden" name="productPriceId" id="productPriceId" />
				<input type="hidden" name="oldDateId" id="oldDateId">
 	      
  		       <div id="popupwrapper_contactform">
   			
        		<div id="poptable_contactform" style="padding:10px; height:200px;">
        			<span  class="searchpadding padding_top" style="float:left; width:150px;">Price Date<span class="red">*</span> </span>
					<span  class="searchpadding padding_top" style="float:left;width:192px;">
						<input type='text' name="priceDate" id="priceDateId" maxlength="20" readonly="readonly" />
						
						<!-- <span style="float:left; margin:5px;"></span> -->
					</span>
					<span id="errmsg" style="float:left; width:413px; padding-top: 10px;padding-left:153px;"></span>
        			<div class="clearfix"></div>
        			<span class="searchpadding padding_top" style="float:left; width:150px;">Price    <span class="red">*</span> </span>
					<span  class="searchpadding padding_top" style="float:left; width:192px;">
						<input id="priceValue" name="priceValue" type="text" class="form-control" maxlength="18" onchange="checkPrice();" >
					</span>
					<span id="errmsg" style="float:left; width:413px; padding-top: 10px;padding-left:153px;"></span>
		        	<div class="clearfix"></div>
  
  					<span class="searchpadding padding_top" style="float:left; width:150px;">Source    </span>
					<span  class="searchpadding padding_top" style="float:left; width:192px;">
						<select name="priceSourceId" class="form-control" id="sId">
	                        <!-- <option>CMOTS</option>	
	                        <option> BSE </option>  
	                        <option>NSE</option>	
	                        <option> AMFI </option>
	                        <option>Manual</option>	 -->
                               
        				</select>
					</span>
        			<div class="clearfix"></div>
				</div>
  				  
    		</div> 
       </form>
   </div>     
	<div class="modal-footer" id="addbuttons">  
	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="savePrice(0,'add');">	Save &amp; New</button>
	<button data-bb-handler="close" type="button" class="btn btn-primary btn-sm" id="Save" onclick="savePrice(1,'add');" >Save &amp; Close</button>
	<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div> 
	     
	<div class="modal-footer" id="editbuttons">  
	<button data-bb-handler="confirm" type="button" class="btn btn-primary btn-sm" id="Save" onclick="savePrice(1,'edit');">	Save </button>
	
	<button data-bb-handler="cancel" type="button" class="btn btn-sm btn-danger" type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ace-icon fa fa-close"></i> Cancel</button>
	</div>   
	      
     </div> 
      
     </div>
     </div>  
	
	
	  <!-- addnote ends -->
	<!--css popup window 2 close-->
	  
	<!--breadcrum Menu Start--> 
	<%-- <div class="container">
		<div class="portfoliostrip collapse navbar-collapse">
    		<ul class="navbar-sub">
         		<li id="SPCodeTypeLink"><a href="<%=request.getContextPath()%>/codetype/loadcodetypedata.html">Code Type</a></li>
	            	<li id="SPNotificationTemplatesLink"><a href="<%=request.getContextPath()%>/notifytemplate/getTemplateList.htm">Notification templates</a></li>
					<li id="SPNotificationEventsLink"><a href="<%=request.getContextPath()%>/notifyevent/getEventlist.htm">Notification events</a></li>
	            	<li id="SPProductLink" class="active"><a href="<%=request.getContextPath()%>/product/loadproductlist.htm">Product</a></li>
	            	<li id="SPProductCatRevLink"><a href="<%=request.getContextPath()%>/product/category_revenue.htm">Product Category Revenue</a></li>
	            	<li id="SPProductManufacturerLink"><a href="<%=request.getContextPath()%>/product/product_manufacturer.htm">Product Manufacturer</a></li>
        	</ul>
		</div>        
  	</div>    --%>
 	<!-- Center part start -->
 	<section>
		
    		<div class="container-head">
    		
    		
    		 <div class="page-header clearfix">
            <h1 class="pull-left">Product Price History &#45; ${prodName}  </h1>
            <div class="nav-search pull-right" id="">
              <form class="form-search">
             <!--  <span  class="col-md-10" style="float:right; margin-top:-18px;"> 
                  					<input name="searchtext" type="text" id="searchtext"
										placeholder="Quick Search">
                  				</span> -->
              
                <%-- <span class="input-icon">
                <input type="text" placeholder="Search ..." class="nav-search-input" id="search"  autocomplete="off" value="${value}">
                <i class="ace-icon fa fa-search nav-search-icon"></i></span> --%>
              </form>
             </div>  
           	    <!-- accordion-group END -->
              </div>
    		</div >
    		
    	  		<%-- <div class="col-md-12" style="text-align: right;"> 
             		<!-- accordion start-->
	           		<div class="accordion pull-left col-md-12" id="accordFundSel">
                		<div class="accordion-group">
                			<form id="myForm1" method="post">
                  			<div class="col-md-11" style="width:96%;" > 
                 	 			<span  style="float:left;">Product Price History &#45; ${prodName}    </span>
                  				<span  class="col-md-10" style="float:right; margin-top:-18px;"> 
                  					<input name="searchtext" type="text" id="searchtext"
										placeholder="Quick Search">
                  				</span>
                  			</div>
                  			</form>
                  			
                  				<!-- accordion-body END -->
                			</div>
           	    			<!-- accordion-group END -->
              			</div>
           	  			<!-- accordion  END -->
					</div > --%>
          	
  	  			<div class="container-body" >
        		<!-- center -->
        				<ul class="pagination pagination-sm"></ul>	
					<!-- <div class="topmenu"> -->
        	       <div class="pull-right">
        	       
        	       <a id="SPProdPriceHistoryAddLink" href="#" onClick="getSource(0);addNote();resetValues();">
						<input data-params="{}"	type="button" class="btn btn-sm btn-primary"	value="  New Product Price  "
						onClick="showButtons(0);" title="New Product Price"
						alt="New Product Price"> 
					</a>  		
        	       
					<!-- 	<a id="SPProdPriceHistoryAddLink" href="#" onClick="getSource(0);addNote();resetValues();" >
					<input data-params="{}" type="button" class="dbtn createNewBtn" value="  New Product Price  "   onClick="showButtons(0);" title="New Product Price" alt="New Product Price"></a> -->
						<!-- <a id="SPProdPriceHistoryDeleteLink" href="#" onClick="deleteNote();" ><input data-params="{}" type="button" class="dbtn deleteBtn" value="  Delete"  onClick="popup('popUpAlertaddnote')" title="Delete" alt="Delete"></a> -->
					</div>
                 <div class="clearfix"></div>
 
			 	<div class="table-responsive" id="display_table_lead" style="border:none;"> 
		  				<div id="toreload">
		  				 
		  				<table id="grid-table"></table>     
			 			<div id="grid-pager"></div>  
			 			</div>  
			 			</div>     
		  			
				 <div class="pull-right">
        	       <div class="hr-12"></div>
				  <a id="SPProdPriceHistoryAddLink" href="#" onClick="getSource(0);addNote();resetValues();">
						<input data-params="{}"	type="button" class="btn btn-sm btn-primary"	value="  New Product Price  "
						onClick="showButtons(0);" title="New Product Price"
						alt="New Product Price"> 
					</a>  		 
					<!-- <a id="SPProdPriceHistoryAddLink" href="#" onClick="getSource(0);addNote();resetValues();" class="pagerLink">
						<input data-params="{}" type="button" class="dbtn createNewBtn" value="  New Product Price  "   onClick="showButtons(0);" title="New Product Price" alt="New Product Price">
					</a> -->
					<!-- <a id="SPProdPriceHistoryDeleteLink" href="#" onClick="deleteNote();" >
						<input data-params="{}" type="button" class="dbtn deleteBtn" value="  Delete"  onClick="popup('popUpAlertaddnote')" title="Delete" alt="Delete">
					</a> -->
        		</div>		
     		</div>  
	<!-- 	</div>   -->    
  	</section>           	
	<!-- Center part End -->          
	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css"> -->
	

<script type="text/javascript">

var grid_data=${priceHistoryList};
index=grid_data;  
   
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
		height:400,
		colNames:[' ','Price Date','Price <br>[NAV, Stock Price]','Price Source'],
		colModel:[     
		            
			{name:'productPriceId',index:'productPriceId',formatter:function(cellvalue, options,rowObject) {
				return '<a href="#" onclick="showButtons(1);updatePrice('+rowObject.productPriceId+',\''+rowObject.priceDate+'\',\''+rowObject.priceValue+'\',\''+rowObject.priceSourceId+'\');" id="'+rowObject.productPriceId+'"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
			}},  
			    
			{name:'priceDate',index:'priceDate',width:320},
			{name:'priceValue',index:'priceValue',width:350},
			{name:'priceSource',index:'priceSource',width:350},
			  
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
        autowidth: true,
		shrinkToFit:false,
    	//height:"auto",
		
    	
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
        shrinkToFit:false,	


		 

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
 
$(document).ready(function() {
	var d = new Date();
	var month = d.getMonth()+1;
	var day = d.getDate();
	/* var output = (day<10 ? '0' : '') + day + '/' +
				(month<10 ? '0' : '') + month + '/' +
				d.getFullYear(); */
	 var output = d.getFullYear() + '-' +
	 			  (month<10 ? '0' : '') + month + '-' +			
	 			  (day<10 ? '0' : '') + day;
					
	//alert(output);			
	$("#priceDateId").val(output);
	
 	$("#priceDateId").datepicker({
    	showOn: 'button',
    	//minDate : '0',
    	buttonText: 'Show date',
    	buttonImageOnly: true,
    	buttonImage: '../images/calendar.gif',
    	dateFormat: 'yy-mm-dd',
    	constrainInput: true,
    	
    	onSelect: function(selected){
    		$(this).datepicker('hide');
		        checkPrice();
		      }
	});

 	
 	/* $("#priceValue").keypress(function (event) {
		//if the letter is not digit then display error and don't type anything
			if(event.which < 46 || event.which > 59) {
    			event.preventDefault();
    			$("#errmsg").html("Please enter digits Only").show().fadeOut("slow");
			} // prevent if not number/dot
			if(event.which == 46 && $(this).val().indexOf('.') != -1) {
	   			event.preventDefault();
			}
	}); */
	

 	$('#priceValue').keypress(function (event) {
  	    if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
  	        event.preventDefault();
  	      $("#errmsg").html("Please enter digits Only").show().fadeOut(2500);
  	    }

  	    var text = $(this).val();

  	    if ((text.indexOf('.') != -1) && (text.substring(text.indexOf('.')).length > 4)) {
  	        event.preventDefault();
  	      $("#errmsg").html("You can enter only four digits after decimal").show().fadeOut(2500);
  	    }
  	});
 	
 	
	//check already price is present for date
	 /* $("#priceValue").change(function(){
		 
		 checkPrice();	
		}); */

	
		
});//ready function end here  

</script>

<script type="text/javascript">
	
		function savePrice(isToClose,action){
			
			
			if(checkRequiredVals()==true){
				doAdd(isToClose,action);	
			}
		}
		
		function checkPrice(){
			
			var olddt = document.getElementById("oldDateId").value;
			var newDt = document.getElementById("priceDateId").value;
			//alert(olddt + ": " + newDt);
			
			
			if($.trim(olddt)==$.trim(newDt)){
				
				$('#priceValue').focus();
				return retVal;
			} else{
		 	
		 	var dt = document.getElementById('priceDateId').value;
			var prodid = $('#masterProductId').val();
			$.ajax({
				type :'GET',
				url : $('#contextPath').val()+"/product/checkPriceValue.htm?date="+dt+"&prodId="+prodid,
				success : function(result){
					//alert(result);
					if(result>0){
						alert('Price value already present for this date');
						
						//set todays date
						var d = new Date();
						var month = d.getMonth()+1;
						var day = d.getDate();
					 	var output = d.getFullYear() + '-' +
	 			  					(month<10 ? '0' : '') + month + '-' +			
	 			  					(day<10 ? '0' : '') + day;
						$("#priceDateId").val(output);
						$('#priceValue').val('');
						
					}
					
			  	}
			});
			}
			return retVal;
		}
		
		
		
		
			function checkRequiredVals(){
				
				if ($('#priceDateId').val().trim()=="") {
					alert("Please enter record type.");
					$('#priceDateId').focus();
			        return false;
			    }
				if ($('#priceValue').val().trim()=="") {
					alert("Please enter price.");
					$('#priceValue').focus();
			        return false;
			    }
				return true;
		}
		
		function doAdd(closePopup,action){
			//alert(closePopup+ ":" + action);
			$.ajax({
				type :'GET',
				url : $('#contextPath').val()+'/product/addOrUpdatePrice.htm',
				data:$('#addPriceForm').serialize(),
				success : function(result){
					
	            	if(closePopup==1 && action=='edit'){
	               		//alert('Record updated successfully');
	               	 bootbox.dialog({
						message: "<span class='bigger-110'>Record updated successfully</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-sm btn-primary",
								"callback": function() {
									//Example.show("Primary button");
									 location.reload(); 
								}
							}
						}
					});
	            	 
	                } else if(closePopup==1 && action=='add'){
	                	//alert('Record added successfully');
	                	 bootbox.dialog({
						message: "<span class='bigger-110'>Record added successfully</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-sm btn-primary",
								"callback": function() {
									//Example.show("Primary button");
									 location.reload();
								}
							}
						}
					});
	            	//  location.reload();
	                }  
	               	else if(closePopup==0 && action=='add'){
	               		//alert('Record added successfully');
	               		bootbox.dialog({
							message: "<span class='bigger-110'>Record added successfully</span>",
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
	               
	               		resetValues();
	               } 
		  		}
			});
		} 
	
		function resetValues(){
			/* document.getElementById("title").innerHTML="Add"; commented by suvarna*/
			var d = new Date();
			var month = d.getMonth()+1;
			var day = d.getDate();
			/* var output = (day<10 ? '0' : '') + day + '/' +
			(month<10 ? '0' : '') + month + '/' +
			d.getFullYear(); */
			 var output = d.getFullYear() + '-' +
			  (month<10 ? '0' : '') + month + '-' +			
			  (day<10 ? '0' : '') + day;
			$("#priceDateId").val(output);
			$('#priceValue').val('');
			
			$("#productPriceId").val(0);
			//$('#oldDateId').val('');
			
			
			//show add buttons
			$('#editbuttons').fadeOut('fast');
			$('#addbuttons').fadeIn('slow');
		}
		
		function updatePrice(priceId,priceDt,priceValue,prSourceId){
			$("#addnote").modal('show');	
			 
			//alert(priceDt);
			var dt = priceDt.split("/");
			var day = dt[0];
			var mn = dt[1];
			var yr = dt[2]; 
			
			var newdt = yr+"-"+mn+"-"+day;
			//alert(newdt); 
			/* document.getElementById("title").innerHTML="Edit"; commented  by suvarna*/ 
			document.getElementById("productPriceId").value = priceId;
			document.getElementById("priceDateId").value = newdt;
			document.getElementById("priceValue").value = priceValue;
			document.getElementById("oldDateId").value = newdt;
			getSource(prSourceId);
			 
			//show edit buttons
			//$('#addbuttons').fadeOut('fast');
			//$('#editbuttons').fadeIn('slow'); 
		}
		
		function changePageSize(){
			var prodid = $('#masterProductId').val();
			var prodName = $('#prodname').val();
			var searchtext=$('#searchtext').val();
		 	$("#toreload").load('${pageContext.request.contextPath}/product/price_history.htm #toreload', {
			   object: '${object}',
			   pageSize: $('#page').val(),
			   id: prodid,
			   productName: prodName,
			   searchtext:searchtext,
	
		}, function( response, status, xhr ) {
		      try{
		        //closePopupWebApp('');
		      }catch(e){
		        // closePopupWebApp('');       
		      }
		     });
		}
		//get source
		function getSource(id)
		{
			$.ajax
			({
		    	type: "GET",
		      	url:$('#contextPath').val()+'/faq/getPicklistValues.htm?codeTypeIds=83',
		      	dataType: 'json',
		      	contentType: 'application/json',
		        success:function(result)
		      	{ 		        
		        	$('#sId').empty();
		        	$(result).each(function(i, obj) {
		     		var priceSource = obj.codeValue;
		      		var priceSourceId = obj.codeValueId;
			      	if(id == priceSourceId){
			      		$('#sId').append('<option value="'+ priceSourceId+'" selected="selected">'+ priceSource + '</option>');
		      		} else{
		      			$('#sId').append('<option value="'+ priceSourceId+'">'+ priceSource + '</option>');	
		      		}
		     		});
		      	}
		   });
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
			    
		} ;   
		
	</script>
	
	
</body>
</html>
