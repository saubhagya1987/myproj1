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
<title>Codevalues List</title>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>
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
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/style_serviceportal.css"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/popup.css" />
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
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
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->


</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
	<input id="codeTypeId" type="hidden" name="codeTypeId"
		value="<%=request.getAttribute("Ids")%>" />	
	<input id="codeType" type="hidden" name="codeType"
		value="<%=request.getParameter("codeValue")%>" />	
		
		

	<!--css popup window 1 close-->
	<!--css popup window start 2-->
	<div style="display: none;" id="blanket"></div>
	<div style="display: none; width: 650px; height: 620px; top: 100px"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote')" href="#"><img alt=""
				src="<%=request.getContextPath()%>/images/btn_close.gif" /></a>
		</div>


		<div id="addnote">
			<div id="popupwrapper_contactform">
				<div class="heading_contactform">
					<h3>Add Code Value</h3>
				</div>
				<form id="addform">
					<div id="poptable_contactform"
						style="padding: 10px; height: 480px;">
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Code Type <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top" style="float: left;">
							<select class="form-control" name="codeTypeId" id="combocodeType"
							onchange="getMaxCodeValueId();getMaxDisplaySeqNo();getParentCodeValues();">
								<!-- <option>City</option> 
							<option>Pune</option>
							<option>Mumbai</option> -->
						</select>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Code Value ID <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							class="form-control" name="codeValueId" id="newCodeValueID"
							readonly="readonly"></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Code Value <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							class="form-control" name="codeValue" id="newCodeValue"></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Description </span> <span
							class="searchpadding padding_top "
							style="float: left; width: 400px;"> <textarea
								class="form-control" rows="5" name="codeValueDescription"
								id="newCodeValueDesc"></textarea></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Display Sequence <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							class="form-control" name="displaySeqNo" id="newDisplaySeq"
							readonly="readonly"></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Parent Code Value </span> <span
							class="searchpadding padding_top"
							style="float: left; width: 300px;"> <select name="Saving"
							class="form-control" name="parentCodeValueId"
							id="combonewParentCodeValue">
								<!-- <option>State</option>
							<option>Maharashatra</option> -->

						</select></span>


						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Control Options <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top "
							style="float: left; width: 400px;"> <input type="checkbox"
							name="isActive" id="chkActive" onchange="setActive()" value="1"
							checked="checked"> <span class="user">Active </span> <input
							type="checkbox" name="isDisplay" id="chkDisplay" value="1"
							onchange="setDisplay()" checked="checked"><span
							class="user">Display </span> <input type="checkbox"
							name="isDefault" id="chkDefault" onchange="setDefault()"
							value="0"><span class="user">Default</span>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Mapped Values<span
							style="font-size: 9px;">[upto 3]</span>
						</span> <span class="searchpadding padding_top "
							style="float: left; width: 400px;"> <input type="text"
							class="form-control" name="mappedValue1" id="newMappedValue1">
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"></span> <span
							class="searchpadding padding_top "
							style="float: left; width: 400px;"> <input type="text"
							class="form-control" name="mappedValue2" id="newMappedValue2"></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"></span> <span
							class="searchpadding padding_top "
							style="float: left; width: 400px;"> <input type="text"
							class="form-control" name="mappedValue3" id="newMappedValue3"></span>
					</div>
				</form>
				<div class="topbuttonholder">
					<input class="dbtn" value="Save & New" id="Save" type="button"
						onClick="addCodeValue(0)"> <input class="dbtn"
						value="Save & Close" id="Save" type="button"
						onClick="addCodeValue(1)"> <input class="dbtn"
						value="Cancel" id="Cancel" type="button"
						onClick="popup('popUpAlertaddnote');reload();">
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
							onclick="deleteCodeValue()"> <input class="dbtn"
							value="No" id="No" type="button"
							onClick="popup('popUpAlertaddnote')">
					</form>
				</div>
			</div>
		</div>

		<!-- delete-->
		<!-- Edit-->
		<div id="editnote">
			<div id="popupwrapper_contactform">

				<div class="heading_contactform">
					<h3>Edit Code Value</h3>
				</div>
				<form id="editform">
					<div id="poptable_contactform"
						style="padding: 10px; height: 480px;">
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Code Type <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <select name="Saving"
							class="form-control" name="codeTypeId" id="cmbcodeType"
							disabled="disabled">

						</select>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Code Value ID <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							class="form-control" name="codeValueId" id="txtCodeValueId"
							readonly="readonly"></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Code Value <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							class="form-control" name="codeValue" id="txtCodeValue"></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Description </span> <span
							class="searchpadding padding_top "
							style="float: left; width: 400px;"> <textarea
								class="form-control" rows="5" name="codeValueDescription"
								id="txtCodevalueDesc"></textarea></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Display Sequence <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top"
							style="float: left; width: 300px;"> <input type="text"
							class="form-control" name="displaySeqNo" id="txtDesplayseq"
							readonly="readonly"></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Parent Code Value </span> <span
							class="searchpadding padding_top"
							style="float: left; width: 300px;"> <select name="Saving"
							class="form-control" name="parentCodeValueId"
							id="editComboParentCodeValue" disabled="disabled">

						</select></span>


						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Control Options <span
							class="red">*</span>
						</span> <span class="searchpadding padding_top "
							style="float: left; width: 400px;"> <input
							id="chkIsActive" name="isActive" type="checkbox"
							onchange="updateActive()"> <span class="user">Active</span>
							<input id="chkIsDisplay" name="isDisplay" type="checkbox"><span
							class="user" onchange="updateDisplay()">Display </span> <input
							id="chkIsDefault" name="isDefault" type="checkbox"><span
							class="user" onchange="updateDefault()">Default</span>
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;">Mapped Values<span
							style="font-size: 9px;">[upto 3]</span>
						</span> <span class="searchpadding padding_top "
							style="float: left; width: 400px;"> <input type="text"
							class="form-control" name="mappedValue1" id="mappedValue1">
						</span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"></span> <span
							class="searchpadding padding_top "
							style="float: left; width: 400px;"> <input type="text"
							class="form-control" name="mappedValue2" id="mappedValue2"></span>
						<div class="clearfix"></div>
						<span class="searchpadding padding_top"
							style="float: left; width: 150px;"></span> <span
							class="searchpadding padding_top "
							style="float: left; width: 400px;"> <input type="text"
							class="form-control" name="mappedValue3" id="mappedValue3"></span>
					</div>
				</form>
				<div class="topbuttonholder">
					<input class="dbtn" value="Save" id="Save" type="button"
						onClick="editCodeValue()"> <input class="dbtn"
						value="Cancel" id="Cancel" type="button"
						onClick="popup('popUpAlertaddnote');reload();">
				</div>
			</div>
		</div>
	</div>

	<!--Nav Menu End-->
	<!--breadcrum Menu Start-->
	</div>
	</div>
	<div class="container">
		<div class="portfoliostrip collapse navbar-collapse">
			<ul class="navbar-sub">
				<li><a
					href="<%=request.getContextPath()%>/codetype/loadcodetypedata.htm">Code
						Type</a></li>
				<%-- <li class="active"><a
					href="<%=request.getContextPath()%>/codetype/loadCodeValue.htm">Code
						List</a></li> --%>
				<li><a
					href="<%=request.getContextPath()%>/notifytemplate/getTemplateList.htm">Notification
						templates</a></li>
				<li><a
					href="<%=request.getContextPath()%>/notifyevent/getEventlist.htm">Notification
						events</a></li>
				<li id="SPProductLink"><a
					href="<%=request.getContextPath()%>/product/loadproductlist.htm">Product</a></li>
				<!-- <li id="SPProductManufacturerLink"><a href="#">Product
						Manufacturer</a></li> -->
			</ul>
		</div>
	</div>


	<!-- Center part start -->
	<section>


		<div class="container white">
			<div class="container-head">
				<div class="col-md-12" style="text-align: right;">
					<!-- accordion start-->

					<div class="accordion pull-left col-md-12" id="accordFundSel">
						<div class="accordion-group">
						<form>
							<div class="col-md-11" style="width: 96%;">
						
								<span style="float: left;">CodeValuesList for <%=request.getParameter("codeValue")%>
								</span>
								<!-- <span
									class="col-md-10" style="float: right; margin-top: -3px;">
									<input name="searchtext" type="text" id="tags"
									placeholder="Quick Search">
								</span> -->
								
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
										<div class="filterbox searchpadding ">
											<div class="head">Control Flags</div>
											<div class="drop_box_body">

												<ul class="nav nav-stacked">
													<li><input id="15Large" value="15Large"
														type="checkbox" checked> Active</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> Display</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> Default</li>



												</ul>

											</div>
										</div>

										<div class="filterbox searchpadding">
											<div class="head">Codetype</div>
											<div class="drop_box_body" style="padding-top: 10px;">

												<input name="text" type="text" id="fname"
													class="form-control" value="" /> <br>
											</div>
										</div>

										<div class="filterbox searchpadding">
											<div class="head">Codevalue</div>
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

					<a href="#" onClick="addNote();"><input data-params="{}"
						type="button" class="dbtn createNewBtn" value="  New Code Value "
						onClick="getcodetype();popup('popUpAlertaddnote')"
						title="New  Code Value" alt="New  Code Value"></a> <a href="#"
						onClick="deleteNote();"><input data-params="{}" type="button"
						class="dbtn deleteBtn" value="  Delete"
						onClick="getcodeValueIdsToUpdate();popup('popUpAlertaddnote')"
						title="Delete" alt="Delete"></a><input type="hidden"
						id="confirmdelete" name="confirmdelete">
				</div>

				<div class="table-responsive" id="display_table_lead"
					style="border: none;">
					<div id="toreload">
						<display:table name="codevaluedata" uid="objPortalUser" class="table table-hover table-bordered table-striped" requestURI="#" sort="list" pagesize="${size}" id="data">
							<display:column>
								<a id="SPCodeListEditLink" href="#" onClick="editNote();"><img
									src="<%=request.getContextPath()%>/images/edit.png" alt="Edit"
									title="Edit"
									onClick="getCodeValueIdToUpdate(${data.codeValueId},'${data.parentCodeValue}'),popup('popUpAlertaddnote')"></a>&nbsp;&nbsp;
							</display:column>
							<display:column
								title="<input type='checkbox' id='selecctall' name='selecctall'/>">
								<span class="thead"> <input type="checkbox"
									id="chkToDeletecodeValueId" name="chkToDeletecodeValueId"
									class="checkbox1" value="${data.codeValueId}">
								</span>
							</display:column>
							<display:column title="Code Type" property="codeType" sortable="true"></display:column>
							<display:column title="Code Value ID" property="codeValueId" sortable="true"></display:column>
							<display:column title="Code Codevalue" property="codeValue" sortable="true"></display:column>
							<display:column title="Display Seq No" property="displaySeqNo" sortable="true"></display:column>
							<display:column title="Parent Code Value" property="parentCodeValue" sortable="true"></display:column>

							<display:column title="Control Flags" sortable="true">

								<table class="table table-bordered " width="100%"
									cellpadding="0" cellspacing="0">
									<tbody>
										<c:choose>
											<c:when test="${data.isDisplay==true}">
												<tr>
													<td><input id="1" type="checkbox" checked="checked">
														<span class="user">Display</span></td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td><input id="1" type="checkbox"> <span
														class="user">Display</span></td>
												</tr>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${data.isDefault==true}">
												<tr>
													<td><input id="1" type="checkbox" checked="checked">
														<span class="user">Default</span></td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td><input id="1" type="checkbox"> <span
														class="user">Default</span></td>
												</tr>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${data.isActive==true}">
												<tr>
													<td><input id="1" type="checkbox" checked="checked">
														<span class="user">Active</span></td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td><input id="1" type="checkbox"> <span
														class="user">Active</span></td>
												</tr>
											</c:otherwise>
										</c:choose>

									</tbody>
								</table>
							</display:column>
							<display:column title="Updated On" property="lastModifiedDate" sortable="true"></display:column>

						</display:table>

						<!-- Center-->
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
						<!-- <div class="customDropdown">
							<span>Page Size:</span>&nbsp; <select type="button"
								name="pageSize" id="page" value="10">
								<option selected="selected" value="10">10</option>
								<option value="20">20</option>
								<option value="50">50</option>
								<option value="100">100&nbsp;</option>
							</select>
						</div> -->
						<div class="customDropdown">
							<span>Page Size:</span>&nbsp; <select type="button"
								name="pageSize" id="page" onchange="pagesizeurl()">

								<option value="10"
									<c:if test="${size==10}"> selected="selected" </c:if>>10</option>
								<option value="20"
									<c:if test="${size==20}"> selected="selected" </c:if>>20</option>
								<option value="50"
									<c:if test="${size==50}"> selected="selected" </c:if>>50</option>
								<option value="500"
									<c:if test="${size==100}"> selected="selected" </c:if>>100</option>
								<option value="1000"
									<c:if test="${size==1000}"> selected="selected" </c:if>>Show All&nbsp;</option>
							</select>
						</div>
					</div>
					<div class="topmenuleft">

						<ul>
							<li>Export options:</li>
							<!-- <li><a href="#" title="Export in CVS" alt="Export in CVS"><i
									class="cvsicon"></i></a></li>
							<li><a href="#" title="Export in Excel"
								alt="Export in Excel"> <i class="excelicon"></i></a></li>
							<li><a href="#" title="Export in XML" alt="Export in XML"><i
									class="xmlcon"></i></a></li> -->
							<li><a
								href="<%=request.getContextPath()%>/codetype/codevalueCSV.htm?codeTypeId=<%=request.getAttribute("Ids")%>"
								title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li>
							<li><a
								href="<%=request.getContextPath()%>/codetype/codevalueExecl.htm?codeTypeId=<%=request.getAttribute("Ids")%>"
								title="Export in Excel" alt="Export in Excel"><i
									class="excelicon"></i></a></li>

						</ul>



					</div>
				</div>
				<div class="topmenu">
					<a href="#" onClick="addNote();"><input data-params="{}"
						type="button" class="dbtn createNewBtn" value="  New Code Value "
						onClick="getcodetype();popup('popUpAlertaddnote');"
						title="New  Code Value" alt="New  Code Value"></a> <a href="#"
						onClick="deleteNote();"><input data-params="{}" type="button"
						class="dbtn deleteBtn" value="  Delete"
						onClick="getcodeValueIdsToUpdate();popup('popUpAlertaddnote')"
						title="Delete" alt="Delete"></a>



				</div>
			</div>

		</div>
		<!-- </div> -->


	</section>
	<!-- Center part End -->

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<script>
		function addNote() {

			$("#addnote").show();
			$("#deletenote, #editnote").hide();
			$("#popUpAlertaddnote").css('height', '620px')
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
			$("#popUpAlertaddnote").css('height', '620px')
			$("#popUpAlertaddnote").css('width', '650px')

		}
		
		function pagesizeurl()
		{	
			
			var codeValue="<%=request.getParameter("codeValue")%>";
			var codeTypeId="<%=request.getAttribute("Ids")%>";
			var pageSize=$('#page').val();	
			//alert(pageSize);
			//alert(codeTypeId);
			//alert(codeValue);
		 	window.location.href= $('#contextPath').val()+"/codetype/loadCodeValue.htm?pageSize="+pageSize+"&codeTypeId="+codeTypeId+"&codeValue="+codeValue;
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
		
		function getcodetype() 
		{
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+ "/codetype/getCodeTypeList.htm",
				success : function(result) 
						{
							$('#combocodeType').empty();
							$('#combocodeType').append('<option value="0">--Select--</option>');
							$(result).each(
									function(i, obj) {

										var codeType = obj.codeType;
										var codeTypeId = obj.codeTypeId;
										i++;
										$('#combocodeType').append('<option value="'+codeTypeId+'">'+ codeType + '</option>');

									});
						}
					});
		}
		
		function getcodetypeTOUpdate() {
					$.ajax({
						type : "POST",
						url : $('#contextPath').val()+ "/codetype/getCodeTypeList.htm",
						success : function(result) {

							$('#combocodeType').empty();
							$('#combocodeType').append('<option value="0">--Select--</option>');
							$(result).each(
									function(i, obj) {

										var codeType = obj.codeType;
										var codeTypeId = obj.codeTypeId;
										i++;
										//alert('code type='+codeType)
										$('#combocodeType').append('<option value="'+codeTypeId+'">'+ codeType +'</option>');

									});
						}
					});
		}
		
		function getMaxCodeValueId() 
		{
			//alert("in maxcode valueID");
			//alert("codetype id="+$('#combocodeType').val());
			var codeTypeID = $('#combocodeType').val();
			//alert('code type id'+codeTypeID);
			
			$.ajax({
				type :"POST",
				url : $('#contextPath').val()+"/codetype/getMaxCodeValueId.htm?codeTypeId="+codeTypeID,
				success : function(result) 
				{
					$('#newCodeValueID').val(result);
					//maxcodevalueId=$('#newCodeValueID').val();
					//alert(maxcodevalueId);
				}
			});
		}   
		
		function getMaxDisplaySeqNo()     
		{
			//alert("in maxdespseqno");
			$.ajax({
				type :"POST",
				url : $('#contextPath').val()+ "/codetype/getMaxDisplaySeqNo.htm?codetypeId="+ $('#combocodeType').val(),
				success : function(result)
				{
					$('#newDisplaySeq').val(result);
					
				}
			});
		}
		
		function getParentCodeValues() 
		{
			var codetypeId = $("#combocodeType").val();
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+ "/codetype/getParentCodeValues.htm?codetypeId="+ codetypeId,
				success : function(result) {
					$('#combonewParentCodeValue').empty();
					$('#combonewParentCodeValue').append('<option value="0">--Select--</option>');
					$(result).each(
							function(i, obj) {

								var codeValue = obj.codeValue;
								var codeValueId = obj.codeValueId;
								i++;
								$('#combonewParentCodeValue').append('<option value="'+codeValueId+'">'+ codeValue + '</option>');
							});
				}

			});

		}

		function addCodeValue(closePopup)
		{
			if(validationForAddCodeValue()==true)
			{
				//alert("1:"+$('#combocodeType').val());
				//alert("2:"+$('#newCodeValueID').val());
				//alert("3:"+$('#chkActive').val());
			 

			$.ajax({
				type : "POST",
				data:$('#addform').serialize(),
				url : $('#contextPath').val()+ "/codetype/addNewCodeValue.htm?",/* codetypeId="+ $('#combocodeType').val() 
								+ "&newCodeValueID="+ $('#newCodeValueID').val()
								+ "&newCodeValue="+ $('#newCodeValue').val()
								+ "&newCodeValueDesc="+ $('#newCodeValueDesc').val()
								+ "&newDisplaySeq="+ $('#newDisplaySeq').val() 
								+ "&parentCodeValue="+ $('#combonewParentCodeValue').val()
								+ "&Active="+ $('#chkActive').val() 
								+ "&Display="+ $('#chkDisplay').val() 
								+ "&Default="+ $('#chkDefault').val() 
								+ "&newMappedValue1="+ $('#newMappedValue1').val() 
								+ "&newMappedValue2="+ $('#newMappedValue2').val() 
								+ "&newMappedValue3="+ $('#newMappedValue3').val(), */
				success : function(result) 
				{
					alert('Successfully Added CodeValue:'+$('#newCodeValueID').val());
					$('#common_popup_div,#shadow_div_web_app').remove();
					
					if(closePopup==0)
			       	{
						  resetval();
		                  getcodetype();
		                  getMaxCodeValueId();
		                  getMaxDisplaySeqNo();
		                  getParentCodeValues();
		                  addNote().show();
		                  popup('popUpAlertaddnote').show();
			    	  
			       	} 
			       	else  
			       	{
			       		reload();
			        }
					
                 
				}
			});
		
			}
		}
function validationForAddCodeValue()
{
	 if ($('#combocodeType').val()=="0" || $('#combocodeType').val()=="") {
		 alert("Code Type is required.");
         return false;
     } 
	 if ( $('#newCodeValueID').val()=="") {
		 alert("Code Value ID is required.");
         return false;
     } 
	 if ( $('#newCodeValue').val()=="") {
		 alert("Code Value is required.");
         return false;
     } 
	 if ( $('#newDisplaySeq').val()=="") {
		 alert("Display Sequence is required.");
         return false;
     } 
	  var isActive = document.getElementById('chkActive').checked;
	  var isDisplay = document.getElementById('chkDisplay').checked;
	  var isDefault = document.getElementById('chkDefault').checked;
	 if(isActive != true && isDisplay  !=true && isDefault !=true) {
         alert("Sharing Options  field should id required!");
         return false;
         } 
	 return true;
}

/* function submitAddCodeValue()
{
	if(validationForAddCodeValue()==true)
		addCodeValue();	
	
} */
		
		

function resetval()
{

$('#combocodeType').val('');
$('#newCodeValueID').val('');
$('#newCodeValue').val('');
$('#newCodeValueDesc').val('');
$('#newDisplaySeq').val('');
$('#combonewParentCodeValue').val('');
document.getElementById("chkActive").checked = true;
document.getElementById("chkDisplay").checked = true;
document.getElementById("chkDefault").checked = false;
$('#newMappedValue1').val('');
$('#newMappedValue2').val('');
$('#newMappedValue3').val('');

}
$('#newCodeValue').blur(function(){
    if ($('#txtCodeValue').val().match(/[^a-zA-Z0-9. ]/g)) {
             this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
         }
    });
$('#newCodeValueDesc').blur(function(){
    if ($('#txtCodeValue').val().match(/[^a-zA-Z0-9. ]/g)) {
             this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
         }
    });
$('#combonewParentCodeValue').blur(function(){
    if ($('#txtCodeValue').val().match(/[^a-zA-Z0-9. ]/g)) {
             this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
         }
    });
$('#newMappedValue1').blur(function(){
    if ($('#txtCodeValue').val().match(/[^a-zA-Z0-9. ]/g)) {
             this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
         }
    });
$('#newMappedValue2').blur(function(){
    if ($('#txtCodeValue').val().match(/[^a-zA-Z0-9. ]/g)) {
             this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
         }
    });
$('#newMappedValue3').blur(function(){
    if ($('#txtCodeValue').val().match(/[^a-zA-Z0-9. ]/g)) {
             this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
         }
    });
		
		
		function getParentCodeValuesToUpdate(id)
		{
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()+"/codetype/getParentCodeValues.htm?codetypeId="+id,
				success : function(result) {
					alert('In Ajax:' + result);
					$('#editComboParentCodeValue').empty();
					$('#editComboParentCodeValue').append('<option value="0">--Select--</option>');
					$(result).each(
							function(i, obj) {

								var codeValue = obj.codeValue;
								var codeValueId = obj.codeValueId;
								i++;
								$('#editComboParentCodeValue').append('<option value="'+codeValueId+'">'+ codeValue + '</option>');
							});
				}

			});

		}
		function setActive() {
			var x;

			if ($("#chkActive").is(":checked")) {

				$('#chkActive').val(1);
				x = $("#chkActive").val();

			} else {
				$('#chkActive').val(0);
				x = $("#chkActive").val();
			}
		}
		function setDisplay() {
			if ($("#chkDisplay").is(":checked")) {

				$('#chkDisplay').val(1);

			} else {
				$('#chkDisplay').val(0);
			}
		}
		function setDefault() {
			if ($("#chkDefault").is(":checked")) {

				$('#chkDefault').val(1);

			} else {
				$('#chkDefault').val(0);
			}
		}
	    function getCodeValueIdToUpdate(id,parentCodeValue)
	    {
	    	 	$.ajax({
				type : "POST",
				url : $('#contextPath').val()+ "/codetype/getCodeValueDetalisToUpdate.htm?codeValueId="+id,
				dataType: 'json',
				contentType: 'application/json',
				success : function(result) 
				{
										var details=result;
										
										
										$(details).each(function(i,obj) {
											$('#cmbcodeType').append(
													'<option value="'+obj.codeTypeId+'">'
															+ obj.codeType + '</option>');
											
											$('#editComboParentCodeValue').append(
													'<option value="'+1+'">'
															+ parentCodeValue + '</option>');	
											var codeType=obj.codeType;
											var codeValueId=obj.codeValueId;
											var codeValue=obj.codeValue;
											var displaySeq=obj.displaySeqNo;
											var codeValueDescription=obj.codeValueDescription;
											var isDisplay=obj.isDisplay;
											var isDefault=obj.isDefault;
											var isActive=obj.isActive;
											var mappedValue1=obj.mappedValue1;
											var mappedValue2=obj.mappedValue2;
											var mappedValue3=obj.mappedValue3;
											
											$('#txtDesplayseq').val(displaySeq);
											$('#txtCodeValue').val(codeValue);
											$('#txtCodeValueId').val(codeValueId);
											$('#txtCodevalueDesc').val(codeValueDescription);
											$('#mappedValue1').val(mappedValue1);
											$('#mappedValue2').val(mappedValue2);
											$('#mappedValue3').val(mappedValue3);
											
											//alert("codevaluedescription="+codevalueDesc);
											
										if(isDisplay == true)
											{
												$("#chkIsDisplay").attr("checked", true);
											}
										else $("#chkIsDisplay").attr("checked", false);
										if(isDefault == true)
											{
												$("#chkIsDefault").attr("checked", true);
											}
										else $("#chkIsDefault").attr("checked", false);
										
										if(isActive == true)
											{
												$("#chkIsActive").attr("checked", true);
											}
										else $("#chkIsActive").attr("checked", false);
										
										});
					
								}
					 });
					 
				
				   
	    }
	    function validationForEditCodeValue()
	    {
	    	 
	    	 if ( $('#txtCodeValue').val()=="") {
	    		 alert("Code Value ID is required.");
	             return false;
	         } 
	    	 if ( $('#txtDesplayseq').val()=="") {
	    		 alert("Display Sequence is required.");
	             return false;
	         } 
	    	  var isActive = document.getElementById('chkIsActive').checked;
	    	  var isDisplay = document.getElementById('chkIsDisplay').checked;
	    	  var isDefault = document.getElementById('chkIsDefault').checked;
	    	 if(isActive != true && isDisplay  !=true && isDefault !=true) {
	             alert("Sharing Options field should id required!");
	             return false;
	             } 
	    	 return true;
	    }
	    
	    function editCodeValue()
	    {
	    	if(validationForEditCodeValue()==true)
	    	{
	    		var codevalueId=$('#txtCodeValueId').val();
	    		if ($("#chkIsActive").is(":checked")) 
	    		{
					$('#chkIsActive').val(1);
					x = $("#chkIsActive").val();
				} 
	    		else 
	    		{
					$('#chkIsActive').val(0);
					x = $("#chkIsActive").val();
				}
	    		if ($("#chkIsDisplay").is(":checked")) 
	    		{
					$('#chkIsDisplay').val(1);
					x = $("#chkIsDisplay").val();
				} 
	    		else 
	    		{
					$('#chkIsDisplay').val(0);
					x = $("#chkIsDisplay").val();
				}
	    		if ($("#chkIsDefault").is(":checked")) 
	    		{
					$('#chkIsDefault').val(1);
					x = $("#chkIsDefault").val();

				} 
	    		else 
	    		{
					$('#chkIsDefault').val(0);
					x = $("#chkIsDefault").val();
				}
	    		$.ajax({
				type : "POST",
				data:$('#editform').serialize(),
				url : $('#contextPath').val()+ "/codetype/updateCodeValue.htm?",/* codevalueId="+codevalueId+ "&codeValue="
						+ $('#txtCodeValue').val()+ "&codeValueDescription="
						+ $('#txtCodevalueDesc').val()+ "&desplayseq="
						+ $('#txtDesplayseq').val()+ "&isActive="
						+ $('#chkIsActive').val()+ "&isDisplay="
						+ $('#chkIsDisplay').val()+ "&isDefault="
						+ $('#chkIsDefault').val()+ "&mappedValue1="
						+ $('#mappedValue1').val()+ "&mappedValue2="
						+ $('#mappedValue2').val()+ "&mappedValue3="
						+ $('#mappedValue3').val(), */
				success : function(result) 
				{
					//alert('No Of Rows Updated='+result);
					alert('Record updated successfully..!!');
					reload();
				}
	    	});
	    	}
	    };
	    
	 
	    function updateDisplay()
	    {
	    	var x;

			if ($("#chkIsDisplay").is(":checked")) {

				$('#chkIsDisplay').val(1);
				x = $("#chkIsDisplay").val();

			} else {
				$('#chkIsDisplay').val(0);
				x = $("#chkIsDisplay").val();
			}
	    	
	    }
	   
	    function updateActive()
	    {
	    	var x;

			if ($("#chkIsActive").is(":checked")) {

				$('#chkIsActive').val(1);
				x = $("#chkIsActive").val();

			} else {
				$('#chkIsActive').val(0);
				x = $("#chkIsActive").val();
			}
	    	
	    }
	    function updateDefault()
	    {
	    	var x;

			if ($("#chkIsDefault").is(":checked")) {

				$('#chkIsDefault').val(1);
				x = $("#chkIsDefault").val();

			} else {
				$('#chkIsDefault').val(0);
				x = $("#chkIsDefault").val();
			}
	    }
	  
	    
	    function reload()
	    {
	    	location.reload(1);
	    }
		
	</script>

	<script lang="javascript">
	  
	  function  getcodeValueIdsToUpdate()
		{ 
		    var selvals = []
		    $('input:checkbox[name=chkToDeletecodeValueId]:checked').each(function() {
		    	selvals.push($(this).val());
		    })
		    
		      //alert('Selected Checkbox values are:- ' + selvals);
		  
		   document.getElementById("confirmdelete").value = selvals;
		   if(selvals<=0)
			  {
			  	alert('Please select codevalue for delete');
			  	popup('popUpAlertaddnote');
			  	
			  }
		   
		    
		  }
		     
	function deleteCodeValue()
		 {
		    var selvals= document.getElementById("confirmdelete").value;
		    //alert('Delete Value:-'+selvals);
		    
		    $.ajax({
		    type : 'POST',
		    url : $('#contextPath').val()+"/codetype/deletecodevalues.htm?Lists="+selvals,
		    dataType: 'json',
			contentType: 'application/json',
		    success : function(result)  
		    	{
		    	 
		    	    alert('Delete codevalue successfully.');
		    	    reload();	
		    	
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


    
         $('#newCodeValueID').blur(function(){
         if ($('#txtCodeValue').val().match(/[^a-zA-Z0-9. ]/g)) {
                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
             }
          });
         $('#txtCodeValue').blur(function(){
         if ($('#txtCodeValue').val().match(/[^a-zA-Z0-9. ]/g)) {
                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
             }
         });
         $('#txtCodevalueDesc').blur(function(){
         if ($('#txtCodevalueDesc').val().match(/[^a-zA-Z0-9. ]/g)) {
                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
             }
         });
    
         $('#mappedValue1').blur(function(){
         if ($('#txtCodevalueDesc').val().match(/[^a-zA-Z0-9. ]/g)) {
                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
            }
            })
        
         $('#mappedValue2').blur(function(){
         if ($('#mappedValue2').val().match(/[^a-zA-Z0-9. ]/g)) {
                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
            }
            })
         $('#mappedValue3').blur(function(){
         if ($('#mappedValue3').val().match(/[^a-zA-Z0-9. ]/g)) {
                 this.value = this.value.replace(/[^a-zA-Z0-9. ]/g, '');
            }
            })
	</script>

	</script>
</body>
</html>

