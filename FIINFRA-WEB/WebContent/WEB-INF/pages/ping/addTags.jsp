<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Add New ping</title>
<style type="text/css">
.popupnewtag1 {
	top: 5% !important;
	left: -95% !important;
}
</style>
<script type="text/javascript">
	var hidePopupTimeoutId;

	$(".choose").on("mouseover", function() {
		clearTimeout(hidePopupTimeoutId);
		$(".popupnewtag1").show();
	});

	$(".choose").on("mouseout", function() {
		hidePopupTimeoutId = setTimeout(function() {
			$(".popupnewtag1").hide();
		}, 500);
	});

	$(".popupnewtag1").on("mouseenter", function() {
		clearTimeout(hidePopupTimeoutId);
	});

	$(".popupnewtag1").on("mouseleave", function() {
		$(".popupnewtag1").hide();
	});
</script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() {
		nicEditors.allTextAreas()
	});
</script>
</head>
<body>
<!--css popup window start 1-->
<jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/common_popup.jsp" />
        <%
		int tagId = 0;
		try {
			tagId = Integer.parseInt(request.getParameter("tagId")
					.toString());
			if (tagId != 0) {
	%>
        <input type="hidden" id="tagIdFromRequest" name="tagId"
		value="<%=tagId%>">
        <%
		}
		} catch (Exception e) {
	%>
        <input type="hidden" id="tagIdFromRequest" value="0">
        <%
		}
	%>
        <!-- Center part start -->
        <section>
          <div class="">
            <div class="page-header">
              <h1>Add New Tags</h1>
            </div>
            <div class="container-head">
              <div class="col-md-12" style="text-align: right; color: #fff;"> <span style="float: left; color: #fff;">Add New Tags</span>
                <div class="dropdown">
                  <ul class="dropdown-menu"
							style="min-width: 100px; padding: 0 20px 0 0; margin-left: 950px; text-align: left;">
                    <li><a href="login.html"><i class="mostviewicon"></i><span
									class="user">Preview </span></a></li>
                    <li id="sendemail"><a href="login.html"><i
									class="emailicon"></i><span class="user">Send Test Email</span></a></li>
                    <li class="none" id="sendsms"><a href="login.html"><i
									class="callicon"></i><span class="user">Send Test SMS</span></a></li>
                  </ul>
                </div>
              </div>
            </div>
            <form id="addTagForm" name="addTagForm11"
				action="<%=request.getContextPath()%>/ping/insertTags.htm"
				method="post">
              <div class="widget-box"><div class="widget-body">
                <div class="widget-main clearfix">
                  <div class="row">
                    <div class="form-group clearfix">
                      <label class="col-sm-2 control-label no-padding-right" for="notifyTagName">Tag Name <span class="red">*</span></label>
                      <div class="col-sm-10">
                        <input type="text" class="input-xxlarge" title="Tag Name" id="notifyTagName" name="notifyTagName" validate="1" emsg="Tag Name">
                        <div id="notifyTagName_error" class="help-block hide">Please provide a valid tag name.</div>
                      </div>
                    </div>
                    
                  </div>
                  <div class="row">
                  
                  <div class="form-group clearfix">
                      <label class="col-sm-2 control-label no-padding-right">Description</label>
                      <div class="col-sm-10">
                        <textarea class="input-xxlarge" rows="2" id="notifyTagDescription" name="notifyTagDescription"></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group clearfix">
                      <label class="col-sm-2 control-label no-padding-right" for="notifyTagName">Mapped Code Types <span class="red">*</span></label>
                      <div class="col-sm-10">
                        <select name="mappedCodeTypeId" class="form-control input-xxlarge" id="mappedCodeTypeId">
                          <option value="0">---Select---</option>
                        </select>
                        <div id="mappedCodeTypeId_error" class="help-block hide">Please provide a valid mapped code types.</div>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="form-group clearfix">
                      <label class="col-sm-2 col-xs-4 control-label no-padding-right">Is Active</label>
                      <div class="col-sm-10 col-xs-8">
                        <input id="isActive" name="isActive" type="checkbox" checked="checked">
                      </div>
                    </div></div>
                  </div>
                  <div class="row">
                    
                    <div class="topmenu margin_5px clearfix">
                    <div class="col-sm-2"></div>
                      <div class="col-sm-5 rightAlign"><div type="button" class="btn btn-primary btn-xs  createNewBtn"
							name="Save" title="Save" alt="Save" onclick="saveTags()">Save</div>
                      <div type="button" class="btn btn-primary btn-xs  createNewBtn"
							name="Cancel" title="Cancel" alt="Cancel" onclick="saveTags()">Cancel</div></div>
                    </div>
                  </div>
                </div></div>
              
            </form>
            <!-- center end --> 
          </div>
          <input type="hidden" name="chkboxvalue" id="chkboxvalue">
        </section>
        <!-- Center part End -->
        
        <jsp:include page="../common/footer.jsp" />
<script>
		$(function() {
			$
					.ajax({
						type : "POST",
						url : $('#contextPath').val()
								+ '/common/getPicklistValues.htm?codeTypeIds=57',
						success : function(result) {
							$(result)
									.each(
											function(i, obj) {
												var codeTypeId = obj.codeTypeId;
												var codeValue = obj.codeValue;
												var codevalueId = obj.codeValueId;
												$('#mappedCodeTypeId').append(
														'<option value="'+codevalueId+'">'
																+ codeValue
																+ '</option>');

												if (tagIdFromRequest == 0) {

												} else {

													$
															.ajax({
																type : 'POST',
																url : $(
																		'#contextPath')
																		.val()
																		+ "/ping/getTagDetails.htm?tagId="
																		+ tagIdFromRequest,

																success : function(
																		result) {

																	$(result)
																			.each(
																					function(
																							i,
																							obj) {
																						var notifyTagName = obj.notifyTagName;
																						var notifyTagDescription = obj.notifyTagDescription;
																						var scheduleHours = obj.scheduleHours;
																						var isActive = obj.chkboxvalue;
																						var mappedCodeTypeId = obj.mappedCodeTypeId;

																						$(
																								'#notifyTagName')
																								.val(
																										notifyTagName);
																						$(
																								'#notifyTagDescription')
																								.val(
																										notifyTagDescription);
																						$(
																								'#mappedCodeTypeId')
																								.val(
																										mappedCodeTypeId);
																						if (isActive == "1") {
																							$(
																									'#isActive')
																									.attr(
																											'checked');
																						} else {
																							$(
																									'#isActive')
																									.attr(
																											'Unchecked');
																						}

																					});
																}
															});

												}
											});
						}
					});

			var mappedCodeTypeId = 0;
			var tagIdFromRequest = $('#tagIdFromRequest').val();

		});
		function saveTags() {
			var isValidated = true;
			if ($.trim($('#notifyTagName').val()) == '') {
				addCssStyles('notifyTagName', 'Please add Tag Name.');
				isValidated = false;
				$('#notifyTagName_error').removeClass('hide');;
				$('#notifyTagName_error').parent().parent().addClass('has-error');

			} else {
				removeCssStyles('notifyTagName');
				$('#notifyTagName').css('color', '#333333');
				$('#notifyTagName_error').addClass('hide');
				$('#notifyTagName_error').parent().parent().removeClass('has-error');
			}
			if ($('#mappedCodeTypeId').val() == '0') {
				addCssStyles('mappedCodeTypeId',
						'Please Select Mapped Code Type.');
				isValidated = false;
				$('#mappedCodeTypeId_error').removeClass('hide');;
				$('#mappedCodeTypeId_error').parent().parent().addClass('has-error');

			} else {
				removeCssStyles('mappedCodeTypeId');
				$('#mappedCodeTypeId').css('color', '#333333');
				$('#mappedCodeTypeId_error').addClass('hide');
				$('#mappedCodeTypeId_error').parent().parent().removeClass('has-error');
			}

			if (isValidated == false) {
				showAlertMessage(
						"Error",
						"There are some validation errors,please check to proceed further.",
						'error', doNothing);
			}

			if (isValidated == true) {
				var tagIdFromRequest = $('#tagIdFromRequest').val();

				if ($('#isActive').is(":checked")) {
					$('#chkboxvalue').val('checked');
				} else {
					$('#chkboxvalue').val('not checked');
				}
				$.ajax({
					type : "POST",

					url : $('#contextPath').val()
							+ '/ping/insertTags.htm?isActive='
							+ $('#chkboxvalue').val() + '&tagId='
							+ tagIdFromRequest,
					data : $('#addTagForm').serialize(),

					success : function(result) {
						result = JSON.parse(result);
						if (result == "success") {
							showAlertMessage("Success",
									"<br/> Tags saved successfully.",
									"information", redirectFurther);
						}

					}
				});
			}
		}
		function redirectFurther() {
			window.location.href = $('#contextPath').val()
					+ '/ping/getTagsList.htm';
		}
		function copyText(id) {
			standardTag = id;
		}
		function closeTagDetailList(section) {
			if (section == 'email') {
				$('#tagDetailList').parent().hide();
			} else {
				$('#tagDetailListSMS').parent().show();
			}
		}

		function addSelectedTag() {
			if ($('#availableTags').val() != '0') {
				if (!tagList.contains($('#availableTags').val())) {
					tagList.push($('#availableTags').val());
					$('#selectedTagList')
							.append(
									'<div class="alertn pull-left">'
											+ $(
													'#availableTags option:selected')
													.text()
											+ '<input class="closen" id="'
											+ $('#availableTags').val()
											+ '" data-dismiss="alert" value="-" type="button"></div>');
				}

			}
		}
	</script>

</body>
</html>