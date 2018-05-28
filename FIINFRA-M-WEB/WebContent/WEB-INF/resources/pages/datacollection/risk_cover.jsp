<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/selectboxlt.css" /> --%>
<div id="risk_cover"> 
<!-- Common_content Starts-->
<section class="content common_content">
	<!-- Common_in_contnet starts-->
<form class="form-horizontal" id="frmRiskCover" name="frmRiskCover" action="<c:url value="${pageContext.request.contextPath}/partner/datacollection/save" />" method="POST">
    <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
    <input type="hidden" name="redirectUrl" id="redirectUrl" value="${pageContext.request.contextPath}/partner/datacollection/risk-cover/" />
     
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
	<jsp:include page="../layout/dc_submenu.jsp"></jsp:include> 
		<!-- Common_in_contnet starts-->
		<section class="in_content common_in_content clearfix">
			<ul class="reset clearfix" id="emergency_readiness_ul">
				<li id="confidence_scale" class="clearfix">
					<div class="ques_txt4">
						<p>In the event of death or disability of the key earning member in your household, how sure are you that your family will be safe & comfortable?</p>
					</div>
					<div class="range_parent emer_confidence">
						<div class="fl scale clearfix margin-left">
							<div class="scale_range">
								<span class="low extrem">1</span> <span class="high extrem">5</span>
								<div class="mark">
									<br />
									<div id="94012"></div>
								</div>
							</div>
							<div class="counter_parent">
								<input type="text" id="94012_input" name="152_94012" value="" class="range_counter answer">								
							</div>
						</div>
						<div class="clr"></div>
					</div>
				</li>
				<li id="emergency_details" class="clearfix">
					<div class="ques_txt2"><p>Do you have a life insurance?</p></div>
					<div class="ques_action2 clearfix">
						<div id="emergency_situation">
							<div class="toggle borrow_sell_div" id="div_94013"></div>
							<input type="checkbox" name="153_94013" id="94013" value="" class="emergency_faced orignal_checkbox answer" />							
						</div>
						<ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
							<li class="fl"><a href="#">
								<div id="94014" class="categoery job">
									<input type="hidden" name="153_94014" value="" id="94014" class="answer"/>
									<div class="thumb"></div>
								</div> 
								<label class="label">Term</label>
								</a></li>
							<li class="fl"><a href="#">
								<div id="94015" class="categoery accident">
									<input type="hidden" name="153_94015" value="" id="94015" class="answer"/>
									<div class="thumb"></div>
								</div> 
								<label class="label">Endowment</label></a>
							</li>
							<li class="fl"><a href="#">
								<div id="94016" class="categoery health_issues">
									<input type="hidden" name="153_94016" value="" id="94016" class="answer"/>
									<div class="thumb"></div>
								</div> 
								<label class="label">Unit Linked</label></a>
							</li>
							<li class="fl"><a href="#">
								<div id="94017" class="categoery natural_clamity">
									<input type="hidden" name="153_94017" value="" id="94017" class="answer"/>
									<div class="thumb"></div>
								</div> 
								<label class="label">Money Back</label></a>
							</li>
						</ul>
					</div>
				</li>
				<li id="borrow_sell_li" class="clearfix">
					<div class="ques_txt2"><p>Do you have health insurance?</p></div>
					<div class="ques_action2">
						<div class="toggle" id="div_94020"></div>
						<input type="checkbox" name="155_94020" value="" id="94020" class="borrow_sell orignal_checkbox answer" />						
					</div>
					<div class="clr"></div>
				</li>
				<div id="bg-box">
					<li id="without_income" class="clearfix">
						<div class="ques_txt"><p>How much cover do you have?</p></div>
						<div class="ques_action">
							<div class="range_parent without_income_slider">
								<div class="range_parent">
									<div class="scale clearfix">
										<div class="scale_range"><span class="low extrem">1</span><span class="high extrem">100</span></div>
										<div id="94018" class="loan_amount"></div>
										<div class="counter_parent rupee">
											<input type="text" id="94018_input" name="154_94018" class="range_counter" /> 
											<span class="unit dynamic">lacs</span>
										</div>
									</div>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</li>
					<div class="ques_txt">
						<span>Who all in the family are covered under this health insurance? Please name them</span>
					</div>
					<select id="health_insurance">
						<option>Self</option>
						<option>Test</option>
						<option>Test</option>
						<option>Test</option>
					</select>
					<div id="ad_mor">
						<input class="add_more" type="submit" value="Add More">
					</div>
				</div>
				<!-- End of "bg-box" -->
				<div class="clr"></div>
				<div id="risk-cover-bottom-left">
					<li id="borrow_sell_li" class="clearfix">
						<div class="ques_txt3"><p>Are you covered for a possible critical illness?</p></div>
						<div class="ques_action3">
							<div class="toggle illness_cover borrow_sell_div" id="div_94023"></div>
							<input type="checkbox" name="158_94023" id="94023" value="" class="borrow_sell orignal_checkbox answer" />
						</div>
						<div class="clr"></div>
					</li>
					<li id="borrow_sell_li" class="clearfix">
						<div class="ques_txt3"><p>Are you covered for a possible accident?</p></div>
						<div class="ques_action3">
							<div class="toggle accident_cover borrow_sell_div" id="div_94023"></div>
							<input type="checkbox" name="160_94023" id="94025" value="" class="borrow_sell orignal_checkbox answer" />
						</div>
						<div class="clr"></div>
					</li>
					<li id="borrow_sell_li" class="clearfix">
						<div class="ques_txt3"><p>Are your assets like house and contents covered?</p></div>
						<div class="ques_action3">
							<div class="toggle asset_cover borrow_sell_div" id="div_94027"></div>
							<input type="checkbox" name="162_94027" id="94027" value="" class="borrow_sell orignal_checkbox answer" />
						</div>
						<div class="clr"></div>
					</li>
				</div>
				<!-- End of "risk-cover-bottom-left" -->
				<div id="risk-cover-bottom-right">
					<ul class="clearfix reset">
						<li id="without_income" class="clearfix illness_cover_slider">
							<div class="illness">
								<div class="ques_txt2"><p>How much cover do you have?</p></div>
								<div class="ques_action2">
									<div class="range_parent without_income_slider">
										<div class="range_parent">
											<div class="scale clearfix">
												<div class="scale_range">
													<span class="low extrem">1</span><span class="high extrem">100</span>
												</div>
												<div id="94024" class="loan_amount2"></div>
												<div class="counter_parent rupee">
													<input type="text" id="94024_input" name="159_94024" value="" class="range_counter answer" />												
													<span class="unit dynamic">lacs</span>
												</div>
											</div>
										</div>
									</div>
									<div class="clr"></div>
								</div>
							</div>
						</li>
						<li id="without_income" class="clearfix margin accident_cover_slider">
							<div class="accident1">
								<div class="ques_txt2"><p>How much cover do you have?</p></div>
								<div class="ques_action2">
									<div class="range_parent without_income_slider">
										<div class="range_parent">
											<div class="scale clearfix">
												<div class="scale_range">
													<span class="low extrem">1</span><span class="high extrem">100</span>
												</div>
												<div id="94026" class="loan_amount3"></div>
												<div class="counter_parent rupee">
													<input type="text" id="94026_input" name="161_94026" value="" class="range_counter answer" />
													<span class="unit dynamic">lacs</span>
												</div>
											</div>
										</div>
									</div>
									<div class="clr"></div>
								</div>
							</div>
						</li>
						<li id="without_income" class="clearfix margin asset_cover_slider">
							<div class="asset">
								<div class="ques_txt2"><p>How much cover do you have?</p></div>

								<div class="ques_action2">
									<div class="range_parent without_income_slider">
										<div class="range_parent">
											<div class="scale clearfix">
												<div class="scale_range">
													<span class="low extrem">1</span><span class="high extrem">100</span>
												</div>
												<div id="94028" class="loan_amount4"></div>
												<div class="counter_parent rupee">
													<input type="text" id="94028_input" name="163_94028" value="" class="range_counter answer" />
													<span class="unit dynamic">lacs</span>
												</div>
											</div>
										</div>
									</div>
									<div class="clr"></div>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!-- End of "risk-cover-bottom-right" -->
			</ul>
			
			<input type="hidden" name="questionBankId" id="questionBankId" value="1"  />
        	<input type="hidden" name="sectionTypeId" id="sectionTypeId" value="39003" />
        	<input type="hidden" name="inputData" id="inputData" value="" />
        
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
					<li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/risk-cover-action-plan/${partyId}" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
				</ul>
			</div>
			<a href="${pageContext.request.contextPath}/partner/datacollection/emergency-readiness/${partyId}" class="back navgation"><span class="txt">Back</span></a>
			<a href="${pageContext.request.contextPath}/partner/datacollection/retirement-planning/${partyId}" class="next navgation"><span class="txt">Next</span></a>
		</section>

		<!-- Common footer ends -->
		<div class="overlay"></div>
	</section>
	<!-- Common_content Ends-->
</form>
</section>
<!-- Main ends-->
</div>
<%-- <script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common_unit_selector.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/selectboxit.js"></script> --%>
<script>
$(".save").click(function() {	
	var inputData = "<Root>";	
	$("#frmRiskCover").find(".answer").each(function (index) {		
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
	console.log(inputData);
	//alert(inputData);
// 	$("#frmRiskCover").submit();
});

$(document).ready(function(){
	
	 $('.wrapper').attr('id', 'risk_cover');
	
	
	$('.toggle').toggles();

	$(".thumb_select_ul a").click(function(){
    	$(this).children(".categoery").toggleClass("not_applicable");
    	if($(this).children(".categoery").find(".answer").val() == ""){
   		  $(this).children(".categoery").find(".answer").val($(this).children(".categoery").find(".answer").attr("id")); 		   
   	   } else {
   		  $(this).children(".categoery").find(".answer").val("");
   	   }
  	});


	$("#div_94013 .toggle-slide").click(function(){
	    $(".thumb_select_ul").fadeToggle("slow");
	});

// Calls the selectBoxIt method on your HTML select box
	$("select").selectBoxIt();
	//safe & comfortable family value Slider
	
	createSlider('#94012', 1, 5, 1, "#94012_input");
	//cover value Slider
	createSlider('#94018', 1, 100, 1, "#94018_input");
	//cover value Slider
	createSlider('#94024', 1, 100, 1, "#94024_input");
	//cover value Slider
	createSlider('#94026', 1, 100, 1, "#94026_input");
	//cover value Slider
	createSlider('#94028', 1, 100, 1, "#94028_input");

	$('.common_in_content').slimScroll();
	
	$(".toggle").on('toggle', function (e, active) {
    	if (active) {
	  		$(this).parent().children(".answer").prop("checked", true);
	  		$($(this).parent().children(".answer")).val('14');
	    } else {
	    	$(this).parent().children(".answer").prop("checked", false);
	    	$($(this).parent().children(".answer")).val('82');
    	}
	});
	
	/* Health Insurance Toggle section*/
	$("#div_94020").on('toggle', function (e, active) {
	    if (active) {
		  $(".borrow_sell ").prop("checked", true);
	    } else {
		   $(".borrow_sell ").prop("checked", false);
	    }
	});
	/*$(".ques_action2 #div_94020").click(function() {
		$("#borrow_sell_li + #bg-box").fadeToggle("slow");
	});
	$(".toggle.illness_cover").click(function() {
		$(".illness").fadeToggle("slow");
	});

	$(".toggle.accident_cover").click(function() {
		$(".accident1").fadeToggle("slow");
	});

	$(".toggle.asset_cover").click(function() {
		$(".asset").fadeToggle("slow");
	});*/
	$(".ques_action2 #div_94020").on('toggle', function (e, active) {
	    if (active) {
		 $("#borrow_sell_li + #bg-box").fadeIn("slow");
	    } else {
		 $("#borrow_sell_li + #bg-box").fadeOut("slow");
	    }
	});
	$(".toggle.illness_cover").on('toggle', function (e, active) {
	    if (active) {
		 $(".illness").fadeIn("slow");
	    } else {
		 $(".illness").fadeOut("slow");
	    }
	});
	$(".toggle.accident_cover").on('toggle', function (e, active) {
	    if (active) {
		 $(".accident1").fadeIn("slow");
	    } else {
		 $(".accident1").fadeOut("slow");
	    }
	});
	$(".toggle.asset_cover").on('toggle', function (e, active) {
	    if (active) {
		 $(".asset").fadeIn("slow");
	    } else {
		 $(".asset").fadeOut("slow");
	    }
	});
	
	var inputData = {'attributeCodeIds' : ['94012', '94013', '94014', '94015', '94016', '94017', '94018', '94019', '94020', 
	                                       '94021', '94022', '94023', '94024', '94025', '94026', '94027', '94028' ]};
 	
	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/partner/datacollection/get-inputdata?partyId=" + $("#partyId").val() + "&buId=153",
		data : inputData,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			$.each(msg, function(index, item) {	
				if(item.attributeCodeId == 94051 || item.attributeCodeId == 94052 || item.attributeCodeId == 94053 || item.attributeCodeId == 94054 || item.attributeCodeId == 94055){
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
