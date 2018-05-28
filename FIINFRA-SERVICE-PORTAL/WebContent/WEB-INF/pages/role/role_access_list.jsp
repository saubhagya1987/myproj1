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
<title>Role Access List</title>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	<%HttpSession hes=request.getSession();%>
	<input id="contextPath" type="hidden" name="contextPath" value="<%=request.getContextPath()%>" />
	<!--css popup window start 1-->
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width: 450px; height: 380px; top: 100px"
		id="popUpDiv">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpDiv')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>

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
	<div style="display: none;" id="blanket"></div>


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
	<!--breadcrum Menu Start-->
	<!-- </div>
		</div> -->

	<!-- Center part start -->
	<section >
		
			<div class="container-head">
				<div class="col-md-12" style="text-align: right;">
					<!-- accordion start-->

					<div class="accordion pull-left col-md-12" id="accordFundSel">
						<div class="accordion-group">
						<div class="page-header">
							<h1 class="pull-left">Role Access List for ${memberName} <%if(request.getParameter("memberName")!=null){%><%=(String)request.getParameter("memberName")%><%}%></h1>
                       	    <div class="clearfix"></div>
                         </div>
                        				
							<!-- accordion-body END -->
						</div>
						<!-- accordion-group END -->
					</div>
					<!-- accordion  END -->


					<!-- accordion End -->
				</div>
			</div>
			<div class="container-body" style="margin-top: 0px;">
				<!-- center -->
				
   						
				 <form name="abcform" id="abc" method="post" action="<%=request.getContextPath()%>/rolelist/roleAccessList.htm ">
   					<input type="hidden" name="memberName" id="memberName"  />	
					<input type="hidden" name="roleId" id="roleId"  /> 
					<input type="hidden" name="sourceId" id="sourceId" /> 
   						<div class="form-group">
					
						<label class="control-laabel col-xs-12 col-sm-2 no-padding-right" for="SelectSourceSystem:">Select Source System:<span class="red">*</span></label>
						<div class="col-xs-12 col-sm-3">														 
 			          	<select name="sourceSystemId" class="form-control" id="sourceSysId" onchange="changeDropDown();">
								<c:forEach var="item" items="${sourceList}">
	                 				<option value="${item.sourceSystemId}" <c:if test="${item.sourceSystemId==sourceId}"> selected="selected" </c:if> >${item.sourceSystemName}</option>
	                 			</c:forEach>
						</select>
						</div>					
  						</div>     
   </form>
					<div class="clearfix"></div>
					
						
				<div class="pull-right">								
					<button id="SPsaveroleaccessLink" class="btn btn-sm btn-primary" onClick="updateAccessList();"><i class='ace-icon fa fa-database'></i>Save</button>
					<button id="SPbackroleaccessLink" class="btn btn-sm btn-primary" onClick="goback();">Back</button>                 										
				<div class="hr-12"></div>	
				</div>
					<div class="clearfix"></div>
								
				<div class="table-responsive" id="display_table_lead" style="border: none;">
					<div id="toreload">

				<table id="grid-table"></table>

		  		<div id="grid-pager"></div>

						<!-- Center-->
					</div>
				</div>
				
					<div class="clearfix"></div>
					
					<div class="pull-left">
     				 <div class="hr-12"></div>
     				 <div class="topmenuleft margin_5px" >

						<span>Export options:</span>
							<a href="<%=request.getContextPath()%>/rolelist/roleAccessListExport.htm?roleId=${roleId}&roleName=${memberName}&sourceId=${sourceId}&type=CSV"
								title="Export in CSV" alt="Export in CSV">	 <i class="fa fa-file-excel-o bigger-140"></i></a>
							<a href="<%=request.getContextPath()%>/rolelist/roleAccessListExport.htm?roleId=${roleId}&roleName=${memberName}&sourceId=${sourceId}&type=excel"
							title="Export in Excel" alt="Export in Excel" >
										 <i class="fa fa-file-excel-o bigger-140"></i>
							</a>
							<!--     <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li> -->
						
					</div>
					</div>				
								
				<!-- <div class="pull-right">
				<div class="hr-12"></div>				
					<button id="SPsaveroleaccessLink" class="btn btn-sm btn-primary" onClick="updateAccessList();"><i class='ace-icon fa fa-database'></i>Save</button>
					<button id="SPbackroleaccessLink" class="btn btn-sm btn-primary" onClick="goback();">Back</button>                 										
				</div> -->    
				
		

</div>
	</section>
	<!-- Center part End -->

	<footer>
		<jsp:include page="../common/footer.jsp" />
		<input type="hidden" name="confirmupdate" id="confirmupdate">
	</footer>
	<script>
	
	
		function addNote() {

			$("#addnote").show();
			$("#deletenote, #editnote").hide();
			$("#popUpAlertaddnote").css('height', '420px')
			$("#popUpAlertaddnote").css('width', '650px')
		}

		function deleteNote() {

			$("#deletenote").show();
			$("#addnote, #editnote").hide();
			$("#popUpAlertaddnote").css('height', '400px')
			$("#popUpAlertaddnote").css('width', '400px')

		}
		function editNote() {

			$("#editnote").show();
			$("#addnote, #deletenote").hide();
			$("#popUpAlertaddnote").css('height', '420px')
			$("#popUpAlertaddnote").css('width', '650px')

		}
		function biz() {
			$("#biz").show();
			$("#user, #role, #city").hide();

		}
		function user() {
			$("#user").show();
			$("#biz, #role, #city").hide();

		}
		function role() {
			$("#role").show();
			$("#biz, #user, #city").hide();
		}

		function city() {
			$("#city").show();
			$("#biz, #user, #role").hide();
		}

		function biz1() {
			$("#biz1").show();
			$("#user1, #role1, #city1").hide();

		}
		function user1() {
			$("#user1").show();
			$("#biz1, #role1, #city1").hide();

		}
		function role1() {
			$("#role1").show();
			$("#biz1, #user1, #city1").hide();
		}

		function city1() {
			$("#city1").show();
			$("#biz1, #user1, #role1").hide();
		}

		function goback() {
			//location.href="loadrole.htm";
			history.back();
		}
	</script>

	<script type="text/javascript">
		
	//select all checkbox
	$(document).ready(function() {
		$('#selecctall').click(function(event) { //on click 
			if (this.checked) { // check select status
				$('.checkbox1').each(function() { //loop through each checkbox
					this.checked = true; //select all checkboxes with class "checkbox1"               
				});
			} else {
				$('.checkbox1').each(function() { //loop through each checkbox
					this.checked = false; //deselect all checkboxes with class "checkbox1"                       
				});
			}
		});
	});
	

	$( document ).ready(function() {
		 var getrolename='<%=hes.getAttribute("setattrrolename")%>';
		 var member_name='${memberName}';
		 //alert(""+member_name);
		 var memberrole_id='${roleId}';
		 //alert(""+memberrole_id);
		 if(member_name==null||member_name==''){
			 if(getrolename==null||getrolename==''||getrolename=='null'){
			 document.getElementById("memberName").value='<%=hes.getAttribute("setattrmembername")%>'; 
			 
			 }else{			 
		 		document.getElementById("memberName").value='<%=hes.getAttribute("setattrrolename")%>'; 
		 		  }		 
			 
		 }else{
			 document.getElementById("memberName").value='${memberName}'; 
		 }
		if(memberrole_id==null||memberrole_id==0||memberrole_id==''){
			 
			 document.getElementById("roleId").value='<%=hes.getAttribute("setattrroleid")%>'; 
			 
		 }else{
			 document.getElementById("roleId").value='${roleId}'; 
		 }
		
		var ssid= $('#sourceSysId').val();
		document.getElementById("sourceId").value =ssid;
		//alert(ssid);
		
	});
	
	 function changeDropDown(){
		// alert("hh");
			var ssid= $('#sourceSysId').val();
			document.getElementById("sourceId").value =ssid;
			//alert(ssid);
		 $("#searcht").val('');
		 var getrolename='<%=hes.getAttribute("setattrrolename")%>';
		 var member_name='${memberName}';
		// alert(""+member_name);
		 var memberrole_id='${roleId}';
		 //alert(""+memberrole_id);
		 if(member_name==null||member_name==''){
			 if(getrolename==null||getrolename==''||getrolename=='null'){
				 document.getElementById("memberName").value='<%=hes.getAttribute("setattrmembername")%>'; 
				 
			 }else{			 
			 document.getElementById("memberName").value='<%=hes.getAttribute("setattrrolename")%>'; 
			 }
		 }else{
			 document.getElementById("memberName").value='${memberName}'; 
		 }
		if(memberrole_id==null||memberrole_id==0||memberrole_id==''){
			 
			 document.getElementById("roleId").value='<%=hes.getAttribute("setattrroleid")%>'; 
			 
		 }else{
			 document.getElementById("roleId").value='${roleId}'; 
		 }
		
		/*  document.getElementById("sourceId").value=${memberName}; 
		 document.getElementById("roleId").value=${roleId}; */
		 document.getElementById("abc").submit();
	   }
	 
	 
	
		function getAccessRoleListForSource() {  
			var sourceId1 = $('#sourceSysId').val();
			var roleId1 = $('#roleId').val();
			var memberName = $('#memberName').val();
			var searchtext=$('#searchtext').val();	 
		//alert(sourceId1);	alert(roleId1);	alert(memberName);	alert(searchtext);
			//alert("Source Id: "+ sourceId1 + " " + "Role Id:"+ roleId1 + " " + "Search Text : " +searchtext );
			/* window.location.href = $('#contextPath').val()
					+ '/rolelist/roleAccessList.htm?sourceId=' + sourceId1
					+ '&roleId=' + roleId1 + '&roleName=' + memberName; */
			$("#toreload").load('${pageContext.request.contextPath}/rolelist/roleAccessList.htm #toreload', {
				   object: '${object}',
				   //pageSize: $('#page').val(),
				   sourceId: sourceId1,
				   roleId: roleId1,
				   roleName: memberName,
				   searchtext:searchtext,
				   
				   

			}, function( response, status, xhr ) {
			      try{
			        
			        $('#searchtext').val('');
			        $('#selecctall').click(function(event) { //on click 
						if (this.checked) { // check select status
							$('.checkbox1').each(function() { //loop through each checkbox
								this.checked = true; //select all checkboxes with class "checkbox1"               
							});
						} else {
							$('.checkbox1').each(function() { //loop through each checkbox
								this.checked = false; //deselect all checkboxes with class "checkbox1"                       
							});
						}
					});
			        
			        $("#csvExp").attr("href", "${pageContext.request.contextPath}/rolelist/roleAccessListExport.htm?roleId="+roleId1+"&roleName="+memberName+"&sourceId="+sourceId1+"&type="+'CSV');
			        $("#excelExp").attr("href", "${pageContext.request.contextPath}/rolelist/roleAccessListExport.htm?roleId="+roleId1+"&roleName="+memberName+"&sourceId="+sourceId1+"&type="+'excel');
			        //closePopupWebApp('');
			      }catch(e){
			        // closePopupWebApp('');       
			      }
			     });
		}

		

		function updateAccessList() {
			var selectedlvals = [];
			$('input:checkbox[id=chkdeleteselect]:checked').each(function() {
				selectedlvals.push($(this).val());
			});
			//alert('Selected Checkbox values are: ' + selectedlvals);
			if (selectedlvals == "") {
				 bootbox.dialog({
						message: "<span class='bigger-110'>Please select at least one item</span>",
						buttons: 			
						{
							"click" :
							{
								"label" : "OK!",
								"className" : "btn-sm btn-primary",
								"callback": function() {
									
								}
							}
						}
					});
				//alert('Please select at least one item');
				return false;
			} else {
				var sourceId2 = $('#sourceSysId').val();
				var roleId2 = $('#roleId').val();
				//alert(roleId2);
				$.ajax({
							type : 'GET',
							url : $('#contextPath').val()+ "/rolelist/saveNewRoleAccessList.htm?selectedlvalz="+selectedlvals+'&roleId='+roleId2+'&sourceId='+sourceId2,
							dataType : 'json',
							contentType : 'application/json',
							success : function(result) {
								 bootbox.dialog({
										message: "<span class='bigger-110'>Records updated successfully</span>",
										buttons: 			
										{
											"click" :
											{
												"label" : "OK!",
												"className" : "btn-sm btn-primary",
												"callback": function() {
													 location.reload();
													// resetval();
												}
											}
										}
									});
							/* 	alert('Records updated successfully.');
								location.reload(); */
							}
						});
			}
			
		};

	</script>
	
	<script type="text/javascript">
			var grid_data='${roleAccessList}';
			index=JSON.parse(grid_data);
			
		//alert('Hi..........'+grid_data);
			
			

			var subgrid_data = 
			[
			 {id:"1", name:"sub grid item 1", qty: 11},
			 {id:"2", name:"sub grid item 2", qty: 3},
			 {id:"3", name:"sub grid item 3", qty: 12},
			 {id:"4", name:"sub grid item 4", qty: 5},
			 {id:"5", name:"sub grid item 5", qty: 2},
			 {id:"6", name:"sub grid item 6", qty: 9},
			 {id:"7", name:"sub grid item 7", qty: 3},
			 {id:"8", name:"sub grid item 8", qty: 8},
			 {id:"9", name:"sub grid item 9", qty: 3},
			 {id:"10", name:"sub grid item 10", qty: 5},
			 {id:"11", name:"sub grid item 11", qty: 9},
			 {id:"12", name:"sub grid item 12", qty: 8}
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
					height: 350,
					ignoreCase: true,
					//colNames:[' ', 'ID','Last Sales','Name', 'Stock', 'Ship via','Notes'],
					colNames:[' ','Object Type','Object Name','Action','Last Updated By','Last Updated On'],
					colModel:[
					
							
						 /* {name:'chkdeleteselect[]',align:center,sortable:false,formatter:function(cellvalue, options,rowObject) {
							
							return '<input role="checkbox" type="checkbox"  class="cbox" id="'+rowObject.objectActionId+'" name="chkdeleteselect[]">';}}, */
							
							
							{name:'chkdeleteselect',sortable:false,width:20,formatter:function(cellvalue, options,rowObject) {
							       if(rowObject.checked==true){
							        return '<input role="checkbox" type="checkbox" checked="checked" class="cbox" id="chkdeleteselect" value="'+rowObject.objectActionId+'" name="chkdeleteselect[]">';
							        
							       }else {
							        return '<input role="checkbox" type="checkbox"  class="cbox" id="chkdeleteselect"  value="'+rowObject.objectActionId+'" name="chkdeleteselect[]">';
							        
							       }
							       
							      }}, 
							 
						{name:'objectType', index:'objectType'}, 
						{name:'objectName',index:'objectName'},
						
						{formatter:function(cellvalue, options,rowObject) {
							       if(rowObject.actionName=='Add'){
							        return '<span class="label label-info";>'+rowObject.actionName+'</span>';
							        
							       }else if(rowObject.actionName=='Delete'){
								        return '<span class="label label-danger";>'+rowObject.actionName+'</span>';
							        
							       }else if(rowObject.actionName=='View'){
								        return '<span class="label label-info";>'+rowObject.actionName+'</span>';
								    
							       }else    {
							    	   return '<span>'+rowObject.actionName+'</span>';
							       }
							       
							      }},  
							    
				        {name:'lastUpdatedBy', index:'lastUpdatedBy'}, 
						{name:'lastModifiedDate',index:'lastModifiedDate'}
						
					], 
			
					viewrecords : true,
					rowNum:50,
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
							if($('#selectAll').attr('id')==undefined)
							$('#jqgh_grid-table_checkbox').before('<br/>');
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
						        $('#k').checked = true;
						    });
							
						}, 0);
						
					},
			
			
					editurl: "/dummy.html",//nothing is saved
					//caption: "jqGrid with inline editing"
			
					//autowidth: true,
					  width:'100%',
			
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