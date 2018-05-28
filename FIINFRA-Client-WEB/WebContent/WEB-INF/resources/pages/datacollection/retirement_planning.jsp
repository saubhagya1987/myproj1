<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" />

<!-- Wrapper starts-->
<div id="retirement-planning">
	<!-- Main starts-->
	<!--section class="main"-->
	<!-- Common_content Starts-->
	<section class="content common_content">
	 
		<!-- Common_in_contnet starts-->
		<section class="common_unit_selector">
			<ul class="clearfix reset">
				<li class="k"><span class="unit">K</span></li>
				<li class="lacs unit_selected"><span class="unit">Lacs</span></li>
				<li class="cr"><span class="unit">Cr</span></li>
			</ul>
			<p>All figures are in :</p>
		</section>
		<div class="clr"></div>
		<!-- Common_content Starts-->
		<section class="content common_in_content">
			<!-- Common_in_contnet starts-->
			<section class="dc_in_content common_in_content clearfix">
				<ul class="reset clearfix" id="emergency_readiness_ul">
					<li id="confidence_scale" class="clearfix">
						<div class="ques_txt4"><p>how would you rate your preparedness to lead a comfortable life of your choice after retirement?</p>
						</div>
						<div class="range_parent emer_confidence">
							<div class="fl scale clearfix margin-left">
								<div class="scale_range">
									<span class="low extrem">Low</span> <span class="high extrem">High</span>
									<div class="mark">
										<br />
										<div id="94043"></div>
									</div>
								</div>
								<div class="counter_parent">
									<input type="text" id="94043_input" name="179_94043" class="range_counter">
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</li>
					<li id="emergency_details" class="clearfix">
						<div class="ques_txt2">
							<p>At what age do you want to retire?</p>
						</div>
						<div class="value-spinner">
							<input id="spinner" name="94044" value="0" class="spinner">
						</div>
						<div class="ques_txt5">
							<p>Have you assessed how much money you might need to lead a comfortable retired life?</p>
						</div>
						<div class="ques_action2">
							<div class="toggle" id="borrow_sell"></div>
							<input type="checkbox" name="borrow_sell" value="checked" class="borrow_sell orignal_checkbox" />
						</div>
						<div class="clr"></div>
					</li>
					<li id="without_income" class="clearfix">
						<div class="ques_txt2">
							<p>What kind of retirement benefits does your employment provides?</p>
						</div>
						<div class="ques_action-checkbox">
							<ul>
								<li>
									<div class="chekbox_parent">
										<span class="white_checkbox"></span> <input type="checkbox" name="contact_person" class="default_checkbox" />
									</div> <span class="r-p-chkboxes1">Pension</span>
								</li>
								<li>
									<div class="chekbox_parent">
										<span class="white_checkbox"></span> <input type="checkbox" name="contact_person" class="default_checkbox" />
									</div> <span class="r-p-chkboxes2">Super<br/>annuation</span>
								</li>
								<li>
									<div class="chekbox_parent">
										<span class="white_checkbox"></span> <input type="checkbox" name="contact_person" class="default_checkbox" />
									</div> <span class="r-p-chkboxes3">EPF</span>
								</li>
								<li>
									<div class="chekbox_parent">
										<span class="white_checkbox"></span> <input type="checkbox" name="contact_person" class="default_checkbox" />
									</div> <span class="r-p-chkboxes4">Gratuity</span>
								</li>
								<li>
									<div class="chekbox_parent">
										<span class="white_checkbox"></span> <input type="checkbox" name="contact_person" class="default_checkbox" />
									</div> <span class="r-p-chkboxes5">Others</span>
								</li>
								<li>
									<div class="chekbox_parent">
										<span class="white_checkbox"></span> <input type="checkbox" name="contact_person" class="default_checkbox" />
									</div> <span class="r-p-chkboxes6">None</span>
								</li>								
							</ul>
							<div class="clr"></div>
						</div>
					</li>
					<div id="asset-selection">
						<div class="left-questions">
							<p>What is the Value of Assets you currently have for your retirement?</p>
							<p>How much monthly investment do you do for your retirement?</p>
						</div>
						<!-- End of "left-questions" -->
						<div class="right-side">
							<ul>
								<li>
									<div id="icon">
										<ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
											<li class="fl">
												<a href="#">
													<div class="categoery job">
														<div class="thumb">
															<img src="${pageContext.request.contextPath}/resources/images/provident-fund-icon.png" class="cross_circle" height="48" width="48" alt="" /> 
														</div>
													</div> 
												<label class="label">Provident Fund</label>
											</a></li>
										</ul>
									</div>
									<!-- end of "icon" -->
									<div class="value-spinner">
										<input id="spinner1" name="value" value="0" class="spinner">
									</div>
									<div class="value-spinner">
										<input id="spinner2" name="value" value="0" class="spinner">
									</div>
								</li>
								<li>
									<div id="icon">
										<ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
											<li class="fl"><a href="#">
													<div class="categoery job">
														<div class="thumb">
															<img src="${pageContext.request.contextPath}/resources/images/pension-plan-icon.png" class="cross_circle" height="48" width="48" alt="" />
														</div>
													</div> <label class="label">Pension Plan</label>
											</a></li>
										</ul>
									</div>
									<!-- end of "icon" -->
									<div class="value-spinner">
										<input id="spinner3" name="value" value="0" class="spinner">
									</div>
									<div class="value-spinner">
										<input id="spinner4" name="value" value="0" class="spinner">
									</div>
								</li>
								<li>
									<div id="icon">
										<ul
											class="reset clearfix thumb_select_ul emergency_categoery_ul">
											<li class="fl"><a href="#">
													<div class="categoery job">
														<div class="thumb">
															<img src="${pageContext.request.contextPath}/resources/images/national-pension-icon.png"
																class="cross_circle" height="48" width="48" alt="" />
														</div>
													</div> <label class="label">National Pension Scheme</label>
											</a></li>
										</ul>
									</div>
									<!-- end of "icon" -->
									<div class="value-spinner">
										<input id="spinner5" name="value" value="0" class="spinner">
									</div>
									<div class="value-spinner">
										<input id="spinner6" name="value" value="0" class="spinner">
									</div>
								</li>
								<li>
									<div id="icon">
										<ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
											<li class="fl"><a href="#"><div class="categoery job">
												<div class="thumb">
													<img src="${pageContext.request.contextPath}/resources/images/retirement-pl-other-icon.png"
														class="cross_circle" height="48" width="48" alt="" />
												</div>
											</div>
											<label class="label">Other</label></a></li>
										</ul>
									</div>
									<!-- end of "icon" -->
									<div class="value-spinner">
										<input id="spinner7" name="value" value="0" class="spinner">
									</div>
									<div class="value-spinner">
										<input id="spinner8" name="value" value="0" class="spinner">
									</div>
								</li>
							</ul>
						</div>
						<!-- End of "right-side" -->
					</div>
					<!-- End of "asset-selection" -->
					<div id="bottom">
						<div class="total-asset-value">
							<span>Total Assets Value</span>
							<div class="total-value">230</div>
							<span class="unit dynamic">lacs</span>
						</div>
						<!-- End of "total-asset-value" -->

						<div class="total-asset-value">
							<span>Total Monthly Investment</span>
							<div class="total-value">230</div>
							<span class="unit dynamic">lacs</span>
						</div>
						<!-- End of "total-asset-value" -->
					</div>
					<!-- End of "Bottom" -->
				</ul>
			</section>
			<!-- Common_in_contnet ends -->
			<!-- Common footer starts -->
			<section class="common_footer_actions">
				<div id="main_actions" class="clearfix">
					<ul class="reset clearfix fr btn_grup3">
						<li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
						<li class="fl list"><a href="#" class="anch cancel"><span class="txt">Cancel</span></a></li>
						<li class="fl list"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>
					</ul>
					<ul class="reset clearfix fr btn_grup2">
						<li class="fl list"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></li>
						<li class="fl list"><a href="#" class="anch add_doc"><span class="txt">Documents</span></a></li>
					</ul>
					<ul class="reset clearfix fl btn_grup1">
						<li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
						<li class="fl list"><a href="#" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
						<li class="fl list"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
					</ul>
				</div>
				<a href="${pageContext.request.contextPath}/partner/datacollection/risk-cover/${partyId}" class="back navgation"><span class="txt">Back</span></a>
				<a href="${pageContext.request.contextPath}/partner/datacollection/succession-readiness/${partyId}" class="next navgation"><span class="txt">Next</span></a>
			</section>

			<!-- Common footer ends -->
			<div class="overlay"></div>
		</section>
		<!-- Common_content Ends-->
	</section>
	<!-- Main ends-->
</div>
<!-- Wrapper ends-->

<script src="${pageContext.request.contextPath}/resources/js/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_unit_selector.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>

<!-- "Value-Spinner" Script Start -->
<script>
$(".save").click(function() {	
	var inputData = "<Root>";	
	$("#frmCashFlow").find(".answer").each(function (index) {		
		if($(this).val() != ""){
			var idName = $( this ).attr("name").split("_");
			inputData = inputData + "<Question>";
			inputData = inputData + "<QuestionId>" + idName[0] + "</QuestionId>";
			inputData = inputData + "<QuestionOptionId></QuestionOptionId>";
			inputData = inputData + "<AttributeCodeID>" + idName[1] + "</AttributeCodeID>";
			inputData = inputData + "<OptionValue>" + $( this ).val() + "</OptionValue>";
			inputData = inputData + "</Question>";
		}
	});
	
	inputData = inputData + "</Root>";
	
	$("#inputData").val(inputData);
	$("#frmCashFlow").submit();
});


  $(function() {
   $( "#spinner" ).spinner({ min: 0,max: 100});
   $( "#spinner1" ).spinner({ min: 0,max: 100});
   $( "#spinner2" ).spinner({ min: 0,max: 100});
   $( "#spinner3" ).spinner({ min: 0,max: 100});
   $( "#spinner4" ).spinner({ min: 0,max: 100});
   $( "#spinner5" ).spinner({ min: 0,max: 100});
   $( "#spinner6" ).spinner({ min: 0,max: 100});
   $( "#spinner7" ).spinner({ min: 0,max: 100});
   $( "#spinner8" ).spinner({ min: 0,max: 100});
 //   spinner.spinner( "disable" ); 	
  });

$(document).ready(function(){
	 
	$('.wrapper').attr('id', 'retirement-planning');
	 
	 //reparedness to lead a comfortable life value Slider
    createSlider('#emergency_confidence',1,5,1,"#emer_conf")
	//Custom Scrollbar
	$('.common_in_content').slimScroll();
  	
	$(".white_checkbox").click(function(){
    	$(this).toggleClass("red_custom_checkbox_checked");	
	 	
    	if ($(this).next( ".default_checkbox" ).is(":checked")) {		
       		$(this).next( ".default_checkbox" ).prop("checked", false);
    	} else {
       		$(this).next( ".default_checkbox" ).prop("checked", true);	
    	}	
  	});
 
	 $('#emergency_readiness .count').bind("DOMSubtreeModified",function(){ 
	});
	
	 $('.toggle').toggles();

	 $("#emergency_faced").on('toggle', function (e, active) {
    	if (active) {
		  $(".emergency_faced").prop("checked", true);
	    } else {
	   		$(".emergency_faced").prop("checked", false);
    	}
	});

	 $("#borrow_sell").on('toggle', function (e, active) {    	
		 if (active) {
		 	$(".borrow_sell ").prop("checked", true);
	    } else {
	   		$(".borrow_sell ").prop("checked", false);
    	}
	});

	
 	$(".thumb_select_ul a").click(function(){
    	$(this).children(".categoery").toggleClass("not_applicable");
	//	$(this).find(".cross_circle").toggle();
  	});

 	$("#emergency_faced .toggle-slide").click(function(){
    	$(".thumb_select_ul").fadeToggle("slow");
  	});

    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
 
    var inputData = {'attributeCodeIds' : ['94043', '94044', '94045', '94046', '94047', '94048']};
 	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/partner/datacollection/get-inputdata?partyId=" + $("#partyId").val() + "&buId=153",
		data : inputData,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			$.each(msg, function(index, item) {	
				if(item.attributeCodeId == 94065 || item.attributeCodeId == 94066 || item.attributeCodeId == 94073 || item.attributeCodeId == 94079 || item.attributeCodeId == 94080){
					$('#' + item.attributeCodeId).slider( "option", "value", item.attributeValue);
					$('#' + item.attributeCodeId + "_input").val(item.attributeValue);
				} 
			});		    
		},
		error : function(msg) {
			$('.result').html(msg.d);
		}
	});
 	
});
</script>