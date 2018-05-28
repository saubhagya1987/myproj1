<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Data Collection - Current Financial Status: Retirement Planning</title>
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


<form action="" name="showPathFinderOutputPdfForm" method="post" >
</form>
<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">	

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
       	<div class="col-md-3" style="text-align:right;"><img src="" id="headimg" width="191" height="98"></div>
      </div>
      
        <!-- center -->
     
        <jsp:include page="sidebar.jsp">
		<jsp:param name="param1" value="retirment" />
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
        
          <div class="panel-heading"> Retirement Planning</div>
          <div class="panel-body">
          <div class="panel panel-default" style="margin-top:10px;">
           
          <div class="panel-body"><strong>
          	Enter in the below fields questions related to the way you manage your finances at present. Enter the current status and not expected status          </strong></div>                                      
          </div>
           <!--1 start -->
          
         
          <div id="retirementPlanQuestion">
          
          </div>
            
          
          	
           
         	 <!--3 start -->
           
                	
                	
            </div>                                      
          </div>
          <!-- end-->
          <div class="panel panel-default" style="margin-top:10px;">
        
          <div class="panel-heading">Did you know?</div>
          <div class="panel-body">
            <div class="col-md-11 searchpadding padding_top">
              <ul>
            	<li> With more children choosing to move out of their parental homes and even to other cities and countries, the concept of counting children as the retirement plan is losing ground.</li>
                <li> By 2016, an average Indian male and female will live till 68.8 and 71.1 years, respectively. This will increase by one more year for an average male by 2021 (69.8 years) and by 1.2 years for an average female (72.1), according to Union health ministry's life expectation (LE) at birth projection released last week.
</li>
                <li>At the current rate of inflation, if you are 30 years old and spend Rs.10000/- for a certain lifestyle you will spend Rs.75000/- for the same lifestyle when you are 60 and Rs.1.5 lacs when you are 70 years old and Rs.3 lacs when you are 80 years old.</li>
                
                </ul>
            </div>
            <div class="col-md-8 searchpadding padding_top">
             
            </div>
            
           
                	
                	
            </div>                                      
          </div>
          <!--END -->
      <div class="topmenu">           
 <input class="btn dbtn" type="button" value="Save"  onclick="save('save')" name="Save"> 

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
	var sectionTypeId = 39006;
	var questionBankId = 27;
	var isMan=0;
	var isManQuestionFill;
	var isValidRetirmentAge;
	var isValidData;
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
										        		if(buId==1){
										        	
										            $(obj).find('Section').each(function(i,obj){
										            	var SectionType = $(this).find('SectionType').text();
										            	var SectionName = $(this).attr('Name');
										            	var SectionType = $(this).attr('SectionType');
										            	var Image = $(this).attr('ImagePath');
// 										            	alert('SectionType=='+SectionType);
										            	if(SectionType==39006){
										            	$("#headimg").attr("src",$('#contextPath').val()+"/images/"+Image);
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
															'#retirementPlanQuestion')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										            	
										           		for (var i=0;i<optionList.length;i++)
										           			{
											           			$('#question'+Id+'tr')
																.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
										           			}
										           		}
										           		else if(QuestionType==85007)
									           			{
										           			//alert('j='+j+' question='+question);
										           			if((j)%2==0){
										           				$(
																'#retirementPlanQuestion')
																.append(
																		'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'"><div class="col-md-12 searchpadding padding_top" id="a"> <div class="col-md-6"><ul id="question'+Id+'tr"><li>'+question+'</li></ul></div></div></div> <div class="col-md-12 dcnote">*(Don\'t include the property you stay in)</div><div class="col-md-12">&nbsp;</div> ');	
										           				
										           		
										           			}
										           			else{
										           				$(
																'#a')
																.append(
																		' <div class="col-md-6"> <ul id="question'+Id+'tr"><li>'+question+'</li></ul></div>');	
										           			}
										           			
										           		 for (var i=0;i<optionList.length;i++)
										           			{
											           			$('#question'+Id+'tr')
																.append('<li>'+optionList[i]+'<input name="input'+attributeCodeIdQuestion+'" onkeydown="allowIntegersOnly(id,event)" class="form-control" placeholder="Values (in Rs.)" width="50px !important;" onkeyup="test_skill(id)" type="text" id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'"  /><span class="amountinword" id="'+attributeCodeIdQuestion+'_'+AttributeCodeIDList[i]+'moneyText"></span></li>');	
										           			}
									           			}
										           		
// 										           		else if(QuestionType==85007)
// 									           			{
// 									           		 	$(
// 														'#retirementPlanQuestion')
// 														.append(
// 																'<div class="row answerbg" id="question'+Id+'_'+IsMandatory+'"><div class="col-md-12 searchpadding padding_top">'+question+'</div> <div class="col-md-12 searchpadding padding_top" ><ul id="question'+Id+'tr"></ul></div></div><div class="col-md-12">&nbsp;</div><div class="clearfix"></div> ');
									           			
// 										           		 for (var i=0;i<optionList.length;i++)
// 										           			{
// 											           			$('#question'+Id+'tr')
// 																.append('<li>'+optionList[i]+'<input name="input'+Id+'" onkeyup="test_skill(id)" class="form-control" placeholder="Values (in Rs.)" width="50px !important;" type="text" id="'+Id+'_'+AttributeCodeIDList[i]+'"  /><span class="amountinword" id="'+Id+'_'+AttributeCodeIDList[i]+'moneyText"></span></li>');	
// 										           			}
// 									           			}
										           		else if(QuestionType==85001)
									           			{
										           			$(
															'#retirementPlanQuestion')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										            	
										           		for (var i=0;i<optionList.length;i++)
										           			{
											           			$('#question'+Id+'tr')
																.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="checkbox" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
										           			}	
											           		
									           			}
										           		else if(QuestionType==85002)
									           			{
									           		 	$(
									           		 		'#retirementPlanQuestion')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-5 searchpadding padding_top">'+question+'</div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
									           			
										           		 for (var i=0;i<optionList.length;i++)
										           			{
										           			$('#question'+Id+'tr')
										           			.append(' <div class="dcanswer" ><input name="'+attributeCodeIdQuestion+'" onclick="selectOption(id, name)" type="radio" id="option'+optionIdList[i]+'_'+attributeCodeIdQuestion+'_'+valueList[i]+'" value="'+optionList[i]+'" /><br>'+optionList[i]+'</div>');	
										           			}
									           			}
										           		
										           		else if(QuestionType==85005)
									           			{
										           		 	$(
															'#retirementPlanQuestion')
															.append(
																	'<div class="row answerbg" id="question'+attributeCodeIdQuestion+'_'+IsMandatory+'"><div class="col-md-5 searchpadding padding_top">'+question+'<span class="red">*</span></div> <div class="col-md-7 searchpadding padding_top" id="question'+Id+'tr"></div></div> <div class="col-md-12">&nbsp;</div><div class="clearfix"></div>  ');
										           		 
										           		 	for(var i=0;i<optionList.length;i++)
										           		 		{
										           		 		
											           			$('#question'+Id+'tr')
																.append('<input type="text" class="form-control" name="inputt'+attributeCodeIdQuestion+'" onkeyup="cheackValidNumeric(id)" onkeydown="allowIntegersOnly(id,event)"  id="'+attributeCodeIdQuestion+'_'+IsMandatory+'" value="" />');	
// 											           			.append('<input type="text"  id="'+ obj.questionId+'" style="width:100%"  class="textfieldg" />');
										           		 		}
									           			}
										           		
											           	
										           	 });
													}
										            	
										            	});
										            	
												}/*closing of bu condition*/
											            
										        	});/*close reading Bu tag*/	
										        	$('#94044_1').attr('maxlength','2')
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
																				//alert(obj.questionType)
																				$('#'+obj.attributeCodeId+'_'+obj.attributeValue).val(obj.attributeRefferenceValue);
																			if(obj.questionType=='85007')
																				{
																					//alert('in first if='+obj.questionId);
																					if(obj.IsMandatory=true)
																						{
																						isMan=1;
																						}
																					else{
																						isMan=0;	
																					}
																					
																						
																					$('#'+obj.attributeCodeId+'_'+obj.attributeValue).val(obj.attributeRefferenceValue);
																				}
																			else if(obj.questionType=='85005')
																				{
																					//alert('in first if='+obj.questionId);
																					if(obj.IsMandatory=true)
																						{
																						isMan=1;
																						}
																					else{
																						isMan=0;	
																					}
																					
																						
																					$('#'+obj.attributeCodeId+'_'+isMan).val(obj.attributeValue);
//						 															$('#dob').val(obj.dob);
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
													
													var dcInputPartyId = $('#dcInputPartyId').val();
													$.ajax({
														type : 'POST',
														url : $('#contextPath').val()+"/opportunity/getOpportunityDetails.htm?partyId="+dcInputPartyId,
															
														success : function(result) {					
															$(result).each(function(i,obj) {
																						       
															// alert('occupation='+occupation);
														    var dob =obj.dob;				
														    					    
														    
														    $('#dob').val(dob);
															
									 					   
														    ageCount()
									 					
															
													
														
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
		function ageCount() {
			var dob=$('#dob').val();
		    
		    var date1 = new Date();
		    var  dob1= document.getElementById("dob").value.split("/");;
		    date2= new Date(dob1[2], dob1[1] - 1, dob1[0]);
//		     var date2=new Date(dob);
		    var pattern = /^\d{1,2}\/\d{1,2}\/\d{4}$/; //Regex to validate date format (dd/mm/yyyy)
		    if (pattern.test(dob)) {
		        var y1 = date1.getFullYear(); //getting current year
		        var y2 = date2.getFullYear(); //getting dob year
		        
		        var age = y1 - y2;           //calculating age 
//		         document.write("Age : " + age);
		        $('#dob').val(getAge(date2));
		        return true;
		    } else {
//		         alert("Invalid date format. Please Input in (dd/mm/yyyy) format!");
		        return false;
		    }

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
												//alert('AttributeCodeID='+compositeId.substring(compositeId.indexOf('_')-2));
												//splitArr=compositeId.split('_');
												//questionId=splitArr[0];
												
											//	var isMan=AttributeCodeID.substring(AttributeCodeID.indexOf('_')+1);
												//alert('AttributeCodeID='+AttributeCodeID);
// 												alert('isMan='+isMan);
												//isManQuestionFill=validateDcInput(isMan,questionId,AttributeCodeID);
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
										xmlString += '<QuestionOptionId>'+AttributeCodeIdOption+'</QuestionOptionId><AttributeCodeID>'+AttributeCodeID+'</AttributeCodeID><Value>'+attributeRefferenceValue+'</Value>';
										xmlString += '<OptionValue></OptionValue></Question>';
											
										
										});
						$($('input[name="inputt'+obj1+'"]'))
						.each(
								function(i, obj) {
									id = $(obj).val();
									var questionId = $(obj).attr('id');
// 									alert('questionId='+questionId);
// 									alert('value='+id);
									
										//alert(":isManQuestionFill::"+isManQuestionFill);
//											id=$('#input'+obj1).val();
										var compositeId=$(obj).attr('id');
										//var splitArr=compositeId.split('_');
										
										//alert('AttributeCodeID='+compositeId.substring(compositeId.indexOf('_')-2));
										splitArr=compositeId.split('_');
// 										questionId=splitArr[0];
										AttributeCodeID=splitArr[0];
										var isMan=splitArr[1];
										var attributeRefferenceValue=id;

										
										
											isManQuestionFill=validateDcInput(isMan,AttributeCodeID);
											isValidRetirmentAge=validateRetirmenTage(isMan,AttributeCodeID);
											//alert('isValidData man chk='+isManQuestionFill);
											isValidData=isNumeric(id);
											//alert('isValidData validity chk='+isValidData);
										
											
										
										//								alert(id.indexOf('%'));
//																			for(var i=1;i<8;i++){
																			
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
				'<input  type="hidden" id="sectionName" name="sectionName" value="Retirement Planning"/>');
		
// 		$(".row").each(function(i,obj) {
// 			id = $(obj).val();
// 			var compositeId=$(obj).attr('id');
// 			AttributeCodeID=compositeId.substring(compositeId.indexOf('_')+1);
// 			//var isMan=AttributeCodeID.substring(AttributeCodeID.indexOf('_') + 1);
// 			 alert('id='+id);
// 		 var res = id.split("_");
// 		var questionId=res[0];
// 		alert('questionId='+questionId)
// 		alert('isMan='+isMan)
		
// 		//isManQuestionFill=validateDcInput(isMan,questionId);
// 		});
		
// 		 if(isManQuestionFill==false)
// 			{
// 			showAlertMessage("Message", "Please Answer Mandatory Question.", "error",
// 					doNothing);
// 			 $('.ZebraDialog').css('top','250px');
// 			 return false;
// 			}
// 		 else{
	
	//alert('isManQuestionFill='+isManQuestionFill);
	
	if(isManQuestionFill==false)
		{
		showAlertMessage("Message", "Please Answer Mandatory Question.", "error",
				doNothing);
		 $('.ZebraDialog').css('top','250px');
		 return false;
		}
	else if(isValidRetirmentAge==false)
		{
		showAlertMessage("Message", "Retirement Age Should be greater than current Age.", "error",
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
//        		 showAlertMessage1("Message",
//        					"<br/>Retirement Planning Section saved successfully.",
//        					"confirmation", redirectFurther);
//        		 $('.ZebraDialog').css('top','250px');
					redirectFurther();
					
				}
       	 else{
       		 showAlertMessage1("Message",
       					"<br/>Retirement Planning Section saved successfully.",
       					"confirmation", doNothing);
       		 $('.ZebraDialog').css('top','250px');
       	 }	       
        }
        });
	
	}	
		 }		
// 		}
			function redirectFurther(){
			
				window.location.href = $('#contextPath').val()+'/Cashflow.htm';
		
		}
			function validateDcInput(isMandatory,attributeCodeId)
			{
				
				var value=$('#'+attributeCodeId+'_'+isMandatory).val();
				
				
	 			if(isMandatory==1)
					{
					
					if(value=='')
						{
						return false;
						}
					
	 			
					else{
						return true;
					}
					}	
				
			}
			function validateRetirmenTage (isMandatory,attributeCodeId)
			{
				var dob = $('#dob').val();
				//alert('dob='+dob);
				var value=$('#'+attributeCodeId+'_'+isMandatory).val();
				//alert('value='+value);
// 				var d = new Date();
// 				var n = d.getFullYear();
// 				alert('current year='+n)
// 				var age = n-dob;
// 				alert('age='+age);
				 if(dob>value)
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