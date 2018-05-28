
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>CodetypeList</title>
<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
<script	src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/holder.js"></script>-->
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/nicEdit.js"></script>
<style>
#ui-id-1 {
	width: 168px !important;
	padding-left: 20px !important;
}

#ui-id-2 {
	width: 168px !important;
	padding-left: 24px !important;
}

.ui-menu-item {
	list-style: none !important;
}

.ui-corner-all {
	margin-left: -10px !important;
}

.ui-helper-hidden-accessible {
	color: #000;
}
</style>
<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">-->
<link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />
<!-- -responsive css-->
<%-- <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--<script src="js/jquery-1.9.1.js"></script>-->
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.position.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.menu.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.autocomplete.js"></script>-->
<script>
	$(function() {
		var availableTags = [ "ActionScript", "AppleScript", "Asp", "BASIC",
				"C", "C++", "Clojure", "COBOL", "ColdFusion", "Erlang",
				"Fortran", "Groovy", "Haskell", "Java", "JavaScript", "Lisp",
				"Perl", "PHP", "Python", "Ruby", "Scala", "Scheme" ];
		$("#tags").autocomplete({
			source : availableTags
		});

	});
</script>

<script type="text/javascript">
	bkLib.onDomLoaded(function() {
		nicEditors.allTextAreas()
	});
</script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico"
	rel="shortcut icon">



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->


</head>
<body>
<%HttpSession g=request.getSession();
g.getAttribute("Ids");%>
	<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />

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
	<div style="display: none; width: 650px; height: 450px; top: 100px"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>
		<div id="addnote">
			<div id="popupwrapper_contactform">
				<div class="heading_contactform">
					<h3>Add Code Type</h3>
				</div>
				<form id="addform">
					<div id="poptable_contactform"
						style="padding: 10px; height: 270px;">
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Code Type ID <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top" style="float: left;">
							<input type="text" class="form-control" id="newcodetypeId"
							name="codeTypeId" readonly="readonly">
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Code Type <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							class="form-control" id="newcodetype" name="codeType">
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Description <span
							class="red">*</span>
						</span><span class="searchpadding padding_top "
							style="float: left; width: 400px;"><textarea
								class="form-control" rows="5" id="newDescription"
								name="codeTypeDescription"></textarea></span>
						<div class="clearfix"></div>


					</div>
				</form>
				<div class="topbuttonholder">
					<form>
						<input class="dbtn" value="Save & New" id="Save" type="button"
							onclick="addCodeType();addNewCodeType(0);"> <input
							class="dbtn" value="Save & Close" id="Save" type="button"
							onclick="addNewCodeType(1);"> <input class="dbtn"
							value="Cancel" id="Cancel" type="button"
							onclick="popup('popUpAlertaddnote');location.reload();">
					</form>
				</div>
			</div>
		</div>


		<!-- delete-->
		<div id="deletenote">
			<div id="popupwrapper_contactform"
				style="height: 100px; width: 250px;">

				<div class="heading_contactform">
					<h3>Message</h3>
				</div>
				<div id="poptable_contactform" style="padding: 10px; height: 100px;">
					Do you want to delete this selected records? Please confirm.</div>
				<div class="topbuttonholder">
					<form>
						<input class="dbtn" value="Yes" id="Yes" type="button"
							onclick="deleteCodeType();"> <input class="dbtn"
							value="No" id="No" type="button"
							onclick="popup('popUpAlertaddnote');">

					</form>
				</div>
			</div>
		</div>

		<!-- delete-->
		<!-- Edit-->
		<div id="editnote">
			<div id="popupwrapper_contactform">
				<div class="heading_contactform">
					<h3>Edit Code Type</h3>
				</div>
				<form id="editform">
					<div id="poptable_contactform"
						style="padding: 10px; height: 270px;">
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Code Type ID <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top" style="float: left;">
							<input type="text" class="form-control" id="editCodetypeId"
							name="codeTypeId" readonly="readonly">
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Code Type <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							class="form-control" id="editCodeType" name="codeType"></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Description <span
							class="red">*</span>
						</span><span class="searchpadding padding_top "
							style="float: left; width: 400px;"> <textarea
								class="form-control" rows="5" id="editCodeTypeDesc"
								name="codeTypeDescription"></textarea></span>
						<div class="clearfix"></div>


					</div>
				</form>
				<div class="topbuttonholder">
					<form>
						<input class="dbtn" value="Save" id="Save" type="button"
							onclick="updateCodeType();"> <input class="dbtn"
							value="Cancel" id="Cancel" type="button" onclick="exit();">
					</form>

				</div>
			</div>
		</div>
	</div>
	<!--css popup window 2 close-->
	<!--css popup window start 3-->
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width: 450px; height: 380px; top: 100px"
		id="popUpAlertonaction">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertonaction')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>


		<div id="viewvalues" style="height: 335px; overflow-y: auto">
			<div id="popupwrapper_contactform">

				<div class="heading_contactform">
					<h3>View Code valuesss</h3>
				</div>
				<br>


			</div>
		</div>

		<div id="reordervalues">

			<div id="popupwrapper_contactform">
				<div class="heading_contactform">
					<h3>Reorder values</h3>
				</div>
				<br>

				<table class="table  table-striped" style="margin-top: 10px;">
					<tr>
						<th class="class">Current Display Sequence</th>
						<th></th>
						<th class="class">New Display Sequence</th>
					</tr>
					<tr>
						<td><select name="from_select_list" id="from_select_list"
							size="8" multiple="multiple" style="height: 150px; width: 150px"></select>

						</td>
						<td>
							<table>
								<tr>
									<td><input id="moveright" value="Move >>" type="button"
										onclick="move_list_items('from_select_list','to_select_list');"></td>
								</tr>
								<tr>
									<td><input value="<< Move" id="moveleft" type="button"
										onclick="move_list_items('to_select_list','from_select_list');"></td>
								</tr>
							</table>
						</td>
						<td><select name="to_select_list" id="to_select_list"
							size="8" multiple="multiple" style="height: 150px; width: 150px"></select>

						</td>
					</tr>
				</table>
				<div class="topbuttonholder" style="text-align: center;">
					<form>
						<input class="dbtn" value="Save" id="SaveReorder" type="button"
							onclick="saveReorderedList()"><input class="dbtn"
							value="Cancel" id="Cancel" type="button" onclick="exit()">
					</form>
				</div>
			</div>
		</div>

		<div id="defaultvalues" style="height: 335px; overflow-y: auto">
			<div id="popupwrapper_contactform">
				<div class="heading_contactform">
					<h3>Default Values</h3>
				</div>
				<br>
				<!-- <table  class="table table-bordered  table-striped"  style="margin-top:10px; ">
        	<tr><th class="class">Assign a default value</th></tr>
            
            <tr><td><input id="defaultselector" value="1" type="checkbox"> 10011 [Open]</td>
        </table>  -->
				<div class="topbuttonholder" style="text-align: center;">
					<form>
						<input class="dbtn" value="Save" id="Save" type="button"
							onclick="saveDefaultValueforCodeValue();"> <input
							class="dbtn" value="Cancel" id="Cancel" type="button" onclick="">
					</form>
				</div>
			</div>
		</div>
		<!-- defaultvalues end-->
	</div>


	<div class="container">
		<div class="container">
			<div class="portfoliostrip collapse navbar-collapse">
				<ul class="navbar-sub">
					<li id="SPCodeTypeLink" class="active"><a
						href="<%=request.getContextPath()%>/codetype/loadcodetypedata.htm">Code
							Type</a></li>
					<%-- <li id="SPCodeListLink"><a
						href="<%=request.getContextPath()%>/codetype/loadCodeValue.htm">Code
							List</a></li> --%>
					<li id="SPNotificationTemplatesLink"><a
						href="<%=request.getContextPath()%>/notifytemplate/getTemplateList.htm">Notification
							Template</a></li>
					<li id="SPNotificationEventsLink"><a
						href="<%=request.getContextPath()%>/notifyevent/getEventlist.htm">Notification
							Event</a></li>
					<li id="SPProductLink"><a
						href="<%=request.getContextPath()%>/product/loadproductlist.htm">Product</a></li>
					<li id="SPProductCatRevLink"><a href="<%=request.getContextPath()%>/product/category_revenue.htm">Product Category Revenue</a></li>
					<li id="SPProductManufacturerLink" ><a
						href="<%=request.getContextPath()%>/product/product_manufacturer.htm">Product Manufacturer</a></li>
				</ul>
			</div>
		</div>
	</div>
	<section id="hideCodeTypePage">


		<div class="container white">
			<div class="container-head">
				<div class="col-md-12" style="text-align: right;">
					<!-- accordion start-->

					<div class="accordion pull-left col-md-12" id="accordFundSel">
						<div class="accordion-group">
							<!-- <div class="col-md-11" style="width: 96%;">
								 <span style="float: left;">CodeTypeList </span><span
									class="col-md-10" style="float: right; margin-top: -3px;">
									<input name="text" type="text" id="tags"
									placeholder="Quick Search">
								</span>
							</div>  -->
							<form>
								<div class="col-md-11" style="width: 96%;">
									<span style="float: left;">CodeTypeList</span> <span
										class="col-md-10" style="float: right; margin-top: -3px;">
										<input name="searchtext" type="text" id="tags"
										placeholder="Quick Search">
									</span>
								</div>
							</form>
							<div class="accordion-heading">
								<a class="accordion-toggle " data-toggle="collapse"
									data-parent="#accordFundSel" href="#collapseFundSel"> <!-- <span
									style="margin-top: 0px;" class="searchicon" alt="Search"
									title="Search"></span> -->
								</a>
							</div>
							<div style="height: auto;" id="collapseFundSel"
								class="accordion-body pull-left serchboxnew collapse">
								<div class="accordion-inner table-responsive">
									<div style="width: 1211px;">
										<!--1 search start -->


										<div class="filterbox searchpadding">
											<div class="head">Codetype ID</div>
											<div class="drop_box_body" style="padding-top: 10px;">

												<input name="text" type="text" id="fname"
													class="form-control" value="" /> <br>
											</div>
										</div>

										<div class="filterbox searchpadding">
											<div class="head">Codetype</div>
											<div class="drop_box_body" style="padding-top: 10px;">
												<input name="text" type="text" id="fname"
													class="form-control" value="" />
											</div>
										</div>


									</div>


								</div>


								<!-- accordion-inner END -->
								<div class="col-md-1">
									<button type="button" id="updatefilterlist" class="btn">Show</button>
								</div>


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


				<ul class="pagination pagination-sm">
					<!-- <li class="disabled"><a href="#">&laquo;</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li> -->
				</ul>
				<div class="topmenu">

					<a id="SPCodeTypeAddNewLink" href="#" onClick="addNote();"><input data-params="{}"
						type="button" class="dbtn createNewBtn" value="  New Code Type "
						onClick="addCodeType();popup('popUpAlertaddnote')"
						title="New Code Type" alt="New Code Type"></a> 
					<a id="SPCodeTypeDeleteLink" href="#" onClick="deleteNote();"><input data-params="{}" type="button"
						class="dbtn deleteBtn" value="  Delete"
						onClick="getStringForDelete();popup('popUpAlertaddnote')"
						title="Delete" alt="Delete"> </a>
				</div>

				<div class="table-responsive" id="display_table_lead"
					style="border: none;">
					<div id="toreload">

						<display:table name="codeTypedata" uid="objPortalUser"
							class="table table-hover table-bordered table-striped"
							requestURI="#" sort="list" pagesize="${size}" id="data">

							<display:column>
								<a id="SPCodeTypeEditLink" href="#" onClick="editNote();"> <img
									src="<%=request.getContextPath()%>/images/edit.png" alt="Edit"
									title="Edit"
									onClick="getCodetypeIdToUpdate(${data.codeTypeId},'${data.codeType}','${data.codeTypeDescription}');popup('popUpAlertaddnote');"></a>&nbsp;&nbsp;</td>
							</display:column>

							<display:column
								title="<input type='checkbox' id='selecctall' name='selecctall'/>">
								<span class="thead"> <input type="checkbox"
									id="chkdeleteselect" name="chkdeleteselect" class="checkbox1"
									value="${data.codeTypeId}">
								</span>
							</display:column>
							<display:column title="Code Type ID" property="codeTypeId" sortable="true"></display:column>

							<display:column title="Code Type" property="codeType" sortable="true"></display:column>
							<display:column title="Code Type Description"
								property="codeTypeDescription" sortable="true"></display:column>

							<display:column title="Count Code Values[InActive]" style="width:180px;"
								property="temp" sortable="true"></display:column>

							<display:column class="dropdown" style="width:170px;">
								<a class="dropdown-toggle" href="#" data-toggle="dropdown" 
									style="text-decoration: none;" sortable="true">Action <span class="caret"></span></a>
								<ul class="dropdown-menu" style="width: 60px; padding: 10px;">
									<li><a href="#" style="color: #333;"
										onClick="viewvalues();"> <span
											id="SPCodeTypeViewValuesLink" class="user"
											onClick="viewValesfunction(${data.codeTypeId},'${data.codeType}');popup('popUpAlertonaction')">View
												values</span></a></li>
									<li><a href="#" style="color: #333;"
										onClick="reordervalues();"> <span
											id="SPCodeTypeReOrderLink" class="user"
											onClick="viewValuesToReOrder(${data.codeTypeId},'${data.codeType}');popup('popUpAlertonaction')">Reorder
												values</span></a></li>
									<li><a href="#" onClick="defaultvalues();"
										style="color: #333;"> <span id="SPCodeTypeDefValLink"
											class="user"
											onClick="defaultValuesfunction(${data.codeTypeId},'${data.codeType}');popup('popUpAlertonaction')">Default
												value</span></a></li>
									<li><a
										href="<%=request.getContextPath()%>/codetype/loadCodeValue.htm?codeTypeId=${data.codeTypeId}&codeValue=${data.codeType}"
										style="color: #333;"> <span id="SPCodeValuesLink"
											class="user">AccessCodeValue</span></a></li>
								</ul>
							</display:column>
						</display:table>

					</div>
				</div>

				<div class="col-sm-7">

					<ul class="pagination pagination-sm"
						style="float: left; margin-right: 20px;">
						<!-- <li class="disabled"><a href="#">&laquo;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li> -->
					</ul>



					<div class="topmenuleft">
						<div class="customDropdown">
							<span>Page Size:</span>&nbsp; 
										<select  type="button" name="pageSize" id="page" onchange="pagesizeurl()">
									
											<option value="10" 
												<c:if test="${size==10}"> selected="selected" </c:if>>10</option>
											<option value="20" 
												<c:if test="${size==20}"> selected="selected" </c:if>>20</option>
							     			<option value="50" 
							     				<c:if test="${size==50}"> selected="selected" </c:if>>50</option>
							     			<option value="500" 
							     				<c:if test="${size==500}"> selected="selected" </c:if>>500</option>
							     			<option value="1000"
												<c:if test="${size==1000}"> selected="selected" </c:if>>Show All&nbsp;</option>	
										</select>
						</div>
					</div>
					<div class="topmenuleft">

						<ul>
							<li>Export options:</li>

							<li><a
								href="<%=request.getContextPath()%>/codetype/codetypeCSV.htm"
								title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li>
							<li><a
								href="<%=request.getContextPath()%>/codetype/codetypeExecl.htm"
								title="Export in Excel" alt="Export in Excel"><i
									class="excelicon"></i></a></li>

						</ul>



					</div>
				</div>
				<!-- <div class="topmenu">

					<input data-params="{}" type="button" class="dbtn createNewBtn"
						value="  New Code Type" title="New Code Type"
						onclick="addCodeType();"> <input data-params="{}"
						type="button" class="dbtn deleteBtn" value="  Delete"
						title="Delete"
						onClick="getStringForDelete();popup('popUpAlertaddnote');">



				</div> -->
				<div class="topmenu">

					<a id="SPCodeTypeAddNewLink" href="#" onClick="addNote();"><input data-params="{}"
						type="button" class="dbtn createNewBtn" value="  New Code Type"
						title="New Code Type"
						onClick="addCodeType(),popup('popUpAlertaddnote')"></a> 
					<a id="SPCodeTypeDeleteLink" href="#" onClick="deleteNote();"><input data-params="{}"
						type="button" class="dbtn deleteBtn" value="  Delete"
						title="Delete"
						onClick="getStringForDelete();popup('popUpAlertaddnote')"></a>
					<input type="hidden" id="confirmdelete" name="confirmdelete">


				</div>
			</div>

		</div>


	</section>
	<!-- Center part End -->

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<script>
		function addNote() {

			$("#addnote").show();
			$("#deletenote, #editnote").hide();
			$("#popUpAlertaddnote").css('height', '410px')
			$("#popUpAlertaddnote").css('width', '650px')
		}

		function deleteNote() {

			$("#deletenote").show();
			$("#addnote, #editnote").hide();
			$("#popUpAlertaddnote").css('height', '250px')
			$("#popUpAlertaddnote").css('width', '300px')
		}
		function editNote() {

			$("#editnote").show();
			$("#addnote, #deletenote").hide();
			$("#popUpAlertaddnote").css('height', '410px')
			$("#popUpAlertaddnote").css('width', '650px')
		}

		function viewvalues() {
			$("#viewvalues").show();
			$("#reordervalues, #defaultvalues").hide();

		}
		function reordervalues() {

			$("#reordervalues").show();
			$("#viewvalues, #defaultvalues").hide();
			$("#popUpAlertonaction").css('height', '400px')
			$("#popUpAlertonaction").css('width', '500px')

		}
		function defaultvalues() {

			$("#defaultvalues").show();
			$("#viewvalues, #reordervalues").hide();
			$("#popUpAlertonaction").css('height', '450px')
			$("#popUpAlertonaction").css('width', '500px')

		}
		
		
		function addCodeType()
		{
			$.ajax({
				  type: "POST",
				  url: $('#contextPath').val()+'/codetype/getMaxCodeTypeID.htm',	
				  dataType: 'json',
				  contentType: 'application/json',
				  success:function(result)
				  { 
					  $('#newcodetypeId').val(+result);
				  }
			
			});
		}

		function addNewCodeType(closePopup)
		{
			if(addCodetypeRequiredfieldValidation() == true)
			{
			$.ajax({
				  type: "POST",
				  data:$('#addform').serialize(),
				  url: $('#contextPath').val()+"/codetype/addNewCodeType.htm",/* ?codetypeId="+$('#newcodetypeId').val() 
						  +"&codetype="+$('#newcodetype').val()
						  +"&codeDesc="+$('#newDescription').val(), */
						  success : function(result) 
						 	{ 
					      		 alert('Successfully Inserted CodeType');
					      		 $('#common_popup_div,#shadow_div_web_app').remove();
					       
						       	if(closePopup==0)
						       	{
						       		resetval();
						          	addCodeType();
						          	addNote().show();
						          	popup('popUpAlertaddnote').show();
						    	  
						       	} 
						       	else  
						       	{
						       	 	window.location.reload();
						        }
					      
							 }
						  
			  });
			}
			
		}
		function addCodetypeRequiredfieldValidation()
		{
			//alert('IN Validation 1111111111111111111::::'+$('#newcodetype').val());
			 if ($('#newcodetype').val()=="")
			 {
				 alert('Code Type  is required');
		        return false;
		    } 
			 if ($('#newDescription').val()=="") 
			 {
				 alert('Code Type Description is required');
		        return false;
		    } 
			// alert('In Validation......................');
			 return true;
		}
		/* function  submitCodeType()
		{
			if(addCodetypeRequiredfieldValidation() == true)
			{
				addNewCodeType();
			}

		} */
		function resetval()
		{
		 	$('#newcodetypeId').val('');
		 	$('#newcodetype').val('');
		 	$('#newDescription').val('');
		 }


		function editCodetypeRequiredfieldValidation()
		{
			//alert('IN Validation 1111111111111111111::::'+$('#newcodetype').val());
			 if ($('#editCodeType').val()=="") {
				 alert('Code Type is required');
		        return false;
		    } 
			 if ($('#editCodeTypeDesc').val()=="") {
				 alert('Code Type Description is required');
		        return false;
		    } 
			// alert('In Validation......................');
			 return true;
		}

		function updateCodeType()
		{
			if(editCodetypeRequiredfieldValidation() == true)
			{
			$.ajax({
				  type: "POST",
				  data:$('#editform').serialize(),
				  url: $('#contextPath').val()+"/codetype/updateCodeType.htm",/* ?codetypeId="+$('#editCodetypeId').val() 
						  +"&codetype="+$('#editCodeType').val()
						  +"&codeDesc="+$('#editCodeTypeDesc').val(), */
				   success:function(result)
				    {
					   alert('Updated Code Type Successfully');
					   location.reload();
		            }
		        
				});
			}
			 
		}
	/* function  submitUpdatedCodetype()
		  {
			  if(editCodetypeRequiredfieldValidation() == true)
				  updateCodeType();
		  } */
		  
		 function getCodetypeIdToUpdate(codetypeid,codetype,codetypedesc)  
			{
			 	$('#editCodetypeId').val(codetypeid);
			 	$('#editCodeType').val(codetype);
			 	$('#editCodeTypeDesc').val(codetypedesc);
				
			}

		 function viewValesfunction(codeTypeId,codeType)
		 {
		 $.ajax({
				type : 'POST',
				url : $('#contextPath').val()+"/codetype/viewCodevaluesofcodetype.htm?codetypeId="+codeTypeId,
				dataType: 'json',
				  contentType: 'application/json',
				success : function(result) 
				{
					var statusList=result;
					$("#viewvalues").empty();
					$("#viewvalues").append('<div id="popupwrapper_contactform"><div class="heading_contactform"><h3>View Code values</h3></div><br>'+codeTypeId+'['+codeType+']') ;
					$("#viewvalues").append(' <table class="table table-bordered table-striped" style="margin-top:10px;" id="viewTable"></table>');
					$("#viewTable").append('<tr><th class="class">Code Value ID</th><th class="class">Code Value</th></tr><tr>');
					 $(statusList).each(function(i,obj) {
						var codeValue=obj.codeValue;
						var codevalueId=obj.codeValueId;
						$("#viewTable").append('<tr><td class="class">'+codevalueId+'</td><td>'+codeValue+'</td></tr>');
					
						
					}); 
					 $("#viewvalues").show();
					
			
				}
				});
		 }
		 
		  function defaultValuesfunction(codetypeId,codeType)
		  {
			  var checkCount=0;
			  var maxChecks=1;
			  $.ajax({
					type : 'POST',
					url : $('#contextPath').val()+"/codetype/viewCodevaluesofcodetype.htm?codetypeId="+codetypeId,
					dataType: 'json',
					contentType: 'application/json',
					success : function(result) 
					{
						var statusList=result;  
						$("#defaultvalues").empty();
						$("#defaultvalues").append(' <div id="defaultvalues"><div id="popupwrapper_contactform">');
						$("#defaultvalues").append('<div class="heading_contactform"><h3>Default Values</h3></div><br>'+codetypeId+'['+codeType+']');
						$("#defaultvalues").append('<table  class="table table-bordered  table-striped"  id="defaultTable" style="height: auto;overflow-y:auto"></table>');
						$("#defaultTable").append('<tr><th class="class">Assign a Default value</th></tr>');
						$(statusList).each(function(i,obj) 
						{
								var codeValue=obj.codeValue;
								var codevalueId=obj.codeValueId;
						$("#defaultTable").append(' <tr><td><input id="defaultselector" name="defaultselector" value="'+codevalueId+'" type="checkbox"  onclick="setChecks(this)">'+codevalueId+'  '+codeValue+'</td>');
			  
						 }); 
						 
						 $("#defaultvalues").append('<div class="topbuttonholder" style="text-align:center;"><form><input class="dbtn" value="Save" id="Save" type="button" onclick="saveDefaultValueforCodeValue('+codetypeId+')"><input class="dbtn" value="Cancel" id="Cancel" type="button" onclick="exit()" ></form>');
						 $("#defaultvalues").append('</div></div>');
						 $("#defaultvalues").show();
						
				
					},
					});
		  }
		  
		  
		  function getStringForDelete()
			{ 
			    var selvals = []
			    $('input:checkbox[name=chkdeleteselect]:checked').each(function() {
			    	selvals.push($(this).val());
			    })
			    
			      //alert('Selected Checkbox values are:- ' + selvals);
			  
			   document.getElementById("confirmdelete").value = selvals;
			   if(selvals<=0)
				  {
				  	alert('Please select codeType for delete');
				  	popup('popUpAlertaddnote');
				  }
			   
			    
			  }
			     
		function deleteCodeType()
			 {
			    var selvals= document.getElementById("confirmdelete").value;
			   // alert('Delete Value:-'+selvals);
			    
			    $.ajax({
			    type : 'POST',
			    url : $('#contextPath').val()+"/codetype/deletecodetypes.htm?Lists="+selvals,
			    dataType: 'json',
				contentType: 'application/json',
			    success : function(result)  
			    	{
			    	 
			    	    alert('Delete Codetype successfully');
			    	    location.reload();	
			    	
			     	}
			    }); 
			         
			  }
		 
		  
		  function saveDefaultValueforCodeValue(id)
		  {
			 var codevalueId =$('input:checkbox[name=defaultselector]:checked').val();
			 var codevalueIdInt = parseInt(codevalueId);
			 
			 
			  $.ajax({																
					type : 'POST',
					url : $('#contextPath').val()+"/codetype/saveDefaultValueforCodeValues.htm?codevalueId="+codevalueIdInt+"&codetypeId="+id,
					dataType: 'json',
					contentType: 'application/json',
			   
			  success : function(result) 
			  {
				  alert('Default Code value='+codevalueIdInt);
				  location.reload();
			  }
		  });
		  }
		  
		  function viewValuesToReOrder(codeTypeId,codeType)
		  {
			  $.ajax({
					type : 'POST',
					url : $('#contextPath').val()+"/codetype/viewCodevaluesofcodetype.htm?codetypeId="+codeTypeId,
					dataType: 'json',
					contentType: 'application/json',
					success : function(result) {
						//var statusList=result;
						//$("#reordervalues").append('<div id="popupwrapper_contactform">	<div class="heading_contactform"><h3>Reorder values</h3></div><br>'+codeTypeId+'['+codeType+']</div>');
						$('#select2').empty();
						$(result).each(
								function(i, obj) {

									var codeValue = obj.codeValue;
									var codeValueId = obj.codeValueId;
									i++;
									//alert('code type='+codeType)
									$('#from_select_list').append(
											'<option value="'+codeValueId+'">'
											+codeValueId+'['+ codeValue +']</option>');
								});
						
									$('#select3').empty();
								}
			            
			  });
		  }

	</script>
	<script type="text/javascript"> 
		   
		  //initial checkCount of zero 
		  var checkCount=0;

		  //maximum number of allowed checked boxes 
		  var maxChecks=1;
		  function setChecks(obj)
		  { 
			
			if(obj.checked)
			{ 
				checkCount=checkCount+1;
			}
			else
			{ 
				checkCount=checkCount-1;
			} 	
			if (checkCount>maxChecks)
			{ 
				obj.checked=false ;
				checkCount=checkCount-1 ;
				alert('you may only choose up to '+maxChecks+' options'); 
			} 
		  } 
	</script>
	<script type="text/javascript">

		function move_list_items(sourceid, destinationid)
		{
			$("#"+sourceid+"  option:selected").appendTo("#"+destinationid);
		}


		function move_list_items_all(sourceid, destinationid)
		{
			$("#"+sourceid+" option").appendTo("#"+destinationid);
		}
		 function exit()
		{
			 location.reload();
			/* alert('hi');
			$("#defaultvalues").hide();	
			$("#popUpAlertonaction").hide(); */
				
		} 
		 function saveReorderedList()
		 {
			 move_list_items_all('from_select_list','to_select_list');
			 var ddlArray= new Array();
			 var ddl = document.getElementById('to_select_list');
			 for (i = 0; i < ddl.options.length; i++) {
			    ddlArray[i] = ddl .options[i].value; 
			 }
			 ddlArray.map(function(val) { return val.split(",").reverse().join(","); });
			 var myJoinedString = ddlArray.join(',');
			    
			$.ajax({
					type : 'POST',
					url : $('#contextPath').val()+"/codetype/saveReorderedCodevalues.htm?codeValueIds="+myJoinedString,
					dataType: 'json',
					contentType: 'application/json',
					success : function(result) 
					{
						alert('Successfully Reodered Code values');
						location.reload();
					}
					
					
			    }); 
					
		 }
		 
		 $(document).ready(function() {
			    $('#selecctall').click(function(event) {  
			        if(this.checked) { 
			            $('.checkbox1').each(function() { 
			                this.checked = true;                
			            });
			        }else{
			            $('.checkbox1').each(function() { 
			                this.checked = false;                       
			            });         
			        }
			    });
			    
			});
		 
		 
		 $('#newcodetype').blur(function(){
		     if ($('#newcodetype').val().match(/[^a-zA-Z0-9. ]/g)) {
		              this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
		          }
		     });
		 $('#newDescription').blur(function(){
		     if ($('#newDescription').val().match(/[^a-zA-Z0-9. ]/g)) {
		              this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
		          }
		     });
		 $('#editCodeType').blur(function(){
		     if ($('#editCodeType').val().match(/[^a-zA-Z0-9. ]/g)) {
		              this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
		          }
		     });
		 $('#editCodeTypeDesc').blur(function(){
		     if ($('#editCodeTypeDesc').val().match(/[^a-zA-Z0-9. ]/g)) {
		              this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
		          }
		     });
		 
		 //code for paging and quick search
		 function pagesizeurl()
			{
				var pageSize=$('#page').val();	
			 	window.location.href= $('#contextPath').val()+'/codetype/loadcodetypedata.htm?pageSize='+pageSize;
			} 
		  
			$(document).ready(function() {
			    $('#selecctall').click(function(event) {  
			        if(this.checked) { 
			            $('.checkbox1').each(function() { 
			                this.checked = true;                
			            });
			        }else{
			            $('.checkbox1').each(function() { 
			                this.checked = false;                       
			            });         
			        }
			    });
			    
			});
		 
</script>
</body>