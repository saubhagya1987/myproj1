<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.drop_menu { display:none !important; }
</style>
<!-- Hover effects on cloud-->
<script>

function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
}

function myConfiguration(){
	var nodeID = '${nodeId}';
	if(nodeID>0)
	{
		displayMsg("Please select partner first from Hierarchy");
	}
	else{
	window.location.replace("${pageContext.request.contextPath}/partner/personal/info");
	};
}

function misReports(){
	var nodeID = '${nodeId}';
	if(nodeID>0)
	{
		displayMsg("Please select partner first from Hierarchy");
	}
	else{
	window.location.replace("${pageContext.request.contextPath}/report/reports");
	};
}

$(document).ready(function(){
  $('.wrapper').attr('id', 'dashboard');
  $(function() {
	 	var chartData ='${ChartCount}';
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

<div  id="dashboard">
  <section class="main"> 
    <!-- Header Starts--> 
    <!-- Header Ends-->
    <section class="content">
      <section class="in_content clearfix"> 
        <!-- Dashboard functions strats-->
        <div class="fl first_col" id="functions">
          <div class="goals cloud goalsLink"><a href="goals" class="hit_area"></a><span class="head">Goals</span></a></div>
          <div class="chat cloud chatLink"><a href="${pageContext.request.contextPath}/partner/chat" class="hit_area"></a><span class="head">Chat</span></div>
          <div class="configur cloud myConfigurationLink"><a href="#" onclick="myConfiguration();" class="hit_area"></a><span class="head">My<br>
            Configuration</span></div>
          <div class="contact cloud contactsLink"><a href="${pageContext.request.contextPath}/partner/contacts" class="hit_area"></a><span class="head">Contacts</span></div>
          <div class="report cloud misReportsLink"><a href="#" onclick="misReports();" class="hit_area"></a><span class="head">MIS Reports</span></div>
          <div class="task cloud taskLink"><a href="${pageContext.request.contextPath}/partner/tasklist" class="hit_area"></a><span class="head">Tasks</span></div>
        </div>
        <!-- Dashboard functions Ends-->
        
        <div class="fr second_col"> 
          <!-- Jimmedari meter strats-->
          <div id="meter" class="clearfix">
            <div class="jm_meter fr"><span class="staus not_rank">Not Ranked</span><span class="staus average">Average</span><span class="staus very_good">Very Good</span><span class="arrow"></span><span class="arrow_base"></span>
              <h4 class="head">ZIMMEDARI METER</h4>
            </div>
          </div>
          <!-- Jimmedari meter ends-->
          
          <div id="query_alert"> 
            <!-- Alert Starts-->
            <div class="alert">
             
              <a href="${pageContext.request.contextPath}/alert/showAlerts" class="hit_area queryLink">
               <h4 class="head">Alerts</h4>
              <span class="count fr">${alerts}</span>
              <div class="clr"></div>
              <span class="desc fr">Check your Alerts.</span>
              <div class="clr"></div>
              </a> </div>
            <!-- Alert Ends--> 
            <!-- Query Starts-->
            <div class="query">
            
              <a href="${pageContext.request.contextPath}/query" class="hit_area queryLink">
                <h4 class="head">Raise a Query</h4>
               <span class="desc fr">Raise a query or append to existing queries.</span>
              <div class="clr"></div>
              </a> </div>
            <!-- Query Ends--> 
          </div>
        </div>
      </section>
      <div class="overlay"></div>
    </section>
    <div class="clr"></div>
  </section>
</div>
