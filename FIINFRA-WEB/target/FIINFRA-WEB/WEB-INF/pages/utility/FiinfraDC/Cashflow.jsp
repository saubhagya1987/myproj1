<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<%@page import="org.apache.xmlbeans.impl.xb.xsdschema.IncludeDocument.Include"%>
<html>

<head>
<meta charset='UTF-8' />



<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.css" />
<!-- -responsive css
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>-->

<!-- Placed at the end of the document so the pages load faster -->
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
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

<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>

<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
 <script src="<%=request.getContextPath()%>/js/common.js"></script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
<script>
	
	
	
</script>

<title>Data Collection - Current Financial Status: Cash Flow</title>








<!-- Function Code to Convert from Number to Words --Amruta -->
<script>

</script>
<script type="text/javascript">
var $jq_1_9_2 = $.noConflict();
$(document)
.ready(
		function() {
//				$('#dcinputname').attr('margin-left','5px');
			$('#dcinputname').append($('#dcInputUsername').val());
			
		});
</script>
</head>

<body>

<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
	
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">	

<form action="" name="showPathFinderOutputPdfForm" method="post" >
</form>


 
     
    <div class="container white">
    	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;">
          <span style="float:left; font-weight:bold;" id="dcinputname"> Data Collection for&nbsp;<i class="opportunityicon" > </i> </span>  
          <span> 
          <input class="dcbutton" type="button" value="Exit"  id="exit" onclick="redirectToOpportunity()"  name="Exit"> </span>
        </div >
      </div>
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      <div class="col-md-12">
       <div class="col-md-3" style="padding-left:10px;"><img src="images/currentf.jpg"></div>
      <div class="col-md-6 dchead " style="padding-left:10px;">DATA COLLECTION </div>
       	<div class="col-md-3" style="text-align:right;"><img src="" id="headimg" width="191" height="98"></div>
      </div>
      
        <!-- center -->
     <jsp:include page="sidebar.jsp">
		<jsp:param name="param1" value="cashflow" />
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
        
          <div class="panel-heading"> Cash Flow</div>
          <div class="panel-body">
          
          <div class="panel panel-default" style="margin-top:10px;">
           
          <div class="panel-body"><strong>
          	Enter in the below fields questions related to the way you manage your finances at present. Enter the current status and not expected status          </strong></div>                                      
          </div>
           <!--1 start -->
          <div id="cashflowQuestions">
          
         
          
         
            
             </div>
             <div class="col-md-12">&nbsp;</div>    
          <!--6end -->   	
                	</div>
            </div>                                      
         
          <!-- end--><div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading">Did you know?</div>
          <div class="panel-body">
            <div class="col-md-11 searchpadding padding_top">
            Fidelity Investments recommends how much savings you should have at different ages:
            <ul>
            	<li> At age 35, you should have saved an amount equal to your annual salary.</li>
                <li> At age 45, you should have saved three times your annual salary.</li>
                <li> At 55, you should have five times your salary.</li>
                <li> When you retire, you should have eight times your annual pay.</li>
                <li> Not more than 50% of your disposal income should go into repaying loansNot more than 50% of your disposal income should go into repaying loans</li>
                <li> Saving 20% of disposable income starting from an early age is a sure shot way of building wealth</li>
                              
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
	
	var isValidData;
// 	var $jq_1_9_2 = $.noConflict();
				function selectOption(id, name) {
					$('#'+name).val('');
// 					alert('input_'+name);
// 					alert($('#input_'+name).val());
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
				
							
							
								$.ajax({
										        type: "GET",
										        url : $('#contextPath').val()
												+ '/xml/DCInputFields.xml',
										        
										        dataType: "xml",
										        success: function(xml) {
										        	$(xml).find('BU').each(function(i,obj){
										        		var buId= $(this).attr('ID');
										        		if(buId==2){
										        	
										            $(obj).find('Section').each(function(i,obj){
										            	var SectionType = $(this).find('SectionType').text();
										            	var SectionName = $(this).attr('Name');
										            	var SectionType = $(this).attr('SectionType');
										            	var Image = $(this).attr('ImagePath');
// 										            	alert('SectionType=='+SectionType);
										            	if(SectionType==39002){
										            	$("#headimg").attr("src",$('#contextPath').val()+"/images/shubhachintak/"+Image);	
										            	$(obj).find('Question').each(function(i,obj){
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
// 														alert('optionList=='+optionList);
// 														alert('optionIdList=='+optionIdList);
										           		if(QuestionType==85003)
										            	{
										           		$(
															'#cashflowQuestions')
															.append(
																	'<div class="row answerbg" ><div class="a" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-5 searchpadding padding_top" >'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										            	
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
																	'<div class="row answerbg" ><div class="a" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-5 searchpadding padding_top" >'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										            	
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
																		'<div class="row answerbg" ><div class="a1" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-12 searchpadding padding_top" >'+question+'<span class="red">*</span></div><div class="col-md-4 searchpadding padding_top "><input name="input_'+attributeCodeIdQuestion+'" class="form-control" onkeydown="allowIntegersOnly(id,event)" onkeyup="test_skill(id)" type="text" id="'+attributeCodeIdQuestion+'" placeholder="" ><div class="amountinword" id="'+attributeCodeIdQuestion+'moneyText"></div></div><div class="col-md-1 searchpadding padding_top ">OR</div><div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
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
																	'<div class="row answerbg" ><div  id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										           		 
										           		 	for(var i=0;i<optionList.length;i++)
										           		 		{
										           		 		
											           			$('#question'+Id+'tr')
																.append('<input type="text" class="form-control" name="input'+attributeCodeIdQuestion+'"  onkeydown="allowIntegersOnly(id,event)" onkeyup="test_skill(id)"  id="'+attributeCodeIdQuestion+'" value="" /><span class="amountinword" id="'+AttributeCodeIDList[i]+'moneyText"></span>');	
// 											           			.append('<input type="text"  id="'+ obj.questionId+'" style="width:100%"  class="textfieldg" />');
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
																		//alert('questionId='+obj.questionId);
//						 													var questiontype=obj.questionType;
																			
																			
																		 	if (obj.questionType == 85005 ) {
																			try{
																				
																						$('#'+obj.attributeCodeId).val(obj.attributeRefferenceValue);
																								
																			
																			//alert(obj.questionId+':'+$('#input'+obj.questionId).val());
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
//						 												 		alert('in 85009')
//						 												 		var questiontype=obj.questionType;
																		 		selectOption(
																						'option'
																								+ obj.attributeValue+'_'+obj.attributeCodeId+'_'+obj.attributeRefferenceValue,
																						obj.attributeCodeId);
																				$(
																						'#select'
																								+ obj.questionId)
																						.val(
																								obj.attributeValue);
//						 														$('#'+obj.attributeCodeId).val(obj.attributeValue);
																				
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
			var isValidQ1;
				var isValidQ2;
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
//														alert('id='+id);
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
// 													var compositeId=$(obj).attr('id');
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
										//alert('id in tf='+id);
// 										alert('attribute codeid=='+AttributeCodeID);
// 										alert('obj1 =='+obj1);
											
// 											isValidData=isNumeric(id);
// 											if(isManQuestionFill_text==false)
// 												{
// 												isValidData_text_chk=false;
// 												}
// 											alert('isManQuestionFill_text in save='+isManQuestionFill_text)	
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
// 			console.log();
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
				 //alert('id='+id);
			 var res = id.split("_");
			var questionId=res[0];
// 			alert('questionId in row='+questionId);
			//alert('counteri in row='+counteri);
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
				
				//alert('isManQuestionFill_text2='+isManQuestionFill_text1)
				//alert('isManQuestionFill_radio2='+isManQuestionFill_radio1)
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
				//alert('isManQuestionFill_text2='+isManQuestionFill_text2)
				//alert('isManQuestionFill_radio2='+isManQuestionFill_radio2)
			}
			else{
				isManQuestionFill_text3=validateDcInput_text(1,questionId);	
				//alert('isManQuestionFill_text3='+isManQuestionFill_text3);
				//alert('questionId='+questionId)
			}
			
			
		
// 			alert('isManQuestionFill_radio='+isManQuestionFill_radio);
		
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
// 		        	alert('in success of ajax='+buttonType);
		        	 if(buttonType=='next')
						{
// 		        		 showAlertMessage1("Message",
// 		        					"<br/>Cashflow Section saved successfully.",
// 		        					"confirmation", redirectFurther);
// 		        		 $('.ZebraDialog').css('top','250px');
		        		 redirectFurther();
							
						}
		        	 else{
		        		 showAlertMessage1("Message",
		        					"<br/>Cashflow Section saved successfully.",
		        					"confirmation", doNothing);
		        		 $('.ZebraDialog').css('top','250px');
		        	 }
		        	
		         }
			
		         });
			
		}
			
		}
		function redirectFurther(){
		
				window.location.href=$('#contextPath').val()+'/Loan.htm';
			
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
<%-- 	<jsp:include page="../PathFinder/PathFinderFooter.jsp" /> --%>
</body>

</html>