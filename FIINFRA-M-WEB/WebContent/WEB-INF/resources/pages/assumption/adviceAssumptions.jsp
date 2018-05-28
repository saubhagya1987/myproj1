<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>

<c:choose>
	<c:when test="${not empty fixedIncomereturn.valueStartRange or not empty fixedIncomereturn.valueEndRange}">
		<c:set var="fixedIncomereturnValueStartRange" value="${fixedIncomereturn.valueStartRange}"/>
		<c:set var="fixedIncomereturnValueEndRange" value="${fixedIncomereturn.valueEndRange}"/>
		<c:set var="fixedIncomereturnAssumptionValue" value="${fixedIncomereturn.assumptionValue}"/>
	</c:when>
	<c:otherwise>
		<c:set var="fixedIncomereturnValueStartRange" value="7"/>
		<c:set var="fixedIncomereturnValueEndRange" value="15"/>
		<c:set var="fixedIncomereturnAssumptionValue" value="7"/>
	</c:otherwise>

</c:choose>


<!-- intilazie custom checkbox starts-->
<script>
//var startData = [83,60,14,15,7,17,18,12,42,24,11,28,36];
var startData = ''
function getStartData() {
	startData = startData + '' +parseInt(${defaultEstmtLifeExpectancy},10) + ",";
	startData = startData + '' +parseInt(${defaultDfltRetirementAge},10) + ",";
	startData = startData + '' +parseInt(${defaultExpctdRtrnOnAllExstInvstment},10) + ",";
	startData = startData + '' +parseInt(${defaultAnnualearninggrowthRate},10) + ",";
	startData = startData + '' +parseInt(${defaultInflationRate},10) + ",";
	startData = startData + '' +parseInt(${defaultGoldInvstmntReturn},10) + ",";
	startData = startData + '' +parseInt(${defaultEquityInvstmntReturn},10) + ",";
	startData = startData + '' +parseInt(${defaultFixedIncomereturn},10) + ",";
	startData = startData + '' +parseInt(${defaultRealEstateGrowthrate},10) + ",";
	startData = startData + '' +parseInt(${defaultEmergencyFundrequired},10) + ",";
	startData = startData + '' +parseInt(${defaultHealthInsuranceCoverAmnt},10) + ",";
	startData = startData + '' +parseInt(${defaultCriticalIllnessCoverAmnt},10) + ",";
	startData = startData + '' +parseInt(${defaultAccdntInsuranceCoverAmnt},10);	
}
var defaultData = [];
$(document).ready(function(){
	
	var scale = '${scale}';
	if(scale == 1000) {
		$(".k").addClass('unit_selected');
		$(".dynamic").html("k");
	}
	else if(scale == 100000) {
		$(".lacs").addClass('unit_selected');
		$(".dynamic").html("lacs");
	}
	else if(scale == 10000000) {
		$("cr").addClass('unit_selected');
		$(".dynamic").html("cr");
	}
	var rbsLinks = "${rbsLinks}";
	if(rbsLinks != ""){
		$("."+rbsLinks).attr("href","#");
		$("."+rbsLinks).addClass("inactiveLink");
		//$("."+rbsLinks).remove();
		$("#frmAssumption").attr("action","#");
	}
	
$(".wrapper").addClass('');	
$("#frmAssumption").validate({
	rules:{	
			ele_input:{min:${estmtLifeExpectancy.valueStartRange},max:${estmtLifeExpectancy.valueEndRange}},
			retirement_age_input:{min:${dfltRetirementAge.valueStartRange},max:${dfltRetirementAge.valueEndRange}},
			ere_input:{min:${expctdRtrnOnAllExstInvstment.valueStartRange},max:${expctdRtrnOnAllExstInvstment.valueEndRange}},
			annu_ear_input:{min:${annualearninggrowthRate.valueStartRange},max:${annualearninggrowthRate.valueEndRange}},
			ir_input:{min:${inflationRate.valueStartRange},max:${inflationRate.valueEndRange}},
			gir_input:{min:${goldInvstmntReturn.valueStartRange},max:${goldInvstmntReturn.valueEndRange}},
			eir_input:{min:${equityInvstmntReturn.valueStartRange},max:${equityInvstmntReturn.valueEndRange}},
			fir_input:{min:${fixedIncomereturnValueStartRange},max:${fixedIncomereturnValueEndRange}},
			rei_input:{min:${realEstateGrowthrate.valueStartRange},max:${realEstateGrowthrate.valueEndRange}},
			efr_input:{min:${emergencyFundrequired.valueStartRange},max:${emergencyFundrequired.valueEndRange}},
			hic_input:{min:${healthInsuranceCoverAmnt.valueStartRange},max:${healthInsuranceCoverAmnt.valueEndRange}},
			cii_input:{min:${criticalIllnessCoverAmnt.valueStartRange},max:${criticalIllnessCoverAmnt.valueEndRange}},
			aci_input:{min:${accdntInsuranceCoverAmnt.valueStartRange},max:${accdntInsuranceCoverAmnt.valueEndRange}}
		}
});


$('.toggle').toggles();
//<!-- intilazie custom checkbox ends-->
//<!-- Toggle real checkbox as per custom checkbox strats -->

$("#car_type").on('toggle', function (e, active) {
    if (active) {
     ;
	  $(".car_type").prop("checked", true);
	
	   
    } else {
    
	   $(".car_type").prop("checked", false);
	
    }
	
});

//<!-- Toggle real checkbox as per custom checkbox ends -->
//<!-- Fuel type starts -->
  $(".thumb_select_ul a").click(function(){
	
    $(this).children(".categoery").toggleClass("not_applicable");

  });
//<!-- Fuel type ends -->
//<!--Header input box dynamic width change starts-->
	$("#purchase_car .car_description").keypress(function(){
  var sum=50;
$('.desc_container input,.desc_container a').each( function(){ sum += $(this).width(); });
$('.desc_container').width( sum );
});
	
	    $('#purchase_car .car_description').bind("keypress keydown", function(e) {
         
		   var sum=50;
            if (e.which == 46){         
			  $('.desc_container input,.desc_container a').each( function(){ sum += $(this).width(); });
              $('.desc_container').width( sum );
            }
            if (e.which == 8) {
         
			  $('.desc_container input,.desc_container a').each( function(){ sum += $(this).width(); });
              $('.desc_container').width( sum );
            }
    });

//<!--Header input box dynamic width change starts-->
//<!-- Custom Selectbox starts -->
  
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
 
//<!-- Custom Selectbox Ends -->

//<!-- custom scroll to "common_in_content" -->
  
    $('.common_in_content').slimScroll();
	// Estimated Life Expectancy value Slider
	  createSliderLocal('#ele',${estmtLifeExpectancy.valueStartRange},${estmtLifeExpectancy.valueEndRange},1,'#ele_input',${estmtLifeExpectancy.assumptionValue})
	 <!--   // Retiement age value Slider */-->
	  createSliderLocal('#retirement_age',${dfltRetirementAge.valueStartRange},${dfltRetirementAge.valueEndRange},1,'#retirement_age_input',${dfltRetirementAge.assumptionValue})
	  <!--   /* // Expected Returns on all existing Investment value Slider */-->
	  createSliderLocal('#ere',${expctdRtrnOnAllExstInvstment.valueStartRange},${expctdRtrnOnAllExstInvstment.valueEndRange},1,'#ere_input',${expctdRtrnOnAllExstInvstment.assumptionValue})
	 <!--   // Annual Earning Growth Rate value Slider-->
	  createSliderLocal('#annu_ear',${annualearninggrowthRate.valueStartRange},${annualearninggrowthRate.valueEndRange},1,'#annu_ear_input',${annualearninggrowthRate.assumptionValue})
	  // Gold investments returns  value Slider
	  createSliderLocal('#ir',${inflationRate.valueStartRange},${inflationRate.valueEndRange},1,'#ir_input',${inflationRate.assumptionValue})
  	  // Inflation Rate  value Slider
	  createSliderLocal('#gir',${goldInvstmntReturn.valueStartRange},${goldInvstmntReturn.valueEndRange},1,'#gir_input',${goldInvstmntReturn.assumptionValue})
	  // Equity investments returns   value Slider
	  createSliderLocal('#eir',${equityInvstmntReturn.valueStartRange},${equityInvstmntReturn.valueEndRange},1,'#eir_input',${equityInvstmntReturn.assumptionValue})
	  // Fixed income returns  value Slider
	  createSliderLocal('#fir',${fixedIncomereturnValueStartRange},${fixedIncomereturnValueEndRange},1,'#fir_input',${fixedIncomereturnAssumptionValue})
	  // Real Estate investments growth rate value Slider
	  createSliderLocal('#rei',${realEstateGrowthrate.valueStartRange},${realEstateGrowthrate.valueEndRange},1,'#rei_input',${realEstateGrowthrate.assumptionValue})
	  // Emergency Funds Required growth rate value Slider
	  createSliderLocal('#efr',${emergencyFundrequired.valueStartRange},${emergencyFundrequired.valueEndRange},1,'#efr_input',${emergencyFundrequired.assumptionValue})
	  // Health Insurance cover amount value Slider
	  createSliderLocal('#hic',${healthInsuranceCoverAmnt.valueStartRange},${healthInsuranceCoverAmnt.valueEndRange},1,'#hic_input',${healthInsuranceCoverAmnt.assumptionValue})
	  // Critical Illness Insurance cover amount value Slider
	  createSliderLocal('#cii',${criticalIllnessCoverAmnt.valueStartRange},${criticalIllnessCoverAmnt.valueEndRange},1,'#cii_input',${criticalIllnessCoverAmnt.assumptionValue})
	  // Accident Disability Insurance cover amount value Slider
	  createSliderLocal('#aci',${accdntInsuranceCoverAmnt.valueStartRange},${accdntInsuranceCoverAmnt.valueEndRange},1,'#aci_input',${accdntInsuranceCoverAmnt.assumptionValue})
	/* // Life Insurance
	  createSliderLocal('#ins',${accdntInsuranceCoverAmnt.valueStartRange},${accdntInsuranceCoverAmnt.valueEndRange},1,'#ins_input',${accdntInsuranceCoverAmnt.assumptionValue}) */
//<!-- custom scroll to "common_in_content" -->
//<!-- Unit selector -->
//money converter
  /* $(".common_unit_selector li").click(function(){
	$(".common_unit_selector li").removeClass("unit_selected");
    $(this).addClass("unit_selected");

  }); */
//<!-- Unit selector ends -->

//<!--Advice Assumptions Pop-up Box-->
  getStartData();
  $(".set_default_txt").click(function(){
	  getDefaultdata();
	  
	  if(startData == defaultData.toString()) {
		 /*  var headerSession = '${headerName}'; 
			if(headerSession == null || headerSession == '') {
				$("#successDialog").html(" Advice Assumptions already contain default data.");
		  		$( "#successDialog").dialog( "open" );
			}	
			else { */
		  		
				var headerSession = '${headerName}'; 
				if(headerSession == null || headerSession == '')
					$("#successDialog").html("Partner Assumptions already contain default data.");
				else {
					$("#successDialog").html("Contact Assumptions already contain default data.");
				}
		  		$( "#successDialog").dialog( "open" );
			//}
	  }else {
	  	var innerHTML="All Advice Assumptions values will be set to";
	  	innerHTML=innerHTML+" default as recommended by Shubhchintak.";
	  	innerHTML=innerHTML+" Are you sure you want to continue ?";
	  	$(".aa_up").html(innerHTML);
		$(".aa_yes").on('click',function(){cancelPage();});	
		var innerHTML='<a style="cursor:pointer;" class="aa_yes" onclick="setDefault();">Yes </a> ';
		innerHTML=innerHTML+ '<a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a>';
		$(".aa_down").html(innerHTML);
	  	$(".overlay").fadeIn();
		$("#assumptions").fadeIn();
	  }
	});
	
	$("#assumptions .close").click(function(){
    $(".overlay").fadeOut("slow");
	$("#assumptions").fadeOut("slow");
	 });
		
});

function closeDialog(){
	$(".overlay").fadeOut("slow");
	$("#assumptions").fadeOut("slow");
}

function back(){
	
	var headerSession = '${headerName}'; 
	if(headerSession == null || headerSession == '')
		javascript:location.href="${pageContext.request.contextPath}/partner/dashboard?flag=0";
	else {
		javascript:location.href="${pageContext.request.contextPath}/partner/datacollection/${clientPartyId}/${headerName}/2";
	}
	}
	
	function changeScale(current){
		if(current == 'k') {
			$(".k").addClass('unit_selected');
			$(".lacs").removeClass('unit_selected');
			$(".cr").removeClass('unit_selected');
			$(".dynamic").html("k");
		} else if(current == 'lacs') {
			$(".lacs").addClass('unit_selected');
			$(".k").removeClass('unit_selected');
			$(".cr").removeClass('unit_selected');
			$(".dynamic").html("lacs");
		} else if(current == 'cr') {
			$(".cr").addClass('unit_selected');
			$(".lacs").removeClass('unit_selected');
			$(".k").removeClass('unit_selected');
			$(".dynamic").html("cr");
		}
	}
</script>
<!--Advice Assumptions Pop-up Boxs -->


<body>
<!-- Wrapper starts-->
<div class="main-content"><div class="main-content-inner">

     
 <form id="frmAssumption" name="frmAssumption" action="<c:url value="/partner/saveAssumptions?partyId=${clientPartyId}" />" method="POST">
      <input type="hidden" name="minHealthAmount" id="minHealthAmount">
      <input type="hidden" name="maxHealthAmount" id="maxHealthAmount">
        
        
      
        <div class="page-content assumptions">
       
       <div class="row">
       <%-- <form class="form-horizontal" role="form"> --%>
       
       <div class="col-sm-6">
       <!-- Estimated Life Expectancy Starts Here -->
            <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1"> Estimated Life Expectancy </label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">70</span> <span id="sliderMaxValue_7" class="high extrem">100</span> </div>
                      <div class="help-block" id="input-size-slider11"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-11" placeholder="0" />
                      </div>
                      <span class="unit">Yrs</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            <!-- Estimated Life Expectancy Ends Here --> 
            
            
             <!--  retirement age Starts Here -->
            <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1"> Set yor default  retirement age</label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">70</span> </div>
                      <div class="help-block" id="input-size-slider12"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-12" placeholder="0" />
                      </div>
                      <span class="unit">Yrs</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            <!--  retirement age Ends Here --> 
            
            
            
             <!--   Expected Returns Starts Here -->
            <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1"> Expected Returns on existing Investment(%). (Used for projecting retirement asset value)</label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent heighttt_assm">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0%</span> <span id="sliderMaxValue_7" class="high extrem">15%</span> </div>
                      <div class="help-block" id="input-size-slider13"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-13" placeholder="0" />
                      </div>
                      <span class="unit">%</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            <!--   Expected Returns Ends Here -->
            
            
              <!--   Annual Earning Starts Here -->
            <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1">Annual Earning Growth Rate (%)</label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0%</span> <span id="sliderMaxValue_7" class="high extrem">100%</span> </div>
                      <div class="help-block" id="input-size-slider14"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-14" placeholder="0" />
                      </div>
                      <span class="unit">%</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            <!--  Annual Earning Ends Here -->
            
            
            
              <!--  Inflation Rate Starts Here -->
            <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1">Inflation Rate (%)</label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0%</span> <span id="sliderMaxValue_7" class="high extrem">15%</span> </div>
                      <div class="help-block" id="input-size-slider15"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-15" placeholder="0" />
                      </div>
                      <span class="unit">%</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            <!--  Inflation Rate  Ends Here -->
            
            </div>
            
            
            
            <div class="col-sm-6">
       <!-- Estimated Life Expectancy Starts Here -->
            <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1"> Fixed income returns (%) </label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0%</span> <span id="sliderMaxValue_7" class="high extrem">15%</span> </div>
                      <div class="help-block" id="input-size-slider16"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-16" placeholder="0" />
                      </div>
                      <span class="unit">%</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            <!-- Estimated Life Expectancy Ends Here --> 
            
            
             <!--  retirement age Starts Here -->
            <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1"> Real Estate investments growth rate (%) CAGR expected </label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0%</span> <span id="sliderMaxValue_7" class="high extrem">100%</span> </div>
                      <div class="help-block" id="input-size-slider17"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-17" placeholder="0" />
                      </div>
                      <span class="unit">%</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            <!--  retirement age Ends Here --> 
            
            
            
             <!--   Expected Returns Starts Here -->
            <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1">Emergency Funds Required - XX times monthly expense  </label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">36</span> </div>
                      <div class="help-block" id="input-size-slider18"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-18" placeholder="0" />
                      </div>
                      <span class="unit">%</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            <!--   Expected Returns Ends Here -->
            
            
              <!--   Annual Earning Starts Here -->
            <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1">Health Insurance cover </label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">20</span> </div>
                      <div class="help-block" id="input-size-slider19"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-19" placeholder="0" />
                      </div>
                      <span class="unit">lacs</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            <!--  Annual Earning Ends Here -->
            
            
            
              <!--  Inflation Rate Starts Here -->
            <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1">Critical Illness Insurance cover amount (XX times monthly 
                income)</label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">60</span> </div>
                      <div class="help-block" id="input-size-slider20"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-20" placeholder="0" />
                      </div>
                      <span class="unit">mnths</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            <!--  Inflation Rate  Ends Here -->
            
            
             <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1">Accident Disability Insurance cover amount (XX times 
                monthly income)</label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">60</span> </div>
                      <div class="help-block" id="input-size-slider21"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-21" placeholder="0" />
                      </div>
                      <span class="unit">mnths</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            
            
            
             <div class="form-group clearfix"> 
              <!-- Label Starts Here -->
              <label class="col-sm-3 no-padding-right" for="form-field-1">Life Insurance Calculation Method </label>
              <!-- Label Ends Here --> 
              
              <!-- Slider Starts Here -->
              
              <div class="col-sm-9 col-xs-12">
                <div class="range_parent">
                  <div class="scale clearfix">
                    <div class="col-sm-7 col-xs-6">
                      <div class="scale_range"> <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">100</span> </div>
                      <div class="help-block" id="input-size-slider22"></div>
                    </div>
                    <div class="space-10" ></div>
                    <div class="col-sm-5 col-xs-6">
                      <div class="counter_parent">
                        <input class="col-xs-9 range_counter answers required  Number1" type="text" id="form-field-22" placeholder="0" />
                      </div>
                      <span class="unit">mnths</span> </div>
                  </div>
                </div>
              </div>
              <!-- Slider Ends Here --> 
            </div>
            
            
            
                    
            
            
            
            
            
            
            </div>
            
           <%--  </form> --%>
             </div>
        
        
			<%-- <div class="row">
		 
	 <div class="col-sm-6">
        <div class="fl first_col">
          <div class="reset clearfix first_col_ul">
            <!------------------#######--------------->
            <div class="clearfix">
              <label class="form_label">Estimated Life Expectancy</label>
              <div class="range_parent topp">
                <div class="scale clearfix">
                <div class="col-sm-4">
                  <div class="scale_range">
                  <span id="sliderMinValue_7" class="low extrem">0</span> <span id="sliderMaxValue_7" class="high extrem">100</span> </div>
                  <div class="help-block ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="ele_input"><div class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min" style="width: 0%;"></div><span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 0%;"></span></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="ele_input" name="ele_input" class="range_counter" />
                    <span class="unit">yrs</span> </div>
                </div>
              </div>
            </div>
            <!------------------#######--------------->
            <div class="clearfix">
              <label class="form_label">Set your default retirement age</label>
              <div class="range_parent topp">
                <div class="scale clearfix">
                  <div class="scale_range">
                  
                  <div class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"></div>
                  
                  <span class="low extrem">${dfltRetirementAge.valueStartRange}</span><span class="high extrem">${dfltRetirementAge.valueEndRange}</span></div>
                  <div id="retirement_age"></div>
                  <div class="counter_parent">
                    <input type="text" id="retirement_age_input" name="retirement_age_input" class="range_counter" />
                    <span class="unit">yrs</span> </div>
                </div>
              </div>
            </div>
             <!------------------#######--------------->
            <div class="clearfix">
              <label class="form_label">Expected Returns on existing Investment(%). (Used for projecting retirement asset value) </label>
              <div class="range_parent topp">
                <div class="scale clearfix">
                  <div class="scale_range">
                  <div class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"></div>
                  <span class="low extrem">${expctdRtrnOnAllExstInvstment.valueStartRange}%</span><span class="high extrem">${expctdRtrnOnAllExstInvstment.valueEndRange}%</span></div>
                  <div id="ere"></div>
                  <div class="counter_parent">
                    <input type="text" id="ere_input" name="ere_input" class="range_counter" />
                    <span class="unit">%</span> </div>
                </div>
              </div>
            </div>
            <!------------------#######--------------->
            
            <div class="clearfix">
              <label class="form_label">Annual Earning Growth Rate(%) </label>
              <div class="range_parent topp">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">${annualearninggrowthRate.valueStartRange}%</span><span class="high extrem">${annualearninggrowthRate.valueEndRange}%</span></div>
                  <div id="annu_ear"></div>
                  <div class="counter_parent">
                    <input type="text" id="annu_ear_input" name="annu_ear_input" class="range_counter" />
                    <span class="unit">%</span> </div>
                </div>
              </div>
            </div>
            
            <!------------------#######--------------->
            
            <div class="clearfix">
              <label class="form_label">Inflation Rate(%) </label>
              <div class="range_parent topp">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">${inflationRate.valueStartRange}%</span><span class="high extrem">${inflationRate.valueEndRange}%</span></div>
                  <div id="ir"></div>
                  <div class="counter_parent">
                    <input type="text" id="ir_input" name="ir_input" class="range_counter" />
                    <span class="unit">%</span> </div>
                </div>
              </div>
            </div>
            
            <!------------------#######--------------->
            
            <div class="clearfix">
              <label class="form_label">Gold investments returns 
                (%) CAGR expected</label>
              <div class="range_parent topp">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">${goldInvstmntReturn.valueStartRange}%</span><span class="high extrem">${goldInvstmntReturn.valueEndRange}%</span></div>
                  <div id="gir"></div>
                  <div class="counter_parent">
                    <input type="text" id="gir_input" name="gir_input" class="range_counter" />
                    <span class="unit">%</span> </div>
                </div>
              </div>
            </div>
            
            <!------------------#######--------------->
            
            <div class="clearfix">
              <label class="form_label">Equity investments returns 
                (%) CAGR expected</label>
              <div class="range_parent topp">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">${equityInvstmntReturn.valueStartRange}%</span><span class="high extrem">${equityInvstmntReturn.valueEndRange}%</span></div>
                  <div id="eir"></div>
                  <div class="counter_parent">
                    <input type="text" id="eir_input" name="eir_input" class="range_counter" />
                    <span class="unit">%</span> </div>
                </div>
              </div>
            </div>
            
            <!------------------#######--------------->
            
          </div>
        </div>
        </div> 
         </div> --%>
        </div></div>
        
       
        </div>
		
		
	
		
        <input type="hidden" name="initialData" id="initialData" value="1"  />
        <input type="hidden" name="finalData" id="finalData" value="1"  />
        <input type="hidden" id="minfinalData" name="minfinalData" value=""  />
        <input type="hidden" id="maxfinalData" name="maxfinalData" value=""  />
        <input type="hidden" name="estmtLifeExpectancyId" id="estmtLifeExpectancyId" value="${estmtLifeExpectancyId}"  />
        <input type="hidden" name="dfltRetirementAgeId" id="dfltRetirementAgeId" value="${dfltRetirementAgeId}"  />
        <input type="hidden" name="expctdRtrnOnAllExstInvstmentId" id="expctdRtrnOnAllExstInvstmentId" value="${expctdRtrnOnAllExstInvstmentId}"  />
        <input type="hidden" name="annualearninggrowthRateId" id="annualearninggrowthRateId" value="${annualearninggrowthRateId}"  />
        <input type="hidden" name="inflationRateId" id="inflationRateId" value="${inflationRateId}"  />
        <input type="hidden" name="goldInvstmntReturnId" id="goldInvstmntReturnId" value="${goldInvstmntReturnId}"  />
        <input type="hidden" name="equityInvstmntReturnId" id="equityInvstmntReturnId" value="${equityInvstmntReturnId}"  />
        <input type="hidden" name="fixedIncomereturnId" id="fixedIncomereturnId" value="${fixedIncomereturnId}"  />
        <input type="hidden" name="realEstateGrowthrateId" id="realEstateGrowthrateId" value="${realEstateGrowthrateId}"  />
        <input type="hidden" name="emergencyFundrequiredId" id="emergencyFundrequiredId" value="${emergencyFundrequiredId}"  />
        <input type="hidden" name="healthInsuranceCoverAmntId" id="healthInsuranceCoverAmntId" value="${healthInsuranceCoverAmntId}"  />
        <input type="hidden" name="criticalIllnessCoverAmntId" id="criticalIllnessCoverAmntId" value="${criticalIllnessCoverAmntId}"  />
        <input type="hidden" name="accdntInsuranceCoverAmntId" id="accdntInsuranceCoverAmntId" value="${accdntInsuranceCoverAmntId}"  />
        <%-- <input type="hidden" name="lifeInsuranceMethodId" id="lifeInsuranceMethodId" value="${lifeInsuranceMethodId}"  /> --%>
        <input type="hidden" name="recordTypeId" id="recordTypeId" value="${recordTypeId}"  />
        </form>
        
         <!-- Common footer starts -->
    <section class="common_footer_actions">
      <div class="row">
        
        
        
        <div class="col-sm-12 col-xs-12 centerAll">
        
          
          
            <button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa fa-file-code-o bigger-200"></i> Save </button>
            <button class="btn btn-app btn-transparent btn-xs"> <i class="ace-icon fa fa-newspaper-o bigger-200"></i> Cancel </button>
          
         
     
        </div>
        
      </div>
    </section>
    
    
    <%--   <section id="Footer_Type_Two" class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup">
            <c:if test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
        	    <li class="fl list"><a href="#" class="anch save saveAdviceAssumptionLink" onClick="formSubmit();"><span class="txt">Save</span></a></li>
      	    </c:if>            
            <li class="fl list"><a href="#" class="anch cancel" onClick="formCancel();"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
      </section> --%>
  <!-- Common footer ends -->


</div></div>

<!-- Wrapper ends-->

<!-- <div id="assumptions" class="common_custom_modal_aa">
  <span class="close">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
        All Advice Assumptions values will be set to
default as recommended by Shubhchintak.
Are you sure you want to continue ?</div>
     
         <div class="aa_down"> <a href="#" onClick="setDefault();" class="aa_yes">Yes </a> 
         <a href="#" onClick="closeDialog();" class="aa_no">No</a> </div>


  </div>
</div> -->
<script type="text/javascript">
	$(document).ready(function(){
		var values = [];
		
		/* var selectBox1 = $("#lifeSelect").selectBoxIt().data('selectBox-selectBoxIt');			    
	    selectBox1.selectOption('${lifeInsuranceMethodAmnt.assumptionValue}'); */
		
		$('input[type="text"]').each(function() {
			var id = $(this).attr('id');
			if(id == 'hic_input') {			
				var amount = $(this).val();
				if($(".k").hasClass("unit_selected")) {
					amount = amount * 1000;
					$("#minHealthAmount").val(${healthInsuranceCoverAmnt.valueStartRange}*1000);
					$("#maxHealthAmount").val(${healthInsuranceCoverAmnt.valueEndRange}*1000);
				} else if($(".lacs").hasClass("unit_selected")) {
			    	amount = amount * 100000;
			    	$("#minHealthAmount").val(${healthInsuranceCoverAmnt.valueStartRange}*100000);
			    	$("#maxHealthAmount").val(${healthInsuranceCoverAmnt.valueEndRange}*100000);
				} else if($(".cr").hasClass("unit_selected")) {
					amount = amount * 10000000;
					$("#minHealthAmount").val(${healthInsuranceCoverAmnt.valueStartRange}*10000000);
					$("#maxHealthAmount").val(${healthInsuranceCoverAmnt.valueEndRange}*10000000);
				} 					
				values.push(amount);
			} else {
		    	values.push($(this).val());
			}
		});
		/* values.push($('#lifeSelect').val()); */
		$("#initialData").val(values);
		
});
	var minValues = [];
	var maxValues = [];
	function createSliderLocal(ctrlName, minVal, maxVal, stepBy, ctrlTextBox,value) {		
		minValues.push(minVal);
		maxValues.push(maxVal);
		$("#minfinalData").val(minValues);
		$("#maxfinalData").val(maxValues);
		
	    $(ctrlName).slider({
	        min: minVal,
	        max: maxVal,
	        step: stepBy,
	        value: value,
	        slide: function (event, ui) {
	            $(ctrlTextBox).val(ui.value);
				
	        }
	    });
	    $(ctrlTextBox).val($(ctrlName).slider("value"));

	    $(ctrlTextBox).keyup(function () {
	        $(ctrlTextBox).val();
	        $(ctrlName).slider('value', $(ctrlTextBox).val());
	    });
		
	}
function formSubmit(){
	var values = [];		
	/* var LiValue = ""; */
	$('input[type="text"]').each(function() {		
		var id = $(this).attr('id');
		if(id == 'hic_input') {			
			var amount = $(this).val();
			if($(".k").hasClass("unit_selected")) {
				amount = amount * 1000;
				$("#minHealthAmount").val(${healthInsuranceCoverAmnt.valueStartRange}*1000);
				$("#maxHealthAmount").val(${healthInsuranceCoverAmnt.valueEndRange}*1000);
			} else if($(".lacs").hasClass("unit_selected")) {
		    	amount = amount * 100000;
		    	$("#minHealthAmount").val(${healthInsuranceCoverAmnt.valueStartRange}*100000);
		    	$("#maxHealthAmount").val(${healthInsuranceCoverAmnt.valueEndRange}*100000);
			} else if($(".cr").hasClass("unit_selected")) {
				amount = amount * 10000000;
				$("#minHealthAmount").val(${healthInsuranceCoverAmnt.valueStartRange}*10000000);
				$("#maxHealthAmount").val(${healthInsuranceCoverAmnt.valueEndRange}*10000000);
			} 					
			values.push(amount);
		} else {
	    	values.push($(this).val());
		}
	});
	/* LiValue = $('#lifeSelect').val();
	values.push(LiValue); */
	$("#finalData").val(values);
	if($("#finalData").val() == $("#initialData").val()) {
		$("#successDialog").html("You haven't changed any data yet.Please make some changes and then save.");
	  	$( "#successDialog").dialog( "open" );
	}
	else {
		$("#frmAssumption").submit();
	}
}

function formCancel(){
	var values = [];
	$('input[type="text"]').each(function() {
		var id = $(this).attr('id');
		if(id == 'hic_input') {			
			var amount = $(this).val();
			if($(".k").hasClass("unit_selected")) {
				amount = amount * 1000;
				$("#minHealthAmount").val(${healthInsuranceCoverAmnt.valueStartRange}*1000);
				$("#maxHealthAmount").val(${healthInsuranceCoverAmnt.valueEndRange}*1000);
			} else if($(".lacs").hasClass("unit_selected")) {
		    	amount = amount * 100000;
		    	$("#minHealthAmount").val(${healthInsuranceCoverAmnt.valueStartRange}*100000);
		    	$("#maxHealthAmount").val(${healthInsuranceCoverAmnt.valueEndRange}*100000);
			} else if($(".cr").hasClass("unit_selected")) {
				amount = amount * 10000000;
				$("#minHealthAmount").val(${healthInsuranceCoverAmnt.valueStartRange}*10000000);
				$("#maxHealthAmount").val(${healthInsuranceCoverAmnt.valueEndRange}*10000000);
			} 					
			values.push(amount);
		} else {
	    	values.push($(this).val());
		}
	});
	/* values.push($('#lifeSelect').val()); */
	$("#finalData").val(values);
	if($("#initialData").val() != $("#finalData").val()){
		$(".aa_up").html("<spring:message code='dataChanged' />");
		$(".aa_yes").on('click',function(){cancelPage();});	
		var innerHTML='<a style="cursor:pointer;" class="aa_yes" onclick="cancelPage();">Yes </a> ';
		innerHTML=innerHTML+ '<a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a>';
		$(".aa_down").html(innerHTML);
		$(".overlay").fadeIn();
		$("#assumptions").fadeIn();
	}else{
		cancelPage();
	}
		
}

function cancelPage(){
	back();
}

function setDefault(){
	 //var r = confirm("Are you sure you want to set the values to default values?");
	//if (r == true) {
	$('#frmAssumption').attr('action', '${pageContext.request.contextPath}/partner/setDefault?partyId=${clientPartyId}');
	$("#frmAssumption").submit();
	 //}else{
	//	return false;
	//}  
}

function getDefaultdata() {
	defaultData = [];
	defaultData.push($('#ele_input').val());
	defaultData.push($('#retirement_age_input').val());
	defaultData.push($('#ere_input').val());
	defaultData.push($('#annu_ear_input').val());
	defaultData.push($('#ir_input').val());
	defaultData.push($('#gir_input').val());
	defaultData.push($('#eir_input').val());
	defaultData.push($('#fir_input').val());
	defaultData.push($('#rei_input').val());
	defaultData.push($('#efr_input').val());
	defaultData.push($('#hic_input').val());
	defaultData.push($('#cii_input').val());
	defaultData.push($('#aci_input').val());	
	/* defaultData.push($('#lifeSelect').val()); */	
}
</script>
<script type="text/javascript">


	
			jQuery(function($) {
				
				
				
				$( "#input-size-slider11" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 100,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-11" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-11" ).val(  $( "#input-size-slider11" ).slider( "value" ) );
			
			
				
				
				
					$( "#input-size-slider12" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 100,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-12" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-12" ).val( $( "#input-size-slider12" ).slider( "value" ) );
				
				
				
				$( "#input-size-slider13" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 15,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-13" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-13" ).val( $( "#input-size-slider13" ).slider( "value" ) );
				
				
				
				
				$( "#input-size-slider14" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 100,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-14" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-14" ).val( $( "#input-size-slider14" ).slider( "value" ) );
					
		
				
				$( "#input-size-slider15" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 15,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-15" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-15" ).val( $( "#input-size-slider15" ).slider( "value" ) );
				
				
				
				
				$( "#input-size-slider16" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 15,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-16" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-16" ).val( $( "#input-size-slider16" ).slider( "value" ) );
				
				
				$( "#input-size-slider17" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 100,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-17" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-17" ).val( $( "#input-size-slider17" ).slider( "value" ) );
			
				
			
				
				$( "#input-size-slider18" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 36,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-18" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-18" ).val( $( "#input-size-slider18" ).slider( "value" ) );
				
				
				
				$( "#input-size-slider19" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 20,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-19" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-19" ).val( $( "#input-size-slider19" ).slider( "value" ) );
			
				
				

				$( "#input-size-slider20" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 60,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-20" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-20" ).val( $( "#input-size-slider20" ).slider( "value" ) );
			
				

				$( "#input-size-slider21" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 10,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-21" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-21" ).val( $( "#input-size-slider21" ).slider( "value" ) );
			
				
				

				$( "#input-size-slider22" ).slider({
					value:0,
					range: "min",
					min: 0,
					max: 60,
					step: 1,
					 slide: function( event, ui ) {
						 $( "#form-field-22" ).val( ui.value );
						 }
					
				});
			
				$( "#form-field-22" ).val( $( "#input-size-slider22" ).slider( "value" ) );
			
			
				
				
				
			
			
				
			});
		</script> 
 <div class="overlay"></div>    
</body>
