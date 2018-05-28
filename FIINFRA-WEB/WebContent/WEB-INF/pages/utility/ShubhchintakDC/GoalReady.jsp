<!DOCTYPE html>
<html lang="en"><head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Financial Plan - Current Financial Status: Goal Readiness</title>
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
                     <input class="dcbutton btn btn-primary btn-xs" type="button" value="Exit"  id="exit" onclick="redirectToOpportunity()"  name="Exit">
                    </div>
                  </div>
      
    	
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      <div class="row">
       <div class="col-md-3" style="padding-left:10px;"><img src="images/${sessionScope.userSession.themeName}/currentf.jpg"></div>
      <div class="col-md-6 dchead " style="padding-left:10px;">FINANCIAL PLAN</div>
       	<div class="col-md-3" style="text-align:right;"><img src="" id="headimg"></div>
      </div>
      
        <!-- center -->
     
      <jsp:include page="sidebar.jsp">
		<jsp:param name="param1" value="goal" />
	</jsp:include>
        <div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">Current Financial Status</a>
     
           <div class="list-group-item">
       <div class="">
     
	<img src="images/${sessionScope.userSession.themeName}/currentfstatus.png"  class="img-responsive"> 
          <!-- end-->
           <div class="widget-box" style="margin-top:10px;">
        
          
          <div class="widget-header">
          <h4 class="widget-title lighter smaller"> <a id="extendedfamily"></a>Goal Readiness</h4>
         </div>
          <div class="widget-body clearfix">
          <div class="widget-main">
          <div id="goalReadyQuestion">
          
          </div>
                	
             </div>   	
       <div class="topmenu col-md-12 rightAlign southspace2">           
 <input class="btn dbtn btn-xs btn-primary southspace1" type="button" value="Save" onclick="save('save')" name="Save"> 

     <input class="btn dbtn btn-xs btn-primary southspace1" type="button" value="Cancel" name="Cancel" onclick="redirectDcInput()"> 
       
      <input class="btn dbtn btn-xs btn-primary southspace1" type="button" onclick="save('next')" value="Next" name="Next">        
        </div>
            </div>                                      
          </div>
          <!-- end-->
          <!--END -->
      
        </div>
       
        
        
    </div>
</div>
</div></div>      	<br/><br/>
       	</div>
</div>
      
<!-- Center part End -->          

<jsp:include page="../../common/footer.jsp" />

</body>
	<script>
	var questionList = new Array();
	var questionListToIterate = new Array();
	var sectionTypeId = 39005;
	var questionBankId = 27;
	var isContainsRiskCover;
	var isContainsEmergencyR
	var isContainsCahflow;
	var isContainsRiskProfile;
	var isContainsSuccession;
	var isContainsRetirment;
	var isContainsGoal;
	var isContainsLoan;
	var sectionarray;
// 	var $jq_1_9_2 = $.noConflict();
				function selectOption(id, name) {
			try{			
			var text=$('#'+id+'[name="'+name+'"]').val();
			if(text=='No' || text=='no'){	
				
				//alert(questionList);
				$(questionList).each(function(i,obj){
					//alert(obj.parentQuestion);
					if(obj.parentQuestion==name){						
// 						alert('id is:--'+obj.questionId)
						
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
					//alert(obj.parentQuestion);
					if(obj.parentQuestion==name){
						$('#'+obj.questionId).removeAttr('disabled');
						$('#'+obj.questionId).val('');
						$('input[name="'+obj.questionId+'"]').removeAttr('disabled');
					}
					
				});
			}
// 			alert('id:--'+id+':---name----'+name)
			$('#'+id+'[name="'+name+'"]').attr('checked','checked');
// 			event.preventDefault();
			}
			catch(e){
// 				alert(e);
				$('#'+id+'[name="'+name+'"]').attr('checked','checked');
			}
			
		}
		
				$(document)
				.ready(
						function() {
// 							$('#dcinputname').attr('margin-left','5px');
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
//							            	alert('SectionType=='+SectionType);
						            	if(SectionType==39005){
						            	$("#headimg").attr("src",$('#contextPath').val()+"/images/${sessionScope.userSession.themeName}/"+Image);
						            	$(obj).find('Question').each(function(j,obj){
						            	var Id = $(this).attr('ID');
						            	questionList.push(Id);
						         		var QuestionType = $(this).attr('QuestionType');
						         		var attributeCodeIdQuestion = $(this).attr('AttributeCodeID');
//							            	alert('QuestionType='+QuestionType)
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
											// 																	alert("in if")

										} else {
											// 																	alert("in else")
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
											'#goalReadyQuestion')
											.append(
													'<div class="answerbg southspace2 clearfix" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
						            	
						           		for (var i=0;i<optionList.length;i++)
						           			{
							           			$('#question'+Id+'tr')
												.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
						           			}
						           		
						            	}
						           		else if(QuestionType==85007)
					           			{
//							           			alert('j='+j+' question='+question);
						           			if(j==1){
						           				$(
												'#goalReadyQuestion')
												.append(
														'<div class="answerbg southspace2 clearfix" id="question'+attributeCodeIdQuestion+'"><div class="col-md-12 searchpadding padding_top" id="a"> <div class="col-md-4"><ul id="question'+Id+'tr"><li>'+question+'</li></ul></div></div></div> <div class="col-md-12 dcnote">*(Don\'t include the property you stay in)</div><div class="col-md-12">&nbsp;</div> ');	
						           				
						           		
						           			}else if(j==2){
						           				$(
												'#a')
												.append(
														' <div class="col-md-4"> <ul id="question'+Id+'tr"><li>'+question+'</li></ul></div>');
						           			}
						           			else{
						           				$(
												'#a')
												.append(
														' <div class="col-md-4"> <ul id="question'+Id+'tr"><li>'+question+'</li><li>&nbsp;</li></ul></div>');	
						           			}
						           			
						           		 for (var i=0;i<optionList.length;i++)
						           			{
						           			 if(Id==5000){
						           				$('#question'+Id+'tr')
												.append('<li>'+optionList[i]+'<input name="input'+attributeCodeIdQuestion+'" onkeyup="allowIntegersOnlyUpToHundred(id,event)" onblur="allowIntegersOnlyUpToHundred(id,event)" onmouseout="allowIntegersOnlyUpToHundred(id,event)" onkeydown="allowIntegersOnlyForGoal(id,event)" maxlength="3" class="form-control" placeholder="Values (in %)" width="50px !important;"  type="text" id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'"  /><span class="amountinword" id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'moneyText"></span></li>');
						           			 }else{
						           				$('#question'+Id+'tr')
												.append('<li>'+optionList[i]+'<input name="input'+attributeCodeIdQuestion+'"    onkeydown="allowIntegersOnly(id,event)" class="form-control" placeholder="Values (in Rs.)" width="50px !important;" onkeyup="test_skill(id);updatePercentageavailToGoal(id,event)" maxlength="9" type="text" id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'"  /><span class="amountinword" id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'moneyText"></span></li>'); 
						           			 }
						           			
							           				
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
//					 									alert('questionType='+obj.questionType);
//					 										if(obj.sectionType==85004 || obj.sectionType==85001){
																$('#'+obj.attributeCodeId+'_'+obj.attributeValue).val(obj.attributeRefferenceValue);
															if(obj.questionType=='85007')
																{
																	//alert('in first if='+obj.questionId);
																	$('#'+obj.attributeCodeId+'_'+obj.attributeValue).val(obj.attributeRefferenceValue);
																}
															else{
																selectOption(
																		'option'
																				+ obj.attributeValue+'_'+obj.attributeCodeId+'_'+obj.attributeRefferenceValue,
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
			
							
							
							
								
																
							
							
							

							// 							alert(questionListToIterate)									
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
			var isValidateNumbers = false;
			$(questionListToIterate)
			.each(
					function(i, obj1) {
						// 				alert($('a[name="' + obj + '"]').html());
						$($('input[name="' + obj1 + '"]:checked'))
								.each(
										function(i, obj) {
											id = $(obj).attr('id');
											id = id
													.substring(id
															.indexOf('option') + 6);
//												alert('id='+id);
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
											//alert('AttributeCodeID in 1 if='+AttributeCodeID);
											//alert('AttributeCodeID==='+AttributeCodeID);
											// 					alert($(obj).attr('class'));
//												if ($(obj).attr('class') == 'selected') {
												xmlString += '<Question><QuestionId>'
																+ obj1
																+ '</QuestionId>';
														xmlString += '<QuestionOptionId>'
																+ id
																+ '</QuestionOptionId><AttributeCodeID>'
																+AttributeCodeID
																+'</AttributeCodeID><Value>'+attributeRefferenceValue+'</Value>';
														xmlString += '<OptionValue></OptionValue></Question>';

//												}
										});
						var count=1;
// 						alert('AttributeCodeID='+AttributeCodeID);
						$($('input[name="input'+obj1+'"]'))
								.each(
										function(i, obj) {
												id = $(obj).val();
												var compositeId=$(obj).attr('id');
												var arrOfSplitedId = compositeId.split('_');
												var AttributeCodeID=arrOfSplitedId[0];
												var AttributeCodeIdOption=arrOfSplitedId[1];
												var attributeRefferenceValue=id;
// 												alert('value='+id);
// 												alert('AttributeCodeID Question='+AttributeCodeID);
// 												alert('AttributeCodeIdOption='+AttributeCodeIdOption);
// 												alert(obj1+':'+id);
												//								alert(id.indexOf('%'));
//																					for(var i=1;i<8;i++){
																					
																					if (!ValidateDecimal(id, 18, 2)) {
																						//alert(i+'----------------'+$('#input'+obj1+'_'+i).val());
																						isValidate = false;
																						addCssStyles('input'
																								+obj1+'_'+count,
																								'Please enter valid Amount.');
																					} 																						
																					else {
																												removeCssStyles('input'
																														+ obj1+'_'+count);
																					}					
//																					}
//								xmlString += '<Question><QuestionId>'
//										+ obj1
//										+ '</QuestionId>';
//								xmlString += '<OptionId></OptionId>';
//								xmlString += '<OptionValue>'
//										+ id
//										+ '</OptionValue></Question>';
//										alert(xmlString );
									count++;
										
											if (!isNumeric(id)) {
												isValidate = false;
												isValidateNumbers =false;
												addCssStyles($(obj).attr('id'),
														'Please enter digits only.');
												return false;
											} 																						
											else {
																		removeCssStyles($(obj).attr('id'));
											}	
											isValidateNumbers=isNumeric(id);
											//alert('isValidate='+isValidateNumbers  + ' for AttributeCodeID='+AttributeCodeID + ' id '+id );

											xmlString += '<Question><QuestionId>'
												+ obj1
												+ '</QuestionId>';
										xmlString += '<QuestionOptionId>'+AttributeCodeIdOption+'</QuestionOptionId><AttributeCodeID>'+AttributeCodeID+'</AttributeCodeID><Value>'+attributeRefferenceValue+'</Value>';
										xmlString += '<OptionValue></OptionValue></Question>';
											
										
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
											// 													alert(arg)
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
	//alert('xmlString='+xmlString);
	//console.log();
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
				'<input  type="hidden" id="sectionName" name="sectionName" value="GoalReady"/>');
		
		
		$.ajax({
	         type : "POST",
	         url : $('#contextPath').val()+'/dc/insertDcFinancialStatusRecord.htm',
	         data :  $("#financialStatusForm1").serialize(), 
	         success : function(result) {
	          
	        	 if(buttonType=='next')
					{
// 	        		 showAlertMessage1("Message",
// 	        					"<br/>Goal Readiness Section saved successfully.",
// 	        					"confirmation", redirectFurther);
// 	        		 $('.ZebraDialog').css('top','250px');
	        		 redirectFurther();
						
					}
	        	 else{
	        		 
	        		 var isDatacollectionChange = $('#dcInputDocId_AnalysisReport').val();
	        			//alert('doc id in personal info='+isDocIdAvailable);
	        			if(isDatacollectionChange==0 || isDatacollectionChange=='0' || isDatacollectionChange==null )
	        				{
	        				 showAlertMessage1("Message",
	 	        					"<br/>Goal Readiness Section saved successfully.",
	 	        					"confirmation", doNothing);
	 	        		 $('.ZebraDialog').css('top','250px');
	        				}
	        			else{
	        				showAlertMessage("Success", "<br/>Goal Readiness Section saved successfully.Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", doNothing);		
	        			}
	        		
	        	 }	         }
	         });
			
					
		}
		function redirectFurther(){
			
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