<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
#confirmDialog1 { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
.common_in_content{height:400px;}
</style>
<style>
#page_loader{
		background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
	} 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
 <title>Auto Plan</title>
<script>

	$(document).ready(function(){
		  $("body").on("click",".expense",function(){
		    $(".expense").removeClass("common_radio_button_checked");
			$(this).addClass("common_radio_button_checked");			
		       $(this).next( ".default_radio" ).prop("checked", true);		
			
		  });
		  
		  $("body").on("click",".income",function(){
			    $(".income").removeClass("common_radio_button_checked");
				$(this).addClass("common_radio_button_checked");			
			       $(this).next( ".default_radio" ).prop("checked", true);		
				
			  });
		  
		  $("body").on("click",".months",function(){
			    $(".months").removeClass("common_radio_button_checked");
				$(this).addClass("common_radio_button_checked");			
			       $(this).next( ".default_radio" ).prop("checked", true);		
				
			  });
		  
		  $("body").on("click",".will",function(){
			    $(".will").removeClass("common_radio_button_checked");
				$(this).addClass("common_radio_button_checked");			
			       $(this).next( ".default_radio" ).prop("checked", true);		
				
			  });
		  
		  $("body").on("click",".loan",function(){
			    $(".loan").removeClass("common_radio_button_checked");
				$(this).addClass("common_radio_button_checked");			
			       $(this).next( ".default_radio" ).prop("checked", true);		
				
			  });
		  
		  $("body").on("click",".life",function(){
			    $(".life").removeClass("common_radio_button_checked");
				$(this).addClass("common_radio_button_checked");			
			       $(this).next( ".default_radio" ).prop("checked", true);		
				
			  });
		  
		  $("body").on("click",".health",function(){
			    $(".health").removeClass("common_radio_button_checked");
				$(this).addClass("common_radio_button_checked");			
			       $(this).next( ".default_radio" ).prop("checked", true);		
				
			  });
		  
		  $("body").on("click",".critical",function(){
			    $(".critical").removeClass("common_radio_button_checked");
				$(this).addClass("common_radio_button_checked");			
			       $(this).next( ".default_radio" ).prop("checked", true);		
				
			  });
		  
		  $("body").on("click",".asset",function(){
			    $(".asset").removeClass("common_radio_button_checked");
				$(this).addClass("common_radio_button_checked");			
			       $(this).next( ".default_radio" ).prop("checked", true);		
				
			  });
		  
		  $("body").on("click",".family",function(){
			    $(".family").removeClass("common_radio_button_checked");
				$(this).addClass("common_radio_button_checked");			
			       $(this).next( ".default_radio" ).prop("checked", true);		
				
			  });
		  
		  $("body").on("click",".gender",function(){
			    $(".gender").removeClass("common_radio_button_checked");
				$(this).addClass("common_radio_button_checked");			
			       $(this).next( ".default_radio" ).prop("checked", true);		
				
			  });
		});
	
var ajaxFlag = true;
var dataXML='';
var goalXML='';
var partyttributeDataXML='';
var familyMemberDataXML='';

var initialDataXML='';
var initialGoalXML='';
var initialPartyttributeDataXML='';
var initialFamilyMemberDataXML='';

var finalDataXML='';
var finalGoalXML='';
var finalPartyttributeDataXML='';
var finalFamilyMemberDataXML='';

function toggleLifeInsurance(value) {
	if(value == '1') {
		$("#94018").attr("readonly",false);
	} else {
		$("#94018").attr("readonly",true);
		$("#94018").val('');
	}
}

function toggleHealthInsurance(value) {
	if(value == '1') {
		$("#94019").attr("readonly",false);
	} else {
		$("#94019").attr("readonly",true);
		$("#94019").val('');
	}
}

function toggleCriticalInsurance(value) {
	if(value == '1') {
		$("#94024").attr("readonly",false);
	} else {
		$("#94024").attr("readonly",true);
		$("#94024").val('');
	}
}

function toggleCriticalInsurance(value) {
	if(value == '1') {
		$("#94024").attr("readonly",false);
	} else {
		$("#94024").attr("readonly",true);
		$("#94024").val('');
	}
}

function toggleIncomeInsurance() {	
		$("#income").val('');
}

function toggleExpenseInsurance() {
	$("#expense").val('');
}

function toggleRadioButtons(type) {
	if(type == 'income') {		
		$('input:radio[name=94067]').each(function () { $(this).prop('checked', false); });
		$(".income").removeClass("common_radio_button_checked");
	}
	else { 		
		$('input:radio[name=94074]').each(function () { $(this).prop('checked', false); });
		$(".expense").removeClass("common_radio_button_checked");
	}
}

function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}

function closeDialog(){
	  $(".overlay").fadeOut("slow");
	     $("#confirmDialog").fadeOut("slow");
}	

function cancel(url){
		createDataXml();
		createGoalXml();
		createPartyAttributeDataXML();
		//createFamilyMemberDataXML();
		
		finalDataXML=dataXML;
		finalGoalXML=goalXML;
		finalPartyttributeDataXML=partyttributeDataXML;
		finalFamilyMemberDataXML=familyMemberDataXML;
		if(finalDataXML==initialDataXML && finalGoalXML==initialGoalXML && finalPartyttributeDataXML==initialPartyttributeDataXML /* && finalFamilyMemberDataXML==initialFamilyMemberDataXML */) {
			javascript:location.href=url;
		 }else{
			 
			 $(".aa_up").html("<spring:message code='dataChanged' />");
				$(".aa_yes").click(function(){
				cancelPage(url);
				});	
				$(".overlay").fadeIn();
				$("#confirmDialog").fadeIn();
		} 
	}
	function back(url){
		javascript:location.href=url;
	}

	function cancelPage(url){
		javascript:location.href=url;
	}
	

$(document).ready(function(){
		
	//getAutoComplete();
	 $(".wrapper").addClass('autoplan_review_wrapper');

	$( ".gname" ).change(function() {
		  var nameid = $(this).attr('id');
		  var index = nameid.charAt(nameid.length-1);
		  if($("#"+nameid).val() == '') {
			  $("#goalType"+index).removeClass('required');
			  //$("#goalFor"+index).removeClass('required');
			  $("#goalYear"+index).removeClass('required');
			  $("#goalAmount"+index).removeClass('required');
		  } else {
			  $("#goalType"+index).addClass('required');
			  //$("#goalFor"+index).addClass('required');
			  $("#goalYear"+index).addClass('required');
			  $("#goalAmount"+index).addClass('required');
		  }
		  
		});
	

	
	$("#autoPlanFrm").validate({
		  ignore:'', //i.e. do not ignore hidden elements
		  /* rules:{	retAge:{min:40,max:99},lifeExp:{min:70,max:100}} */
		 });
    $('.common_in_content').slimScroll();
    if(${goalDataSize} == 0) {
		$("#actualGoalSize").val(1);
    } else {
    	$("#actualGoalSize").val(${goalDataSize});
    }
     
  	$( "#tabs" ).tabs();
    $("defaultSelect").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
	 	
	 
	  $( "#site_theme" ).one( "click", function() {
    
}); 
	
	  $("#brand").addClass('required');
	  
	  $("#confirmDialog .close").click(function(){
		    $(".overlay").fadeOut("slow");
		 $("#confirmDialog").fadeOut("slow");
		  }); 
	  
	  $('.number').bind('keypress', function (evt) {
		    var charCode = (evt.which) ? evt.which : event.keyCode;		   
		    if (charCode > 31 && ((charCode<48 || charCode>57)))
		        return false;
		    return true;
		});
});
function onSave() {
	$("#name").val($("#firstName").val()+ " " + $("#lastName").val());
	$("#isSave").val('1');
	createDataXml();
	createGoalXml();
	
	if($("#goalType0").val()!='' /* || $("#goalFor0").val()!='' */ || $("#goalYear0").val()!='' || $("#goalAmount0").val()!='' || $("#goalName0").val()!='') {
		$("#goalType0").addClass('required');
	  	$("#goalFor0").addClass('required');
	  	$("#goalYear0").addClass('required');
	  	$("#goalAmount0").addClass('required');
	  	$("#goalName0").addClass('required');
	}
	  
	  
	  
	  
	createPartyAttributeDataXML();
	//createFamilyMemberDataXML();	
	finalDataXML=dataXML;	
	finalGoalXML=goalXML;
	finalPartyttributeDataXML=partyttributeDataXML;
	finalFamilyMemberDataXML=familyMemberDataXML;	
	
	
	 if(!calculateAge1()){
	}
	else {		
		if($('#autoPlanFrm').validate().form()){
			var selectedVal = "";
			var selected = $("input[name='94067']:checked");			
			if (selected.length > 0) {
			    selectedVal = selected.val();
			}			
			 if(selectedVal == '' && $("#income").val()=='') {
				 $("#successDialog").html("Please enter Annual Income");
					$( "#successDialog").dialog( "open" );
			 } else {
				 var selectedVal = "";
					var selected = $("input[name='94074']:checked");					
					if (selected.length > 0) {
					    selectedVal = selected.val();
					}			
					if(selectedVal == "" && $("#expense").val()=="") {
						 $("#successDialog").html("Please enter Monthly Expense");
						$( "#successDialog").dialog( "open" );	 					 
			 		}
					else {
						 var selectedVal = "";
							var selected = $("input[name='94013']:checked");					
							if (selected.length > 0) {
							    selectedVal = selected.val();
							}			
							if(selectedVal == 1 && $("#94018").val()== "") {
								 $("#successDialog").html("Please enter Life Insurance Cover Amount");
								$( "#successDialog").dialog( "open" );	 					 
					 		}
							else {
								var selectedVal = "";
								var selected = $("input[name='94020']:checked");					
								if (selected.length > 0) {
								    selectedVal = selected.val();
								}			
								if(selectedVal == 1 && $("#94019").val()== "") {
									 $("#successDialog").html("Please enter Health Insurance Cover Amount");
									$( "#successDialog").dialog( "open" );	 					 
						 		}
								else {
									var selectedVal = "";
									var selected = $("input[name='94025']:checked");					
									if (selected.length > 0) {
									    selectedVal = selected.val();
									}			
									if(selectedVal == 1 && $("#94024").val()== "") {
										$("#successDialog").html("Please enter Critical Illness Insurance Cover Amount");
										$( "#successDialog").dialog( "open" );	 					 
							 		}
									else {
										var selectedVal = "";
										var selected = $("input[name='94009']:checked");			
										if (selected.length > 0) {
										    selectedVal = selected.val();
										}	
										if(selectedVal == ''){
											$("#successDialog").html("Please enter number of months you can manage without an income");
											$( "#successDialog").dialog( "open" );	 			
										}
										else {
											if(finalDataXML==initialDataXML && finalGoalXML==initialGoalXML && finalPartyttributeDataXML==initialPartyttributeDataXML && finalFamilyMemberDataXML==initialFamilyMemberDataXML) {
												alertMessage("You haven't changed any data yet. Please make some changes then save.");
											} else {
												$("#autoPlanFrm").submit();
											}
										}
									}
				
								}
							}
		
						}
				}
		}
	}
	 
}

function createDataXml() {
	dataXML='<Root>';
		
		dataXML+='<Title>';
		if($("#title").val() != null)
			dataXML+=$("#title").val();
		else
			dataXML+="0";
		dataXML+='</Title>';
		
		dataXML+='<FirstName>';
		dataXML+=$("#firstName").val();
		dataXML+='</FirstName>';
		
		dataXML+='<LastName>';
		dataXML+=$("#lastName").val();
		dataXML+='</LastName>';
		
		dataXML+='<ResStatus>';
		if($("#resStatus").val() != null)
			dataXML+=$("#resStatus").val();
		else
			dataXML+="0";				
		dataXML+='</ResStatus>';
		
		dataXML+='<DOB>';
		dataXML+=$("#dob").val();
		dataXML+='</DOB>';
		
		dataXML+='<MaritalStatus>';
		if($("#maritalStatus").val() != null)
			dataXML+=$("#maritalStatus").val();
		else
			dataXML+="0";	
		dataXML+='</MaritalStatus>';
		
		dataXML+='<Occupation>';
		if($("#occupation").val() != null)
			dataXML+=$("#occupation").val();
		else
			dataXML+="0";	
		dataXML+='</Occupation>';
		
		dataXML+='<ContactNo>';
		dataXML+=$("#contactNo").val();
		dataXML+='</ContactNo>';
		
		dataXML+='<EmailId>';
		dataXML+=$("#email").val();
		dataXML+='</EmailId>';
		
		/* dataXML+='<Income>';
		dataXML+=$("#income").val();
		dataXML+='</Income>'; */
		
		/* dataXML+='<Expense>';
		dataXML+=$("#expense").val();
		dataXML+='</Expense>'; */
		
		dataXML+='<RiskProfileId>';
		if($("#brand").val() != null)
			dataXML+=$("#brand").val();
		else
			dataXML+="0";	
		dataXML+='</RiskProfileId>';
		
		
		var selectedVal = "";
		var selected = $("input[name='IsWill']:checked");		
		if (selected.length > 0) {
		    selectedVal = selected.val();
		}		
		dataXML+='<Will>';
		dataXML+=selectedVal;
		dataXML+='</Will>';
		
		var selectedVal = "";
		var selected = $("input[name='gender']:checked");		
		if (selected.length > 0) {
		    selectedVal = selected.val();
		}		
		dataXML+='<Gender>';
		dataXML+=selectedVal;
		dataXML+='</Gender>';
		
		
		dataXML+='<EMI>';
		dataXML+=$("#EMIamt").val();
		dataXML+='</EMI>';
		
		dataXML+='<MonthlyInvesment>';
		dataXML+=$("#monthlyInvesment").val();
		dataXML+='</MonthlyInvesment>';
		
		dataXML+='<IsSave>'+$("#isSave").val()+'</IsSave>';
				
		/* dataXML+='<EmergencyMonth>';
		dataXML+=$("#emergencyMonths").val();
		dataXML+='</EmergencyMonth>'; 		
		
		dataXML+='<PanNo>';
		dataXML+=$("#panNo").val();
		dataXML+='</PanNo>'; 
				
		dataXML+='<City>';
		dataXML+=($("#city option:selected").text());
		dataXML+='</City>';
		
		dataXML+='<RetirementAge>';
		dataXML+=$("#retAge").val();
		dataXML+='</RetirementAge>';
		
		dataXML+='<LifeExpectancy>';
		dataXML+=$("#lifeExp").val();
		dataXML+='</LifeExpectancy>';
				 */	
	dataXML+='</Root>';
	$("#dataXML").val(dataXML);
	
}

function createGoalXml() {
	var goalDataLength = $("#goalDataSize").val();
	var i=0;
	goalXML='<Root>';
	if(!($("#actualGoalSize").val() == 1 && $(".gname").val() == '')) {
	for(i=0;i<goalDataLength;i++) {
		goalTest="#goalName"+i;
		goalname=$(goalTest).val();
		if(goalname != undefined)
		{
		goalXML+='<Goal>';
			goalXML+='<GoalDescription>';
			goalNameVar="#goalName"+i;
			goalXML+=$(goalNameVar).val();
			goalXML+='</GoalDescription>';
			
			goalXML+='<GoalEndYear>';
			var goalyearVar = "#goalYear"+i;
			goalXML+=$(goalyearVar).val();
			goalXML+='</GoalEndYear>';
			
			goalXML+='<GoalAmountPv>';
			var goalAmtVar="#goalAmount"+i;
			goalXML+=$(goalAmtVar).val();
			goalXML+='</GoalAmountPv>';
			
			goalXML+='<GoalTypeId>';
			var goalTypeVar="#goalType"+i;
			goalXML+=$(goalTypeVar).val();
			goalXML+='</GoalTypeId>';
		
			goalXML+='<GoalFamilyPartyID>';
			//var goalForVar="#goalFor"+i;
			//goalXML+=$(goalForVar).val();
			goalXML+=${autoPlanData.partyId}
			goalXML+='</GoalFamilyPartyID>';
			
			goalXML+='<GoalStartYear>0';			
			goalXML+='</GoalStartYear>'
			
			goalXML+='<IsLoan>0';
			goalXML+='</IsLoan>';
			
			goalXML+='<LoanAmount>0';
			goalXML+='</LoanAmount>';
			
			goalXML+='<LoanDownPayment>';	
			var goalAmtVar="#goalAmount"+i;
			goalXML+=$(goalAmtVar).val();
			goalXML+='</LoanDownPayment>';
			
			goalXML+='<LoanInterestPercentage>0';			
			goalXML+='</LoanInterestPercentage>';
			
			goalXML+='<LoanDurationYears>0'			
			goalXML+='</LoanDurationYears>';
		
			goalXML+='<GoalName>';
			goalNameVar="#goalName"+i;
			goalXML+=$(goalNameVar).val();
			goalXML+='</GoalName>'; 
		goalXML+='</Goal>';
	}
		
	}
	}
	goalXML+='</Root>'
	$("#goalXML").val(goalXML);	
}

function createPartyAttributeDataXML(){
	 partyttributeDataXML='<Root>';
		$("#autoPlanFrm").find(".answer").each(function (index) {		
			if($(this).val() != ""){
				var attrid = $( this ).attr("id");
				id = "#"+attrid;
				var attrName= $( this ).attr("name");
				name=attrName.split('_')[1];
				if(name != 'undefined') {
					attributeCodeId = name;
					attributeValue = attrid;
					attributereferenceValue = $(id).val();
				}
				else {					
					attributeCodeId = attrid;
					attributeValue =  $(id).val();
					attributereferenceValue = $(id).val();
				}
				
			partyttributeDataXML+='<Data>';
				partyttributeDataXML+='<AttributeCodeId>';
				partyttributeDataXML+= attributeCodeId;
				partyttributeDataXML+='</AttributeCodeId>'
				
				partyttributeDataXML+='<AttributeValue>';
				partyttributeDataXML+= attributeValue;
				partyttributeDataXML+='</AttributeValue>';
				
				partyttributeDataXML+='<AttributeReferenceValue>';
				partyttributeDataXML+= attributereferenceValue;
				partyttributeDataXML+='</AttributeReferenceValue>';
			partyttributeDataXML+='</Data>';
			
			}		
		});
		if($("#income").val() == '') {
			var selectedVal = "";
			var selected = $("input[name='94067']:checked");
			var id = $("input[name='94067']:checked").attr('id');
			if (selected.length > 0) {
			    selectedVal = selected.val();
			}			
			 if(selectedVal != '') {
				 partyttributeDataXML+='<Data>';
					partyttributeDataXML+='<AttributeCodeId>';
					partyttributeDataXML+= 94067;
					partyttributeDataXML+='</AttributeCodeId>'
					
					partyttributeDataXML+='<AttributeValue>';
					partyttributeDataXML+= id;
					partyttributeDataXML+='</AttributeValue>';
					
					partyttributeDataXML+='<AttributeReferenceValue>';
					partyttributeDataXML+= selectedVal;
					partyttributeDataXML+='</AttributeReferenceValue>';
				partyttributeDataXML+='</Data>';
			} 
		}
			else {
			partyttributeDataXML+='<Data>';
			partyttributeDataXML+='<AttributeCodeId>';
			partyttributeDataXML+= 94067;
			partyttributeDataXML+='</AttributeCodeId>'
			
			partyttributeDataXML+='<AttributeValue>';
			partyttributeDataXML+= 94067;
			partyttributeDataXML+='</AttributeValue>';
			
			partyttributeDataXML+='<AttributeReferenceValue>';
			partyttributeDataXML+= $("#income").val();
			partyttributeDataXML+='</AttributeReferenceValue>';
		partyttributeDataXML+='</Data>';
			
}
		if($("#expense").val() == '') {
			var selectedVal = "";
			var selected = $("input[name='94074']:checked");
			var id = $("input[name='94074']:checked").attr('id');
			if (selected.length > 0) {
			    selectedVal = selected.val();
			}			
			 if(selectedVal != '') {
				 partyttributeDataXML+='<Data>';
					partyttributeDataXML+='<AttributeCodeId>';
					partyttributeDataXML+= 94074;
					partyttributeDataXML+='</AttributeCodeId>'
					
					partyttributeDataXML+='<AttributeValue>';
					partyttributeDataXML+= id;
					partyttributeDataXML+='</AttributeValue>';
					
					partyttributeDataXML+='<AttributeReferenceValue>';
					partyttributeDataXML+= selectedVal;
					partyttributeDataXML+='</AttributeReferenceValue>';
				partyttributeDataXML+='</Data>';
			} 
		}
			else {
			partyttributeDataXML+='<Data>';
			partyttributeDataXML+='<AttributeCodeId>';
			partyttributeDataXML+= 94074;
			partyttributeDataXML+='</AttributeCodeId>'
			
			partyttributeDataXML+='<AttributeValue>';
			partyttributeDataXML+= 94074;
			partyttributeDataXML+='</AttributeValue>';
			
			partyttributeDataXML+='<AttributeReferenceValue>';
			partyttributeDataXML+= $("#expense").val();
			partyttributeDataXML+='</AttributeReferenceValue>';
		partyttributeDataXML+='</Data>';
	}		
		
			var selectedVal = "";
			var selected = $("input[name='94008']:checked");
			var id = $("input[name='94008']:checked").attr('id');
			if (selected.length > 0) {
			    selectedVal = selected.val();
			}			
			 
			if(selectedVal != '') {
				 partyttributeDataXML+='<Data>';
					partyttributeDataXML+='<AttributeCodeId>';
					partyttributeDataXML+= 94008;
					partyttributeDataXML+='</AttributeCodeId>'
					
					partyttributeDataXML+='<AttributeValue>';
					partyttributeDataXML+= id;
					partyttributeDataXML+='</AttributeValue>';
					
					partyttributeDataXML+='<AttributeReferenceValue>';
					partyttributeDataXML+= selectedVal;
					partyttributeDataXML+='</AttributeReferenceValue>';
				partyttributeDataXML+='</Data>';
			}
				
				var selectedVal = "";
				var selected = $("input[name='94009']:checked");
				var id = $("input[name='94009']:checked").attr('id');
				if (selected.length > 0) {
				    selectedVal = selected.val();
				}			
				if(selectedVal != '') {
					 partyttributeDataXML+='<Data>';
						partyttributeDataXML+='<AttributeCodeId>';
						partyttributeDataXML+= 94009;
						partyttributeDataXML+='</AttributeCodeId>'
						
						partyttributeDataXML+='<AttributeValue>';
						partyttributeDataXML+= id;
						partyttributeDataXML+='</AttributeValue>';
						
						partyttributeDataXML+='<AttributeReferenceValue>';													
						partyttributeDataXML+= selectedVal;						
						partyttributeDataXML+='</AttributeReferenceValue>';
					partyttributeDataXML+='</Data>';
				}	
					
					var selectedVal = "";
					var selected = $("input[name='94013']:checked");
					var id = $("input[name='94013']:checked").attr('id');
					if (selected.length > 0) {
					    selectedVal = selected.val();
					}			
					if(selectedVal != '') {
						 partyttributeDataXML+='<Data>';
							partyttributeDataXML+='<AttributeCodeId>';
							partyttributeDataXML+= 94013;
							partyttributeDataXML+='</AttributeCodeId>'
							
							partyttributeDataXML+='<AttributeValue>';
							partyttributeDataXML+= id;
							partyttributeDataXML+='</AttributeValue>';
							
							partyttributeDataXML+='<AttributeReferenceValue>';													
							partyttributeDataXML+= selectedVal;						
							partyttributeDataXML+='</AttributeReferenceValue>';
						partyttributeDataXML+='</Data>';
						
					}
						var selectedVal = "";
						var selected = $("input[name='94020']:checked");
						var id = $("input[name='94020']:checked").attr('id');
						if (selected.length > 0) {
						    selectedVal = selected.val();
						}			
						if(selectedVal != '') {
							 partyttributeDataXML+='<Data>';
								partyttributeDataXML+='<AttributeCodeId>';
								partyttributeDataXML+= 94020;
								partyttributeDataXML+='</AttributeCodeId>'
								
								partyttributeDataXML+='<AttributeValue>';
								partyttributeDataXML+= id;
								partyttributeDataXML+='</AttributeValue>';
								
								partyttributeDataXML+='<AttributeReferenceValue>';													
								partyttributeDataXML+= selectedVal;						
								partyttributeDataXML+='</AttributeReferenceValue>';
							partyttributeDataXML+='</Data>';
						}	
							
							var selectedVal = "";
							var selected = $("input[name='94025']:checked");
							var id = $("input[name='94025']:checked").attr('id');
							if (selected.length > 0) {
							    selectedVal = selected.val();
							}			
							if(selectedVal != '') { 
								 partyttributeDataXML+='<Data>';
									partyttributeDataXML+='<AttributeCodeId>';
									partyttributeDataXML+= 94025;
									partyttributeDataXML+='</AttributeCodeId>'
									
									partyttributeDataXML+='<AttributeValue>';
									partyttributeDataXML+= id;
									partyttributeDataXML+='</AttributeValue>';
									
									partyttributeDataXML+='<AttributeReferenceValue>';													
									partyttributeDataXML+= selectedVal;						
									partyttributeDataXML+='</AttributeReferenceValue>';
								partyttributeDataXML+='</Data>';
							}	
								
								var selectedVal = "";
								var selected = $("input[name='94108']:checked");
								var id = $("input[name='94108']:checked").attr('id');
								if (selected.length > 0) {
								    selectedVal = selected.val();
								}			
								if(selectedVal != '') {	 
									 partyttributeDataXML+='<Data>';
										partyttributeDataXML+='<AttributeCodeId>';
										partyttributeDataXML+= 94108;
										partyttributeDataXML+='</AttributeCodeId>'
										
										partyttributeDataXML+='<AttributeValue>';
										partyttributeDataXML+= id;
										partyttributeDataXML+='</AttributeValue>';
										
										partyttributeDataXML+='<AttributeReferenceValue>';													
										partyttributeDataXML+= selectedVal;						
										partyttributeDataXML+='</AttributeReferenceValue>';
									partyttributeDataXML+='</Data>';
								}		
								
								var selectedVal = "";
								var selected = $("input[name='94102']:checked");
								var id = $("input[name='94102']:checked").attr('id');
								if (selected.length > 0) {
								    selectedVal = selected.val();
								}			
								if(selectedVal != '') {	 
									 partyttributeDataXML+='<Data>';
										partyttributeDataXML+='<AttributeCodeId>';
										partyttributeDataXML+= 94102;
										partyttributeDataXML+='</AttributeCodeId>'
										
										partyttributeDataXML+='<AttributeValue>';
										partyttributeDataXML+= id;
										partyttributeDataXML+='</AttributeValue>';
										
										partyttributeDataXML+='<AttributeReferenceValue>';													
										partyttributeDataXML+= selectedVal;						
										partyttributeDataXML+='</AttributeReferenceValue>';
									partyttributeDataXML+='</Data>';
								}		
								
								var selectedVal = "";
								var selected = $("input[name='94092']:checked");
								var id = $("input[name='94092']:checked").attr('id');
								if (selected.length > 0) {
								    selectedVal = selected.val();
								}			
								if(selectedVal != '') {	 
									 partyttributeDataXML+='<Data>';
										partyttributeDataXML+='<AttributeCodeId>';
										partyttributeDataXML+= 94092;
										partyttributeDataXML+='</AttributeCodeId>'
										
										partyttributeDataXML+='<AttributeValue>';
										partyttributeDataXML+= id;
										partyttributeDataXML+='</AttributeValue>';
										
										partyttributeDataXML+='<AttributeReferenceValue>';													
										partyttributeDataXML+= selectedVal;						
										partyttributeDataXML+='</AttributeReferenceValue>';
									partyttributeDataXML+='</Data>';
								}		

		partyttributeDataXML+='</Root>';
		
		$("#partyAttributeDataXML").val(partyttributeDataXML);	

}

</script>
<!-- Custom Selectbox Ends -->

<!--Common Custom checkbox -->
<script>
$(document).ready(function(){
  $("body").on("click",".autoplan_common_custom_checkbox",function(){
    $(this).toggleClass("white_checkbox_checked");
	
	 if ($(this).next( ".default_checkbox" ).is(":checked")) {
		
       $(this).next( ".default_checkbox" ).prop("checked", false);
    } else {
       $(this).next( ".default_checkbox" ).prop("checked", true);
	
    }
	
  });
});
</script>
<!--Common Custom checkbox ends-->

<script>
$(document).ready(function(){
	
	$(function() {
     $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
      showOn: "button",
	  buttonText: '',
	  changeMonth: true,
      changeYear: true,
      yearRange: "-100:+0"
     });
	  $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
  });
	
    $(".defaultSelect").selectBoxIt();

});
</script>

<script>
  $(function() {
   
	 // Preferred Product Count Intlalized	
	var count=3;
	   //Preferred Product Count Written
	 $(".defaultSelect").selectBoxIt();
	 // createSlider("#your_age"+count,0,100,1,"#age"+count);
	  
  	  $(function() {
     $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
      showOn: "button",
	  buttonText: '',
	  changeMonth: true,
      changeYear: true
     });

	});  
	
	});	
	
	 
 /*  }); */
  </script>
<script>
  $(function() {
   
	 // Preferred Product Count Intlalized		
	var count=3;
	//Add Button Starts
  $(".auto_plan_li_bx_fourth_row").on("click", ".add", function() {
	  var goalsize=$("#goalDataSize").val();
		var actualsize=$("#actualGoalSize").val();		
	   $(this).fadeOut();
	   count++;
	   
	$(this).prev(".close").fadeIn();
	
		
		//$(this).parent().closest("ul").after("<ul class='reset clearfix Auto_Plan_col clearfix'><li class='input_txt_one fl rel'><select class='selectbox defaultSelect' id='goalType"+goalsize+"' name='goalType"+goalsize+"'></select></li><li class='input_txt_two_two fl rel'><input type='text' class='common_input_ap required gname' id='goalName"+goalsize+"' name='goalName"+goalsize+"' value=''/></li><li class='input_txt_two fl rel'><select class='selectbox defaultSelect' id='goalFor"+goalsize+"' name='goalFor"+goalsize+"'></select></li><li class='input_txt_three fl rel'><select class='selectbox gyear defaultSelect' id='goalYear"+goalsize+"' name='goalYear"+goalsize+"'></select></li><li class='input_txt_four fl rel' ><div class='assumption_bx_input_counter_parent fl'><input type='text' class='common_input required gamount' value=''id='goalAmount"+goalsize+"' name='goalAmount"+goalsize+"' ></div></li><li class='clearfix input_txt_six fl'><span class='common_input3'></span><div class='close'>x</div><div class='add'>+</div></li></ul>");
		$(this).parent().closest("ul").after("<ul class='reset clearfix Auto_Plan_col clearfix'><li class='input_txt_one fl rel'><select class='selectbox defaultSelect' id='goalType"+goalsize+"' name='goalType"+goalsize+"'></select></li><li class='input_txt_two_two fl rel'><input type='text' class='common_input_ap required gname' id='goalName"+goalsize+"' name='goalName"+goalsize+"' value=''/></li><li class='input_txt_three fl rel'><select class='selectbox gyear defaultSelect' id='goalYear"+goalsize+"' name='goalYear"+goalsize+"'></select></li><li class='input_txt_four fl rel' ><div class='assumption_bx_input_counter_parent fl'><input type='text' class='common_input required gamount' value=''id='goalAmount"+goalsize+"' name='goalAmount"+goalsize+"' ></div></li><li class='clearfix input_txt_six fl'><span class='common_input3'></span><div class='close'>x</div><div class='add'>+</div></li></ul>");
	   //Preferred Product Count Written
	 $(".defaultSelect").selectBoxIt();
	 // createSlider("#your_age"+count,0,100,1,"#age"+count);
	 
	  jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=GoalTypeID", '{}', "#goalType"+goalsize, "goalType"+goalsize, '');
		
	  //jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getFamilyMembers?partyId=${autoPlanData.partyId}", '{}', "#goalFor"+goalsize, "goalFor"+goalsize, '');
		
	  jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#goalYear"+goalsize, "goalYear"+goalsize, '');
	  
	  $("#goalType"+goalsize).addClass("required");
	 // $("#goalFor"+goalsize).addClass("required");
	  $("#goalYear"+goalsize).addClass("required");
	  $("#goalType"+goalsize).addClass("gtype");
	  //$("#goalFor"+goalsize).addClass("gfor");
	  $("#goalYear"+goalsize).addClass("gyear");
		
	  goalsize++;
	  actualsize++;
		 $("#goalDataSize").val(goalsize);
		 $("#actualGoalSize").val(actualsize);
		 gname="#goalId"+goalsize;		
		 
	});

// Close Button 
$(".auto_plan_li_bx_fourth_row").on("click", ".close", function() {
	var actualsize = $("#actualGoalSize").val();
	if(actualsize == 1) {
		$(".gamount").val('');
		$(".gname").val('');
		$(".gyear").removeClass('required');
		$(".gtype").removeClass('required');
		$(".gfor").removeClass('required');
		$(".gamount").removeClass('required');
		$(".gname").removeClass('required');
		var yearid= $(".gyear").attr('id');
		var typeid= $(".gtype").attr('id');
		var forid= $(".gfor").attr('id');
		$("#"+typeid).removeClass('required');
		
		jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=GoalTypeID", '{}', "#"+typeid, typeid, '');
			
		jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getFamilyMembers?partyId=${autoPlanData.partyId}", '{}', "#"+forid, forid, '');
			
		jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#"+yearid, yearid, '');
		
	}
	else {	
	$(this).parent().closest("ul").siblings("ul").removeClass("moved_down");
	$(this).parent().closest("ul").prev("ul").addClass("moved_down");
	var count_section = $(this).parent().closest(".EP_cnt ").find(".selectboxit").length;
	
	
	$(this).parent().closest("ul").remove();
    $("ul:last-of-type").find(".add").fadeIn();
    actualsize--;
    $("#actualGoalSize").val(actualsize);    
     }
	// removing record

// Preferred Product Ends
	});	
	
  });
  </script>
  <script>
  /* var contextPath="${baseUrl}";
  var createUrl =	contextPath+'/FIINFRA-WEB/dc/submitDcInput1.htm?';	
  createUrl = createUrl + 'userName=${userName}&dcInputPartyId=${partyId}&buId=${buId}&partyId=${partyId}&createdBy=${userId}&roleId=${roleId}&opportunityName=${headerName}&TOKEN=abc&USER_NAME=${userName}&theme=${themeName}';
var analysisURL = "";
  if("${userName}"==""){
  	analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/null/${buId}/A";
  }else{
  	analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/${userName}/${buId}/A";	
  } */
  
  function saveReportsDetails(){
		
		var isAnalysisGeneration=1;
		var isActionPlanGeneration=1;
		var analysisReportType=386;
				
		$.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/partner/report/saveAnalysisReportsForBatch",
	        data : {'partyId': '${partyId}','isAnalysisGeneration': isAnalysisGeneration,'isActionPlanGeneration': isActionPlanGeneration,'analysisReportType': analysisReportType},
	        success : function(result) {
	        	$("#successDialog").html("Reports will generate in 5  mins.");
				$( "#successDialog").dialog( "open" );
				window.location.href = "${pageContext.request.contextPath}/partner/contacts";
	        },
			error : function(err){
				$("#successDialog").html("Error while generating report try after some time");
				$( "#successDialog").dialog( "open" );
			}
	    });
		
	}
$(document).ready(function(){
	 $(".generate_report").click(function(){
		 $("#isSave").val('0');
		 if($('#autoPlanFrm').validate().form()){
				var selectedVal = "";
				var selected = $("input[name='94067']:checked");			
				if (selected.length > 0) {
				    selectedVal = selected.val();
				}			
				 if(selectedVal == '' && $("#income").val()=='') {
					 $("#successDialog").html("Please enter Annual Income");
						$( "#successDialog").dialog( "open" );
				 } else {
					 var selectedVal = "";
						var selected = $("input[name='94074']:checked");					
						if (selected.length > 0) {
						    selectedVal = selected.val();
						}			
						if(selectedVal == "" && $("#expense").val()=="") {
							 $("#successDialog").html("Please enter Monthly Expense");
							$( "#successDialog").dialog( "open" );	 					 
				 		}
						else {
							 var selectedVal = "";
								var selected = $("input[name='94013']:checked");					
								if (selected.length > 0) {
								    selectedVal = selected.val();
								}			
								if(selectedVal == 1 && $("#94018").val()== "") {
									 $("#successDialog").html("Please enter Life Insurance Cover Amount");
									$( "#successDialog").dialog( "open" );	 					 
						 		}
								else {
									var selectedVal = "";
									var selected = $("input[name='94020']:checked");					
									if (selected.length > 0) {
									    selectedVal = selected.val();
									}			
									if(selectedVal == 1 && $("#94019").val()== "") {
										 $("#successDialog").html("Please enter Health Insurance Cover Amount");
										$( "#successDialog").dialog( "open" );	 					 
							 		}
									else {
										var selectedVal = "";
										var selected = $("input[name='94025']:checked");					
										if (selected.length > 0) {
										    selectedVal = selected.val();
										}			
										if(selectedVal == 1 && $("#94024").val()== "") {
											$("#successDialog").html("Please enter Critical Illness Insurance Cover Amount");
											$( "#successDialog").dialog( "open" );	 					 
								 		}
										else {
											var selectedVal = "";
											var selected = $("input[name='94009']:checked");			
											if (selected.length > 0) {
											    selectedVal = selected.val();
											}	
											if(selectedVal == ''){
												$("#successDialog").html("Please enter number of months you can manage without an income");
												$( "#successDialog").dialog( "open" );	 			
											}
											else {
												if(finalDataXML==initialDataXML && finalGoalXML==initialGoalXML && finalPartyttributeDataXML==initialPartyttributeDataXML && finalFamilyMemberDataXML==initialFamilyMemberDataXML) {
													alertMessage("You haven't changed any data yet. Please make some changes then save.");
												} else {
													createDataXml();
													createGoalXml();
													createPartyAttributeDataXML();
													//createFamilyMemberDataXML();
													
													$.ajax({
														type : "POST",
														url : '${pageContext.request.contextPath}/partner/saveQuickDCAjax',
														data: $('#autoPlanFrm').serialize(),
														success : function(result) {	        			
															saveReportsDetails();
														},
													});
					
												}
											}
										}
					
									}
								}
			
							}
					}
			}
		//} 
		/* else {
			$(".overlay").fadeIn("slow");
    		$("#confirmDialog1").fadeIn("slow");
    		$("#aa_up1").html("Reports already generated");
		} */
	    }); 
	  
	 
    $("#confirmDialog1 .close").click(function(){
    $(".overlay").fadeOut("slow");
   $(this).parent( "#confirmDialog1" ).fadeOut("slow");
  });
    jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=AssignedRiskProfileID", '{}', "#brand", "brand", '${autoPlanData.riskProfileId}');
    var familyDetailsSize = $("#familyDetailsSize").val();
    var goalDatasize=$("#goalDataSize").val();
     for(var i=0;i<goalDatasize;i++){
		var goalTypeVar = "#selectedGoalType"+i; 
		jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=GoalTypeID", '{}', "#goalType"+i, "goalType"+i, $(goalTypeVar).val());
	}
    /* for(var i=0;i<goalDatasize;i++){
    	selectedGoalForVar = "#selectedGoalFor"+i;
		jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getFamilyMembers?partyId=${autoPlanData.partyId}", '{}', "#goalFor"+i, "goalFor"+i, $(selectedGoalForVar).val());
	} */
    for(var i=0;i<goalDatasize;i++){
		var selectedGoalYearVar = "#selectedGoalYear"+i; 
		jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#goalYear"+i, "goalYear"+i, $(selectedGoalYearVar).val());	
	}
    /* for(var i=0;i<familyDetailsSize;i++){
		var relationshipIdVar = "#relationshipId"+i; 
		jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=RelationshipID", '{}', "#relation"+i, "relation"+i, $(relationshipIdVar).val());
	} 
    
    for(var i=0;i<familyDetailsSize;i++){
    	$("#age"+i).rules("add",{min:0,max:150});
    } */
    jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=MaritalStatusID", '{}', "#maritalStatus", "maritalStatus", '${autoPlanData.maritalStatus}');
	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=SalutationID", '{}', "#title", "title", '${autoPlanData.title}');
 	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=OccupationID", '{}', "#occupation", "occupation", '${autoPlanData.occupation}');
 	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=AddressTypeID", '{}', "#resStatus", "resStatus", '${autoPlanData.residentialStatus}');
 	//jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=RelationshipID", '{}', "#occupation", "occupation", '');
 	
    $(window).bind("load", function() {
    		//$( document ).ajaxComplete(function() {
    		$.ajax({
    			complete: function(){
    			ajaxFlag = false;
	      		createDataXml();
	      		createGoalXml();
	      		createPartyAttributeDataXML();
	      		//createFamilyMemberDataXML();
	      		initialDataXML=dataXML;
	      		initialGoalXML=goalXML;
	      		initialPartyttributeDataXML=partyttributeDataXML;
	      		initialFamilyMemberDataXML=familyMemberDataXML;	      	
    			}
    		});
    	
      }).trigger('load');
    
    $(function() {

    	$(document).ajaxStop(function() {
    		 $('#page_loader').fadeOut();
    		 $("#showLoader").val("1");
    	});

    	$(document).ajaxStart(function() {
    		if($("#showLoader").val() == "1")
    		 	$('#page_loader').fadeIn();
    	});

    });            
});


</script>

</head>

<body>
<div id="auto_plan_pop_box"><span class="close">X</span><span id="dialogText1">Thank You</span><br/>
<span id="dialogText2">Auto Plan is generated for Client</span>
<form>
    <a href="${pageContext.request.contextPath}/partner/report/generate-report/${partyId}"><input type="button" class="ap_btn" value="View"></a>
    <a href="${pageContext.request.contextPath}/partner/autoPlanList"><input type="button" class="ap_btn" value="Contact"></a>
</form>
</div>

<c:set value="${sessionScope.userSession}" var="sessionObject"></c:set>
  	<c:set value="${sessionScope.headerName}" var="headerName"></c:set>
<!--<span class="box_pen"><a>jgfhjfhfjh</a></span>-->
        
<!-- Wrapper starts-->
<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
			<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  				<div class="modal_content">
    			<div class="aa_up">
     			 <spring:message code="dataChanged" />
    			</div>
   				 <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onClick="closeDialog();" class="aa_no">No</a> </div>
 			 </div>
			</div>
			
			<div id="confirmDialog1" class="common_custom_modal_aa"> <span class="close">X</span>
  				<div class="modal_content">
    			<div class="aa_up" id="aa_up1">
     			 <spring:message code="dataChanged" />
    			</div>
   				 <div class="aa_down"> <a style="cursor:pointer;" href="${pageContext.request.contextPath}/partner/report/generate-report/${partyId}" class="aa_yes">View </a> 
   				 <a style="cursor:pointer;" href="${pageContext.request.contextPath}/partner/autoPlanList" class="aa_no">Contact</a> </div>
 			 </div>
			</div>
			
<form id="autoPlanFrm" name="autoPlanFrm" method="post" action="${pageContext.request.contextPath}/partner/saveQuickDC" >
<div class="" id="auto-plan"> 
  <!-- Main starts-->
  <!-- <div id="page_loader1" style="display:none;"> -->
  <section class="main"> 
    <!-- Header Starts-->
    <!-- Header Ends--> 
    
    <!-- Common_content Starts-->
    <section class="content common_content">
         <!-- Common_in_contnet starts-->
 		<jsp:include page="../layout/submenu_small.jsp"></jsp:include>
      <section class="common_in_content auto_plan_in clearfix"> 
        <!-- inside goal page class-->        
        <input type="hidden" name="actualGoalSize" id="actualGoalSize" value="">
        <input type="hidden" name="actualFamilySize" id="actualFamilySize" value="">
        <input type="hidden" name="dataXML" id="dataXML" value="">
        <input type="hidden" name="goalXML" id="goalXML" value="">
        <input type="hidden" name="partyAttributeDataXML" id="partyAttributeDataXML" value="">
        <input type="hidden" name="familyMemberDataXML" id="familyMemberDataXML" value="">
        <input type="hidden" name="partyId" id="partyId" value="${autoPlanData.partyId}">
        <input type="hidden" name="showLoader" id="showLoader" value="1">
        <input type="hidden" name="name" id="name" value="">
        <input type="hidden" name="recordType" id="recordType" value="${recordType}">
        <input type="hidden" name="isSave" id="isSave" value="1">
        
              
        
        <!--Assumptions Starts-->
        <!-- <div class="auto_plan_strip"></div> -->
        <div class="ap_title_one">Goal :</div>
        <div class="auto_plan_goal_title_bx">
          <ul>
            <li class="input_title_one fl">Goal Type</li>
            <li class="input_title_two_two fl">Name</li>
           <!--  <li class="input_title_two fl">Goal for</li> -->
            <li class="input_title_three fl">Years</li>
            <li class="input_title_four fl">Amount</li>
            <li class="input_title_five fl">Delete</li>
            <li class="input_title_six fl">Add</li>
            <div class="clr"></div>
          </ul>
        </div>
        
        <div class="auto_plan_li_bx_fourth_row">
        <c:set value="1" var="cnt"></c:set>
        <c:if test="${goalDataSize ne 0}">
        <c:forEach items="${autoPlanData.goalDatas}" var="goal" varStatus="count">            
          <ul class="reset clearfix Auto_Plan_col clearfix">
          <input type="hidden" id="selectedGoalFor${count.index}" value="${goal.goalFamilyPartyId}" />
            <input type="hidden" id="selectedGoalType${count.index}" value="${goal.goalTypeId}" />
            <input type="hidden" id="selectedGoalYear${count.index}" value="${goal.goalEndYear}" />
            <input type="hidden" id="goalId${count.index}" name="goalId${count.index}" value="${goal.id}"/>  
            <li class="input_txt_one fl rel">            
            <select class="selectbox required defaultSelect" id="goalType${count.index}" name="goalType${count.index}" value="${goal.goalTypeId}">
<!--                 <option value="-1">-- Select---</option>
 -->              </select>
                        
            </li>         
            <li class="input_txt_two_two fl rel">
            <input type="text" class="common_input_ap required gname" value="${goal.goalName}" id="goalName${count.index}" name="goalName${count.index}">
              </li>
            
           <%--  <li class="input_txt_two fl rel">
              <select class="selectbox required defaultSelect" id="goalFor${count.index}" name="goalFor${count.index}" value="${goal.goalFamilyPartyId}">
                <option value="-1">-- Select---</option>
              </select>
            </li> --%>
            <li class="input_txt_three fl rel">
              <select class="selectbox required gyear defaultSelect" id="goalYear${count.index}" name="goalYear${count.index}" value="${goal.goalEndYear}">
                <option value="-1">-- Select---</option>
              </select>
            </li>
            <li class="input_txt_four fl rel">
              <div class="assumption_bx_input_counter_parent fl">
              <fmt:parseNumber var="amt" integerOnly="true" type="number" value="${goal.goalAmountPv}" />
                <input type="text" class="common_input required number gamount" value="${amt}" id="goalAmount${count.index}" name="goalAmount${count.index}">
              </div>
            </li>
            <c:choose>
              <c:when test="${cnt < goalDataSize}">
              <li class="clearfix input_txt_six fl"><span class="common_input3"></span>
              <div class="close">x</div>
              <div class="add" style="display:none;right:-40px;">+</div>
            </li>
            </c:when>
            <c:otherwise>
            	<li class="clearfix input_txt_six fl"><span class="common_input3"></span>
              		<div class="close">x</div>
              		<div class="add" style="display:block;right:-40px;">+</div>
            	</li>
            </c:otherwise>
            </c:choose>
          </ul>
          <c:set value="${cnt+1 }" var="cnt"></c:set>
          </c:forEach>
          </c:if>
          <c:if test="${goalDataSize == 0}">
          		<ul class="reset clearfix Auto_Plan_col clearfix">
          <input type="hidden" id="selectedGoalFor0" value="" />
            <input type="hidden" id="selectedGoalType0" value="" />
            <input type="hidden" id="selectedGoalYear0" value="" />
            <input type="hidden" id="goalId0" name="goalId0" value=""/>            
            <li class="input_txt_one fl rel">
            <select class="selectbox  gtype defaultSelect" id="goalType0" name="goalType0" value="">
<!--                 <option value="-1">-- Select---</option>
 -->              </select>
                                    
            </li>         
            <li class="input_txt_two_two fl rel">
            <input type="text" class="common_input_ap  gname" value="" id="goalName0" name="goalName0">
              </li>
            
           <!--  <li class="input_txt_two fl rel">
              <select class="selectbox  gfor defaultSelect" id="goalFor0" name="goalFor0" value="">
                <option value="-1">-- Select---</option>
              </select>
            </li> -->
            <li class="input_txt_three fl rel">
              <select class="selectbox  gyear defaultSelect" id="goalYear0" name="goalYear0" value="">
                <!-- <option value="-1">-- Select---</option> -->
              </select>
            </li>
            <li class="input_txt_four fl rel">
              <div class="assumption_bx_input_counter_parent fl">              
                <input type="text" class="common_input  number gamount" value="" id="goalAmount0" name="goalAmount0">
              </div>
            </li>            
            	<li class="clearfix input_txt_six fl"><span class="common_input3"></span>
              		<div class="close">x</div>
              		<div class="add" style="display:block;">+</div>
            	</li>
            
          </ul>
          </c:if>
          
     </div>
     <span>&nbsp;&nbsp;&nbsp;Note:- Do not add a retirement planning goal, as it has been taken up as by default goal.</span>
     <div class="auto_plan_strip"></div>
     <!-- <div class="auto_plan_title_bx clearfix">         --> 
            <div class="ap_title_one">Starting Point</div>          
        <!-- </div> -->
        <div class="auto_plan_asset_title_bx">
          <ul>
            <li class="input_title_one">What approximately investments / assets do you currently have? </li>
            <!-- <li class="input_title_two fl">Retirement Assets</li> -->
            <div class="clr"></div>
          </ul>
        </div>
        <div class="assumption_bx clearfix">
          <label class="label02 fl">Shares :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number" name="94027_94145" id="94027" value="" >
          </div>
          <label class="label02 fl">Provident Funds :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number" name="94051_94148" id="94051" value="">
          </div>
        </div>
        <div class="assumption_bx clearfix">
          <label class="label02 fl">Property :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number" name="94028_94145" id="94028" value="">
          </div>
          <label class="label02 fl">Pension Plans :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number" name="94052_94148" id="94052" value="">
          </div>
        </div>
         <div class="assumption_bx clearfix">
          <label class="label02 fl">Deposits :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number" name="94029_94145" id="94029" value="">
          </div>
          <label class="label02 fl">National Pension Scheme :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number" name="94053_94148" id="94053" value="">
          </div>
        </div>
         <div class="assumption_bx clearfix">
          <label class="label02 fl">Mutual Funds :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number" name="94030_94145" id="94030" value="">
          </div>
          <label class="label02 fl">Others :</label>
          <div class="assumption_bx_input_counter_parent fl answer number">
            <input type="text" class="common_input answer number" name="94054_94148" id="94054" value="">
          </div>
        </div>
        <div class="assumption_bx clearfix">
          <label class="label02 fl">Bonds :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number" name="94031_94145" id="94031" value="">
          </div>
        </div>
        <div class="assumption_bx clearfix">
          <label class="label02 fl">Gold :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number" name="94032_94145" id="94032" value="">
          </div>
        </div>
         <div class="assumption_bx clearfix">
          <label class="label02 fl">Others :</label>
          <div class="assumption_bx_input_counter_parent fl answer number">
            <input type="text" class="common_input answer number" name="94033_94145" id="94033" value="">
          </div>
        </div>
        
        <div class="assumption_bx clearfix">
          <label class="label02 fl">How much of regular monthly investments do you do (in Rs.)? </label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input  number" name="monthlyInvesment" id="monthlyInvesment" value="${autoPlanData.monthlyInvestment}">
          </div>
        </div>
        <div class="assumption_bx clearfix rel">
          <label class="label02 fl"><span class="required_star">*</span>&nbsp;How would your best friend describe you as risktaker? </label>
          <select class="selectbox defaultSelect required" id="brand" name="brand" value="">
            <option value="-1">-- Select---</option>
          </select>
        </div>
        
        <div class="assumption_bx clearfix">
         <label class="label02 fl"><span class="required_star">*</span>&nbsp;What is your family expenses every month? </label>
          <fmt:parseNumber var="expenseamt" integerOnly="true" type="number" value="${autoPlanData.expense}" />
          
          <input type="text" class="common_input number" value="${expenseamt}" id="expense" name="expense" onChange="toggleRadioButtons('expense');">
         <div class="assumption_bx_input_counter_parent fl" style="width: 90%;  margin: 16px 0 0 53px;">
          
           
            <div style="position: relative; width:20%;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button expense fl " id="div_94162"></span>
          <input type="radio" class="default_radio" id="94162" value="25000" name="94074" onChange="toggleExpenseInsurance();">
          <label class="fl">less than Rs. 25,000 </label>
          </div>
          </div>
          
          <div style="position: relative; width:20%;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button common_radio_button fl expense" id="div_94075" onClick="toggleExpenseInsurance();"></span>
          <input type="radio" class="default_radio" id="94075" value="37500" name="94074" onClick="toggleExpenseInsurance();">
           <label class="fl">Rs. 25,000 to Rs. 50,000</label>           
          </div>
          </div>   
          
          <div style="position: relative; width:20%;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button common_radio_button fl expense" id="div_94076" onClick="toggleExpenseInsurance();"></span>
          <input type="radio" class="default_radio" id="94076" value="62500" name="94074" onClick="toggleExpenseInsurance();">
           <label class="fl">Rs. 50,000 to Rs. 75,000 </label>           
          </div>
          </div>  
           
           <div style="position: relative; width:20%;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl expense" id="div_94077" onClick="toggleExpenseInsurance();"></span>
          <input type="radio" class="default_radio" id="94077"  value="87500" name="94074" onClick="toggleExpenseInsurance();">
          <label class="fl">Rs. 75,000 to Rs. 1,00,000</label>
          </div>
          </div> 
          
          <div style="position: relative; width:20%;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl expense" id="div_94078" onClick="toggleExpenseInsurance();"></span>
          <input type="radio" class="default_radio" id="94078"  value="100000" name="94074" onClick="toggleExpenseInsurance();">
          <label class="fl">more than Rs. 1,00,000</label>
          </div>
          </div>       
                    
        </div>
        </div>
        
        <div class="assumption_bx clearfix">
          <label class="label02 fl"><span class="required_star">*</span>&nbsp;How much is your Annual Household Income (post Tax)?</label>
          
           <fmt:parseNumber var="annualamt" integerOnly="true" type="number" value="${autoPlanData.income}" />
            <input type="text" class="common_input number " value="${annualamt}" id="income" name="income" maxlength="10" onClick="toggleRadioButtons('income');"/>
            <label class="label02">OR</label>
            
         <div class="assumption_bx_input_counter_parent fl rel" style="margin: 16px 0 0 53px; width: 90%">
          <div style="position: relative; width: 16%;" class="fl clearfix">
             
            <div id="option1">
          <span class="common_radio_button  fl income" id="div_94161" onClick="toggleIncomeInsurance();"></span>
          <input type="radio" class="default_radio" id="94161" value="300000" name="94067" onClick="toggleIncomeInsurance();">
          <label class="fl">less than Rs. 3L  </label>
          </div>
          </div>
          
          <div style="position: relative; width: 15%;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button common_radio_button fl income" id="div_94069" onClick="toggleIncomeInsurance();"></span>
          <input type="radio" class="default_radio" id="94069" value="800000" name="94067" onClick="toggleIncomeInsurance();">
           <label class="fl">Rs. 6L to 10L  </label>           
          </div>
          </div>  
           
          <div style="position: relative; width: 18%;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl income" id="div_94071" onClick="toggleIncomeInsurance();"></span>
          <input type="radio" class="default_radio" id="94071" value="1750000" name="94067" onClick="toggleIncomeInsurance();">
          <label class="fl">Rs. 15L to Rs. 20L </label>
          </div>
          </div>
          
          <div style="position: relative; width: 17%;" class="fl clearfix"><div id="option2" >
          <span class="common_radio_button  fl income" id="div_94068" onClick="toggleIncomeInsurance();"></span>
          <input type="radio" class="default_radio" id="94068" value="450000" name="94067" onClick="toggleIncomeInsurance();">
           <label class="fl">Rs. 3L to Rs. 6L</label>           
          </div>
          </div>   
          
          <div style="position: relative; width: 15%;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl income" id="div_94070" onClick="toggleIncomeInsurance();"></span>
          <input type="radio" class="default_radio" id="94070" value="1250000" name="94067" onClick="toggleIncomeInsurance();">
          <label class="fl">Rs. 10L to Rs. 15L</label>
          </div>
          </div> 
          
           <div style="position: relative; width: 15%;" class="fr clearfix"><div id="option1">
          <span class="common_radio_button  fl income" id="div_94072" onClick="toggleIncomeInsurance();"></span>
          <input type="radio" class="default_radio" id="94072" value="2000000" name="94067" onClick="toggleIncomeInsurance();">
          <label class="fl">more than Rs 20L</label>
          </div>
          </div> 
                  
          </div> 
          </div>
          <div class="assumption_bx clearfix">
          <label class="label02 fl">How much monthly EMI do you pay against Loan? </label>
         <div class="assumption_bx_input_counter_parent fl">
          <fmt:parseNumber var="EMIamt" integerOnly="true" type="number" value="${autoPlanData.EMI}" />
            <input type="text" class="common_input number" value="${EMIamt}" id="EMIamt" name="EMIamt">
           <%--  <c:if test="${autoPlanData.EMI == ''}">
            	<script>
            		$("#EMIamt").val('0');
            	</script>
            </c:if> --%>
          </div>
          </div>
          <div class="assumption_bx clearfix">
          <label class="label02 fl">Do you plan to take any loans in Future?  </label>
         <div style="position: relative; width: 15%; margin-left: 15px;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl loan" id="div_94135_94092"></span>
          <input type="radio" class="default_radio" id="94135" value="1" name="94092">
          <label class="fl">Yes</label>
          </div></div>
          
          <div style="position: relative; width: 15%; margin-left: 15px;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button common_radio_button fl loan" id="div_94136_94092"></span>
          <input type="radio" class="default_radio" value="0" id="94136" name="94092">
           <label class="fl">No</label>
           
          </div></div>
          
          
          </div>
          <div class="assumption_bx clearfix">
          <label class="label02 fl">Have you prepared a WILL for yourself?  </label>         
            <div style="position: relative; width: 15%; margin-left: 15px;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl will <c:if test="${autoPlanData.will eq '1'}">common_radio_button_checked</c:if>"></span>
          <input type="radio" class="default_radio" id="IsWillYes" name="IsWill" value="1"<c:if test="${autoPlanData.will eq '1'}">checked="true"</c:if>>
          <label class="fl">Yes</label>
          </div></div>
          
          <div style="position: relative; width: 15%; margin-left: 15px;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button common_radio_button fl will <c:if test="${autoPlanData.will eq '0'}">common_radio_button_checked</c:if>"></span>
          <input type="radio" class="default_radio" id="IsWillNo" value="0" name="IsWill" <c:if test="${autoPlanData.will eq '0'}">checked="true"</c:if>>
           <label class="fl">No</label>
           
          </div></div>   
          </div>
       <!--  Assets Ends -->
        
     <div class="auto_plan_strip"></div>
        <div class="ap_title_one">Dream Spoilers</div>
          
           <div class="assumption_bx_input_counter_parent fl">
          </div>
        <div class="assumption_bx clearfix">
         <label class="label02 fl"><span class="required_star">*</span>&nbsp;How many months do you think you can manage without an income?</label>
         
         <div style="position: relative; width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl months" id="div_94138"></span>
          <input type="radio" class="default_radio" id="94138" value="2" name="94009">
          <label class="fl">1-3 </label>
          </div>
          </div>
          
          <div style="position: relative; width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button common_radio_button fl months" id="div_94139"></span>
          <input type="radio" class="default_radio" id="94139" value="5" name="94009">
           <label class="fl">3-6</label>           
          </div>
          </div>  
           
          <div style="position: relative; width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl months" id="div_94140"></span>
          <input type="radio" class="default_radio" id="94140" value="8" name="94009">
          <label class="fl">6-9</label>
          </div>
          </div>
          
          <div style="position: relative; width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button common_radio_button fl months" id="div_94141"></span>
          <input type="radio" class="default_radio" id="94141" value="11" name="94009">
           <label class="fl">9-12</label>           
          </div>
          </div>   
          
          <div style="position: relative; width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl months" id="div_94142"></span>
          <input type="radio" class="default_radio" id="94142" value="12" name="94009">
          <label class="fl">more than 12</label>
          </div>
          </div> 
        </div>
        <div class="assumption_bx clearfix">
          <label class="label02 fl">Do you have any Life Insurance policies?   </label>         
            <div style="position: relative;width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl life" id="div_94135_94013" onClick="toggleLifeInsurance('1');"></span>
          <input type="radio" class="default_radio" id="94135" value="1" name="94013" onClick="toggleLifeInsurance('1');">
          <label class="fl">Yes</label>
          </div></div>
          
          <div style="position: relative;width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button fl life" id="div_94136_94013" onClick="toggleLifeInsurance('0');"></span>
          <input type="radio" class="default_radio" id="94136"  name="94013" value="0" onClick="toggleLifeInsurance('0');">
           <label class="fl">No</label>
           
          </div></div>   
          <label class="label02 fl">If yes, how much is the cover?   </label>  
          <div class="assumption_bx_input_counter_parent fl">          
            <input type="text" class="common_input number valid answer"  id="94018" name="94018" aria-invalid="false" readonly="readonly">           
          </div>
          </div>
        <div class="assumption_bx clearfix">
          <label class="label02 fl">Do you have Health Insurance cover?   </label>         
            <div style="position: relative; width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl health" id="div_94135_94020" onclick="toggleHealthInsurance('1');"></span>
          <input type="radio" class="default_radio" id="94135" value="1" name="94020" onClick="toggleHealthInsurance('1');">
          <label class="fl">Yes</label>
          </div></div>
          
          <div style="position: relative;width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button common_radio_button fl health" id="div_94136_94020" onclick="toggleHealthInsurance('0');"></span>
          <input type="radio" class="default_radio" id="94136"  name="94020" value="0" onClick="toggleHealthInsurance('0');">
           <label class="fl">No</label>
           
          </div></div>   
          <label class="label02 fl">If yes, how much is the cover?   </label>  
          <div class="assumption_bx_input_counter_parent fl">          
            <input type="text" class="common_input number answer"  id="94019" name="94019" aria-invalid="false" readonly="readonly">           
          </div>
          </div>
          <div class="assumption_bx clearfix">
          <label class="label02 fl">Do you have critical illness / accidental disability insurance?   </label>         
            <div style="position: relative; width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl critical" id="div_94135_94025" onClick="toggleCriticalInsurance('1');"></span>
          <input type="radio" class="default_radio" id="94135" value="1" name="94025" onClick="toggleCriticalInsurance('1');">
          <label class="fl">Yes</label>
          </div></div>
          
          <div style="position: relative; width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button common_radio_button fl critical" id="div_94136_94025" onClick="toggleCriticalInsurance('0');"></span>
          <input type="radio" class="default_radio" id="94136"  name="94025" value="0" onClick="toggleCriticalInsurance('0');">
           <label class="fl">No</label>
           
          </div></div>   
          <label class="label02 fl">If yes, how much is the cover?   </label>  
          <div class="assumption_bx_input_counter_parent fl">          
            <input type="text" class="common_input number answer"  id="94024" name="94024" aria-invalid="false" readonly="readonly">           
          </div>
          </div>
          
          <div class="assumption_bx clearfix">
          <label class="label02 fl">Are all you assets insured for risks like fire / earthquake / theft etc?   </label>         
            <div style="position: relative;width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl asset" id="div_94135_94108"></span>
          <input type="radio" class="default_radio" id="94135" value="1" name="94108">
          <label class="fl">Yes</label>
          </div></div>
          
          <div style="position: relative;width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button common_radio_button fl asset" id="div_94136_94108"></span>
          <input type="radio" class="default_radio" id="94136"  value="0" name="94108">
           <label class="fl">No</label>
           
          </div></div>   
          </div>
          
          <div class="assumption_bx clearfix">
          <label class="label02 fl">Is your family aware of all assets you own and loans you have to pay?   </label>         
            <div style="position: relative;width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl family" id="div_94135_94102"></span>
          <input type="radio" class="default_radio" id="94135" value="1" name="94102">
          <label class="fl">Yes</label>
          </div></div>
          
          <div style="position: relative;width: 10%; margin-left: 10px;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button common_radio_button fl family" id="div_94136_94102"></span>
          <input type="radio" class="default_radio" id="94136" value="0" name="94102">
           <label class="fl">No</label>
           
          </div></div>   
          </div>
         <c:choose>
        <c:when test="${goalDataSize == 0 }">
        	<input type="hidden" id="goalDataSize" name="goalDataSize" value="1"/>
        </c:when>
        <c:otherwise>
        	<input type="hidden" id="goalDataSize" name="goalDataSize" value="${goalDataSize}"/>
        </c:otherwise>
        </c:choose>
        <!--General Ends-->
      
      <div style="margin-bottom:20px;"></div>
      <div class="auto_plan_strip"></div>
        <div class="ap_title_one">Your Details</div>
        <div class="subheading">Profile</div>
        
        <div class="auto_plan_title_bx">
          <ul>
            <li class="input_title_one fl">Title</li>
            <li class="input_title_two fl">First Name</li>
            <li class="input_title_three fl"><span class="required_star">*</span>&nbsp;Last Name</li>
            <li class="input_title_four fl">Residential Status</li>
            <div class="clr"></div>
          </ul>
        </div>
        <div class="auto_plan_li_bx_first_row clearfix">
          <ul>
            <li class="input_txt_one fl">
            <select class="selectbox defaultSelect" id="title" name="title" value="">
            <option value="-1">-- Select---</option>
           </select>              
            </li>
            
            <li class="input_txt_two fl rel">
              <input type="text" class="common_input Alfa" value="${autoPlanData.firstname}" id="firstName" name="firstName">              
            </li>
            
            <li class="input_txt_three fl rel">
            <input type="text" class="common_input Alfa required" value="${autoPlanData.lastname}" id="lastName" name="lastName">              
            </li>
            
            <li class="input_txt_four fl rel">
              <select class="selectbox defaultSelect" id="resStatus" name="resStatus" value="">
            <option value="-1">-- Select---</option>
           </select> 
            </li>
           
            
          </ul>
          <!-- txt ends--> 
        </div>
        
          <div class="auto_plan_title_bx">
          <ul>
            <li class="input_title_one fl">Gender</li>
            <li class="input_title_two fl"><span class="required_star">*</span>&nbsp;Date of birth</li>
            <li class="input_title_three fl">Marital Status</li>
            <li class="input_title_four fl">Occupation</li>
      
            <div class="clr"></div>
          </ul>
        </div>
        
        <div class="auto_plan_li_bx_first_row clearfix">
          <ul>
            <li class="input_txt_one fl">
             <div style="position: relative;width: 20%; margin-left: 20px;" class="fl clearfix"><div id="option1">
          <span class="common_radio_button  fl gender <c:if test="${autoPlanData.gender eq '12001'}">common_radio_button_checked</c:if>"></span>
          <input type="radio" class="default_radio gender" id="12001" value="12001" name="gender" <c:if test="${autoPlanData.gender eq '12001'}">checked="true"</c:if>>
          <label class="fl">Male</label>
          </div>
          </div>
          
          <div style="position: relative;width: 20%; margin-left: 20px;" class="fl clearfix"><div id="option2">
          <span class="common_radio_button  fl gender <c:if test="${autoPlanData.gender eq '12002'}">common_radio_button_checked</c:if> "></span>
          <input type="radio" class="default_radio gender" id="12002" value="12002" name="gender" <c:if test="${autoPlanData.gender eq '12002'}">checked="true"</c:if>>
           <label class="fl">Female</label>           
          </div>
          </div>  
            </li>
            
            <li class="input_txt_two fl rel" >  
            	<input type="text" class="common_input5 datepicker required" name="dob" id="dob" placeholder="dd-mmm-yyyy"  onChange="calculateAge1();" value="${autoPlanData.dob}" readonly="readonly">            					                  
            </li>   
            <li class="input_txt_three fl">
              <select class="selectbox defaultSelect " id="maritalStatus" name="maritalStatus" value="">
            <option value="-1">-- Select---</option>
           </select>
            </li>
            <li class="input_txt_four fl">
              <select class="selectbox defaultSelect " id="occupation" name="occupation" value="">
            <option value="-1">-- Select---</option>
           </select>
            </li>                                           
          </ul>
          <!-- txt ends--> 
        </div>
        
        <div class="auto_plan_title_bx">
          <ul>
            <li class="input_title_one fl">Contact No</li>
            <li class="input_title_two fl"><span class="required_star">*</span>&nbsp;Email ID</li>            
            <div class="clr"></div>
          </ul>
        </div>
        <div class="auto_plan_li_bx_first_row clearfix">
          <ul>
            <li class="input_txt_one fl">
              <input type="text" class="common_input " id="contactNo" name="contactNo" value="${autoPlanData.contactNo}">
            </li>
            
            <li class="input_txt_two fl rel">
              <input type="text" class="common_input required email" value="${autoPlanData.emailId}" id="email" name="email"/>
            </li>                        
            
          </ul>
          <!-- txt ends--> 
        </div>
      </section>
     
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
     <div id="Footer_Type">
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup">
             <li class="fl list"><a href="#;" class="anch save saveAutoPlanLink" onClick="onSave();"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel" onClick="cancel('${pageContext.request.contextPath}/partner/contacts');"><span class="txt">Cancel</span></a></li>
           <li class="fl list" style="margin: -26px 10px 0 140px;"><a style="width: 122px; margin-top: -5px;" class="anch generate_report generateAutoPlan"><span class="txt">Generate Report & Close</span></a></li> 
          </ul>
        </div>
          </section>
    </div> 
       </form>
      <!-- Common footer ends -->
    </section>
    <c:forEach items="${autoPlanData.partyAttributeDatas}" var="attribute">
    <fmt:parseNumber var="amt1" integerOnly="true" type="number" value="${attribute.attributereferenceValue}" />    
    <script>
    
    $('#${attribute.attributeCodeId}').val(${amt1});
    if('${attribute.attributeCodeId}' == '94145' || '${attribute.attributeCodeId}' == '94148') {
    	$('#${attribute.attributeValue}').val(${amt1});
    }
    if('${attribute.attributeCodeId}' == '94013' || '${attribute.attributeCodeId}' == '94020' || '${attribute.attributeCodeId}' == '94025' || '${attribute.attributeCodeId}' == '94108' || '${attribute.attributeCodeId}' == '94102' || '${attribute.attributeCodeId}' == 94092 || '${attribute.attributeCodeId}' == '94009' || '${attribute.attributeCodeId}' == '94067' || '${attribute.attributeCodeId}' == '94074') {
//    	$('#${attribute.attributeValue}').val(${amt1});
    	$('input[name=${attribute.attributeCodeId}][value=${attribute.attributereferenceValue}]').prop("checked",true);
    }
    $('#${attribute.attributeValue}').prop('checked',true);    
    $('#div_${attribute.attributeValue}_${attribute.attributeCodeId}').addClass('common_radio_button_checked');
    $('#div_${attribute.attributeValue}').addClass('common_radio_button_checked');
    
    if('${attribute.attributeCodeId}' == '94018' || '${attribute.attributeCodeId}' == '94019' || '${attribute.attributeCodeId}' == '94024') {
    	var value = '${attribute.attributereferenceValue}';
    	if(value!=''){
    		$('#${attribute.attributeCodeId}').attr("readonly",false);
    	} 
    }
    </script>
    		
    </c:forEach>
    
    <!-- Common_content Ends--> 
    
  </section>
  <!-- Main ends--> 
  <!--pop up box-->
</div>
<!--pop up box--> 
<!-- Wrapper ends-->
<div class="overlay"></div>
<div id="page_loader" ></div>
</body>
</html>
