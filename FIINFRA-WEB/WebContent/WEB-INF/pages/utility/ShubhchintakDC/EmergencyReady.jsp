<!DOCTYPE html>
<html lang="en">
		<head>
		<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
		<title>Financial Plan - Current Financial Status: Emergency Readiness</title>
		<link href="css/Axis_dc.css" rel="stylesheet">
		<script>
	
	
		</script>
		</head>
		<body>
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">
<input type="hidden" id="section" value="${sessionScope.Section}"/>
<input type="hidden" name="dcInputDocId_AnalysisReport" id="dcInputDocId_AnalysisReport" value="${sessionScope.dcInputDocId_AnalysisReport}">
<input type="hidden" name="redirectToPage" id="redirectToPage" value="${sessionScope.redirectToClient}">
<form action="" name="showPathFinderOutputPdfForm" method="post" >
        </form>

<!--css popup window start 1-->

<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
<!--css popup window start 1-->

<section>
<div class="">

        
      <div class="page-header clearfix">
                    <h1 class="pull-left"><span id="dcinputname"> Financial Plan for&nbsp;<i class="fa icon-opportunity"></i></span></h1>
                    <div class="pull-right">
                     <input class="dcbutton btn btn-primary btn-xs" type="button" value="Exit"  id="exit" onclick="redirectToOpportunity()"  name="Exit">
                    </div>
                  </div>  
        
<div class="container-body " style="padding:5px;"> </div>
<div class="container-body">
<div class="row">
          <div class="col-md-3" style="padding-left:10px;"><img src="images/${sessionScope.userSession.themeName}/currentf.jpg"></div>
          <div class="col-md-6 dchead " style="padding-left:10px;">FINANCIAL PLAN</div>
          <div class="col-md-3" style="text-align:right;"><img src="" id="headimg"></div>
        </div>

<!-- center -->

<jsp:include page="sidebar.jsp">
		<jsp:param name="param1" value="Emergency" />
	</jsp:include>
<div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
  
  <!-- center -->
  
  <div class="list-group"><a class="list-group-item active" href="#">Current Financial Status</a>
    <div class="list-group-item">
      <div class="">
        <!-- About You Start-->
        <!-- About You Start-->
       <div class="col-md-12"> <img src="images/${sessionScope.userSession.themeName}/currentfstatus.png"  class="img-responsive"></div>
       <div class="clearfix"></div>
        <!-- end-->
        <div class="widget-box" style="margin-top:10px;">
          <div class="widget-header">
          <h4 class="widget-title lighter smaller"> <a id="extendedfamily"></a>Emergency Readiness</h4>
         </div>
          <div class="widget-body clearfix">
          <div class="widget-main">
          <span><br>
            </span>
            <!--1 start -->
            
            <div id="emergencyQuestion" class="col-md-12 clearfix"></div>
            
            <!--5 end -->
            </div>
        <div class="topmenu col-md-12 rightAlign southspace2">
          <input class="btn btn-xs btn-primary dbtn southspace1" type="button" value="Save" onclick="save('save')" name="Save">
          <input class="btn btn-xs btn-primary dbtn southspace1" type="button" value="Cancel" name="Cancel" onclick="redirectDcInput()">
          <input class="btn btn-xs btn-primary dbtn southspace1" type="button" onclick="save('next')" value="Next" name="Next">
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
// 	var $jq_1_9_2 = $.noConflict();
var questionListToIterate = new Array();
var questionList = new Array();
var selectedQuetionOptionList ;
var sectionTypeId = 39001;
var isMan=0;
var questionBankId = 27;
var isValidData;
var isContainsRiskCover;
var isContainsEmergencyR
var isContainsCahflow;
var isContainsRiskProfile;
var isContainsSuccession;
var isContainsRetirment;
var isContainsGoal;
var isContainsLoan;
var sectionarray;
				function selectOption(id, name) {
			try{			
			var text=$('#'+id+'[name="'+name+'"]').val();
			
		//	$('#94516').attr('disabled','disabled');
				if(text.trim()=="Others")
				{

					$('#94516').removeAttr('disabled');
				}
			else
				{
				
					$('#'+94516).val('');
					$('#94516').attr('disabled','disabled');
					
				
				}
				
			
/* 			if(qCI!=undefined){
			if(qCI.trim()=="Yes")
			{
			
				$('input[name=input94516]').removeAttr('disabled');
				$('input[name=input94516]').attr("disabled", false);
			}
			else{
				
				$('input[name=input94516]').val('');
			$('input[name=input94516]').attr("disabled", true);
			}  */
			
			if(text=='No' || text=='no'){	
				
			
				$(questionList).each(function(i,obj){
			
					if(obj.parentQuestion==name){						

						
						$('input[name="'+obj.questionId+'"]').attr('disabled','disabled');
						$('input[name="'+obj.questionId+'"]').attr('checked',false);
						$('#'+obj.questionId).attr('disabled','disabled');
						$('#'+obj.questionId).val('');

						
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

			}
			catch(e){

				$('#'+id+'[name="'+name+'"]').attr('checked','checked');
			}
			var abvg =$("input[name=94002]:checked").val();

		if(abvg!=undefined){
			if(abvg.trim()=="Yes")
			{
		
				$('input[name=94137]').removeAttr('disabled');
				$('input[name=94137]').attr("disabled", false);
				
				
			}
			else{
	
	
				$('input[name=94137]').prop( "checked", false );	
			$('input[name=94137]').attr("disabled", true);
			
			}
		}else{
				
		
		}
				
			
		}
		
		
		$(document)
				.ready(
						function() {
							$('#dcinputname').append($('#dcInputUsername').val());
							
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
						            	var SectionName = $(this).attr('Name');
						            	var SectionType = $(this).attr('SectionType');
						            	var Image = $(this).attr('ImagePath');


										if(SectionType==39001){
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
						           		'#emergencyQuestion')
										.append(
												'<div class="answerbg southspace2 clearfix" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top" id="question'+Id+'_'+IsMandatory+'">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div><div class="clearfix"></div>  ');
						            	
						           		for (var i=0;i<optionList.length;i++)
						           			{
						           			$('#question'+Id+'tr')
											.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
						           			}
						           		}
						           		else if(QuestionType==85002)
						           			{
						           		 	$(
						           		 		'#emergencyQuestion')
												.append(
														'<div class="answerbg southspace2 clearfix" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top" id="question'+Id+'_'+IsMandatory+'">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div><div class="clearfix"></div>  ');
						           			
							           		 for (var i=0;i<optionList.length;i++)
							           			{
							           			$('#question'+Id+'tr')
							           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
							           			}
						           			}
						           		
						           		else if(QuestionType==85001)
					           			{
						           		 	$(
											'#emergencyQuestion')
											.append(
													'<div class="answerbg southspace2 clearfix" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top" id="question'+Id+'_'+IsMandatory+'">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div><div class="clearfix"></div>  ');
						           		 for (var i=0;i<optionList.length;i++)
						           			{
							           			$('#question'+Id+'tr')
							           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="checkbox" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
							           		 
						           			}	
					           			
					           			}
						           		else if(QuestionType==85004 )
					           			{
						           			if(IsMandatory==1)
						           			{
						           				$(
												'#emergencyQuestion')
												.append(
														'<div class="answerbg southspace2 clearfix" ><div class="a" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5  searchpadding padding_top" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'">'+question+'<span class="red">*</span></div> <div class="col-md-7 searchpadding padding_top" id="question'+attributeCodeIdQuestion+'tr"></div></div><div class="clearfix"></div>  ');
							           		
							           			
							           			for (var i=0;i<optionList.length;i++)
							           			{
							           	//			alert("optionList=="+optionList);
							           				$('#question'+attributeCodeIdQuestion+'tr')
							           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
							           			}	
						           			}
						           			else
						           			{
						           				$(
												'#emergencyQuestion')
												.append(
														'<div class="answerbg southspace2 clearfix" ><div class="a" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5  searchpadding padding_top" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+attributeCodeIdQuestion+'tr"></div></div><div class="clearfix"></div>  ');
							           		
							           			
							           			for (var i=0;i<optionList.length;i++)
							           			{
							           	//			alert("optionList=="+optionList);
							           				$('#question'+attributeCodeIdQuestion+'tr')
							           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
							           			}		
						           			}
					           			
					           			}
					           			else if(QuestionType==85005)
					           			{
					           				
					           				$(
						           		 	'#emergencyQuestion')
											.append(
													'<div class="answerbg southspace2 clearfix" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
					           			
						           		 	for(var i=0;i<optionList.length;i++)
						           		 		{ 
						           		 			
						           		 		$('#question'+Id+'tr')
												.append('<input type="text" class="form-control" name="input'+attributeCodeIdQuestion+'"  id="'+attributeCodeIdQuestion+'" value="" /><span class="" id="'+attributeCodeIdQuestion+'"></span>');	
								           			
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
											
											//selectedQuetionOptionList=result;
											$(result)
											.each(
													function(i, obj) {
					 							
//					 										if(obj.sectionType==85004 || obj.sectionType==85001){
																
															if(obj.questionType=='85005')
																{
																	//$('#'+obj.questionId+'_'+obj.attributeCodeId).val(obj.attributeValue);
																$('#'+obj.questionId).val(obj.attributeValue);
															
																}
															else if(obj.questionType=='85001')
																{
																selectOption(
																		'option'
																				+ obj.attributeValue+'_'+obj.attributeCodeId+'_',
																		obj.questionId);
																$(
																		'#select'
																				+ obj.questionId)
																		.val(
																				obj.attributeValue);
																}
															else{
																var attributeReferenceValue=obj.attributeRefferenceValue;
																if(obj.attributeCodeId==94009){
																	if(attributeReferenceValue==1 || attributeReferenceValue==3){
																		attributeReferenceValue=2;
																	}else if(attributeReferenceValue==4 || attributeReferenceValue==6){
																		attributeReferenceValue=5;
																	}else if(attributeReferenceValue>=7 && attributeReferenceValue<=9){
																		attributeReferenceValue=8;
																	}else if(attributeReferenceValue==10 || attributeReferenceValue==11){
																		attributeReferenceValue=11;
																	}
																	else if(attributeReferenceValue==12){
																		attributeReferenceValue=12;
																	}
																	
																}
																
											
																selectOption(
																		'option'
																				+ obj.attributeValue+'_'+obj.attributeCodeId+'_'+attributeReferenceValue,
																		obj.questionId);
																$(
																		'#select'
																				+ obj.questionId)
																		.val(
																				obj.attributeValue);
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


												});
								var count=1;
								$($('input[name="input' + obj1 + '"]'))
										.each(
												function(i, obj) {
													id = $(obj).val();
													var compositeId=$(obj).attr('id');
													AttributeCodeID=compositeId.substring(compositeId.indexOf('_')+1);
												/* 	if (!isNumeric(id)) {
														isValidate = false;
														
														addCssStyles($(obj).attr('id'),
																'Please enter digits only.');
														return false;
													} 																						
													else {
																				removeCssStyles($(obj).attr('id'));
													}	
 */
													xmlString += '<Question><QuestionId>'
														+ obj1
														+ '</QuestionId>';
												xmlString += '<QuestionOptionId></QuestionOptionId><AttributeCodeID>'+AttributeCodeID+'</AttributeCodeID>';
												xmlString += '<OptionValue>'
														+ id
														+ '</OptionValue><Value>'+id+'</Value></Question>';
													
												
												});
								$($('input[id="' + obj1 + '_tf"]'))
								.each(
										function(i, obj) {
											id = $(obj).val();
										
											
												
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
										xmlString += '<QuestionOptionId></QuestionOptionId>';
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
			 try{
					$('#XMlString').remove();
					$('#questionBankId').remove();
					$('#sectionTypeId').remove();
					}catch(e)
					{
						
					}
			$('body')
			.append(
					'<form name="financialStatusForm1" method="post" id="financialStatusForm1">');
			$('#financialStatusForm1')
			.append(
					'<input  type="hidden" id="questionBankId" name="questionBankId" value="'+questionBankId+'"/>');
			
			$('#financialStatusForm1')
			.append(
					'<input  type="hidden" id="sectionTypeId" name="sectionTypeId" value="'+sectionTypeId+'"/>');
			
			$('#financialStatusForm1')
			.append(
					'<input  type="hidden" id="XMlString" name="XMlString" value="'+xmlString+'"/>');
			
			$('#financialStatusForm1')
			.append(
					'<input  type="hidden" id="sectionName" name="sectionName" value="EmergencyReady"/>');
			
			 $(".a").each(function(i) {
				 var id = $(this).attr('id');
				 id = id
					.substring(id
							.indexOf('question') + 8);
				var AttributeCodeID=id.substring(id.indexOf('_') + 1);
				var isMan=AttributeCodeID.substring(AttributeCodeID.indexOf('_') + 1);
				 //alert('isMan='+isMan);
			 var res = id.split("_");
			var questionId=res[0];
			if(isMan==94009){
				isValidData=validateDcInput(1,questionId);	
			}
			
			 
			
				});
			 if(isValidData==false)
				{
				showAlertMessage("Message", "Please Answer Mandatory Question.", "error",
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
								redirectFurther();
							}
			        	 else{
			        		 var isDatacollectionChange = $('#dcInputDocId_AnalysisReport').val();

			        			if(isDatacollectionChange==0 || isDatacollectionChange=='0' || isDatacollectionChange==null )
			        				{
			        				 showAlertMessage1("Message",
					        					"<br/>Emergency Section saved successfully.",
					        					"confirmation", doNothing);
					        		 $('.ZebraDialog').css('top','250px');
			        				}
			        			else{
			        				showAlertMessage("Success", "<br/>Emergency Section saved successfully.Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", doNothing);		
			        			}
			        		
			        	 }
			         }
			         });
			}
			
			

				
		}
		
		function redirectFurther(){
			
			if(isContainsRiskCover==true){
				
				if(isContainsGoal==true){
					
					if(isContainsRetirment==true){
						if(isContainsCahflow==true)
							{
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
						else{
							window.location.href=$('#contextPath').val()+'/Cashflow.htm';
						}
						
					}
					else{
						window.location.href=$('#contextPath').val()+'/RetirementPlaning.htm';
					}
				}
				else{
					window.location.href=$('#contextPath').val()+'/GoalReady.htm';
				}
				
			}
			else{
				window.location.href=$('#contextPath').val()+'/RiskCover.htm';
			}
			
		}

		function validateDcInput(isMandatory, questionId)
		{
			
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
				$('#next').val('yes');
				document.saveLeadDetailsPathFinderForm.submit();
			} else {
				return;
			}
		
		}
		

	$('.survey-links').css('margin-top','1px');
	function addNotes(){
		window.location.href=$('#context').val()+'/Utility/PathFinder/AddNotes.jsp?notesType=currrentFinStatus';
	}
	</script>
</html>