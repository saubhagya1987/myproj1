<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Financial Plan - Risk Profile</title>
 <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!--<script src="js/jquery-1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-responsive.js"></script>
    <script src="js/bootstrap-responsive.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/holder.js"></script>
-->
    


<!-- -responsive css-->
<!--<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/popup.css" />
--><link href="css/Axis_dc.css" rel="stylesheet">
<!-- -responsive css-->
	<!--<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/pop.js"></script>
	<script src="js/jquery-1.9.1.js"></script>
	<script src="js/jquery.ui.core.js"></script>
	<script src="js/jquery.ui.widget.js"></script>

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
-->


<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

</head>
<body>
<!--css popup window start 1-->
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">
<input type="hidden" id="section" value="${sessionScope.Section}"/>
<input type="hidden" name="dcInputDocId_AnalysisReport" id="dcInputDocId_AnalysisReport" value="${sessionScope.dcInputDocId_AnalysisReport}">
<input type="hidden" name="redirectToPage" id="redirectToPage" value="${sessionScope.redirectToClient}">
<form action="" name="showPathFinderOutputPdfForm" method="post" >
</form>
<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
 	
 <!-- Center part start -->
 <section>
   
    <div class="container ">
    	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;">
          <span style="float:left; font-weight:bold;" id="dcinputname"> Financial Plan for<i class="opportunityicon"></i></span>  
          <span> 
          <input class="dcbutton" type="button" value="Exit" onclick="redirectToOpportunity()" name="Exit"></span>
        </div>
      </div>
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      <div class="col-md-12">
       <div class="col-md-3" style="padding-left:10px;"><img src="images/${sessionScope.userSession.themeName}/riskprofile.jpg"></div>
      <div class="col-md-6 dchead " style="padding-left:10px;">FINANCIAL PLAN</div>
       <!--	<div class="col-md-3" style="text-align:right;"><img src="images/succession_readiness.gif" ></div>-->
      </div>
      
<!-- center -->
    <jsp:include page="sidebar.jsp">
		<jsp:param name="param1" value="riskProfilelink" />
	</jsp:include>

 <div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">Risk Profile</a>
                <!-- accordion start-->
           <!-- accordion  END -->
           <!-- accordion End -->
                
           <div class="list-group-item">
     
		<div class="row">
        <!-- About You Start-->
        <!-- About You Start-->
	<img src="" id="headimg" class="img-responsive"> 
          <!-- end-->
           <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading"> Risk Profile <span id="profileName"></span></div>
          <div class="panel-body" id="riskProfile">
            <!--1 start -->
         
        
          
            <!--4 start -->
            
           
            
             
        
           
          <!--6end -->   	
              
         
            </div>                                      
          </div>
            <div class="col-md-12 dcnote red"> This page is MANDATORY</div>
          <!-- end-->
          <!--END -->
      <div class="topmenu pull-right">           
       <input class="btn-primary btn btn-xs" type="button" value="Save" onclick="save('save')" name="Save"> 
        <input class="btn-primary btn btn-xs" type="button" value="Cancel" name="Cancel" onclick="redirectDcInput()"> 
        <input class="btn-primary btn btn-xs" type="button" onclick="save('next')"  value="Next" name="Next">    
        </div>
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
	var sectionTypeId = 39009;
	var questionBankId = 28;
	var isValidData;
	var isContainsRiskCover;
	var isContainsEmergencyR;
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
// 										            	alert('SectionType=='+SectionType);
										            	if(SectionType==39009){
										            		/*showing head Image*/
										            	$("#headimg").attr("src",$('#contextPath').val()+"/images/${sessionScope.userSession.themeName}/"+Image);
										            	$(obj).find('Question').each(function(j,obj){
										            	var Id = $(this).attr('ID');
										            	questionList.push(Id);
										         		var QuestionType = $(this).attr('QuestionType');
										         		var attributeCodeIdQuestion = $(this).attr('AttributeCodeID');
// 										            	alert('QuestionType='+QuestionType)
										            	var ControlType = $(this).find('ControlType').text();
										            	var ParentQuestionId=$(this).attr('ParentQuestionId');
										            	var question=$(this).find('QuestionText').text();
										            	
										            	var IsMandatory = $(this).find('IsMandatory').text();
										            	var optionList =[];
										            	var optionIdList =[];
										            	var AttributeCodeIDList=[]
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
													
										            	QuestionType=85004;
										            	if(QuestionType==85004 || QuestionType==85020)
										            	{
										            		if((j+1)%2==0){
										            			$(
																'#row'+j)
																.append(
																		' <div class="col-md-1" ></div> <div class="col-md-6 a riskprofile searchpadding padding_top" id="question'+attributeCodeIdQuestion+'"><strong>'+(j+1)+'.'+question+'</strong> <ul id="question'+attributeCodeIdQuestion+'tr"></ul></div>');
										            		}else{
										            			$(
																'#riskProfile')
																.append(
																		'<div class="row" id="row'+(j+1)+'">  <div class="col-md-5 a riskprofile searchpadding padding_top" id="question'+attributeCodeIdQuestion+'"><strong>'+(j+1)+'.'+question+'</strong> <ul id="question'+attributeCodeIdQuestion+'tr"></ul></div></div>');
										            		}
										           		
										            	
										           		for (var i=0;i<optionList.length;i++)
										           			{
											           			$('#question'+attributeCodeIdQuestion+'tr')
																.append(' <li><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" />'+optionList[i]+'</li>');	
										           			}
										           		
										            	}
										           	 });
													}
										            	
										            	});
										            	
												}/*closing of bu condition*/
											            
										        	});/*close reading Bu tag*/
										        	
										        	$('input[type="radio"]').css('margin-right','5px');
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
									 									//alert('in success of ajax profile='+obj.profile);
									 									$('#profileName').empty();
									 									if(obj.profile=='null' || obj.profile==null){
									 										
									 									}else{
									 										$('#profileName').html(':'+obj.profile);
									 									}
									 									
//									 										if(obj.sectionType==85004 || obj.sectionType==85001){
																				
																			if(obj.questionType=='85009' || obj.questionType=='85020')
																				{
																					//alert('in first if='+obj.questionId);
																					$('#'+obj.questionId+'_'+obj.attributeCodeId+'_'+obj.attributeRefferenceValue).val(obj.attributeValue);
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
																			
//									 										}
//									 										else{
//									 											$('#'+obj.questionId+'_'+obj.attributeCodeId).val(obj.attributeValue);
//									 										}
																			
//									 										$('#'+obj.questionId+'_'+obj.attributeCodeId).val(obj.attributeValue);
																		
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
											
// 											alert('AttributeCodeID='+AttributeCodeID);
// 											alert('value='+id);
											
												//alert(":::"+count);
// 												id=$('#input'+obj1).val();
												var compositeId=$(obj).attr('id');
												AttributeCodeID=compositeId.substring(compositeId.indexOf('_')+1);
// 												alert(value)
												//alert(obj1+':'+id);
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
										'<AttributeCodeID>'+AttributeCodeID+'</AttributeCodeID>';
										xmlString += '<OptionValue>'
												+ id
												+ '</OptionValue></Question>';
											
										
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
// 	alert('xmlString='+xmlString);
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
				'<input  type="hidden" id="sectionName" name="sectionName" value="Risk Profile"/>');
		
		$(".a").each(function(i) {
			 var id = $(this).attr('id');
// 			alert('id==='+id);
			 id = id
				.substring(id
						.indexOf('question') + 8);
			
			// alert('id='+id);
			 var AttributeCodeID=id;
			 var isMan=AttributeCodeID.substring(AttributeCodeID.indexOf('_') + 1);
			// alert('AttributeCodeID='+AttributeCodeID);
// 		 var res = id.split("_");
// 		var questionId=res[0];

	isValidData= validateDcInput(AttributeCodeID);
// 	alert('isValidData='+isValidData);
if(isValidData==false)
	{
	showAlertMessage("Message", "Please Answer All Questions.", "error",
			doNothing);
	 $('.ZebraDialog').css('top','250px');
	return false;
	}
	
		//alert('isValid Data='+isValidData) ;
		
			});
		
		if(isValidData==true)
			{
			$.ajax({
		         type : "POST",
		         url : $('#contextPath').val()+'/dc/insertDcFinancialStatusRecord.htm',
		         data :  $("#financialStatusForm1").serialize(), 
		         success : function(result) {
		          
		        	 if(buttonType=='next')
						{
// 		        		 showAlertMessage1("Message",
// 		        					"<br/>Risk Profile Section saved successfully.",
// 		        					"confirmation", redirectFurther);
// 		        		 $('.ZebraDialog').css('top','250px');
		        		 redirectFurther();
							
						}
		        	 else{
		        		 var isDocIdAvailable = $('#dcInputDocId_AnalysisReport').val();
		     			//alert('doc id in personal info='+isDocIdAvailable);
		     			if(isDocIdAvailable==0 || isDocIdAvailable=='0' || isDocIdAvailable==null )
		     				{
		     				showAlertMessage1("Message",
		        					"<br/>Risk Profile Section saved successfully.",
		        					"confirmation", reloadPage);
		        		 $('.ZebraDialog').css('top','250px');
		     				}
		     			else{
		     				showAlertMessage("Success", "<br/>Risk Profile Section saved successfully.Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", personalInfoReady);		
		     			}
		        		 
		        	 }	       
		         }
		         });
			
				//alert('All Questions are Mandetory.');	
			}
		else{
			
		}		//window.location.href = $('#contextPath').val()+'/Cashflow.htm';
		}
		function isNewAnalysisReportGenerationRequired1()
		{
			var isDocIdAvailable = $('#dcInputDocId_AnalysisReport').val();
			//alert('doc id in personal info='+isDocIdAvailable);
			if(isDocIdAvailable==0 || isDocIdAvailable=='0' || isDocIdAvailable==null )
				{
				
				}
			else{
				showAlertMessage("Success", "<br/>Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", personalInfoReady);		
			}
		}
		function personalInfoReady()
		{
			window.location.href= $('#contextPath').val() + "/RiskProfile.htm";
		}
		function redirectFurther(){
			if(isContainsEmergencyR==true)
				{
				if(isContainsRiskCover==true){
					//window.location.href=$('#contextPath').val()+'/RiskCover.htm';
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
			else{
				window.location.href=$('#contextPath').val()+'/EmergencyReady.htm';
			}
			 
		}
		function validateDcInput(questionId)
		{
			//alert('='+$('input[name="'+questionId+'"]:checked').val());
			//alert('isMandatory='+isMandatory);
			//$('input[type="radio"]:not(:checked)')
// 			alert("1="+$('input[name="'+questionId+'"]').is(":checked"));

// 			alert("=="+$('input[name="' + questionId + '"]:not(:checked').val());
// 			alert($('input[name="' + questionId + '"]:not(:checked)'));
// 			alert($("input:!checked"));
			if($('input[name="'+questionId+'"]').is(":checked")==false )
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