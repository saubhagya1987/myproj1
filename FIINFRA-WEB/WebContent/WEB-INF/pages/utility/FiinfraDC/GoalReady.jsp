<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Data Collection - Current Financial Status: Goal Readiness</title>
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
    <script src="js/jquery-1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-responsive.js"></script>
    <script src="js/bootstrap-responsive.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/holder.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>
    


<!-- -responsive css-->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/popup.css" />
<link href="css/Ffreedom_dc.css" rel="stylesheet">
<!-- -responsive css-->
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/pop.js"></script>
	<script src="js/jquery-1.9.1.js"></script>
	<script src="js/jquery.ui.core.js"></script>
	<script src="js/jquery.ui.widget.js"></script>

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
<!--css popup window start 1-->
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">	

<form action="" name="showPathFinderOutputPdfForm" method="post" >
</form>
<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
 <!-- Center part start -->
 <section>
 

 
     
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
        
          <div class="panel-heading"><a id="extendedfamily"></a>Goal Readiness </div>
          <div class="panel-body">
          <div class="panel panel-default" style="margin-top:10px;">
           
          <div class="panel-body"><strong>
          	Enter in the below fields questions related to the way you manage your finances at present.<br>
 Enter the current status and not expected status          </strong></div>                                      
          </div>
     <div id="goalReadyQuestion">
          
          </div>
                	
                	
            </div>                                      
          </div>
          <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading">Did you know?</div>
          <div class="panel-body">
            <div class="col-md-11 searchpadding padding_top">
              <ul>
            	<li> In the year 2000, the cost of an engineering education in premier institutes was Rs. 1 lac for 4 years. Today, the cost of IIT coaching classes for 1 year is in excess of Rs.1 lac</li>
                <li> Cost of weddings for middle class households in India have gone up from about 5 lacs to 25 lacs in the last 10 years.</li>
                <li>Households spend almost 28% of their household income on children education related expenses reports UNESCO</li>
                
                </ul>
            </div>
            <div class="col-md-8 searchpadding padding_top">
             
            </div>
            
           
                	
                	
            </div>                                      
          </div>
          <!-- end-->
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
	var sectionTypeId = 39005;
	var questionBankId = 27;
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
										            	if(SectionType==39005){
										            	$("#headimg").attr("src",$('#contextPath').val()+"/images/shubhachintak/"+Image);
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
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										            	
										           		for (var i=0;i<optionList.length;i++)
										           			{
											           			$('#question'+Id+'tr')
																.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
										           			}
										           		
										            	}
										           		else if(QuestionType==85007)
									           			{
// 										           			alert('j='+j+' question='+question);
										           			if(j==1){
										           				$(
																'#goalReadyQuestion')
																.append(
																		'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-12 searchpadding padding_top" id="a"> <div class="col-md-4"><ul id="question'+Id+'tr"><li>'+question+'</li></ul></div></div></div> <div class="col-md-12 dcnote">*(Don\'t include the property you stay in)</div><div class="col-md-12">&nbsp;</div> ');	
										           				
										           		
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
																.append('<li>'+optionList[i]+'<input name="input'+attributeCodeIdQuestion+'"  onblur="updatePercentageavailToGoal(id,event)" onmouseout="updatePercentageavailToGoal(id,event)" onkeydown="allowIntegersOnly(id,event)" class="form-control" placeholder="Values (in Rs.)" width="50px !important;" onkeyup="test_skill(id);updatePercentageavailToGoal(id,event)" maxlength="9" type="text" id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'"  /><span class="amountinword" id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'moneyText"></span></li>'); 
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
//									 									alert('questionType='+obj.questionType);
//									 										if(obj.sectionType==85004 || obj.sectionType==85001){
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
	        		 showAlertMessage1("Message",
	        					"<br/>Goal Readiness Section saved successfully.",
	        					"confirmation", doNothing);
	        		 $('.ZebraDialog').css('top','250px');
	        	 }	         }
	         });
			
					
		}
		function redirectFurther(){
			
			window.location.href = $('#contextPath').val()+'/RetirementPlaning.htm';
		
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