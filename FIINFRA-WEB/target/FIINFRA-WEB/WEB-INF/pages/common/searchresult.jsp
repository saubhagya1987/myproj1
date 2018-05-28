<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Search</title>

<style type="text/css">
.imgicon{
 background:url(../images/allCommon-Icons.png) no-repeat 0px -1129px; 
 padding-right:18px; padding-top: 4px;}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/common_popup.jsp" />
<!--css popup window start 1-->
 <section>
    	<div class="container-head">
    	  <div class="col-md-12"><!-- accordion start-->
           <div class="page-header clearfix">
            <h1>Search Result for : <span class="strong">${param.serachText}</span></h1>
            
          </div>
           	  <!--<div class="accordion pull-left col-md-12" id="accordFundSel">
                <div class="accordion-group">
                  <div class="pull-left fundtool_left_col_head "> <span style="float:left;">Search Result for : <span style="font-weight: bold;">${param.serachText}</span></span> </div>
                  
                </div>
           	   
              </div>-->
           	  <!-- accordion  END -->
 
              
               <!-- accordion End -->
            </div >
          </div >
          
          
  	  <div class="container-body clearfix">
        
	  <div class="jq_parent row"><div class="tabular_break_word col-md-12"><table id="grid-table"></table>
		<div id="grid-pager"></div></div></div>	        
        <!-- Center-->    
      </div>
               	
</section>           	
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />
 <form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload">
	</form>
<script>
function pagesizeurl(){
	var pageSize=$('#page').val();	
	setResult('');	
}

function setResult(filterRuleCriteria){
	  openPopupWebApp('centerLoadingImage', 25, 35);
	  var pageval =  $('#page').val();
	  $("#toreload").load('${pageContext.request.contextPath}/common/getSearchList.htm #toreload', {
	   object: '${object}',
	   pageSize: $('#page').val(),//'${pageSize}', 
	   filterRule: filterRuleCriteria
	     }, function( response, status, xhr ) {
	      try{
	        	oppReady()
	        closePopupWebApp('');
	      }catch(e){
	         closePopupWebApp('');       
	      }
	     });
}



function enableTf(){
$("#commect1, #file, #link").show();	


}
function enableTf1(){
$("#commect2, #file2, #link2").show();	


}
</script>

<script type="text/javascript">
			var grid_data='${searchResultDatas}';
			//alert('Hi--------'+grid_data);
			index=JSON.parse(grid_data);
						
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
					colNames:[' ','Name','Matching Details'],
					colModel:[
					/*{name:'myac',index:'', width:80, fixed:true, sortable:false, resize:false,
							formatter:'actions', 
							formatoptions:{ 
								keys:true,
								//delbutton: false,//disable delete button
								
								delOptions:{recreateForm: true, beforeShowForm:beforeDeleteCallback},
								//editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
							}
						},*/
						{name:'type',index:'type',formatter:function(cellvalue, options,rowObject) {
							var html='';
						    if(rowObject.type=='Opportunity')
						    	html+= '<i class="fa fa-star size-16 padwest2" title="Opportunity"></i><br/><br/>';
						    if(rowObject.type=='Premium Client')
						    	html+= '<i class="icon-premium_client size-16 padwest2" title="Premium Client"></i><br/><br/>';
						    if(rowObject.type=='Client')
						    	html+= '<i class="icon-client size-16 padwest2" title="Client"></i><br/><br/>';
						   	if(rowObject.type=='Note')
							   	html+= '<i class="fa fa-file-text-o size-16 padwest2" title="Note"></i><br/><br/>';
							if(rowObject.type=='PDF')
							   	html+= '<i class="fa fa-file-pdf-o size-16 padwest2" title="PDF"></i><br/><br/>';
							if(rowObject.type=='XLS')
							   	html+= '<i class="fa fa-file-excel-o size-16 padwest2" title="XLS"></i><br/><br/>';
							if(rowObject.type=='PPT')
							   	html+= '<i class="fa fa-file-powerpoint-o size-16 padwest2" title="PPT"></i><br/><br/>';
							if(rowObject.type=='PNG' ||rowObject.type=='JPG' ||rowObject.type=='BMP')
							   	html+= '<i class="fa fa-file-image-o size-16 padwest2" title="Image"></i><br/><br/>';
							else
								html+= '<i class="fa fa-file size-16 padwest2" title="Image"></i><br/><br/>';
						    return html;
						}},
						{ name: 'name', index: 'name',sortable: false, formatter: FormatHistory},
// 						{name:'name',index:'name', width:242,},
						{name:'details',index:'details',}
					], 
			
					viewrecords : true,
					rowNum:10,
					rowList:[10,20,50,100,1000],
					pager : pager_selector,
					altRows: true,
				
			        multiboxonly: true,
								
					editurl: "/dummy.html",//nothing is saved
			
					autowidth:true,
		            shrinkToFit:true,	
					scrollOffset:0,
                    height:'100%',
					width:'100%',
					
						
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

						recreateForm: true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
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
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
					
					form.find('input[name=stock]').addClass('ace ace-switch ace-switch-5').after('<span class="lbl"></span>');
							   //don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
			
							
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
				
				function FormatHistory(cellValue, options, rowObject) {
					 var id = rowObject.id; // Get from the OnSelect event of jqGrid.
					  	var buid =$('#buId').val();  
					    var type = rowObject.type;
					    var name = rowObject.name;
					    var imageHtml = ''; 
					    
					    var opportunityURL = "<%=request.getContextPath()%>/opportunityprofile.htm";
					    var premiumClientURL = "<%=request.getContextPath()%>/clientprofile.htm";
					    var clientURL = "<%=request.getContextPath()%>/clientprofile.htm";
					    
					    
					    if(type == 'Opportunity'){     
						   imageHtml = '<a  href="' + opportunityURL +'?partyId=' + rowObject.id +'">'+name+'</a>';	
						    return imageHtml; 
							} 
					    if(type == 'Premium Client'){     
					    	imageHtml = '<a  href="' + premiumClientURL +'?partyId=' + rowObject.id +'">'+name+'</a>'; 
					    	return imageHtml;
							}  
					    if(type == 'Client'){     
					    	imageHtml = '<a  href="' + clientURL +'?partyId=' + rowObject.id +'">'+name+'</a>';  
							    return imageHtml; 
							} 
					    
					    if(type == 'Note'){     
					    	imageHtml = '<a >'+name+'</a>';  
							    return imageHtml; 
							} 
					    if(type == 'PDF'){      
					    	imageHtml = '<a onclick="downloadAttachment('+id+')">'+name+'</a>';  
							    return imageHtml; 
							}   
					    if(type == 'XLS'){     
					    	imageHtml = '<a onclick="downloadAttachment('+id+')">'+name+'</a>';  
						    return imageHtml; 
							} 
					    if(type == 'PPT'){     
					    	imageHtml = '<a onclick="downloadAttachment('+id+')">'+name+'</a>';  
						    return imageHtml; 
							}  
					    if(type == 'PNG' || type == 'JPG' || type == 'BMP' ){     
					    	imageHtml = '<a onclick="downloadAttachment('+id+')">'+name+'</a>';  
						    return imageHtml; 
							}
							else {
								imageHtml = '<a onclick="downloadAttachment('+id+')">'+name+'</a>';  
							    return imageHtml;   
							}
				
				}  
				
			
				
				
				
				$(document).one('ajaxloadstart.page', function(e) {
					$(grid_selector).jqGrid('GridUnload');
					$('.ui-jqdialog').remove();
					
				});
			});					
</script>


<script>
$(document).ready(function(){
  $("#user").click(function(){
  $("#usermenu").slideToggle();
	});
	
	
	$("#Help").click(function(){
  $("#HelpMenu").slideToggle();
	});
	
	 $("#Contact").click(function(){
  $("#ContactMenu").slideToggle();
	});
	
});

function viewOpportunityProfileDetails(partyId){
	//alert(partyId);
	window.location.href= $('#contextPath').val()+'/opportunityprofile.htm?partyId='+partyId;
}
</script> 
</body>
</html>