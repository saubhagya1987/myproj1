<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/toggles.css" /> --%>

<!-- Wrapper starts-->
<div id="emergency_readiness"> 
  <!-- Main starts-->
  <section class="main"> 
	<!-- Common_content Starts-->
    <section class="content common_content"> 
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include> 
      <!-- Common_in_contnet starts-->
      <form class="form-horizontal" id="frmSuccessionReadiness" name="frmSuccessionReadiness" action="<c:url value="/partner/datacollection/save" />" method="POST">
      <input type="hidden" name="partyId" id="partyId" value="${partyId}" />
      <input type="hidden" name="redirectUrl" id="redirectUrl" value="/partner/datacollection/succession-readiness/" />
       
      <section class="in_content common_in_content clearfix">
        <ul class="reset clearfix" id="emergency_readiness_ul">
          <li id="confidence_scale" class="clearfix">
            <div id="succession_readiness_box2" class="ques_txt">
              <p>How confident are you that, in the event of your death or disability your assets will be accessible AND distributed to your loved ones easily and legally?</p>
            </div>
            <div class="succession_ques_action clearfix">
              <div id="succession_readiness">
              <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="scale_range"><span class="low extrem">Low</span><span class="middle extrem">Medium</span><span class="high extrem">High</span>                      
                    </div>
                    <div id="div_94101"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="94101" name="94101" value="" class="range_counter answer">                          
                  </div>
                </div>
              </div>
              </div>
              <div class="clr"></div>
          </li>
          <li class="clearfix">
            <div id="succession_readiness_box" class="ques_txt"><p> Are all your investment jointly held ? </p></div>
            <div class="ques_action clearfix">
              <div id="emergency_situation">
                <div class="toggle" id="div_94102" ></div>
                <input type="checkbox" name="94102" id="94102" value="" class="emergency_faced orignal_checkbox answer"/>                        
              </div>
            </div>
          </li>
          <li class="clearfix">
            <div id="succession_readiness_box" class="ques_txt"><p> Is your closest family aware of what all assets / investments you have? </p></div>
            <div class="ques_action clearfix">
              <div id="emergency_situation">
                <div class="toggle" id="div_94103"></div>
                <input type="checkbox" name="94103" id="94103" value="" class="emergency_faced orignal_checkbox answer"/>
              </div>
            </div>
          </li>
          <li class="clearfix">
            <div id="succession_readiness_box" class="ques_txt"><p>Have you prepared a will?</p></div>
            <div class="ques_action">
              <div class="toggle" id="div_94104"></div>
              <input type="checkbox" name="94104" id="94104" value="" class="borrow_sell orignal_checkbox answer"/>
            </div>
            <div class="clr"></div>
          </li>
          <li class="clearfix">
            <div class="ques_txt"><p>Have you given a Power of Attorney to someone who can operate your investments if you are not able to?</p></div>
            <div class="ques_action">
              <div class="toggle" id="div_94105"></div>
              <input type="checkbox" name="94105" id="94105" value="" class="borrow_sell orignal_checkbox answer"/>
            </div>
            <div class="clr"></div>
          </li>
        </ul>
        <input type="hidden" name="questionBankId" id="questionBankId" value="1"  />
        <input type="hidden" name="sectionTypeId" id="sectionTypeId" value="39007" />
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
	        <a href="${pageContext.request.contextPath}/partner/datacollection/retirement-planning/${partyId}" class="back navgation"><span class="txt">Back</span></a> 
	        <a href="${pageContext.request.contextPath}/partner/datacollection/financial-readiness/${partyId}" class="next navgation"><span class="txt">Next</span></a>
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
<!-- Emergency Confidence range value calculator starts --> 
<%-- <script src="${pageContext.request.contextPath}/resources/js/plugin/toggles.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script> --%>

<!-- <script src="${pageContext.request.contextPath}/resources/js/jquery_ui_range_slider.js"></script> -->

<!-- custom scroll to "common_in_content" -->
<script>

var questionOptionMap = '{"94101":[{"id":"94130","val":"1"},{"id":"94131","val":"2"},{"id":"94132","val":"3"},{"id":"94133","val":"4"},{"id":"94134","val":"5"}],"94102":[{"id":"94135","val":"1"},{"id":"94136","val":"0"}],"94103":[{"id":"94135","val":"1"},{"id":"94136","val":"0"}],"94104":[{"id":"94135","val":"1"},{"id":"94136","val":"0"}],"94105":[{"id":"94135","val":"1"},{"id":"94136","val":"0"}]}';
var parsedQuestionOptionMap = jQuery.parseJSON(questionOptionMap);

$(".save").click(function() {	
	
	var inputData = "<Root>";	
	$("#frmSuccessionReadiness").find(".answer").each(function (index) {		
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
	
	$("#frmSuccessionReadiness").submit();
});


createSlider("#div_94101", 1, 5, 1, "#94101");

$(document).ready(function(){  
    
	$('.wrapper').attr('id', 'emergency_readiness');
	$('.wrapper').addClass("succession_readiness");
	$('.toggle').toggles();

	$('.common_in_content').slimScroll();
  
	$(".toggle").on('toggle', function (e, active) {
    	if (active) {
	  		$(this).parent().children(".answer").prop("checked", true);
	  		$($(this).parent().children(".answer")).val('1');
	    } else {
	    	$(this).parent().children(".answer").prop("checked", false);
	    	$($(this).parent().children(".answer")).val('0');
    	}
	});

 	$(".thumb_select_ul a").click(function(){
    	$(this).children(".categoery").toggleClass("not_applicable");
  	});
 	
 	var inputData = {'attributeCodeIds' : ['94101', '94102', '94103', '94104', '94105']};
 	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/partner/datacollection/get-inputdata?partyId=" + $("#partyId").val() + "&buId=153",
		data : inputData,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			$.each(msg, function(index, item) {	
				if(item.attributeCodeId == 94101){
					$('#div_' + item.attributeCodeId).slider( "option", "value", item.attributeReferenceValue);
					$('#' + item.attributeCodeId).val(item.attributeReferenceValue);
				}
				else if(item.attributeCodeId == 94102 || item.attributeCodeId == 94103 || item.attributeCodeId == 94104 || item.attributeCodeId == 94105){
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
</script>
<!-- without income range value calculator strats -->