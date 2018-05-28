<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
#confirmDialog {
	 display: block;
	 height: 130px;
	 display: none;
	 width: 355px;
	 box-shadow: 0 0 15px 1px #757575;
}

.aa_up {
	height: 70px;
	margin: 0;
	padding: 32px 21px 0px;
	width: auto;
	font-family: allerregular;
	font-size: 17px;
	font-weight: normal;
	color: #3a3a3a;
}

.contents .mutual-funds .icon-bg .icon {
	cursor: pointer;
}

.contents .stocks .icon-bg .icon {
	cursor: pointer;
}

.contents .bank-deposits .icon-bg .icon {
	cursor: pointer;
}

.contents .retirement-funds .icon-bg .icon {
	cursor: pointer;
}

.contents .gold .icon-bg .icon {
	cursor: pointer;
}

.contents .property .icon-bg .icon {
	cursor: pointer;
}

.contents .a-s-others .icon-bg .icon {
	cursor: pointer;
}
</style>
<script>
$(document).ready(function(){
	
	
    $('.asset_summary_scroll').slimScroll();

  	$('.view1  .icon-bg').click(function(){
 	 	if ( $('.view-options').css('visibility') == 'hidden' )
    		$('.view-options').css('visibility','visible');
  		else
    		$('.view-options').css('visibility','hidden');
	});
  	
  	$(".Asset_Con_Btn").click(function(){
  		
		/* $(".overlay").fadeIn();
		$("#Asset_Con").fadeIn(); */
	});
  	
  	$("#Asset_Con .close").click(function(){
  	    $(".overlay").fadeOut("slow");
  		$("#Asset_Con").fadeOut("slow");
  	});
  	
  	var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	// setter
	$("#dialog1").dialog("option", "buttons", [{
	   text: "Ok",
	   click: function () {
		   $(this).dialog('close');
	   }
	}]);
	$(document).on("dialogopen", "#dialog1", function(event, ui) {
		setTimeout("$('#dialog1').dialog('close')",3000);
	});
  	
});

function goTo( assetPage ){
	window.location.href='${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0?assetPage='+assetPage;
}

function closeDialog(){
	$(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
}

function getGoals(assetTypeId, noOfGoals, assetName){
	var goalCount = noOfGoals;
	
	if( goalCount == '0' ){
		alertMessage("There are No Goals Under "+assetName+".");
	}
	else {
		var assetId = assetTypeId;
		var partyId = ${partyId};
		$.ajax({
		    url: "${pageContext.request.contextPath}/assets/getGoalsAllocatedToAsset",
		    type: "GET",
		    dataType: "json",
		    data: {'assetTypeId': assetId,'partyId' : partyId},
		    success: function( data ) {
		    	$("div#Asset_Con").html("");
		    	showGoals(data);
		    	$(".overlay").fadeIn();
		  		$("#Asset_Con").fadeIn();
		    },
		    error: function (error) {
		       alert('error: ' + error);
		    }
		 });	
	}
}

function showGoals(data){
	
	var innerHTMML="";
	innerHTMML='<span class="close" onClick="doClose();">X</span>';
	$(data).each(function(index,element){
		innerHTMML=innerHTMML+'<div class="goal_bx fl"><div class="title">'+element.goalName+'</div>';
		innerHTMML=innerHTMML+'<div class="top clearfix">';
		innerHTMML=innerHTMML+'<div class="top_left fl">';
		innerHTMML=innerHTMML+'<div class="top">';
		innerHTMML=innerHTMML+'<div class="label">Allocated %</div>';
		innerHTMML=innerHTMML+'</div>';
		innerHTMML=innerHTMML+'<div class="bottom">';
		innerHTMML=innerHTMML+'<div class="label">Asset Value</div>';
		innerHTMML=innerHTMML+'</div>';
		innerHTMML=innerHTMML+'</div>';
		innerHTMML=innerHTMML+'<div class="top_right fr">';
		innerHTMML=innerHTMML+'<div class="top">';
		innerHTMML=innerHTMML+'<div class="label">'+element.goalPercent+'</div>';
		innerHTMML=innerHTMML+'</div>';
		innerHTMML=innerHTMML+'<div class="bottom">';
		innerHTMML=innerHTMML+'<div class="label"> <span class="WebRupee">Rs.</span>'+element.assetPv+' lacs</div>';
		innerHTMML=innerHTMML+'</div>';
		innerHTMML=innerHTMML+'</div>';
		innerHTMML=innerHTMML+'<div class="icon_bg">';
		if( element.goalTypeId == "35001" ){
			innerHTMML=innerHTMML+'<div class="edu_g_icon"></div>';
		}else if( element.goalTypeId == "35003" ){
			innerHTMML=innerHTMML+'<div class="pro_g_icon"></div>';
		}else if( element.goalTypeId == "35004" ){
			innerHTMML=innerHTMML+'<div class="wed_g_icon"></div>';
		}else if( element.goalTypeId == "35005" ){
			innerHTMML=innerHTMML+'<div class="tra_g_icon"></div>';
		}else if( element.goalTypeId == "35006" ){
			innerHTMML=innerHTMML+'<div class="car_g_icon"></div>';
		}else if( element.goalTypeId == "35008" ){
			innerHTMML=innerHTMML+'<div class="spe_g_icon"></div>';
		}else if( element.goalTypeId == "35012" ){
			innerHTMML=innerHTMML+'<div class="bis_g_icon"></div>';
		}else if( element.goalTypeId == "35013" ){
			innerHTMML=innerHTMML+'<div class="othe_g_icon"></div>';
		}else if( element.goalTypeId == "35014" ){
			innerHTMML=innerHTMML+'<div class="emer_g_icon"></div>';
		}else if( element.goalTypeId == "35015" ){
			innerHTMML=innerHTMML+'<div class="retri_g_icon"></div>';
		}
		
		innerHTMML=innerHTMML+'<div class="yr">'+element.goalYear+'</div>';
		innerHTMML=innerHTMML+'</div>';
		innerHTMML=innerHTMML+'</div>';
		innerHTMML=innerHTMML+'</div>';
	});
	$("div#Asset_Con").append(innerHTMML);
}

function doClose(){
	$(".overlay").fadeOut("slow");
	$("#Asset_Con").fadeOut("slow");
}

function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}

</script>

<style>

.goal_bx { /*border:1px solid green; height:352px;*/ width:205px; margin:0 10px 35px 10px; }
.goal_bx .title{font: 12px/14px aller bold, sans-serif; color:#952754; text-align:center; margin-bottom:8px;}
/*Top box*/
.goal_bx .top { width:auto; position:relative /*height:71px; border: 1px solid #b3b3b3;*/ }

.goal_bx .top .top_left{ width:92px; height:89px; border-top-left-radius: 20px; border-bottom-left-radius: 20px; background-color:#a8a8a8; box-shadow: 0px 1px 5px 0px #020202;}

.goal_bx .top .top_left .top{ width: 80px; height: 46px; border-bottom: 1px dashed #000; margin: 0 auto; }

.goal_bx .top .top_left .top .label{ padding-top: 3px; text-align: left; font: 10px/44px "aller bold", sans-serif; color: #3a3a3e; text-indent: 3px;}

.goal_bx .top .top_left .bottom{ width: 80px;
height: 36px;
border: 0px;
margin: 0 auto; }

.goal_bx .top .top_left .bottom .label{ padding-top: 3px; text-align: left; font: 10px/30px "aller bold", sans-serif; color: #3a3a3e; text-indent: 3px;}

.goal_bx .top .top_right{ width:92px; height:89px; border-top-right-radius: 20px; border-bottom-right-radius: 20px; background-color:#952754; box-shadow: 0px 1px 5px 0px #020202;}

.goal_bx .top .top_right .top{ width: 80px; height: 46px; border-bottom: 1px dashed #fff; margin: 0 auto; }

.goal_bx .top .top_right .top .label{ padding-top: 3px; text-align: left; font: 18px/48px "aller bold", sans-serif; color: #fff; text-indent: 22px;}

.goal_bx .top .top_right .bottom{ width: 80px; height: 36px; border: 0px; margin: 0 auto; }

.goal_bx .top .top_right .bottom .label{font: 12px/28px aller bold, sans-serif; color:#fff; text-align:left; text-indent:8px;}
.goal_bx .top .icon_bg .yr{font: 10px/12px "aller bold", sans-serif; color: #fff; text-align:center;}

.goal_bx .top .icon_bg { width:55px; height:55px; background:#3a3a3e; position:absolute; top:10px; left:68px; border-radius: 40px; border: 4px solid #fff;}
/*Goal Icon*/
.goal_bx .top .icon_bg .car_g_icon { width:45px; height:38px; background:url(${pageContext.request.contextPath}/resources/images/a_to_g_sprite.png) no-repeat -144px -16px; }
.goal_bx .top .icon_bg .edu_g_icon { width:45px; height:38px; background:url(${pageContext.request.contextPath}/resources/images/a_to_g_sprite.png) no-repeat -203px -18px; }
.goal_bx .top .icon_bg .bis_g_icon { width:45px; height:38px; background:url(${pageContext.request.contextPath}/resources/images/a_to_g_sprite.png) no-repeat -259px -12px; }
.goal_bx .top .icon_bg .tra_g_icon { width:45px; height:38px; background:url(${pageContext.request.contextPath}/resources/images/a_to_g_sprite.png) no-repeat -317px -16px; }
.goal_bx .top .icon_bg .spe_g_icon { width:45px; height:38px; background:url(${pageContext.request.contextPath}/resources/images/a_to_g_sprite.png) no-repeat  -378px -19px; }
.goal_bx .top .icon_bg .othe_g_icon { width:45px; height:38px; background:url(${pageContext.request.contextPath}/resources/images/a_to_g_sprite.png) no-repeat -437px -19px; }
.goal_bx .top .icon_bg .wed_g_icon { width:45px; height:38px; background:url(${pageContext.request.contextPath}/resources/images/a_to_g_sprite.png) no-repeat -495px -15px; }
.goal_bx .top .icon_bg .pro_g_icon { width:45px; height:38px; background:url(${pageContext.request.contextPath}/resources/images/a_to_g_sprite.png) no-repeat -556px -13px; }
/*Goal Icon*/
.goal_bx .top .icon_bg .icon_notification { width: 22px; height: 22px; border: 1px solid #952754; color: #952754; border-radius: 20px; background-color: #fff; text-align: center; font-family: aller bold; line-height: 20px; font-size: 14px; position:absolute; top: 0; right: 0; }
.goal_bx .top .goal_title_bx { width:120px; height:70px; margin:8px auto 0 10px; }
.goal_bx .top .goal_title_bx .goal_title { width:120px; margin:0 auto; font: 12px/14px "aller bold", sans-serif; color:#3a3a3e; border-bottom:1px solid #999; padding-bottom: 5px; }
.goal_bx .top .goal_title_bx .label { font: 11px/18px "allerregular", sans-serif; color:#3a3a3e; }
.goal_bx .top .goal_title_bx .yr { font: 12px/18px "aller bold", sans-serif; color:#a7334f; margin-right: 10px; }
/*Top box*/
.common_custom_modal_asset {
    background: none repeat scroll 0 0 #FFFFFF;    display: none;    left: 0;    margin: auto;    position: absolute;
    right: 0;    top: 0px;    z-index: 1000;}
.common_custom_modal_asset .close {
    background: none repeat scroll 0 0 #000000;    border-radius: 22px;    color: #FFFFFF;    cursor: pointer;    display: block;    font-family: Arial,Helvetica,sans-serif;    font-size: 17px;    font-weight: 100;    height: 36px;    line-height: 36px;    position: absolute;    right: -20px;    text-align: center;    top: -18px;    width: 36px;}
#Asset_Con {overflow:visible; height: 390px; display:none; box-shadow: 0 0 15px 1px #757575; border:1px solid #8d203b; width:677px; height:290px; background-color:#fff; margin: 0 auto; padding:10px;}

</style>

<!-- Wrapper starts-->
<div class="" id="edit-profile-info-tab"> 
  <!-- Main starts-->
  
  <section class="main">     
    <!--content Starts-->
   <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
    <div class="contents">        
    <input type="hidden" id="partyId" name="partyId" value="${partyId}" />
    <a class="fr common_back_btn eastspace2" href="${pageContext.request.contextPath}/partner/datacollection/${partyId}/${headerName}/1" style="margin: -17px 13px -5px 0px !important;">Back</a>
    <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
     <div class="asset_summary_scroll">       
     <c:set var="pieces" value="${fn:split(mutualFunds,'_')}"/> 
    <div class="mutual-funds fl clearfix">
        	<div class="header"><p>Mutual Funds</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><div class="icon-funds" onclick="goTo('3');"></div></div><!-- icon-bg Ends-->
                <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                     <a href="javascript:void(0)" class="goal-no fl Asset_Con_Btn" onclick="getGoals('72004',${pieces[2]}, 'Mutual Fund')"><p>${pieces[2]}</p></a>
                </div><!-- linked-goals Ends-->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av fl">Current Asset Value</p>
                    <p class="aa fr">Allocated Amount</p>
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl">
                    
                    <c:set var="amt" value="${0.0}"/>
     				<c:set var="unit" value="Lac"/>
     				
                    <c:if test="${pieces[0] gt 0.0}">
                    		<c:set var="amt" value="${pieces[0]}"/>
                    		<c:set var="amt" value="${amt/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
                    		
                    </c:if>
                    <c:if test="${pieces[0] eq 0.0 or pieces[0] lt 0.0 }">
                        <c:if test="${not empty MFAmount}">
			            <c:set var="amt" value="${MFAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
	               		</c:if>
                    
                    </c:if>
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></div>
                    <div class="unit fl">${unit}</div>		
	                
                </div><!-- box-footer-left-side Ends-->
                <div class="devider fl"></div>
                <div class="box-footer-right-side fr centerAll">
                	<span class="rupee-sign fl"></span>
                    <span class="amount fl">
                    
                    <c:set var="amt" value="${pieces[1]/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
                    
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></span>
                    <span class="unit fl">${unit}</span>
                    <br>   
                    <c:choose>
                    	<c:when test="${not (pieces[0] eq '0.0')}">
                    		<c:set var="percentage" value="${(pieces[1] / pieces[0])}"/>
                    		<fmt:formatNumber var="percentage" type="number" pattern="0.00" maxFractionDigits="2" value="${percentage}"/>                    		
                    		<c:set var="percentage" value="${percentage * 100.00}"/>
                    	</c:when>
                    	<c:otherwise>
                    		<c:set var="percentage" value="0"/>
                    	</c:otherwise>
                    </c:choose>
                    <c:if test="${percentage>100}"><c:set var="percentage" value="${100.00}"/></c:if>                                        
                    <div class="percentage">(<span class="percent_value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${percentage}"/></span>%)</div>
                </div><!-- box-footer-right-side Ends-->
                                                
            </div><!-- box-footer Ends-->
            
        </div><!-- Mutual Funds Ends-->
        <c:set var="pieces" value="${fn:split(shares,'_')}"/>
    	<div class="mutual-funds fl clearfix">
        	<div class="header"><p>Shares</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><div class="icon-stock" onclick="goTo('6');"></div></div><!-- icon-bg Ends-->
                <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <a href="javascript:void(0)" onclick="getGoals('72001',${pieces[2]},'Shares');" class="goal-no fl Asset_Con_Btn"><p>${pieces[2]}</p></a>
                </div><!-- linked-goals Ends-->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av fl">Current Asset Value</p>
                    <p class="aa fr">Allocated Amount</p>
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl">
                    
                    <c:set var="amt" value="${0.0}"/>
     				<c:set var="unit" value="Lac"/>
     				
                    <c:if test="${pieces[0] gt 0.0}">
                    		<c:set var="amt" value="${pieces[0]}"/>
                    		<c:set var="amt" value="${amt/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
                    		
                    </c:if>
                    <c:if test="${pieces[0] eq 0.0 or pieces[0] lt 0.0 }">
                        <c:if test="${not empty SharesAmount}">
			            <c:set var="amt" value="${SharesAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
	               		</c:if>
                    
                    </c:if>
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></div>
                    <div class="unit fl">${unit}</div>
                    
                </div><!-- box-footer-left-side Ends-->
                <div class="devider fl"></div>
                <div class="box-footer-right-side fr centerAll">
                	<span class="rupee-sign fl"></span>
                	
                    <span class="amount fl">
                    
                    <c:set var="amt" value="${pieces[1]/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if> 
                    
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></span>
                    <span class="unit fl">${unit}</span>
                    <br>                       
                    <c:choose>
                    	<c:when test="${not(pieces[0] eq '0.0')}">
                    		<c:set var="percentage" value="${(pieces[1] / pieces[0])}"/>
                    		<fmt:formatNumber var="percentage" type="number" pattern="0.00" maxFractionDigits="2" value="${percentage}"/>                    		
                    		<c:set var="percentage" value="${percentage * 100.00}"/>
                    	</c:when>
                    	<c:otherwise>
                    		<c:set var="percentage" value="0"/>
                    	</c:otherwise>
                    </c:choose>
                    <c:if test="${percentage>100}"><c:set var="percentage" value="${100.00}"/></c:if>
                    <div class="percentage">(<span class="percent_value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${percentage}"/></span>%)</div>
                </div><!-- box-footer-right-side Ends-->
                                                
            </div><!-- box-footer Ends-->
            
        </div><!-- Shares Ends--> 
        <c:set var="pieces" value="${fn:split(deposits,'_')}"/>
        <div class="mutual-funds fl clearfix">
        	<div class="header"><p>Deposits</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><div class="icon-deposit" onclick="goTo('1');"></div></div><!-- icon-bg Ends-->
                <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <a href="javascript:void(0)" onclick="getGoals('72003',${pieces[2]},'Deposits');" class="goal-no fl Asset_Con_Btn"><p>${pieces[2]}</p></a>
                </div><!-- linked-goals Ends-->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av fl">Current Asset Value</p>
                    <p class="aa fr">Allocated Amount</p>
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl">
                    
                    <c:set var="amt" value="${0.0}"/>
     				<c:set var="unit" value="Lac"/>
     				
                    <c:if test="${pieces[0] gt 0.0}">
                    		<c:set var="amt" value="${pieces[0]}"/>
                    		<c:set var="amt" value="${amt/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
                    		
                    </c:if>
                    <c:if test="${pieces[0] eq 0.0 or pieces[0] lt 0.0 }">
                        <c:if test="${not empty DepositsAmount}">
			            <c:set var="amt" value="${DepositsAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
	               		</c:if>
                    
                    </c:if>
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></div>
                    <div class="unit fl">${unit}</div>
                </div><!-- box-footer-left-side Ends-->
                <div class="devider fl"></div>
                <div class="box-footer-right-side fr centerAll">
					    <span class="rupee-sign fl"></span>
                        <span class="amount fl">
                        
                        <c:set var="amt" value="${pieces[1]/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if> 
                    
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></span>
                    <span class="unit fl">${unit}</span>
                     	<br>                       
                        <c:choose>
                    	<c:when test="${not (pieces[0] eq '0.0')}">
                    		<c:set var="percentage" value="${(pieces[1] / pieces[0])}"/>
                    		<fmt:formatNumber var="percentage" type="number" pattern="0.00" maxFractionDigits="2" value="${percentage}"/>                    		
                    		<c:set var="percentage" value="${percentage * 100.00}"/>
                    	</c:when>
                    	<c:otherwise>
                    		<c:set var="percentage" value="0"/>
                    	</c:otherwise>
                    </c:choose>
                    <c:if test="${percentage>100}"><c:set var="percentage" value="${100.00}"/></c:if>
                    <div class="percentage">(<span class="percent_value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${percentage}"/></span>%)</div>
                </div><!-- box-footer-right-side Ends-->
                                                
            </div><!-- box-footer Ends-->
            
        </div><!-- bank-deposits Ends--> 
        <c:set var="pieces" value="${fn:split(retirement,'_')}"/>
        <div class="mutual-funds fl clearfix">
        	<div class="header"><p>Retirement Funds</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><div class="icon-retirement" onclick="goTo('2');"></div></div><!-- icon-bg Ends-->
                <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <a href="javascript:void(0)" onclick="getGoals('72008',${pieces[2]},'Retirement Funds');" class="goal-no fl Asset_Con_Btn"><p>${pieces[2]}</p></a>
                </div><!-- linked-goals Ends-->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av fl">Current Asset Value</p>
                    <p class="aa fr">Allocated Amount</p>
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl">
                    
                    <c:set var="amt" value="${0.0}"/>
     				<c:set var="unit" value="Lac"/>
     				
                    <c:if test="${pieces[0] gt 0.0}">
                    		<c:set var="amt" value="${pieces[0]}"/>
                    		<c:set var="amt" value="${amt/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
                    		
                    </c:if>
                    <c:if test="${pieces[0] eq 0.0 or pieces[0] lt 0.0 }">
                        <c:if test="${not empty RetirementAmount}">
			            <c:set var="amt" value="${RetirementAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
	               		</c:if>
                    
                    </c:if>
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></div>
                    <div class="unit fl">${unit}</div>
                </div><!-- box-footer-left-side Ends-->
                <div class="devider fl"></div>
                <div class="box-footer-right-side fr centerAll">
                	<span class="rupee-sign fl"></span>
                    <span class="amount fl">
                    
                    <c:set var="amt" value="${pieces[1]/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if> 
                    
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></span>
                    <span class="unit fl">${unit}</span>
                    <br>                       
                    <c:choose>
                    	<c:when test="${not (pieces[0] eq '0.0')}">
                    		<c:set var="percentage" value="${(pieces[1] / pieces[0])}"/>
                    		<fmt:formatNumber var="percentage" type="number" pattern="0.00" maxFractionDigits="2" value="${percentage}"/>                    		
                    		<c:set var="percentage" value="${percentage * 100.00}"/>
                    	</c:when>
                    	<c:otherwise>
                    		<c:set var="percentage" value="0"/>
                    	</c:otherwise>
                    </c:choose>
                    <c:if test="${percentage>100}"><c:set var="percentage" value="${100.00}"/></c:if>
                    <div class="percentage">(<span class="percent_value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${percentage}"/></span>%)</div>
                </div><!-- box-footer-right-side Ends-->
                                                
            </div><!-- box-footer Ends-->
            
        </div><!-- Retirement Funds Ends-->
       <c:set var="pieces" value="${fn:split(gold,'_')}"/>
        <div class="mutual-funds fl clearfix">
        	<div class="header"><p>Gold</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><div class="icon-gold" onclick="goTo('4');"></div></div><!-- icon-bg Ends-->
                <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <a href="javascript:void(0)" onclick="getGoals('72006',${pieces[2]},'Gold');" class="goal-no fl Asset_Con_Btn"><p>${pieces[2]}</p></a>
                </div><!-- linked-goals Ends-->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av fl">Current Asset Value</p>
                    <p class="aa fr">Allocated Amount</p>
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl">
                    
                    <c:set var="amt" value="${0.0}"/>
     				<c:set var="unit" value="Lac"/>
     				
                    <c:if test="${pieces[0] gt 0.0}">
                    		<c:set var="amt" value="${pieces[0]}"/>
                    		<c:set var="amt" value="${amt/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
                    		
                    </c:if>
                    <c:if test="${pieces[0] eq 0.0 or pieces[0] lt 0.0 }">
                        <c:if test="${not empty GoldAmount}">
			            <c:set var="amt" value="${GoldAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
	               		</c:if>
                    
                    </c:if>
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></div>
                    <div class="unit fl">${unit}</div>
                    
                </div><!-- box-footer-left-side Ends-->
                <div class="devider fl"></div>
                <div class="box-footer-right-side fr centerAll">
                	<span class="rupee-sign fl"></span>
                    <span class="amount fl">
                    
                     <c:set var="amt" value="${pieces[1]/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if> 
                    
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></span>
                    <span class="unit fl">${unit}</span>
                    
                    <br>                       
                    <c:choose>
                    	<c:when test="${not (pieces[0] eq '0.0')}">
                    		<c:set var="percentage" value="${(pieces[1] / pieces[0])}"/>
                    		<fmt:formatNumber var="percentage" type="number" pattern="0.00" maxFractionDigits="2" value="${percentage}"/>                    		
                    		<c:set var="percentage" value="${percentage * 100.00}"/>
                    	</c:when>
                    	<c:otherwise>
                    		<c:set var="percentage" value="0"/>
                    	</c:otherwise>
                    </c:choose>
                    <c:if test="${percentage>100}"><c:set var="percentage" value="${100.00}"/></c:if>
                    <div class="percentage">(<span class="percent_value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${percentage}"/></span>%)</div>
                </div><!-- box-footer-right-side Ends-->
                                                
            </div><!-- box-footer Ends-->
            
        </div><!-- Gold Ends-->
        <c:set var="pieces" value="${fn:split(property,'_')}"/>
        <div class="mutual-funds fl clearfix">
        	<div class="header"><p>Property</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><div class="icon-property" onclick="goTo('5');"></div></div><!-- icon-bg Ends-->
                <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <a href="javascript:void(0)" onclick="getGoals('72002',${pieces[2]},'Property');" class="goal-no fl Asset_Con_Btn"><p>${pieces[2]}</p></a>
                </div><!-- linked-goals Ends-->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av fl">Current Asset Value</p>
                    <p class="aa fr">Allocated Amount</p>
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl">
                    
                    <c:set var="amt" value="${0.0}"/>
     				<c:set var="unit" value="Lac"/>
     				
                    <c:if test="${pieces[0] gt 0.0}">
                    		<c:set var="amt" value="${pieces[0]}"/>
                    		<c:set var="amt" value="${amt/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
                    		
                    </c:if>
                    <c:if test="${pieces[0] eq 0.0 or pieces[0] lt 0.0 }">
                        <c:if test="${not empty PropertyAmount}">
			            <c:set var="amt" value="${PropertyAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
	               		</c:if>
                    
                    </c:if>
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></div>
                    <div class="unit fl">${unit}</div>
                </div><!-- box-footer-left-side Ends-->
                <div class="devider fl"></div>
                <div class="box-footer-right-side fr centerAll">
                	<span class="rupee-sign fl"></span>
                    <span class="amount fl">
                    <c:set var="amt" value="${pieces[1]/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if> 
                    
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></span>
                    <span class="unit fl">${unit}</span>
                    <br>                       
                    <c:choose>
                    	<c:when test="${not (pieces[0] eq '0.0')}">
                    		<c:set var="percentage" value="${(pieces[1] / pieces[0])}"/>
                    		<fmt:formatNumber var="percentage" type="number" pattern="0.00" maxFractionDigits="2" value="${percentage}"/>                    		
                    		<c:set var="percentage" value="${percentage * 100.00}"/>
                    	</c:when>
                    	<c:otherwise>
                    		<c:set var="percentage" value="0"/>
                    	</c:otherwise>
                    </c:choose>
                    <c:if test="${percentage>100}"><c:set var="percentage" value="${100.00}"/></c:if>
                    <div class="percentage">(<span class="percent_value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${percentage}"/></span>%)</div>
                </div><!-- box-footer-right-side Ends-->
                                                
            </div><!-- box-footer Ends-->
            
        </div><!-- Property Ends-->
           
         <c:set var="pieces" value="${fn:split(other,'_')}"/>
        <div class="mutual-funds fl clearfix">
        	<div class="header"><p>Others</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl"><div class="icon-other" onclick="goTo('7');"></div></div><!-- icon-bg Ends-->
                <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <a href="javascript:void(0)" onclick="getGoals('72007',${pieces[2]},'Others');" class="goal-no fl Asset_Con_Btn"><p>${pieces[2]}</p></a>
                </div><!-- linked-goals Ends-->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av fl">Current Asset Value</p>
                    <p class="aa fr">Allocated Amount</p>
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl">
                    
                    <c:set var="amt" value="${0.0}"/>
     				<c:set var="unit" value="Lac"/>
     				
                    <c:if test="${pieces[0] gt 0.0}">
                    		<c:set var="amt" value="${pieces[0]}"/>
                    		<c:set var="amt" value="${amt/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
                    		
                    </c:if>
                    <c:if test="${pieces[0] eq 0.0 or pieces[0] lt 0.0 }">
                        <c:if test="${not empty OtherAmount}">
			            <c:set var="amt" value="${OtherAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
	               		</c:if>
                    
                    </c:if>
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></div>
                    <div class="unit fl">${unit}</div>
                </div><!-- box-footer-left-side Ends-->
                <div class="devider fl"></div>
                <div class="box-footer-right-side fr centerAll">
                	<span class="rupee-sign fl"></span>
                    <span class="amount fl">
                    
                    <c:set var="amt" value="${pieces[1]/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if> 
                    
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></span>
                    <span class="unit fl">${unit}</span>
                    <br>                       
                    <c:choose>
                    	<c:when test="${not (pieces[0] eq '0.0')}">
                    		<c:set var="percentage" value="${(pieces[1] / pieces[0])}"/>
                    		<fmt:formatNumber var="percentage" type="number" pattern="0.00" maxFractionDigits="2" value="${percentage}"/>                    		
                    		<c:set var="percentage" value="${percentage * 100.00}"/>
                    	</c:when>
                    	<c:otherwise>
                    		<c:set var="percentage" value="0"/>
                    	</c:otherwise>
                    </c:choose>
                    <c:if test="${percentage>100}"><c:set var="percentage" value="${100.00}"/></c:if>
                    <div class="percentage">(<span class="percent_value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${percentage}"/></span>%)</div>
                </div><!-- box-footer-right-side Ends-->
                                                
            </div><!-- box-footer Ends-->
            
        </div><!-- Gold Ends-->
           
         <c:set var="pieces" value="${fn:split(insurance,'_')}"/>
        <div class="mutual-funds fl clearfix">
        	<div class="header"><p>Insurance</p></div><!-- header Ends-->
            <div class="upper-part">
                <div class="icon-bg fl" style="cursor:default;"><div class="icon-insurance" style="cursor:default;"></div></div><!-- icon-bg Ends-->
                <div class="linked-goals fr">
                    <p># of Linked Goals</p>
                    <a href="javascript:void(0)" onclick="getGoals('72009',${pieces[2]},'Insurance');" class="goal-no fl Asset_Con_Btn"><p>${pieces[2]}</p></a>
                </div><!-- linked-goals Ends-->
                <!-- <a class="ins-lk" href="">Edit Insurance Details</a> -->
            </div><!-- upper-part Ends-->
            
            <div class="box-footer fl">
            	<div class="box-footer-header">
                	<p class="av fl">Current Asset Value</p>
                    <p class="aa fr">Allocated Amount</p>
                </div><!-- box-footer-header Ends-->
                
                <div class="box-footer-left-side fl">
                	<div class="rupee-sign fl"></div>
                    <div class="amount fl">
                    
                    <c:set var="amt" value="${0.0}"/>
     				<c:set var="unit" value="Lac"/>
     				
                    <c:if test="${pieces[0] gt 0.0}">
                    		<c:set var="amt" value="${pieces[0]}"/>
                    		<c:set var="amt" value="${amt/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
                    		
                    </c:if>
                    <c:if test="${pieces[0] eq 0.0 or pieces[0] lt 0.0 }">
                        <c:if test="${not empty LifeInsuranceAmount}">
			            <c:set var="amt" value="${LifeInsuranceAmount/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100 }">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if>
	               		</c:if>
                    
                    </c:if>
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></div>
                    <div class="unit fl">${unit}</div>
                    
                    
                    
                </div><!-- box-footer-left-side Ends-->
                <div class="devider fl"></div>
                <div class="box-footer-right-side fr centerAll">
                	<span class="rupee-sign fl"></span>
                    <span class="amount fl">
                    
                   <c:set var="amt" value="${pieces[1]/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if> 
                    
                    <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></span>
                    <span class="unit fl">${unit}</span>
                    
                    <br>                       
                    <c:choose>
                    	<c:when test="${not (pieces[0] eq '0.0')}">
                    		<c:set var="percentage" value="${(pieces[1] / pieces[0])}"/>
                    		<fmt:formatNumber var="percentage" type="number" pattern="0.00" maxFractionDigits="2" value="${percentage}"/>                    		
                    		<c:set var="percentage" value="${percentage * 100.00}"/>
                    	</c:when>
                    	<c:otherwise>
                    		<c:set var="percentage" value="0"/>
                    	</c:otherwise>
                    </c:choose>
                    <c:if test="${percentage>100}"><c:set var="percentage" value="${100.00}"/></c:if>
                    <div class="percentage">(<span class="percent_value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${percentage}"/></span>%)</div>
                </div><!-- box-footer-right-side Ends-->
                                                
            </div><!-- box-footer Ends-->
            
        </div><!-- Retirement Funds Ends-->
        
    </div><!-- content Ends--> 
    	  <div id="Asset_Con" class="common_custom_modal_asset">
          </div>
      
        
    	  </div>
        
    <div class="asset-summary-footer fl">
    
    	<a href="${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0" class="asset-management fl">
        	<div class="title">Asset Details</div>
            <div class="icon-bg"><div class="icon fl"></div></div>  
            <div class="icon-reflection"></div>       
        </a><!-- asset-management Ends-->
        
        <a href="${pageContext.request.contextPath}/assets/assetAllocatedToGoal/${partyId}" class="goal-allocation fl">
        	<div class="title">Asset Allocation to Goal</div>
            <div class="icon-bg"><div class="icon fl"></div></div>  
            <div class="icon-reflection"></div>       
        </a><!-- goal-allocation Ends-->

        <div class="view1 fl" style="display: none;">
        	<div class="title">View</div>
            <div class="icon-bg"><div class="icon fl"></div></div>  
            <div class="icon-reflection"></div>       
        </div><!-- view Ends-->
        
        <div class="view-options fl">
        	<div class="view-bg">
            	<ul>
                	<li>Goals</li>
                    <li>Unused Assets</li>
                    <li>Future Cashflow</li>
                </ul>
            </div>
        </div><!-- view-options Ends-->
        
        <div class="total fl">
        	<div class="total-asset-value">
            	<p>Total Asset Value</p>
            	<div class="rupee-sign fl"></div>
            	
            	<c:set var="amt" value="${(totalAssetValue+totalValueOfBasic)/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if> 
                    
                <div class="amount fl"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></div>
                <div class="unit fl">${unit}</div>
            </div>
            <div class="total-allocated-value">
            	<p>Total Allocated Value</p>
            	<div class="rupee-sign fl" style="margin-left: 45px;"></div>
                <div class="amount fl">
                
                <c:set var="amt" value="${totalAllocatedValue/1000}"/>
			            		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="K"/>
	                    		</c:if> 
	                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    		<c:set var="amt" value="${amt/100}"/>
		                    		<c:if test="${amt lt 100}">
		                    			<c:set var="unit" value="Lac"/>
		                    		</c:if>
		                    		<c:if test="${amt gt 100 or amt eq 100}">
		                    			<c:set var="amt" value="${amt/100}"/>
		                    			<c:set var="unit" value="Cr"/>
		                    		</c:if>
	                    		</c:if> 
                <fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${amt}"/></div>
                <div class="unit fl">${unit}</div>
                
                <c:choose>
                    	<c:when test="${not (totalAssetValue eq '0.0')}">
                    		<c:set var="percentage" value="${(totalAllocatedValue / totalAssetValue)}"/>
                    		<fmt:formatNumber var="percentage" type="number" pattern="0.00" maxFractionDigits="2" value="${percentage}"/>                    		
                    		<c:set var="percentage" value="${percentage * 100.00}"/>
                    	</c:when>
                    	<c:otherwise>
                    		<c:set var="percentage" value="0"/>
                    	</c:otherwise>
                    </c:choose>
                    <c:if test="${percentage>100}"><c:set var="percentage" value="${100.00}"/></c:if>
                <div class="total_percentage fl">(<span class="total_percent_value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${percentage}"/></span>%)</div>
            </div>
        </div><!-- tota Ends-->
        <div class="footer-platform"></div>
          	
    </div> <!-- asset-summary-footer Ends-->
    
    </section>
      <div class="overlay" style="display: none;"></div>
  </section>
  <!-- Main ends--> 
  <!-- Wrapper ends-->
	<div id="confirmDialog" class="common_custom_modal_aa">
  				<span class="close" onclick="closeDialog()">X</span>
  				<div class="modal_content"> 
    				<div class="aa_up">
        				There are no Goals Under</div>
  				</div>
			</div>
</body>
</html>
