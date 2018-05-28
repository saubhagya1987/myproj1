<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="java.util.Calendar"%>
<%@page import="in.fiinfra.cp.AssetData"%>
<%@page import="in.fiinfra.cp.common.CpConstants"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%
	AssetData asset=(AssetData) request.getAttribute("assetData");
%>
<script>
	$(document).ready(function() {

		$('#asset-property-form').validate({
			errorElement:'div',
			errorClass:"errors", 
			
			rules : {
				currentValue : {
					required : true,
					digits : true,
					min : 1,
					maxlength : 18

				},
				investmentDate : {
					required : true,

				}
			},
			messages : {

			}

		});
		// Calls the selectBoxIt method on your HTML select box
	});
</script>
<script>
	$(document).ready(function() {

		$(".selectboxit-container ").click(function() {
			//$('#personal_details_accordian').perfectScrollbar("update");
			//$('#contact_details_accordian').perfectScrollbar("update");
			//	$('.family_details').perfectScrollbar("update");
		});
		$(".thumb_select_ul a").click(function() {
			//alert("hi");
			$(this).children(".categoery").toggleClass("applicable");
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

						$(".datepicker").attr('readOnly', 'true');

						$(".datepicker").attr('readOnly', 'true');

						/* $("select").selectBoxIt(); */
						// Calls the selectBoxIt method on your HTML select box

						$("body").on("click", ".submit_btn", function() {
							if ($('#asset-property-form').valid()) {
								$('#asset-property-form').submit();
							}

						});

						$("body").on("click","#addSave",function() {
											var form = $('#asset-property-form');
											form
													.append('<input name="action" type="hidden" value="add"/>');
											form.submit();

										});

						var assetId = "${assetId}";
						if (assetId > 0) {
							//$("#ownerPartyId").attr("disabled",true);
						}

					});
</script>


<!-- <legend>MY ASSETS : PROPERTY</legend> -->
<%-- <div id="header-strip" class="fl">
    <h3 class="clearfix fl">MY ASSETS : <span class="title_it">PROPERTY</span></h3>
   <jsp:include page="../menu.jsp"></jsp:include>
    <a href="${pageContext.request.contextPath}/portfolio/myLoan" class="my-loan-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Loans</a> 
    </div> --%>
<!-- end of "header-strip" id -->

<!-- <div id="inner-shadow-strip"></div> -->
<!-- end of "inner-shadow-strip" id -->



<!--title starts-->

<!-- <div class="add_stock_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Bought in the year</li>
            <li class="input_title_three fl">Current Value</li>
            <li class="input_title_four fl">Description</li>
            <div class="clr"></div>
          </ul>
          </div> -->
<!--title ends-->
<!--txt starts-->
<%
	List<KeyValue> familyMembers = (List<KeyValue>) request
			.getAttribute("familyMembers");
%>

<form id=asset-property-form
	action="${pageContext.request.contextPath}/portfolio/myAsset/save"
	method="POST">
	<input name="assetTypeId" type="hidden" value="48047" />
<input name="partyAssetId" type="hidden"
	value="<%=asset.getPartyAssetId() != null ? asset.getPartyAssetId()
					: 0%>" />
	<%-- <ul>
            
                <li class="input_txt_one fl">
                <%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               
               <%} %>
                <select id="ownerPartyId" name="ownerPartyId" class="required">
                  <%  Calendar cal=Calendar.getInstance();
                  if(asset.getInvestmentDate()!=null){
                  cal.setTime(asset.getInvestmentDate());
                  
                  }for (KeyValue idv:familyMembers){
                  %>
                  
                  <option value='<%=idv.getId()%>' <%=idv.getId().equals(asset.getOwnerPartyId())? " selected":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
                  <%}%>
                  </select></li>
                <li class="input_txt_two fl"> <input name="investmentDate"  class="grt_bx datepicker" value="<%=CommonUtils.emptyIfNull(CommonUtils.format(asset.getInvestmentDate(), "dd-MMM-yy")) %>"> </li>
                <li class="input_txt_three fl"><input name="currentValue" class="grt_bx numbersOnly" value="<%=asset.getCurrentValue()>0?asset.getCurrentValue():""%>"> </li>
                <li class="input_txt_four fl"> <input name="description"  class="grt_bx " value="<%=CommonUtils.emptyIfNull(asset.getDescription())%>"> </li>
              </ul> --%>

	<!-- txt ends-->
	<!-- New Code -->

	<fieldset>
		<div class="col-xs-12 ">
			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">Owner</label>
				<div class="col-lg-4">
					<!-- <input id="second_col_input" name="url" placeholder="Heading"
								class="form-control" type="text" value=""> -->
					<%
						if (asset.getPartyAssetId() != null && asset.getPartyAssetId() > 0) {
					%>

					<%
						}
					%>
					<select id="ownerPartyId" name="ownerPartyId" class="form-control">
						<%
							Calendar cal = Calendar.getInstance();
							if (asset.getInvestmentDate() != null) {
								cal.setTime(asset.getInvestmentDate());

							}
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
								List<CodeValueData> transtypes = (List<CodeValueData>) request.getAttribute("transList");
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
				<label for="textArea" class="col-lg-2 control-label">Property Name<span class="required">*</span></label>
				<div class="col-lg-4">
					<input type="text" class="form-control"
						value="<%=asset.getPropertyName() > 0 ? asset.getPropertyName(): "" %>"
						name="propertyName">
				</div>
			</div>
			<br> <br>
		</div>
		<div class="col-xs-12 ">
			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">Purchase Amount <span class="required">*</span></label>
				<div class="col-lg-4">
					<input type="text" class="form-control"
						value="<%=asset.getPurchaseAmount() > 0 ? asset.getPurchaseAmount()
					: ""%>"
						name="purchaseAmount">
				</div>
			</div>
			<br> <br>
		</div>
		<div class="col-xs-12 ">
			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">Current
					Value <span class="required">*</span></label>
				<div class="col-lg-4">
					<input type="text" class="form-control"
						value="<%=asset.getCurrentValue() > 0 ? asset.getCurrentValue()
					: ""%>"
						name="currentValue">
				</div>
			</div>
			<br> <br>
		</div>
		<div class="col-xs-12 ">
			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">Description</label>
				<div class="col-lg-4">
					<input type="text" class="form-control"
						value="<%=CommonUtils.emptyIfNull(asset.getDescription())%>"
						name="description">
				</div>
			</div>
			<br> <br>
		</div>
	</fieldset>
</form>
<!-- New Code End -->






<%-- <div class="add_btn_bx"><form>
                    	<input type="button" id="addSave" class="submit_btn" value="SAVE &amp; ADD">
                    	<input type="button" class="submit_btn" value="SAVE">
                        <a href="${pageContext.request.contextPath}/portfolio/myAssets" ><input type="button" class="cancel_btn" value="CANCEL"></a>
                   </form>   
          </div>    --%>
<div class="col-xs-12" align="center">
	
			<input type="button" id="addSave" class="btn-primary btn-xs btn" value="Save"></input>
		
			<input type="button" id="addSave" value="Save &amp; Add" class="btn-primary btn-xs btn"></input>
		
		
			
		
		
			<a class="btn-primary btn-xs btn" href="/FIINFRA-Client-WEB/portfolio/myAssets">Cancel</a>
		
	
</div>

<!-- end of "contents" id -->





<!-- End of "wrapper" id -->


