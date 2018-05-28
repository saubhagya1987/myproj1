<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
 <link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Execution Tracker </title>
   		
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
   		
	<script>
		$(function() {
		 	availableTags = new Array();
			$( "#quickSearch" ).autocomplete({
				source: availableTags,
				open: function() { $('#div .ui-menu').width(300) }
			});
			
		
		$('.breakLine').each(function(i,obj){
			str=$(obj).html();
			str = str.replace(/newline/g, '<br>');
			$(obj).html(str);
		});
		
		$('.pagebanner').remove();
		$('.pagelinks').addClass('pagination pagination-sm');
		
	});
	</script>
	<script>
		function search(){
			if(map[$('#quickSearch').val()]=='' || map[$('#quickSearch').val()]==undefined){
				showAlertMessage1("Error",
					"Contact not found"+'\n',
					"error", doNothing);  
			return;
		}
		$('#partyId_Et').val(map[$('#quickSearch').val()]);
		document.getApDataForm.action=$('#contextPath').val()+"/et/getApDetails.htm";
		document.getApDataForm.submit();
	}
	$(document).ready(function(){
	
	$('#quickSearch').keypress(function(event){

		var keycode = (event.keyCode ? event.keyCode : event.which);
		if(keycode == '13'){
			search();
		}
		event.stopPropagation();
	});
});
	function quickSearchContacts(e){
	
		var event = window.event ? window.event : e;
		if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 || event.charCode==37 || event.charCode==38 || event.charCode==39 || event.charCode==40 )
		{		return;
		}
		if(event.keyCode==13 || event.charCode==13){
			search();
			return;
		}
		$('#common_popup_div,#shadow_div_web_app').remove();
		$.ajax({
	  	url: $('#contextPath').val()+"/et/quickSearchContacts.htm?searchString="+$('#quickSearch').val(),
	  	method:"post",
	  	success:function(result){
	  	
		map=new Object();
		availableTags = new Array();
		$( "#quickSearch" ).autocomplete({
			source: availableTags
		});
		 
	    $(result).each(function(i,obj){
			if(!$.trim(obj.panNo)=='' || !$.trim(obj.emailId)==''){
	    		availableTags.push(obj.fName+' '+obj.lName +'['+obj.panNo+' '+obj.emailId+']');
	    		map[obj.fName+' '+obj.lName +'['+obj.panNo+' '+obj.emailId+']']=(obj.partyId);
			}
			else{
				availableTags.push(obj.fName+' '+obj.lName);
				map[obj.fName+' '+obj.lName]=(obj.partyId);
			}
			
			
			 
		 }); 
	  }
	});

}

	</script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<section>
				
			<div class="">
            <div class="main-content">
              <div class="main-contnet-inner">
                <div class="page-content">
                  <div class="page-header clearfix">
                    <h1 class="pull-left" id="hdnquickSearch"></h1>
                    <div class="nav-search pull-right" id="">
                      <form class="form-search">
                        <span class="input-icon">
                        <input name="text"  type="text" id="quickSearch"  class="nav-search-input" name="searchString"  onKeyUp="quickSearchContacts(this);" placeholder="Quick Search" >	
                        
                        <i class="ace-icon fa fa-search nav-search-icon"></i></span>
                      </form>
                    </div>
                  </div>
                  <div class="container-body"> 
                    
                    
                    <!--  <input type="text" id="search" > <input type="button" value="search" onclick="clientsearch()"> -->
                    <div class="topmenu row pull-right dropdown"> 
                      <a href="<%=request.getContextPath()%>/et/getTxnSource.htm?pageId=execution" >
					<button  data-params="{}" type="button" class="btn btn-primary btn-xs createNewBtn" title="Bulk Upload Txn"> Bulk Upload Txn</button>
					</a>
                    		
                      
                    </div>
                    <div class="clearfix"></div>
                    <form method="post" name="getApDataForm">
					<input type="hidden" id="partyId_Et" name="partyId"/>
					<input type="hidden" id="fpActionPlanId" name="fpActionPlanId"/>
						<div class="jq_parent row"><div id="jqGrid_container" class="col-md-12 table-responsive tabular_break_word">
       	  							<table id="grid-table"></table>
									<div id="grid-pager"></div>
						</div></div>	
   					</form>
  
                  </div>
                  <!-- container-body --> 
                </div>
                <!-- page-content --> 
              </div>
              <!--  main-contnet-inner --> 
            </div>
            <!--main-content End  --> 
          </div>
          <!-- container End --> 
        </section>
        <!-- Center part End --> 
                	
	
	<jsp:include page="../common/footer.jsp" />

	<!-- <script type="text/javascript">
		var grid_data='${apData}';
		index=JSON.parse(grid_data);
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
					plusicon : "ace-icon fa fa-plus center bigger-110 blue",
					minusicon  : "ace-icon fa fa-minus center bigger-110 blue",
					openicon : "ace-icon fa fa-chevron-right center orange"
				},
		
				data: index,
				datatype: "local",
				height: 450,
				colNames:['FpId','Purpose','Opportunity','Amount Involved','Potential Revenue <br/> (1st Year)','Recommended Products','Investment Amount','Status','EX Start Date','Action'],
				colModel:[
						
					{name:'fpApId',index:'fpApId', width:5,hidden:true},
					{name:'purpose',index:'purpose', width:100},
					{name:'opportunity',index:'opportunity', width:190},
					{name:'amountInvolved',index:'amountInvolved', width:115},
					{name:'potentialRevenue',index:'potentialRevenue', width:120},
					{name:'recommendedProducts',index:'recommendedProducts', width:250,formatter:newLineFprmatter},
					{name:'investmentAmount',index:'investmentAmount', width:200,formatter:newLineFprmatter},
					{name:'status',index:'status', width:50},
					{name:'exStartDate',index:'exStartDate', width:130},
					{name:'action',index:'action',formatter:function(cellvalue, options,rowObject) {
					    return '<a onclick="openActionPopup('+rowObject.fpApId+')">Action</a>';
					}},
				], 
			
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,50,100,1000],
				pager : pager_selector,
				altRows: true,
				multiselect: false,
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
			
				//editurl: "/dummy.html",//nothing is saved
				autowidth: true,
				shrinkToFit:true,
				//caption: "Execution Tracker For",
				
				});
				/* var captionName='Execution Tracker For '+index[1].clientName+'<input class="col-md-7 pull-right" name="searchtext" type="text" id="quickSearch" placeholder="Quick Search" onkeyup="quickSearchContacts();">';
				$(grid_selector).jqGrid('setCaption', captionName); */
				$("#hdnquickSearch").html(" Execution Tracker For "+index[1].clientName);
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
						search: false,
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
			
				//it causes some flicker when reloading or navigating grid
				//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
				//or go back to default browser checkbox styles for the grid
				function styleCheckbox(table) {
				
				}
				
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					
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
			function openActionPopup(fpApId){
				
				$('#exedtls a').attr('href','${pageContext.request.contextPath}/et/executionDetails.htm?fpActionPlanId='+fpApId);
				$('#preprintform a').attr('href','${pageContext.request.contextPath}/et/openEtForm.htm?fpActionPlanId='+fpApId);
				$('#trackHist a').attr('href','${pageContext.request.contextPath}/et/etTrackingHistory.htm?fpActionPlanId='+fpApId);
				$('#documents a').attr('href','${pageContext.request.contextPath}/et/etDocs.htm?fpActionPlanId='+fpApId);
				$('#etNotes a').attr('href','${pageContext.request.contextPath}/et/etNotes.htm?fpActionPlanId='+fpApId);
				$('#cancelExecution a').attr('href','${pageContext.request.contextPath}/et/getExecutionStatus.htm?fpActionPlanId='+fpApId);
				
				$( ".action_dialog" ).removeClass('hide').dialog({
					resizable: false,
					modal: true,
                    width: "auto",
				});
			}
			
			function newLineFprmatter(cellvalue, options, rowObject){
				str=cellvalue;
				str = str.replace(/newline/g, '<br>');
				return str;
			}
		</script> -->
		<script type="text/javascript">
		var grid_data=${apData};
		index=grid_data;
		jQuery(function($) {
			var grid_selector = "#grid-table";
			var pager_selector = "#grid-pager";
				
			$(window).bind('resize', function() {
			    var width = $('#jqGrid_container').width();
			    $('#grid-table').setGridWidth(width);
			});
				
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
		
				data: index,
				datatype: "local",
				//width:590,
				height: '100%',
				//shrinkToFit: false,
				
				colNames:['Txn Id','Txn Date','Folio No.','Client Name','Asset Class','Product <BR/>Category','SubCategory','Product','Txn Type','Txn <br/> Amount(Rs)','Units/Qty','Price'],
				colNames:['FpId','Purpose','Opportunity','Amount Involved','Potential Revenue <br/> (1st Year)','Recommended Products','Investment Amount','Status','EX Start Date','Action'],
				colModel:[
						
					{name:'fpApId',index:'fpApId', width:5,hidden:true},
					{name:'purpose',index:'purpose'},
					{name:'opportunity',index:'opportunity'},
					{name:'amountInvolved',index:'amountInvolved'},
					{name:'potentialRevenue',index:'potentialRevenue'},
					{name:'recommendedProducts',index:'recommendedProducts',formatter:newLineFprmatter},
					{name:'investmentAmount',width:175,index:'investmentAmount',formatter:newLineFprmatter},
					{name:'status',index:'status',width:100,},
					{name:'exStartDate',index:'exStartDate',width:100,},
					{name:'action',index:'action',width:80,formatter:function(cellvalue, options,rowObject) {
					    return '<a onclick="openActionPopup('+rowObject.fpApId+')">Action</a>';
					}},
				], 
				
			
				viewrecords : true,
				rowNum:10,
				rowList:[10,20,50,100,1000],
				pager : pager_selector,
				altRows: true,
				multiselect: false,
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
			
				//editurl: "/dummy.html",//nothing is saved
				 autowidth:true,
				 shrinkToFit:false,
				//caption: "Tracking History", 
				
				});
				
			
				//$(grid_selector).jqGrid('setCaption', captionName); 
				$("#hdnquickSearch").html(" Execution Tracker For "+index[1].clientName);
				$(window).triggerHandler('resize.jqGrid');
				
				/* $(grid_selector).jqGrid('setCaption', captionName);
				$(window).triggerHandler('resize.jqGrid'); *///trigger window resize to make the grid get the correct size
				
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
						/* recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						} */
					},
					{
						//new record form
						//width: 700,
						/* closeAfterAdd: true,
						recreateForm: true,
						viewPagerButtons: false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
							.wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						} */
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
			
				//it causes some flicker when reloading or navigating grid
				//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
				//or go back to default browser checkbox styles for the grid
				function styleCheckbox(table) {
				
				}
				
				//unlike navButtons icons, action icons in rows seem to be hard-coded
				//you can change them like this in here if you want
				function updateActionIcons(table) {
					
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
		function openActionPopup(fpApId){
			
			$('#exedtls a').attr('href','${pageContext.request.contextPath}/et/executionDetails.htm?fpActionPlanId='+fpApId);
			$('#preprintform a').attr('href','${pageContext.request.contextPath}/et/openEtForm.htm?fpActionPlanId='+fpApId);
			$('#trackHist a').attr('href','${pageContext.request.contextPath}/et/etTrackingHistory.htm?fpActionPlanId='+fpApId);
			$('#documents a').attr('href','${pageContext.request.contextPath}/et/etDocs.htm?fpActionPlanId='+fpApId);
			$('#etNotes a').attr('href','${pageContext.request.contextPath}/et/etNotes.htm?fpActionPlanId='+fpApId);
			$('#cancelExecution a').attr('href','${pageContext.request.contextPath}/et/getExecutionStatus.htm?fpActionPlanId='+fpApId);
			
			$( ".action_dialog" ).removeClass('hide').dialog({
				resizable: false,
				modal: true,
                width: "auto",
			});
		}
		
		function newLineFprmatter(cellvalue, options, rowObject){
			str=cellvalue;
			str = str.replace(/newline/g, '<br>');
			return str;
		}
			
			
		</script>
		
		<div class="common_dialog hide action_dialog">
			<table class="table table-bordered table-striped" >
        		<tbody>
        			<tr>
	            		<th class="thead">Action List</th>
	            		<th class="thead">Document List</th>
	          		</tr>
	          		<tr>
	            		<td id="exedtls">
	            			<i class=""> </i>
	            			<a href="#">
	            				<span class="">Execution Details</span>
	            			</a>
	            		</td>
	            		<td id="preprintform">
	            			<i class=""></i>
	            			<a><span class="">Preprinted Form</span></a> 
	            		</td>
	          		</tr>
	          		<tr>
	            		<td id="trackHist">
	            			<i class="" ></i>
	            			<a>
	            				<span class="">Tracking History</span>
	            			</a>
	            		</td>
	            		<td id="documents">
	            			<i class=""></i>
	            			<a>
	            				<span class="">Document</span>
	            			</a>
	            		</td>
	          		</tr>
	          		<tr>
	            		<td id="etNotes">
	            			<i class=""></i> 
	            			<a>
	            				<span class="">Notes</span>
	            			</a>
	            		</td>
	          
	          		</tr>
					<tr>
	            		<td id="cancelExecution">
	            			<i class=""></i> 
	            			<a>
	            				<span class="">Cancel Execution</span>
	            			</a>
	            		</td>
	          
	          		</tr>
	        	</tbody>
	        </table>
		</div>
	</body>
</html>
