
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.question.OptionData"%>
<%@page import="in.fiinfra.question.QuestionData"%>
<%@page import="org.aspectj.weaver.patterns.TypePatternQuestions.Question"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.cp.ExpenseData"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.List"%>


<style>
#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}
</style>


<script>

$(window).load(function(){
	  $('#page_loader').fadeOut("5000");
});

$(function() {

	$(document).ajaxStop(function() {
		 $('#page_loader').fadeOut();
	});

	$(document).ajaxStart(function() {
		 $('#page_loader').fadeIn();
	});
	
});	

function bindOption(options, qType){
	//console.log(options +'  '+qType);
	
	if("85004"== qType){
		$('#questionTypeChoice').hide();
		$('#questionTypeOption').show();
		
	}
	if("85001"== qType){
		$('#questionTypeChoice').show();
		$('#questionTypeOption').hide();
	}
	
	var opNo = 0;
	for(var i=1;i<=4;i++){
		++opNo;
		$('#chk'+opNo).prop('checked',false);
		$('#option'+opNo).prop('checked',false);
		$('#spanChk'+opNo).removeClass('white_checkbox_checked');
		$('#spanOption'+opNo).removeClass('white_checkbox_checked');
		$('#spanOption'+opNo).removeClass('common_radio_button_checked');
		$('#spanOption'+opNo).removeClass('white_checkbox_checked');
		$('#divChk'+opNo).hide();
		$('#divOption'+opNo).hide();
		$('#chk'+opNo).val('');
		$('#option'+opNo).val('');
		$('#lblChk'+opNo).text('');
		$('#lblOption'+opNo).text('');
			
	}
	
	opNo = 0;
	for(var i=0;i<options.length;i++){
		++opNo;
		$('#chk'+opNo).prop('checked',false);
		$('#option'+opNo).prop('checked',false);
		$('#spanOption'+opNo).removeClass('common_radio_button_checked');
		$('#spanChk'+opNo).removeClass('white_checkbox_checked'); 
		 
		if("85001"== qType){
			$('#divChk'+opNo).show();
			 $('#chk'+opNo).val(options[i]['optionId']);
			 $('#lblChk'+opNo).text(options[i]['optionText']);

			 if(options[i].selected== true){
				 $('#spanChk'+opNo).addClass('white_checkbox_checked');
				 $('#chk'+opNo).prop('checked',true);
			 }
		 }
		else if("85004" == qType){
			$('#divOption'+opNo).show();
			 $('#option'+opNo).val(options[i]['optionId']);
			 $('#lblOption'+opNo).text(options[i]['optionText']);

			 if(options[i].selected== true){
				 $('#spanOption'+opNo).addClass('common_radio_button_checked');
				 $('#option'+opNo).prop('checked',true);
			 }
			 
		}
	}
	for(;opNo<=4;opNo++){
		$('divOption'+opNo).hide();
		$('divChk'+opNo).hide();
	}
	
	
}
function bindQuestions(question){
	
	//alert(JSON.stringify(question));
	var qType = question['questionTypeId'];
	
	//alert(JSON.stringify(question));
	//$("#questionOptions").empty();
	$("#txtQuestion").text(question['question']);
	var qId =$("#questionId").val(question['questionId']);
	var options=question['options'];
	
	//$("#questionOptions").empty();
	if(options.length==2){
		$('.mon_house_exp_bx').removeClass('mon_house_exp_bx').addClass('radio_parent');
		$('.customCSS_exp_bx').addClass('topMargin');
		
	}else{
		$('.radio_parent').removeClass('radio_parent').addClass('mon_house_exp_bx');
		$('.customCSS_exp_bx').removeClass('topMargin');
	}
	
	bindOption(options,qType);
	
	var myScore = 0;
	for(var i=0;i<index;i++){
		//alert(scores[i]);
		myScore += scores[i] ;
	}
	
	$('#currentQuestion').text(index+1);
	$('#totalQuestion').text(" of "+data1.length);
	if(index ==0){
		$("#prev").hide();
	}
	else{
		$("#prev").show();
	}

 }


</script>

<!--Slider Starts -->

<!--Common Custom checkbox -->
<script>
$(document).ready(function(){
  $("body").on("click",".common_custom_checkbox",function(){
    //$(this).addClass("white_checkbox_checked");
 //$(this).next(".default_checkbox").prop("checked",true);
 //$(".default_checkbox").not($(this).next()).prop("checked",false);
 //$(".common_custom_checkbox").not(this).removeClass("white_checkbox_checked");
  if ($(this).next( ".default_checkbox" ).is(":checked")) {
   $(this).removeClass("white_checkbox_checked");
  $(this).next( ".default_checkbox" ).prop("checked", false);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
       $(this).addClass("white_checkbox_checked");
    }
 
  });
  var answered= false;
  for(var i=0;i<data1.length;i++){
	  var options = data1[i]['options'];
	  var hasParent =  data1[i].parentQuestionId >0 ; 
	  for(var j=0;j<options.length;j++){
		  if(options[j].selected == true){
			  answered = true;
		  }
		  if(hasParent){
			//  options[j].selected = false; 
		  }
	  }
  }
  if(answered){
	   $(".overlay").fadeIn("slow");
  		$("#confirmDialog").fadeIn("slow");
  		
  }
  
  bindQuestions(data1[0]);
   
});

function onConfirm(){
	  for(var i=0;i<data1.length;i++){
		  var options = data1[i]['options'];
		  for(var j=0;j<options.length;j++){
			  options[j].selected = false;
		  }
	  }
	index = 0;
	  bindQuestions(data1[0]);
	  $("#confirmDialog").fadeOut("slow");
		$(".overlay").fadeOut("slow");
}

</script>
<script>
$(document).ready(function(){
  $("body").on("click",".common_radio_button",function(){
    $(".common_radio_button").removeClass("common_radio_button_checked");
	$(this).addClass("common_radio_button_checked");
	
	 if ($(this).next( ".default_radio" ).is(":checked")) {
		
       $(this).next( ".default_radio" ).prop("checked", false);
	   
    } else {
       $(this).next( ".default_radio" ).prop("checked", true);
	
    }
	
  });
});
</script>
<script>
var data1=${questionList};
//alert(JSON.stringify(data1));
var index=0;
var flag=-1;
var scores  = [];
for(var i=0;i<data1.length;i++){
	scores [i] = 0;
}
//alert(JSON.stringify(data1));
 $(document).ready(function() {
	//  $('.add_docs_bx_slider').bxSlider();
	$('#questionOptions').show(); 
	 
$('#prev').click(function(){
	//alert('Previous');
	
	if(index-1>flag){
		saveSelecteOptions(false);
	}else{
		//alert('No Pre Element');
		showMessage("You are at First Question !!");
		
	}
	
	
});
$('#next').click(function(e){
	e.preventDefault();
	 if(data1[index]['mandatory']==false){
		 var found = false;
		 $('input[type=checkbox]').each(function () {
			  if(this.checked){ 
				 found = true;
			}
		  });
 		$('input[type=radio]').each(function () {
			 if(this.checked){
				 found = true;
			}
		  });
	 
		 if(!found){
			 showMessage("Please Answer This Question !!");
			 return  ;
		 }
	}
	saveSelecteOptions(true);
	 

	});

});

 

 function saveSelecteOptions(next){
	 
	 var options=data1[index]['options'];
	 var qId=data1[index]['questionId'];
	 $("#qId").val(qId);
	 $("#questionnaireId").val(data1[index]['questionnaireId']);
	 for(var i=0;i<options.length;i++){
		 
		// alert($('#chk'+(i+1)).is(':checked'));
		
		 if($('#chk'+(i+1)).is(':checked') || $('#option'+(i+1)).is(':checked') ){
			 options[i].selected = true; 
		 }
		 else{
			 options[i].selected =  false;
		 }
		 
	 }
	 
	 //alert('Save Called');
	 var data = {};
	 data['questionId'] = $('#qId').val();
	 data['questionnaireId'] = $('#questionnaireId').val();
	 var checked = $.map($( "input:checked" ), function(n, i){ return n.value;}).join(',');
//	 console.log(data['questionId'] +'  '+checked);
//	 data['selectedOptions'] =	 checked;
	 //alert(JSON.stringify(data));
	 $("#contents").addClass("loading");
	 var clientID = '${clientPartyID}';
	
	$.ajax({
			url : "${pageContext.request.contextPath}/xray/answer/save?optionId="+checked+"&contactPartyId="+clientID,
		type : "POST",
			data : data,
			success : function(data, textStatus, jqXHR) {

				$("#contents").removeClass("loading");
				if (next) {
					navigateToNext();
				} else {
					navigateToPrev();
				}

				bindQuestions(data1[index]);
				//scores[index] = data.score;
			},
			error : function(jqXHR, textStatus, errorThrown) {
				$("#contents").removeClass("loading");
				showMessage('Error while saving Answer');
			}
		});

	}

	function navigateToNext() {
		var next = getNextIndex(index);
		if (next == -1) {
			var myScore = 0;
			for (var i = 0; i < index; i++) {
				//alert(scores[i]);
				myScore += scores[i];
			}
			$("body").addClass("loading");

			window.location = "${pageContext.request.contextPath}/xray/questions/submit?contactPartyId=${clientPartyID}&name=${headerName}";
			//last
		} else {
			if (index + 1 != next) {
				index++;
				for (var op = 0; op < data1[index].options.length; op++) {
					data1[index].options[op].selected = false;
				}
				saveSelecteOptions(true);
			} else {
				index = next;
				bindQuestions(data1[index]);
			}
		}

	}

	function closeDialog(){
		$(".default_checkbox").attr("checked", false);
		$(".white_checkbox").removeClass("white_checkbox_checkbox_checked");
		$(".overlay").fadeOut("slow");
		$("#confirmDialog").fadeOut("slow");
	}
	
	function navigateToPrev() {

		var next = getPrevIndex(index);

		if (next == -1) {
			showMessage("No Previous Question");
		} else {
			index = next;
			bindQuestions(data1[index]);
		}
	}

	function showMessage(message) {
		$("#successDialog").html(message);
		$("#successDialog").dialog("open");
	}

	function getNextIndex(index) {
		for (var i = index + 1; i < data1.length; i++) {
			var q = data1[i];
			var pQId = q.parentQuestionId;//alert(pQId);
			var pQOpId = q.parentQuestionOpId;
			if (pQId <= 0) {
				return i;
			}
			for (var j = i; j >= 0; j--) {

				if (data1[j].questionId == pQId) {
					//alert(JSON.stringify(data1[j]));
					//alert('Found > j='+ j +'  i='+i +'  '+k<data1[j].options.length );	 
					for (var k = 0; k < data1[j].options.length; k++) {
						//alert('Found > j='+ j +'  i='+i +'  K='+k +'  '+data1[j].options[k].selected);
						if (data1[j].options[k].optionId == pQOpId
								&& data1[j].options[k].selected == true) {
							return i;
						}
					}
				}
			}

		}
		return -1;
	}

	function getPrevIndex(index) {
		//alert("asda");
		for (var i = index - 1; i > -1; i--) {
			var q = data1[i];
			var pQId = q.parentQuestionId;//alert(pQId);
			var pQOpId = q.parentQuestionOpId;
			if (q.parentQuestionId <= 0) {

				return i;
			}
			for (var j = i; j >= 0; j--) {
				if (data1[j].questionId == pQId) {
					for (var k = 0; k < data1[j].options.length; k++) {
						//console.log(k+'  '+data1[j].options[k].selected +'  '+j+'  '+k +' Op='+data1[j].options[k].optionId);
						if (data1[j].options[k].optionId == pQOpId
								&& data1[j].options[k].selected == true) {
							return i;
						}
					}
				}
			}

		}
		return -1;
	}
</script>

  <%-- <div id="header-strip" class="fl">
   <jsp:include page="../menu.jsp"></jsp:include> 
  <h3>FINANCIAL X-Ray</h3>
  </div>--%>
 
  
<%--   <div id="contents">
   <div id="inner_contents_my_income_data"> 
      <!--title starts-->
      <div class="my_income_title_bx">
      <br/>
          <hr/>
  
<% List<QuestionData> questions= (List<QuestionData>)request.getAttribute("lstQuestions") ; %>


<%int previous=0;
int index=0;

for (QuestionData q:questions) {%>
	<% 
	if(previous!=q.getQuestionId()) { index++; %>
	<p style="color: red;">Question <%=index %>:</p><%=q.getQuestion() %><br/>
	<%} %>
	<%for(OptionData o:q.getOptions()){ %>
	
	<div style="color: blue;"><%=o.getOptionText() %></div>
<% } %>
	<br/>
<% previous=q.getQuestionId();

} %>

</div>
 </div>
 </div> --%>


<!-- Mexel Change  -->
<div id="contents">
	<section class="content common_content"> 
    <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
    <section class="in_content clearfix" id="x_ray_main">
      <div class="fin_x_ray">
      
      <form  id="selectedOptions" >
      	<input type="hidden" name="questionId" id="qId"/>
      	<input type="hidden" name="questionnaireId" id="questionnaireId"/>
      	  <!--  <div class="label" id="txtQuestion"></div> -->
        <div class="label" id="txtQuestion"></div>
        <div class="calcy_li_bx">
          <div class="calcy_li_bx_in"> 
          
          
            <div class="add_document_slider ">
             <a class="bx-prev" id="prev" ></a>
            <a class="bx-next" id="next" ></a>
            <div class="notification"><div id="currentQuestion" class="one"></div><span id="totalQuestion" class="two"></span></div>
              <ul class="add_docs_bx_slider clearfix">
                <li>
                  <div class="mon_house_exp_bx clearfix customCSS_exp_bx">
                    <div id="questionOptions" class="mon_house_exp_bx_in_left clearfix customCSS_exp_bx_in" style="margin-top: -40px;display:none">
                     <div id="questionTypeChoice" class="mon_house_exp_bx clearfix">
                    <div class="mon_house_exp_bx_in_left clearfix">
                    
                    <div class="top" id="divChk1">
                      <div class="c_box"> <span  id="spanChk1" class="common_custom_checkbox"></span>
                        <input type="checkbox" id="chk1" class="default_checkbox" name="selectedOptions"/>
                      </div> 
                       <label id="lblChk1">  </label>
                        </div>
                        
                        
                        <div class="bottom" id="divChk3">
                      <div class="c_box"> <span id="spanChk3" class="common_custom_checkbox"></span>
                        <input type="checkbox" id="chk3" class="default_checkbox" name="selectedOptions"/>
                      </div> 
                       <label id="lblChk3"> </label>
                        </div>
                        
                    </div>
                    <div class="mon_house_exp_bx_in_right clearfix">
                         <div class="top" id="divChk2">
                      <div class="c_box"> <span id="spanChk2" class="common_custom_checkbox"></span>
                        <input type="checkbox" id="chk2" class="default_checkbox" name="selectedOptions"/>
                      </div> 
                       <label id="lblChk2">  </label>
                        </div>
                        
                        
                        <div class="bottom" id="divChk4">
                      <div class="c_box"> <span id="spanChk4" class="common_custom_checkbox"></span>
                        <input type="checkbox" id="chk4" class="default_checkbox" name="selectedOptions"/>
                      </div> 
                       <label id="lblChk4"> </label>
                        </div>
                    </div>
                 
           
                  </div>
                 <div id="questionTypeOption" class="mon_house_exp_bx clearfix">
                    <div class="mon_house_exp_bx_in_left clearfix">
                    
                    <div class="top" id="divOption1">
                      <div class="c_box fl"> <span  id="spanOption1" class="common_radio_button" ></span>
                        <input type="radio" id="option1"  name="selectedOptions" class="default_radio"/>
                      </div> 
                       <label id="lblOption1"> </label>
                        </div>
                        
                        
                        <div class="bottom" id="divOption3">
                      <div class="c_box fl"> <span id="spanOption3" class="common_radio_button" ></span>
                        <input type="radio" id="option3" name="selectedOptions" class="default_radio" />
                      </div> 
                       <label id="lblOption3"> </label>
                        </div>
                        
                    </div>
                    <div class="mon_house_exp_bx_in_right clearfix">
                         <div class="top" id="divOption2">
                      <div class="c_box fl"> <span id="spanOption2" class="common_radio_button" ></span>
                        <input type="radio" id="option2"  name="selectedOptions" class="default_radio"/>
                      </div> 
                       <label id="lblOption2">  </label>
                        </div>
                        
                        
                        <div class="bottom" id="divOption4">
                      <div class="c_box fl"> <span id="spanOption4" class="common_radio_button" ></span>
                        <input type="radio" id="option4"  name="selectedOptions" class="default_radio"/>
                      </div> 
                       <label id="lblOption4"> </label>
                        </div>
                    </div>
                  </div>
                  	<div id="page_loader"></div>
                    </div>
                  </div>
                </li>
              </ul>
            <div> 
            
           <!--  <input type = "button" id="prev" value="Previous" name="Previous"/>
            <input type = "button" id="next" value="Next" name="Next"/> -->
            </div>
            </div>
           
          </div>
        </div>
        </form>
      </div>
      <!-- DC submenu Ends--> 
      
    </section>
    </section>
    <div class="clr"></div>
    
    <!-- end of "inner-contents" id --> 
  </div>
  
  <div class="modal"><!-- Place at bottom of page --></div>
  <div id="confirmDialog" class="common_custom_modal_aa"> <span class="close" onclick="closeDialog();">X</span>
  <div class="modal_content">
    <div class="aa_up"> ${xraySuccess}</br>Do you want to start X-Ray again?</div>
    <div class="aa_down" id="yes"> <a style="cursor:pointer;" onclick="onConfirm();" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
<div class="overlay"></div>
  <script>
  

</script>
  
  