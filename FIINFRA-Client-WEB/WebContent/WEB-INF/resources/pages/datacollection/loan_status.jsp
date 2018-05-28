<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" />
<!-- Wrapper starts-->
<div id="emergency_readiness"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Common_content Starts-->
    <section class="content common_content">
     
      <section class="common_unit_selector">
        <ul class="clearfix reset">
          <li class="k"><span class="unit">K</span></li>
          <li class="lacs unit_selected"><span class="unit">Lacs</span></li>
          <li class="cr"><span class="unit">Cr</span></li>
        </ul>
        <p>All figures are in :</p>
      </section>
      <div class="clr"></div>
      <!-- Common_in_contnet starts-->
      <form class="form-horizontal" id="frmLoanStatus" name="frmLoanStatus" action="<c:url value="/partner/datacollection/save" />" method="POST">
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="/partner/datacollection/loan-status/" />
      <section class="dc_in_content common_in_content clearfix">
        <ul class="common_in_content clearfix" id="emergency_readiness_ul">
          <li class="Loan_Status clearfix">
            <div id="succession_readiness_box" class="ques_txt">
              <p>How would you rate the amount of control you have on your expenses?</p>
            </div>
            <div class="succession_ques_action clearfix">
              <div id="succession_readiness">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="scale_range"><span class="low extrem">Low</span><span class="middle extrem">Medium</span><span class="high extrem">High</span> </div>
                    <div id="div_94083"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="94083" name="94083" class="range_counter answer">
                  </div>
                </div>
              </div>
            </div>
            <div class="clr"></div>
          </li>
          <li class="Loan_Status clearfix">
            <label class="form_label">What kind of loans do you have ?</label>
            <div class="box_right">
              <ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
                <li class="fl"><a href="#">
                  <div id="div_94084" class="categoery">
                  	<input type="hidden" name="94084" value="" id="94163" class="answer"/>
                    <div class="thumb home_loan"></div>
                  </div>
                  <label class="label">Home Loan</label>
                  </a></li>
                <li class="fl"><a href="#">
                  <div id="div_94085" class="categoery">
                  	<input type="hidden" name="94085" value="" id="94163" class="answer"/>
                    <div class="thumb car_loan"></div>
                  </div>
                  <label class="label">Car Loan</label>
                  </a></li>
                <li class="fl"><a href="#">
                  <div id="div_94086" class="categoery">
                  	<input type="hidden" name="94086" value="" id="94163" class="answer"/>
                    <div class="thumb personal_loan"></div>
                  </div>
                  <label class="label">Personal Loan</label>
                  </a></li>
                <li class="fl"><a href="#">
                  <div id="div_94087" class="categoery">
                  	<input type="hidden" name="94087" value="" id="94163" class="answer"/>
                    <div class="thumb business_loan"></div>
                  </div>
                  <label class="label">Business Loan</label>
                  </a></li>
                <li class="fl"><a href="#">
                  <div id="div_94088" class="categoery">
                  	<input type="hidden" name="94088" value="" id="94163" class="answer"/>
                    <div class="thumb credit_card_loan"></div>
                  </div>
                  <label class="label">Credit Card Loan</label>
                  </a></li>
                <li class="fl"><a href="#">
                  <div id="div_94089" class="categoery">
                  	<input type="hidden" name="94089" value="" id="94163" class="answer"/>
                    <div class="thumb private_borrowing_loan"></div>
                  </div>
                  <label class="label">Private Borrowing Loan</label>
                  </a></li>
                <li class="fl"><a href="#">
                  <div id="div_94090" class="categoery">
                  	<input type="hidden" name="94090" value="" id="94163" class="answer"/>
                    <div class="thumb other_loan"></div>
                  </div>
                  <label class="label">Other Loan</label>
                  </a></li>
              </ul>
            </div>
          </li>
          
          <li class="Loan_Status clearfix">
            <label class="form_label">How much is the total outstanding loan amount ?</label>
            <div id="succession_readiness2" class="box_right2">
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">100</span></div>
                  <div id="div_94091"></div>
                  <div class="counter_parent rupee">
                    <input type="text" id="94091" name="94091" class="range_counter answer"/>
                    <span class="unit dynamic">lacs</span> </div>
                </div>
              </div>
            </div>
          </li>
          <li class="Loan_Status clearfix">
            <div class="box_left">
              <label class="form_label">Do you plan to take any loan in future?</label>
            </div>
            <div class="box_right4">
              <div class="toggle" id="borrow_sell"></div>
              <div class="divshow clearfix">
                <div class="box_right3 clearfix" >
                  <ul class="reset clearfix thumb_select_ul emergency_categoery_ul">
                    <li class="fl"><a href="#">                  		
                      	<div id="div_94093" class="categoery">
                      	<input type="hidden" name="94093" value="" id="94164" class="answer"/>
                        <div class="thumb home_loan"></div>
                      </div>
                      <label class="label">Home Loan</label>
                      </a></li>
                    <li class="fl"><a href="#">
                      <div id="div_94094" class="categoery">
                      	<input type="hidden" name="94094" value="" id="94164" class="answer"/>
                        <div class="thumb car_loan"></div>
                      </div>
                      <label class="label">Car Loan</label>
                      </a></li>
                    <li class="fl"><a href="#">
                      <div id="div_94095" class="categoery">
                        <input type="hidden" name="94095" value="" id="94164" class="answer"/>
                        <div class="thumb personal_loan"></div>
                      </div>
                      <label class="label">Personal Loan</label>
                      </a></li>
                    <li class="fl"><a href="#">
                      <div id="div_94096" class="categoery">
                      	<input type="hidden" name="94096" value="" id="94164" class="answer"/>
                        <div class="thumb business_loan"></div>
                      </div>
                      <label class="label">Business Loan</label>
                      </a></li>
                    <li class="fl"><a href="#">
                      <div id="div_94097" class="categoery">
                      	<input type="hidden" name="94097" value="" id="94164" class="answer"/>
                        <div class="thumb credit_card_loan"></div>
                      </div>
                      <label class="label">Credit Card Loan</label>
                      </a></li>
                    <li class="fl"><a href="#">
                      <div id="div_94098" class="categoery">
                        <input type="hidden" name="94098" value="" id="94164" class="answer"/>
                        <div class="thumb private_borrowing_loan"></div>
                      </div>
                      <label class="label">Private Borrowing Loan</label>
                      </a></li>
                    <li class="fl"><a href="#">
                      <div id="div_94099" class="categoery">
                      	<input type="hidden" name="94099" value="" id="94164" class="answer"/>
                        <div class="thumb other_loan"></div>
                      </div>
                      <label class="label">Other Loan</label>
                      </a></li>
                  </ul>
                </div>
                <div class="divshow_in clearfix">
                  <label class="loan_label">Future loan amount?</label>
                  <div class="Loan_Status_Slider clearfix">
                    <div class="range_parent">
                      <div class="scale clearfix">
                        <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">100</span></div>
                        <div id="div_94111"></div>
                        <div class="counter_parent rupee">
                          <input type="text" id="94111" name="94111" class="range_counter answer"/>
                          <span class="unit dynamic">lacs</span> </div>
                      </div>
                    </div>
                  </div>
                  <div class="clr"></div>
                </div>
                <div class="divshow_in clearfix">
                  <label class="loan_label">Loan Duration</label>
                  <div class="Loan_Status_Slider clearfix">
                    <div class="range_parent">
                      <div class="scale clearfix">
                        <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">10</span></div>
                        <div id="div_94112"></div>
                        <div class="counter_parent">
                          <input type="text" id="94112" name="94112" class="range_counter answer"/>
                          <span class="unit">yrs</span> </div>
                      </div>
                    </div>
                  </div>
                  <div class="clr"></div>
                </div>
                <div class="divshow_in2 clearfix">
                  <label class="loan_label">Year of Loan Requirement</label>
                  <input type="text" class="common_input2 datepicker answer" placeholder="dd-mmm-yyyy" name="input" disabled>
                  <div class="clr"></div>
                </div>
              </div>
            </div>
          </li>
        </ul>
        <input type="hidden" name="questionBankId" id="questionBankId" value="1"  />
        <input type="hidden" name="sectionTypeId" id="sectionTypeId" value="39008" />
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
            <li class="fl list"><a href="#" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="${pageContext.request.contextPath}/partner/datacollection/cash-flow/${partyId}" class="back navgation"><span class="txt">Back</span></a>
		<a href="${pageContext.request.contextPath}/partner/datacollection/educational-goal/${partyId}" class="next navgation"><span class="txt">Next</span></a>
	</section>
      </form>
      <!-- Common footer ends -->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends-->

<script src="${pageContext.request.contextPath}/resources/js/common_unit_selector.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>

<script>

//expense control value Slider
createSlider('#div_94083',1,5,1,"#94083");
//outstanding loan amount value Slider
createSlider('#div_94091',0,100,1,"#94091");
//Future loan amount value Slider
createSlider('#div_94111',0,100,1,"#94111");
//Loan Duration amount value Slider
createSlider('#div_94112',0,10,1,"#94112");

var questionOptionMap = '{"94083":[{"id":"94130","val":"1"},{"id":"94131","val":"2"},{"id":"94132","val":"3"},{"id":"94133","val":"4"},{"id":"94134","val":"5"}],"94163":[{"id":"94084","val":"94084"},{"id":"94085","val":"94085"},{"id":"94086","val":"94086"},{"id":"94087","val":"94087"},{"id":"94088","val":"94088"},{"id":"94089","val":"94089"},{"id":"94090","val":"94090"}],"94164":[{"id":"94093","val":"94093"},{"id":"94094","val":"94094"},{"id":"94095","val":"94095"},{"id":"94096","val":"94096"},{"id":"94097","val":"94097"},{"id":"94098","val":"94098"},{"id":"94099","val":"94099"}]}';
var parsedQuestionOptionMap = jQuery.parseJSON(questionOptionMap);

$(".save").click(function() {

	var inputData = "<Root>";
	$("#frmLoanStatus").find(".answer").each(function (index) {		
		if($(this).val() != ""){
			var questAttId = $( this ).attr("name");
			var optAttId = $( this ).attr("id");
			var optAttCodeId = getAttributeCode(optAttId, $(this).val());
			
			inputData = inputData + "<Question>";
			inputData = inputData + "<QuestionId>" + questAttId + "</QuestionId>";
			inputData = inputData + "<QuestionOptionId>" + optAttCodeId +"</QuestionOptionId>";
			inputData = inputData + "<AttributeCodeID>" + questAttId + "</AttributeCodeID>";
			inputData = inputData + "<Value>" + $(this).val() + "</Value>";
			inputData = inputData + "<Value></Value>";
			inputData = inputData + "</Question>";
		}
	});	
	
	inputData = inputData + "</Root>";
	
	$("#inputData").val(inputData);
	
	$("#frmLoanStatus").submit();
});

$(document).ready(function(){
    $('.wrapper').attr('id', 'emergency_readiness');
    
    $('.common_in_content').slimScroll();
 
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
 	   if($(this).children(".categoery").find(".answer").val() == ""){
 		  $(this).children(".categoery").find(".answer").val($(this).children(".categoery").find(".answer").attr("id")); 		   
 	   } else {
 		  $(this).children(".categoery").find(".answer").val("");
 	   }
	});
	
	$("#borrow_sell .toggle-slide").click(function(){
    	$(".divshow").fadeToggle("slow");
  	});

	$( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );


	var inputData = {'attributeCodeIds' : ['94083', '94084', '94085', '94086', '94087', '94088', '94089', '94090', '94091', '94092', '94093', '94094', '94095', '94096', '94097', '94098','94199', '94111', '94112']};
 	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/partner/datacollection/get-inputdata?partyId=" + $("#partyId").val() + "&buId=153",
		data : inputData,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			$.each(msg, function(index, item) {	

				if(item.attributeCodeId == 94083 || item.attributeCodeId == 94091 || item.attributeCodeId == 94111 || item.attributeCodeId == 94112 ){
				 	$('#div_' + item.attributeCodeId).slider( "option", "value", item.attributeReferenceValue);
					$('#' + item.attributeCodeId).val(item.attributeReferenceValue);
					
				} else if(item.attributeCodeId == 94163){
					$('#' + item.attributeCodeId).val(item.attributeReferenceValue);
					if(item.attributeReferenceValue == "1"){
						$('#emergency_faced').toggles({on:true});
						$(".thumb_select_ul, #borrow_sell_li").fadeIn("slow");
					} else {
						$('#emergency_faced').toggles({on:false});
						$(".thumb_select_ul, #borrow_sell_li").fadeOut("slow");
					}
				 
				} else if(item.attributeCodeId >= 94084 || item.attributeCodeId <= 94090 || item.attributeCodeId >= 94093 || item.attributeCodeId <= 94099){
					$('#div_' + item.attributeCodeId ).toggleClass("not_applicable"); 
					$('#' + item.attributeReferenceValue).val(item.attributeReferenceValue);
				
				} else if(item.attributeCodeId == 94164){
					$('#' + item.attributeCodeId).val(item.attributeReferenceValue);
					if(item.attributeReferenceValue == "1"){
						$('#div_' + item.attributeCodeId).toggles({on:true});
					} else {
						$('#div_' + item.attributeCodeId).toggles({on:false});
					}	
				}				
			});		    
		},
		error : function(msg) {
			$('.result').html(msg.d);
		}
	});
});


$(function() {
	  $( ".datepicker" ).datepicker({
		  dateFormat: "dd-M-yy",
	      showOn: "button",
		  buttonText: '',
		  changeMonth: true,
	      changeYear: true
     });
});
  
</script> 