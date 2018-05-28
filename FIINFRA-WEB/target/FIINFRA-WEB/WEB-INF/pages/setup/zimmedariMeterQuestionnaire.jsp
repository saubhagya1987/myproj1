<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Zimmedari Meter Questionaire</title>
        <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
        <script src="<%=request.getContextPath()%>/js/holder.js"></script>
        <script src="<%=request.getContextPath()%>/js/common.js"></script>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/main.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/zebra_dialog.css" type="text/css">
        <!-- -responsive css-->
        <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/partner_setup.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/partner.css" rel="stylesheet">
        <!-- -responsive css-->
        <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
        <link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />

		<script src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
		
		<script src="<%=request.getContextPath()%>/js/common.js"></script>

        <script src="<%=request.getContextPath()%>/js/jquery.bxslider.js"></script>

        <link href="<%=request.getContextPath()%>/css/custom2.css" rel="stylesheet">
        
        <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>	
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.caret.js"></script>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/zebra_dialog.css" type="text/css"/>
         <link href="<%=request.getContextPath()%>/css/${sessionScope.userSession.themeName}.css" rel="stylesheet">
        <style>
        	.smallFont{
        		font-size: 10px;
        	}
        	.inactiveLink{ pointer-events: none; opacity: 0.4;}
        	#page_loader { background: transparent url(${pageContext.request.contextPath}/images/diy/loader.gif) no-repeat center center; }
        	#page_loader { margin-left: 9%; }
        </style>
        
    </head>
    <body>
    <jsp:include page="../common/common_popup.jsp" />    
    <form action="${pageContext.request.contextPath}/businessHealthIndex/saveZimmedariMeterQuestionnaire" id="questionForm" method="post">
    	<input type="hidden" name="qBankId" value="${qBankId}"/>
    	<input type="hidden" name="answerList" id="answerList" value=""/>    
        <section>
            <div class="container">
                <div class="container-head">
                    <div class="col-md-12 text-right">
                        <span class="pull-left">Partner Setup </span>
                        <a style="top: -7px;position: relative;" onclick="redirectToPanel1('termsofuse')"><input class="dbtn" value="Back" title="Back" type="button"></a>
                        <a style="top: -8px;position: relative;"><input id="cancel" title="Next" class="btn dbtn" type="button" value="Next" onclick="redirectToPanel1('businessvaluation')"></a>
                    </div>
                </div>
				<div id="page_loader"></div>
                <div class="container-body">
                    <!-- center -->
                    <div role="navigation" class="col-md-3 sidebar-offcanvas" style="margin-top:10px; padding-left:10px;">
                        <div class="list-group">
			        		<a class="list-group-item active" >Partner Setup</a>
			                <a href="<%=request.getContextPath()%>/setup.htm" class="list-group-item" id="termsofuse">Terms Of Use</a>
			                <a   onclick="redirectToPanel1(id)" class="list-group-item" id="zimmedariMeter">Zimmedari Meter</a>
			                <a   onclick="redirectToPanel1(id)" class="list-group-item" id="businessvaluation">Business Valuation</a>
			              	<a  onclick="redirectToPanel1(id)" class="list-group-item" id="masterasuumption">Master Assumptions</a>  	
			                <a class="list-group-item"  onclick="redirectToPanel1(id)" id="productrecommendations">Product Recommendation</a>
			                <a class="list-group-item"  onclick="redirectToPanel1(id)" id="notifications">Notifications</a>
			                
			                 <c:choose>
			        		<c:when test="${sessionScope.userSession.successfulLoginCount eq 0}">
			<%--         			<a class="list-group-item" href="<%=request.getContextPath()%>/partner/agree.htm" id="notifications">Agree</a> --%>
			<%--                 	<a class="list-group-item" href="<%=request.getContextPath()%>/partner/disagree.htm" id="notifications">Don't Agree</a> --%>
			        		</c:when>
			        		<c:otherwise>
			        			 <a class="list-group-item" href="<%=request.getContextPath()%>/index.htm" id="homelink">Home</a>
			        		</c:otherwise>
			        		</c:choose>
			               
			                
			              
			            </div>
                    </div>
                    <%-- <jsp:include page="sidebar_setup.jsp"></jsp:include> --%>
                    
                    <c:set var="tempQuestionId">0</c:set>
                    <c:set var="tempOptionCount">0</c:set>
                    <c:set var="questionsCount">0</c:set>
                    <c:set var="dependentQuestionFlag">0</c:set>

                    <div class="col-md-9" style="margin-top:10px; padding-left:10px;">
                        <div class="list-group" id="zq_main">
                            <a href="" class="list-group-item active">Zimmedari Meter Questionaire</a>
                            <div class="list-group-item" id="biz-panels">
                                <div class="panel panel-default clearfix" id="pnl-questions">
                                    <div class="panel-body clearfix">
                                        <ul id="zq_main_bx_slider" class="clearfix">
                                        <c:forEach items="${businessHealthIndexList}" var="questions" varStatus="counter">
                                        	<c:choose>
                                        		<c:when test="${not(tempQuestionId eq questions.questionId)}">
                                        			<c:if test="${counter.index gt 0}">
                                        						<div class="col-lg-2"></div>
			                                                    </div>
			                                                </div>
                                        				</li>
                                        			</c:if>
                                        			<li>
		                                                <div class="row row1">
		                                                    <div class="row clearfix text-center col-lg-12 qusetion_${questions.questionId}">
		                                                        ${questions.questionText}
		                                                    </div>
		                                                </div>
		                                                <div class="row row2">
	                                                    <div class="content">                                                        
	                                                    <br/><br/>
                                                    	<div class="row clearfix">
	                                                    <div class="col-lg-4"></div>
	                                                    <div class="col-lg-3">
	                                                        <div class="c_box">
	                                                            <c:choose>
	                                                        		<c:when test="${(questions.questionId eq '558') or (questions.questionId eq '551') or (questions.questionId eq '554')}">	                                                        		
	                                                        			<c:choose>
	                                                        				<c:when test="${questions.optionChecked  eq 1}">
	                                                        					<c:set var="dependentQuestionFlag">1</c:set>
	                                                        					<span class="common_custom_checkbox white_checkbox_checked ans_${questions.questionId} enableNextQuestion"></span>
	                                                        					<input type="checkbox" id="${questions.questionId}_${questions.questionOptionID}" class="default_checkbox answer" checked="checked"/>
	                                                        				</c:when>
	                                                        				<c:otherwise>
	                                                        					<c:set var="dependentQuestionFlag">0</c:set>
	                                                        					<span class="common_custom_checkbox ans_${questions.questionId} enableNextQuestion"></span>
	                                                        					<input type="checkbox" id="${questions.questionId}_${questions.questionOptionID}" class="default_checkbox answer"/>
	                                                        				</c:otherwise>	                                                        				
	                                                        			</c:choose>	                                                        			
	                                                        		</c:when>
	                                                        		<c:when test="${((questions.questionId eq '559') or (questions.questionId eq '552') or (questions.questionId eq '555')) and (dependentQuestionFlag eq 0)}">	                                                        		
	                                                        			<span class="common_custom_checkbox ans_${questions.questionId} inactiveLink"></span>
	                                                        			<input type="checkbox" id="${questions.questionId}_${questions.questionOptionID}" class="default_checkbox answer"/>
	                                                        		</c:when>
	                                                        		<c:otherwise>
	                                                        			<c:choose>
	                                                        				<c:when test="${questions.optionChecked eq 1}">
	                                                        					<span class="common_custom_checkbox white_checkbox_checked ans_${questions.questionId}"></span>
	                                                        					<input type="checkbox" id="${questions.questionId}_${questions.questionOptionID}" class="default_checkbox answer" checked="checked"/>
	                                                        				</c:when>
	                                                        				<c:otherwise>
	                                                        					<span class="common_custom_checkbox ans_${questions.questionId}"></span>
	                                                        					<input type="checkbox" id="${questions.questionId}_${questions.questionOptionID}" class="default_checkbox answer"/>
	                                                        				</c:otherwise>
	                                                        			</c:choose>	                                                        			
	                                                        		</c:otherwise>
                                                        		</c:choose> 	                                                            
	                                                        </div> 	           
	                                                        <c:choose>
	                                                        	<c:when test="${questions.questionId eq 550}">
	                                                        		<label class="c_lbl smallFont">${questions.questionOptionText}</label>
	                                                        	</c:when>
	                                                        	<c:otherwise>
	                                                        		<label class="c_lbl">${questions.questionOptionText}</label>
	                                                        	</c:otherwise>
	                                                        </c:choose>                                                                                                    	
                                                    	</div>
		                                                <c:set var="tempQuestionId">${questions.questionId}</c:set>
		                                                <c:set var="tempOptionCount">1</c:set>
		                                                <c:set var="questionsCount">${questionsCount + 1}</c:set>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<c:if test="${(tempOptionCount % 2) eq 0}">
                                        					<div class="col-lg-2"></div>
			                                            </div>
                                        				<br/>
                                                    	<div class="row clearfix">
                                                    	<div class="col-lg-4"></div>
                                        			</c:if>
                                                    <div class="col-lg-3">
                                                        <div class="c_box">
                                                        	<c:choose>
                                                        		<c:when test="${(questions.questionId eq '558') or (questions.questionId eq '551') or (questions.questionId eq '554')}">
                                                        			<c:choose>
	                                                        			<c:when test="${questions.optionChecked  eq 1}">
	                                                        				<span class="common_custom_checkbox white_checkbox_checked ans_${questions.questionId} disableNextQuestion"></span>
                                                        					<input type="checkbox" id="${questions.questionId}_${questions.questionOptionID}" class="default_checkbox answer" checked="checked"/>
	                                                        			</c:when>
	                                                        			<c:otherwise>
	                                                        				<span class="common_custom_checkbox ans_${questions.questionId} disableNextQuestion"></span>
                                                        					<input type="checkbox" id="${questions.questionId}_${questions.questionOptionID}" class="default_checkbox answer"/>
	                                                        			</c:otherwise>
	                                                        		</c:choose>
                                                        			
                                                        		</c:when>
                                                        		<c:when test="${((questions.questionId eq '559') or (questions.questionId eq '552') or (questions.questionId eq '555')) and (dependentQuestionFlag eq 0)}">	                                                        		
	                                                        			<span class="common_custom_checkbox ans_${questions.questionId} inactiveLink"></span>
	                                                        			<input type="checkbox" id="${questions.questionId}_${questions.questionOptionID}" class="default_checkbox answer"/>
	                                                        		</c:when>
                                                        		<c:otherwise>
                                                        			<c:choose>
	                                                        			<c:when test="${questions.optionChecked  eq 1}">
	                                                        				<span class="common_custom_checkbox white_checkbox_checked ans_${questions.questionId}"></span>
                                                   							<input type="checkbox" id="${questions.questionId}_${questions.questionOptionID}" class="default_checkbox answer" checked="checked"/>
	                                                        			</c:when>
	                                                        			<c:otherwise>
	                                                        				<span class="common_custom_checkbox ans_${questions.questionId}"></span>
                                                   							<input type="checkbox" id="${questions.questionId}_${questions.questionOptionID}" class="default_checkbox answer"/>
	                                                        			</c:otherwise>	                                                        			                                                        		
	                                                        		</c:choose>                                                   					                                                      			
                                                        		</c:otherwise>
                                                        	</c:choose>                                                            
                                                        </div> 
                                                        <c:choose>
                                                        	<c:when test="${questions.questionId eq 550}">
                                                        		<label class="c_lbl smallFont">${questions.questionOptionText}</label>
                                                        	</c:when>
                                                        	<c:otherwise>
                                                        		<label class="c_lbl">${questions.questionOptionText}</label>
                                                        	</c:otherwise>
                                                        </c:choose>                                                                                                    	                                                        
                                                    </div>
                                                    <c:set var="tempOptionCount">${tempOptionCount + 1}</c:set>                                                                                                        
                                        		</c:otherwise>
                                        	</c:choose>                                        	                                                                                           
                                        </c:forEach>
                                        			<div class="col-lg-2"></div>
			                                	</div>
			                            	</div>
                                        </li>                                             
                                        <li>
		                                     <div class="row row1">
		                                     	&nbsp;
		                                     </div>
		                                     <div class="row row2" id="zq-thnku">
	                                         	<div class="content">                                                        
	                                              <div class="col-lg-1"></div>
	                                              <div class="col-lg-4"><img style="width:200px;height:190px;9px 0 0 6%" src="${pageContext.request.contextPath}/images/thank_u_smiley.png"/></div>
                                                    <div class="col-lg-6"><br><br>
                                                        <h3 class="text-center">Congratulations!!!</h3>
                                                        <p style="margin-top:0">
                                                            Thank you for your valuable time. Please save the details.
                                                        </p>
                                                    </div>
                                                    <div class="row clearfix">
	                                                    <div class="col-lg-4"></div>
	                                                    
	                                                    <div class="col-lg-6">
	                                                        <input class="dbtn" style="margin:19px auto 0;width:78px;display: block;" type="button" onclick="saveOptions();" value="Save"/>
                                                    	</div>
                                                    	<div class="col-lg-4"></div>
                                                	</div>
                                           		</div>                                                 
                                        	</div>  	
		                                </li>       
		                                <%-- <li>
                                                <div class="row row1">
                                                    <div class="row clearfix text-center col-lg-12"></div>
                                                </div>
                                                <div class="row row2" id="zq-thnku">
                                                    <div class="content">
                                                    <div class="col-lg-1"></div>
                                                    <div class="col-lg-4"><img src="${pageContext.request.contextPath}/images/thank_u_smiley.png"/></div>
                                                    <div class="col-lg-6"><br/><br/>
                                                        <h3 class="text-center">Congratulations!!!</h3>
                                                        <p>
                                                            Thank you for your valuable time. Please save the details.
                                                        </p>
                                                    </div>
                                                    <div class="col-lg-3">
	                                                        <input type="button" onclick="saveOptions();" value="Save"/>
                                                    	</div>
                                                    </div>
                                                </div>
                                            </li> --%>                           
                                        </ul>
                                        <div id="notification"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br/><br/>
            <!-- Center part End -->

            <footer style="position:fixed;bottom:0px;width:100%;z-index:40">
                <div class="row">
                    <div class="bottomstrip">
                        <div class="container">
                            <div id="powerby"><img src="<%=request.getContextPath()%>/images/finfra_logo.png"> </div>
                            <div style="margin: 15px 0 0 0;float: left;">
                                <a target="_blank" style="color: white; padding-left: 80px;" href="https://www.facebook.com/axismfexpertslounge">
                                    <img style="height: 25px; margin-left: 309px;" alt="" src="<%=request.getContextPath()%>/images/facebook.png"> </a>
                            </div>
                            <div class="copyright">&copy;2014 FIINFRA Pvt. Ltd. All Rights Reserved.</div>
                        </div>
                    </div>
                </div>
                <!-- END login-form -->
            </footer>
        </section>
		</form>
        <script>
            $(function() {
            	
            	$('#zimmedariMeter').css('font-weight','bold');
            	
                var zqslider = $('#zq_main_bx_slider').bxSlider({
                    onSliderLoad: function(currentIndex) {
                    	$(".bx-prev").css("display","none");
                        $('#notification').html('<div class="one">'+(currentIndex+1)+'</div><span class="two"> of ${questionsCount + 1}</span>')
                    },
                    onSlideAfter: function($slideElement, oldIndex, newIndex) {
                        $('#notification').html('<div class="one">'+(zqslider.getCurrentSlide()+1)+'</div><span class="two"> of '+zqslider.getSlideCount()+'</span>')
                        if(newIndex==0){
                        	$(".bx-prev").css("display","none");
                        }else{
                        	$(".bx-prev").css("display","block");
                        }
                        if(newIndex==12){
                        	$(".bx-next").css("display","none");
                        }else{
                        	$(".bx-next").css("display","block");
                        }
                    }
                });
                
                $('#page_loader').fadeOut("1000");

                $("body").on("click", ".common_custom_checkbox", function() {
                	
                	//$(".common_custom_checkbox").not(this).removeClass("white_checkbox_checked");
                	
                	var pieces=$(this).attr("class").split(" ");
                	var pieces2=pieces[1].split("_");
                	var checkboxFlag=1; 
                	
                	if(pieces2[1]!="557"){
                		$("."+pieces[1]).not(this).removeClass("white_checkbox_checked");
                    	$("."+pieces[1]).not(this).next(".default_checkbox").prop("checked", false);
                    	checkboxFlag=0;
                	}                	                	
                	
                	if(pieces[2]=="disableNextQuestion"){                		                		
                		var nextQuestionId=parseInt(pieces2[1])+1;
                		$(".ans_"+nextQuestionId).addClass("inactiveLink");
                		$(".ans_"+nextQuestionId).removeClass("white_checkbox_checked");
                    	$(".ans_"+nextQuestionId).next(".default_checkbox").prop("checked", false);
                	}else if(pieces[2]=="enableNextQuestion"){                	
                		var nextQuestionId=parseInt(pieces2[1])+1;
                		$(".ans_"+nextQuestionId).removeClass("inactiveLink");
                	}                	                	

                    if ($(this).next(".default_checkbox").is(":checked") && (checkboxFlag==1)) {
                        $(this).next(".default_checkbox").prop("checked", false);
                        $(this).removeClass("white_checkbox_checked");
                    } else {
                        $(this).next(".default_checkbox").prop("checked", true);
                        $(this).addClass("white_checkbox_checked");

                    }

                });
            });
        </script>
    </body>
    <script>
      
            (function(d){d.Zebra_Dialog=function(g,k){var s={animation_speed:250,auto_close:!1,buttons:!0,custom_class:!1,keyboard:!0,max_height:0,message:"",modal:!0,overlay_close:!0,overlay_opacity:0.9,position:"center",reposition_speed:100,source:!1,title:"",type:"information",vcenter_short_message:!0,width:0,onClose:null},a=this;a.settings={};options={};"string"==typeof g&&(options.message=g);if("object"==typeof g||"object"==typeof k)options=d.extend(options,"object"==typeof g?g:k);a.init=function(){a.settings= d.extend({},s,options);a.isIE6="explorer"==j.name&&6==j.version||!1;a.settings.modal&&(a.overlay=jQuery("<div>",{"class":"ZebraDialogOverlay"}).css({position:a.isIE6?"absolute":"fixed",left:0,top:0,opacity:a.settings.overlay_opacity,"z-index":1E3}),a.settings.overlay_close&&a.overlay.bind("click",function(){a.close()}),a.overlay.appendTo("body"));a.dialog=jQuery("<div>",{"class":"ZebraDialog"+(a.settings.custom_class?" "+a.settings.custom_class:"")}).css({position:a.isIE6?"absolute":"fixed",left:0, top:0,"z-index":1001,visibility:"hidden"});!a.settings.buttons&&a.settings.auto_close&&a.dialog.attr("id","ZebraDialog_"+Math.floor(9999999*Math.random()));var e=parseInt(a.settings.width);!isNaN(e)&&(e==a.settings.width&&e.toString()==a.settings.width.toString()&&0<e)&&a.dialog.css({width:a.settings.width});a.settings.title&&jQuery("<h3>",{"class":"ZebraDialog_Title"}).html(a.settings.title).appendTo(a.dialog);e=jQuery("<div>",{"class":"ZebraDialog_BodyOuter"+(!a.settings.title?" ZebraDialog_NoTitle": "")+(!l()?" ZebraDialog_NoButtons":"")}).appendTo(a.dialog);a.message=jQuery("<div>",{"class":"ZebraDialog_Body"+(""!=m()?" ZebraDialog_Icon ZebraDialog_"+m():"")});0<a.settings.max_height&&(a.message.css("max-height",a.settings.max_height),a.isIE6&&a.message.attr("style","height: expression(this.scrollHeight > "+a.settings.max_height+' ? "'+a.settings.max_height+'px" : "85px")'));a.settings.vcenter_short_message?jQuery("<div>").html(a.settings.message).appendTo(a.message):a.message.html(a.settings.message); if(a.settings.source&&"object"==typeof a.settings.source){var b=a.settings.vcenter_short_message?d("div:first",a.message):a.message,c;for(c in a.settings.source)switch(c){case "ajax":var f="string"==typeof a.settings.source[c]?{url:a.settings.source[c]}:a.settings.source[c],g=jQuery("<div>").attr("class","ZebraDialog_Preloader").appendTo(b);f.success=function(a){g.remove();b.append(a);h(!1)};d.ajax(f);break;case "iframe":iframe_options=d.extend({width:"100%",height:"100%",marginheight:"0",marginwidth:"0", frameborder:"0"},"string"==typeof a.settings.source[c]?{src:a.settings.source[c]}:a.settings.source[c]);b.append(jQuery("<iframe>").attr(iframe_options));break;case "inline":b.append(a.settings.source[c])}}a.message.appendTo(e);if(c=l()){var n=jQuery("<div>",{"class":"ZebraDialog_Buttons"}).appendTo(a.dialog);d.each(c,function(e,b){var c=jQuery("<a>",{href:"javascript:logoutClick("+e+")","class":"ZebraDialog_Button"+e});d.isPlainObject(b)?c.html(b.caption):c.html(b);c.bind("click",function(){void 0!=b.callback&& b.callback(a.dialog);a.close(void 0!=b.caption?b.caption:b)});c.appendTo(n)});jQuery("<div>",{style:"clear:both"}).appendTo(n)}a.dialog.appendTo("body");d(window).bind("resize",h);a.settings.keyboard&&d(document).bind("keyup",p);a.isIE6&&d(window).bind("scroll",q);!1!==a.settings.auto_close&&(a.dialog.bind("click",function(){clearTimeout(a.timeout);a.close()}),a.timeout=setTimeout(a.close,a.settings.auto_close));h(!1);return a};a.close=function(e){a.settings.keyboard&&d(document).unbind("keyup",p); a.isIE6&&d(window).unbind("scroll",q);d(window).unbind("resize",h);a.overlay&&a.overlay.animate({opacity:0},a.settings.animation_speed,function(){a.overlay.remove()});a.dialog.animate({top:0,opacity:0},a.settings.animation_speed,function(){a.dialog.remove();if(a.settings.onClose&&"function"==typeof a.settings.onClose)a.settings.onClose(void 0!=e?e:"")})};var h=function(e){var b=d(window).width(),c=d(window).height(),f=a.dialog.width(),g=a.dialog.height(),f={left:0,top:0,right:b-f,bottom:c-g,center:(b- f)/2,middle:(c-g)/2};a.dialog_left=void 0;a.dialog_top=void 0;a.settings.modal&&a.overlay.css({width:b,height:c});d.isArray(a.settings.position)&&(2==a.settings.position.length&&"string"==typeof a.settings.position[0]&&a.settings.position[0].match(/^(left|right|center)[\s0-9\+\-]*$/)&&"string"==typeof a.settings.position[1]&&a.settings.position[1].match(/^(top|bottom|middle)[\s0-9\+\-]*$/))&&(a.settings.position[0]=a.settings.position[0].toLowerCase(),a.settings.position[1]=a.settings.position[1].toLowerCase(), d.each(f,function(b,e){for(var c=0;2>c;c++){var d=a.settings.position[c].replace(b,e);d!=a.settings.position[c]&&(0==c?a.dialog_left=eval(d):a.dialog_top=eval(d))}}));if(void 0==a.dialog_left||void 0==a.dialog_top)a.dialog_left=f.center,a.dialog_top=f.middle;a.settings.vcenter_short_message&&(b=a.message.find("div:first"),c=b.height(),f=a.message.height(),c<f&&b.css({"padding-top":(f-c)/2}));"boolean"==typeof e&&!1===e||0==a.settings.reposition_speed?a.dialog.css({left:a.dialog_left,top:a.dialog_top, visibility:"visible"}):a.dialog.css("visibility","visible").animate({left:a.dialog_left,top:a.dialog_top},a.settings.reposition_speed);a.dialog.find("a[class^=ZebraDialog_Button]:first").focus();a.isIE6&&setTimeout(r,500)},r=function(){var e=d(window).scrollTop(),b=d(window).scrollLeft();a.settings.modal&&a.overlay.css({top:e,left:b});a.dialog.css({left:a.dialog_left+b,top:a.dialog_top+e})},l=function(){if(!0!==a.settings.buttons&&!d.isArray(a.settings.buttons))return!1;if(!0===a.settings.buttons)switch(a.settings.type){case "question":a.settings.buttons= ["No","Yes"];break;default:a.settings.buttons=["Ok"]}return a.settings.buttons.reverse()},m=function(){switch(a.settings.type){case "confirmation":case "error":case "information":case "question":case "warning":return a.settings.type.charAt(0).toUpperCase()+a.settings.type.slice(1).toLowerCase();default:return!1}},p=function(e){27==e.which&&a.close();return!0},q=function(){r()},j={init:function(){this.name=this.searchString(this.dataBrowser)||"";this.version=this.searchVersion(navigator.userAgent)|| this.searchVersion(navigator.appVersion)||""},searchString:function(a){for(var b=0;b<a.length;b++){var c=a[b].string,d=a[b].prop;this.versionSearchString=a[b].versionSearch||a[b].identity;if(c){if(-1!=c.indexOf(a[b].subString))return a[b].identity}else if(d)return a[b].identity}},searchVersion:function(a){var b=a.indexOf(this.versionSearchString);if(-1!=b)return parseFloat(a.substring(b+this.versionSearchString.length+1))},dataBrowser:[{string:navigator.userAgent,subString:"MSIE",identity:"explorer", versionSearch:"MSIE"}]};j.init();return a.init()}})(jQuery);
            
        var answerList = [];
        
        function saveOptions(){
        	var answerArray = document.getElementsByClassName("answer");
        	var optionId = "";
      		var count = 0;
        	for(var i=0;i<answerArray.length-2;i++){
        		optionId=answerArray[i].id;
        		if($(answerArray[i]).is(':checked')==true){
        			answerList.push(optionId);
        			count = count + 1;
        		}
        	}
        	if(count>0){
        		$("#answerList").val(answerList);
        		$("#questionForm").ajaxSubmit({
        			url: "${pageContext.request.contextPath}/businessHealthIndex/saveZimmedariMeterQuestionnaire",
        			type : "GET",
        			data : {'answers' : $("#answerList").val()},
        			success: function(msg){
        				if(msg=="success"){
        					showAlertMessage("Message", "<br/>Data saved successfully.", "confirmation", showZimmedariMeter);
        				}else{
        					showAlertMessage("Message", "<br/>Error saving data.Please try again later.", "error", showZimmedariMeter);	
        				}        				
        			}
        		});
        		//$("#questionForm").submit();
        	}else{
        		showAlertMessage("Message", "<br/>You haven't selected any answer.Please select atleast one answer and then try save.", "information", doNothing);
        	}
        		
        }
        
        function showZimmedariMeter(){
        	window.location.href="${pageContext.request.contextPath}/businessHealthIndex/zimmedariMeter";
        }
        
        function redirectToPanel1(id){
        	if(id=='terms'){
        		if($('#isAgreeed').is(':checked')==true){
        			localStorage.setItem('isAgreed','true');
        		}else{
        			localStorage.setItem('isAgreed','false');
        		}
        		id='zimmedariMeter';	
        	}
        	
        	var isAgreed=localStorage.getItem('isAgreed');
        	
        	if(isAgreed=='true' || '${sessionScope.userSession.successfulLoginCount}'!=0){
        		if(id=="zimmedariMeter"){
        			window.location.href='${pageContext.request.contextPath}/businessHealthIndex/zimmedariMeter';
        		}else if(id=="businessvaluation"){
        			window.location.href='${pageContext.request.contextPath}/businessPlan.htm';
        		}else if(id=='masterasuumption'){
        			window.location.href='${pageContext.request.contextPath}/masterassumption.htm';
        		}else if(id=='productrecommendations'){
        			window.location.href='${pageContext.request.contextPath}/productrecommendations.htm';
        		}else if(id=='notifications'){
        			window.location.href='${pageContext.request.contextPath}/notifications.htm';
        		}else if(id=='termsofuse'){
        			window.location.href='${pageContext.request.contextPath}/setup.htm';
        		}
        	}else{
        		showAlertMessage("Message", "<br/>Please accept Terms Of Use.", "information", doNothing);
        	}
        }
        
        </script>
         
        <style>
        a{
        cursor: pointer;
        }
        </style>
</html>