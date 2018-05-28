<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<title>Dashboard</title>



<!-- Bootstrap -->
<style>
.drop_menu { display:none !important; }
</style>
<script type="text/javascript">
      $(document).ready(function () {
    	  taskcalender();
         $(".responsive-calendar").responsiveCalendar({
          time: '2014-11',
          events: {
            "2014-11-03":{"number": 1}, 
            "2014-11-04":{"number": 1}, 
            "2014-11-12": {},
	        "2014-11-30": {"number": 5, "url": ""},
            "2014-11-26": {"number": 1, "url": ""}
			}
        });
      });
    </script>
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
		
</head>
<body>



<div id="dashboard">
  <section class="main">
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
            <!-- <div class="jm_meter fr"><span class="staus not_rank">Not Ranked</span><span class="staus average">Average</span><span class="staus very_good">Very Good</span><span class="arrow"></span><span class="arrow_base"></span>
              <h4 class="head">JIMMEDARI METER</h4>
            </div> -->
            
            <div class="alert">
              <h4 class="head">Alerts</h4>
              <a href="${pageContext.request.contextPath}/alert/showAlerts" class="hit_area"><span class="count fr">${alerts}</span>
              <div class="clr"></div>
              <span class="desc fr">Check your Alerts.</span>
              <div class="clr"></div>
              </a> </div>
              
              
              <div class="query">
              <h4 class="head">Raise <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a Query</h4>
              <a href="${pageContext.request.contextPath}/query" class="hit_area"> <span class="desc fr">Raise a query or append
              to existing queries.</span>
              <div class="clr"></div>
              </a> </div>
          </div>
          <!-- Jimmedari meter ends-->
          <div id="query_alert"> 
            <!-- Calender Starts-->
            
            <div class="responsive-calendar">
              <div class="controls"> <a class="pull-left" data-go="prev">
                <div class="btn btn-primary">Prev</div>
                </a>
                <h4><span data-head-year></span> <span data-head-month></span></h4>
                <a class="pull-right" data-go="next">
                <div class="btn btn-primary">Next</div>
                </a> </div>
              <hr/>
              <div class="day-headers">
                <div class="day header">Mon</div>
                <div class="day header">Tue</div>
                <div class="day header">Wed</div>
                <div class="day header">Thu</div>
                <div class="day header">Fri</div>
                <div class="day header">Sat</div>
                <div class="day header">Sun</div>
              </div>
              <div class="days" data-group="days"> </div>
            </div>
            <!-- Calender Ends--> 
          </div>
        </div>
      </section>
      <div class="overlay"></div>
    </section>
    <div class="clr"></div>
  </section>
</div>

</body>
<!-- script for calender  -->


<script>


	function create2dArrayforgoal(result) {
		isDataAvailable = false;
		var innerArray = new Array();
		var outerArray = new Array();
		for ( var i = 0; i < result.length; i++) {

			innerArray = new Array();
			date = String.valueOf(result[i].title);

			innerArray
					.push('"'
							+ result[i].title
							+ '": {"number": "'
							+ result[i].count
							+ '", "url": "${pageContext.request.contextPath}/partner/tasklist?value='
							+ result[i].title + '"}');

			outerArray.push(innerArray);

		}
		return outerArray;
	}

	
	function taskcalender() {
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/partner/getCalenderData" ,
				success : function(result) {
					var outerArray = create2dArrayforgoal(result);
					createCalender(outerArray);
		         },
				error : function(err){
					
				}

			});
		
	}

	function createCalender(outerArray){
		var start = "{";
		var outarray = outerArray.toString() + "}";
		var result = start.concat(outarray);
		var fullDate = new Date();
		var twoDigitMonth = ((fullDate.getMonth().length + 1) === 1) ? (fullDate
				.getMonth() + 1)
				: '0' + (fullDate.getMonth() + 1);
		$(".responsive-calendar").responsiveCalendar(
				{
					onDayClick : function(events) {
						var datevalue = $(this).attr('data-day') + '/'
								+ $(this).attr('data-month') + '/'
								+ $(this).attr('data-year');

						addNewTask(datevalue);
					},

					time : '' + fullDate.getFullYear() + '-' + twoDigitMonth
							+ '',
					events : JSON.parse(result)
				});
		}

	function addNewTask(date){
		 window.location.href= "${pageContext.request.contextPath}/partner/addTask?date="+date;
		}
</script>
</html>
