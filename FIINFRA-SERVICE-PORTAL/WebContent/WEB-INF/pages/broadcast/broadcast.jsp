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
<title>Broadcast</title>


</head>

<body>
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
	<!--css popup window 1 close-->
	<!--css popup window start 2-->
	<div style="display: none;" id="blanket"></div>
	

		
			<!-- <div id="addnote"> -->
	<div class="modal fade" id="addnote" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"aria-label="Close" onclick="reload();">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Add Broadcast</h4>
				</div>
				<div id="success-msg"></div>
				<div id="form-box">


					<!-- --------------------Add broadcast form start----------------------------- -->
					<form id="myForm" name="mybrodcast" method="post"
						class="form-horizontal">
						<input type="hidden" id="broadDesphidden" name="description">
						<input type="hidden" name="sourceIdList" id="sourceIdList">
						<input type="hidden" name="confirmdelete" id="confirmdelete"
							value=""> <input type="hidden" id="hiddenIsToClose"
							name="hiddenIsToClose"
							value="<%=request.getAttribute("hiddenIsToClosee")%>" />
						<!--  <input type="hidden" name="description" id="hdndescription" /> -->
						<div class="modal-body">



							<div id="success-msg"></div>
							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Title ">Source System: <span class="red">*</span></label>
									<div class="col-sm-9">




										<span class="searchpadding padding_top" style="float: left;"
											id="sourceSysId"> <!-- <select name="sourceSystemId" class="form-control" id="sourceSysId">
								</select> -->

										</span>
									</div>
								</div>
							</div>




							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Title ">Section <span class="red">*</span></label>
									<div class="col-sm-9">



										<select name="broadCastSectionId" class="form-control"
											id="secId">

										</select>

									</div>
								</div>
							</div>



							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Title ">Title <span class="red">*</span></label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="broadcastTitle"
											name="broadCastTitle" placeholder=" ">

									</div>
								</div>
							</div>
							<div class="row">

								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Description ">Description </label>
									<div class="col-sm-9">
										<div class="wysiwyg-editor" id="broadDesp" name="description"></div>

									</div>
								</div>
							</div>



							<!-- <div class="clearfix"></div> -->

							<span class="searchpadding padding_top"
								style="float: left; width: 165px;"> </span> <span
								class="searchpadding padding_top "
								style="float: left; width: 400px;"> <input type="hidden"
								id="newtempid" style="float: left;"> <span
								style="float: left; margin: 5px;"> </span>
							</span>
							<!-- <div class="clearfix"></div> -->




							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Title ">Starts On <span class="red">*</span></label>
									<div class="col-sm-9">



										<span class="searchpadding padding_top "
											style="float: left; width: 400px;"> <input type="text"
											name="startDate" id="startDatepickerId" readonly="readonly"
											style="float: left;">
										</span>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Title ">Expires On <span class="red">*</span></label>
									<div class="col-sm-9">


										<span class="searchpadding padding_top "
											style="float: left; width: 400px;"> <input type="text"
											id="expiryDatepickerId" name="expiryDate" readonly="readonly"
											style="float: left;">
										</span>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Control Options ">Control Options <span
										class="red">*</span></label>
									<div class="col-sm-9">

										<span class="searchpadding padding_top "
											style="float: left; width: 400px;"> <input
											id="displayPopId" name="loginPopUpDisplay" type="checkbox"
											value="1"> <span class="user">Display in
												Pop-up window on Login?</span></span>

									</div>
								</div>
							</div>




							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="form-group col-md-12 clearfix"
										for="Control Options ">TargetRecipients of the
										Broadcast: <span class="red">*</span>
									</label>

								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Control Options ">Biz Unit <span class="red">*</span></label>
									<div class="col-sm-3">
										<span class="searchpadding padding_top ">
											 <input type="radio" name="BU" id="all1" value="1" checked="checked"  onClick="biz('1')">
											 &nbsp;All 
											 <input type="radio" name="BU" id="sel1" value="0" onClick="biz('0');loadBizUnit('add',0);">
											 &nbsp;Selected
											</span>
											</div>
										<div class="col-sm-6">
										 <span id="biz" class=" none"> 
											 	<select name="buPartyId" class="form-control" id="bzunit"></select></span>							 
									
									</div>
										
								</div>
							</div>


							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Control Options ">User Type <span class="red">*</span></label>
									<div class="col-sm-3">
										<span class="searchpadding padding_top ">
										 <input type="radio" id="all2" name="Usrtype" value="1" checked="checked" onClick="user('1')">
										 &nbsp;All
										  <input type="radio" id="sel2" name="Usrtype" value="0" onClick="user('0'); loadUserType('add',0);" />
										  &nbsp;Selected
										</span>
									</div>
									<div class="col-sm-6">
									<span id="user" class=" none">
										<select name="partyRecordTypeId" class="form-control" id="utypeddId"></select>
									 </span>									
									</div>
								</div>
							</div>








							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Control Options ">Role <span class="red">*</span></label>
									<div class="col-sm-3">
										<span class="searchpadding padding_top "> 
										<input type="radio" id="all3" name="roledd" value="1" checked="checked" onClick="role('1')">
										&nbsp;All
										 <input type="radio" id="sel3" name="roledd" value="0" 	onClick="role('0'); loadRole('add',0);" />
										 &nbsp;Selected 
											
										</span>
									</div>
									<div class="col-sm-6">
										<span id="role" class=" none" >
											<select name="roleID" class="form-control" id="roleID"></select>

										</span>						 
									
									</div>
								</div>
							</div>



							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Control Options ">City <span class="red">*</span></label>
									<div class="col-sm-3">
										<span class="searchpadding padding_top "> <input
											type="radio" id="all4" name="citydd" value="1"
											checked="checked" onClick="city('1')">
											&nbsp;All 
											<input 	type="radio" id="sel4" name="citydd" value="0" onClick="city('0'); loadCity('add',0);" />
											&nbsp;Selected 
											
										</span>
									</div>
									<div class="col-sm-6">
										<span id="city" class=" none">
											<select name="cityId" class="form-control" id="citydropId">
											</select>
											</span>
									</div>
								</div>
							</div>

							<div class="topbuttonholder">
								<div style="float: right;">

									<button data-bb-handler="confirm" type="button"
										class="btn btn-primary btn-sm" id="SPAddNewBroadCastLink"
										onclick="submitAddDownload(0);">Save & New</button>
									<button data-bb-handler="confirm" type="button"
										class="btn btn-primary btn-sm" id="SPAddNewBroadCastLink"
										onclick="submitAddDownload(1);">Save & Close</button>
									<button data-bb-handler="cancel" type="button"
										class="btn btn-sm btn-danger" type="button" class="close"
										data-dismiss="modal" aria-label="Close" onclick="reload();">
										<i class="ace-icon fa fa-close"></i> Cancel
									</button>


								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- --------------------Add broadcast form end----------------------------- -->

		<!-- delete-->

	<div class="modal fade" id="deletenote" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Message</h4>
					<!-- <div id="deletenote"> -->
					Do you want to delete this Broadcast items ? Please confirm.
					<div style="float: right;">
						<form>

							<button data-bb-handler="confirm" type="button"
								class="btn btn-primary btn-sm" id="Yes"
								onclick="confirmDelete();">Yes</button>
							<button data-bb-handler="cancel" type="button"
								class="btn btn-sm btn-danger" type="button" class="close"
								data-dismiss="modal" aria-label="Close">
								<i class="ace-icon fa fa-close"></i> No
							</button>

						</form>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>

	<!-- delete-->


		<!-- Edit broadcast form start--->


	<div class="modal fade" id="editnote" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"aria-label="Close" onclick="reload();">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Edit Broadcast</h4>
				</div>		

					<form id="editmyForm" name="mybrodcast" class="form-horizontal"
						action="<%=request.getContextPath()%>/broadcast/addNewBroadcast.htm"
						method="post">
					<!-- 	<input type="hidden" id="broadDesphidden" name="description"> -->
						<input type="hidden" name="sourceIdList" id="sourceIdListedt">
						<input type="hidden" name="id" id="hdnbroadCastId" />
									

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Title ">Source System: <span class="red">*</span></label>
								<div class="col-sm-9">

									<span class="searchpadding padding_top" style="float: left;"
										id="editsourceSysId"> </span>
								</div>
							</div>
						</div>



						<!-- <div class="clearfix"></div> -->


						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Title ">Section <span class="red">*</span></label>
								<div class="col-sm-9">



									<select name="broadCastSectionId" class="form-control"
										id="editsecId">

									</select>

								</div>
							</div>
						</div>

						<!-- <div class="clearfix"></div> -->

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Title ">Title <span class="red">*</span></label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="editbroadcastTitle"
										name="broadCastTitle" placeholder=" ">


								</div>
							</div>
						</div>

						<!-- <div class="clearfix"></div> -->


						<div class="row">
							<input type="hidden" id="editbroadDesphidden" name="description">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Title ">Description </label>
								<div class="col-sm-9">
									<div class="wysiwyg-editor" id="editbroadDesp"></div>

								</div>
							</div>
						</div>



						<!-- <div class="clearfix"></div> -->





						<span class="searchpadding padding_top"
							style="float: left; width: 165px;"> </span> <span
							class="searchpadding padding_top "
							style="float: left; width: 300px;"> <input type="hidden"
							id="newtempid" style="float: left;"> <span
							style="float: left; margin: 5px;"> </span>
						</span>



						<!-- <div class="clearfix"></div> -->


						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Title ">Starts On <span class="red">*</span></label>
								<div class="col-sm-9">
									<span class="searchpadding padding_top "
										style="float: left; width: 390px;"> <input type="text"
										name="startDate" id="editstartDatepickerId"
										readonly="readonly" style="float: left;"> <!-- <span
								style="float: left; margin: 5px;"> </span> -->
									</span>
								</div>
							</div>
						</div>


						<!-- <div class="clearfix"></div> -->

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Title ">Expires On <span class="red">*</span></label>
								<div class="col-sm-9">

									<span class="searchpadding padding_top "
										style="float: left; width: 390px;"> <input type="text"
										id="editexpiryDatepickerId" name="expiryDate"
										readonly="readonly" style="float: left;">
									</span>
								</div>
							</div>
						</div>
						<!-- <div class="clearfix"></div> -->

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="col-sm-3 control-label no-padding-right"
									for="Control Options ">Control Options <span
									class="red">*</span></label>
								<div class="col-sm-9">

									<!-- <span class="searchpadding padding_top"
							style="float: left; width: 165px;">Control Options </span>  -->
									<span class="searchpadding padding_top "
										style="float: left; width: 400px;"> <input
										id="editdisplayPopId" name="loginPopUpDisplay" type="checkbox"
										value="1"> <span class="user">Display in Pop-up
											window on Login?</span></span>

								</div>
							</div>
						</div>

						<!-- <div class="clearfix"></div> -->

						<div class="row">
							<div class="form-group col-md-12 clearfix">
								<label class="form-group col-md-12 clearfix"
									for="TargetRecipients of the Broadcast: ">TargetRecipients
									of the Broadcast: <span class="red">*</span>
								</label>

							</div>
						</div>

						<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Control Options ">Biz Unit <span class="red">*</span></label>
									<div class="col-sm-3">
										<span class="searchpadding padding_top ">
											 <input type="radio" name="editBU" id="editall1" value="1" checked="checked"  onClick="editbiz('1')">
											 &nbsp;All 
											 <input type="radio" name="editBU" id="editsel1" value="0" onClick="editbiz('0');loadBizUnit('edit',0);">
											 &nbsp;Selected
											</span>
											</div>
										<div class="col-sm-6">
										 <span id="editbiz" class=" none">
										 <select name="buPartyId" class="form-control" id="editbzunit">
										 </select> 
										</span>			 
									</div>
										
								</div>
							</div>
						
							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Control Options ">User Type<span class="red">*</span></label>
									<div class="col-sm-3">
										<span class="searchpadding padding_top ">
											 <input type="radio" name="editUsrtype" id="editall2" value="1" checked="checked"  onClick="edituser('1')">
											 &nbsp;All 
											 <input type="radio" name="editUsrtype" id="editsel2" value="0" onClick="edituser('0');loadUserType('edit',0);">
											 &nbsp;Selected
											</span>
											</div>
										<div class="col-sm-6">
										 <span id="edituser" class=" none">
									<select name="partyRecordTypeId" class="form-control" id="editutype"></select>										  
										</span>			 
									</div>
										
								</div>
							</div>
							
							<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="Role">Role<span class="red">*</span></label>
									<div class="col-sm-3">
										<span class="searchpadding padding_top ">
											 <input type="radio" name="editroledd" id="editall3" value="1" checked="checked"  onClick="editrole('1')">
											 &nbsp;All 
											 <input type="radio" name="editroledd" id="editsel3" value="0" onClick="editrole('0');loadRole('edit',0);">
											 &nbsp;Selected
											</span>
											</div>
										<div class="col-sm-6">
										 <span id="editrole" class=" none">
									<select name="roleID" class="form-control" id="editroleID">
									</select>
										</span>			 
									</div>
										
								</div>
							</div>

					

								<div class="row">
								<div class="form-group col-md-12 clearfix">
									<label class="col-sm-3 control-label no-padding-right"
										for="City">City<span class="red">*</span></label>
									<div class="col-sm-3">
										<span class="searchpadding padding_top ">
											 <input type="radio" name="editcitydd" id="editall4" value="1" checked="checked"  onClick="editcity('1')">
											 &nbsp;All 
											 <input type="radio" name="editcitydd" id="editsel4" value="0" onClick="editcity('0');loadCity('edit',0);">
											 &nbsp;Selected
											</span>
											</div>
										<div class="col-sm-6">
										 <span id="editcity" class=" none">
							<select name="cityId" class="form-control" id="editcitydropId">	</select>
										</span>			 
									</div>
										
								</div>
							</div>

					

						<div style="float: right">

							<button data-bb-handler="confirm" type="button"
								class="btn btn-primary btn-sm" id="Save"
								onclick="submitEditedBroadCast();">Save</button>
							<button data-bb-handler="cancel" type="button"
								class="btn btn-sm btn-danger" type="button" class="close"
								data-dismiss="modal" aria-label="Close" onclick="reload();">
								<i class="ace-icon fa fa-close"></i> Cancel
							</button>

						</div>
						<div class="clearfix"></div>
					</form>
				

			</div>
		</div>
	</div>




	<!-- Edit broadcast form end--->
	<!-- </div> -->
	<!--css popup window 2 close-->


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
	<section id="hidebroadcast">


		<div>
			<div class="container-head">
				<div class="col-md-12" style="text-align: right;">
					<!-- accordion start-->
					<div class="accordion pull-left col-md-12" id="accordFundSel">
						<div class="accordion-group">
						
						<div class="page-header clearfix">
           					 <h1 class="pull-left">Broadcast List</h1>
           						 <div class="nav-search pull-right" id="">
              					<form class="form-search">
               				
             		 </form>
           		 </div>
         		 </div>  
							
							
							<div style="height: auto;" id="collapseFundSel"
								class="accordion-body pull-left serchboxnew collapse">
								<div class="accordion-inner table-responsive">
									<div style="width: 1211px;">
										<!--1 search start -->
										<div class="filterbox searchpadding ">
											<div class="head">Section</div>
											<div class="drop_box_body">

												<ul class="nav nav-stacked">
													<li><input id="15Large" value="15Large"
														type="checkbox" checked> Active</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> Training Prog</li>
													<li><input id="15Large" value="15Large"
														type="checkbox"> System Alert</li>
												</ul>
											</div>
										</div>

										<div class="filterbox searchpadding">
											<div class="head">Validity Dates</div>
											<div class="drop_box_body" style="padding-top: 10px;">
												Start Date: <input name="text" type="text" id="fname"
													class="form-control" value="" /> Expiry Date: <input
													name="text" type="text" id="fname" class="form-control"
													value="" /> <br>
											</div>
										</div>

										<div class="filterbox searchpadding">
											<div class="head">Display Options</div>
											<div class="drop_box_body" style="padding-top: 10px;">
												<ul class="nav nav-stacked">
													<li><input id="15Large" value="15Large"
														type="checkbox" checked>Popup on Login</li>
												</ul>
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
					
				</ul>
				<div class="topmenu" style="float:right">
					<a id="SPAddNewBroadCastLink" href="#" onClick="addNote();"
						class="pagerLink"> <input data-params="{}" type="button"
						class="btn btn-sm btn-primary" value="  New Broadcast"
						 title="New  Broadcast"
						alt="New Broadcast" />
					</a> <a id="SPDeleteBroadCastLink" href="#" onClick="">
						<input data-params="{}" type="button" class="btn btn-sm btn-danger"
						value="  Delete" onClick="deleteDownloadItems();" title="Delete"
						alt="Delete" />
					</a>
					
					
					
					
					
					
				</div>
				<div class="table-responsive" id="display_table_lead"
					style="border: none;">
					<div id="toreload">

						<table id="grid-table"></table>
						<div id="grid-pager"></div>


					</div>
				</div>
				<div class="col-sm-7">
					<ul class="pagination pagination-sm"
						style="float: left; margin-right: 20px;">
						
					</ul>
					<div class="topmenuleft">
						<div class="customDropdown">


								




							</select>

						</div>
					</div>
					<div class="topmenuleft">
						<ul>
							<span>Export options:</span>
							
							<a
								href="<%=request.getContextPath()%>/broadcast/exportBroadcast.htm?type=CSV&searchtext=${searchTextVal}"
								title="Export in CSV" alt="Export in CSV"><i class="fa fa-file-pdf-o bigger-120"></i></a>
							<a
								href="<%=request.getContextPath()%>/broadcast/exportBroadcast.htm?type=excel&searchtext=${searchTextVal}"
								title="Export in Excel" alt="Export in Excel"> <i
									class="fa fa-file-excel-o bigger-120"></i></a>

							<!-- <li><a href="#" title="Export in XML" alt="Export in XML"><i
										class="xmlcon"></i></a></li> -->
						</ul>
					</div>
				</div>
				<div class="topmenu" style="float:right">
					<a id="SPAddNewBroadCastLink" href="#" onClick="addNote();"> <input
						data-params="{}" type="button" class="btn btn-sm btn-primary"
						value="  New Broadcast"
						title="New  Broadcast" alt="New  Broadcast"></a> <a
						id="SPDeleteBroadCastLink" href="#" > <input
						data-params="{}" type="button" class="btn btn-sm btn-danger"
						value="  Delete" onClick="deleteDownloadItems();" title="Delete"
						alt="Delete">
					</a>
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
	function reload(){
		location.reload();
		
	}
		//select all checkbox
		$(document).ready(function() {
			$('#selecctall').click(function(event) { //on click 
				if (this.checked) { // check select status
					$('.checkbox1').each(function() { //loop through each checkbox
						this.checked = true; //select all checkboxes with class   "checkbox1"               
					});
				} else {
					$('.checkbox1').each(function() { //loop through each checkbox
						this.checked = false; //deselect all checkboxes with class "checkbox1"                       
					});
				}
			});

		});

		function addNote() {
			
			$("#deletenote, #editnote").hide();	
			$('#addnote').modal('show');   

		}

		function deleteNote() {

			$(" #editnote,#addnote").hide();	
			$('#deletenote').modal('show'); 

		}

		function editNote() {
			$("#deletenote,#addnote").hide();	
			$('#editnote').modal('show'); 

	
		}

		function editbiz(a) {
			if (a == 1) {
				$("#editbiz").hide();
				$("#editsel1").prop("checked", false);
			}

			if (a == 0) {
				$("#editbiz").show();
				$("#editall1").prop("checked", false);
			}
			//$("#edituser, #editrole, #editcity").hide();	
		}

		function edituser(val) {
			if (val == 1) {
				$("#edituser").hide();
				$("#editsel2").prop("checked", false);
			}
			if (val == 0) {
				$("#edituser").show();
				$("#editall2").prop("checked", false);
			}
			//$("#editbiz, #editrole, #editcity").hide();	
		}

		function editrole(val) {
			if (val == 1) {
				$("#editrole").hide();
				$("#editsel3").prop("checked", false);
			}
			if (val == 0) {
				$("#editrole").show();
				$("#editall3").prop("checked", false);
			}
			//$("#editbiz, #edituser, #editcity").hide();		
		}

		function editcity(val) {
			if (val == 1) {
				$("#editcity").hide();
				$("#editsel4").prop("checked", false);
			}
			if (val == 0) {
				$("#editcity").show();
				$("#editall4").prop("checked", false);
			}
			//$("#editbiz, #edituser, #editrole").hide();		
		}

		function biz(a) {

			if (a == 1) {
				$("#biz").hide();
				$("#sel1").prop("checked", false);
			}

			if (a == 0) {
				$("#biz").show();
				$("#all1").prop("checked", false);
			}
			//$("#user, #role, #city").hide();	
		}

		function user(val) {
			if (val == 1) {
				$("#user").hide();
				$("#sel2").prop("checked", false);
			}
			if (val == 0) {
				$("#user").show();
				$("#all2").prop("checked", false);
			}
			//$("#biz, #role, #city").hide();	
		}

		function role(val) {
			if (val == 1) {
				$("#role").hide();
				$("#sel3").prop("checked", false);
			}
			if (val == 0) {
				$("#role").show();
				$("#all3").prop("checked", false);

			}
			//$("#biz, #user, #city").hide();		
		}

		function city(val) {
			if (val == 1) {
				$("#city").hide();
				$("#sel4").prop("checked", false);
			}
			if (val == 0) {
				$("#city").show();
				$("#all4").prop("checked", false);
			}

			//$("#biz, #user, #role").hide();		
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

		// on page load get section
		$(document).ready(function() {

			getSection('add', 0);
			getSourceSystem('add', 0);
		})

		// get business unit
		function loadBizUnit(action, buId) {

			$.ajax({

				type : "POST",
				//url: $('#contextPath').val()+'/faq/getBupartyname.htm',
				url : $('#contextPath').val() + '/faq/getBupartyname.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					if (action == 'edit') {

						var id = '#editbzunit';
						$('#editbzunit').empty();
					} else {

						var id = '#bzunit';
						$('#bzunit').empty();

					}
					$(result).each(
							function(i, obj) {

								var bupartyid = obj.buId;
								var bupartyname = obj.lastName;

								if (buId == bupartyid) {

									$(id).append(
													'<option value="'+ bupartyid+'" selected="selected">'
															+ bupartyname
															+ '</option>');
								} else {

									$(id)
											.append(
													'<option value="'+ bupartyid+'">'
															+ bupartyname
															+ '</option>');
								}

							});
				}

			});
		}

		//get user type
		function loadUserType(action, utId) {
			$.ajax({

				type : "POST",
				url : $('#contextPath').val() + '/broadcast/getUserType.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {
					if (action == 'edit') {

						var id = '#editutype';
						$('#editutype').empty();
					} else {

						var id = '#utypeddId';
						$('#utypeddId').empty();

					}

					$(result).each(
							function(i, obj) {

								var module = obj.userTypeName;
								var moduleid = obj.partyRecordTypeId;

								if (utId == moduleid) {

									$(id).append(
											'<option value="'+ moduleid+'" selected="selected">'
													+ module + '</option>');
								} else {
									$(id).append(
											'<option value="'+ moduleid+'">'
													+ module + '</option>');
								}

							});
				}

			});
		}

		// get role
		function loadRole(action, rolId) {
			$.ajax({

				type : "POST",
				url : $('#contextPath').val() + '/broadcast/getRoleList.htm',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {
					if (action == 'edit') {

						var id = '#editroleID';
						$('#editroleID').empty();
					} else {

						var id = '#roleID';
						$('#roleID').empty();

					}
					$(result).each(
							function(i, obj) {

								var rolename = obj.roleName;
								var roleid = obj.roleID;

								if (rolId == roleid) {

									$(id).append(
											'<option value="'+ roleid+'" selected="selected">'
													+ rolename + '</option>');
								} else {
									$(id).append(
											'<option value="'+ roleid+'">'
													+ rolename + '</option>');
								}

							});
				}

			});
		}

		//get city
		function loadCity(action, ctyId) {

			$.ajax({

				type : "POST",
				// url: $('#contextPath').val()+'/broadcast/getCityList.htm',
				url : $('#contextPath').val()
						+ '/faq/getPicklistValues.htm?codeTypeIds=1',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					if (action == 'edit') {

						var id = '#editcitydropId';
						$('#editcitydropId').empty();
					} else {

						var id = '#citydropId';
						$('#citydropId').empty();

					}

					$(result).each(
							function(i, obj) {

								var codeVal = obj.codeValue;
								var codeValId = obj.codeValueId;
								// $('#citydropId').append('<option value="'+ codeValId+'">'+ codeVal + '</option>');

								if (ctyId == codeValId) {

									$(id).append(
											'<option value="'+ codeValId+'" selected="selected">'
													+ codeVal + '</option>');
								} else {
									$(id).append(
											'<option value="'+ codeValId+'">'
													+ codeVal + '</option>');
								}

							});
				}

			});
		}

		function selectPortal() {

			$(".chk").prop("checked", $("#chkAll").prop("checked"));

		}

		function selectPortalEdit() {

			$(".chkedit").prop("checked", $("#chkAllEdit").prop("checked"));

		}

		function sourceCheckBoxedit() {
			var flag = 0;
			$(".chkedit").each(function() {
				if (!$(this).is(":checked"))
					flag = 1;
			})
			if (flag == 0) {
				$("#chkAllEdit").prop("checked", true);
			} else {
				$("#chkAllEdit").prop("checked", false);
			}
		}

		function sourceCheckBox() {
			var flag = 0;
			$(".chk").each(function() {
				if (!$(this).is(":checked"))
					flag = 1;
			})
			if (flag == 0) {
				$("#chkAll").prop("checked", true);
			} else {
				$("#chkAll").prop("checked", false);
			}
		}

		function getSourceSystem(val, sourceid) {

			$
					.ajax({

						type : "POST",
						url : $('#contextPath').val()
								+ '/broadcast/getSourceSystemList.htm',
						dataType : 'json',
						contentType : 'application/json',
						success : function(result) {
							var m = 0;
							var ab = 0;

							if (val == 'edit') {
								var str = sourceid;
								var arr = str.split(",");
								var i;
								var a = new Array();
								for (i = 0; i < arr.length; i++) {
									a[i] = arr[i];
								}
								m = arr.length;
								var id = '#editsourceSysId';
								
								
								$('#editsourceSysId').empty();
								
								$('#editsourceSysId')
										.append(
												'<input type="checkbox" name="portal" id="chkAllEdit" value="1" onclick="selectPortalEdit();"/>ALL<br>');

							} else {

								var id = '#sourceSysId';
								$('#sourceSysId').empty();
								$('#sourceSysId')
										.append(
												'<input type="checkbox" name="portal" id="chkAll" value="1" onclick="selectPortal();"/>ALL<br>');
							}

							$(result)
									.each(
											function(i, obj) {

												var sourceSystemName = obj.sourceSystemName;
												var sourceSystemId = obj.sourceSystemId;

												if (val == 'edit') {

													ab++;
													for (i = 0; i < arr.length; i++) {
														if (a[i] == sourceSystemId) {
															$(id)
																	.append(
																			'<input type="checkbox" checked="true" name="editsource[]" id="editsource" class="chkedit" value="'
																					+ sourceSystemId
																					+ '" onClick="sourceCheckBoxedit();" />'
																					+ sourceSystemName
																					+ '<br>');

															a.splice(i, 1);
															i = arr.length;

														} else {
															$(id)
																	.append(
																			'<input type="checkbox" name="editsource[]" id="editsource" class="chkedit" value="'
																					+ sourceSystemId
																					+ '" onClick="sourceCheckBoxedit();" />'
																					+ sourceSystemName
																					+ '<br>');
															i = arr.length;
														}
													}

												} else {
													//$(id).append('<option value="'+ sourceSystemId+'">'+ sourceSystemName + '</option>');	
													//add
													$(id)
															.append(
																	'<input type="checkbox" name="source[]" id="source" class="chk" value="'
																			+ sourceSystemId
																			+ '" onClick="sourceCheckBox();" />'
																			+ sourceSystemName
																			+ '<br>');
												}

											});

							if (m >= 5) {
								$("#chkAllEdit").prop("checked", true);
							}
						}

					});
		}

		//get section
		function getSection(val, secid) {

			$.ajax({

				type : "POST",
				url : $('#contextPath').val()
						+ '/faq/getPicklistValues.htm?codeTypeIds=143',
				dataType : 'json',
				contentType : 'application/json',
				success : function(result) {

					if (val == 'edit') {

						var id = '#editsecId';
						$('#editsecId').empty();
					} else {

						var id = '#secId';
						$('#secId').empty();

					}

					$(result).each(
							function(i, obj) {
								var sectionName = obj.codeValue;
								var sectionid = obj.codeValueId;

								if (secid == sectionid) {
									$(id)
											.append(
													'<option value="'+ sectionid+'" selected="selected">'
															+ sectionName
															+ '</option>');
								} else {
									$(id)
											.append(
													'<option value="'+ sectionid+'">'
															+ sectionName
															+ '</option>');
								}

							});
				}

			});

		}

		function sendToEditBroadcast(broadCastId,sectionName,
				broadCastSectionId, broadCastTitle, startDate, expiryDate,
				buPartyId, isLoginPopUpDisplay, roleID, codeValueID,
				partyRecordTypeId, sourceSystemId) {
			
				var description=$('#textarea'+broadCastId).html();
				console.log('description:-----'+description);
				//alert(description);
				$('#editbroadDesp').html(description.replace(/&lt;/g, "<").replace(/&gt;/g, ">"));
				//document.getElementById("editbroadDesp").value = ab;
			document.getElementById("hdnbroadCastId").value = broadCastId;
				//alert(	description.replace(/&lt;/g, "<").replace(/&gt;/g, ">"));
			//set selected value in section dropdown box	
			getSection('edit', broadCastSectionId);
			//alert( startDate);
			var select = document.getElementById("sourceSysId");

			getSourceSystem('edit', sourceSystemId);
			document.getElementById("editbroadcastTitle").value = broadCastTitle;
			//	nicEditors.findEditor( "editbroadDesp" ).setContent(description);

			//nicEditors.findEditor("editbroadDesp").setContent(ab);
			document.getElementById("editstartDatepickerId").value = startDate;
			document.getElementById("editexpiryDatepickerId").value = expiryDate;

			if (isLoginPopUpDisplay == "true") {

				document.getElementById("editdisplayPopId").value = 1;
				$("#editdisplayPopId").prop('checked', true);

			} else {

				document.getElementById("editdisplayPopId").value = 0;
				$("#editdisplayPopId").prop('checked', false);
			}

			if (buPartyId != 0 && buPartyId != 35868) {
				loadBizUnit('edit', buPartyId);
				$("#editbiz").show();
				$("#editsel1").prop("checked", true);

			} else {
				$("#editbiz").hide();
				$("#editall1").prop("checked", true);
			}

			if (partyRecordTypeId != 0 && partyRecordTypeId != 14013) {
				loadUserType('edit', partyRecordTypeId);
				$("#edituser").show();
				$("#editsel2").prop("checked", true);
				
			} else {
				$("#edituser").hide();
				$("#editall2").prop("checked", true);
			}

			if (roleID != 0 && roleID != 200) {
				loadRole('edit', roleID);
				$("#editrole").show();
				$("#editsel3").prop("checked", true);

			} else {
				$("#editrole").hide();
				$("#editall3").prop("checked", true);
			}
			//for city
			if (codeValueID != 0 && codeValueID != 1003325) {

				loadCity('edit', codeValueID);
				$("#editcity").show();
				$("#editsel4").prop("checked", true);

			} else {
				$("#editcity").hide();
				$("#editall4").prop("checked", true);
			}
			

		}

		// submit updated broadcast
		function submitEditedBroadCast() {
	/* 		document.getElementById("broadDesphidden").value = $('#editbroadDesp').html();
	alert($('#editbroadDesp').html()); */
			if (editBroadCastRequiredVals() == true) {
				//alert("hieee");
				submitEditBroadCast();
			}
		}

		function editBroadCastRequiredVals() {

			var start = $('#editstartDatepickerId').val();
			var end = $('#editexpiryDatepickerId').val();
			if (!$('.chkedit').is(':checked')) {
				alert('Please select at least one source system');
				return false;
			}

			if ($('#editbroadcastTitle').val().trim() == "") {
				alert("Title is required.");
				$('#editbroadcastTitle').focus();
				return false;
			}

			if ($('#editstartDatepickerId').val().trim() == "") {
				alert("Start date field should not be blank!");
				$('#editstartDatepickerId').focus();
				return false;
			}

			if ($('#editexpiryDatepickerId').val().trim() == "") {
				alert("End date field should not be blank!");
				document.getElementById("editexpiryDatepickerId").value = "";
				$('#editexpiryDatepickerId').focus();
				return false;
			}

			if (process(end) < process(start)) {
				alert("End date should be greater than Start date");
				document.getElementById("editexpiryDatepickerId").value = "";
				$('#editexpiryDatepickerId').focus();
				return false;
			}
			

			return true;
		}

		function process(date) {

			var parts = date.split("/");
			return new Date(parts[2], parts[1] - 1, parts[0]);
		}

		function submitEditBroadCast() {

			var title1 = document.getElementById("editbroadcastTitle").value;
			var title = $.trim(title1);
			document.getElementById("editbroadcastTitle").value = title;
			var data = $('#editbroadDesp').html();
			$('#editbroadDesphidden').val(data);
 
			var islogin = $("#editdisplayPopId").is(":checked");

			//alert(islogin);
			if (islogin == true) {
				document.getElementById("editdisplayPopId").value = true;
			} else {
				document.getElementById("editdisplayPopId").value = false;
			}

			//while update if all BU is selected then selected Bunit is set null or zero
			var BUnit = $('input[name="editBU"]:checked').val();

			var uType = $('input[name="editUsrtype"]:checked').val();

			var rol = $('input[name="editroledd"]:checked').val();

			var cty = $('input[name="editcitydd"]:checked').val();

			if (BUnit == 1) {

//				document.getElementById("editbzunit").value = '';
				$('editbzunit').val('');
			}

			if (uType == 1) {

				//document.getElementById("editutype").value = null;
				$('editutype').val('');
			}

			if (rol == 1) {

				//document.getElementById("editroleID").value = null;
				$('editroleID').val('');
			}

			if (cty == 1) {

				//document.getElementById("editcitydropId").value = null;
				$('editcitydropId').val('');
			}

			/* var value2 = nicEditors.findEditor("editbroadDesp").getContent();
			$('#editbroadDesp').val(value2);
 */
			var selectedlSource = [];
			$('input:checkbox[id=editsource]:checked').each(function() {
				selectedlSource.push($(this).val());
			});

			if (selectedlSource != "") {
				document.getElementById("sourceIdListedt").value = selectedlSource;
			}

			$.ajax({
				type : 'GET',
				url : $('#contextPath').val()
						+ '/broadcast/addNewBroadcast.htm',
				data : $('#editmyForm').serialize(),
				success : function(result) {
					
					//$("#editnote").hide();
					 resetval();
					 bootbox.dialog({
							message: "<span class='bigger-110'>Record updated Successfully</span>",
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
					/*  alert('Record updated Successfully');
					location.reload(); */
				}

			});

		}

		function doAdd(closePopup) {

			var selectedlSource = [];
			$('input:checkbox[id=source]:checked').each(function() {
				selectedlSource.push($(this).val());
			});

			if (selectedlSource != "") {
				document.getElementById("sourceIdList").value = selectedlSource;
			}

			var title1 = document.getElementById("broadcastTitle").value;
			var title = $.trim(title1);
			document.getElementById("broadcastTitle").value = title;

			/* var descp1 = $('#namebroadDesp').find('.nicEdit-main').text();
			 //$('#broadDesp').val(data);
			var descp = $.trim(descp1);
			
			document.getElementById("broadDesp").value = descp; */
			/* var value1 = nicEditors.findEditor("broadDesp").getContent();
			document.getElementById("hdndescription").value = value1; */

			var popId = $("#displayPopId").is(":checked");

			if (popId == true) {
				document.getElementById("displayPopId").value = true;
			} else {
				document.getElementById("displayPopId").value = false;
			}

			$.ajax({
				type : 'POST',
				url : $('#contextPath').val()
						+ '/broadcast/addNewBroadcast.htm',
				data : $('#myForm').serialize(),
				success : function(result) {
					if(closePopup == 0){
						 $('#success-msg').empty();	
						 $('#success-msg').append('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-check"></i></strong>You successfully saved Broadcast.</p></div>');
						 resetval();	   
					}
					if(closePopup == 1){
						$("#addnote").hide();
						 bootbox.dialog({
								message: "<span class='bigger-110'>BroadCast save successfully</span>",
								buttons: 			
								{
									"click" :
									{
										"label" : "OK!",
										"className" : "btn-sm btn-primary",
										"callback": function() {
											 location.reload();
											 resetval();	
										}
									}
								}
							});

					}
				}
			});
		}

		//reset radio button value after save and new
		function resetRadioSaveNew() {

			$("#biz").hide();
			$("#sel1").prop("checked", false);
			$("#all1").prop("checked", true);

			$("#user").hide();
			$("#sel2").prop("checked", false);
			$("#all2").prop("checked", true);

			$("#role").hide();
			$("#sel3").prop("checked", false);
			$("#all3").prop("checked", true);

			$("#city").hide();
			$("#sel4").prop("checked", false);
			$("#all4").prop("checked", true);

		}

		function submitAddDownload(isToClose) {
			

			document.getElementById("broadDesphidden").value = $('#broadDesp').html();

			$('#hiddenIsToClose').val(isToClose);
			var closePopup = isToClose;
			if (addBroadCastRequiredVals() == true) {
				if (closePopup == 0) {
					doAdd(closePopup);
				}
				if (closePopup == 1) {
					doAdd(closePopup);
				}
			}
		}

		function resetval() {
			//alert('return');	
			$("#biz").hide();
			$("#user").hide();
			$("#role").hide();
			$("#city").hide();
			$('#secId').val(0);
			$('#sourceSysId').val(0);
			//getSourceSystem('add',0);
			$('.chk').filter(':checkbox').prop('checked', false);
			$('#chkAll').filter(':checkbox').prop('checked', false);
			getSection('add', 0);
			$('#broadcastTitle').val('');
			$('#broadDesp').val('');
			$('#broadDesp').html('');
			$('#startDatepickerId').val('');
			$('#expiryDatepickerId').val('');
			document.getElementById('displayPopId').checked = false;
			$('#displayPopId').val('');
			$('#namebroadDesp').empty();
			$('#namebroadDesp')
					.append(
							'<textarea name="broadDesp" style="width:405px;height: 100px;" id="broadDesp" rows="10" class="editor"></textarea>');

			toggleArea1();
			//nicEditors.allTextAreas();
			//alert('return');
			var d = new Date();

			var month = d.getMonth() + 1;
			var day = d.getDate();

			var output = (day < 10 ? '0' : '') + day + '/'
					+ (month < 10 ? '0' : '') + month + '/' + d.getFullYear();

			$("#startDatepickerId").val(output);
		}

		function addBroadCastRequiredVals() {

			if (!$('.chk').is(':checked')) {
				
				 /*  $('#success-msg').empty();	
				 $('#success-msg').append('<div class="alert alert-block alert-danger"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-times"></i></strong> Please select at least one source system.</p></div>');
				 document.getElementById("addForm").reset(); 	
				 bootbox.dialog({
					message: "<span class='bigger-110'>Please select at least one source system</span>",
					buttons: 			
					{
						"click" :
						{
							"label" : "OK!",
							"className" : "btn-sm btn-primary",
							"callback": function() {
								  location.reload();
								  addNote(); 
								 document.getElementById("addForm").reset();
							
							}
						}
					}
				});  */

				 alert('Please select at least one source system'); 
				return false;
			}

			if ($('#secId').val() == null || $('#secId').val().trim() == "0"
					|| $('#secId').val().trim() == "") {

				/*  $('#success-msg').empty();	
				 $('#success-msg').append('<div class="alert alert-block alert-danger"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><strong><i class="ace-icon fa fa-times"></i></strong> Section Unit is required.</p></div>');
				 document.getElementById("addForm").reset();	 */
				alert("Section Unit is required.");
				$('#secId').focus();
				return false;
			}

			if ($('#broadcastTitle').val().trim() == "") {
				alert("Title is required.");
				$('#broadcastTitle').focus();
				return false;
			}

			if ($('#startDatepickerId').val().trim() == "") {
				alert("Start date field should not be blank!");
				document.getElementById("startDatepickerId").value = "";
				$('#startDatepickerId').focus();
				return false;
			}

			if ($('#expiryDatepickerId').val().trim() == "") {
				alert("End date field should not be blank!");
				document.getElementById("expiryDatepickerId").value = "";
				$('#expiryDatepickerId').focus();
				return false;
			}

			/* if ($('#expiryDatepickerId').val().trim() < $('#startDatepickerId').val()) {
			    alert("End date should not be less than start date ");
			    document.getElementById("expiryDatepickerId").value= "";
			    $('#expiryDatepickerId').focus();
			    return false;
			}  */

			return true;
		}

		function pagesizeurl() {

			$("#toreload")
					.load(
							'${pageContext.request.contextPath}/broadcast/loadbroadcast.htm #toreload',
							{
								object : '${object}',
								pageSize : $('#page').val(),

							}, function(response, status, xhr) {
								try {

									//closePopupWebApp('');
									$('#selecctall').click(function(event) { //on click 
										if (this.checked) { // check select status
											$('.checkbox1').each(function() { //loop through each checkbox
												this.checked = true; //select all checkboxes with class   "checkbox1"               
											});
										} else {
											$('.checkbox1').each(function() { //loop through each checkbox
												this.checked = false; //deselect all checkboxes with class "checkbox1"                       
											});
										}
									});
								} catch (e) {
									// closePopupWebApp('');       
								}
							});
			//setResult('');	
		}

		function isDate(txtDate) {
			var currVal = txtDate;
			if (currVal == '') {
				return false;
			}
			//Declare Regex  
			var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/;
			var dtArray = currVal.match(rxDatePattern); // is format OK?
			if (dtArray == null)
				return false;
			//Checks for dd/mm/yyyy format.
			var dtMonth = dtArray[3];
			var dtDay = dtArray[1];
			var dtYear = dtArray[5];

			if (dtMonth > 12 || dtMonth < 1)
				return false;
			if (dtDay > 31 || dtDay < 1)
				return false;
			if ((dtMonth == 4 || dtMonth == 6 || dtMonth == 9 || dtMonth == 11)
					&& dtDay == 31)
				return false;
			if (dtMonth == 2) {
				var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
				if (dtDay > 29 || (dtDay == 29 && !isleap))
					return false;
			}

			return true;
		}

		$(document).ready(
				function() {

					var d = new Date();

					var month = d.getMonth() + 1;
					var day = d.getDate();

					var output = (day < 10 ? '0' : '') + day + '/'
							+ (month < 10 ? '0' : '') + month + '/'
							+ d.getFullYear();

					$("#startDatepickerId").val(output);

					$("#startDatepickerId").datepicker(
							{
								showOn : 'button',
								minDate : '0',
								buttonText : 'Show date',
								buttonImageOnly : true,
								buttonImage : '../images/calendar.gif',
								dateFormat : 'dd/mm/yy',
								constrainInput : true,

								onSelect : function(selected) {
									$("#expiryDatepickerId").datepicker(
											"option", "minDate", selected)
								}
							});

					$(".ui-datepicker-trigger").mouseover(function() {
						$(this).css('cursor', 'pointer');
					});
				});
		/* $("#expiryDatepickerId").val(output); */

		$(document).ready(function() {
			$("#expiryDatepickerId").datepicker({
				showOn : 'button',
				minDate : '0',
				buttonText : 'Show date',
				buttonImageOnly : true,
				buttonImage : '../images/calendar.gif',
				dateFormat : 'dd/mm/yy',
				constrainInput : true,

			});

			$(".ui-datepicker-trigger").mouseover(function() {
				$(this).css('cursor', 'pointer');
			});
		});

		$(document).ready(
				function() {
					$("#editstartDatepickerId").datepicker(
							{
								showOn : 'button',
								minDate : '0',
								buttonText : 'Show date',
								buttonImageOnly : true,
								buttonImage : '../images/calendar.gif',
								dateFormat : 'dd/mm/yy',
								constrainInput : true,

								onSelect : function(selected) {
									$("#editexpiryDatepickerId").datepicker(
											"option", "minDate", selected)
								}
							});

					$(".ui-datepicker-trigger").mouseover(function() {
						$(this).css('cursor', 'pointer');
					});
				});

		$(document).ready(function() {
			$("#biz").hide();
			$("#user").hide();
			$("#role").hide();
			$("#city").hide();

			
			makeEditor('broadDesp,#editbroadDesp');
			$("#editexpiryDatepickerId").datepicker({
				showOn : 'button',
				minDate : '0',
				buttonText : 'Show date',
				buttonImageOnly : true,
				buttonImage : '../images/calendar.gif',
				dateFormat : 'dd/mm/yy',
				constrainInput : true,

			});

			$(".ui-datepicker-trigger").mouseover(function() {
				$(this).css('cursor', 'pointer');
			});
		});

		/* start code to delete broadcast list items  */
		function deleteDownloadItems() {
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

		function confirmDelete() {
			var selectedlvals = document.getElementById("confirmdelete").value;
			//alert(selectedlvals);
			$.ajax({
				type : 'POST',
				url : $('#contextPath').val()
						+ "/broadcast/deleteBroadcastList.htm?selectedlvalz="
						+ selectedlvals,
				success : function(result) {
					 bootbox.dialog({
	 						message: "<span class='bigger-110'>Broadcast deleted successfully</span>",
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
				/* 	alert('');
					location.reload(); */
				}
			});
		}
		/* end code to delete added broadcast items  */
	</script>


	<script text="text/javascript">
		
		var grid_data=${broadcastList};
		
		index = grid_data;
	

		var subgrid_data = [ {
			id : "1",
			name : "sub grid item 1",
			qty : 11
		}, {
			id : "2",
			name : "sub grid item 2",
			qty : 3
		}, {
			id : "3",
			name : "sub grid item 3",
			qty : 12
		}, {
			id : "4",
			name : "sub grid item 4",
			qty : 5
		}, {
			id : "5",
			name : "sub grid item 5",
			qty : 2
		}, {
			id : "6",
			name : "sub grid item 6",
			qty : 9
		}, {
			id : "7",
			name : "sub grid item 7",
			qty : 3
		}, {
			id : "8",
			name : "sub grid item 8",
			qty : 8
		} ];

		jQuery(function($) {
			var grid_selector = "#grid-table";
			var pager_selector = "#grid-pager";

			//resize to fit page size
			$(window).on(
					'resize.jqGrid',
					function() {
						$(grid_selector).jqGrid('setGridWidth',
								$(".page-content").width());
					})
			//resize on sidebar collapse/expand
			var parent_column = $(grid_selector).closest('[class*="col-"]');
			$(document).on(
					'settings.ace.jqGrid',
					function(ev, event_name, collapsed) {
						if (event_name === 'sidebar_collapsed'
								|| event_name === 'main_container_fixed') {
							//setTimeout is for webkit only to give time for DOM changes and then redraw!!!
							setTimeout(function() {
								$(grid_selector).jqGrid('setGridWidth',
										parent_column.width());
							}, 0);
						}
					})

		

			jQuery(grid_selector)
					.jqGrid(
							{
								//direction: "rtl",

								//subgrid options
								subGrid : false,
								//subGridModel: [{ name : ['No','Item Name','Qty'], width : [55,200,80] }],
								//datatype: "xml",
								subGridOptions : {
									//plusicon : "ace-icon fa fa-plus center bigger-110 blue",
									minusicon : "ace-icon fa fa-minus center bigger-110 blue",
									openicon : "ace-icon fa fa-chevron-right center orange"
								},
								//for this example we are using local data
								subGridRowExpanded : function(subgridDivId,
										rowId) {
									var subgridTableId = subgridDivId + "_t";
									$("#" + subgridDivId)
											.html(
													"<table id='" + subgridTableId + "'></table>");
									$("#" + subgridTableId).jqGrid(
											{
												datatype : 'local',
												data : subgrid_data,
												colNames : [ 'No', 'Item Name',
														'Qty' ],
												colModel : [ {
													name : 'id',
													width : 50
												}, {
													name : 'name',
													width : 150
												}, {
													name : 'qty',
													width : 50
												} ]
											});
								},

								data : index,
								datatype : "local",
								height : 250,
								colNames : [ ' ', ' ', 'Section',
										'Broadcast Title',
										'Start/Expiry Datetime',
										'Show Popup on Login', 'Update on',
										'Source System' ],
								//colNames:['Section ',' ','Section1','Broadcast Title','Start/Expiry Datetime','Show Popup on Login','Update on','Source System'],
								colModel : [
										
										 {name:'myac',index:' ', width:50, fixed:true, sortable:false, resize:false,
										     formatter: function(cellvalue, options,rowObject) {
										                 return '<textarea id="textarea'+rowObject.id+'" class="hide">'+rowObject.description+'</textarea><a href="#"  onclick="editNote();sendToEditBroadcast('+rowObject.id+',\''+rowObject.sectionName+'\',\''+rowObject.broadCastSectionId+'\',\''+rowObject.broadCastTitle+'\',\''+rowObject.startDate+'\',\''+rowObject.expiryDate+'\',\''+rowObject.buPartyId+'\',\''+rowObject.loginPopUpDisplay+'\',\''+rowObject.roleID+'\',\''+rowObject.cityId+'\',\''+rowObject.partyRecordTypeId+'\',\''+rowObject.sourceIdList+'\');" id="SPEditBroadCastLink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>';
										 
										<%-- {name : 'myac',index :'',width : 60, fixed : true, sortable : false, resize : false,
										formatter:function(cellvalue, options,rowObject) {
									    	return '<a href="#" onclick="editNote();sendToEditBroadcast('+rowObject.id+',\''+rowObject.sectionName+'\',\''+rowObject.broadCastSectionId+'\',\''+rowObject.broadCastTitle+'\',\''+rowObject.startDate+'\',\''+rowObject.expiryDate+'\',\''+rowObject.buPartyId+'\',\''+rowObject.loginPopUpDisplay+'\',\''+rowObject.roleID+'\',\''+rowObject.cityId+'\',\''+rowObject.partyRecordTypeId+'\',\''+rowObject.sourceIdList+'\');" id="SPEditBroadCastLink"><img src="<%=request.getContextPath()%>/images/edit.png" alt="Edit" title="Edit"></a>'; --%>
									    	                                                            
										}},
										
										
										{
											name : 'checkbox',
											width : 60,
											index : 'checkbox',
											sortable : false,
											formatter : function(cellvalue,
													options, rowObject) {
												return '<input role="checkbox" type="checkbox"  class="checkbox1" id="chkdeleteselect" value="'+rowObject.id+'" name="chkdeleteselect[]">';
											}
										},

										//{name:'notifyTemplateID', index:'editLink',formatter:imageFormat,formatoptions:{baseLinkUrl:'${pageContext.request.contextPath}/popUpAlertaddnote?notifyTemplateId='}},
										{
											name : 'sectionName',
											index : 'sectionName',
											width : 200
										},
										{
											name : 'broadCastTitle',
											index : 'broadCastTitle',
											width : 200
										},

										//{name:'startDate',index:'startDate'},

										{width : 200,
											formatter : function(cellvalue,
													options, rowObject) {
												// return '<input role="checkbox" type="checkbox"  class="checkbox1" id="'+rowObject.startDate+',\''+rowObject.expiryDate+'" name="chkdeleteselect[]">';
												return rowObject.startDate
														+ '\n'
														+ rowObject.expiryDate;
											}
										},

										{width : 200,
											formatter : function(cellvalue,
													options, rowObject) {
												if (rowObject.loginPopUpDisplay == 1) {
													return "Yes";
												} else {
													return "No";
												}
												//return '<a onclick="openActionPopup('+rowObject.loginPopUpDisplay+'\')"></a>';
											}
										},

										{
											name : 'lastModifiedDate',
											index : 'lastModifiedDate',
											width : 350
										},

										{width : 270,
											formatter : function(cellvalue,
													options, rowObject) {
												var i = 0;
												var string = "";

												var str = rowObject.sourceIdList;
												var arr = str.split(",");
												var i;
												var a = new Array();
												for (i = 0; i < arr.length; i++) {
													a[i] = arr[i];

													if (a[i] == 31001) {
														if (string != "") {
															string = string
																	.concat("\nPartner Portal");
														} else {
															string = string
																	.concat("Partner Portal");
														}
													}
													if (a[i] == 31003) {
														if (string != "") {
															string = string
																	.concat("\nService Portal");

														} else {
															string = string
																	.concat("Service Portal");

														}

													}
													if (a[i] == 31004) {
														if (string != "") {
															string = string
																	.concat("\nClient Portal");

														} else {
															string = string
																	.concat("Client Portal");

														}

													}
													if (a[i] == 31005) {
														if (string != "") {
															string = string
																	.concat("\nSFDC");

														} else {
															string = string
																	.concat("SFDC");

														}

													}
													if (a[i] == 31006) {
														if (string != "") {
															string = string
																	.concat("\nDIY");

														} else {
															string = string
																	.concat("DIY");

														}

													}
													if (a[i] == 31007) {
														if (string != "") {
															string = string
																	.concat("\nIntegration Portal");

														} else {
															string = string
																	.concat("Integration Portal");

														}

													}
												}

												return string;
												
											}
										}
								
								],

								viewrecords : true,
								rowNum : 10,
								rowList : [ 10, 20, 50, 100, 1000 ],
								pager : pager_selector,
								altRows : true,
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

							
								editurl : "/dummy.html",//nothing is saved
								//caption: "jqGrid with inline editing"

								autowidth : true,
								shrinkToFit : false,


							});
			$(window).triggerHandler('resize.jqGrid');//trigger window resize to make the grid get the correct size

			//enable search/filter toolbar
			//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})
			//jQuery(grid_selector).filterToolbar({});

			//switch element when editing inline
			function aceSwitch(cellvalue, options, cell) {
				setTimeout(function() {
					$(cell).find('input[type=checkbox]').addClass(
							'ace ace-switch ace-switch-5').after(
							'<span class="lbl"></span>');
				}, 0);
			}
			//enable datepicker
			function pickDate(cellvalue, options, cell) {
				setTimeout(function() {
					$(cell).find('input[type=text]').datepicker({
						format : 'yyyy-mm-dd',
						autoclose : true
					});
				}, 0);
			}

			//navButtons
			jQuery(grid_selector).jqGrid(
					'navGrid',
					pager_selector,
					{ //navbar options
						edit : false,
						editicon : 'ace-icon fa fa-pencil blue',
						add : false,
						addicon : 'ace-icon fa fa-plus-circle purple',
						del : false,
						delicon : 'ace-icon fa fa-trash-o red',
						search : true,
						searchicon : 'ace-icon fa fa-search orange',
						refresh : false,
						refreshicon : 'ace-icon fa fa-refresh green',
						view : false,
						viewicon : 'ace-icon fa fa-search-plus grey',
					},
					{
						//edit record form
						//closeAfterEdit: true,
						//width: 700,
						recreateForm : true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find(
									'.ui-jqdialog-titlebar').wrapInner(
									'<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//new record form
						//width: 700,
						closeAfterAdd : true,
						recreateForm : true,
						viewPagerButtons : false,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find(
									'.ui-jqdialog-titlebar').wrapInner(
									'<div class="widget-header" />')
							style_edit_form(form);
						}
					},
					{
						//delete record form
						recreateForm : true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							if (form.data('styled'))
								return false;

							form.closest('.ui-jqdialog').find(
									'.ui-jqdialog-titlebar').wrapInner(
									'<div class="widget-header" />')
							style_delete_form(form);

							form.data('styled', true);
						},
						onClick : function(e) {
							//alert(1);
						}
					},
					{
						//search form
						recreateForm : true,
						afterShowSearch : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find(
									'.ui-jqdialog-title').wrap(
									'<div class="widget-header" />')
							style_search_form(form);
						},
						afterRedraw : function() {
							style_search_filters($(this));
						},
						multipleSearch : true,
					/**
					multipleGroup:true,
					showQuery: true
					 */
					},
					{
						//view record form
						recreateForm : true,
						beforeShowForm : function(e) {
							var form = $(e[0]);
							form.closest('.ui-jqdialog').find(
									'.ui-jqdialog-title').wrap(
									'<div class="widget-header" />')
						}
					})

			function style_edit_form(form) {
				//enable datepicker on "sdate" field and switches for "stock" field
				form.find('input[name=sdate]').datepicker({
					format : 'yyyy-mm-dd',
					autoclose : true
				})

				form.find('input[name=stock]').addClass(
						'ace ace-switch ace-switch-5').after(
						'<span class="lbl"></span>');
				//don't wrap inside a label element, the checkbox value won't be submitted (POST'ed)
				//.addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');

				//update buttons classes
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm').find('[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-primary').prepend(
						'<i class="ace-icon fa fa-check"></i>');
				buttons.eq(1).prepend('<i class="ace-icon fa fa-times"></i>')

				buttons = form.next().find('.navButton a');
				buttons.find('.ui-icon').hide();
				buttons.eq(0).append(
						'<i class="ace-icon fa fa-chevron-left"></i>');
				buttons.eq(1).append(
						'<i class="ace-icon fa fa-chevron-right"></i>');
			}

			function style_delete_form(form) {
				var buttons = form.next().find('.EditButton .fm-button');
				buttons.addClass('btn btn-sm btn-white btn-round').find(
						'[class*="-icon"]').hide();//ui-icon, s-icon
				buttons.eq(0).addClass('btn-danger').prepend(
						'<i class="ace-icon fa fa-trash-o"></i>');
				buttons.eq(1).addClass('btn-default').prepend(
						'<i class="ace-icon fa fa-times"></i>')
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
				buttons.find('.EditButton a[id*="_reset"]').addClass(
						'btn btn-sm btn-info').find('.ui-icon').attr('class',
						'ace-icon fa fa-retweet');
				buttons.find('.EditButton a[id*="_query"]').addClass(
						'btn btn-sm btn-inverse').find('.ui-icon').attr(
						'class', 'ace-icon fa fa-comment-o');
				buttons.find('.EditButton a[id*="_search"]').addClass(
						'btn btn-sm btn-purple').find('.ui-icon').attr('class',
						'ace-icon fa fa-search');
			}

			function beforeDeleteCallback(e) {
				var form = $(e[0]);
				if (form.data('styled'))
					return false;

				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
						.wrapInner('<div class="widget-header" />')
				style_delete_form(form);

				form.data('styled', true);
			}

			function beforeEditCallback(e) {
				var form = $(e[0]);
				form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar')
						.wrapInner('<div class="widget-header" />')
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
				var replacement = {
					'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
					'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
					'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
					'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
				};
				$(
						'.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon')
						.each(
								function() {
									var icon = $(this);
									var $class = $.trim(icon.attr('class')
											.replace('ui-icon', ''));

									if ($class in replacement)
										icon.attr('class', 'ui-icon '
												+ replacement[$class]);
								})
			}

			function enableTooltips(table) {
				$('.navtable .ui-pg-button').tooltip({
					container : 'body'
				});
				$(table).find('.ui-pg-div').tooltip({
					container : 'body'
				});
			}

			//var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');

			$(document).one('ajaxloadstart.page', function(e) {
				$(grid_selector).jqGrid('GridUnload');
				$('.ui-jqdialog').remove();

			});
		});

		function openActionPopup(notifyTemplateID, pingOwner, active, name,
				favouriteTemplate) {
			//alert(notifyTemplateID);
			$('#notifyTemplateIdHidden').val(notifyTemplateID);
			$('#notifyTemplateNameHidden').val(name);
			if (pingOwner == 'Partner') {
				if (active == 'true') {
					$('#suspendrow').removeClass('hide');
					$('#reactivaterow').attr('class', 'hide');
				} else {
					$('#reactivaterow').removeClass('hide');
					$('#suspendrow').attr('class', 'hide');
				}
			}
			$('#ScheduleRow').removeClass('hide');
			$('#DeliveryHistoryRow').removeClass('hide');
			$('#CloneRow').removeClass('hide');
			$('#ScheduleLink a').attr(
					'href',
					'${pageContext.request.contextPath}/addNewSchedulePing.htm?notifyTemplateID_P='
							+ notifyTemplateID);
			$('#DeliveryHistoryLink a')
					.attr(
							'href',
							'${pageContext.request.contextPath}/ping/getDelivaryHistory.htm?notifyTemplateId='
									+ notifyTemplateID);
			if (favouriteTemplate != 1) {
				$('#MarkasFavouriteRow').removeClass('hide');
				$('#UnMarkasFavouriteRow').attr('class', 'hide');
			} else {
				$('#UnMarkasFavouriteRow').removeClass('hide');
				$('#MarkasFavouriteRow').attr('class', 'hide');
			}
			$(".action_dialog").removeClass('hide').dialog({
				resizable : false,
				modal : true,
				width : "auto",
			});
		}

		var area1 = $('#broadDesp').val('');
		function toggleArea1() {
			try {
				area1.removeInstance('broadDesp');
			} catch (e) {

			}
			area1 = null;
			//                //area1 = new nicEditor({fullPanel : true}).panelInstance('broadDesp',{hasPanel : true});
			/* new nicEditor({
				maxHeight : 110
			}).panelInstance('broadDesp'); */
			//        		   //new nicEditor({maxHeight : 50}).panelInstance('editbroadDesp');
		}

		/* bkLib.onDomLoaded(function() {
			toggleArea1();
		}); */
	</script>
</body>
</html>