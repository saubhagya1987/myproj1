<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Financial Plan - Current Financial Status: Emergency Readiness</title>
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
    <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/zebra_dialog.css"
	type="text/css">

    


<!-- -responsive css-->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<link href="<%=request.getContextPath()%>/css/Ffreedom_dc.css" rel="stylesheet">
<!-- -responsive css-->
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
 <script src="<%=request.getContextPath()%>/js/common.js"></script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
<script>
	
		$(document)
				.ready(
						function() {
// 							$('#dcinputname').attr('margin-left','5px');
							$('#dcinputname').append($('#dcInputUsername').val());
							
						});
		</script>
</head>
<body>
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" />


<form action="" name="showPathFinderOutputPdfForm" method="post" >
</form>
<!--css popup window start 1-->

 <jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">   


 	
 <!-- Center part start -->
 <section>
 

 
     
    <div class="container white">
    	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;">
          <span style="float:left; font-weight:bold;" id="dcinputname">Financial Plan for&nbsp;<i class="opportunityicon" > </i> </span>  
          <span> 
          <input class="dcbutton" type="button" value="Exit"  id="exit" onclick="redirectToOpportunity()"  name="Exit"> </span>
        </div >
      </div>
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      <div class="col-md-12">
       <div class="col-md-3" style="padding-left:10px;"><img src="images/currentf.jpg"></div>
      <div class="col-md-6 dchead " style="padding-left:10px;">Financial Plan </div>
       	<div class="col-md-3" style="text-align:right;"><img src="" id="headimg"></div>
      </div>
      
        <!-- center -->
     
      <jsp:include page="sidebar.jsp">
		<jsp:param name="param1" value="Emergency" />
	</jsp:include>
        <div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">Current Financial Status</a>
                <!-- accordion start-->
           <!-- accordion  END -->
           <!-- accordion End -->
                
           <div class="list-group-item">
       
   	


		<div class="row">
        <!-- About You Start-->
        <!-- About You Start-->
	<img src="images/currentfstatus.png"  class="img-responsive"> 
          <!-- end-->
           <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading"><a id="extendedfamily"></a>Emergency Readiness </div>
          <div class="panel-body">
        
          <div class="panel panel-default" style="margin-top:10px;">
           
          <div class="panel-body"><strong>
          	Enter in the below fields questions related to the way you manage your finances at present. Enter the current status and not expected status          </strong></div>                                      
          </div>
       
         <div id="emergencyQuestion">
          
         
          
         
            
             </div>
         
         
        
         
          
         
       
          <!--5 end -->
          
          </div>
           </div>
          <!-- end-->
          <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading">Did you know?</div>
          <div class="panel-body">
            <div class="col-md-11 searchpadding padding_top">
              <ul>
            	<li> During the floods in Mumbai in 2005, banks and ATMs were not functional for 3 days.</li>
                <li> An average middle class Indian household cannot survive beyond 2 months without income from employment</li>
                
                </ul>
            </div>
            <div class="col-md-8 searchpadding padding_top">
             
            </div>
            
           
                	
                	
            </div>                                      
          </div>
          <!--END -->
      <div class="topmenu">           
 <input class="btn dbtn" type="button" value="Save" onclick="save('save')" name="Save"> 

    <input class="btn dbtn" type="button" value="Cancel" name="Cancel" onclick="redirectDcInput()"> 
     
      <input class="btn dbtn" type="button" onclick="save('next')" value="Next" name="Next">          
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
// 	var $jq_1_9_2 = $.noConflict();
var questionListToIterate = new Array();
var questionList = new Array();
var selectedQuetionOptionList ;
var sectionTypeId = 39001;
var isMan=0;
var questionBankId = 27;
var isValidData;
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
			var abvg =$("input[name=94002]:checked").val();
			//alert('abvg='+abvg)
		if(abvg!=undefined){
			if(abvg.trim()=="Yes")
			{
				//alert('in yes')
				$('input[name=94137]').removeAttr('disabled');
				$('input[name=94137]').attr("disabled", false);
			}
			else{
				//alert('in no')
			//alert('in no');
			$('input[name=94137]').attr("disabled", true);
			}
		}else{
				
		
		}
		}
		
		
		$(document)
				.ready(
						function() {
							$('#dcinputname').append($('#dcInputUsername').val());
							
							
							
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
// 										            	ALERT('SECTIONTYPE=='+SECTIONTYPE);
// 										            	ALert('SectionName=='+SectionName)
														if(SectionType==39001){
															$("#headimg").attr("src",$('#contextPath').val()+"/images/shubhachintak/"+Image);
										            	$(obj).find('Question').each(function(i,obj){
										            	var Id = $(this).attr('ID');
										            	
										            	questionList.push(Id);
										         		var QuestionType = $(this).attr('QuestionType');
										         		var attributeCodeIdQuestion = $(this).attr('AttributeCodeID');
										            	//alert('attributeCodeIdQuestion='+attributeCodeIdQuestion);
										            	var ControlType = $(this).find('ControlType').text();
										            	var ParentQuestionId=$(this).attr('ParentQuestionId');
										            	var question=$(this).find('QuestionText').text();
										            	var IsMandatory = $(this).find('IsMandatory').text();
// 										            	alert('questiom='+question+'->>>>> Is Mand='+IsMandatory)
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
														
															
														//alert('AttributeCodeIDList='+AttributeCodeIDList);
										           		if(QuestionType==85003)
										            	{
										           		$(
										           		'#emergencyQuestion')
														.append(
																'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top" id="question'+Id+'_'+IsMandatory+'">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										            	
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
																		'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top" id="question'+Id+'_'+IsMandatory+'">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										           			
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
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top" id="question'+Id+'_'+IsMandatory+'">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										           		 for (var i=0;i<optionList.length;i++)
										           			{
											           			$('#question'+Id+'tr')
											           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="checkbox" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
											           		 
										           			}	
									           			
									           			}
										           		else if(QuestionType==85004)
									           			{
										           			$(
															'#emergencyQuestion')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'">'+question+'<span class="red">*</span></div> <div class="col-md-7 searchpadding padding_top" id="question'+attributeCodeIdQuestion+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										           		 for (var i=0;i<optionList.length;i++)
										           			{
										           			$('#question'+attributeCodeIdQuestion+'tr')
										           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
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
									 									//alert('questionType='+obj.questionType);
									 									//alert('questionType='+obj.questionType);
//									 										if(obj.sectionType==85004 || obj.sectionType==85001){
																				
																			if(obj.questionType=='85005')
																				{
																				$('#'+obj.questionId+'_'+obj.attributeCodeId).val(obj.attributeValue);
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
																					}else if(attributeReferenceValue==7 || attributeReferenceValue==9){
																						attributeReferenceValue=8;
																					}else if(attributeReferenceValue==10 || attributeReferenceValue==12){
																						attributeReferenceValue=11;
																					}
																					
																				}
																				
																					//alert('in else='+obj.attributeRefferenceValue);	
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
			//alert('buttonType='+buttonType)
			var xmlString = "<Root>";
// 			alert(questionListToIterate);
// 			alert("questionList="+questionList)
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
// 													alert('id='+id);
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
													//alert('AttributeCodeID='+AttributeCodeID);
												
													//var isMandatoryQ=AttributeCodeID.substring(AttributeCodeID.indexOf('_') + 1);
												
// 													isValidData=validateDcInput(isMandatoryQ,id);
													//alert('attributeRefferenceValue='+attributeRefferenceValue);
													//alert('id==='+id);
													// 					alert($(obj).attr('class'));
// 													if ($(obj).attr('class') == 'selected') {
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
													var compositeId=$(obj).attr('id');
													AttributeCodeID=compositeId.substring(compositeId.indexOf('_')+1);
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
												xmlString += '<QuestionOptionId></QuestionOptionId><AttributeCodeID>'+AttributeCodeID+'</AttributeCodeID>';
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
					'<input  type="hidden" id="sectionName" name="sectionName" value="EmergencyReady"/>');
			
			 $(".col-md-5").each(function(i) {
				 var id = $(this).attr('id');
				 id = id
					.substring(id
							.indexOf('question') + 8);
				var AttributeCodeID=id.substring(id.indexOf('_') + 1);
				var isMan=AttributeCodeID.substring(AttributeCodeID.indexOf('_') + 1);
				 //alert('id='+id);
			 var res = id.split("_");
			var questionId=res[0];
			isValidData=validateDcInput(isMan,questionId);
			 
			
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
// 			        		 showAlertMessage1("Message",
// 			        					"<br/>Emergency Section saved successfully.",
// 			        					"confirmation", redirectFurther);
// 			        		 $('.ZebraDialog').css('top','250px');
								redirectFurther();
							}
			        	 else{
			        		 showAlertMessage1("Message",
			        					"<br/>Emergency Section saved successfully.",
			        					"confirmation", doNothing);
			        		 $('.ZebraDialog').css('top','250px');
			        	 }
			         }
			         });
			}
			
			

					//window.location.href = $('#contextPath').val()+'/RiskCoverFiinfra.htm';
		}
		function redirectFurther(){
			
			window.location.href=$('#contextPath').val()+'/RiskCover.htm';
		
		}
		function validateDcInput(isMandatory, questionId)
		{
			//alert('isMandatory='+isMandatory);
			//alert('isMandatory='+isMandatory);
			//$('input[type="radio"]:not(:checked)')
			//alert($('input[name="'+questionId+'"]:checked').val());
// 			alert($($('input[name="' + questionId + '"]:not(:checked').val())));
			
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