<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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


function getAutoComplete(){
	(function( $ ) {
	    $.widget( "custom.combobox", {
	      _create: function() {
	        this.wrapper = $( "<span>" )
	          .addClass( "custom-combobox" )
	          .insertAfter( this.element );
	 
	        this.element.hide();
	        this._createAutocomplete();
	      },
	 
	      _createAutocomplete: function() {
	        var selected = this.element.children( ":selected" ),
	          value = selected.val() ? selected.text() : "";
	 
	        this.input = $( "<input>" )
	          .appendTo( this.wrapper )
	          .val( value )
	          .attr( "title", "" )
	          .addClass( "custom-combobox-input common_input ui-widget ui-widget-content ui-state-default ui-corner-left" )
	          .autocomplete({
	            delay: 500,
	            minLength: 2,
	            source: $.proxy( this, "_source" )
	          })
	          .tooltip({
	            tooltipClass: "ui-state-highlight"
	          });
	 
	        this._on( this.input, {
	          autocompleteselect: function( event, ui ) {
	            ui.item.option.selected = true;
	            this._trigger( "select", event, {
	              item: ui.item.option
	            });
	          },
	 
	          autocompletechange: "_removeIfInvalid"
	        });
	      },
	 
	      _source: function( request, response ) {
	    	 
	    	var productData = request.term;
	    	$(".city_list").children(".products").remove();
			$('#showLoader').val("0");
			$.ajax({
			    url: "${pageContext.request.contextPath}/common/codevalues",
			    type: "GET",
			    dataType: "json",
			    data: {'productData':productData,'codeTypeId':'CityID'},
			    success: function( data ) {
			    	
			    	$.each(data, function(index, product){			    		
			    		$(".city_list").append("<option class='products' value="+ product.codeValueId +">"+product.codeValue+"</option>");
			    	});
			        
			        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
			        response( $(".city_list").children( "option" ).map(function() {
			          var text = $( this ).text();			         
			          if ( this.value && ( !request.term || matcher.test(text) ) )
			            return {
			              label: text,
			              value: text,
			              option: this
			            };
			        }) );
			        
			    },
			    error: function (error) {
			       alert('error: ' + error);
			    }
			 });  	    	 
	        
	      },
	 
	      _removeIfInvalid: function( event, ui ) {
	 
	    	  if ( ui.item ) {	    	  
	 
		        // Search for a match (case-insensitive)
		        var value = this.input.val(),
		          valueLowerCase = value.toLowerCase(),
		          valid = false;
		        this.element.children( "option" ).each(function() {
		          if ( $( this ).text().toLowerCase() === valueLowerCase ) {
		            this.selected = valid = true;		            
		            return false;
		          }
		        });
		 
		        // Found a match, nothing to do
		        if ( valid ) {
		        	return;
		        }
		 
		        // Remove invalid value
		        this.input
		          .val( "" )
		          .attr( "title", value + " didn't match any item" )
		          .tooltip( "open" );
		        this.element.val( "" );
		        this._delay(function() {
		          this.input.tooltip( "close" ).attr( "title", "" );
		        }, 2500 );
		        this.input.autocomplete( "instance" ).term = "";
	    	  }else{
	    		  var value = this.input.val();
	    		  this.input
		          .val( "" )
		          .attr( "title", value + " didn't match any item" )
		          .tooltip( "open" );
		        this.element.val( "" );
		        this._delay(function() {
		          this.input.tooltip( "close" ).attr( "title", "" );
		        }, 2500 );
	    	  }
	      },
	 
	      _destroy: function() {
	        this.wrapper.remove();
	        this.element.show();
	      }
	    });
	  })( jQuery );
	
	$(function() {
 		$( ".city_list" ).combobox();
   }); 

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
		createFamilyMemberDataXML();
		
		finalDataXML=dataXML;
		finalGoalXML=goalXML;
		finalPartyttributeDataXML=partyttributeDataXML;
		finalFamilyMemberDataXML=familyMemberDataXML;
		if(finalDataXML==initialDataXML && finalGoalXML==initialGoalXML && finalPartyttributeDataXML==initialPartyttributeDataXML && finalFamilyMemberDataXML==initialFamilyMemberDataXML) {
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
	getAutoComplete();
	 $(".wrapper").addClass('autoplan_review_wrapper');
	$( ".fname" ).change(function() {
		  var nameid = $(this).attr('id');
		  var index = nameid.charAt(nameid.length-1);
		  if($("#"+nameid).val() == '') {
			  $("#relation"+index).removeClass('required');
		  } else {
			  $("#relation"+index).addClass('required');
		  }
		  
		});
	
	$( ".gname" ).change(function() {
		  var nameid = $(this).attr('id');
		  var index = nameid.charAt(nameid.length-1);
		  if($("#"+nameid).val() == '') {
			  $("#goalType"+index).removeClass('required');
			  $("#goalFor"+index).removeClass('required');
			  $("#goalYear"+index).removeClass('required');
			  $("#goalAmount"+index).removeClass('required');
		  } else {
			  $("#goalType"+index).addClass('required');
			  $("#goalFor"+index).addClass('required');
			  $("#goalYear"+index).addClass('required');
			  $("#goalAmount"+index).addClass('required');
		  }
		  
		});
	

	
	$("#autoPlanFrm").validate({
		  ignore:'', //i.e. do not ignore hidden elements
		  rules:{	retAge:{min:40,max:99},lifeExp:{min:70,max:100}}
		 });
    $('.common_in_content').slimScroll();
    if(${goalDataSize} == 0) {
		$("#actualGoalSize").val(1);
    } else {
    	$("#actualGoalSize").val(${goalDataSize});
    }
    
    if(${familyDetailsSize} == 0) {
		$("#actualFamilySize").val(1);
    } else {
    	$("#actualFamilySize").val(${familyDetailsSize});
    }
    
  	$( "#tabs" ).tabs();
    $("defaultSelect").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
	 
	  $( "#site_theme" ).one( "click", function() {
    
}); 
	  $("#emergencyMonths" ).spinner({ min:0 , max:12});
	  $("#retAge" ).spinner({ min:40 , max:99});
	  $("#lifeExp" ).spinner({ min:70 , max:100});
	  
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
	$("#isSave").val('1');
	createDataXml();
	createGoalXml();
	
	createPartyAttributeDataXML();
	createFamilyMemberDataXML();	
	finalDataXML=dataXML;
	finalGoalXML=goalXML;
	finalPartyttributeDataXML=partyttributeDataXML;
	finalFamilyMemberDataXML=familyMemberDataXML;
	//alert(familyMemberDataXML);
	
	if($('#autoPlanFrm').validate().form()){
	if(finalDataXML==initialDataXML && finalGoalXML==initialGoalXML && finalPartyttributeDataXML==initialPartyttributeDataXML && finalFamilyMemberDataXML==initialFamilyMemberDataXML) {
		alertMessage("You haven't changed any data yet. Please make some changes then save.");
	}
	else if(!calculateAge1()){
	}
	else {		
		if($('#autoPlanFrm').validate().form()){
			if(!($("#chkAssumptions").is(':checked'))) {
				$("#successDialog").html("Please validate your assumptions");
				$( "#successDialog").dialog( "open" );
			}
			else if(!($("#chkGoals").is(':checked'))) {
				$("#successDialog").html("Please validate your goals");
				$( "#successDialog").dialog( "open" );
			}
			else {
				$("#autoPlanFrm").submit();
			}
				
		}
	}
  }
		
}

function createDataXml() {
	dataXML='<Root>';
		dataXML+='<FirstName>';
		dataXML+=$("#firstName").val();
		dataXML+='</FirstName>';
		
		dataXML+='<LastName>';
		dataXML+=$("#lastName").val();
		dataXML+='</LastName>';
		
		dataXML+='<DOB>';
		dataXML+=$("#dob").val();
		dataXML+='</DOB>';
		
		dataXML+='<EmailId>';
		dataXML+=$("#email").val();
		dataXML+='</EmailId>';
		
		dataXML+='<Income>';
		dataXML+=$("#income").val();
		dataXML+='</Income>';
		
		dataXML+='<Expense>';
		dataXML+=$("#expence").val();
		dataXML+='</Expense>';
		
		dataXML+='<RetirementAge>';
		dataXML+=$("#retAge").val();
		dataXML+='</RetirementAge>';
		
		/* dataXML+='<EmergencyMonth>';
		dataXML+=$("#emergencyMonths").val();
		dataXML+='</EmergencyMonth>'; */
		
		dataXML+='<RiskProfileId>';
		dataXML+=$("#brand").val();
		dataXML+='</RiskProfileId>';
		
		dataXML+='<PanNo>';
		dataXML+=$("#panNo").val();
		dataXML+='</PanNo>';
				
		dataXML+='<City>';
		dataXML+=$("#city").val();
		dataXML+='</City>';
		
		dataXML+='<Will>';
		dataXML+=$("#will").val();
		dataXML+='</Will>';
		
		dataXML+='<LifeExpectancy>';
		dataXML+=$("#lifeExp").val();
		dataXML+='</LifeExpectancy>';
		
		dataXML+='<IsSave>'+$("#isSave").val()+'</IsSave>';
				
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
			var goalForVar="#goalFor"+i;
			goalXML+=$(goalForVar).val();
			goalXML+='</GoalFamilyPartyID>';
			
			goalXML+='<GoalStartYear>0';			
			goalXML+='</GoalStartYear>'
			
			goalXML+='<IsLoan>0';
			goalXML+='</IsLoan>';
			
			goalXML+='<LoanAmount>0';
			goalXML+='</LoanAmount>';
			
			goalXML+='<LoanDownPayment>';
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
		partyttributeDataXML+='</Root>';
		
		$("#partyAttributeDataXML").val(partyttributeDataXML);
		

}

function createFamilyMemberDataXML()
{
	var familySize=$("#familyDetailsSize").val();
	var i=0;
	familyMemberDataXML='<Root>';
	for(i=0;i<familySize;i++) {
		testFamily = $("#familyName"+i).val();
		
		if(testFamily != undefined) {
			if(!($("#actualFamilySize").val() == 1 && testFamily == '')) {		
			familyMemberDataXML+='<FamilyMember>';
				familyMemberDataXML+='<RelationshipId>';
				
				var relationId="#relation"+i;
				familyMemberDataXML+=$(relationId).val();				
				familyMemberDataXML+='</RelationshipId>';
				
				familyMemberDataXML+='<Name>';
				var name="#familyName"+i;
				familyMemberDataXML+=$(name).val();
				familyMemberDataXML+='</Name>';
				
				familyMemberDataXML+='<Age>';
				var age="#age"+i;
				familyMemberDataXML+=$(age).val();
				familyMemberDataXML+='</Age>';
				
				familyMemberDataXML+='<PartyId>';
				var partyId="#familyPartyId"+i;
				familyMemberDataXML+=$(partyId).val();
				familyMemberDataXML+='</PartyId>';
				
			familyMemberDataXML+='</FamilyMember>';
		}
		}
	}
	familyMemberDataXML+='</Root>';
	
	$("#familyMemberDataXML").val(familyMemberDataXML);
	//alert(familyMemberDataXML);
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
	 // Calls the selectBoxIt method on your HTML select box
	 
 	/* var i=0;
	  for(i=0;i<$("#familyDetailsSize").val();i++) {		
		 var id = "#relation"+i;
		 $(id).addClass("required");
	 } 
	 
	 for(i=0;i<$("#goalDataSize").val();i++) {		
		 var id = "#goalType"+i;
		 $(id).addClass("required");
		 $(id).addClass("gtype");
		 
		 var id = "#goalFor"+i;
		 $(id).addClass("gfor");
		 
		 var id = "#goalYear"+i;
		 $(id).addClass("gyear");
	 } */
});
</script>
<script>
  $(function() {
      //All spiners disbale by default
 $("#emergencyMonths,#retAge,#age3,#lifeExp").spinner().spinner("enable");
 //   spinner.spinner( "disable" ); 	
  });
</script>

<script>
  $(function() {
   
	 // Preferred Product Count Intlalized	
	var count=3;
	
	//Add Button Starts
  $(".auto_plan_li_bx_third_row").on("click", ".add", function() {
	  var actualfsize=$("#actualFamilySize").val();
	  var familySize=$("#familyDetailsSize").val();
	   $(this).fadeOut();
	   count++;
	   
	$(this).prev(".close").fadeIn();
	
$(this).parent().closest("ul").after("<ul><li class='input_txt_one fl rel'><input type='hidden' id='familyPartyId"+familySize+"' name='familyPartyId"+familySize+"' value=''/><input type='text' class='common_input required fname' id='familyName" +familySize+ "'name='familyName" +familySize+ "' value=''></li><li class='input_txt_two fl rel'><input id='age"+familySize+"' type='text' class='common_input5 fage required'  name='age"+familySize+"'></li><li class='input_txt_three fl rel'><input type='hidden' id='relationshipId"+familySize+"' value='' /><select class='selectbox frelation required defaultSelect' id='relation"+familySize+"'></select></li><li class='clearfix input_txt_four fl'><span class='common_input3'></span><div class='close'>x</div><div class='add'>+</div></li></ul>");
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
  	jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=RelationshipID", '{}', "#relation"+familySize, "relation"+familySize, '');
  	$("#age"+familySize).rules("add",{min:0,max:150});
  	$("#relation"+familySize).addClass();
	   $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );  
	   actualfsize++;
	   familySize++;
	   $("#actualFamilySize").val(actualfsize);
	   $("#familyDetailsSize").val(familySize);
	});


// Close Button 
$(".auto_plan_li_bx_third_row").on("click", ".close", function() {
	var actualfamilysize=$("#familyDetailsSize").val();
	if(actualfamilysize == 1) {
		$(".fname").val('');
		$(".fname").removeClass('required');
		$(".fage").val('');
		$(".fage").removeClass('required');
		var relationid = $(".frelation").attr('id');
		$("#"+relationid).removeClass('required');
		
		jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=RelationshipID", '{}', "#"+relationid, relationid, '');
		
	} else {
		$(this).parent().closest("ul").siblings("ul").removeClass("moved_down");
		$(this).parent().closest("ul").prev("ul").addClass("moved_down");
		var count_section = $(this).parent().closest(".EP_cnt ").find(".selectboxit").length;
	
		$(this).parent().closest("ul").remove();
    	$("ul:last-of-type").find(".add").fadeIn(); 
    
    	actualfamilysize--;
    	$("#familyDetailsSize").val(actualfamilysize);
	}
	// removing record

// Preferred Product Ends

	
	});	
	
	 
  });
  </script>
<script>
  $(function() {
   
	 // Preferred Product Count Intlalized		
	var count=3;
	//Add Button Starts
  $(".auto_plan_li_bx_fourth_row").on("click", ".add", function() {
	  var goalsize=$("#goalDataSize").val();
		var actualsize=$("#actualGoalSize").val();
		//alert(actualsize + "insert");
	   $(this).fadeOut();
	   count++;
	   
	$(this).prev(".close").fadeIn();
	
		
		$(this).parent().closest("ul").after("<ul class='reset clearfix Auto_Plan_col clearfix'><li class='input_txt_one fl rel'><select class='selectbox defaultSelect' id='goalType"+goalsize+"' name='goalType"+goalsize+"'></select></li><li class='input_txt_two_two fl rel'><input type='text' class='common_input_ap required gname' id='goalName"+goalsize+"' name='goalName"+goalsize+"' value=''/></li><li class='input_txt_two fl rel'><select class='selectbox defaultSelect' id='goalFor"+goalsize+"' name='goalFor"+goalsize+"'></select></li><li class='input_txt_three fl rel'><select class='selectbox gyear defaultSelect' id='goalYear"+goalsize+"' name='goalYear"+goalsize+"'></select></li><li class='input_txt_four fl rel' ><div class='assumption_bx_input_counter_parent fl'><input type='text' class='common_input required gamount' value=''id='goalAmount"+goalsize+"' name='goalAmount"+goalsize+"' ></div></li><li class='clearfix input_txt_six fl'><span class='common_input3'></span><div class='close'>x</div><div class='add'>+</div></li></ul>");
	   //Preferred Product Count Written
	 $(".defaultSelect").selectBoxIt();
	 // createSlider("#your_age"+count,0,100,1,"#age"+count);
	 
	  jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=GoalTypeID", '{}', "#goalType"+goalsize, "goalType"+goalsize, '');
		
	  jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getFamilyMembers?partyId=${autoPlanData.partyId}", '{}', "#goalFor"+goalsize, "goalFor"+goalsize, '');
		
	  jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#goalYear"+goalsize, "goalYear"+goalsize, '');
	  
	  $("#goalType"+goalsize).addClass("required");
	  $("#goalFor"+goalsize).addClass("required");
	  $("#goalYear"+goalsize).addClass("required");
	  $("#goalType"+goalsize).addClass("gtype");
	  $("#goalFor"+goalsize).addClass("gfor");
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
	//alert(actualsize + "delete");
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
/*   $(function() {
   
	 // Preferred Product Count Intlalized	
	var count=3;
	
	//Add Button Starts
	
  $(".auto_plan_li_bx_third_row").on("click", ".add", function() {
	   $(this).fadeOut();
	   count++;
	   
	$(this).prev(".close").fadeIn();
$(this).parent().closest("ul").after("<ul><li class='input_txt_one fl'><input type='text' class='common_input fname' id='familyName'+ value=''></li><li class='input_txt_two fl'><input id='dob"+count+"' type='text' class='common_input5 datepicker'  name='input'   ></li><li class='input_txt_three fl'><select class='selectbox' id='brand'><option>Select</option><option>Father</option><option>Mother</option><option>Husband</option><option>Wife</option></select></li><li class='clearfix input_txt_four fl'><span class='common_input3'></span><div class='close'>x</div><div class='add'>+</div></li></ul>");
	   //Preferred Product Count Written
	 $("select").selectBoxIt();
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
	
	   $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );  
	});


// Close Button 
$(".auto_plan_li_bx_third_row").on("click", ".close", function() {
	
	$(this).parent().closest("ul").siblings("ul").removeClass("moved_down");
	$(this).parent().closest("ul").prev("ul").addClass("moved_down");
	var count_section = $(this).parent().closest(".EP_cnt ").find(".selectboxit").length;
	
	
	$(this).parent().closest("ul").remove();
    $("ul:last-of-type").find(".add").fadeIn(); 
	// removing record

// Preferred Product Ends

	
	});	
	
	 
  }); */
  </script>
  
  <script>
  var contextPath="${baseUrl}";
  var createUrl =	contextPath+'/FIINFRA-WEB/dc/submitDcInput1.htm?';	
  createUrl = createUrl + 'userName=${userName}&dcInputPartyId=${partyId}&buId=${buId}&partyId=${partyId}&createdBy=${userId}&roleId=${roleId}&opportunityName=${headerName}&TOKEN=abc&USER_NAME=${userName}&theme=${themeName}';
var analysisURL = "";
  if("${userName}"==""){
  	analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/null/${buId}/A";
  }else{
  	analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/${userName}/${buId}/A";	
  }
$(document).ready(function(){
	 $(".generate_report").click(function(){
		 $("#isSave").val('0');
		$(".overlay").fadeIn("slow");
		$("#confirmDialogForAutoPlan").fadeIn("slow");
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
    for(var i=0;i<goalDatasize;i++){
    	selectedGoalForVar = "#selectedGoalFor"+i;
		jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getFamilyMembers?partyId=${autoPlanData.partyId}", '{}', "#goalFor"+i, "goalFor"+i, $(selectedGoalForVar).val());
	}
    for(var i=0;i<goalDatasize;i++){
		var selectedGoalYearVar = "#selectedGoalYear"+i; 
		jsonPopulateDropdownForGoals("${pageContext.request.contextPath}/futureFinancialDc/getGoalYear", '{}', "#goalYear"+i, "goalYear"+i, $(selectedGoalYearVar).val());	
	}
    for(var i=0;i<familyDetailsSize;i++){
		var relationshipIdVar = "#relationshipId"+i; 
		jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=RelationshipID", '{}', "#relation"+i, "relation"+i, $(relationshipIdVar).val());
	} 
    
    for(var i=0;i<familyDetailsSize;i++){
    	$("#age"+i).rules("add",{min:0,max:150});
    }
    
    $(window).bind("load", function() {
    		//$( document ).ajaxComplete(function() {
    		$.ajax({
    			complete: function(){
    			ajaxFlag = false;
	      		createDataXml();
	      		createGoalXml();
	      		createPartyAttributeDataXML();
	      		createFamilyMemberDataXML();
	      		initialDataXML=dataXML;
	      		initialGoalXML=goalXML;
	      		initialPartyttributeDataXML=partyttributeDataXML;
	      		initialFamilyMemberDataXML=familyMemberDataXML;
	      		 //alert(familyMemberDataXML);
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

var analysisURL = "";
if("${userName}"==""){
	analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/null/${buId}/A";
}else{
	analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/${userName}/${buId}/A";	
}

function createQuickReport(){
		$.ajax({
	        type : "POST",
	        url : analysisURL,	        
	        success : function(result) {
	        	createSummarizedReport();
	        },
			error : function(err){
				createSummarizedReport();
			}
        });
	}

function saveCalaculationMethod(){	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/partner/report/saveLifeInsuranceMethod",
		data:{'clientPartyId':'${partyId}','liMethod':0},
		success: function(data){
			createQuickReport();
		},
		error : function(err){
			displayMsg("Error saving insurance details.Please try again later.");
		}
		});

}


function createSummarizedReport(){
	var analysisURL = "";
	if("${userName}"==""){
		analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/null/${buId}/B";
	}else{
		analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/${userName}/${buId}/B";	
	}
	
	$.ajax({
        type : "POST",
        url : analysisURL,	        
        success : function(result) {
			createDetailedReport();
        },
		error : function(err){
			createDetailedReport();
		}
    });
}

function createDetailedReport(){
	var analysisURL = "";
	if("${userName}"==""){
		analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/null/${buId}/C";
	}else{
		analysisURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysis/${partyId}/${partnerPartyId}/${userName}/${buId}/C";	
	}
	$.ajax({
        type : "POST",
        url : analysisURL,	        
        success : function(result) {
        	createDetailedReportClient();
        },
		error : function(err){
			createDetailedReportClient();
		}
    });
}

function createDetailedReportClient(){
	
	var actionPlanURL = "";
	if("${userName}"==""){
		actionPlanURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysisClient/${partyId}/${partnerPartyId}/null/${buId}/client";
	}else{
		actionPlanURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysisClient/${partyId}/${partnerPartyId}/${userName}/${buId}/client";	
	}
	
	$.ajax({
        type : "POST",
        url : actionPlanURL,	      
        success : function(result) {
        	createDetailedReportAdvisor();
        },
		error : function(err){
			createDetailedReportAdvisor();
		}
    });
}

function createDetailedReportAdvisor(){

	var actionPlanURL = "";
	if("${userName}"==""){
		actionPlanURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysisClient/${partyId}/${partnerPartyId}/null/${buId}/advisor";
	}else{
		actionPlanURL = "${pageContext.request.contextPath}/partner/report/generate-report-analysisClient/${partyId}/${partnerPartyId}/${userName}/${buId}/advisor";	
	}	
	
$.ajax({
    type : "POST",
    url : actionPlanURL,	
    success : function(result) {
    	createActionPlan();
    },
	error : function(err){
		createActionPlan();
	}
});
}

function createActionPlan(){

var contextPath="${baseUrl}";
var createUrl =	contextPath+'/FIINFRA-WEB/dc/submitDcInput1.htm?';	
createUrl = createUrl + 'userName=${USER_NAME}&dcInputPartyId=${partyId}&buId=${buId}&partyId=${partyId}&createdBy=${userId}&roleId=${roleId}&opportunityName=${headerName}&TOKEN=abc&USER_NAME=shubhchintak&theme=${themeName}';	
createUrl = createUrl + "&isAnalysisReportGenration=true";
// createUrl = createUrl + "&isActionPlanGeneration=true";	
	$.ajax({
        type : "POST",
        url : createUrl,
        data :  $('form').serialize(), 
        success : function(result) {        	
        	createComprehensiveReport();
        },
		error : function(err){
			createComprehensiveReport();
		}
    });
}

function createComprehensiveReport(){
$.ajax({
    type : "POST",
    url : "${pageContext.request.contextPath}/partner/report/generate-analysis-c-report/${partyId}",
    data : {'themeName': '${themeName}','headerName': '${headerName}'},
    success : function(result) {
    	/* $(".overlay").fadeIn("slow");
		$("#confirmDialog1").fadeIn("slow");
		$("#aa_up1").html("Auto Plan is generated for Client"); */
		alertMessage("Auto Plan is generated for Client");
    },
	error : function(err){
		/* $(".overlay").fadeIn("slow");
		$("#confirmDialog1").fadeIn("slow");
		$("#aa_up1").html("Auto Plan is generated for Client"); */
		alertMessage("Auto Plan is generated for Client");
	}
});

}

function generateActionPlan(autoPlanFlag)
{
	if(autoPlanFlag)
	{
		if($('#autoPlanFrm').validate().form()){
			
			if(!($("#chkAssumptions").is(':checked'))) {
				$("#successDialog").html("Please validate your assumptions");
				$( "#successDialog").dialog( "open" );
			}
			else if(!($("#chkGoals").is(':checked'))) {
				$("#successDialog").html("Please validate your goals");
				$( "#successDialog").dialog( "open" );
			}
			else {

				createDataXml();
				createGoalXml();
				createPartyAttributeDataXML();
				createFamilyMemberDataXML();
				
				$.ajax({
	        		type : "POST",
	        		url : '${pageContext.request.contextPath}/partner/saveAutoPlanAjax',
	        		data: $('#autoPlanFrm').serialize(),
	        		success : function(result) {	        			
	        			 $.ajax({
	    			        type : "POST",
	    			        url : analysisURL,	        
	    			        success : function(result) {
	    			   //     	createSummarizedReport();
	    			        	saveReportsDetails();
	    			        },
	    					error : function(err){
					  //		createSummarizedReport();
	    						saveReportsDetails();
	    					}
	    		         });  
	        		},
				});
			}
		}
	}	
}

function saveReportsDetails()
{
	$("#currentReportName").html("Processing Reports");
		$.ajax({
	        type : "POST",
	        url : "${pageContext.request.contextPath}/partner/report/saveAnalysisReportsForBatch",
	        data : {'partyId': '${partyId}','isAnalysisGeneration': 1,'isActionPlanGeneration': 1,'analysisReportType': 386},
	        success : function(result) {
	        	alertMessage("Auto Plan is generated for Client");
	        },
			error : function(err){
				alertMessage("Auto Plan is generated for Client");
			}
	    });
		
	}

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
			
<form id="autoPlanFrm" name="autoPlanFrm" method="post" action="${pageContext.request.contextPath}/partner/saveAutoPlan" >
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
        <input type="hidden" name="isSave" id="isSave" value="1">
        <div class="ap_title_one">Information Available Through RTA Feed</div>
        <div class="subheading">Profile</div>
        
        <div class="auto_plan_title_bx">
          <ul>
            <li class="input_title_one fl">First Name</li>
            <li class="input_title_two fl"><span class="required_star">*</span>&nbsp;Last Name</li>
            <li class="input_title_three fl"><span class="required_star">*</span>&nbsp;Birth Date</li>
            <li class="input_title_four fl"><span class="required_star">*</span>&nbsp;Email ID</li>
            <div class="clr"></div>
          </ul>
        </div>
        <div class="auto_plan_li_bx_first_row clearfix">
          <ul>
            <li class="input_txt_one fl">
              <input type="text" class="common_input Alfa" value="${autoPlanData.firstname}" id="firstName" name="firstName">
            </li>
            
            <li class="input_txt_two fl rel">
              <input type="text" class="common_input required Alfa" value="${autoPlanData.lastname}" id="lastName" name="lastName">
            </li>
            
            <li class="input_txt_three fl rel">
              <input type="text" class="common_input5 datepicker required" name="dob" id="dob" placeholder="dd-mmm-yyyy"  onChange="calculateAge1();" value="${autoPlanData.dob}" readonly="readonly">
            </li>
            
            <li class="input_txt_four fl rel">
              <input type="text" class="common_input required email" value="${autoPlanData.emailId}" id="email" name="email"/>
            </li>
           
            
          </ul>
          <!-- txt ends--> 
        </div>
        
          <div class="auto_plan_title_bx">
          <ul>
            <li class="input_title_one fl">PAN</li>
            <li class="input_title_two fl">City</li>
      
            <div class="clr"></div>
          </ul>
        </div>
        
        <div class="auto_plan_li_bx_first_row clearfix">
          <ul>
            <li class="input_txt_one fl">
              <input type="text" class="common_input" id="panNo" name="panNo" value="${autoPlanData.panNo}" />
            </li>
            
            <li class="input_txt_two fl rel" >  
<input type="text" class="common_input" id="city" name="city" value="${autoPlanData.city}" />        
            <%-- <select class="common_input city_list" id="city" name="city">
            <option selected="selected" class="products" value="${autoPlanData.city}">${autoPlanData.city}</option>
            </select> --%>
            </li>
            
           
           
            
          </ul>
          <!-- txt ends--> 
        </div>
        
        
      
        
        <!--Assumptions Starts-->
        <div class="auto_plan_strip"></div>
        <div class="ap_title_one">Assumptions</div>
      
      
        
       <%--    <div class="assumption_bx_input_counter_parent fl">
          <fmt:parseNumber var="annualamt" integerOnly="true" type="number" value="${autoPlanData.income}" />
            <input type="text" class="common_input number" value="${annualamt}" id="income" name="income">
            <c:if test="${autoPlanData.income == ''}">
            	<script>
            		$("#income").val('0');
            	</script>
            </c:if>
          </div> --%>
          
           <div class="assumption_bx_input_counter_parent fl">
          </div>
          <%-- <label class="label fl">No. of months you can manage without <br/>
            an income in case of emergency :</label>
          <div class="value-spinner number" >
            <input id="emergencyMonths" name="emergencyMonths" value="${autoPlanData.emergencyMonths}" class="spinner number">
            <c:if test="${autoPlanData.emergencyMonths == ''}">
            	<script>
            		$("#emergencyMonths").val('0');
            	</script>
            </c:if>
          </div>
        </div> --%>
        
         <div class="assumption_bx clearfix">
          <div class="chekbox_parent label02"><span class="required_star">*</span>&nbsp;Please validate Assumptions 
          
          <span class="autoplan_common_custom_checkbox <c:if test="${statusFlag == 1}">white_checkbox_checked</c:if>"></span>
                      <input type="checkbox" class="default_checkbox" id="chkAssumptions" <c:if test="${statusFlag == 1}">checked</c:if> />
                      
        <!-- <span class="white_checkbox"></span>
        <input type="checkbox" value="" id="chkbx" name="chkbx" > -->
        
                   
        </div>  </div>  
        
        
        <div class="assumption_bx clearfix">
         <label class="label02 fl">Monthly Expense :</label>
         
         <div class="assumption_bx_input_counter_parent fl">
          <fmt:parseNumber var="expenseamt" integerOnly="true" type="number" value="${autoPlanData.expense}" />
            <input type="text" class="common_input number" value="${expenseamt}" id="expence" name="expence">
            <c:if test="${autoPlanData.expense == ''}">
            	<!-- <script>
            		$("#expence").val('0');
            	</script> -->
            </c:if>
        </div>
        
        
          <label class="fl">Life Expectancy:</label>
          <div class="value-spinner fl number" style="width:22%;" >
            <input id="lifeExp" name="lifeExp"  value="" class="spinner number" readonly>
            <c:choose>
            <c:when test="${autoPlanData.lifeExpectancy == ''}">
            	<script>
            		$("#lifeExp").val('60');
            	</script>
            </c:when>
            <c:otherwise>
            	<script>
            		$("#lifeExp").val(${autoPlanData.lifeExpectancy});
            	</script>
            </c:otherwise>
            </c:choose>
          </div>   
          
          
         
        </div>
        <div class="assumption_bx clearfix rel">
          <label class="label02 fl">Risk Profile :</label>
          <select class="selectbox defaultSelect required" id="brand" name="brand" value="">
            <option value="-1">-- Select---</option>
          </select>
        </div>
        
        <div class="assumption_bx clearfix">
          <label class="label02 fl">At what age do you<br/> want to retire?</label>
          <div class="value-spinner fl number" style="width:22%;" >
            <input id="retAge" name="retAge"  value="" class="spinner number" readonly>
            <c:choose>
            <c:when test="${autoPlanData.retirementAge == ''}">
            	<script>
            		$("#retAge").val('60');
            	</script>
            </c:when>
            <c:otherwise>
            	<script>
            		$("#retAge").val(${autoPlanData.retirementAge});
            	</script>
            </c:otherwise>
            </c:choose>
          </div>          
        </div>
        <!--Assumptions Ends-->
        
        
         <div class="auto_plan_strip"></div>
        <div class="ap_title_one">Goal :</div>
        
         <div class="assumption_bx clearfix">
          <div class="chekbox_parent label02"><span class="required_star">*</span>&nbsp;Please validate Goals 
          
          <span class="autoplan_common_custom_checkbox <c:if test="${statusFlag == 1}">white_checkbox_checked</c:if>"></span>
                      <input type="checkbox" class="default_checkbox" id="chkGoals" <c:if test="${statusFlag == 1}">checked</c:if> />
                      
        <!-- <span class="white_checkbox"></span>
        <input type="checkbox" value="" id="chkbx" name="chkbx" > -->
        
                   
        </div>  </div>  
        
        <div class="auto_plan_goal_title_bx">
          <ul>
            <li class="input_title_one fl">Goal Type</li>
            <li class="input_title_two_two fl">Name</li>
            <li class="input_title_two fl">Goal for</li>
            <li class="input_title_three fl">Years</li>
            <li class="input_title_four fl">Amount</li>
            <li class="input_title_five fl">Delete</li>
            <li class="input_title_six fl">Add</li>
            <div class="clr"></div>
          </ul>
        </div>
        
        <div class="auto_plan_li_bx_fourth_row">
        <c:set value="1" var="cnt"></c:set>
        <c:forEach items="${autoPlanData.goalDatas}" var="goal" varStatus="count">            
          <ul class="reset clearfix Auto_Plan_col clearfix">
          <input type="hidden" id="selectedGoalFor${count.index}" value="${goal.goalFamilyPartyId}" />
            <input type="hidden" id="selectedGoalType${count.index}" value="${goal.goalTypeId}" />
            <input type="hidden" id="selectedGoalYear${count.index}" value="${goal.goalEndYear}" />
            <input type="hidden" id="goalId${count.index}" name="goalId${count.index}" value="${goal.id}"/>
            <%-- <input type="hidden" id="goalDesc${count.index}" name="goalDesc${count.index}" value="${goal.goalDescription}"/>
            <input type="hidden" id="goalStartYear${count.index}" name="goalStartYear${count.index}" value="${goal.startYear}"/>
            <input type="hidden" id="isLoan${count.index}" name="isLoan${count.index}" value="${goal.isLoan}"/>
            <input type="hidden" id="loanAmt${count.index}" name="loanAmt${count.index}" value="${goal.loanAmount}"/>
            <input type="hidden" id="dowmPay${count.index}" name="dowmPay${count.index}" value="${goal.loanDownPayment}"/>
            <input type="hidden" id="interest${count.index}" name="interest${count.index}" value="${goal.loanInterestPercentage}"/>
            <input type="hidden" id="duration${count.index}" name="duration${count.index}" value="${goal.loanDurationYears}"/>
             --%>
            <li class="input_txt_one fl rel">            
            <select class="selectbox required defaultSelect" id="goalType${count.index}" name="goalType${count.index}" value="${goal.goalTypeId}">
<!--                 <option value="-1">-- Select---</option>
 -->              </select>
                        
            </li>         
            <li class="input_txt_two_two fl rel">
            <input type="text" class="common_input_ap required gname" value="${goal.goalName}" id="goalName${count.index}" name="goalName${count.index}">
              </li>
            
            <li class="input_txt_two fl rel">
              <select class="selectbox required defaultSelect" id="goalFor${count.index}" name="goalFor${count.index}" value="${goal.goalFamilyPartyId}">
                <option value="-1">-- Select---</option>
              </select>
            </li>
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
            
            <li class="input_txt_two fl rel">
              <select class="selectbox  gfor defaultSelect" id="goalFor0" name="goalFor0" value="">
                <!-- <option value="-1">-- Select---</option> -->
              </select>
            </li>
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
     

      
        
        <!--Assets Starts--> 
        <div class="auto_plan_strip"></div>
        <div class="ap_title_one">Additional Information (Optional)</div>
        
         <!-- Family Members Starts -->
        <div class="auto_plan_strip"></div>
         <div class="auto_plan_title_bx clearfix">
          <ul>
            <li class="input_title_one fl">Family Members</li>
          </ul>
        </div>
        <div class="auto_plan_li_bx_second_row clearfix">
          <ul>
            <li class="input_txt_one fl">Full Name</li>
            <li class="input_txt_two fl">Age</li>
            <li class="input_txt_three fl">Relation</li>
            <div class="clr"></div>
          </ul>
          <!-- txt ends--> 
        </div>
        
        
        <c:choose>
        <c:when test="${familyDetailsSize == 0 }">
        <input type="hidden" id="familyDetailsSize" name="familyDetailsSize" value="1"/>
        </c:when>
        <c:otherwise>
        	<input type="hidden" id="familyDetailsSize" name="familyDetailsSize" value="${familyDetailsSize}"/>
        </c:otherwise>
		</c:choose>             
        <c:choose>
        <c:when test="${goalDataSize == 0 }">
        	<input type="hidden" id="goalDataSize" name="goalDataSize" value="1"/>
        </c:when>
        <c:otherwise>
        	<input type="hidden" id="goalDataSize" name="goalDataSize" value="${goalDataSize}"/>
        </c:otherwise>
        </c:choose>
        
        <c:set value="1" var="fcnt"></c:set>
        <c:forEach items="${autoPlanData.familyMemberDatas}" var="family" varStatus="count" >
        <input type="hidden" id="familyPartyId${count.index}" name="familyPartyId${count.index}" value="${family.partyId}"/>
         <div class="auto_plan_li_bx_third_row clearfix">
          <ul>
            <li class="input_txt_one fl rel">
              <input type="text" class="common_input required fname" value="${family.firstName}${family.lastName}" id="familyName${count.index}" name="familyName${count.index}">
            </li>
            <li class="input_txt_two fl rel">
              <input type="text" class="common_input5  number fage required" name="age${count.index}" id="age${count.index}"  value="${family.age}">
            </li>
            <li class="input_txt_three fl rel">
            <input type="hidden" id="relationshipId${count.index}" value="${family.relationshipId}" />
            <select class="selectbox frelation required defaultSelect" name="relation${count.index}" id="relation${count.index}" value="${family.relationshipId}">
            <option value="">-- Select---</option>
         	</select>
            </li>
            <c:choose>
              <c:when test="${fcnt < familyDetailsSize}">
              <li class="clearfix input_txt_four fl"><span class="common_input3"></span>
              <div class="close">x</div>
              <div class="add" style="display:none;">+</div>
            </li>
            </c:when>
            <c:otherwise>
            	<li class="clearfix input_txt_four fl"><span class="common_input3"></span>
              		<div class="close">x</div>
              		<div class="add" style="display:block;">+</div>
            	</li>
            </c:otherwise>
            </c:choose>
            </ul>
        </div>
        <c:set value="${fcnt+1 }" var="fcnt"></c:set>
        </c:forEach>
         <c:if test="${familyDetailsSize == 0}">
        <input type="hidden" id="familyPartyId0" name="familyPartyId0" value=""/>
         <div class="auto_plan_li_bx_third_row clearfix">
          <ul>
            <li class="input_txt_one fl rel">
              <input type="text" class="common_input  fname" value="" id="familyName0" name="familyName0">
            </li>
            <li class="input_txt_two fl rel">
              <input type="text" class="common_input5  number fage" name="age0" id="age0"  value="">
            </li>
            <li class="input_txt_three fl rel">
            <input type="hidden" id="relationshipId0" value="" />
            <select class="selectbox frelation defaultSelect" name="relation0" id="relation0" >
            <option value="">-- Select---</option>
         	</select>
            </li>
            <li class="clearfix input_txt_four fl"><span class="common_input3"></span>
              <div class="close">x</div>
              <div class="add">+</div>
            </li>
            </ul>
            </div>
            </c:if> 
        <!-- txt ends--> 
        
       <!--  Family Members Ends -->
       
         <div class="auto_plan_strip"></div>
        <div class="auto_plan_title_bx clearfix">
          <ul>
            <li class="input_title_one fl">Assets</li>
          </ul>
        </div>
        <div class="auto_plan_asset_title_bx">
          <ul>
            <li class="input_title_one fl">General Assets</li>
            <li class="input_title_two fl">Retirement Assets</li>
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
        
       <!--  Assets Ends -->
        
         <!--Risk Cover Starts-->
        <div class="auto_plan_strip"></div>
        <div class="auto_plan_title_bx clearfix">
          <ul>
            <li class="input_title_one fl">Risk Cover</li>
          </ul>
        </div>
      
        <div class="assumption_bx clearfix">
          <label class="label02 fl">Existing Life Insurance<br/>
 Cover :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number"  id="94018" name="94018" value="">
          </div>
          <label class="label02 fl">Existing Health Insurance Cover :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number"  id="94019" name="94019" value="">
          </div>
        </div>
        <div class="assumption_bx clearfix">
          <label class="label02 fl">Existing Critical Illness<br/> Cover :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number"  id="94024" name="94024" value="">
          </div>
          <label class="label02 fl">Existing Accident Cover :</label>
          <div class="assumption_bx_input_counter_parent fl">
            <input type="text" class="common_input answer number"  id="94107" name="94107" value="">
          </div>
        </div>
        
        <!--Risk Cover Ends-->
        
      
      <!--General Starts-->
        <div class="auto_plan_strip"></div>
        <div class="auto_plan_title_bx clearfix">
          <ul>
            <li class="input_title_one fl">General</li>
          </ul>
        </div>
        <div class="assumption_bx clearfix">
          <label class="label02 fl"><span class="required_star">*</span>&nbsp;Annual Income :</label>
         <div class="assumption_bx_input_counter_parent fl rel">
          <fmt:parseNumber var="annualamt" integerOnly="true" type="number" value="${autoPlanData.income}" />
            <input type="text" class="common_input number required" value="${annualamt}" id="income" name="income" maxlength="10"/>
            <%-- <c:if test="${autoPlanData.income == ''}">
            	<script>
            		$("#income").val('0');
            	</script>
            </c:if> --%>
          </div> 
          
          
          
          <label class="label02 fl">EMI</label>
         <div class="assumption_bx_input_counter_parent fl">
          <fmt:parseNumber var="EMIamt" integerOnly="true" type="number" value="${autoPlanData.EMI}" />
            <input type="text" class="common_input number" value="${EMIamt}" id="EMIamt" name="EMIamt">
           <%--  <c:if test="${autoPlanData.EMI == ''}">
            	<script>
            		$("#EMIamt").val('0');
            	</script>
            </c:if> --%>
          </div>
         <%--  <div class="value-spinner number" >
            <input id="emergencyMonths" name="emergencyMonths" value="${autoPlanData.emergencyMonths}" class="spinner number">
            <c:if test="${autoPlanData.emergencyMonths == ''}">
            	<script>
            		$("#emergencyMonths").val('0');
            	</script>
            </c:if>
          </div> --%>
        </div>

        
        <!--General Ends-->
        
        
        
         <!--General Starts-->
         <div class="auto_plan_strip"></div>
        <div class="auto_plan_title_bx clearfix">
          <ul>
            <li class="input_title_one fl">Succession</li>
          </ul>
        </div>
        <div class="assumption_bx clearfix">
          <label class="label02 fl">Does Client have a Will?</label>
        <select class="selectbox frelation defaultSelect" name="will" id="will" value="${autoPlanData.will}">                    
            <option value="1" <c:if test="${autoPlanData.will == 1}">selected</c:if>>YES</option>
            <option value="2"<c:if test="${autoPlanData.will == '' or autoPlanData.will == 0}">selected</c:if>>NO</option>
         	</select>         
        </div>

        
        <!--General Ends-->
      
      <div style="margin-bottom:20px;"></div>
      </section>
     
      <!-- Common_in_contnet ends--> 
      <!-- Common footer starts -->
     <div id="Footer_Type">
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup">
             <li class="fl list"><a href="#;" class="anch save saveAutoPlanLink" onClick="onSave();"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel" onClick="cancel('${pageContext.request.contextPath}/partner/autoPlanList');"><span class="txt">Cancel</span></a></li>
           <li class="fl list"><a class="anch generate_report generateAutoPlan"><span class="txt">Generate Auto Plan</span></a></li>
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
    if(${attribute.attributeCodeId} == 94145 || ${attribute.attributeCodeId} == 94148) {
    	$('#${attribute.attributeValue}').val(${amt1});
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
