<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Common_content Starts-->	
    <section class="content common_content"> 
     
    <form class="form-horizontal" id="frmCashFlow" name="frmCashFlow" action="<c:url value="/partner/datacollection/save" />" method="POST">
    <input type="hidden" name="partyId" id="partyId" value="${partyId}" /> 
    <input type="hidden" name="redirectUrl" id="redirectUrl" value="/partner/datacollection/cash-flow/" />
    
      <!-- Common_in_contnet starts-->
      <section class="common_unit_selector">
        <ul class="clearfix reset">
          <li class="k"><span class="unit">K</span></li>
          <li class="lacs"><span class="unit">Lacs</span></li>
          <li class="cr unit_selected"><span class="unit">Cr</span></li>
        </ul>
        <p>All figures are in :</p>
      </section>
      
      <div class="common_ad_ass_selector"><a href="#">
      <ul class="clearfix reset">
        <li>
          <p>Advice Assumptions</p>
        </li>
      </ul>
      </a><div class="Advice_Assump_Menu" style="display: none;"><a href="#">
  </a><ul class="clearfix reset"><a href="#">
    <li class="clearfix">
      <label class="form_label">Annual Earnings  Growth Rate(%)</label>
      <div class="range_parent">
        <div class="scale clearfix">
          <div class="scale_range"><span class="low extrem">0%</span><span class="high extrem">100%</span></div>
          <div id="advice_assump_cf" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false"><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 0%;"></a></div>
          <div class="counter_parent">
            <input type="text" id="advice_assump_cf_payment" class="range_counter">
            <span class="unit">%</span> </div>
        </div>
      </div>
    </li>
    
    <li class="clearfix">
      <label class="form_label">Inflation Rate(%)</label>
      <div class="range_parent">
        <div class="scale clearfix">
          <div class="scale_range"><span class="low extrem">4%</span><span class="high extrem">15%</span></div>
          <div id="advice_assump_cf_in" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false"><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 0%;"></a></div>
          <div class="counter_parent">
            <input type="text" id="advice_assump_cf_in_payment" class="range_counter">
            <span class="unit">%</span> </div>
        </div>
      </div>
    </li>
    
    </a><li class="clearfix"><a href="#"> </a><a class="cancel">CANCEL</a><a class="save">SAVE</a></li>
  </ul>
</div>
    </div>
      
      <div class="clr"></div>
      <section class="dc_in_content common_in_content clearfix" id="cash_flow">
      
        <ul class="reset clearfix" id="cash_flow_ul">
          <li class="clearfix">
            <div class="ques_txt">
              <p>How would you rate the amount of control you have on your expenses?</p>
            </div>
            <div class="ques_action clearfix">
              <div class="range_parent">
                <div class="fl scale clearfix">
                  <div class="scale_range"> <span class="low extrem">Low</span> <span class="high extrem">High</span>                   
                     &nbsp;
                    <div id="div_94065"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="94065" name="94065" value="" class="range_counter answer">                    
                  </div>
                </div>
              </div>
              <div class="clr"></div>
            </div>
          </li>
          
          <li class="clearfix">
            <div class="ques_txt">
              <p>How many sources of income do you have?</p>
            </div>
            <div class="ques_action clearfix">
              <div class="range_parent">
                <div class="fl scale clearfix">
                  <div class="scale_range"> <span class="low extrem">1</span> <span class="high extrem">5</span>
                   &nbsp;
                    <div id="div_94066"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="94066" name="94066" value="" class="range_counter answer">
                  </div>
                </div>
              </div>
              <div class="clr"></div>
            </div>
          </li>
          
          <li class="clearfix">
            <div class="ques_txt">
              <p>How much is your annual household net income?</p>
            </div>
            <div class="ques_action clearfix">
              <div class="range_parent">
                <div class="fl scale clearfix">
                  <div class="scale_range"> <span class="low extrem">0</span> <span class="high extrem">100</span>
                   &nbsp;
                    <div id="div_94073"></div>
                  </div>
                  <div class="counter_parent ">
                    <input type="text" id="94073" name="94073" value="" class="range_counter answer">
                    <span class="unit dynamic">lacs</span>
                     </div>
                </div>
              </div>
              <div class="clr"></div>
            </div>
          </li>
          
          <li class="clearfix">
            <div class="ques_txt">
              <p><span class="required_star">*</span>How much is your average monthly expenditure? </p>
            </div> 
            <div class="ques_action clearfix">
              <div class="range_parent">
                <div class="fl scale clearfix">
                  <div class="scale_range"> <span class="low extrem">0</span> <span class="high extrem">100</span>
                   &nbsp;
                    <div id="div_94079"></div>
                  </div>
                  <div class="counter_parent ">
                    <input type="text" id="94079" name="94079" value="" class="range_counter answer">
                     </div>
                </div>
              </div>
              
              <select>
              <option>K</option>
              <option>Lacs</option>
              <option>Cr</option>              
              </select>
              <div class="clr"></div>
            </div>
          </li>
          
          <li  class="clearfix">
            <div class="ques_txt">
              <p><span class="required_star">*</span>How much monthly EMI do you pay against your loan? </p>
            </div>
            <div class="ques_action clearfix">
              <div class="range_parent">
                <div class="fl scale clearfix">
                  <div class="scale_range"> <span class="low extrem">0</span> <span class="high extrem">100</span>
                   &nbsp;
                    <div id="div_94080"></div>
                  </div>
                  <div class="counter_parent ">
                    <input type="text" id="94080" name="94080" value="" class="range_counter answer">
                     </div>
                </div>
              </div>
              <select>
              <option>K</option>
              <option>Lacs</option>
              <option>Cr</option>
              
              </select>
              <div class="clr"></div>
            </div>
          </li>
        </ul>
        <input type="hidden" name="questionBankId" id="questionBankId" value="1"  />
        <input type="hidden" name="sectionTypeId" id="sectionTypeId" value="39002" />
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
        <a href="${pageContext.request.contextPath}/partner/datacollection/financial-readiness/${partyId}" class="back navgation"><span class="txt">Back</span></a> 
        <a href="${pageContext.request.contextPath}/partner/datacollection/loan-status/${partyId}" class="next navgation"><span class="txt">Next</span></a>
      </section>      
      <!-- Common footer ends -->
      <div class="overlay"></div>
     </form>
    </section>
    <!-- Common_content Ends--> 

<script src="${pageContext.request.contextPath}/resources/js/common_unit_selector.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common/common.js"></script>
<script>

var questionOptionMap = '{"94065":[{"id":"94130","val":"1"},{"id":"94131","val":"2"},{"id":"94132","val":"3"},{"id":"94133","val":"4"},{"id":"94134","val":"5"}],"94066":[{"id":"94130","val":"1"},{"id":"94131","val":"2"},{"id":"94132","val":"3"},{"id":"94133","val":"4"},{"id":"94134","val":"5"}]}';
var parsedQuestionOptionMap = jQuery.parseJSON(questionOptionMap);

$(".save").click(function() {
	var inputData = "<Root>";	
	$("#frmCashFlow").find(".answer").each(function (index) {		
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
	$("#frmCashFlow").submit();
});

$(document).ready(function(){
    $('.wrapper').attr('id', 'cash_flow_parent'); 

    $(".common_unit_selector li").click(function(){
		$(".common_unit_selector li").removeClass("unit_selected");
    	$(this).addClass("unit_selected");
  	});
    
	$('.common_in_content').slimScroll();

	createSlider('#div_94065', 1, 5, 1, '#94065');
	createSlider('#div_94066', 1, 5, 1, '#94066');	
	createSlider('#div_94073', 1, 100, 1, '#94073');
	createSlider('#div_94079', 1, 100, 1, '#94079');
	createSlider('#div_94080', 1, 100, 1, '#94080');
	//advice assumption Slider
	createSlider('#advice_assump_cf',0,100,0,'#advice_assump_cf_payment')
	createSlider('#advice_assump_cf_in',4,15,1,'#advice_assump_cf_in_payment')

	$("select").selectBoxIt();

	var inputData = {'attributeCodeIds' : ['94065', '94066', '94073', '94079', '94080']};
 	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/partner/datacollection/get-inputdata?partyId=" + $("#partyId").val() + "&buId=153",
		data : inputData,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(msg) {
			$.each(msg, function(index, item) {	
				if(item.attributeCodeId == 94065 || item.attributeCodeId == 94066 || item.attributeCodeId == 94073 || item.attributeCodeId == 94079 || item.attributeCodeId == 94080){
					$('#div_' + item.attributeCodeId).slider( "option", "value", item.attributeReferenceValue);
					$('#' + item.attributeCodeId).val(item.attributeReferenceValue);
				} 
			});		    
		},
		error : function(msg) {
			$('.result').html(msg.d);
		}
	});
 	
});
</script>
  