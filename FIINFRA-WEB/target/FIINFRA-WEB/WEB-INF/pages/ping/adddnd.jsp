<!DOCTYPE html>
<%@page
	import="org.apache.xmlbeans.impl.xb.xsdschema.IncludeDocument.Include"%>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Add New Query</title>

<style type="text/css">
a {
	cursor: pointer;
}
</style>
</head>
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>

<script type="text/javascript">

	var contactId = 0;
	$("#contactId").keydown(function() {
		contactId = 0;
	});
	$(function() {

		$
				.ajax({
					type : "POST",
					url : $('#contextPath').val()
							+ '/common/getPicklistValues.htm?codeTypeIds=15,32',
					success : function(result) {
						$('#queryType').empty();
						$(result).each(
								function(i, obj) {
									var codeTypeId = obj.codeTypeId;
									var codeValue = obj.codeValue;
									var codevalueId = obj.codeValueId;
									if (codeTypeId == 15) {
										if (codevalueId != 15004) {
											$('#contactType').append(
													'<option value="'+codevalueId+'">'
															+ codeValue
															+ '</option>');
										}
									} else if (codeTypeId == 32) {
										$('#delivaryChannel').append(
												'<option value="'+codevalueId+'">'
														+ codeValue
														+ '</option>');
									}

								});
						$('#delivaryChannel').append(
								'<option value="1">ALL</option>');
						var dndIdFromRequest = $('#dndIdFromRequest').val();
						if (dndIdFromRequest == 0) {

						} else {

							$
									.ajax({
										type : 'POST',
										url : $('#contextPath').val()
												+ "/ping/getDNDDetails.htm?dndId="
												+ dndIdFromRequest,

										success : function(result) {

											$(result)
													.each(
															function(i, obj) {
																var contactType = obj.contactType;
																var dndReason = obj.dndReason;
																var status = obj.status;
																var delivaryChannel = obj.delivaryChannel;
																var dndFor = obj.dndFor;
																var contactPartyId = obj.contactPartyId;
																$(
																		'#contactpartyIdEdit')
																		.val(
																				contactPartyId);
																$(
																		'#contactType')
																		.val(
																				contactType);
																$(
																		'#delivaryChannel')
																		.val(
																				delivaryChannel);
																$('#dndReason')
																		.val(
																				dndReason);
																$('#contactId')
																		.val(
																				dndFor);
																$('#contactId')
																		.attr(
																				'readonly',
																				'readonly');
																if (status == '1') {
																	$(
																			'input:checkbox[name=isActive]')
																			.attr(
																					'checked',
																					true);
																} else {
																	$(
																			'input:checkbox[name=isActive]')
																			.attr(
																					'checked',
																					false);
																}
																getEmailAndContactOfContact(contactPartyId);

															});
										}
									});
						}
					}
				});
	});
	function split(val) {
		return val.split(/;\s*/);
	}
	function extractLast(term) {
		return split(term).pop();
	}
	function getContactList() {
		userLabelValueList = new Array();
		removeCssStyles('contactId');
		recordType = $('#contactType').val();
		loggedInUserPartyId = $('#partyIdHidden').val();

		$('#contactId').val('');
		contactId = 0;
		$
				.ajax({
					type : "POST",
					url : $('#contextPath').val()
							+ '/common/getUserList.htm?loggedInUserPartyId='
							+ loggedInUserPartyId + '&recordType=' + recordType,
					success : function(result) {
						result = JSON.parse(result);
						$(result).each(function(i, obj) {
							var object = {};
							object.value = obj.partyId;
							object.label = obj.name;
							userLabelValueList.push(object);
						});

						$("#contactId")
								// don't navigate away from the field on tab when selecting an item
								.bind(
										"keydown",
										function(event) {
											if (event.keyCode === $.ui.keyCode.TAB
													&& $(this).data(
															"ui-autocomplete").menu.active) {
												event.preventDefault();
											}
										})
								.autocomplete(
										{
											minLength : 0,
											source : function(request, response) {
												// delegate back to autocomplete, but extract the last term
												response($.ui.autocomplete
														.filter(
																userLabelValueList,
																request.term));
											},
											focus : function() {
												// prevent value inserted on focus
												return false;
											},
											select : function(event, ui) {
												var terms = split(this.value);
												terms.pop();
												terms.push(ui.item.label);
												contactId = ui.item.value;
												$('#partyIdDNDPage').val(
														contactId);

												console.log('contactId='
														+ contactId);
												terms.push("");
												this.value = terms.join("");
												var labelArr = $(this).data(
														'label')
														|| new Array();
												labelArr.push(ui.item);
												$(this).data('label', labelArr);
												console.log($(this).data());
												getEmailAndContactOfContact(contactId);
												return false;
											}
										});
					}
				});
	}
	function getEmailAndContactOfContact(contactId) {
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()
					+ '/ping/getEmailAndContactOfContact.htm?contactId='
					+ contactId,

			success : function(result) {

				$(result).each(function(i, obj) {

					var contactNo = obj.contactMobile;
					var email = obj.contactEmail;
					$('#emailId').val(email);
					$('#contactNo').val(contactNo)

				});
			}
		});
	}
	function saveDnd() {
		var isValidated = true;
		if ($.trim($('#contactType').val()) == '0') {
			addCssStyles('contactType', 'Please select contat type.');
			isValidated = false;
			$('#contactType_error').removeClass('hide');;
			$('#contactType_error').parent().parent().addClass('has-error');

		} else {
			removeCssStyles('contactType');
			$('#contactType').css('color', '#333333');
			$('#contactType_error').addClass('hide');
			$('#contactType_error').parent().parent().removeClass('has-error');
		}
		if ($('#contactId').val() == '') {
			addCssStyles('contactId', 'Please add Contact.');
			isValidated = false;
			$('#contactId_error').removeClass('hide');;
			$('#contactId_error').parent().parent().addClass('has-error');

		} else {
			removeCssStyles('contactId');
			$('#contactId').css('color', '#333333');
			$('#contactId_error').addClass('hide');
			$('#contactId_error').parent().parent().removeClass('has-error');
		}

		if ($.trim($('#delivaryChannel').val()) == '0') {
			addCssStyles('delivaryChannel', 'Please select Delivary Channel .');
			isValidated = false;
			$('#deliveryChannel_error').removeClass('hide');;
			$('#deliveryChannel_error').parent().parent().addClass('has-error');

		} else {
			removeCssStyles('delivaryChannel');
			$('#delivaryChannel').css('color', '#333333');
			$('#deliveryChannel_error').addClass('hide');
			$('#deliveryChannel_error').parent().parent().removeClass('has-error');
		}

		if ($('#dndReason').val() == '') {
			addCssStyles('dndReason', 'Please add DND Reason.');
			isValidated = false;
			$('#dndReason_error').removeClass('hide');;
			$('#dndReason_error').parent().parent().addClass('has-error');

		} else {
			removeCssStyles('dndReason');
			$('#dndReason').css('color', '#333333');
			$('#dndReason_error').addClass('hide');
			$('#dndReason_error').parent().parent().removeClass('has-error');
		}

		var contactPartyId;

		if ($('#contactpartyIdEdit').val() == 0
				|| $('#contactpartyIdEdit').val() == '') {
			contactPartyId = $('#partyIdDNDPage').val();
		} else {
			contactPartyId = $('#contactpartyIdEdit').val();
		}
		console.log('contactPartyId:----' + contactPartyId)
		if (contactPartyId == '' || contactPartyId == 0) {
			addCssStyles('contactId', 'Please select valid Contact.');
			isValidated = false;
		} else {
			removeCssStyles('contactId');
			$('#contactId').css('color', '#333333');
		}

		if (isValidated == false) {
			showAlertMessage(
					"Error",
					"There are some validation errors,please check to proceed further.",
					'error', doNothing);
		}

		if (isValidated == true) {
			var isActive = $('isActive').val();
			var active = "";

			if ($('#isActive').is(":checked")) {

				active = "checked";
			} else {

				active = "notchecked";
			}
			var dndIdFromRequest = $('#dndIdFromRequest').val();
			$.ajax({
				type : "POST",

				url : $('#contextPath').val() + '/ping/insertDnd.htm?active1='
						+ active + '&dndId=' + dndIdFromRequest + '&partyId='
						+ contactPartyId,
				data : $('#addDndForm').serialize(),

				success : function(result) {
					result = JSON.parse(result);
					if (result == "success") {
						showAlertMessage("Success",
								"<br/> DND saved successfully.", "information",
								redirectFurther);
					}

				}
			});
		}
	}
	function redirectFurther() {
		window.location.href = $('#contextPath').val() + '/ping/getDNDList.htm';
	}
</script>
<body>
<%
		int dndId = 0;
		try {
			dndId = Integer.parseInt(request.getParameter("dndId")
					.toString());
			if (dndId != 0) {
	%>
<input type="hidden" id="dndIdFromRequest" name="dndId"
		value="<%=dndId%>">
<%
		}
		} catch (Exception e) {
	%>
<input type="hidden" id="dndIdFromRequest" value="0">
<%
		}
	%>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/common_popup.jsp" />
<input id="contextPath" type="hidden" name="contextPath"
		value="<%=request.getContextPath()%>" />
<input type="hidden" name="partyId" id="partyIdDNDPage">
<input type="hidden" name="contactpartyIdEdit" id="contactpartyIdEdit">
<section>
  <div class="">
    <div class="page-header">
      <h1>Add/Edit DND</h1>
    </div>
    <form id="addDndForm" name="addDndForm11"
				action="<%=request.getContextPath()%>/ping/insertTags.htm"
				method="post">
      <div class="widget-box" style="margin-top:10px;">
        <div class="widget-header">
          <h5 class="widget-title">Add/Edit DND</h5>
        </div>
        <div class="widget-body">
          <div class="widget-main clearfix">
            <div class="row">
              <div class="form-group col-md-6 clearfix">
                <label class="col-sm-3 control-label no-padding-right" for="contactType">Contact Type <span class="red">*</span></label>
                <div class="col-sm-9">
                  <select name="contactType" id="contactType" class="input-xxlarge" onchange="getContactList(contactType)">
                    <option value="0">---Select---</option>
                  </select>
                  <div id="contactType_error" class="help-block hide">Please provide a valid contact type.</div>
                </div>
              </div>
              <div class="form-group col-md-6 clearfix">
                <label class="col-sm-3 control-label no-padding-right" for="contactId">Contact<span class="red">*</span></label>
                <div class="col-sm-9">
                  <input type="text" name="contactId" id="contactId" class="input-xxlarge" />
                  <div id="contactId_error" class="help-block hide">Please
                    provide a valid contact.</div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-6 clearfix">
                <label class="col-sm-3 control-label no-padding-right" for="emailId">Email ID</label>
                <div class="col-sm-9">
                  <input type="text" id="emailId" name="emailId" readonly class="input-xxlarge">
                </div>
              </div>
              <div class="form-group col-md-6 clearfix">
                <label class="col-sm-3 control-label no-padding-right" for="companyName">Contact No</label>
                <div class="col-sm-9">
                  <input type="text" id="contactNo" name="contactNo" readonly class="input-xxlarge">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="form-group col-md-6 clearfix">
                <label class="col-sm-3 control-label no-padding-right" for="delivaryChannel">Delivery Channel<span class="red">*</span></label>
                <div class="col-sm-9">
                  <select id="delivaryChannel" name="delivaryChannel"
				   class="input-xxlarge">
                    <option value="0">---Select---</option>
                  </select>
                  <div id="deliveryChannel_error" class="help-block hide">Please provide a valid delivery channel.</div>
                </div>
              </div>
              <div class="form-group col-md-6 clearfix">
                <label class="col-sm-3 control-label no-padding-right" for="dndReason">DND Reason<span class="red">*</span></label>
                <div class="col-sm-9">
                  <textarea class="input-xxlarge" rows="2" id="dndReason" name="dndReason"></textarea>
                  <div id="dndReason_error" class="help-block hide">Please provide a valid dnd reason.</div>
                </div>
              </div>
            </div>
            <div class="row  pull-right margin_5px">
             
              <div class="topmenu margin_5px">
                <div class="btn btn-primary btn-xs dbtn" type="button" name="Save" onclick="saveDnd()"> Save </div>
                <div class="btn btn-primary btn-xs dbtn westspace2" type="button" name="Change" onclick="redirectFurther()"> Cancel </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
    
    <!-- center end --> 
  </div>
  <input type="hidden" name="chkboxvalue" id="chkboxvalue">
</section>
<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
<!-- Center part End -->
</body>
</html>