<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" /> --%>

<div id="emergency_readiness"> 
  <!-- Main starts-->
  <section class="main"> 
	<section class="content common_content"> 
	<jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
  <!-- Advice Assumptions Submenu Starts -->
    <div class="common_ad_ass_selector selector_noline">
      <ul class="clearfix reset">
        <li>
          <p>Advice Assumptions</p>
        </li>
      </ul>
      <div class="Advice_Assump_Menu">
  		<ul class="clearfix reset Advice_Assump_Menu_In" >
              <li class="clearfix">
              <label class="form_label">Estimated Life Expectancy</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">70</span><span class="high extrem">100</span></div>
                  <div id="advice_eme_assump"></div>
                  <div class="counter_parent">
                    <input type="text" id="advice_eme_assump_payment" class="range_counter" />
                    <span class="unit">yrs</span> </div>
                </div>
              </div>
            </li>
            <li class="clearfix">
              <label class="form_label">Emergency Funds Required -  XX times monthly expense</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">3</span><span class="high extrem">36</span></div>
                  <div id="advice_eme_assump_funds"></div>
                  <div class="counter_parent">
                    <input type="text" id="advice_eme_assump_funds_payment" class="range_counter" />
                    <span class="unit">months</span> </div>
                </div>
              </div>
            </li>
            <li class="clearfix"> <a class="cancel">CANCEL</a><a class="save">SAVE</a></li>
        </ul>
       </div>
    </div>
    <div class="clr"></div>
    <!-- Advice Assumptions Submenu Ends -->
      <!-- Common_in_contnet starts-->
      <form class="form-horizontal" id="frmEmergencyReadiness" name="frmEmergencyReadiness" action="<c:url value="/partner/datacollection/save" />" method="POST">
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="/partner/datacollection/emergency-readiness/" />
      <section class="in_content common_in_content clearfix">
        <ul class="reset clearfix" id="emergency_readiness_ul">
          <li id="confidence_scale" class="clearfix">
            <div class="ques_txt">
              <p>How would you rate your confidence on being able to handle an emergency - like a health set back or sudden loss of income?</p>
            </div>
            <div class="ques_action clearfix">
              <div class="range_parent emer_confidence">
                <div class="fl scale clearfix">
                  <div class="scale_range"> <span class="low extrem">1</span> <span class="high extrem">5</span>
                    <div class="mark"><br /></div>
                    <div id="div_94001"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="94001" name="94001" value="" class="range_counter answer">                    
                  </div>
                </div>
              </div>
              <div class="clr"></div>
            </div>
          </li>
          <li id="emergency_details" class="clearfix">
            <div class="ques_txt" >
              <p>Have you faced any emergency situation in the past?</p>
            </div>
            <div class="ques_action clearfix">
              <div id="emergency_situation">
                <div class="toggle" id="emergency_faced"></div>
                <input type="checkbox" id="94002" name="94002" value="" class="emergency_faced orignal_checkbox answer"/>                
              </div>
              <ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
                <li class="fl"><a href="#">
                  <div id="div_94003" class="categoery job">
                  	<input type="hidden" name="94137" value="" id="94003" class="answer"/>
                    <div class="thumb"></div>
                  </div>
                  <label class="label">Loss of Job</label>
                  </a></li>
                <li class="fl"><a href="#">
                  <div id="div_94004" class="categoery accident">
                  	<input type="hidden" name="94137" value="" id="94004" class="answer"/>
                    <div class="thumb"></div>
                  </div>
                  <label class="label">Accident</label>
                  </a></li>
                <li class="fl"><a href="#">
                  <div id="div_94005" class="categoery health_issues">
                  	<input type="hidden" name="94137" value="" id="94005" class="answer"/>
                    <div class="thumb"></div>
                  </div>
                  <label class="label">Health Issues</label>
                  </a></li>
                <li class="fl"><a href="#">
                  <div id="div_94006" class="categoery natural_clamity">
                  	<input type="hidden" name="94137" value="" id="94006" class="answer"/>
                    <div class="thumb"></div>
                  </div>
                  <label class="label">Natural Calamity</label>
                  </a></li>
                <li class="fl"><a href="#">
                  <div id="div_94007" class="categoery other">
                  	<input type="hidden" name="94137" value="" id="94007" class="answer"/>
                    <div class="thumb"></div>
                  </div>
                  <label class="label">Other</label>
                  </a></li>
              </ul>
            </div>
          </li>
          <li id="borrow_sell_li" class="clearfix">
            <div class="ques_txt">
              <p>Were you able to manage this emergency without having to borrow or sell your assets?</p>
            </div>
            <div class="ques_action">
              <div class="toggle" id="borrow_sell"></div>
              <input type="checkbox" id="94008" name="94008" value="" class="borrow_sell orignal_checkbox answer"/>
            </div>
            <div class="clr"></div>
          </li>
          <li id="without_income" class="clearfix">
            <div class="ques_txt">
              <p>How many months do you think you will be able to manage without an income?</p>
            </div>         
            
            <div class="ques_action">
              <div class="range_parent without_income_slider">
                <div class="fl scale clearfix">
                  <div class="scale_range"> <span class="low extrem">0</span> <span class="high extrem">12</span>
                    <div class="mark"><br /></div>
                    <div id="div_94009"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="94009" name="94009" value="" class="range_counter answer">
                    <span class="unit">months</span> </div>
                </div>
              </div>
              <div class="clr"></div>
            </div>
          </li>
        </ul>
        <input type="hidden" name="questionBankId" id="questionBankId" value="1"  />
        <input type="hidden" name="sectionTypeId" id="sectionTypeId" value="39001" />
        <input type="hidden" name="inputData" id="inputData" value="" />
      </section>
      	<!-- Common_in_contnet ends --> 
      	<!-- Common footer starts -->
			<section class="common_footer_actions">
				<div id="main_actions" class="clearfix">
					<ul class="reset clearfix fr btn_grup3">
						<li class="fl list"><a href="#" class="anch save" ><span class="txt">Save</span></a></li>
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
						<li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/emergency-readiness-action-plan/${partyId}"" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
					</ul>
				</div>
				<a href="${pageContext.request.contextPath}/partner/datacollection/${partyId}" class="back navgation"><span class="txt">Back</span></a>
				<a href="${pageContext.request.contextPath}/partner/datacollection/risk-cover/${partyId}" class="next navgation" ><span class="txt">Next</span></a>
			</section>
		</form>
      	<!-- Common footer ends -->
		<div class="overlay"></div>
    	</section>
	</section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<%-- <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script> --%>

<script>
 //assumption pop
createSlider('#advice_eme_assump',70,100,1,"#advice_eme_assump_payment")
createSlider('#advice_eme_assump_funds',3,36,1,"#advice_eme_assump_funds_payment")
 //assumption pop End
createSlider("#div_94001", 1, 5, 1, "#94001");
createSlider("#div_94009", 0, 12, 1, "#94009");

var questionOptionMap = '{"94001":[{"id":"94130","val":"1"},{"id":"94131","val":"2"},{"id":"94132","val":"3"},{"id":"94133","val":"4"},{"id":"94134","val":"5"}],"94002":[{"id":"94135","val":"1"},{"id":"94136","val":"0"}],"94008":[{"id":"94135","val":"1"},{"id":"94136","val":"0"}],"94009":[{"id":"94138","val":"1"},{"id":"94138","val":"2"},{"id":"94138","val":"3"},{"id":"94139","val":"4"},{"id":"94139","val":"5"},{"id":"94139","val":"6"},{"id":"94140","val":"7"},{"id":"94140","val":"8"},{"id":"94140","val":"9"},{"id":"94141","val":"10"},{"id":"94141","val":"11"},{"id":"94142","val":"12"}],"94137":[{"id":"94003","val":"94003"},{"id":"94004","val":"94004"},{"id":"94005","val":"94005"},{"id":"94006","val":"94006"},{"id":"94007","val":"94007"}]}';
var parsedQuestionOptionMap = jQuery.parseJSON(questionOptionMap);

$(".save").click(function() {

	var inputData = "<Root>";
	$("#frmEmergencyReadiness").find(".answer").each(function (index) {		
		if($(this).val() != ""){
			var questAttId = $( this ).attr("name");
			var optAttId = $( this ).attr("id");
			var optAttCodeId = getAttributeCode(optAttId, $(this).val());
			
			inputData = inputData + "<Question>";
			inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
			inputData = inputData + "<QuestionOptionId>" + optAttCodeId +"</QuestionOptionId>";
			inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>"; // clear no change require
			inputData = inputData + "<Value>" + $(this).val() + "</Value>";
			inputData = inputData + "<Value></Value>";
			inputData = inputData + "</Question>";
		}
	});	
	
	inputData = inputData + "</Root>";
	
	$("#inputData").val(inputData);
	
	$("#frmEmergencyReadiness").submit();
});

$(document).ready(function(){
	
    $('.wrapper').attr('id', 'emergency_readiness');
	$('.toggle').toggles();
	
 	$("#emergency_faced").on('toggle', function (e, active) {
 	    if (active) {
 		 	$('#94002').val('1');
 		 	$(".thumb_select_ul, #borrow_sell_li").fadeIn("slow");
 	    } else {
 		  	$('#94002').val('0');
 		  	$(".thumb_select_ul, #borrow_sell_li").fadeOut("slow");
 		  	$(".thumb_select_ul .categoery").find(".answer").val("");
 		  	$(".thumb_select_ul .categoery").removeClass("not_applicable");
 		  	$('#borrow_sell').toggles({on:false});
 			$("#94008").val('0');
 	    }
 	});
 	
 	$("#borrow_sell").on('toggle', function (e, active) {
 	    if (active) {
 		  	$("#94008").val('1');
 	    } else { 	    
 		   	$("#94008").val('0');
 	    }
 	});
 	
 	$(".thumb_select_ul a").click(function(){
 	   $(this).children(".categoery").toggleClass("not_applicable");
 	   if($(this).children(".categoery").find(".answer").val() == ""){
 		  $(this).children(".categoery").find(".answer").val($(this).children(".categoery").find(".answer").attr("id")); 		   
 	   } else {
 		  $(this).children(".categoery").find(".answer").val("");
 	   }
 	});
 	 	
 	var inputData = {'attributeCodeIds' : ['94001', '94002', '94003', '94004', '94005', '94006', '94007', '94008', '94009']};
 	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/partner/datacollection/get-inputdata?partyId=" + $("#partyId").val() + "&buId=153",
		data : inputData,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			$.each(msg, function(index, item) {	

				if(item.attributeCodeId == 94001 | item.attributeCodeId == 94009){
				 	$('#div_' + item.attributeCodeId).slider( "option", "value", item.attributeReferenceValue);
					$('#' + item.attributeCodeId).val(item.attributeReferenceValue);
					
				} else if(item.attributeCodeId == 94002){
					$('#94002').val(item.attributeReferenceValue);
					if(item.attributeReferenceValue == "1"){
						$('#emergency_faced').toggles({on:true});
						$(".thumb_select_ul, #borrow_sell_li").fadeIn("slow");
					} else {
						$('#emergency_faced').toggles({on:false});
						$(".thumb_select_ul, #borrow_sell_li").fadeOut("slow");
					}
				 
				} else if(item.attributeCodeId == 94003 || item.attributeCodeId == 94004 || item.attributeCodeId == 94005 || item.attributeCodeId == 94006 || item.attributeCodeId == 94007){
					$('#div_' + item.attributeCodeId ).toggleClass("not_applicable"); 
					$('#' + item.attributeReferenceValue).val(item.attributeReferenceValue);
				
				} else if(item.attributeCodeId == 94008){
					$('#94008').val(item.attributeReferenceValue);
					if(item.attributeReferenceValue == "1"){
						$('#borrow_sell').toggles({on:true});
					} else {
						$('#borrow_sell').toggles({on:false});
					}
				}				
			});		    
		},
		error : function(msg) {
			$('.result').html(msg.d);
		}
	});
});

</script> 
</body>
