<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Data Collection - Current Financial Status: Loan Status</title>
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


<form action="" name="showPathFinderOutputPdfForm" method="post" >
</form>
<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">	
 	
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
		<jsp:param name="param1" value="loan" />
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
        
          <div class="panel-heading"> Loan Status</div>
          <div class="panel-body">
          <div class="panel panel-default" style="margin-top:10px;">
           
          <div class="panel-body"><strong>
          	Enter in the below fields questions related to the way you manage your finances at present. Enter the current status and not expected status          </strong></div>                                      
          </div>
          
        	<div id="loanQuestions">
          
          </div>
        
        
          
            </div>                                      
          </div>
          <!-- end-->
          <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading">Did you know?</div>
          <div class="panel-body">
            <div class="col-md-11 searchpadding padding_top">
              <ul>
            	<li>When interest on your floating rates loan go up : do not increase the tenure, choose to increase the EMI. When interest rates fall - choose to reduce the tenure and not the EMI</li>
                <li> 24% to 30% is the average interest paid per annum for rolling over credit on credit cards</li>
                <li>3.29% of all Indian households has taken a personal loan from a bank or financial institution</li>
                <li>Typically a bank assumes that about 55-60 % of your monthly disposable / surplus income is available for repayment of loan.</li>
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
	var sectionTypeId = 39008;
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
			var qFL =$("input[name=94092]:checked").val();
			//alert('abvg='+abvg)
			if(qFL!=undefined){
			if(qFL.trim()=="Yes")
			{
				//alert('in yes')
				$('input[name=94164]').removeAttr('disabled');
				$('input[name=94164]').attr("disabled", false);
			}
			else{
				//alert('in no')
			//alert('in no');
			$('input[name=94164]').attr("disabled", true);
			}
		}else{
				
		
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
										            	if(SectionType==39008){
										            		$("#headimg").attr("src",$('#contextPath').val()+"/images/"+Image);
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
// 										            	alert('IsMandatory='+IsMandatory);
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
															'#loanQuestions')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										            	
										           		for (var i=0;i<optionList.length;i++)
										           			{
											           			$('#question'+Id+'tr')
																.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
										           			}
										           		
										            	}
										           		
										           		else if(QuestionType==85008)
										           			{
										           			if(IsMandatory==1){
										           				$(
																'#loanQuestions')
																.append(
																		'<table width="100%" cellpadding="1" cellspacing="1" id="question'+Id+'"><tr><td width="47%" class="alignleft bold"><b class="errorMessage1">*</b>'+question+'</td><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+Id+'tr"></tr></table></td></tr></table>');
											           			
												           		 for (var i=0;i<optionList.length;i++)
												           			{
												           			 if($('#question'+ Id+'troptiontable').val()==undefined){																																																																											
												            			 $(	'#question'+ Id+'tr').append('<td class="newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+ Id+'troptiontable"><td width="100px"><label><input id="'+ Id+'_tf" type="text" class="textfieldbiggray" placeholder="Please provide the exact amount" onkeyup="test_skill(id);" /></label></br><div id="'+ Id+'_tfmoneyText" align="left" style="border:1px solid grey; height:80px; width:198px;" ></div></td><td width="30px"><img src="'+$('#contextPath').val()+'/images/Axis-op/or.gif" width="30" height="29" /></td><td><label class="radiolable"><input name="'+ Id+'"  type="radio" onclick="selectOption(id, name)" id="option'+optionIdList[i]+'" value="'+optionList[i]+'" /></label>'+optionList[i]+'</td></tr></table></td>');
												            			  //'#question'+ obj.questionId+'tr').append('																																									   <input type="text"  id="'+ obj.questionId+'" class="textfieldg" onkeyup="test_skill(id);"/></br><div id="'+obj.questionId+'moneyText" align="left" style="border:1px solid grey; width:348px;" ></div>');
												            			 
												            		 }else{																																																	//.append('<input type="text"  id="'+ obj.questionId+'" class="textfieldg" onkeyup="test_skill(id);"/></br><div id="'+obj.questionId+'moneyText" align="left" style="border:1px solid grey; width:348px;" ></div>');
												            			 $('#question'+ Id+'troptiontable').append('<td><label class="radiolable"><input name="'+ Id+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'" value="'+optionList[i]+'" /></label>'+optionList[i]+'</td>');
												            		 }	
												           			}
										           			}else{
										           				$(
																'#loanQuestions')
																.append(
																		'<table width="100%" cellpadding="1" cellspacing="1" id="question'+Id+'"><tr><td width="47%" class="alignleft bold">'+question+'</td><td width="53%" class="alignleft newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+Id+'tr"></tr></table></td></tr></table>');
											           			
												           		 for (var i=0;i<optionList.length;i++)
												           			{
												           			 if($('#question'+ Id+'troptiontable').val()==undefined){																																																																											
												            			 $(	'#question'+ Id+'tr').append('<td class="newtableborder"><table width="100%" border="0" cellspacing="0" cellpadding="0"><tr id="question'+ Id+'troptiontable"><td width="100px"><label><input id="'+ Id+'_tf" type="text" class="textfieldbiggray" placeholder="Please provide the exact amount" onkeyup="test_skill(id);" /></label></br><div id="'+ Id+'_tfmoneyText" align="left" style="border:1px solid grey; height:80px; width:198px;" ></div></td><td width="30px"><img src="'+$('#contextPath').val()+'/images/Axis-op/or.gif" width="30" height="29" /></td><td><label class="radiolable"><input name="'+ Id+'"  type="radio" onclick="selectOption(id, name)" id="option'+optionIdList[i]+'" value="'+optionList[i]+'" /></label>'+optionList[i]+'</td></tr></table></td>');
												            			  //'#question'+ obj.questionId+'tr').append('																																									   <input type="text"  id="'+ obj.questionId+'" class="textfieldg" onkeyup="test_skill(id);"/></br><div id="'+obj.questionId+'moneyText" align="left" style="border:1px solid grey; width:348px;" ></div>');
												            			 
												            		 }else{																																																	//.append('<input type="text"  id="'+ obj.questionId+'" class="textfieldg" onkeyup="test_skill(id);"/></br><div id="'+obj.questionId+'moneyText" align="left" style="border:1px solid grey; width:348px;" ></div>');
												            			 $('#question'+ Id+'troptiontable').append('<td><label class="radiolable"><input name="'+ Id+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'" value="'+optionList[i]+'" /></label>'+optionList[i]+'</td>');
												            		 }	
												           			}
										           			}
										           		 	
										           			}
										           		
										           		else if(QuestionType==85001)
									           			{
										           			$(
															'#loanQuestions')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-12 searchpadding padding_top">'+question+'</div> <div class="col-md-12 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										            	
										           		for (var i=0;i<optionList.length;i++)
										           			{
											           			$('#question'+Id+'tr')
																.append(' <div class="dcanswer" style="width:80px;"><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="checkbox" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
										           			}	
											           }
										           		else if(QuestionType==85005)
									           			{
										           		 	$(
															'#loanQuestions')
															.append(
																	'<div class="row answerbg" id="question'+Id+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										           		 
										           		 	for(var i=0;i<optionList.length;i++)
										           		 		{
										           		 		
											           			$('#question'+Id+'tr')
																.append('<input type="text" class="form-control" name="input'+attributeCodeIdQuestion+'" onkeydown="allowIntegersOnly(id,event)" onkeyup="test_skill(id)"  id="'+attributeCodeIdQuestion+'" value="" /><span class="amountinword" id="'+attributeCodeIdQuestion+'moneyText"></span>');	
// 											           			.append('<input type="text"  id="'+ obj.questionId+'" style="width:100%"  class="textfieldg" />');
										           		 		}
									           			}
										           		if(QuestionType==85002)
										            	{
										           		$(
															'#loanQuestions')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										            	
										           		for (var i=0;i<optionList.length;i++)
										           			{
											           			$('#question'+Id+'tr')
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
//									 									alert('questionType='+obj.questionType);
//									 										if(obj.sectionType==85004 || obj.sectionType==85001){
																				$('#'+obj.attributeCodeId).val(obj.attributeRefferenceValue);
																			if(obj.questionType=='85005')
																				{
																					//alert('in first if='+obj.questionId);
																				$('#'+obj.attributeCodeId).val(obj.attributeRefferenceValue);
																				}
																			else if(obj.questionType==85001 || obj.questionType==85006)
																			{
//						 														alert('option'
//						 														+ obj.attributeValue+'_'+obj.attributeCodeId+'_');
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
//												var compositeId=$(obj).attr('id');
											AttributeCodeID=$(obj).attr('id');
											var attributeRefferenceValue=id;
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
										xmlString += '<QuestionOptionId></QuestionOptionId><AttributeCodeID>'+AttributeCodeID+'</AttributeCodeID><Value>'+attributeRefferenceValue+'</Value>';
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
				'<input  type="hidden" id="sectionName" name="sectionName" value="Loan"/>');
		
		
		$.ajax({
	         type : "POST",
	         url : $('#contextPath').val()+'/dc/insertDcFinancialStatusRecord.htm',
	         data :  $("#financialStatusForm1").serialize(), 
	         success : function(result) {
	          
	        	 if(buttonType=='next')
					{
// 	        		 showAlertMessage1("Message",
// 	        					"<br/>Loan Section saved successfully.",
// 	        					"confirmation", redirectFurther);
// 	        		 $('.ZebraDialog').css('top','250px');
						redirectFurther();
					}
	        	 else{
	        		 showAlertMessage1("Message",
	        					"<br/>Loan Section saved successfully.",
	        					"confirmation", doNothing);
	        		 $('.ZebraDialog').css('top','250px');
	        	 }	       
	         }
	         });
			
					
		}
		function redirectFurther(){
			
			window.location.href = $('#contextPath').val()+'/SuccessionPlan.htm';
	
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