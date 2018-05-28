
<%@page import="in.fiinfra.cp.AssetData"%>
<%@page import="in.fiinfra.cp.common.CpConstants"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.List"%>
<%
	AssetData asset=(AssetData) request.getAttribute("assetData");
%>
<script>
	$(document).ready(function() {
		$('#asset-retirement-ppf-form').validate({
			errorElement:'div',
			errorClass:"errors", 
			 
			rules : {
				maturityDate : {
					required : true
				},
				currentValue : {
					required : true,
					digits : true,
					min : 1,
					maxlength : 18
				},
				sipAmount : {
					required : true,
					digits : true,
					min : 1,
					maxlength : 18

				}
			},
			messages : {
				maturityDate : "Enter a date",
				currentValue : {
					required : "Enter a value",
					digits : "Enter amount in digits only"
				},
				sipAmount : {
					required : "Enter a value",
					digits : "Enter amount in digits only"
				}

			}

		});
		// Calls the selectBoxIt method on your HTML select box
	});
</script>
<script>
	$(document).ready(function() {

		$('#asset-retirement-epf-form').validate({
		   	errorElement:'div',
			errorClass:"errors", 
			
			rules : {

				description : {
					required : true
				},
				currentValue : {
					required : true,
					digits : true,
					min : 1,
					maxlength : 18
				},
				sipAmount : {
					required : true,
					digits : true,
					min : 1,
					maxlength : 18

				}
			},
			messages : {
				description : "Enter a descripton",
				currentValue : {
					required : "Enter a value",
					digits : "Enter amount in digits only"
				},
				sipAmount : {
					required : "Enter a value",
					digits : "Enter amount in digits only"
				}

			}

		});
		// Calls the selectBoxIt method on your HTML select box
	});
</script>
<script>
	$(document)
			.ready(
					function() {

						/* $("select").selectBoxIt(); */

						$(function() {
							$(".datepicker").datepicker({
								dateFormat : "dd-M-yy",
								showOn : "button",
								buttonText : '',
								yearRange : "0:+100",
								changeMonth : true,
								changeYear : true,
								minDate : '0'
							});
							$("#maturityDate").datepicker({
								changeMonth : true,
								changeYear : true,
								autoclose : true,
								dateFormat : 'dd-M-yy',
								minDate : '0'
							});
							$(".ui-datepicker-trigger")
									.wrap(
											"<div class='datepicker-trigger-parent'></div>");
						});

						$(".datepicker").attr('readOnly', 'true');

						$(".datepicker").attr('readOnly', 'true');

						$(".datepicker").attr('readOnly', 'true');

						$(".selectboxit-container ").click(function() {

						});
						$("body").on("click", ".submit_btn_1", function() {
								if ($('#asset-retirement-ppf-form').valid()) {
									$('#asset-retirement-ppf-form').submit();
								
							}
						});
						$("body").on("click", ".submit_btn_2", function(){
								 if ($('#asset-retirement-epf-form').valid()) {
									$('#asset-retirement-epf-form').submit();
								
							}
						});

						$("body").on("click","#addSave_1",function() {

											
												if ($(
														'#asset-retirement-ppf-form')
														.valid()) {
													var form = $('#asset-retirement-ppf-form');
													form
															.append('<input name="action" type="hidden" value="add"/>');
													form.submit();

												}
						});

						$("body").on("click","#addSave_2",function() {		
												if ($('#asset-retirement-epf-form')
														.valid()) {
													var form = $('#asset-retirement-epf-form');
													form
															.append('<input name="action" type="hidden" value="add"/>');
													form.submit();

												}
						});

						/* $("#ppf")
								.click(
										function() {
											if (!($(".ppf_box").is(":visible"))) {
												$
														.when(
																$(
																		".dynamic_box")
																		.hide(
																				"blind"))
														.done(
																function() {
																	$(
																			".ppf_box")
																			.fadeIn(
																					"slow");
																});
											}
										}); */
						/* $("#epf")
								.click(
										function() {
											if (!($(".epf_box").is(":visible"))) {
												$
														.when(
																$(
																		".dynamic_box")
																		.hide(
																				"blind"))
														.done(
																function() {
																	$(
																			".epf_box")
																			.fadeIn(
																					"slow");
																});
											}
										}); */

						var key = "${key}";
						if (key > 0) {
							if (key == 48012) {

								$('#epf').click();
								$(".add_ppf_btn").hide();
								//$("#ownerPartyId1").attr("disabled",true);

							} else if (key == 48008) {

								$('#ppf').click();
								$(".add_epf_btn").hide();
								//$("#ownerPartyId").attr("disabled",true);
							}
							$("#epf").unbind("click");
							$("#ppf").unbind("click");

						}

					});
</script>
<!-- <legend>MY ASSETS : RETIREMENT FUND</legend> -->
<%
	List<KeyValue> familyMembers = (List<KeyValue>) request
			.getAttribute("familyMembers");
%>
<%-- <div id="header-strip" class="fl">
    <h3 class="clearfix fl">MY ASSETS : <span class="title_it">RETIREMENT FUND</span></h3>
    <jsp:include page="../menu.jsp"></jsp:include>
    <!--<a href="#" class="my-asset-btn clearfix fr"><img src="../images/transparent.png" />My Assets</a>--> <a href="${pageContext.request.contextPath}/portfolio/myLoan" class="my-loan-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Loans</a> 
    </div> --%>
<!-- end of "header-strip" id -->

<!-- <div id="inner-shadow-strip"></div> -->
<!-- end of "inner-shadow-strip" id -->

<%-- <div id="contents">
<section class="in_content clearfix" id="add_assets_retirement">
    <div class="tab_border"> 
   
          <div class="clearfix">

  
          
          <div class="add_ppf_btn fl">
          <input name="bank_ac" type="radio" value="" id="ppf">
          <label for="ppf">Public Provident Fund</label> </div>
          
           <div class="add_epf_btn fl">
          <input  name="bank_ac" type="radio" value="" id="epf" checked>
          <label for="epf">Others</label> </div>
   </div>       
   
       <div class="add_bank_depo_bx">
    <!-- PPF Start --> 
    <div class="ppf_box hide dynamic_box">
   
        <!--title starts-->
        <div class="add_ppf_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Maturity Date</li>
            <li class="input_title_three fl">Accumulated Amount</li>
            <li class="input_title_four fl">Annual Contribution</li>
            <div class="clr"></div>
          </ul>
          </div>
        <!--title ends--> 
        <!--txt starts-->
         <form id="asset-retirement-ppf-form"   action="${pageContext.request.contextPath}/portfolio/myAsset/save" method="POST" >
       <%List<KeyValue> familyMembers=(List<KeyValue>) request.getAttribute("familyMembers"); %>
        <div class="add_ppf_li_bx first_row">
         
            <ul>
             <input name="partyAssetId" type="hidden" value="<%=asset.getPartyAssetId()!=null?asset.getPartyAssetId():0%>"/>
             <input name="assetTypeId" type="hidden" value="<%=CpConstants.RETIREMENT_FUND_PPF%>"/>
                <li class="input_txt_one fl">
                <%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               
               <%} %>
                <select id="ownerPartyId" name="ownerPartyId" class="required">
                  <%  
                  for (KeyValue idv:familyMembers){
                  %>
                  
                  <option value='<%=idv.getId()%>' <%=idv.getId().equals(asset.getOwnerPartyId())? " selected":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
                  <%}%>
                  </select>
</li>

                <li class="input_txt_two fl "> <input value="<%=CommonUtils.emptyIfNull(CommonUtils.format(asset.getMaturityDate() , "dd-MMM-yy")) %>" name="maturityDate" type="text" class="grt_bx datepicker" > </li>
                <li class="input_txt_three fl"><input value="<%=asset.getCurrentValue()>0?asset.getCurrentValue():"" %>" name="currentValue"  class="grt_bx  numbersOnly" > </li>
                <li class="input_txt_four fl"><input value="<%=asset.getSipAmount()>0?asset.getSipAmount():"" %>" name="sipAmount"  class="grt_bx numbersOnly" > </li>

              </ul>
            <!-- txt ends--> 
            
          </div>
          </form>
        
</div>
<!-- End PPF -->


<div class="epf_box dynamic_box">
    
        <!--title starts-->
        <div class="add_ppf_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Description</li>
            <li class="input_title_three fl">Accumulated Amount</li>
            <li class="input_title_four fl">Monthly Contribution</li>
            <div class="clr"></div>
          </ul>
          </div>
        <!--title ends--> 
        <!--txt starts-->
        <form id="asset-retirement-epf-form"   action="${pageContext.request.contextPath}/portfolio/myAsset/save" method="POST" >
        <div class="add_ppf_li_bx first_row">
           
            <ul>
              <input name="partyAssetId" type="hidden" value="<%=asset.getPartyAssetId()!=null?asset.getPartyAssetId():0%>"/>
                <li class="input_txt_one fl">
                 <input name="assetTypeId" type="hidden" value="<%=CpConstants.RETIREMENT_FUND_EPF%>"/>
                <%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               <input name="ownerPartyId" type="hidden" value="<%=asset.getOwnerPartyId()%>"/>
               <%} %>
                <select id="ownerPartyId1" name="ownerPartyId" class="required">
                
                  <%  
                  for (KeyValue idv:familyMembers){
                  %>
                  
                  <option value='<%=idv.getId()%>' <%=idv.getId().equals(asset.getOwnerPartyId())? " selected":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
                  <%}%>
                  </select>
</li>

                <li class="input_txt_two fl"> <input value="" name="description" type="text" class="grt_bx" > </li>
                <li class="input_txt_three fl"><input value="<%=asset.getCurrentValue()>0?asset.getCurrentValue():"" %>" name="currentValue" type="text" class="grt_bx numbersOnly"> </li>
                <li class="input_txt_four fl"><input value="<%=asset.getSipAmount()>0?asset.getSipAmount():"" %>" name="sipAmount" type="text" class="grt_bx numbersOnly"> </li>

              </ul>
              
            <!-- txt ends--> 
          </div>
          </form>
         
        
</div>
        
         </div>  
         
         
           <div class="add_btn_bx">
                    	<input type="button" id="addSave" class="submit_btn" value="SAVE &amp; ADD">
                    	<input type="button" class="submit_btn" value="SAVE">
                       <a href="${pageContext.request.contextPath}/portfolio/myAssets" ><input type="button" class="cancel_btn" value="CANCEL"></a>
                      
          </div>   
         
      </div>
      
    <!-- end of "contents" id -->
 
  </section>
  
 </div> --%>

<!-- end of "contents" id -->

<!-- End of "wrapper" id -->


<div style="padding: 10px 10px 0;">
	<div class="tabbable">
		<ul class="nav nav-tabs" id="myTab4">
			<li class="active"><a data-toggle="tab" href="#tabs-1">
					Public Provident Fund</a></li>

			<li><a data-toggle="tab" href="#tabs-2">Others</a></li>
		</ul>


		<div class="tab-content">
			<div id="tabs-1" class="tab-pane in active">
				<form id="asset-retirement-ppf-form"
					action="${pageContext.request.contextPath}/portfolio/myAsset/save"
					method="POST">

					<input name="partyAssetId" type="hidden"
						value="<%=asset.getPartyAssetId() != null ? asset.getPartyAssetId()
					: 0%>" />
					<input name="assetTypeId" type="hidden"	value="<%=CpConstants.RETIREMENT_FUND_PPF%>" />
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
									<select id="ownerPartyId" name="ownerPartyId"
										class="form-control">
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
								<label for="textArea" class="col-lg-2 control-label">Maturity Date <span class="required">*</span></label>
								<div class="col-lg-4">
									<div class="input-group">
									<!-- <input id="second_col_input" name="url" placeholder="Subject" class="form-control" type="text" value=""> -->
										<input type="text" id="maturityDate" name="maturityDate"
							class="form-control" placeholder="dd-mmm-yyyy"
							aria-invalid="true"
							value="<%=CommonUtils.emptyIfNull(CommonUtils.format(
					asset.getMaturityDate(), "dd-MMM-yy"))%>">
									<span class="input-group-addon"> <i class="ace-icon fa fa-calendar"></i>
								</span>
							</div>		
										
										
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Accumulated Amount <span class="required">*</span></label>
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
								<label for="textArea" class="col-lg-2 control-label">Annual Contribution <span class="required">*</span></label>
								<div class="col-lg-4">
									<input type="text" class="form-control"
										value="<%=asset.getSipAmount() > 0 ? asset.getSipAmount() : ""%>"
										name="sipAmount">
								</div>
							</div>
							<br> <br>
						</div>
					</fieldset>
				</form>
				<div class="col-xs-12" align="center">
					
						<input type="button" id="addSave_1" class="btn-primary btn-xs btn" value="Save"></input>
						<input type="button" id="addSave_1"
							value="Save &amp; Add" class="btn-primary btn-xs btn">
						
						<a class="btn-primary btn-xs btn" href="/FIINFRA-Client-WEB/portfolio/myAssets">Cancel</a>
					
				</div>
				<br><br><br>
			</div>
			<div id="tabs-2" class="tab-pane">
				<form id="asset-retirement-epf-form"
					action="${pageContext.request.contextPath}/portfolio/myAsset/save"
					method="POST">
					<input name="partyAssetId" type="hidden"
						value="<%=asset.getPartyAssetId() != null ? asset.getPartyAssetId()
					: 0%>" />
					<input name="assetTypeId" type="hidden"
						value="<%=CpConstants.RETIREMENT_FUND_EPF%>" />
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
									<input name="ownerPartyId" type="hidden"
										value="<%=asset.getOwnerPartyId()%>" />
									<%
										}
									%>
									<select id="ownerPartyId1" name="ownerPartyId"
										class="form-control">
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
								<label for="textArea" class="col-lg-2 control-label">Description <span class="required">*</span></label>
								<div class="col-lg-4">
									<!-- <input id="second_col_input" name="url" placeholder="Subject" class="form-control" type="text" value=""> -->

									<input type="text" class="form-control" value=""
										name="description">
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Accumulated Amount <span class="required">*</span></label>
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
								<label for="textArea" class="col-lg-2 control-label">Monthly Contribution <span class="required">*</span></label>
								<div class="col-lg-4">
									<input type="text" class="form-control"
										value="<%=asset.getSipAmount() > 0 ? asset.getSipAmount() : ""%>"
										name="sipAmount">
								</div>
							</div>
							<br> <br>
						</div>
					</fieldset>
				</form>
				<div class="col-xs-12" align="center">
					
						<input type="button" id="addSave_2"
							class="btn-primary btn-xs btn" value="Save"></input>
						<input type="button" id="addSave_2"
							value="Save &amp; Add" class="btn-primary btn-xs btn">
						
						<a class="btn-primary btn-xs btn"
							href="/FIINFRA-Client-WEB/portfolio/myAssets">Cancel</a>
					
				</div>
				<br><br><br>
			</div>
		</div>
	</div>
</div>

