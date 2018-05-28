<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.cp.AssetData"%>
<%@page import="in.fiinfra.cp.common.CpConstants"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.List"%>
<%
	AssetData asset=(AssetData) request.getAttribute("assetData");
%>
<%
	List<KeyValue> familyMembers=(List<KeyValue>) request.getAttribute("familyMembers");
%>
<script>
	$(document).ready(function() {

		$('#asset-mutual-fund-form').validate({
			errorElement:'div',
			errorClass:"errors", 
		
			rules : {
				accountFolioNo : {
					required : true,
					alphanumeric : true,
					maxlength : 20
				},
				assetName : {
					required : true

				},
				totalUnitsQty : {
					required : true,
					digits : true,
					min : 1,
					maxlength : 10
				},
				sipAmount : {
					required : true,
					digits : true,
					min : 1,
					maxlength : 18

				},
				sipStartDate : {
					required : true
				},
				sipEndDate : {
					required : true
				}
			},
			messages : {

			}

		});
		// Calls the selectBoxIt method on your HTML select box
	});
</script>
<script>
	function saveAsset() {

		if ($('#asset-mutual-fund-form').valid()) {
			$('#asset-mutual-fund-form').submit();
		}
	}
</script>
<script>
	var selectedScript = null;
	$(document)
			.ready(
					function() {

						var cache = {};
						$("#assetName")
								.autocomplete(
										{
											source : function(request, response) {
												var term = request.term;
												console.log(term);
												if (term in cache) {
													response(cache[term]);
													return;
												}
												$
														.getJSON(
																"${pageContext.request.contextPath}/common/product.json?type=Mf&searchStr="
																		+ request.term,
																function(data) {

																	var output = $
																			.map(
																					data,
																					function(
																							data) {
																						return {
																							label : data.name,
																							value : data.id,
																							id : data.id
																						};
																					});
																	cache[term] = output;
																	response(output);
																});
											},
											autoFocus : true,
											minLength : 2,
											select : function(event, ui) {
												event.preventDefault();
												$("#productId").val(
														ui.item.value);
												$("#assetName").val(
														ui.item.label);
												selectedScript = ui.item.label;
											}
										});

						$("#assetName")
								.focusout(
										function() {
											if ($("#assetName").val().length <= 0) {
												$("#productId").val("");
											} else if (selectedScript != $(
													"#assetName").val()) {
												if ($("#assetName").val().length > 0
														&& selectedScript.length == 0) {
													showMessage(
															'Mutual fund name not found.',
															true);
													$("#assetName").focus();
												}
												$("#assetName").val(
														selectedScript);
											}
										});
						selectedScript = $("#assetName").val();

						$(".selectboxit-container ").click(function() {
							//$('#personal_details_accordian').perfectScrollbar("update");
							//$('#contact_details_accordian').perfectScrollbar("update");
							//	$('.family_details').perfectScrollbar("update");
						});
						$(".thumb_select_ul a").click(
								function() {
									//alert("hi");
									$(this).children(".categoery").toggleClass(
											"applicable");
								})
					})
</script>

<!-- custom scroll to "common_in_content" -->
<script>
	$(document).ready(function() {
		//Tracker Details Rating value Slider
		createSlider('#Conversion_Probability', 0, 100, 1, "#C_P_Value")
		createSlider('#opportunity_rating', 1, 3, 1, "")

	});
</script>
<!-- custom scroll to "common_in_content" -->

<script>
	$(document)
			.ready(
					function() {
						$("#tabs").tabs();
						$(function() {
							$( ".datepicker" ).datepicker({
							dateFormat: "dd-M-yy",
							showOn: "button",
							yearRange: "-100:+0",
							autoclose : true,
							changeMonth: true,
							changeYear: true,
							endDate: "dateToday"
							});
							$("#sipStartDate").datepicker({
								changeMonth : true,
								changeYear : true,
								autoclose : true,
								showOn: "button",
								dateFormat : 'dd-M-yy',
								endDate: "dateToday"
								
							});
							
							//$( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
						});
						
						$(function() {
							$(".datepicker").datepicker({
								dateFormat : "dd-M-yy",
								showOn : "button",
								buttonText : '',
								yearRange : "-100:+0",
								changeMonth : true,
								changeYear : true,
								endDate: "dateToday"	
							});
							$("#boughtInTheYear").datepicker({
								changeMonth : true,
								changeYear : true,
								autoclose : true,
								dateFormat : 'dd-M-yy',
								endDate: "dateToday"
							});
							$(".ui-datepicker-trigger")
									.wrap(
											"<div class='datepicker-trigger-parent'></div>");
						});
						$(function() {
						 $( ".datepicker1" ).datepicker({
						  dateFormat: "dd-M-yy",
						  showOn: "button",
						  autoclose : true,
						  yearRange: "0:+100",
						  changeMonth: true,
						  changeYear: true,
						  startDate: "dateToday"
						 });
						 $("#sipEndDate").datepicker({
								changeMonth : true,
								changeYear : true,
								autoclose : true,
								dateFormat : 'dd-M-yy',
								 startDate: "dateToday"
							});
						 /* $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );*/
						}); 

						$(".datepicker").attr('readOnly', 'true');

						$(".datepicker").attr('readOnly', 'true');

						$(".datepicker").attr('readOnly', 'true');

						/* $("select").selectBoxIt(); */
						// Calls the selectBoxIt method on your HTML select box
						$("body").on("click", ".submit_btn", function() {

							if ($('#asset-mutual-fund-form').valid()) {
								$('#asset-mutual-fund-form').submit();
							}
						});

						$("body")
								.on(
										"click",
										"#addSave",
										function() {

											if ($('#asset-mutual-fund-form')
													.valid()) {
												var form = $('#asset-mutual-fund-form');
												form
														.append('<input name="action" type="hidden" value="add"/>');
												form.submit();
											}
										});

						var assetId = "${assetId}";
						if (assetId > 0) {
							//$("#ownerPartyId").attr("disabled",true);
						}

					});
</script>
</head>
<body>

	<!-- end of "nav-menu" id -->
	<!-- <legend>MY ASSETS : MUTUAL FUND</legend> -->
	<%-- <div id="header-strip" class="fl">
			<h3 class="clearfix fl">MY ASSETS : <span class="title_it">MUTUAL FUND</span></h3>
			<jsp:include page="../menu.jsp"></jsp:include>
			<!--<a href="#" class="my-asset-btn clearfix fr"><img src="../images/transparent.png" />My Assets</a>-->
			<a href="${pageContext.request.contextPath}/portfolio/myLoan"
				class="my-loan-btn clearfix fr"><img
				src="${pageContext.request.contextPath}/resources/images/transparent.png" />My
				Loans</a>
		</div> --%>
	<!-- end of "header-strip" id -->

	<!-- <div id="inner-shadow-strip"></div> -->
	<!-- end of "inner-shadow-strip" id -->

	<%-- <div id="contents">
			
				<div class="tab_border">
					<!--title starts-->

					<div class="add_mf_title_bx">
						<ul>
							<li class="input_title_one fl">Owner</li>
							<li class="input_title_two fl">Folio No</li>
							<li class="input_title_three fl">Fund Name</li>
							<li class="input_title_four fl">Total Units</li>
							<!-- <li class="input_title_five fl">SIP Amount</li>
							<li class="input_title_six fl">SIP Start Date</li>
							<li class="input_title_six fl">SIP End Date</li> -->
							<div class="clr"></div>
						</ul>
					</div>
					<!--title ends-->
					<!--txt starts-->

					

					

						<div class="add_mf_li_bx first_row">
							<ul>

								<%List<KeyValue> familyMembers=(List<KeyValue>) request.getAttribute("familyMembers"); %>

								<li class="input_txt_one fl">
								<%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               
               <%} %>
								<select id="ownerPartyId"
									name="ownerPartyId" class="required">
										<%  
                  for (KeyValue idv:familyMembers){
                  %>

										<option value='<%=idv.getId()%>' <%=idv.getId().equals(asset.getOwnerPartyId())? " selected":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
										<%}%>
								</select>
								<li class="input_txt_two fl"><input type="text"
									class="grt_bx " value="<%=CommonUtils.emptyIfNull(asset.getAccountFolioNo()) %>"
									name="accountFolioNo"></li>
								<li class="input_txt_three fl"><input type="text"
									class="grt_bx" value="<%=CommonUtils.emptyIfNull(asset.getAssetName()) %>"
									name="assetName" id="assetName"></li>
								<li class="input_txt_four fl"><input
									class="grt_bx numbersOnly"
									value="<%=asset.getTotalUnitsQty()>0?asset.getTotalUnitsQty():"" %>" name="totalUnitsQty">
								</li>
								
							</ul>
							<!-- txt ends-->



						</div>

                    <div class="add_mf_title_bx">
            <ul>
                <li class="input_title_one fl">SIP Amount</li>
                <li class="input_title_two fl">SIP Start Date</li>
                <li class="input_title_three fl">SIP End Date</li>
                <li class="input_title_four fl">SIP Frequency</li>
                <div class="clr"></div>
          	</ul>
          </div>
          <div class="add_mf_li_bx first_row">
          
            <ul>
               <li class="input_txt_one fl"><input type="text"
									class="grt_bx numbersOnly" value="<%=asset.getSipAmount()>0?asset.getSipAmount():"" %>"
									name="sipAmount"></li>
								<li class="input_txt_two fl"><input type="text"
									class="grt_bx_date fl datepicker"
									placeholder="dd-mmm-yyyy" name="sipStartDate" value="<%=CommonUtils.emptyIfNull(CommonUtils.format(asset.getSipStartDate(), "dd-MMM-yy")) %>">
								</li>
								<li class="input_txt_three fl"><input type="text"
									class="grt_bx_date fl datepicker1" 
									placeholder="dd-mmm-yyyy" name="sipEndDate" value="<%=CommonUtils.emptyIfNull(CommonUtils.format(asset.getSipEndDate(), "dd-MMM-yy")) %>"></li>
								<li class="input_txt_four fl"> <select class="sel_wid" id="sipFreqId" name="sipFreqId" >
            <% List<CodeValueData> freqTypes =(List<CodeValueData>) request.getAttribute("freqList");
            for (CodeValueData idv:freqTypes){
                  %>
            
            <option value='<%=idv.getCodeValueId()%>'   <%=new Integer(idv.getCodeValueId()).equals(asset.getSipFreqId())?" selected ":"" %>><%=idv.getCodeValue()%></option>
            <%}%>
          </select></li>
             </ul> <!-- txt ends--> 
          </div>


						<div class="add_btn_bx">
							<input type="button" id="addSave" class="submit_btn" value="SAVE &amp; ADD">
							<input type="button" class="submit_btn" value="SAVE"> <a
								href="${pageContext.request.contextPath}/portfolio/myAssets"><input
								type="button" class="cancel_btn" value="CANCEL"></a>
								</div> 								
					</form>
				</div>
			
		</div> --%>
	<form id="asset-mutual-fund-form" commandName="assetData"
		action="${pageContext.request.contextPath}/portfolio/myAsset/save"
		method="POST">
		<input name="productId" id="productId" type="hidden"
			value="<%=asset.getProductId()%>" /> <input name="assetTypeId"
			type="hidden" value="<%=CpConstants.MUTUAL_FUND%>" /> <input
			name="partyAssetId" type="hidden"
			value="<%=asset.getPartyAssetId() != null ? asset.getPartyAssetId()
					: 0%>" />

		<fieldset>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Owner</label>
					<div class="col-lg-4">
						<!-- <input id="second_col_input" name="url" placeholder="Heading"
								class="form-control" type="text" value=""> -->
						<select id="ownerPartyId" name="ownerPartyId" class="form-control">
							<%
								for (KeyValue idv : familyMembers) {
							%>

							<option value='<%=idv.getId()%>'
								<%=idv.getId().equals(asset.getOwnerPartyId()) ? " selected"
						: ""%>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
							<%
								}
							%>
						</select>
					</div>
				</div>
				<br> <br>
			</div>
					<div class="col-xs-12 ">
			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">Transaction Type <span class="required">*</span></label>
				<div class="col-lg-4">
							<select class="form-control" id="transId" name="transId">
							<%
								List<CodeValueData> transtypes = (List<CodeValueData>) request
										.getAttribute("transList");
								for (CodeValueData idv : transtypes) {
							%>

							<option value='<%=idv.getCodeValueId()%>'
								<%=new Integer(idv.getCodeValueId()).equals(asset
						.getTransId()) ? " selected " : ""%>><%=idv.getCodeValue()%></option>
							<%
								}
							%>
						</select>
						
				</div>
			</div>
			<br> <br>
		</div>
			<div class="col-xs-12 ">
			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">Bought in the year</label>
				<div class="col-lg-4">
					<div class="input-group">
					<!-- <input id="second_col_input" name="url" placeholder="Subject" class="form-control" type="text" value=""> -->
					<input type="text" id="boughtInTheYear" name="sipStartDate"
							class="form-control" placeholder="dd-mmm-yyyy"
							aria-invalid="true"
							value="<%=CommonUtils.emptyIfNull(CommonUtils.format(
					asset.getInvestmentDate(), "dd-MMM-yy"))%>">	
					<span class="input-group-addon"> <i class="ace-icon fa fa-calendar"></i>
								</span>
							</div>	
						
				</div>
			</div>
			<br> <br>
		</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Folio
						No <span class="required">*</span></label>
					<div class="col-lg-4">
						<!-- <input id="second_col_input" name="url" placeholder="Subject" class="form-control" type="text" value=""> -->

						<input type="text" class="form-control"
							value="<%=CommonUtils.emptyIfNull(asset.getAccountFolioNo())%>"
							name="accountFolioNo">
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Fund
						Name <span class="required">*</span></label>
					<div class="col-lg-4">
						<input type="text" class="form-control"
							value="<%=CommonUtils.emptyIfNull(asset.getAssetName())%>"
							name="assetName" id="assetName">
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Total
						Units <span class="required">*</span></label>
					<div class="col-lg-4">
						<input class="form-control"
							value="<%=asset.getTotalUnitsQty() > 0 ? asset.getTotalUnitsQty()
					: ""%>"
							name="totalUnitsQty">
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">SIP
						Amount <span class="required">*</span></label>
					<div class="col-lg-4">
					
						<input type="text" class="form-control"
							value="<%=asset.getSipAmount() > 0 ? asset.getSipAmount() : ""%>"
							name="sipAmount">
							
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">SIP
						Start Date <span class="required">*</span></label>
					<div class="col-lg-4">
						<div class="input-group">
						<input type="text" id="sipStartDate" name="sipStartDate"
							class="form-control" placeholder="dd-mmm-yyyy"
							aria-invalid="true"
							value="<%=CommonUtils.emptyIfNull(CommonUtils.format(
					asset.getSipStartDate(), "dd-MMM-yy"))%>">
					<span class="input-group-addon"> <i class="ace-icon fa fa-calendar"></i>
								</span>
							</div>
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">SIP
						End Date <span class="required">*</span></label>
					<div class="col-lg-4">
						<div class="input-group">
						<input type="text" id="sipEndDate" name="sipEndDate"
							class="form-control" placeholder="dd-mmm-yyyy"
							aria-invalid="true"
							value="<%=CommonUtils.emptyIfNull(CommonUtils.format(
					asset.getSipStartDate(), "dd-MMM-yy"))%>">
					<span class="input-group-addon"> <i class="ace-icon fa fa-calendar"></i>
								</span>
							</div>
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">SIP
						Frequency</label>
					<div class="col-lg-4">
						<select class="form-control" id="sipFreqId" name="sipFreqId">
							<%
								List<CodeValueData> freqTypes = (List<CodeValueData>) request
										.getAttribute("freqList");
								for (CodeValueData idv : freqTypes) {
							%>

							<option value='<%=idv.getCodeValueId()%>'
								<%=new Integer(idv.getCodeValueId()).equals(asset
						.getSipFreqId()) ? " selected " : ""%>><%=idv.getCodeValue()%></option>
							<%
								}
							%>
						</select>
					</div>
				</div>
				<br> <br>
			</div>
		</fieldset>
	</form>
	<div class="col-xs-12" align="center">
		<input type="button" class="btn-primary btn-xs btn"
				value="Save" onClick="saveAsset('new')"> <a
				href="${pageContext.request.contextPath}/portfolio/myAssets"></a>
				
				<input id="addSave" type="button" value="Save &amp; Add" class="btn-primary btn-xs btn"	>
			
		
			
			<a class="btn-primary btn-xs btn"
				href="/FIINFRA-Client-WEB/portfolio/myAssets">Cancel</a>
	</div>
	<!-- end of "contents" id -->
</body>

<!-- End of "wrapper" id -->