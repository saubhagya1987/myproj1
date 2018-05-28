<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Performance Matrix</title>
        <link href="${pageContext.request.contextPath}/images/favicon.ico" rel="shortcut icon" />
        <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.ui.core.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.ui.widget.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zebra_dialog.css" type="text/css">

        <!-- -responsive css-->
        <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/partner_setup.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/partner.css" rel="stylesheet">
        <!-- -responsive css-->

        <script src="${pageContext.request.contextPath}/js/common.js"></script>
        <script src="${pageContext.request.contextPath}/js/pop.js"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/selectboxit.css" type="text/css" />
        <script src="${pageContext.request.contextPath}/js/selectboxit.js"></script>

        <script src="https://www.google.com/jsapi"></script>

        <link href="${pageContext.request.contextPath}/css/custom2.css" rel="stylesheet">
		<script type="text/javascript">
var $jq_1_9_2 = $.noConflict();
</script>
        <script type="text/javascript">
            

            google.load("visualization", "1", {packages: ["corechart"]});
           // google.setOnLoadCallback(drawChart);
            function drawChart(chartData,title,color) {
            	console.log(chartData);
                var data = google.visualization.arrayToDataTable(chartData);
                var options = {
                     title: title,
                     series: {
                         0: { color: color },
                         1: { color: '#e7711b' },
//                          2: { color: '#f1ca3a' },
//                          3: { color: '#6f9654' },
//                          4: { color: '#1c91c0' },
//                          5: { color: '#43459d' },
                       },
                     /*vAxis: {title: 'Accumulated Rating'},*/
                    legend: {position: 'none'},
                    colors: ['#952754'],
                    isStacked: true
                };

                var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

                chart.draw(data, options);
            }
        </script>
    </head>
    <body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/common_popup.jsp" />
<form action="" id="performanceMatrixFilterForm">  
<%-- <input type="hidden" name="partyId" value="${sessionScope.userSession.partyId}"/> --%>
            <div class="container">
                <div class="container-head">
                    <div class="col-md-12 text-right">
                        <span class="pull-left">Performance Matrix</span>
                    </div>
                </div>

                <div class="container-body">

                    <div class="col-md-12" style="margin-top:10px; padding-left:10px;" id="pnl-bv">
                        <div class="list-group">
                            <a href="" class="list-group-item active">Performance Matrix</a>
                           
                          
                            <div class="list-group-item">
                             <c:choose>
					  		<c:when test="${sessionScope.userSession.recordtypeId!=14003}">
                                <div class="row">
                                                                    <label class="form_label col-lg-1">Select IFA</label>
                                    
                                    <select class="selectbox col-lg-3 none" id="ifaId">
                                        <option value="0">IFA Name</option>
                                        
                                    </select>
                                </div>
                                </c:when>
                            </c:choose>
                                <div class="row text-center">
                                    <br/>
                                    <div id="chart_div" style="width: 100%; height: 500px;"></div>
                                </div>
                            </div>
                            
                        </div>
                        
                        <div class="row clearfix" id="permtrx_footer">
                            <label class="form_label">
                                Compare Your
                            </label>
                            <select class="selectbox col-lg-2 none" id="dataTagId" name="dataTagId">
                                
                            </select>
                            <label class="form_label">with</label>
                            <select class="selectbox none" id="benchMark" name="benchMark">
                                <option value="0">--Select--</option>
                            </select>
                            <label class="form_label">in</label>
                            <select class="selectbox none" id="banchMarkCategory" name="banchMarkCategory">
                                <option value="0">--Select--</option>
                            </select>
                            <input type="button" class="btn" name="btn-save" value="Go" onclick="retriveDataForChart()"/>
                        </div>
                        
                        <br/><br/>
                    </div>
                </div></div>
                </form>
            <br/><br/>
            <!-- Center part End -->

            
       
         <jsp:include page="../common/footer.jsp" />
         <script>
         $(function() {
        	 $.ajax({
         		type : "POST",
         		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=512,513,514',
         		success : function(result) {
         			$(result).each(function(i,obj) {
         				var codeTypeId=obj.codeTypeId;
         				var codeValue=obj.codeValue;
         				var codevalueId=obj.codeValueId;		
         				
         				if(codeTypeId==512){
         				$('#benchMark').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
         				}else if(codeTypeId==513){
         					$('#banchMarkCategory').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
         				}else if(codeTypeId==514){
         					$('#dataTagId').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
         				}
         				
         			});
         			
         		if('${sessionScope.userSession.recordtypeId}'!=14003){	
         		// Get Chart Data 
         		 $.ajax({
         		type : "GET",
         		url : $('#contextPath').val()+'/partner/getIFAListForUser.htm',
         		success : function(result) {
         			$(result).each(function(i,obj) {
         				$("#ifaId").append('<option value="'+obj.partyID+'">'+obj.firstName+' '+obj.lastName+'</option>');	
					});
         			$("select").show();
         			$jq_1_9_2("select").selectBoxIt();
//          			retriveDataForChart();
         		}});
         		}else{
         			$("select").show();
         			$jq_1_9_2("select").selectBoxIt();
         			retriveDataForChart();
         		}
         			
       	 	}
       	 	
       	        		});
        	 });
        	
		function create2dArray(result, firstRow) {
	 			
   	 		isDataAvailable = false;
   	 	var innerArray1 = new Array();
   	 		var outerArray = new Array();
   	 		innerArray1.push(firstRow[0]);
   	 		innerArray1.push(firstRow[1]);
   	 	if($("#benchMark").val() != 0){
   	 		innerArray1.push('BenchMark');
   	 	}
   	 		outerArray.push(innerArray1);
   	 	$(result).each(function(i,obj) {
   	 	var innerArray = new Array();
			innerArray.push(obj.quarter);
			innerArray.push(parseInt(obj.count));
			if($("#benchMark").val() != 0){
				innerArray.push(parseInt(obj.count1));
			}
 			outerArray.push(innerArray);
		});
   	 		return outerArray;
   	 	}
		
		function retriveDataForChart(){
			var partyId=0;
			if('${sessionScope.userSession.recordtypeId}'==14003){
				partyId='${sessionScope.userSession.partyId}';
			}else{
				partyId=$('#ifaId').val();
			}
			
			if(partyId==0){
				showAlertMessage("Error",
						"<br />Please Slect IFA Name.",
						"error", doNothing);
			}else if($("#benchMark").val() == 0 && $("#banchMarkCategory").val() != 0){
				showAlertMessage("Error",
						"<br />Please Slect BenchMark.",
						"error", doNothing);
			}else if($("#benchMark").val() != 0 && $("#banchMarkCategory").val() == 0){
				showAlertMessage("Error",
						"<br />Please Slect BenchMark Category.",
						"error", doNothing);
			}else{
				
				$.ajax({
	        		type : "POST",
	        		url : $('#contextPath').val()+'/partner/getPerformanceMatrixData.htm?partyId='+partyId,
	        		data :  $('#performanceMatrixFilterForm').serialize(),
	        		success : function(result) {
	        			var chartData = [];
	        		var firstRow = new Array();
	 				firstRow.push('Quarter');
	 				firstRow.push($("#dataTagId option:selected").text());
	 				var title = $("#dataTagId option:selected").text();
	 				var outerArray = create2dArray(result, firstRow);
	 				var color= '#952754';
	 				if('${sessionScope.userSession.themeName}' == 'Magento'){
	 					color= '#952754';	
	 				}else if('${sessionScope.userSession.themeName}' == 'Blue'){
	 					color= '#1d87bd';
	 				}else if('${sessionScope.userSession.themeName}' == 'Red'){
	 					color= '#ca514e';
	 				}else if('${sessionScope.userSession.themeName}' == 'Green'){
	 					color= '#649335';
	 				}
	 				drawChart(outerArray,title,color);
	 			}
	 		});				
				
			}
			
		}
         </script>
    </body>
</html>