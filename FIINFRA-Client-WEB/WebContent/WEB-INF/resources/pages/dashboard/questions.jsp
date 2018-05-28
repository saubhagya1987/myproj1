
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



<script>

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
	/* if(options.length==2){
		$('.mon_house_exp_bx').removeClass('mon_house_exp_bx').addClass('radio_parent');
		$('.customCSS_exp_bx').addClass('topMargin');
		
	}else{
		$('.radio_parent').removeClass('radio_parent').addClass('mon_house_exp_bx');
		$('.customCSS_exp_bx').removeClass('topMargin');
	} */
	
	bindOption(options,qType);
	
	var myScore = 0;
	for(var i=0;i<index;i++){
		//alert(scores[i]);
		myScore += scores[i] ;
	}
	
	/* $('#currentQuestion').text(index+1);
	$('#totalQuestion').text(" of "+data1.length); */
	$('#totalQuestion').text(index+1+" / "+data1.length);
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
		/* showConfirm("Do you want to start X-Ray again ?", function() {
			  for(var i=0;i<data1.length;i++){
				  var options = data1[i]['options'];
				  for(var j=0;j<options.length;j++){
					  options[j].selected = false;
				  }
			  }
			  index = 0;
			  bindQuestions(data1[0]);
		}); */

		bootbox.confirm("Do you want to start X-Ray again ?", function(result) {
			if(result==true)
				{
				for(var i=0;i<data1.length;i++){
					  var options = data1[i]['options'];
					  for(var j=0;j<options.length;j++){
						  options[j].selected = false;
					  }
				  }
				  index = 0;
				  bindQuestions(data1[0]);
				}
			else
				{
				
				}
			  /* Example.show("Confirm result: "+result); */
			}); 
		
		
		
  }
  
  bindQuestions(data1[0]);
 
});
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
		showMessage("You are at First Question !!",true);
	}
	
	
});
$('#next').click(function(e){
	e.preventDefault();
	 if(data1[index]['mandatory']==true){
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
			 showMessage("Please Answer This Question !!",true);
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
	 data['selectedOptions'] =	 checked;
	 //alert(JSON.stringify(data));
	 $("#row").addClass("loading");
	 
	 $.ajax(
			    {
			        url : "${pageContext.request.contextPath}/question/answer/save",
			        type: "POST",
			        data : data,
			        success:function(data, textStatus, jqXHR)
			        {	
			        	
			        	$("#row").removeClass("loading");
			        	if(next){
		        			navigateToNext();
			        	}
			        	else{
			        		navigateToPrev();
			        	}
			        	
			    		bindQuestions(data1[index]);
			        	//scores[index] = data.score;
			        },
			        error: function(jqXHR, textStatus, errorThrown)
			        {
			        	$("#contents").removeClass("loading");
			        	showMessage('Error while saving Answer',true);
			        }
			    });
		
 }

 function navigateToNext(){
	 var next = getNextIndex(index);
	 if(next ==-1){
			var myScore = 0;
			for(var i=0;i<index;i++){
				//alert(scores[i]);
				myScore += scores[i] ;
			}
			$("body").addClass("loading");
			window.location = "${pageContext.request.contextPath}/question/xray/submit";
		 //last
	 }
	 else{
		 if(index+1 != next){
			 index++;
			 for(var op=0;op<data1[index].options.length;op++){
				 data1[index].options[op].selected=false;
			 }
			 saveSelecteOptions(true);
		 }
		 else{
			 index = next;
			 bindQuestions(data1[index]);
		 }
	 }
 }

 function navigateToPrev(){
	
	 var next = getPrevIndex(index); 
	
	 if(next ==-1){
		 	showMessage("No Previous Question");
	 }
	 else{
		 index = next;
		 bindQuestions(data1[index]);
	 }
 }

 function getNextIndex(index){
	 for(var i=index+1;i<data1.length;i++){
		 var q = data1[i];
		 var pQId = q.parentQuestionId;//alert(pQId);
		 var pQOpId = q.parentQuestionOpId;
		 if(pQId <=0){
			 return i;
		 }
		 for(var j=i;j>=0;j--){
			 
			 if(data1[j].questionId == pQId){
			    //alert(JSON.stringify(data1[j]));
				//alert('Found > j='+ j +'  i='+i +'  '+k<data1[j].options.length );	 
				 for(var k=0;k<data1[j].options.length;k++){
				//alert('Found > j='+ j +'  i='+i +'  K='+k +'  '+data1[j].options[k].selected);
					 if(data1[j].options[k].optionId == pQOpId && data1[j].options[k].selected == true ){
						 return i;
					 }
				 }
			 }
		 }
		 
	 }
	 return -1;	 
 }

 function getPrevIndex(index){
	 //alert("asda");
	 for(var i=index-1;i>-1;i--){
		 var q = data1[i];
		 var pQId = q.parentQuestionId;//alert(pQId);
		 var pQOpId = q.parentQuestionOpId;
		 if(q.parentQuestionId <=0){
			 
			 return i;
		 }
		 for(var j=i;j>=0;j--){
			 if(data1[j].questionId == pQId){
				 for(var k=0;k<data1[j].options.length;k++){
					 //console.log(k+'  '+data1[j].options[k].selected +'  '+j+'  '+k +' Op='+data1[j].options[k].optionId);
					 if(data1[j].options[k].optionId == pQOpId && data1[j].options[k].selected == true ){
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
  </div> --%>


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
	<section class="in_content clearfix" id="x_ray_main">
		<div class="fin_x_ray">

			<%--   <form  id="selectedOptions" >
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
        </form> --%>
		</div>
		<!-- DC submenu Ends-->
	</section>
	<div class="clr"></div>
	<!-- end of "inner-contents" id -->
</div>
<div class="modal">
	<!-- Place at bottom of page -->
</div>

<!-- NEW CODE -->

<div class="row" id="row">
	<div class="col-xs-12">
		<form id="selectedOptions">
			<!-- PAGE CONTENT BEGINS -->
			<div class="widget-box">
				<div class="widget-header widget-header-blue widget-header-flat">
					<h4 class="widget-title lighter" id="txtQuestion"></h4>
					<div class="widget-toolbar">
						<label> <small class="green"> <b
								id="totalQuestion"></b>
						</small>
						</label>

					</div>
				</div>
				<div class="widget-body">
					<div class="widget-main">
						<!-- #section:plugins/fuelux.wizard -->
						<div id="fuelux-wizard-container">
							<div class="step-content pos-rel">
								<div class="step-pane active">

									<input type="hidden" name="questionId" id="qId" /> <input
										type="hidden" name="questionnaireId" id="questionnaireId" />
									<!--  <div class="label" id="txtQuestion"></div> -->
									<div >
										<div >


											<div class="add_document_slider ">
												<!-- <a class="bx-prev" id="prev" ></a>
            <a class="bx-next" id="next" ></a> -->

												<ul class="add_docs_bx_slider">
													<li>
														<div class="mon_house_exp_bx">
															<div id="questionOptions"
																class="mon_house_exp_bx_in_left clearfix customCSS_exp_bx_in"
																style="margin-top: 0px; display: none">

																<div id="questionTypeChoice"
																	class="mon_house_exp_bx">
																	<div class="mon_house_exp_bx_in_left">
																		<div class="top" id="divChk1">
																			
																				<span id="spanChk1" class="common_custom_checkbox"></span>
																				<input type="checkbox" id="chk1"
																					name="selectedOptions" />
																			
																			<span id="lblChk1"> </span>
																		</div>
																		<div class="bottom" id="divChk3">
																			
																				<span id="spanChk3" class="common_custom_checkbox"></span>
																				<input type="checkbox" id="chk3"
																					name="selectedOptions" />
																			
																			<span id="lblChk3"></span>
																		</div>
																	</div>
																	<div class="mon_house_exp_bx_in_right clearfix">
																		<div class="top" id="divChk2">
																		
																				<span id="spanChk2" class="common_custom_checkbox"></span>
																				<input type="checkbox" id="chk2"
																					name="selectedOptions" />
																			
																			<span id="lblChk2"> </span>
																		</div>
																		<div class="bottom" id="divChk4">
																			
																				<span id="spanChk4" class="common_custom_checkbox"></span>
																				<input type="checkbox" id="chk4"
																					name="selectedOptions" />
																			
																			<span id="lblChk4"> </span>
																		</div>
																	</div>
																</div>
																<div id="questionTypeOption"
																	class="mon_house_exp_bx">
																	<div class="mon_house_exp_bx_in_left ">
																		<div class="top" id="divOption1">
																			
																				<!-- <span  id="spanOption1" ></span> -->
																				<input type="radio" id="option1"
																					name="selectedOptions" />
																			
																			<span id="lblOption1"> </span>
																		</div>
																		<div class="bottom" id="divOption3">
																			
																				<!-- <span id="spanOption3"></span>  -->
																				<input type="radio"	id="option3" name="selectedOptions" />
																			
																			<span id="lblOption3"> </span>
																		</div>
																	</div>
																	<div class="mon_house_exp_bx_in_right ">
																		<div class="top" id="divOption2">
																			
																				<!-- <span id="spanOption2"></span> --> <input type="radio"
																					id="option2" name="selectedOptions" />
																			
																			<span id="lblOption2"> </span>
																		</div>
																		<div class="bottom" id="divOption4">
																			
																				<span id="spanOption4"></span> <input type="radio"
																					id="option4" name="selectedOptions" />
																		
																			<span id="lblOption4"></span>
																		</div>
																	</div>
																</div>
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


								</div>


							</div>

							<!-- /section:plugins/fuelux.wizard.container -->
						</div>
			
						</div>
						

						<!-- /section:plugins/fuelux.wizard -->
					
					<!-- /.widget-main -->
				</div>
				<!-- /.widget-body -->
			</div>

		</form>
		<div class="wizard-actions">
				<!-- #section:plugins/fuelux.wizard.buttons -->
				<button class="btn-primary btn-xs btn fl" id="prev">
					<i class="ace-icon fa fa-arrow-left"></i> Prev
				</button>

				<button class="btn-primary btn-xs btn fr" id="next">
					Next <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
				</button>

				<!-- /section:plugins/fuelux.wizard.buttons -->
			</div>
	</div>
	<!-- /.col -->
</div>
