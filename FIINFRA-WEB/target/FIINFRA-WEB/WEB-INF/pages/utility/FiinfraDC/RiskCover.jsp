<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Data Collection - Current Financial Status: Risk Cover</title>
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
		<jsp:param name="param1" value="risk" />
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
		
          <!-- end-->
          <!-- end-->
          <img src="images/currentfstatus.png"  class="img-responsive">
          <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading"><a id="extendedfamily"></a>Risk Cover </div>
          <div class="panel-body">
         <div class="panel panel-default" style="margin-top:10px;">
           
          <div class="panel-body"><strong>
          	Enter in the below fields questions related to the way you manage your finances at present. Enter the current status and not expected status          </strong></div>                                      
          </div>
           <!--1 start -->
        
         <div id="riskCoverQuestion">
          
          </div>
        
        
      
           
         	
                	
                	
            </div>                                      
          </div>
          <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading">Did you know?</div>
          <div class="panel-body">
            <div class="col-md-11 searchpadding padding_top">
              <ul>
            	<li> Hence the need for a &quot;benefit&quot; policy and not a &quot;reimbursement&quot; policy.</li>
                <li> For about Rs.800/- you could cover your household contents worth over Rs. 1 lac including furniture and jewellery</li>
                <li>India has 57 crores insurable people out of which less than 10 crore people have some kind of life insurance</li>
                <li>Experts say, healthcare cost in India is growing at. 15-18 per cent every year-twice as fast as the general price inflation.</li>
                <li>
A critical illness will mean not just medical expenses, but allied expenses like continued care apart from loss of income.</li>
                </ul>
            </div>
            <div class="col-md-8 searchpadding padding_top">
             
            </div>
            
           
                	
                	
            </div>                                      
          </div>
          <!--END -->
       <div class="topmenu">           
 <input class="btn dbtn" type="button" value="Save" onclick="save('save')"  name="Save"> 

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
	var sectionTypeId = 39003;
	var questionBankId = 27;
	var familyMemberList;
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
			var qLi =$("input[name=94013]:checked").val();
			//alert('abvg='+abvg)
			if(qLi!=undefined){
			if(qLi.trim()=="Yes")
			{
				//alert('in yes')
				$('input[name=94143]').removeAttr('disabled');
				$('input[name=94143]').attr("disabled", false);
			}
			else{
				//alert('in no')
			//alert('in no');
			$('input[name=94143]').attr("disabled", true);
			}
		}else{
				
		
		}
			var qHi =$("input[name=94020]:checked").val();
			//alert('abvg='+abvg)
			if(qHi!=undefined){
			if(qHi.trim()=="Yes")
			{
				//alert('in yes')
				$('input[name=input94019]').removeAttr('disabled');
				$('input[name=input94019]').attr("disabled", false);
			}
			else{
				//alert('in no')
			//alert('in no');
				$('input[name=input94019]').val('');
			$('input[name=input94019]').attr("disabled", true);
			}
		}else{
		
		}	
			
			var qCI =$("input[name=94025]:checked").val();
			//alert('abvg='+abvg)
			if(qCI!=undefined){
			if(qCI.trim()=="Yes")
			{
				//alert('in yes')
				$('input[name=input94024]').removeAttr('disabled');
				$('input[name=input94024]').attr("disabled", false);
			}
			else{
				//alert('in no')
			//alert('in no');
				$('input[name=input94024]').val('');
			$('input[name=input94024]').attr("disabled", true);
			}
		}else{
		
		}
			
			var qPA =$("input[name=94106]:checked").val();
			//alert('abvg='+abvg)
			if(qPA!=undefined){
			if(qPA.trim()=="Yes")
			{
				//alert('in yes')
				$('input[name=input94107]').removeAttr('disabled');
				$('input[name=input94107]').attr("disabled", false);
			}
			else{
				//alert('in no')
			//alert('in no');
				$('input[name=input94107]').val('');
			    $('input[name=input94107]').attr("disabled", true);
			}
		}else{
		
		}		
		}
		
		
		$(document)
				.ready(
						function() {
				
							
							$
							.ajax({
								type : "POST",
								url : $('#contextPath').val()
										+ '/dc/getFamilyMemberList.htm',

							success : function(result) {
								familyMemberList=result;
								//alert(familyMemberList);
							
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
										            	
										            	if(SectionType==39003){
										            		
										            	
										            		$("#headimg").attr("src",$('#contextPath').val()+"/images/"+Image);
										            	$(obj).find('Question').each(function(i,obj){
										            	var Id = $(this).attr('ID');
										            	questionList.push(Id);
										         		var QuestionType = $(this).attr('QuestionType');
										         		var attributeCodeIdQuestion = $(this).attr('AttributeCodeID');
										            	//alert('attributeCodeIdQuestion='+attributeCodeIdQuestion)
										            	var ControlType = $(this).find('ControlType').text();
										            	var ParentQuestionId=$(this).attr('ParentQuestionId');
										            	var question=$(this).find('QuestionText').text();
										            	var ControlLabel = $(this).find('ControlLabel').text();
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
										           		'#riskCoverQuestion')
														.append(
																'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										            	
										           		for (var i=0;i<optionList.length;i++)
										           			{
										           			$('#question'+Id+'tr')
															.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
										           			}
										           		}
										            	else if(QuestionType==85002)
									           			{
									           		 	$(
									           		 		'#riskCoverQuestion')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
									           			
										           		 for (var i=0;i<optionList.length;i++)
										           			{
										           			$('#question'+Id+'tr')
										           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
										           			}
									           			}
										            	else if(QuestionType==85001)
									           			{
										           		 	$(
															'#riskCoverQuestion')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										           		 for (var i=0;i<optionList.length;i++)
										           			{
											           			$('#question'+Id+'tr')
											           			.append(' <div class="dcanswer1" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="checkbox" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
											           		}	
									           			}
										            	else if(QuestionType==85004)
									           			{
										           			$(
															'#riskCoverQuestion')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										           		 for (var i=0;i<optionList.length;i++)
										           			{
										           			$('#question'+Id+'tr')
										           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="checkbox" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
										           			}	
									           			
									           			}
										            	else if(QuestionType==85005)
									           			{
										           		 	$(
															'#riskCoverQuestion')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										           		 
										           		 	for(var i=0;i<optionList.length;i++)
										           		 		{
										           		 		
										           		 		
											           			$('#question'+Id+'tr')
																.append('<input type="text" class="form-control" name="input'+attributeCodeIdQuestion+'" onkeydown="allowIntegersOnly(id,event)" onkeyup="test_skill(id)" id="'+attributeCodeIdQuestion+'" value="" /><span class="amountinword" id="'+attributeCodeIdQuestion+'moneyText"></span>');	
// 											           			.append('<input type="text"  id="'+ obj.questionId+'" style="width:100%"  class="textfieldg" />');
										           		 		}
									           			
									           			}
										           		else if(QuestionType==85006)
									           			{
										           			$(
															'#riskCoverQuestion')
															.append(
																	'<div class="row answerbg" id="question'+Id+'"><div class="col-md-5 searchpadding padding_top">'+question+' <b>'+ControlLabel+'</b></div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										           		 
										           		 	
										           		 	for(var i=0;i<optionList.length;i++)
										           		 		{
										           		 		
										           		 		
											           			$('#question'+Id+'tr')
																.append(' <select   title="Hold Ctrl key to select multiple" multiple="multiple" style="margin-left: 4px;width:99%;min-width:245px;height: 83px;" name="input'+attributeCodeIdQuestion+'"  id="'+attributeCodeIdQuestion+'"  />');	
// 											           			.append('<input type="text"  id="'+ obj.questionId+'" style="width:100%"  class="textfieldg" />');
										           		 		}
										           			$(familyMemberList)
															.each(
																	function(i, obj) {
// 																		//alert('name='+Id);
																		
// 										           		 	for(var j=0;j<result.length;j++)
// 										           		 		{
										           		 				$("#"+attributeCodeIdQuestion).append('<option value='+obj.partyId+' id='+obj.partyId+'_'+attributeCodeIdQuestion+'>'+obj.name+'</option>');
// 										           		 		}
																
															});
										           			
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
															
															/*give ajax call to fetch all family members who are insured*/
															//alert('in the success of ajax');
															
														
															$(result)
															.each(
																	function(i, obj) {
//									 									alert('questionType='+obj.questionType);
//									 										if(obj.sectionType==85004 || obj.sectionType==85001){
																				$('#'+obj.attributeCodeId).val(obj.attributeRefferenceValue);
																			if(obj.questionType=='85005')
																				{
																				$('#'+obj.attributeCodeId).val(obj.attributeRefferenceValue);
																				}
																			else if(obj.questionType=='85006')
																				{
// 																				alert('obj.attributeValue:--'+obj.attributeValue)
// 																				alert('obj.qid:--'+obj.questionId+'_'+obj.attributeCodeId)
// 																				$('#'+obj.questionId+'_'+obj.attributeCodeId).val(obj.attributeValue);
																				$('#'+obj.attributeCodeId).find('option[value="' + obj.attributeValue + '"]').attr("selected", "selected");
																				}
																			else if(obj.questionType=='85001')
																			{
																			selectOption(
																					'option'
																							+ obj.attributeValue+'_'+obj.attributeCodeId+'_',
																					obj.attributeCodeId);
																			$(
																					'#select'
																							+ obj.attributeCodeId)
																					.val(
																							obj.attributeValue);
																			}
																			else{
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
																	});
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
			
		var isValidate = false;
		var isValidateLF = false;
		var isValidateHF = false;
		var isValidateCI = false;
		var isValidatePA = false;
		
			var xmlString = "<Root>";
			
			$(questionListToIterate)
			.each(
					function(i, obj1) {
						// 				alert($('a[name="' + obj + '"]').html());
						$($('input[name="' + obj1 + '"]:checked'))
								.each(
										function(i, obj) {
											id = $(obj).attr('id');
											//alert('in first if='+id);
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
						$($('input[name="input'+ obj1+'"]'))
								.each(
										function(i, obj) {
											AttributeCodeID= $(obj).attr('id');
											id = $(obj).val();
											var attributeRefferenceValue=id;
											//alert('AttributeCodeID='+AttributeCodeID);
											//alert('value='+id);
											if (!isNumeric(id)) {
												isValidate = false;
												
												addCssStyles($(obj).attr('id'),
														'Please enter digits only.');
												
											} 																						
											else {
																		removeCssStyles($(obj).attr('id'));
											}	
											
											if(AttributeCodeID==94018)
												{
												isValidateLF  = isNumeric(id);
												//alert('isValidate='+isValidateLF  + 'for id='+AttributeCodeID + 'result '+isValidateLF );
												}
											 if(AttributeCodeID==94019)
												{
												isValidateHF =isNumeric(id);
												//alert('isValidate='+isValidateHF + 'for id='+AttributeCodeID + 'result '+isValidateHF);
												}
											 if(AttributeCodeID==94024)
											{
												isValidateCI   =isNumeric(id);
											//alert('isValidate='+isValidateCI  + 'for id='+AttributeCodeID + 'result '+isValidateCI );
											}
											 if(AttributeCodeID==94107)
											{
												isValidatePA  =isNumeric(id);
											//alert('isValidate='+isValidatePA  + 'for id='+AttributeCodeID + 'result '+isValidatePA );
											}
												
												

											xmlString += '<Question><QuestionId>'
												+ obj1
												+ '</QuestionId>';
										xmlString += '<QuestionOptionId></QuestionOptionId><AttributeCodeID>'+AttributeCodeID+'</AttributeCodeID><Value>'+attributeRefferenceValue+'</Value>';
										xmlString += '<OptionValue>'
												+ id
												+ '</OptionValue></Question>';
											
										
										});
						
								
								$($('select[name="input' + obj1 +'"] :selected'))
								.each(
										function(i, obj) {
											
											
											id = $(obj).attr('id');
											//alert('in first if='+id);
											
											AttributeCodeID=id.substring(id.indexOf('_') + 1);
												
											
										
											id = $(obj).val();
											//alert('id='+id);
// 											
											//alert('AttributeCodeID->>>>>>>>>>>'+AttributeCodeID);
											
											// 													alert(arg)
											if ($(
													'select[name="input'
															+ obj1
															+ '"]')
													.attr('multiple') == 'multiple') {
												xmlString += '<Question><QuestionId>'
														+ obj1
														+ '</QuestionId>';
												xmlString += '<QuestionOptionId>'
														+ id
														+ '</QuestionOptionId><AttributeCodeID>'+AttributeCodeID+'</AttributeCodeID>';
												xmlString += '<OptionValue>_eof_</OptionValue></Question>';
											} else {
												xmlString += '<Question><QuestionId>'
														+ obj1
														+ '</QuestionId>';
												xmlString += '<QuestionOptionId>'
														+ id
														+ '</QuestionOptionId><AttributeCodeID>'+AttributeCodeID+'</AttributeCodeID>';
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
				'<input  type="hidden" id="sectionName" name="sectionName" value="Risk Cover"/>');
		
		if(isValidateLF ==false)
			{
			showAlertMessage("Message", "Invalid Charactor,Please Enter Numeric Value.", "error",
					doNothing);
			 $('.ZebraDialog').css('top','250px');
			 return false;
			}
		else if(isValidateHF==false)
			{
			showAlertMessage("Message", "Invalid Charactor,Please Enter Numeric Value.", "error",
					doNothing);
			 $('.ZebraDialog').css('top','250px');
			 return false;
			}
			
		else if(isValidateCI==false)
			{
			showAlertMessage("Message", "Invalid Charactor,Please Enter Numeric Value.", "error",
					doNothing);
			 $('.ZebraDialog').css('top','250px');
			 return false;
			}
			
		else if(isValidatePA ==false)
		{
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
// 	        		 showAlertMessage1("Message",
// 	        					"<br/>Risk Cover Section saved successfully.",
// 	        					"confirmation", redirectFurther);
// 	        		 $('.ZebraDialog').css('top','250px');
					redirectFurther();	
						
					}
	        	 else{
	        		 showAlertMessage1("Message",
	        					"<br/>Risk Cover Section saved successfully.",
	        					"confirmation", doNothing);
	        		 $('.ZebraDialog').css('top','250px');
	        	 }
	         }
	         });
		}
			
		}
		function redirectFurther(){
			
			window.location.href = $('#contextPath').val()+'/GoalReady.htm';
		
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