<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>  
<html lang="en"><head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">  
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Search</title> 
<style type="text/css">
.imgicon{
 background:url(../images/allCommon-Icons.png) no-repeat 0px -1129px; 
 padding-right:18px; padding-top: 4px;}
</style>
</head> 
<body>
	<input type="hidden" id="searchtextval" value="<%=request.getAttribute("serachText")%>">
  	<input type="hidden" name="errortoshow" id="errortoshow" value="<%=request.getParameter("error")%>">
  	<input type="hidden" name="buId" id="buId" value="${sessionScope.userSession.buId}">
   
<jsp:include page="../common/header.jsp" />  
<jsp:include page="../common/common_popup.jsp" />

<section> 
			<div class="container-body">
				
				<ul class="pagination pagination-sm"></ul>	
				<div class="pull-right">
					
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
				
					</div>
				
			</div> 
		
	</section>


<%-- <!--css popup window start 1-->
 <section> 
      
    <div class="container white">
    	<div class="container-head">
    	  <div class="col-md-12" style="text-align: right;"><!-- accordion start-->
           
           	  <div class="accordion pull-left col-md-12" id="accordFundSel">
                <div class="accordion-group">
                  <div class="pull-left fundtool_left_col_head "> <span style="float:left;">Search Result for <%=request.getAttribute("serachText")%> </span> </div>
                  
                </div>   
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
 
               
               <!-- accordion End -->
            </div >
          </div >
          
          
  	  <div class="container-body">
        <!-- center -->
        
        
<!--         <ul class="pagination pagination-sm"> -->
<!--   <li  class="disabled"><a href="#">&laquo;</a></li> -->
<!--   <li><a href="#">1</a></li> -->
<!--   <li><a href="#">2</a></li> -->
<!--   <li><a href="#">3</a></li> -->
<!--   <li><a href="#">4</a></li> -->
<!--   <li><a href="#">5</a></li> -->
<!--   <li><a href="#">&raquo;</a></li> -->
<!-- </ul>	 -->
<!--<div class="topmenu">
        	
<input data-params="{}" type="button" class="dbtn createNewBtn" value="  Add " title="New Opportunities" alt="New Opportunities">
<input data-params="{}" type="button" class="dbtn importNewBtn" value="  Delete"  title="Import Opportunities" alt="Import Opportunities">
<input data-params="{}" type="button" class="dbtn createNewBtn" value="  Edit " title="Bulk Activation" alt="Bulk Activation">
<input data-params="{}" type="button" class="dbtn createNewBtn" value="  More Action" title="More Action" alt="More Action">
 </div>--> 
 

	<div class="table-responsive" id="display_table_lead" style="border:none;">
	  <div id="toreload">
		
		<display:table name="searchResultDatas" uid="objPortalUser" class="table table-hover table-bordered table-striped" requestURI="#" sort="list" pagesize="${pagesize}" id="data" export="false">	                        
			<display:column class="" style="width:30px;" sortable="true">				
			<c:choose>
			   <c:when test="${data.type=='Partner'}">
			    <i class="selficon" title="${data.type}"></i> 
			    </c:when> 
			    <c:when test="${data.type=='Opportunity'}">
			    <i class="opportunityicon" title="${data.type}"></i>
			    </c:when>
			    <c:when test="${data.type=='Premium Client'}">
			    <i class="pclienticon" title="${data.type}"></i> 
			    </c:when>
			    <c:when test="${data.type=='Client'}" >
			    <i class="clienticon" title="${data.type}"></i>
			    </c:when>
			    <c:when test="${data.type=='Note'}" >
			    <i class="noteicon"></i>
			    </c:when>  
	    	    <c:when test="${data.type=='PDF'}" >
			    	<i class="outputreport_icon"></i>
			    </c:when> 
			    <c:when test="${data.type=='XLS'}" >
			    	<i class="excelicon"></i> 
			    </c:when>
			    <c:when test="${data.type=='PPT'}" >
			    	<i class="ppticon"></i>
			    </c:when>
			    <c:when test="${data.type=='PNG'} || ${data.type=='JPG'} || ${data.type=='BMP'} " >
			    	<i class="imgicon"></i>
			    </c:when>
			     <c:otherwise>
			    	<i class="formlcon"></i>
			    </c:otherwise> 
			 </c:choose>    
			</display:column> 
			    
			      
 	
 			<display:column  class="" style="" title="Name" sortable="true">
 			    
 			  
 				<c:choose>   
 				<c:when test="${data.type=='Partner'}"> 
 					<a href="<%=request.getContextPath()%>/partnersp/loadPartner.htm?buId=${sessionScope.userSession.buId}&userId=${data.id}">${data.name}</a>
 					<a href="<%=request.getContextPath()%>/partnersp/loadPartner.htm?buId=${sessionScope.userSession.buId}&userId=${data.id}&searchText='+${data.name}+'">${data.name}</a>	
			    </c:when>         
			    <c:when test="${data.type=='Opportunity'}">    
			    	<a href="<%=request.getContextPath()%>/partnersp/getOpportunitiesList.htm?partyId=${data.id}">${data.name}</a>  
			    	<a  href="<%=request.getContextPath()%>/opportunityprofile.htm?partyId=${data.id}">${data.name}</a>	
			    </c:when>
			    <c:when test="${data.type=='Premium Client'}">    
			    	<a href="<%=request.getContextPath()%>/partnersp/getClientList.htm?partyId=${data.id}">${data.name}</a>	
			    <a href="<%=request.getContextPath()%>/loginonbehalf/getUserInfo.htm?userName=${data.name}&recordTypeId=14004&GOTO=profile">${data.name}</a>
			    </c:when>  
			    <c:when test="${data.type=='Client'}" >         
			    	<a href="<%=request.getContextPath()%>/partnersp/getClientList.htm?partyId=${data.id}">${data.name}</a>	
			    	<a href="<%=request.getContextPath()%>/partnersp/loadPartner.htm?buId=${sessionScope.userSession.buId}&userId=${data.id}&searchText='+${data.name}+'">${data.name}</a>	
			    	href='"+contextPath+"/loginonbehalf/getUserInfo.htm?userName="+userName+"&recordTypeId="+recordTypeId+"&GOTO=profile 	
			    	<a href="<%=request.getContextPath()%>/loginonbehalf/getUserInfo.htm?userName=${data.name}&recordTypeId=14004&GOTO=profile">${data.name}</a>
			    	    
			    </c:when>              
			    <c:when test="${data.type=='Note'}" >    
			    	<span>${data.name}</span>	                        
			    </c:when>
			    <c:when test="${data.type=='PDF'}" >
			    	<a onclick="downloadAttachment(${data.id})">${data.name}</a>	  
			    </c:when>
			    <c:when test="${data.type=='XLS'}" > 
			    	<a onclick="downloadAttachment(${data.id})">${data.name}</a>	
			    </c:when>  
			    <c:when test="${data.type=='PPT'}" >
			    	<a onclick="downloadAttachment(${data.id})">${data.name}</a>	
			    </c:when>
			    <c:when test="${data.type=='PNG'} || ${data.type=='JPG'} || ${data.type=='BMP'} " >
			    	<a onclick="downloadAttachment(${data.id})">${data.name}</a>	
			    </c:when>
			     <c:otherwise>
			    	<a onclick="downloadAttachment(${data.id})">${data.name}</a>	
			    </c:otherwise> 
	   		</c:choose> 
 							   
			</display:column> 
        
        	<display:column property="details" class="" style="" title="Matching Details" sortable="true">				
			</display:column>
			
                
        </display:table>
<!--         <div class="topmenuleft" > -->
<!-- 		  <ul> -->
<!-- 		  	<li> Export options: </li> -->
<!-- 		    <li> <a onclick="getCSV()" title="Export in CVS" alt="Export in CVS"><i class="cvsicon"></i></a></li> -->
<!-- 		    <li><a onclick="getXLS()" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li> -->
<!-- 		  </ul> -->
<!-- 	 	</div> -->
        
        <!-- Center-->    
     </div> 
     
    </div> 

<div class="col-sm-7">
<div class="topmenuleft" >
 <div  class="customDropdown">
       <span >Page Size:</span>&nbsp;
     <select  type="button" name="pageSize" id="page" onchange="pagesizeurl()">
         
           <option value="10" <c:if test="${size==10}"> selected="selected" </c:if>>10</option>
           <option value="20" <c:if test="${size==20}"> selected="selected" </c:if>>20</option>
               <option value="50" <c:if test="${size==50}"> selected="selected" </c:if>>50</option>
               <option value="500" <c:if test="${size==500}"> selected="selected" </c:if>>500</option> 
               <option value="10000" <c:if test="${size==10000}"> selected="selected" </c:if>>Show All&nbsp;</option>
   </select> 
     </div>	 
</div> 
</div> 


 

</div>
<!--      </div>      -->
               	
</section>    --%>        	
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />
 <form id="downloadAttachmentForm" method="post" action="<%=request.getContextPath()%>/common/downloadDocument.htm">
		<input type="hidden" name="docId" id="documentIdToDownload"> 
		<input type="hidden" name="searchtextId" id="searchtextvalId" value="<%=request.getAttribute("serachText")%>""> 
	</form>   
<script>  
   

function pagesizeurl(){
	  var pageSize=$('#page').val();  
	 // window.location.href= $('#contextPath').val()+'/common/getSearchList.htm?pageSize='+pageSize;
	  setResult('');
	 }
  
function setResult(filterRuleCriteria){
	  openPopupWebApp('centerLoadingImage', 25, 35);
	  var pageval =  $('#page').val(); 
	 
	  $("#toreload").load('${pageContext.request.contextPath}/common/getSearchList.htm #toreload', {
	   object: '${object}',
	   pageSize: $('#page').val(),//'${pageSize}',  
	   serachText : $('#searchtextval').val(),
	   filterRule: filterRuleCriteria
	     }, function( response, status, xhr ) {
	      try{
	        	oppReady()
	        //addPageSize(filterRuleCriteria,pageval);
	        //$('#hfilterRule').val(filterRuleCriteria);
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
	  
	var err =$('#errortoshow').val();
		if(err == "true"){  
			alert('File Not Found !'); 
			window.location.href= $('#contextPath').val()+'/common/getSearchList.htm?serachText='+$('#searchtextval').val();
			   
		}
 
});
</script> 
		<script type="text/javascript">
			var grid_data = ${searchResultDatas};
			
			
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
					
			  
			
					data: grid_data,
					datatype: "local",
					height: 250,
					colNames:['Type','Name','Details'],
					colModel:[ 
   
							 {name:'type', index:'type',width:60,formatter:function(cellvalue, options,rowObject) {
							var html='';  
							if(rowObject.type=='Partner')  
								html+= '<i class="fa fa-user" title="Partner"></i><br/><br/>';
						    if(rowObject.type=='Opportunity')  
						    	html+= '<i class="fa fa-users" title="Opportunity"></i><br/><br/>';
						    if(rowObject.type=='Premium Client')   
						    	html+= '<i class="fa fa-user-plus" title="Premium Client"></i><br/><br/>';
						    if(rowObject.type=='Client') 
						    	html+= '<i class="fa fa-user-plus" title="Client"></i><br/><br/>';
						   	if(rowObject.type=='Note') 
							   	html+= '<i class="fa fa-file-text-o" title="Note"></i><br/><br/>';
							if(rowObject.type=='PDF')
							   	html+= '<i class="fa fa-file-pdf-o" title="PDF"></i><br/><br/>';
							if(rowObject.type=='XLS')
							   	html+= '<i class="fa fa-file-excel-o" title="XLS"></i><br/><br/>';
							if(rowObject.type=='PPT')
							   	html+= '<i class="fa fa-file-powerpoint-o" title="PPT"></i><br/><br/>';
							if(rowObject.type=='PNG' ||rowObject.type=='JPG' ||rowObject.type=='BMP')
							   	html+= '<i class="fa fa-file-image-o" title="Image"></i><br/><br/>';
							 if(rowObject.type !='Partner' && rowObject.type !='Opportunity' && rowObject.type !='Premium Client' && rowObject.type !='Client' && rowObject.type !='Note' && rowObject.type !='PDF' && rowObject.type !='XLS' && rowObject.type !='PPT' && rowObject.type !='PNG'&& rowObject.type !='JPG'&& rowObject.type !='BMP')
							   		html+= '<i class="fa fa-file-o" title="other"></i><br/><br/>'; 
						    return html;   
						}},         
						     
						/* {name:'name',index:'name', width:60,} */ 
						{ name: 'name', index: 'name', width: 50, align: 'center', sortable: false, formatter: FormatHistory},  
						{name:'details',index:'details', width:60}
					],  
			   
					
					
					viewrecords : true,
					rowNum:30,
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
				function FormatHistory(cellValue, options, rowObject) {
				    var id = rowObject.id; // Get from the OnSelect event of jqGrid.
				  	var buid =$('#buId').val();  
				    var type = rowObject.type;
				    var name = rowObject.name;
				    var imageHtml = ''; 
				    
				    var PartnerhistoryURL = "<%=request.getContextPath()%>/loginonbehalf/getPartnerInfo.htm";
				    var OpphistoryURL = "<%=request.getContextPath()%>/loginonbehalf/getUserInfo.htm";
				    var PremiumClhistoryURL = "<%=request.getContextPath()%>/loginonbehalf/getUserInfo.htm";
				    var ClienthistoryURL = "<%=request.getContextPath()%>loginonbehalf/getUserInfo.htm";
				    
				    if(type == 'Partner'){     
				    
				    imageHtml = '<a href="' + PartnerhistoryURL + '?userName=' + rowObject.username +'&GOTO=profile">'+name+'</a>'; 
				    return imageHtml; 
				    }
				    if(type == 'Opportunity'){     
					   imageHtml = '<a href="' + OpphistoryURL + '?userName=' + rowObject.username +'&recordTypeId=14005&GOTO=profile">'+name+'</a>'; 
					    return imageHtml; 
					} 
				    if(type == 'Premium Client'){     
				    	imageHtml = '<a href="' + PremiumClhistoryURL + '?userName=' + rowObject.username +'&recordTypeId=14006&GOTO=profile">'+name+'</a>';  
						    return imageHtml; 
						}  
				    if(type == 'Client'){     
				    	imageHtml = '<a href="' + ClienthistoryURL + '?userName=' + rowObject.username +'&recordTypeId=14006&GOTO=profile">'+name+'</a>';  
						    return imageHtml; 
						} 
				    if(type == 'Note'){     
				    	imageHtml = '<a >'+name+'</a>';  
						    return imageHtml; 
						} 
				    if(type == 'PDF'){      
				    	imageHtml = '<a onclick="downloadAttachment('+id+'})">'+name+'</a>';  
						    return imageHtml; 
						}   
				    if(type == 'XLS'){     
				    	imageHtml = '<a onclick="downloadAttachment('+id+'})">'+name+'</a>';  
					    return imageHtml; 
						} 
				    if(type == 'PPT'){     
				    	imageHtml = '<a onclick="downloadAttachment('+id+'})">'+name+'</a>';  
					    return imageHtml; 
						}  
				    if(type == 'PNG' || type == 'JPG' || type == 'BMP' ){     
				    	imageHtml = '<a onclick="downloadAttachment('+id+'})">'+name+'</a>';  
					    return imageHtml; 
						}
						else {
							imageHtml = '<a onclick="downloadAttachment('+id+'})">'+name+'</a>';  
						    return imageHtml;   
						}
				}  
				 
			
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
