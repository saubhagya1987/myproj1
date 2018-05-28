<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Scheduled New ping</title>

</head>
<style>
.checkbox1 {
}
</style>

<body>
<jsp:include page="../common/header.jsp" />
        <!--<jsp:include page="../common/common_popup.jsp" />-->
        <%
 int notifyScheduleId=0; 
try{ 
	notifyScheduleId=Integer.parseInt(request.getParameter("notifyScheduleId").toString()); 
 if(notifyScheduleId!=0){ 
	%>
        <input type="hidden" id="notifyScheduleId" name="notifyScheduleId" value="<%=notifyScheduleId%>">
        <%
 } 
  }catch(Exception e){ 
	%>
        <input type="hidden" id="notifyScheduleId" value="0">
        <%
  } 
 %>
        <%
 int notifyTemplateID_P=0; 
try{ 
	notifyTemplateID_P=Integer.parseInt(request.getParameter("notifyTemplateID_P").toString()); 
 if(notifyTemplateID_P!=0){ 
	%>
        <input type="hidden" id="notifyTemplateID_P" name="notifyTemplateID_P" value="<%=notifyTemplateID_P%>">
        <%
 } 
  }catch(Exception e){ 
	%>
        <input type="hidden" id="notifyTemplateID_P" value="0">
        <%
  } 
 %>
        <!--css popup window start 1-->
        <input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />
        
        <!-- Center part start -->
        <section>
          <form id="insertSchedulePings"  name="insertSchedulePings1"
			action="<%=request.getContextPath()%>/ping/insertTags.htm"   
			method="post">
            <input type="hidden" id="xmlStringNotifyParty" name="xmlStringNotifyParty">
            <div class="">
              <div class="container-head"> 
              
                <div class="page-header">
                  <h1>Add New Schedule Ping</h1>
                </div>
              </div >
              <div class="container-body"> 
                <!--center -->
                <div class="widget-box" style="margin-top:10px;">
                  <div class="widget-header">
                    <h5 class="widget-title">Select the tag to identify Potential Recipients (target audience for this ping)</h5>
                  </div>
                  <div class="widget-body">
                    <div class="widget-main clearfix">
                      <div class="row">
                        <div class="form-group col-md-12" style="overflow-x:auto">
                          <div class="clearfix" id="selectedTagList"> </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="widget-box" style="margin-top:10px;">
                  <div class="widget-body">
                    <div class="widget-main clearfix">
                      <div class="row">
                        <div class="form-group col-md-5 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="ping">Select Ping<span class="red">*</span></label>
                          <div class="col-sm-9">
                            <select name="ping" id="ping" class="input-xxlarge form-control" onchange="getTagsForPings(ping)">
                              <option value="0">---Select---</option>
                            </select>
                            <div id="ping_error" class="help-block hide">Please select ping name.</div>
                          </div>
                        </div>
                        <div class="form-group col-md-7 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="scheduleDate">Date and Time<span class="red">*</span></label>
                          <div class="col-sm-9"> <i class="ace-icon fa fa-calendar"></i>
                            <input type="text" class="input-small"  id="scheduleDate" name="scheduleDate">
                            <select name="scheduleHours" id="scheduleHours" class="input-small">
                              <option value="0">Hours</option>
                              <option value="1">1 </option>
                              <option value="2">2 </option>
                              <option value="3">3 </option>
                              <option value="4">4 </option>
                              <option value="5">5 </option>
                              <option value="6">6 </option>
                              <option value="7">7 </option>
                              <option value="8">8 </option>
                              <option value="9">9 </option>
                              <option value="10">10 </option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                            </select>
                            <div id="scheduleHours_error" class="help-block hide">Please provide a valid schedule hour.</div>
                            <select name="scheduleMinute" id="scheduleMinute" class="input-small">
                              <option value="0">Minute</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3"> 3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                              <option value="13">13</option>
                              <option value="14">14</option>
                              <option value="15">15</option>
                              <option value="16">16</option>
                              <option value="17">17</option>
                              <option value="18">18</option>
                              <option value="19">19</option>
                              <option value="20">20</option>
                              <option value="21">21</option>
                              <option value="22">22</option>
                              <option value="23">23</option>
                              <option value="24">24</option>
                              <option value="25">25</option>
                              <option value="26">26</option>
                              <option value="27">27</option>
                              <option value="28">28</option>
                              <option value="29">29</option>
                              <option value="30">30</option>
                              <option value="31">31</option>
                              <option value="32">32</option>
                              <option value="33">33</option>
                              <option value="34">34</option>
                              <option value="35">35</option>
                              <option value="36">36</option>
                              <option value="37">37</option>
                              <option value="38">38</option>
                              <option value="39">39</option>
                              <option value="40">40</option>
                              <option value="41">41</option>
                              <option value="42">42</option>
                              <option value="43">43</option>
                              <option value="44">44</option>
                              <option value="45">45</option>
                              <option value="46">46</option>
                              <option value="47">47</option>
                              <option value="48">48</option>
                              <option value="49">49</option>
                              <option value="50">50</option>
                              <option value="51">51</option>
                              <option value="52">52</option>
                              <option value="53">53</option>
                              <option value="54">54</option>
                              <option value="55">55</option>
                              <option value="56">56</option>
                              <option value="57">57</option>
                              <option value="58">58</option>
                              <option value="59">59</option>
                            </select>
                            <div id="scheduleMinute_error" class="help-block hide">Please provide a valid schedule minute.</div>
                            <select name="hrType" id="hrType" class="input-small">
                              <option value="AM">AM</option>
                              <option value="PM">PM</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="widget-box" style="margin-top:10px;">
                  <div class="widget-body">
                    <div class="widget-main clearfix">
                      <div class="row">
                        <div class="form-group col-md-5 clearfix">
                          <label class="col-sm-3 control-label no-padding-right" for="recipientType">Recipient Type</label>
                          <div class="col-sm-9">
                            <select name="recipientType" id="recipientType" class="input-xxlarge form-control" onchange="getReciepentDetails(0,id)">
                              <option value="0">---Select---</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xs-pull-9">
                  <div class="topmenuleft"> </div>
                </div>
                <div class="row"><div id="toreload" class="col-md-12 tabular_break_word">
                  <table id="grid-table">
                  </table>
                  <div id="grid-pager"></div>
                  
                  <!-- Center--> 
                </div></div>
                <div><span class="badge badge-info" id="selectedRecipientCount"></span> Recipient  Selected</div>
                
                <div class="topmenuleft margin_5px rightAlign" style="margin-top:5px;">
                  <div data-params="{}" type="button" class="btn btn-primary btn-xs importNewBtn" onclick="saveSchedulePing()"  title="Import Opportunities" alt="Import Opportunities">Save</div>
                  <div data-params="{}" type="button" class="btn btn-primary btn-xs cancelBtn westspace2" onclick="cancelPage()"  title="Cancel">Cancel</div>
                </div>
              </div>
            </div>
          </form>
        </section>
        <!-- Center part End -->
        <jsp:include page="../common/footer.jsp" />
<script type="text/javascript">
var reciepientData ;
reciepientData = '${reciepientData}';

	loadGrid(reciepientData);
function loadGrid(grid_data){
			$('#toreload').empty();
			$('#toreload').append('<table id="grid-table"></table><div id="grid-pager"></div>');
			//var reciepientData=[];
			//var grid_data ='${reciepientData}';
			//alert('Grid Data='+grid_data)
			console.log('grid_data:---'+grid_data);
			index=grid_data;
			//index=JSON.parse(grid_data);
			/* var index=new Array();
			$(grid_data).each(function(i,obj) {
				var object = {};
				object.name = obj.name;
				object.pingOwner=obj.pingOwner;
				object.notifyTemplateID=obj.notifyTemplateID;
				index.push(object);
				
			}); */
			
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
					height: 250,
					//colNames:[' ', 'ID','Last Sales','Name', 'Stock', 'Ship via','Notes'],
					colNames:['','Recipient Name','Email Id', 'Contact No', 'Ping Count'],
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
						{name:'checkbox', index:'checkbox', width:20,sortable:false,formatter:function(cellvalue, options,rowObject) {
						   	if(rowObject.matched=='1')
								return '<input role="checkbox" type="checkbox"  class="cbox" id="'+rowObject.partyId+'" name="tagCb" onclick="cheackBoxCount()" checked="checked">';
							else
								return '<input role="checkbox" type="checkbox"  class="cbox" id="'+rowObject.partyId+'" name="tagCb" onclick="cheackBoxCount()">';
						}},
// 						{name:'partyId',index:'partyId',},
						{name:'recipientName',index:'recipientName'},
						{name:'emailId',index:'emailId'},
						{name:'contactNo',index:'contactNo'},
						{name:'pingCount',index:'pingCount'}
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
							        cheackBoxCount()
							    });
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
				/* function aceSwitch( cellvalue, options, cell ) {
					setTimeout(function(){
						$(cell) .find('input[type=checkbox]')
							.addClass('ace ace-switch ace-switch-5')
							.after('<span class="lbl"></span>');
					}, 0);
				} */
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
					form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:false})
					
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
}
		</script>
<script>
var userLabelValueList = new Array();
var cityId=0;
var tagIdStrList='';
var total=0;
function openFileDailog(id){
	$('#'+id).click();
}



$(document).ready(function() {
	 
	
	$('#selectAll').click(function(event) {  //on click 
        if(this.checked) { // check select status
            $('.checkbox1').each(function(i,obj) { //loop through each checkbox
//                 this.checked = true;  //select all checkboxes with class   "checkbox1"    
			$(obj).attr('checked','checked');
            });
        }else{
            $('.checkbox1').each(function(i,obj) { //loop through each checkbox
//                 this.checked = false; //deselect all checkboxes with class "checkbox1"
            	$(obj).removeAttr('checked');
            });         
        }
    });
	
	
	
$.ajax({
	type : "GET",
	url : $('#contextPath').val()+'/ping/getPingNames.htm',
	success : function(result) {
		$(result).each(function(i,obj) {
			
			$('#ping').append('<option value="'+obj.notifyTemplateID+'">'+obj.name+'</option>');
			
		});
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=15',
			success : function(result) {
				$('#queryType').empty();
				$(result).each(function(i,obj) {
					var codeTypeId=obj.codeTypeId;
					var codeValue=obj.codeValue;
					var codevalueId=obj.codeValueId;
					 if(codeTypeId==15){
						if(codevalueId!=15004){
						 $('#recipientType').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
						}
					}
					
					
				});
				$('#recipientType').append('<option value="1">ALL</option>');
			}
		});
		
		var notifyScheduleId = $('#notifyScheduleId').val();
		if(notifyScheduleId==0)
			{
				
			}
		else{
			$('#ping').attr('disabled',true);
			var lstTagDatas;
			//alert('in edit');
			$.ajax({
				type : 'POST',
				url : $('#contextPath').val()+"/ping/getSchedulePingDatilsByScheduleId.htm?notifyScheduleId="+notifyScheduleId,
					
				success : function(result) {					
					
					$(result).each(function(i,obj) {
						var notifyTagId = obj.ping;
						var scheduleDate = obj.scheduleDate;
						var  scheduleMinute = obj.scheduleMinute;
						var scheduleHours = obj.scheduleHours;
						var hrType = obj.hrType;
						lstTagDatas = obj.lstTagDatas;
					
// 						alert('notifyTagId='+notifyTagId);
// 						alert('scheduleDate='+scheduleDate);
						$('#ping').val(notifyTagId);
						$('#scheduleDate').val(scheduleDate);
						$('#scheduleMinute').val(scheduleMinute);
						$('#scheduleHours').val(scheduleHours);
						$('#hrType').val(hrType);
					
						
						
						
					});
					$(lstTagDatas).each(function(i,objlstTagDatas) {
						$('#selectedTagList').append('<div class="alertn pull-left label label-success arrowed arrowed-right westspace2 southspace2">'+objlstTagDatas.notifyTagName+'='+objlstTagDatas.mappedCodeValue+'&nbsp;<span class="fa fa-close closen bigger-130" id="'+objlstTagDatas.notifyTagId+'-'+objlstTagDatas.mappedCodeTypeId+'" data-dismiss="alert"  onclick="getClosedTagId('+objlstTagDatas.notifyTagId+')"></span></div>');
						
					});
					//alert('notifyScheduleId='+notifyScheduleId)
					if(notifyScheduleId==0)
					{
						getReciepentDetails(0,'0');	
					}
					else{
						
					}
					
					cheackBoxCount();
				}
			});
		}
		var today = new Date();
	    var dd = today.getDate();
	    var mm = today.getMonth()+1; //January is 0!

	    var yyyy = today.getFullYear();
	    if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm} var today = dd+'/'+mm+'/'+yyyy;
		
	    $('#scheduleDate').val(today)
		
		$jq_1_9_1('#scheduleDate').datepicker({
			changeMonth : true,
			changeYear : true,
			minDate : '0',
			yearRange : "1900:2200",
			dateFormat : "dd/mm/yy"

		});
		
		var notifyTemplateID_P = $('#notifyTemplateID_P').val();
		//alert('notifyTemplateID_P='+notifyTemplateID_P);
		if(notifyTemplateID_P==0 || notifyTemplateID_P=='0' || notifyTemplateID_P==' ')
			{
			}
		else{
			//alert('in notifyTemplateID_P');
// 			$('#ping').attr('disabled',true);
			$('#ping').val(notifyTemplateID_P);
			
			
			$('#ping').change();
			}
		
	}
	});



});
// var oTable;
// $(document).ready( function() {
//     oTable = $('#example').dataTable( {
//         "bProcessing": true,
//         "bServerSide": true,
//         "sAjaxSource": "/json1.php"
//     } );
     
//     oTable.fnSettings().sAjaxSource = "/json2.php";

function saveSchedulePing()
{
	var isValidated = true;
	if ($.trim($('#ping').val()) == '0') {
		addCssStyles('ping', 'Please Select Ping.');
		$('#ping_error').removeClass('hide');;
		$('#ping_error').parent().parent().addClass('has-error');
		isValidated = false;
		
	}
	else{
		removeCssStyles('ping');
		$('#notifyTagName').css('color','#333333');
		$('#ping_error').addClass('hide');
		$('#ping_error').parent().parent().removeClass('has-error');
	}
	if ($.trim($('#scheduleDate').val()) == '') {
		addCssStyles('ping', 'Please Select Date.');
		$('#scheduleDate_error').removeClass('hide');;
		$('#scheduleDate_error').parent().parent().addClass('has-error');
		isValidated = false;
		
	}
	else{
		removeCssStyles('scheduleDate');
		$('#scheduleDate').css('color','#333333');
		$('#scheduleDate_error').addClass('hide');
		$('#scheduleDate_error').parent().parent().removeClass('has-error');
	}
	
	if ($.trim($('#scheduleHours').val()) == '0') {
		addCssStyles('scheduleHours', 'Please Select Hours.');
		$('#scheduleHours_error').removeClass('hide');;
		$('#scheduleHours_error').parent().parent().addClass('has-error');
		isValidated = false;
		
	}
	else{
		removeCssStyles('scheduleHours');
		$('#scheduleHours').css('color','#333333');
		$('#scheduleHours_error').addClass('hide');
		$('#scheduleHours_error').parent().parent().removeClass('has-error');
	}
	
	if ($.trim($('#scheduleMinute').val()) == '0') {
		addCssStyles('scheduleMinute', 'Please Select Minutes.');
		$('#scheduleMinute_error').removeClass('hide');;
		$('#scheduleMinute_error').parent().parent().addClass('has-error');
		isValidated = false;
		
	}
	else{
		removeCssStyles('scheduleMinute');
		$('#scheduleMinute').css('color','#333333');
		$('#scheduleMinute_error').addClass('hide');
		$('#scheduleMinute_error').parent().parent().removeClass('has-error');
	}
	
	if( isValidated==false){
		showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
	}
	if (isValidated == true) {
	var notifyScheduleId = $('#notifyScheduleId').val();
	
	 var xmlStringNotifyParty='<Root>';
	list = new Array();
	$('#grid-table :checked').each(function(i, obj) {
		if($(this).attr('id')!='selectAll'){
		list[i] = $(this).attr('id');
		xmlStringNotifyParty +='<party><partyId>'+list[i]+'</partyId></party>';	
		}
	});
	xmlStringNotifyParty +='</Root>';
	$('#xmlStringNotifyParty').val(xmlStringNotifyParty);
	
	var tagList='<Root>';
	$('#selectedTagList input').each(function(i,obj) {
		var id=$(obj).attr('id');
		tagList+='<Tag>';
		tagList+='<TagId>'+id.substring(0,id.indexOf('-'))+'</TagId>';
		tagList+='<ValueId>'+id.substring(id.indexOf('-')+1)+'</ValueId>';
		tagList+='</Tag>';
	});
	tagList+='</Root>'
	
	if(notifyScheduleId!=0)
		{
		$('#ping').attr('disabled',false);
		}
		
// 	alert('notifyScheduleId='+notifyScheduleId);
// 	alert('xmlStringNotifyParty='+xmlStringNotifyParty);al()
// 	$('#xmlStringNotifyParty').val(xmlStringNotifyParty);

	$.ajax({
		type : "POST",
		 
		url : $('#contextPath').val()+'/ping/insertSchedulePings.htm?notifyScheduleId='+notifyScheduleId,
		data: $('#insertSchedulePings').serialize(),
		
		success : function(result) {
			result = JSON.parse(result);
			//alert('result='+result);
			if(result == "success"){
				showAlertMessage("Success", "<br/> scheduled Ping successfully.", "information", redirectFurther);
			}
			
		}
	});
	}
}
function redirectFurther() {
	
	
	
	window.location.href = $('#contextPath').val()
			+ '/ping/getScheduledPings.htm';

}
function getTagsForPings(ping)
{
	$('#selectedTagList').empty();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/ping/getTagsForPing.htm?ping='+$('#ping').val(),
		success : function(result) {
			
			$(result).each(function(i,obj) {
				
				
				$('#selectedTagList').append('<div class="alertn pull-left label label-success arrowed arrowed-right westspace2 southspace2">'+obj.notifyTagName+'='+obj.notifyTagValue+'&nbsp;<span class="fa fa-close closen bigger-130" id="'+obj.notifyTagId+'-'+obj.notifyTagValueId+'" data-dismiss="alert" onclick="getClosedTagId('+obj.notifyTagId+')"></span></div>');
				
				
			});
			getReciepentDetails(0,'0');
			$('#selectedRecipientCount').html('0');
		}
	});
}

function getClosedTagId(notifyTagId)
{
// 	alert(notifyTagId);
	if(tagIdStrList=='')
		tagIdStrList=notifyTagId;
	else
		tagIdStrList+=','+notifyTagId;
	getReciepentDetails(tagIdStrList,'0');
	
} 
function getReciepentDetails(notifyTagId,recipientType)
{
	
	
	recipientType= $('#recipientType').val();
	//alert('recipientType='+recipientType)
	setResult(notifyTagId,recipientType);
}	
// 	function setResult(notifyTagId,recipientType){
// 		var notifyTempletId = $('#ping').val();
		
// 		  openPopupWebApp('centerLoadingImage', 25, 35);
// 		  $("#toreload").load('${pageContext.request.contextPath}/ping/getRecipientDetails.htm #toreload', {
// 		   object: '${object}',
// 		   notifyTagId: notifyTagId,
// 		   recipientType:recipientType,
// 		   notifyTempletId:notifyTempletId,
		   
// 		     }, function( response, status, xhr ) {
// 		      try{
// 		        closePopupWebApp('');
// 		      }catch(e){
// 		         closePopupWebApp('');       
// 		      }
// 		     });
// 		 }
	
	function setResult(notifyTagId,recipientType){
		var notifyTempletId = $('#ping').val();
		
		 // alert('in ajax call');
		  $.ajax({
				type : "POST",
				url : $('#contextPath').val()+'/ping/getRecipientDetails.htm?notifyTagId='+notifyTagId+'&recipientType='+recipientType+'&notifyTempletId='+notifyTempletId,
				success : function(result) {
					
					loadGrid(result);
					selectOrUnselectAllChkBox()
					//alert('result=-'+result);
				}
			});
		  
		  
		  
		 }
	
	
	
	function cheackBoxCount()
	{
		try{
// 	alert('==='+document.insertSchedulePings1.tagCb.length)
		var t=0;
		
		$('.cbox').each(function(i,obj) { //loop through each checkbox
			if(this.checked){
				t+=1;
			}
            });
		
		//alert('total='+total)
		$('#selectedRecipientCount').html(t);
		}catch(e){
			}
// 		alert('total='+total);
// 		if(total > 3){
// 		alert("Please Select only three") 
// 		document.form1.tagCb[j].checked = false ;
		return false;
	}
	
	function cancelPage()
	{
		window.location.href = $('#contextPath').val()
		+ '/ping/getScheduledPings.htm';
	}

	function selectOrUnselectAllChkBox(id)
	{
		
	//alert('in a='+id);
	var isActive = $('#'+id).val();
	var active="";
	
	if ($('#'+id).is(":checked"))
	{
		
		 active="checked";
	}
	else{
		
		 active="notchecked";
	}
	//alert('active='+active);
	
		// if(this.checked) { // check select status
			if(active=="checked"){
	            $('.checkbox1').each(function(i,obj) { //loop through each checkbox
	                 this.checked = true;  //select all checkboxes with class   "checkbox1"    
				$(obj).attr('checked','checked');
	            });
			}
			else{
				 $('.checkbox1').each(function(i,obj) { //loop through each checkbox
	                 this.checked = false; //deselect all checkboxes with class "checkbox1"
	            	$(obj).removeAttr('checked');
	            }); 
			}
			
			cheackBoxCount();
	}

	
</script>

</body>
</html>