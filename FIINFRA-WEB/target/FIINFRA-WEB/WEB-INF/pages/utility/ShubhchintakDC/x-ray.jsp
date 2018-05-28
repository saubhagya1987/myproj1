<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.question.OptionData"%>
<%@page import="in.fiinfra.question.QuestionData"%>
<%@page import="org.aspectj.weaver.patterns.TypePatternQuestions.Question"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.cp.ExpenseData"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.List"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>XRAY-TOOL</title>
</head>
    <!--<script src="js/jquery-1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-responsive.js"></script>
    <script src="js/bootstrap-responsive.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/holder.js"></script>
-->
    


<!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
--><link href="<%=request.getContextPath()%>/css/Axis_dc.css" rel="stylesheet">
<!-- -responsive css-->
	<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>-->
<body onkeyup="selectOption(event)">
<!--css popup window start 1-->
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">
<input type="hidden" id="section" value="${sessionScope.Section}"/>
<input type="hidden" name="dcInputDocId_AnalysisReport" id="dcInputDocId_AnalysisReport" value="${sessionScope.dcInputDocId_AnalysisReport}">
<input type="hidden" name="partyId_Xray" id="partyId_Xray" value="${partyId}">

<form action="" name="showPathFinderOutputPdfForm" method="post" >
</form>
<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
 	
 	
 	
 	
 	 	<section>
		<div class="container">
			<div class="main-content">
				<div class="main-contnet-inner">
					<div class="page-content">
						<div class="page-header clearfix">
							<h1 class="pull-left">X-Ray -${name}</h1>
							<h1 class="pull-right" id="xrayScoreMain">Score[<span id="xrayscore"></span>] </h1>
						</div>
						<div class="container-body">
							
<!-- 							<a class="pull-right margin_5px" -->
<%-- 								href="<%=request.getContextPath()%>/addtask.htm" id=""> --%>
<!-- 								<button -->
<!-- 									class=" dbtn createNewBtn btn btn-primary btn-xs pull-right" -->
<!-- 									id="" title="Cancel"> -->
<!-- 									<i class="fa fa-plus"></i> Cancel -->
<!-- 								</button> -->
<!-- 							</a> -->
							<div class="clearfix"></div>
							 <div class="panel-body" id="riskProfile">
           
              
         
           					 </div> 
           					   <div class="topmenu pull-right">           
						      <div class="dbtn importNewBtn btn btn-primary btn-xs" title="Save" onclick="save('save')"> Save</div>
						      <div class="dbtn importNewBtn btn btn-primary btn-xs" title="Cancel" onclick="history.back()"> Cancel</div>
<!--      			 <input class="btn dbtn" type="button" onclick="save('next')"  value="Next" name="Next">     -->
       			 </div>
						</div>
						<!-- end of container-body div -->
					</div>
				</div>
			</div>
			</div>
	</section>
     
      
<!-- Center part End -->          

<jsp:include page="../../common/footer.jsp" />

</body>
<script>
var firstQuestion=1;
var score1;
var totalScore;
var questionListToIterate = new Array();
var finalresult;
var cntr=0;
$(document).ready(function() {
var partyId_Xray=$('#partyId_Xray').val();
$
.ajax({
	type : "POST",
	url : $('#contextPath').val()
			+ '/dc/getxray.htm?partyId='+partyId_Xray,

	success : function(result) {
		finalresult=result;
		//selectedQuetionOptionList=result;
		$(result)
		.each(
				function(i, obj) {
					
					
					var options = obj.options;
					
					//alert('totalScore='+totalScore);
					if (questionListToIterate
							.contains(obj.questionId)) {
						// 																	alert("in if")

					} else {
						// 																	alert("in else")
						questionListToIterate
								.push(obj.questionId);
					}
// 					alert("result t="+options);	
					if((i+1)%2==0){
						
            			$(
						'#row'+i)
						.append(
								' <div class="col-md-1" ></div> <div class="col-md-6 a riskprofile searchpadding padding_top question'+(i+1)+'" id="question'+obj.questionId+'"><strong>'+(i+1)+'.'+obj.question+'</strong> <ul id="question'+obj.questionId+'tr"></ul></div>');
            			
            		}else{
            			$(
						'#riskProfile')
						.append(
								'<div class="row" id="row'+(i+1)+'">  <div class="col-md-5 a riskprofile searchpadding padding_top question'+(i+1)+'" id="question'+obj.questionId+'"><strong>'+(i+1)+'.'+obj.question+'</strong> <ul id="question'+obj.questionId+'tr"></ul></div></div>');
//             			$('#question'+obj.questionId+'tr')
// 						.append(' <li><input name="'+obj.questionId+'" onclick="selectOption(id, name)" type="radio" id="option'+obj.optionId+'_'+obj.questionId+'" value="'+obj.optionText+'" />'+obj.option+'</li>');
            		}
					 totalScore = obj.totalScore;
					 var id1;
							$(options)
							.each(
									function(j, obj1) {
										
										 
										
										
										if(obj.questionType=='Single_Choice')
										{
										
										
										$('#question'+obj.questionId+'tr')
										.append(' <li>'+(j+1)+' <input name="'+obj.questionId+'" onclick="selectOption(id, name);disableIt(name);" type="radio" id="option'+obj1.optionId+'_'+obj.questionId+'" value="'+obj1.optionText+'" />'+obj1.optionText+'</li>');
										
										//$('#option'+obj1.optionId+'_'+obj.questionId).val(obj1.selected);
										//alert('option='+obj1.optionText+'     '+obj1.selected)
										if(obj1.selected=='1')
											{
											$('input:radio[id=option'+obj1.optionId+'_'+obj.questionId+']').attr('checked', true);	
											//score1= parseInt(obj1.score)+score1;
											}
										else{
											
										}
										
										
										}
										else{
											$('#question'+obj.questionId+'tr')
											.append(' <li>'+(j+1)+' <input name="'+obj.questionId+'" onclick="selectOption(id, name);disableIt(name);" type="checkbox" id="option'+obj1.optionId+'_'+obj.questionId+'" value="'+obj1.optionText+'" />'+obj1.optionText+'</li>');
												if(obj1.selected=='1')
												{
// 												$('input:radio[id=option'+obj1.optionId+'_'+obj.questionId+']').attr('checked', true);	
												$('#option'+obj1.optionId+'_'+obj.questionId).attr('checked','checked')
												}
												else{
													
												}
										}
										});	
							if(totalScore==0 || totalScore==undefined || totalScore=='undefined')
								{
								$('#xrayscore').hide();
								$('#xrayScoreMain').hide();
								}
							else{
								$('#xrayscore').html(totalScore);		
							}
						
					
// 					for (var i=0;i<options.length;i++)
//            			{
// 						$('#question'+obj.questionId+'tr')
// 						.append(' <li><input name="'+obj.questionId+'" onclick="selectOption(id, name)" type="radio" id="option'+obj.optionId+'_'+obj.questionId+'" value="'+obj.optionText+'" />'+obj.option+'</li>');	
//            			}
				});
		//alert('score1='+parseInt(score1))
		//alert('questionListToIterate='+questionListToIterate)
	}
});
	$( document ).ajaxComplete(function() {
		if(finalresult != undefined && cntr==0){
			cntr=1;
			$(finalresult)
			.each(function(i, obj) {
				if(obj.questionId == 501){
					if(obj.options[0].selected == true || obj.options[1].selected == true){
						if(obj.options[1].selected == true){
							$("input[name=502]").attr("disabled","disabled");
							$("input[name=502]").removeAttr('checked');
						}
					}
				}else if(obj.questionId == 504){
					if(obj.options[0].selected == true || obj.options[1].selected == true){
						if(obj.options[1].selected == true){
							$("input[name=505]").attr("disabled","disabled");
							$("input[name=505]").removeAttr('checked');
						}
					}	
				}else if(obj.questionId == 506){
					if(obj.options[0].selected == true || obj.options[1].selected == true){
						if(obj.options[1].selected == true){
							$("input[name=507]").attr("disabled","disabled");
							$("input[name=507]").removeAttr('checked');
						}
					}
				}else if(obj.questionId == 511){
					if(obj.options[0].selected == true || obj.options[1].selected == true){
						if(obj.options[1].selected == true){
							$("input[name=512]").attr("disabled","disabled");
							$("input[name=513]").attr("disabled","disabled");
							$("input[name=512]").removeAttr('checked');
							$("input[name=513]").removeAttr('checked');
						}
					}	
				}else if(obj.questionId == 512){
					if(obj.options[0].selected == true || obj.options[1].selected == true){
						if(obj.options[1].selected == true){
							$("input[name=513]").attr("disabled","disabled");
							$("input[name=513]").removeAttr('checked');
						}
					}	
				}else if(obj.questionId == 514){
					if(obj.options[0].selected == true || obj.options[1].selected == true){
						if(obj.options[1].selected == true){
							$("input[name=515]").attr("disabled","disabled");
							$("input[name=515]").removeAttr('checked');
						}
					}	
				}else if(obj.questionId == 520){
					if(obj.options[0].selected == true || obj.options[1].selected == true){
						if(obj.options[1].selected == true){
							$("input[name=521]").attr("disabled","disabled");
							$("input[name=521]").attr("disabled","disabled");
							$("input[name=521]").removeAttr('checked');
						}
					}	
				}else if(obj.questionId == 523){
					if(obj.options[0].selected == true || obj.options[1].selected == true){
						if(obj.options[1].selected == false){
							$("input[name=524]").attr("disabled","disabled");
							$("input[name=524]").attr("disabled","disabled");
							$("input[name=524]").removeAttr('checked');
						}
					}	
				} 				
			});
		}
	});
});


function selectOption(e){
	//alert('jjj');
	//alert($('.question'+firstQuestion+' input:eq(1)').attr('id'))
	//$('.question'+firstQuestion+' input').removeAttr('checked');
	//$('.question'+firstQuestion+' input:eq(1)').attr('checked',true);
	//$('.question'+firstQuestion+' input:eq(1)').click();
	if((e.keyCode>48 && e.keyCode<53) || (e.keyCode>96 && e.keyCode<101)){
		var num=-1;
		if(e.keyCode==49 || e.keyCode==97)
			num=0;
		else if(e.keyCode==50 || e.keyCode==98)
			num=1;
		else if(e.keyCode==51 || e.keyCode==99)
			num=2;
		else if(e.keyCode==52 || e.keyCode==100)
			num=3;
		if(num!=-1){
		$('.question'+firstQuestion+' input:eq('+num+')').click();
		firstQuestion+=1;
		}
		else{
			$('.question'+firstQuestion+' input').removeAttr('checked');
		}
	}
}

function disableIt(name){
	
	if(name == 501){
		if($("input[name=501]:checked").val() == "No" || $("input[name=501]:checked").val() == "no" || $("input[name=501]:checked").val() == "NO" ){
			$("input[name=502]").attr("disabled","disabled");
			$("input[name=502]").removeAttr('checked');
		}else{
			$("input[name=502]").removeAttr("disabled");
		}
	}
	else if(name == 504){
		if($("input[name=504]:checked").val() == "No" || $("input[name=504]:checked").val() == "no" || $("input[name=504]:checked").val() == "NO" ){
			$("input[name=505]").attr("disabled","disabled");
			$("input[name=505]").removeAttr('checked');
		}else{
			$("input[name=505]").removeAttr("disabled");
		}
	}
	else if(name == 506){
		if($("input[name=506]:checked").val() == "No" || $("input[name=506]:checked").val() == "no" || $("input[name=506]:checked").val() == "NO" ){
			$("input[name=507]").attr("disabled","disabled");
			$("input[name=507]").removeAttr('checked');
		}else{
			$("input[name=507]").removeAttr("disabled");
		}
	}
	else if(name == 511){
		if($("input[name=511]:checked").val() == "No" || $("input[name=511]:checked").val() == "no" || $("input[name=511]:checked").val() == "NO" ){
			$("input[name=512]").attr("disabled","disabled");
			$("input[name=513]").attr("disabled","disabled");
			$("input[name=512]").removeAttr('checked');
			$("input[name=513]").removeAttr('checked');
		}else{
			$("input[name=512]").removeAttr("disabled");
			$("input[name=513]").removeAttr("disabled");
		}
	}
	else if(name == 512){
		if($("input[name=512]:checked").val() == "No" || $("input[name=512]:checked").val() == "no" || $("input[name=512]:checked").val() == "NO" ){
			$("input[name=513]").attr("disabled","disabled");
			$("input[name=513]").removeAttr('checked');
		}else{
			$("input[name=513]").removeAttr("disabled");
		}
	}
	else if(name == 514){
		if($("input[name=514]:checked").val() == "No" || $("input[name=514]:checked").val() == "no" || $("input[name=514]:checked").val() == "NO" ){
			$("input[name=515]").attr("disabled","disabled");
			$("input[name=515]").removeAttr('checked');
		}else{
			$("input[name=515]").removeAttr("disabled");
		}
	}
	else if(name == 520){
		if($("input[name=520]:checked").val() == "No" || $("input[name=520]:checked").val() == "no" || $("input[name=520]:checked").val() == "NO" ){
			$("input[name=521]").attr("disabled","disabled");
			$("input[name=521]").removeAttr('checked');
		}else{
			$("input[name=521]").removeAttr("disabled");
		}
	}
	else if(name == 523){
		if($("input[name=523]:checked").val() == "Yes" || $("input[name=523]:checked").val() == "yes" || $("input[name=523]:checked").val() == "YES" ){
			$("input[name=524]").attr("disabled","disabled");
			$("input[name=524]").removeAttr('checked');
		}else{
			$("input[name=524]").removeAttr("disabled");
		}
	}
	
}

function save(buttonType)
{
	var counter = 0;
	var checkedFlag = true;
	 $(questionListToIterate)
	 .each(
	   function(i, obj1) {
	    
	    $($('input[name="' + obj1 + '"]:checked')).each(function(i, obj) {
	       if(checkedFlag && obj1==517)
	       {  
	        checkedFlag = false;
	        counter++;
	       }
	       else if(obj1!=517)
	       {
	    	   var radioButtonVal =  $("input[name="+obj1+"]:checked").val();
	    	   if(obj1==501)
	    	   {
	            counter++;
	            if(radioButtonVal=='No')
	            {
	            	counter++;
	            }
	    	   }
	    	   else if(obj1==504)
	    	   {
	            counter++;
	            if(radioButtonVal=='No')
	            {
	            	counter++;
	            }
	    	   }
	    	   else if(obj1==506)
	    	   {
	            counter++;
	            if(radioButtonVal=='No')
	            {
	            	counter++;
	            }
	    	   }
	    	   else if(obj1==511)
	    	   {
	            counter++;
	            if(radioButtonVal=='No')
	            {
	            	counter++;
	            }
	    	   }
	    	   else if(obj1==512)
	    	   {
	            counter++;
	            if(radioButtonVal=='No')
	            {
	            	counter++;
	            }
	    	   }
	    	   else if(obj1==514)
	    	   {
	            counter++;
	            if(radioButtonVal=='No')
	            {
	            	counter++;
	            }
	    	   }
	    	   else if(obj1==520)
	    	   {
	            counter++;
	            if(radioButtonVal=='No')
	            {
	            	counter++;
	            }
	    	   }
	    	   if(obj1==523)
	    	   {
	            counter++;
	            if(radioButtonVal=='Yes')
	            {
	            	counter++;
	            }
	    	   }
	    	   else if(obj1!=501 && obj1!=504 && obj1!=506 && obj1!=511 && obj1!=512 && obj1!=514 && obj1!=520 && obj1!=523 ){ counter++; }
	    	   
	    	   
	       }
	      });
	    
	 });
	 if(counter==25){ 
	var xmlString = "<Root>";
	$(questionListToIterate)
	.each(
			function(i, obj1) {
				// 				alert($('a[name="' + obj + '"]').html());
				$($('input[name="' + obj1 + '"]:checked'))
						.each(
								function(i, obj) {
									id = $(obj).attr('id');
// 									alert('id='+id)
// 									alert('selected id value='+$('#'+id).val())
									var reserveId = id;
// 											alert($('input[id='+id+']').val());
									id = id
											.substring(id
													.indexOf('option') + 6);
											var arrOfSplitedId = id.split('_');
											optionId = arrOfSplitedId[0];
											QuestionId = arrOfSplitedId[1];
											var optionText = $('#'+reserveId).val();
											//alert('value='+$('#'+id).val()+'   '+'optionText='+optionText);
// 											$('#'+id).val();
											
											//alert('optionId='+optionId+'  '+'QuestionId='+QuestionId+'   '+'optionTex='+optionText)
											
											
											
											xmlString += '<Question><QuestionId>'
												+ QuestionId
												+ '</QuestionId>';
										xmlString += '<QuestionOptionId>'
												+ optionId
												+ '</QuestionOptionId><OptionText>'
												+optionText
												+'</OptionText>';
										xmlString += '</Question>';

//										}
								});
				var count=1;
				
//					alert('AttributeCodeID='+AttributeCodeID);
			
			
				
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
											+ QuestionId
											+ '</QuestionId>';
									xmlString += '<QuestionOptionId>'
											+ optionId
											+ '</QuestionOptionId><OptionText>'
											+optionText
											+'</OptionText>';
									xmlString += '</Question>';
									} else {
										xmlString += '<Question><QuestionId>'
											+ QuestionId
											+ '</QuestionId>';
									xmlString += '<QuestionOptionId>'
											+ optionId
											+ '</QuestionOptionId><OptionText>'
											+optionText
											+'</OptionText>';
									xmlString += '</Question>';
									}
								});

			});
xmlString += "</Root>";
// alert('xmlString='+xmlString);
//console.log();
console.log("xmlString="+xmlString); 
try{
	$('#XMlString').remove();
	$('#questionBankId').remove();
	$('#sectionTypeId').remove();
	}catch(e)
	{
		
	}
	var partyId_Xray=$('#partyId_Xray').val();
	//alert('partyId_Xray='+partyId_Xray)
$('body')
.append(
		'<form name="financialStatusForm1" method="post" id="financialStatusForm1">');
$('#financialStatusForm1')
.append(
		'<input  type="hidden" id="partyId" name="partyId" value="'+partyId_Xray+'"/>');

$('#financialStatusForm1')
.append(
		'<input  type="hidden" id="XMlString" name="XMlString" value="'+xmlString+'"/>');



// $(".a").each(function(i) {
// 	 var id = $(this).attr('id');
// //		alert('id==='+id);
// 	 id = id
// 		.substring(id
// 				.indexOf('question') + 8);
	

// 	 var AttributeCodeID=id;
// 	 var isMan=AttributeCodeID.substring(AttributeCodeID.indexOf('_') + 1);
	
//	 var res = id.split("_");
//	var questionId=res[0];

//isValidData= validateDcInput(AttributeCodeID);

/*if(isValidData==false)
{
showAlertMessage("Message", "Please Answer All Questions.", "error",
	doNothing);
$('.ZebraDialog').css('top','250px');
return false;
}*/


// 	});

//if(isValidData==true)
//	{
	$.ajax({
         type : "POST",
         url : $('#contextPath').val()+'/dc/insertXray.htm',
         data :  $("#financialStatusForm1").serialize(), 
         success : function(result) {
        		 var recordCount=result[0];
        		 var score = result[1];
        		
        		// var isDocIdAvailable = $('#dcInputDocId_AnalysisReport').val();
     			//alert('recordCount='+result + ' '+ 'score='+score);
     			if(recordCount>=1)
     				{
     				showAlertMessage1("Message",
        					"<br/>X-RAY Section saved successfully.",
        					"confirmation",reloadPage );
        		 $('.ZebraDialog').css('top','250px');
     				}
        		// $('#xrayscore').html(score);
        		 
        	 }	       
         });
	
      }else{ 
    	  showAlertMessage("Error","  All the questions are mandatory.  ", 'error', doNothing);
      }	//alert('All Questions are Mandetory.');	
	}
// else{
	
// }		//window.location.href = $('#contextPath').val()+'/Cashflow.htm';
// }
 </script>
</html>