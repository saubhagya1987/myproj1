<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
#page_loader{
		background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
	} 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>Risk Profile</title>
<link rel="shortcut icon" href="../images/favicon.ico" />


<script>
$(window).load(function(){
	  $('#page_loader').fadeOut("5000");
});
$(document).ready(function(){
 $('.wrapper').addClass("risk_profile_subscribed_wrapper");
    $('.dynamic_insurance_container').slimScroll();

	$("#life_insurance").click(function(){
		 $("#life_insurance").attr("checked", true);
		 $("#genral_insurance").attr("checked", false);	 
		if(!($(".life_insurance_container ").is(":visible")))
	   	{
	   	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".life_insurance_container ").fadeIn("slow");
		   });
	    }
	}) 
	 $("#genral_insurance").click(function(){
		  $("#life_insurance").attr("checked", false);
		 $("#genral_insurance").attr("checked", true);
	    if(!($(".genral_insurance_container ").is(":visible")))
	   	{
	   	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".genral_insurance_container ").fadeIn("slow");
		   });
	   }
	}) 
	
	if('${insuranceType}'=="lifeInsurance")
	{
		$("#life_insurance").attr("checked",true);
	}
	else if('${insuranceType}'=="generalInsurance")
	{
		$("#genral_insurance").attr("checked",true);
	}
		

	if($("#life_insurance").attr('checked'))
	{
		   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".life_insurance_container ").fadeIn("slow");
		   });
	    
	}
	else if($("#genral_insurance").attr('checked'))
	{
		   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".genral_insurance_container ").fadeIn("slow");
		   });
	   
	}


    
});

function checkData(url){
		 var partyId = '${partyId}';
 		 window.location.href=url + "?returnUrl=${pageContext.request.contextPath}/insurance/showInsuranceSummary/generalInsurance/" + partyId;
}
</script>


</head>

<body>
<!-- Wrapper starts-->
<div class=""> 
  <!-- Main starts-->
  
  <section class="main"> 
    <!-- Header Starts-->
    <!-- Header Ends--> 
    
    <!-- Common_content Starts-->
    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <section class="in_content common_in_content"> 
        <!-- Common_in_contnet starts-->        
        <section id="risk_profile_subscribed" class="in_content common_in_content clearfix">
          
          <div class="top_toggle clearfix northspace3">
          <div class="fl insurance_type westspace1 genral_insurance"><input name="insurance_type" type="radio" value="" id="genral_insurance" class="fl"><label for="fd" class="fl inlineBlock westspace1">General Insurance</label></div>
          <div class="fl insurance_type westspace2 life_insurance"><input name="insurance_type" type="radio" value="" id="life_insurance" class="fl"><label for="fd" class="fl inlineBlock westspace1">Life Insurance</label></div>
          
          </div>
          <a class="fr common_back_btn eastspace6" href="${pageContext.request.contextPath}/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName") %>/2" style="margin-top: -30px;">Back</a>
          <div class="dynamic_insurance_container">
          <div class="genral_insurance_container dynamic_box clearfix" id="genral_insurance_container">
          <div class="type_box fl clearfix critical_illness">
        	<div class="header"><p>Critical Illness</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><a class="icon" href="${pageContext.request.contextPath}/insurance/general-insurance-details/criticalIllness/${partyId}"></a></div><!-- icon-bg Ends-->
                <%-- <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <div class="goal-no"><p>${criticalInsurance.goalCount}</p></div>
                </div><!-- linked-goals Ends--> --%>
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av">Available Cover</p>
                    <!-- <p class="aa fr">Allocated Amount</p> -->
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side-one fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="reqCriticalAmt"></div>
                    <div class="unit fl" id="reqCriticalUnit"></div>
                    <script>
                    	
                    var amt=0;
                    	
                    	if(${criticalInsurance.insuranceCoverAmount}>0)
                    	{
	                    	amt = ${criticalInsurance.insuranceCoverAmount}/1000;	
	                    	if(amt < 100) {
	                    		$("#reqCriticalUnit").html("K");
	                    	} else {
	                    		amt = amt/100;
	                    		if(amt < 100) {
	                    			$("#reqCriticalUnit").html("Lac");
	                    		} else {
	                    			amt = amt/100;
	                    			$("#reqCriticalUnit").html("Cr");
	                    		}
                    		} 
                    		$("#reqCriticalAmt").html(amt.toFixed(2));
                    	}else{
                    		
                    		<c:if test="${not empty CriticalInsuranceAmount}">
                    		amt = ${CriticalInsuranceAmount}/1000; 
                    		if(amt < 100) {
                        		$("#reqCriticalUnit").html("K");
                        	} else {
                        		amt = amt/100;
                        		if(amt < 100) {
                        			$("#reqCriticalUnit").html("Lac");
                        		} else {
                        			amt = amt/100;
                        			$("#reqCriticalUnit").html("Cr");
                        		}
                        	} 
                    		</c:if>
                        	$("#reqCriticalAmt").html(amt.toFixed(2));
                    	}
                    </script>
					
                </div><!-- box-footer-left-side Ends-->
                <!-- <div class="devider fl"></div>
                <div class="box-footer-right-side fr">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="currCriticalAmt"></div>
                    <div class="unit fl" id="currCriticalUnit"></div>
                    <script>                    	
                    	var amt = ${criticalInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#currCriticalUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#currCriticalUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#currCriticalUnit").html("Cr");
                    		}
                    	} 
                    	$("#currCriticalAmt").html(amt.toFixed(2));
                    </script>
                    <br>                       
                    <div class="percentage" id="criticalPer">(<span class="percent_value"></span>%)</div>
                    <script>
                    var perc=${criticalInsurance.insuranceCoverAmount*100/criticalInsurance.requiredAmount};                    
                    if(perc<100) {
                    	$("#criticalPer").html("("+perc.toFixed(2)+"%)");
                    } else {
                    	$("#criticalPer").html('(100%)');
                    }
                    </script>  
                </div>box-footer-right-side Ends -->
                                                
            </div><!-- box-footer Ends-->
            
        </div>
        
          <div class="type_box fl clearfix health">
        	<div class="header"><p>Health</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><a href="${pageContext.request.contextPath}/insurance/general-insurance-details/health/${partyId}" class="icon"></a></div><!-- icon-bg Ends-->
                <%-- <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <div class="goal-no"><p>${healthInsurance.goalCount}</p></div>
                </div><!-- linked-goals Ends--> --%>
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av">Available Cover</p>
                    <!-- <p class="aa fr">Allocated Amount</p> -->
                </div><!-- box-footer-header Ends-->
                
                 <div class="box-footer-left-side-one fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="reqHealthAmt"></div>
                    <div class="unit fl" id="reqHealthUnit"></div>
                    <script>
                    
                    var amt=0.0;
                    if(${healthInsurance.insuranceCoverAmount}>0){
                    
                    	amt = ${healthInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#reqHealthUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqHealthUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqHealthUnit").html("Cr");
                    		}
                    	} 
                    	$("#reqHealthAmt").html(amt.toFixed(2));
                    }else
                    {
                    	<c:if test="${not empty HealthInsuranceAmount}">
                    	amt = ${HealthInsuranceAmount}/1000; 
                		if(amt < 100) {
                    		$("#reqHealthUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqHealthUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqHealthUnit").html("Cr");
                    		}
                    	} 
                		</c:if>
                    	$("#reqHealthAmt").html(amt.toFixed(2));
                    	
                    }
                    </script>
                </div><!-- box-footer-left-side Ends -->
                <!--<div class="devider fl"></div>
                <div class="box-footer-right-side fr">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="currHealthAmt"></div>
                    <div class="unit fl"id="currHealthUnit"></div>
                    <script>                    	
                    	var amt = ${healthInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#currHealthUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#currHealthUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#currHealthUnit").html("Cr");
                    		}
                    	} 
                    	$("#currHealthAmt").html(amt.toFixed(2));
                    </script>
                    <br>                       
                    <div class="percentage" id="healthPer">(<span class="percent_value"></span>%)</div>
                    <script>
                    var perc=${healthInsurance.insuranceCoverAmount*100/healthInsurance.requiredAmount};                    
                    if(perc<100) {
                    	$("#healthPer").html("("+perc.toFixed(2)+"%)");
                    } else {
                    	$("#healthPer").html('(100%)');
                    }
                    </script>   
                </div>box-footer-right-side Ends
         -->                                        
            </div><!-- box-footer Ends-->
            
        </div>
        
          <div class="type_box fl clearfix personal_accident">
        	<div class="header"><p>Personal Accident</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><a class="icon" href="${pageContext.request.contextPath}/insurance/general-insurance-details/personalAccident/${partyId}"></a></div><!-- icon-bg Ends-->
                <%-- <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <div class="goal-no"><p>${accidentsInsurance.goalCount}</p></div>
                </div><!-- linked-goals Ends--> --%>
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av">Available Cover</p>
                    <!-- <p class="aa fr">Allocated Amount</p> -->
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side-one fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="reqAccidentAmt"></div>
                    <div class="unit fl" id="reqAccidentUnit"></div>
                    <script>
                    var amt=0.0;
                    if(${accidentsInsurance.insuranceCoverAmount}>0){
                  	amt = ${accidentsInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#reqAccidentUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqAccidentUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqAccidentUnit").html("Cr");
                    		}
                    	} 
                    	$("#reqAccidentAmt").html(amt.toFixed(2));
                    }
                    else
                    {	<c:if test="${not empty AccidentalInsuranceAmount}">
                    	amt = ${AccidentalInsuranceAmount}/1000; 
                		if(amt < 100) {
                    		$("#reqAccidentUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqAccidentUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqAccidentUnit").html("Cr");
                    		}
                    	} 
                		</c:if>
                		$("#reqAccidentAmt").html(amt.toFixed(2));
                    	
                    }
                    </script>
                </div><!-- box-footer-left-side Ends-->
                <!-- <div class="devider fl"></div>
                <div class="box-footer-right-side fr">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="currAccidentAmt"></div>
                    <div class="unit fl" id="currAccidentUnit"></div>
                    <script>                    	
                    	var amt = ${accidentsInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#currAccidentUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#currAccidentUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#currAccidentUnit").html("Cr");
                    		}
                    	} 
                    	$("#currAccidentAmt").html(amt.toFixed(2));
                    </script>
                    <br>                       
                    <div class="percentage" id="accidentPer">(<span class="percent_value"></span>%)</div>
                    <script>
                    var perc=${accidentsInsurance.insuranceCoverAmount*100/accidentsInsurance.requiredAmount};                    
                    if(perc<100) {
                    	$("#accidentPer").html("("+perc.toFixed(2)+"%)");
                    } else {
                    	$("#accidentPer").html('(100%)');
                    }
                    </script> 
                </div>box-footer-right-side Ends
             -->                                    
            </div><!-- box-footer Ends-->
            
        </div>
        
          <div class="type_box fl asset clearfix">
        	<div class="header"><p>Property</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><a class="icon" href="${pageContext.request.contextPath}/insurance/general-insurance-details/asset/${partyId}"></a></div><!-- icon-bg Ends-->
                <%-- <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <div class="goal-no"><p>${assetInsurance.goalCount}</p></div>
                </div><!-- linked-goals Ends--> --%>
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av">Available Cover</p>
                    <!-- <p class="aa fr">Allocated Amount</p> -->
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side-one fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="reqAssetAmt"></div>
                    <div class="unit fl" id="reqAssetUnit"></div>
                    <script>
                    var amt = 0.0;
                    	if(${assetInsurance.insuranceCoverAmount}>0){
                    	amt = ${assetInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#reqAssetUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqAssetUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqAssetUnit").html("Cr");
                    		}
                    	} 
                    	$("#reqAssetAmt").html(amt.toFixed(2));
                    	}else{
                    		<c:if test="${not empty AssetInsuranceAmount}">
                    		amt = ${AssetInsuranceAmount}/1000; 
                    		if(amt < 100) {
                        		$("#reqAssetUnit").html("K");
                        	} else {
                        		amt = amt/100;
                        		if(amt < 100) {
                        			$("#reqAssetUnit").html("Lac");
                        		} else {
                        			amt = amt/100;
                        			$("#reqAssetUnit").html("Cr");
                        		}
                        	} 
                    		</c:if>
                    		$("#reqAssetAmt").html(amt.toFixed(2));
                    	}
                    </script>
                </div><!-- box-footer-left-side Ends-->
                <!-- <div class="devider fl"></div>
                <div class="box-footer-right-side fr">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="currAssetAmt"></div>
                    <div class="unit fl" id="currAssetUnit"></div>
                    <script>                    	
                    	var amt = ${assetInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#currAssetUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#currAssetUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#currAssetUnit").html("Cr");
                    		}
                    	} 
                    	$("#currAssetAmt").html(amt.toFixed(2));
                    </script>
                    <br>                       
                    <div class="percentage" id="assetPer">(<span class="percent_value"></span>%)</div>
                    <script>
                    var perc=${assetInsurance.insuranceCoverAmount*100/assetInsurance.requiredAmount};                    
                    if(perc<100) {
                    	$("#assetPer").html("("+perc.toFixed(2)+"%)");
                    } else {
                    	$("#assetPer").html('(100%)');
                    }
                    </script>      
                </div>box-footer-right-side Ends
                 -->                                
            </div><!-- box-footer Ends-->
            
        </div>
        
        
        
          </div>
          
          <div class="life_insurance_container clearfix dynamic_box hide" id="life_insurance_container">
          <div style="margin-top:auto ;margin-left: 330px;font-weight: bold;font-size: 14px;">
          <c:if test="${ulipInsurance.insuranceCoverAmount eq 0 and moneyBackInsurance.insuranceCoverAmount eq 0 and endownmentInsurance.insuranceCoverAmount eq 0 and termInsurance.insuranceCoverAmount eq 0}">
          	<c:set var="amt" value="0.0"/>
            <c:set var="unit" value="Lac"/>
            <c:if test="${not empty LifeInsuranceAmount}">
            <c:set var="amt" value="${LifeInsuranceAmount/1000}"/>
            	<c:choose>
                    		
                    		<c:when test="${amt lt 100}">
                    			<c:set var="unit" value="K"/>
                    		</c:when> 
                    		<c:when test="${amt gt 100 or amt eq 100 }">
	                    		<c:set var="amt" value="${amt/100}"/>
	                    		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="Lac"/>
	                    		</c:if>
	                    		<c:if test="${amt gt 100 or amt eq 100}">
	                    			<c:set var="amt" value="${amt/100}"/>
	                    			<c:set var="unit" value="Cr"/>
	                    		</c:if>
                    		</c:when> 
                    	
            	</c:choose> 
            </c:if>
            You have declared <b class="theme_color">${amt} ${unit}</b> of Life Insurance Cover in Financial Plan.
            </c:if>
          </div>
          <div class="type_box fl clearfix term">
        	<div class="header"><p>Term</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><a class="icon" href="${pageContext.request.contextPath}/insurance/life-insurance-details/term/${partyId}"></a></div><!-- icon-bg Ends-->
                <!--<div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <div class="goal-no"><p>3</p></div>
                </div>--><!-- linked-goals Ends-->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av">Available Cover</p>
                    <!-- <p class="aa fr">Allocated Cover</p> -->
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side-one fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="reqTermAmt"></div>
                    <div class="unit fl" id="reqTermUnit"></div>
                    <script>
                    var amt = 0;
                //    if(${ulipInsurance.insuranceCoverAmount}>0 || ${moneyBackInsurance.insuranceCoverAmount}>0 || ${endownmentInsurance.insuranceCoverAmount}>0 || ${termInsurance.insuranceCoverAmount}>0){
                  	amt = ${termInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#reqTermUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqTermUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqTermUnit").html("Cr");
                    		}
                    	} 
                    	$("#reqTermAmt").html(amt.toFixed(2));
                  /*   }
                    else
                    {
                    	<c:if test="${not empty LifeInsuranceAmount}">
                    	amt = ${LifeInsuranceAmount}/1000; 
                		if(amt < 100) {
                    		$("#reqTermUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqTermUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqTermUnit").html("Cr");
                    		}
                    	} 
                		</c:if> */
                		$("#reqTermAmt").html(amt.toFixed(2));
                    		
                    //}
                    </script>
                    
                </div><!-- box-footer-left-side Ends-->
                <!-- <div class="devider fl"></div>
                <div class="box-footer-right-side fr">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="currTermAmt"></div>
                    <div class="unit fl" id="currTermUnit"></div>
                    <script>                    	
                    	var amt = ${termInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#currTermUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#currTermUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#currTermUnit").html("Cr");
                    		}
                    	} 
                    	$("#currTermAmt").html(amt.toFixed(2));
                    </script>
										
                    <br>                       
                    <div class="percentage" id="termPer">(<span class="percent_value">30</span>%)</div>
                    <script>
                    var perc=${termInsurance.insuranceCoverAmount*100/termInsurance.requiredAmount};                    
                    if(perc<100) {
                    	$("#termPer").html("("+perc.toFixed(2)+"%)");
                    } else {
                    	$("#termPer").html('(100%)');
                    }
                    </script>   
                </div>box-footer-right-side Ends
             -->                                    
            </div><!-- box-footer Ends-->
            
        </div>
        
          <div class="type_box fl clearfix endowment">
        	<div class="header"><p>Endowment</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><a class="icon" href="${pageContext.request.contextPath}/insurance/life-insurance-details/endowment/${partyId}"></a></div><!-- icon-bg Ends-->
                <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <div class="goal-no"><p>${endownmentInsurance.goalCount}</p></div>
                </div><!-- linked-goals Ends-->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av fl">Available Amount</p>
                    <p class="aa fr">Allocated Amount</p>
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="reqEndownmentAmt"></div>
                    <div class="unit fl" id="reqEndownmentUnit"></div>
                    <script>
                    var amt = 0.0;
                   // if(${ulipInsurance.insuranceCoverAmount}>0 || ${moneyBackInsurance.insuranceCoverAmount}>0 || ${endownmentInsurance.insuranceCoverAmount}>0 || ${termInsurance.insuranceCoverAmount}>0){
                  	amt = ${endownmentInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#reqEndownmentUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqEndownmentUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqEndownmentUnit").html("Cr");
                    		}
                    	} 
                    	$("#reqEndownmentAmt").html(amt.toFixed(2));
                   /*  }
                    else
                    {
                    	<c:if test="${not empty LifeInsuranceAmount}">
                    	amt = ${LifeInsuranceAmount}/1000; 
                		if(amt < 100) {
                    		$("#reqEndownmentUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqEndownmentUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqEndownmentUnit").html("Cr");
                    		}
                    	} 
                		</c:if> */
                		$("#reqEndownmentAmt").html(amt.toFixed(2));
                    	
                   // }
                    </script>
                </div><!-- box-footer-left-side Ends-->
                <div class="devider fl"></div>
                <div class="box-footer-right-side fr">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="currEndownmentAmt"></div>
                    <div class="unit fl" id="currEndownmentUnit"></div>
                    <script>  
                    	var amt = ${endownmentInsurance.allocatedAmount}/1000;
                    	if(amt < 100) {
                    		$("#currEndownmentUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#currEndownmentUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#currEndownmentUnit").html("Cr");
                    		}
                    	} 
                    	$("#currEndownmentAmt").html(amt.toFixed(2));
                    </script>
					
                    <br>                       
                    <div class="percentage" id="endownmentPer">(<span class="percent_value"></span>%)</div>
                    <script>
                    var perc= 0.0;
                    if(! ${endownmentInsurance.insuranceCoverAmount}<=0 && ! ${endownmentInsurance.allocatedAmount}<=0)
                    {
                    	perc= ${endownmentInsurance.allocatedAmount*100/endownmentInsurance.insuranceCoverAmount};
                    }
                    if(perc<100) {
                    	$("#endownmentPer").html("("+perc.toFixed(2)+"%)");
                    } else {
                    	$("#endownmentPer").html('(100%)');
                    }
                    </script>  
                </div><!-- box-footer-right-side Ends-->
                                                
            </div><!-- box-footer Ends-->
            
        </div>
        
          <div class="type_box fl clearfix money_back">
        	<div class="header"><p>Money Back</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><a class="icon" href="${pageContext.request.contextPath}/insurance/life-insurance-details/moneyBack/${partyId}"></a></div><!-- icon-bg Ends-->
                <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <div class="goal-no"><p>${moneyBackInsurance.goalCount}</p></div>
                </div><!-- linked-goals Ends-->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av fl">Available Amount</p>
                    <p class="aa fr">Allocated Amount</p>
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="reqMoneyBackAmt"></div>
                    <div class="unit fl" id="reqMoneyBackUnit"></div>
                    <script>
                    var amt = 0.0;
                  //  if(${ulipInsurance.insuranceCoverAmount}>0 || ${moneyBackInsurance.insuranceCoverAmount}>0 || ${endownmentInsurance.insuranceCoverAmount}>0 || ${termInsurance.insuranceCoverAmount}>0){
                  	amt = ${moneyBackInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#reqMoneyBackUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqMoneyBackUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqMoneyBackUnit").html("Cr");
                    		}
                    	} 
                    	$("#reqMoneyBackAmt").html(amt.toFixed(2));
                  /*   }
                    else
                    {
                    	<c:if test="${not empty LifeInsuranceAmount}">
                    	amt = ${LifeInsuranceAmount}/1000; 
                		if(amt < 100) {
                    		$("#reqMoneyBackUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqMoneyBackUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqMoneyBackUnit").html("Cr");
                    		}
                    	} 
                		</c:if> */
                		$("#reqMoneyBackAmt").html(amt.toFixed(2));
                   // }
                    </script>
					
                </div><!-- box-footer-left-side Ends-->
                <div class="devider fl"></div>
                <div class="box-footer-right-side fr">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="currMoneyBackAmt"></div>
                    <div class="unit fl" id="currMoneyBackUnit"></div>
                    <script>                    	
                    	var amt = ${moneyBackInsurance.allocatedAmount}/1000;
                    	if(amt < 100) {
                    		$("#currMoneyBackUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#currMoneyBackUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#currMoneyBackUnit").html("Cr");
                    		}
                    	} 
                    	$("#currMoneyBackAmt").html(amt.toFixed(2));
                    </script>
                    <br>                       
                    <div class="percentage" id="moneyBackPer">(<span class="percent_value">30</span>%)</div>
                    <script>
                    var perc = 0.0;
                    if(! ${moneyBackInsurance.allocatedAmount}<=0 && ! ${moneyBackInsurance.insuranceCoverAmount}<=0)
                    {
                    	perc=${moneyBackInsurance.allocatedAmount*100/moneyBackInsurance.insuranceCoverAmount};	
                    }
                    if(perc<100) {
                    	$("#moneyBackPer").html("("+perc.toFixed(2)+"%)");
                    } else {
                    	$("#moneyBackPer").html('(100%)');
                    }
                    </script>    
                </div><!-- box-footer-right-side Ends-->
                                                
            </div><!-- box-footer Ends-->
            
        </div>
        
          <div class="type_box fl ulip clearfix">
        	<div class="header"><p>ULIP</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><a class="icon" href="${pageContext.request.contextPath}/insurance/life-insurance-details/ulip/${partyId}"></a></div><!-- icon-bg Ends-->
                <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <div class="goal-no"><p>${ulipInsurance.goalCount}</p></div>
                </div><!-- linked-goals Ends-->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av fl">Available Amount</p>
                    <p class="aa fr">Allocated Amount</p>
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="reqUlipAmt"></div>
                    <div class="unit fl" id="reqUlipUnit"></div>
                    <script>
                    var amt = 0.0;
                    //if(${ulipInsurance.insuranceCoverAmount}>0 || ${moneyBackInsurance.insuranceCoverAmount}>0 || ${endownmentInsurance.insuranceCoverAmount}>0 || ${termInsurance.insuranceCoverAmount}>0){
                  	var amt = ${ulipInsurance.insuranceCoverAmount}/1000;
                    	if(amt < 100) {
                    		$("#reqUlipUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqUlipUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqUlipUnit").html("Cr");
                    		}
                    	} 
                    	$("#reqUlipAmt").html(amt.toFixed(2));
                   /*  }else
                    {
                    	<c:if test="${not empty LifeInsuranceAmount}">
                    	amt = ${LifeInsuranceAmount}/1000; 
                		if(amt < 100) {
                    		$("#reqUlipUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#reqUlipUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#reqUlipUnit").html("Cr");
                    		}
                    	} 
                		</c:if> */
                		$("#reqUlipAmt").html(amt.toFixed(2));
                    //}
                    </script>
					
                </div><!-- box-footer-left-side Ends-->
                <div class="devider fl"></div>
                <div class="box-footer-right-side fr">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl" id="currUlipAmt"></div>
                    <div class="unit fl" id="currUlipUnit"></div>
                    <script>                    	
                    	var amt = ${ulipInsurance.allocatedAmount}/1000;
                    	if(amt < 100) {
                    		$("#currUlipUnit").html("K");
                    	} else {
                    		amt = amt/100;
                    		if(amt < 100) {
                    			$("#currUlipUnit").html("Lac");
                    		} else {
                    			amt = amt/100;
                    			$("#currUlipUnit").html("Cr");
                    		}
                    	} 
                    	$("#currUlipAmt").html(amt.toFixed(2));
                    </script>
                    <br>                       
                    <div class="percentage" id="ulipPer">(<span class="percent_value"></span>%)</div>
                    <script>
                    
                    var perc = 0.0;
                    if(! ${ulipInsurance.allocatedAmount}<=0 && ! ${ulipInsurance.insuranceCoverAmount}<=0)
                    {
                      perc=${ulipInsurance.allocatedAmount*100/ulipInsurance.insuranceCoverAmount};	
                    }
                    if(perc<100) {
                     $("#ulipPer").html("("+perc.toFixed(2)+"%)");
                    } else {
                     $("#ulipPer").html('(100%)');
                    }
                    </script>
                </div><!-- box-footer-right-side Ends-->
                                                
            </div><!-- box-footer Ends-->
            
        </div>
        
          </div>
          
          </div>
		
      <c:set var="isDataSaved" value=""></c:set>
      
      <%-- <c:if test="${ulipInsurance.size() eq 0 and moneyBackInsurance.size() eq 0 and endownmentInsurance.size() eq 0 and termInsurance.size() eq 0 and 
      criticalInsurance.size() eq 0 and healthInsurance.size() eq 0 and accidentsInsurance.size() eq 0 and assetInsurance.size() eq 0}">
      <c:set var="isDataSaved" value=""></c:set>
      </c:if>
       --%>
       <c:if test="${ulipInsurance.insuranceCoverAmount eq 0 and moneyBackInsurance.insuranceCoverAmount eq 0 and endownmentInsurance.insuranceCoverAmount eq 0 and termInsurance.insuranceCoverAmount eq 0 and 
       criticalInsurance.insuranceCoverAmount eq 0 and healthInsurance.insuranceCoverAmount eq 0  and accidentsInsurance.insuranceCoverAmount eq 0  and assetInsurance.insuranceCoverAmount eq 0}">
       <c:set var="isDataSaved" value="inactiveLink"></c:set>
       </c:if>
        </section>
        
        <!-- Common_in_contnet ends-->
        
        <div class="overlay"></div>
        <div id="page_loader" ></div>
      </section>
      <section class="common_footer_actions">
			<div id="main_actions" class="clearfix">
				<ul class="reset clearfix fr btn_grup3">
					<%-- <li class="fl list"><a href="#" class="anch save inactiveLink" ><span class="txt">Save</span></a></li>
					<li class="fl list"><a href="#" onclick="checkData('${pageContext.request.contextPath}/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName")%>/2');" class="anch cancel"><span class="txt">Cancel</span></a></li>
					<li class="fl list"><a href="${pageContext.request.contextPath}${nextPageUrl}" class="anch skip"><span class="txt">Skip</span></a></li> --%>
				</ul>
				<ul class="reset clearfix fr btn_grup2">
					<li class="fl list"><a href="#" onclick="uploadNote(${partyId},'/insurance/showInsuranceSummary/generalInsurance/${partyId}');" class="anch add_note"><span class="txt">Notes</span></a></li>					
					<li class="fl list"><a href="#" onclick="uploadDocument(${partyId},'/insurance/showInsuranceSummary/generalInsurance/${partyId}');" class="anch add_doc"><span class="txt">Documents</span></a></li>
				</ul>
				<ul class="reset clearfix fl btn_grup1">
					<li class="fl list ${isDataSaved}"><a href="#" onclick="checkData('${pageContext.request.contextPath}/partner/datacollection/risk-cover-analysis/${partyId}');" class="anch analysis cfsRiskCoverAnalysisLink"><span class="txt">Analysis</span></a></li>
					<li class="fl list ${isDataSaved}"><a href="#" onclick="checkData('${pageContext.request.contextPath}/partner/datacollection/suggestion/risk-cover/${partyId}');" class="anch suggeset cfsRiskCoverSuggesstionLink"><span class="txt">Suggestion</span></a></li>
					<li class="fl list ${isDataSaved}"><a href="#" onclick="checkData('${pageContext.request.contextPath}/actionplan/risk-cover-action-plan/${partyId}');" class="anch action_plan riskCoverActionPlanLink"><span class="txt">Action Plan</span></a></li>
				</ul>
			</div>
			<%-- <a href="#" onclick="checkData('${pageContext.request.contextPath}${previousPageUrl}');" class="back navgation"><span class="txt">Back</span></a>
			<a href="#" onclick="checkData('${pageContext.request.contextPath}${nextPageUrl}');" class="next navgation" ><span class="txt">Next</span></a> --%>
		</section>
      <!-- Common footer starts -->
      <%-- <section class="common_footer_actions">      	
        <div id="main_actions" class="clearfix">
        <ul class="reset clearfix fr btn_grup2">
          <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName")%>/2" class="anch cancel"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
        
      
      <!-- Common footer ends --> 
    </section> --%>
    <!-- Common_content Ends--> 
    
  </section>
  
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 

</body>
</html>
