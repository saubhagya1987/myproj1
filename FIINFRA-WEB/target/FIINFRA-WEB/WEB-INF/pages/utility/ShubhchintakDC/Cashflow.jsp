<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Financial Plan - Current Financial Status: Cash Flow</title>
<link href="css/Axis_dc.css" rel="stylesheet">
</head>
<body>
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">
<input type="hidden" id="section" value="${sessionScope.Section}"/>
<input type="hidden" name="dcInputDocId_AnalysisReport" id="dcInputDocId_AnalysisReport" value="${sessionScope.dcInputDocId_AnalysisReport}">
<input type="hidden" name="redirectToPage" id="redirectToPage" value="${sessionScope.redirectToClient}">
<form action="" name="showPathFinderOutputPdfForm" method="post" >
</form>
<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
<section>
<div class="">
<div class="page-header clearfix">
  <h1 class="pull-left"><span id="dcinputname"> Financial Plan for&nbsp;<i class="fa icon-opportunity"></i></span></h1>
  <div class="pull-right">
    <input class="dcbutton btn btn-xs btn-primary" type="button" value="Exit"  id="exit" onclick="redirectToOpportunity()"  name="Exit">
  </div>
</div>
<div class="container-body " style="padding:5px;"> </div>
<div class="row">
<div class="col-md-3" style="padding-left:10px;"><img src="images/${sessionScope.userSession.themeName}/currentf.jpg"></div>
<div class="col-md-6 dchead " style="padding-left:10px;">FINANCIAL PLAN</div>
<div class="col-md-3" style="text-align:right;"><img src="" id="headimg" width="191" height="98"></div>

<!-- center -->

<jsp:include page="sidebar.jsp">
		<jsp:param name="param1" value="cashflow" />
	</jsp:include>
<div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
  
  <!-- center -->
  
  <div class="list-group"><a class="list-group-item active" href="#">Current Financial Status</a>
    <div class="list-group-item">
      <div class="">
        <div class="col-md-12"><img id="dsf" src="images/${sessionScope.userSession.themeName}/currentfstatus.png"  class="img-responsive"></div>
        <div class="clearfix"></div>
        <!-- end-->
        <div class="widget-box" style="margin-top:10px;">
          <div class="widget-header">
            <h4 class="widget-title lighter smaller">Cash Flow</h4>
          </div>
          <div class="widget-body clearfix"><br>
            <div class="widget-main" style="margin-top:10px;">
              <div class=""><strong>Do a reality check... How are you feeling about your financial situation today?
                Not how you would like it to be, not your desired situation, but an objective assessment of what
                you have done with your money so far? Try here...</strong></div>
            </div>
            <!--1 start -->
            
            <div id="cashflowQuestions" class="col-md-12 clearfix"></div>
            <div class="col-md-12 rightAlign southspace2">
              <input class="btn btn-xs btn-primary dbtn" type="button" value="Save" onclick="save('save')" name="Save" >
              <input class="btn btn-xs btn-primary dbtn" type="button" value="Cancel" name="Cancel" onclick="redirectDcInput()">
              <input class="btn btn-xs btn-primary dbtn" type="button" onclick="save('next')" value="Next" name="Next">
            </div>
          </div>
        </div>
        <!-- end-->
        <!--END -->
        
      </div>
    </div>
  </div>
</div>
</div>
<br/>
<br/>
</div>
</div>

<!-- Center part End -->

<jsp:include page="../../common/footer.jsp" />

</body>
<script>
	var questionList = new Array();
	var questionListToIterate = new Array();
	var selectedQuetionOptionList ;
	var sectionTypeId = 39002;
	var questionBankId = 27;
	var isManQuestionFill_text1;
	var isManQuestionFill_radio1;
	var isManQuestionFill_text2;
	var isManQuestionFill_text3;
	var isManQuestionFill_radio2;
	var isValidData_isMan;
	var isValidData_text_chk;
	var isContainsRiskCover;
	var isContainsEmergencyR;
	var isContainsCahflow;
	var isContainsRiskProfile;
	var isContainsSuccession;
	var isContainsRetirment;
	var isContainsGoal;
	var isContainsLoan;
	var sectionarray;
	
	var isValidData;
// 	var $jq_1_9_2 = $.noConflict();
				function selectOption(id, name) {
					$('#'+name).val('');

			try{			
			var text=$('#'+id+'[name="'+name+'"]').val();
			if(text=='No' || text=='no'){	
				
		
				$(questionList).each(function(i,obj){
			
					if(obj.parentQuestion==name){						

						
						$('input[name="'+obj.questionId+'"]').attr('disabled','disabled');
						$('input[name="'+obj.questionId+'"]').attr('checked',false);
						$('#'+obj.questionId).attr('disabled','disabled');
						$('#'+obj.questionId).val('');
// 						if(obj.counter==63010){
// 							$('input[name='+obj.questionId+']').each(function(i,obj){
								
// 								$(obj).attr('disabled','disabled');
// 								$(obj).val('');
// 							});
							
// 						}
						
					}
				});
			}
			else{
				$(questionList).each(function(i,obj){
			
					if(obj.parentQuestion==name){
						$('#'+obj.questionId).removeAttr('disabled');
						$('#'+obj.questionId).val('');
						$('input[name="'+obj.questionId+'"]').removeAttr('disabled');
					}
					
				});
			}

			$('#'+id+'[name="'+name+'"]').attr('checked','checked');
// 			event.preventDefault();
			}
			catch(e){

				$('#'+id+'[name="'+name+'"]').attr('checked','checked');
			}
			
		}
		
		
				$(document)
				.ready(
						function() {

							$('#dcinputname').append($('#dcInputUsername').val());
							
						});
				
		$(document)
				.ready(
						function() {
							sectionarray = $('#section').val().split(',');
							 isContainsRiskCover=sectionarray.contains("39003");
							 isContainsEmergencyR=sectionarray.contains("39001");
							 isContainsCahflow=sectionarray.contains("39002");
							 isContainsRiskProfile=sectionarray.contains("39009");
							 isContainsSuccession=sectionarray.contains("39007");
							 isContainsRetirment=sectionarray.contains("39006");
							 isContainsGoal=sectionarray.contains("39005");
							 isContainsLoan=sectionarray.contains("39008");
							
							$.ajax({
						        type: "GET",
						        url : $('#contextPath').val()
								+ '/xml/DCInputFields.xml',
						        
						        dataType: "xml",
						        success: function(xml) {
						        	$(xml).find('BU').each(function(i,obj){
						        		var buId= $(this).attr('ID');
						        		if(buId==1){
						        	
						            $(obj).find('Section').each(function(i,obj){
						            	var SectionType = $(this).find('SectionType').text();
						            	var SectionName = $(this).attr('Name');
						            	var SectionType = $(this).attr('SectionType');
						            	var Image = $(this).attr('ImagePath');

						            	if(SectionType==39002){
						            	$("#headimg").attr("src",$('#contextPath').val()+"/images/shubhachintak/"+Image);	
						            	$(obj).find('Question').each(function(i,obj){
						            	var Id = $(this).attr('ID');
						            	questionList.push(Id);
						         		var QuestionType = $(this).attr('QuestionType');
						         		var attributeCodeIdQuestion = $(this).attr('AttributeCodeID');

						            	var ControlType = $(this).find('ControlType').text();
						            	var ParentQuestionId=$(this).attr('ParentQuestionId');
						            	var question=$(this).find('QuestionText').text();
						            	var IsMandatory = $(this).find('IsMandatory').text();
						            	
						            	var optionList =[];
						            	var optionIdList =[];
						            	var AttributeCodeIDList=[];
						            	var valueList=[]; 
						            	var i=0;
						            	if (questionListToIterate
												.contains(attributeCodeIdQuestion)) {
																											

										} else {
											
											questionListToIterate
													.push(attributeCodeIdQuestion);
										}
						            	$(this).find('Options').each(function(){
						            		$(this).find('Option').each(function(){
						            			
						            			optionIdList.push($(this).attr('AttributeCodeID'));
						            			AttributeCodeIDList.push($(this).attr('AttributeCodeID'));
						            			valueList.push($(this).attr('Value'));
								            	optionList.push($(this).text());
								            	 });
						            	 });

						           		if(QuestionType==85003)
						            	{
						           		$(
											'#cashflowQuestions')
											.append(
													'<div class="answerbg southspace2" ><div class="a" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-5 searchpadding padding_top" >'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
						            	
						           		for (var i=0;i<optionList.length;i++)
						           			{
							           			$('#question'+Id+'tr')
												.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
						           			}
						           		}
						           		else if(QuestionType==85004)
						            	{
						           		$(
											'#cashflowQuestions')
											.append(
													'<div class="answerbg southspace2" ><div class="a" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-5 searchpadding padding_top" >'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
						            	
						           		for (var i=0;i<optionList.length;i++)
						           			{
							           			$('#question'+Id+'tr')
												.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
						           			}
						           		}
						           		else if(QuestionType==85008)
						           			{
						           				$(
						           				'#cashflowQuestions')
												.append(
														'<div class="answerbg southspace2" ><div class="a1" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-12 searchpadding padding_top" >'+question+'<span class="red">*</span></div><div class="col-md-4 searchpadding padding_top "><input name="input_'+attributeCodeIdQuestion+'" class="form-control" onkeydown="allowIntegersOnly(id,event)" onkeyup="test_skill(id)" type="text" id="'+attributeCodeIdQuestion+'" placeholder="" ><div class="amountinword" id="'+attributeCodeIdQuestion+'moneyText"></div></div><div class="col-md-1 searchpadding padding_top ">OR</div><div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
							           		 for (var i=0;i<optionList.length;i++)
								           			{
								           				 $('#question'+Id+'tr')
															.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');
								            		}
						           			}
						           		
						           		
						           		else if(QuestionType==85005)
					           			{
						           		 	$(
											'#cashflowQuestions')
											.append(
													'<div class="answerbg southspace2" ><div  id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
						           		 
						           		 	for(var i=0;i<optionList.length;i++)
						           		 		{
						           		 		
							           			$('#question'+Id+'tr')
												.append('<input type="text" class="form-control" name="input'+attributeCodeIdQuestion+'"  onkeydown="allowIntegersOnly(id,event)" onkeyup="test_skill(id)"  id="'+attributeCodeIdQuestion+'" value="" /><span class="amountinword" id="'+AttributeCodeIDList[i]+'moneyText"></span>');	
						           		 		}
					           			}
						           		
							           	
						           	 });
									}
						            	
						            	});
						            	
								}/*closing of bu condition*/
							            
						        	});/*close reading Bu tag*/	
						        	
						        	$
									.ajax({
										type : "POST",
										url : $('#contextPath').val()
												+ '/dc/getFinancialStatusList.htm?sectionTypeId='+sectionTypeId+'&questionBankId='+questionBankId,

										success : function(result) {
											
										
											$(result)
											.each(
													function(i, obj) {


															
															
														 	if (obj.questionType == 85005 ) {
															try{
																
																		$('#'+obj.attributeCodeId).val(obj.attributeRefferenceValue);
																				
															
															
															$(
																	'#input'
																			+ obj.questionId)
																	.val(
																			$(
																					"#slider")
																					.slider(
																							"value")
																					+ "%");
															$(
																	'input[name="'
																			+ obj.attributeCodeId
																			+ '"]')
																	.val(
																			obj.attributeValue);
														
															}catch(e){
																$(
																		'input[name="'
																				+ obj.attributeCodeId
																				+ '"]')
																		.val(
																				obj.attributeValue);
															}	} 
														
														 	else if(obj.questionType == 85008 || obj.questionType == 85009)
														 		{

														 		selectOption(
																		'option'
																				+ obj.attributeValue+'_'+obj.attributeCodeId+'_'+obj.attributeRefferenceValue,
																		obj.attributeCodeId);
																$(
																		'#select'
																				+ obj.questionId)
																		.val(
																				obj.attributeValue);
																
														 		}
														 else {
															 selectOption(
																		'option'
																				+ obj.attributeValue+'_'+obj.attributeCodeId+'_'+obj.attributeRefferenceValue,
																		obj.attributeCodeId);
																$(
																		'#select'
																				+ obj.attributeCodeId)
																		.val(
																				obj.attributeValue);
														}
														 	if(obj.questionType != 85008 || (parseFloat(obj.attributeRefferenceValue)==parseFloat(obj.attributeValue))){
																$('#'+obj.attributeCodeId).val(obj.attributeRefferenceValue);
															}
												});
										}
									});
						        }
						        
						    });
							
							
							
							
								
							
																
							
							
							

					
						});
		Array.prototype.contains = function(obj) {
			var i = this.length;
			while (i--) {
				if (this[i] == obj) {
					return true;
				}
			}
			return false;
		}
		function save(buttonType)
		{
			
			var isValidQ1;
				var isValidQ2;
			var xmlString = "<Root>";
			
			$(questionListToIterate)
					.each(
							function(i, obj1) {
							
								$($('input[name="' + obj1 + '"]:checked'))
										.each(
												function(i, obj) {
													id = $(obj).attr('id');
													id = id
															.substring(id
																	.indexOf('option') + 6);

															var arrOfSplitedId = id.split('_');
															id=arrOfSplitedId[0];
															AttributeCodeID=arrOfSplitedId[1];
															var attributeRefferenceValue=arrOfSplitedId[2];
															if(attributeRefferenceValue=='')
																{
																attributeRefferenceValue="1";
																}
															else{
																
															}
															xmlString += '<Question><QuestionId>'
																+ obj1
																+ '</QuestionId>';
														xmlString += '<QuestionOptionId>'
																+ id
																+ '</QuestionOptionId><AttributeCodeID>'
																+AttributeCodeID
																+'</AttributeCodeID><Value>'+attributeRefferenceValue+'</Value>';
														xmlString += '<OptionValue></OptionValue></Question>';

// 													}
												});
								var count=1;
								$($('input[name="input' + obj1 + '"]'))
										.each(
												function(i, obj) {
													id = $(obj).val();

													AttributeCodeID=$(obj).attr('id');
													var attributeRefferenceValue=id;
													if (!isNumeric(id)) {
														isValidate = false;
														
														addCssStyles($(obj).attr('id'),
																'Please enter digits only.');
														return false;
													} 																						
													else {
																				removeCssStyles($(obj).attr('id'));
													}	

													xmlString += '<Question><QuestionId>'
														+ obj1
														+ '</QuestionId>';
												xmlString += '<QuestionOptionId></QuestionOptionId><AttributeCodeID>'+AttributeCodeID+'</AttributeCodeID><Value>'+attributeRefferenceValue+'</Value>';
												xmlString += '<OptionValue>'
														+ id
														+ '</OptionValue></Question>';
													
												
												});
								$($('input[name="input_' + obj1 + '"]'))
								.each(
										function(i, obj) {
											var varid = $(obj).attr('id');
											var id = $(obj).val();
											
//												var compositeId=$(obj).attr('id');
											AttributeCodeID=$(obj).attr('id');
											var attributeRefferenceValue=id;
											
// 											isValidData=isNumeric(id);
// 											if(isManQuestionFill_text==false)
// 												{
// 												isValidData_text_chk=false;
// 												}

											if (!isNumeric(id)) {
												isValidate = false;
												
												addCssStyles($(obj).attr('id'),
														'Please enter digits only.');
												return false;
											} 																						
											else {
																		removeCssStyles($(obj).attr('id'));
											}
											
										
											
											xmlString += '<Question><QuestionId>'
												+ obj1
												+ '</QuestionId>';
										xmlString += '<QuestionOptionId></QuestionOptionId><AttributeCodeID>'+AttributeCodeID+'</AttributeCodeID><Value>'+attributeRefferenceValue+'</Value>';
										xmlString += '<OptionValue>'
												+ id
												+ '</OptionValue></Question>';
										
											
										
										});
								
										$($('select[name="' + obj1 + '"] :selected'))
										.each(
												function(i, obj) {
													id = $(obj).val();
									
													if ($(
															'select[name="'
																	+ obj1
																	+ '"]')
															.attr('multiple') == 'multiple') {
														xmlString += '<Question><QuestionId>'
																+ obj1
																+ '</QuestionId>';
														xmlString += '<QuestionOptionId>'
																+ id
																+ '</QuestionOptionId>';
														xmlString += '<OptionValue>_eof_</OptionValue></Question>';
													} else {
														xmlString += '<Question><QuestionId>'
																+ obj1
																+ '</QuestionId>';
														xmlString += '<QuestionOptionId>'
																+ id
																+ '</QuestionOptionId>';
														xmlString += '<OptionValue></OptionValue></Question>';
													}
												});

							});
			xmlString += "</Root>";
			 console.log("hello world="+xmlString); 
			$('body')
			.append(
					'<form name="financialStatusForm1" method="post" id="financialStatusForm1">');
			try{
			$('#XMlString').remove();
			$('#questionBankId').remove();
			$('#sectionTypeId').remove();
			}catch(e)
			{
				
			}
			$('#financialStatusForm1')
			.append(
					'<input  type="hidden" id="XMlString" name="XMlString" value="'+xmlString+'"/>');
			
			$('#financialStatusForm1')
			.append(
					'<input  type="hidden" id="questionBankId" name="questionBankId" value="'+questionBankId+'"/>');
			
			$('#financialStatusForm1')
			.append(
					'<input  type="hidden" id="sectionTypeId" name="sectionTypeId" value="'+sectionTypeId+'"/>');
			
			$('#financialStatusForm1')
			.append(
					'<input  type="hidden" id="sectionName" name="sectionName" value="Cashflow"/>');
			
			var counteri=0;
			$(".a1").each(function(i) {
				counteri=counteri+1;
				var id = $(this).attr('id');
				 //alert('id in row='+id)
				 id = id
					.substring(id
							.indexOf('question') + 8);
				var AttributeCodeID=id.substring(id.indexOf('_') + 1);
				var isMan=AttributeCodeID.substring(AttributeCodeID.indexOf('_') + 1);
	
			 var res = id.split("_");
			var questionId=res[0];

			if(counteri==1)
				{
				isManQuestionFill_radio1=validateDcInput_radio(isMan,questionId);
				isManQuestionFill_text1=validateDcInput(1,questionId);	
				
				if(isManQuestionFill_text1==false)
					{
						if(isManQuestionFill_radio1==false)
							{
							isValidQ1=false;
							}
						
					}
				else if(isManQuestionFill_text1==true)
					{
						if(isManQuestionFill_radio1==false)
						{
						isValidQ1=true;
						}
					}
				
				else if(isManQuestionFill_radio1==false)
				{
					if(isManQuestionFill_text1==false)
					{
						isValidQ1=false;
					}
				}
				else if(isManQuestionFill_radio1==true)
				{
					if(isManQuestionFill_text1==false)
					{
						isValidQ1=true;
					}
				}
				else if(isManQuestionFill_radio1==true)
				{
					if(isManQuestionFill_text1==true)
					{
						isValidQ1=true;
					}
				}
				

				}
			else if(counteri==2) {
				isManQuestionFill_radio2=validateDcInput_radio(isMan,questionId);
				isManQuestionFill_text2=validateDcInput(1,questionId);	
				if(isManQuestionFill_text2==false)
				{
					if(isManQuestionFill_radio2==false)
						{
						isValidQ2=false;
						}
					
				}
			else if(isManQuestionFill_text2==true)
				{
					if(isManQuestionFill_radio2==false)
					{
					isValidQ2=true;
					}
				}
			
			else if(isManQuestionFill_radio2==false)
			{
				if(isManQuestionFill_text2==false)
				{
					isValidQ2=false;
				}
			}
			else if(isManQuestionFill_radio2==true)
			{
				if(isManQuestionFill_text2==false)
				{
					isValidQ2=true;
				}
			}
			else if(isManQuestionFill_radio2==true)
			{
				if(isManQuestionFill_text2==true)
				{
					isValidQ2=true;
				}
			}
	
			}
			else{
				isManQuestionFill_text3=validateDcInput_text(1,questionId);	

			}
			
			
		

		
			});
			if(isValidQ1==false) 
			{
				
					showAlertMessage("Message", "Please Answer Mandatory Question.", "error",
							doNothing);
					 $('.ZebraDialog').css('top','250px');
					 return false;
				
				
				
			}
			else if(isValidQ2==false) 
			{
			
					showAlertMessage("Message", "Please Answer Mandatory Question.", "error",
							doNothing);
					 $('.ZebraDialog').css('top','250px');
					 return false;
			}
			else if(isManQuestionFill_text3==false)
				{
				showAlertMessage("Message", "Please Answer Mandatory Question.", "error",
						doNothing);
				 $('.ZebraDialog').css('top','250px');
				 return false;
				}
			else if(isValidData==false){
				showAlertMessage("Message", "Invalid Charactor,Please Enter Numeric Value.", "error",
						doNothing);
				 $('.ZebraDialog').css('top','250px');
				 return false;
			}
		else{
			
			$.ajax({
		         type : "POST",
		         url : $('#contextPath').val()+'/dc/insertDcFinancialStatusRecord.htm',
		         data :  $("#financialStatusForm1").serialize(), 
		         success : function(result) {

		        	 if(buttonType=='next')
						{
// 		        		 showAlertMessage1("Message",
// 		        					"<br/>Cashflow Section saved successfully.",
// 		        					"confirmation", redirectFurther);
// 		        		 $('.ZebraDialog').css('top','250px');
		        		 redirectFurther();
							
						}
		        	 else{
		        		 var isDatacollectionChange = $('#dcInputDocId_AnalysisReport').val();
		        			//alert('doc id in personal info='+isDocIdAvailable);
		        			if(isDatacollectionChange==0 || isDatacollectionChange=='0' || isDatacollectionChange==null )
		        				{
		        				 showAlertMessage1("Message",
				        					"<br/>Cashflow Section saved successfully.",
				        					"confirmation", doNothing);
				        		 $('.ZebraDialog').css('top','250px');
		        				}
		        			else{
		        				showAlertMessage("Success", "<br/>Cashflow Section saved successfully.Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", doNothing);		
		        			}
		        	 }
		        	
		         }
			
		         });
			
		}
			
		}
		function redirectFurther(){
		
			if(isContainsLoan==true)
			{
				if(isContainsSuccession==true)
				{
					window.location.href = $('#contextPath').val()+'/DCFutureFinancialExpectationShubhchintak.htm';
				}
				else{
					window.location.href=$('#contextPath').val()+'/SuccessionPlan.htm';
				}
			}
			else{
				window.location.href=$('#contextPath').val()+'/Loan.htm';
			}
			
		}
		function validateDcInput(isMandatory, questionId)
		{
			//alert('value==='+$('input[name="input_'+questionId+'"]').val());
			if(isMandatory==1)
				{
				
				if($('input[name="input_'+questionId+'"]').val()=='')
					{
					return false;
					}
				else{
					return true;
				}
				}	
			
		}
		function validateDcInput_text(isMandatory, questionId)
		{
			//alert('value==='+$('input[name="input_'+questionId+'"]').val());
			if(isMandatory==1)
				{
				
				if($('input[name="input'+questionId+'"]').val()=='')
					{
					return false;
					}
				else{
					return true;
				}
				}	
			
		}
		function validateDcInput_radio(isMandatory, questionId)
		{
// 			alert($('input[name="'+questionId+'"]:checked').val());
// 			alert('isMandatory='+isMandatory)
			if($('input[name="'+questionId+'"]:checked').val()==undefined && isMandatory==1)
				{
					return false;
				}
			else{
				return true;
			}
		}
		function Next(){
			if (validateInfo()) {
				//alert($('#photograph_browse').val());
				//$('form').append('<input type="hidden" name="next" value="yes">');	
				$('#next').val('yes');
				document.saveLeadDetailsPathFinderForm.submit();
			} else {
				return;
			}
			//window.location.href=$('#context').val()+"/partner/PathFinder/FinancialStatus.jsp";
		}
		
// 		$('.side-bar').css('margin-top','-32px');
	$('.survey-links').css('margin-top','1px');
	function addNotes(){
		window.location.href=$('#context').val()+'/Utility/PathFinder/AddNotes.jsp?notesType=currrentFinStatus';
	}
	</script>
</html>