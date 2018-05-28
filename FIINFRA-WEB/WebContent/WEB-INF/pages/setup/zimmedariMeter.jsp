<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Zimmedari Meter</title>
        <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
        <script src="<%=request.getContextPath()%>/js/holder.js"></script>
        <script src="<%=request.getContextPath()%>/js/common.js"></script>
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
        
        <link href="<%=request.getContextPath()%>/css/custom2.css" rel="stylesheet">
    </head>
    <body>
        <section>
            <div class="container">
                <div class="container-head">
                    <div class="col-md-12 text-right">
                        <span class="pull-left">Partner Setup </span> 
                        <a style="top: -7px;position: relative;" onclick="redirectToPanel('termsofuse')"><input class="dbtn" value="Back" title="Back" type="button"></a>
                        <a style="top: -8px;position: relative;"><input id="cancel" title="Next" class="btn dbtn" type="button" value="Next" onclick="redirectToPanel('businessvaluation')"></a>
                    </div>
                </div>

                <div class="container-body">                    
                    <jsp:include page="sidebar_setup.jsp"></jsp:include>

                    <div class="col-md-9" style="margin-top:10px; padding-left:10px;" id="pnl-zm">
                        <div class="list-group">
                            <a href="" class="list-group-item active">Zimmedari Meter </a>
                            <div class="list-group-item" id="biz-panels">
                                <div class="row clearfix">
                                    <div class="col-lg-4"></div>
                                    <div class="panel panel-default col-lg-4 text-center">
                                        <div class="panel-body">
                                            <div class="txt-red">Zimmedari Meter</div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 text-right" id="tgl-help">
                                        <span class="icn"></span>
                                        HELP
                                    </div>
                                    <div id="tgl-helptext">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                                        <ul>
                                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</li>
                                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</li>
                                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</li>
                                            <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <div id="pnl-meter" class="col-lg-12">
                                    <span class="arrow"></span><span class="arrow_base"></span>                                    
                                    <c:choose>
                                    	<c:when test="${IFAClass eq 'Bronze'}">
                                    		<h2 class="text-center" style="color:#5B391E;">                                    
                                    		<span style="color:black;">You are our</span> ${IFAClass} partner
                                    		<img src="<%=request.getContextPath()%>/images/Bronz.png"/>
                                    		</h2>
                                    	</c:when>
                                    	<c:when test="${IFAClass eq 'Silver'}">
                                    		<h2 class="text-center" style="color:silver;">                                    
                                    		<span style="color:black;">You are our</span> ${IFAClass} partner
                                    		<img src="<%=request.getContextPath()%>/images/silver.png"/>
                                    		</h2>
                                    	</c:when>
                                    	<c:when test="${IFAClass eq 'Gold'}">
                                    		<h2 class="text-center" style="color:gold;">                
                                    		<span style="color:black;">You are our</span> ${IFAClass} partner
                                    		<img src="<%=request.getContextPath()%>/images/gold_partner_icon.png"/>
                                    		</h2>
                                    	</c:when>
                                    	<c:when test="${IFAClass eq 'Platinum'}">
                                    		<h2 class="text-center"  style="color:silver;">               
                                    		<span style="color:black;">You are our</span> ${IFAClass} partner
                                    		<img src="<%=request.getContextPath()%>/images/silver.png"/>
                                    		</h2>
                                    	</c:when>                                    	
                                    </c:choose>                                                                        
                                    </div>
                                </div>
                                <div class="row clearfix">
                                    <a href="zimmedariMeterQuestionnaire" id="lnk-healthindex" class="pull-right"><span class="icn"></span><span class="txt">Your Business Health Index</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div></div>
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
        
<script>
    $(function() {
    	
    	$('#zimmedariMeter').css('font-weight','bold');
    	
        $('#tgl-help').on('click', function(e) {
            e.preventDefault();
            var icnd = $(this).children('.icn');
            if($(icnd).hasClass('active')) {
                $('#tgl-helptext').slideUp();
                $(icnd).removeClass('active');
            } else {
                $('#tgl-helptext').slideDown();
                $(icnd).addClass('active');
            }
        });

    });
    
    $(document).ready(function(){
	   	  $(function() {
    		 	var chartData ='${chartCount}';
    		 	var angleToRotate = -90;
    		 	if(chartData != 'null'){
    		 		var number = 100;
    		 		var angle = chartData / number;
    		 		var angle = angle * 180;	 		
    		 		angleToRotate = angle - 90;
    		 	} else {
    		 		displayMsg("<spring:message code='error.analysis.dataNotDefined' />");
    		 	}
    			var $elie = $(".arrow");
    			
    		    rotate(angleToRotate);
    	 	function rotate(degree) {
    	    	$elie.css({
    	                 '-webkit-transform': 'rotate(' + degree + 'deg)',
    	                 '-moz-transform': 'rotate(' + degree + 'deg)',
    	                 '-ms-transform': 'rotate(' + degree + 'deg)',
    	                 '-o-transform': 'rotate(' + degree + 'deg)',
    	                 'transform': 'rotate(' + degree + 'deg)',
    	                 
    	     	});
    	 	}
    	 
    	});
    });
    
</script>

    </body>
</html>