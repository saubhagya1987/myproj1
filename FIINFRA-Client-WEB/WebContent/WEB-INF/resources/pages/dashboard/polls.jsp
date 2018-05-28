 <%@page import="java.util.Calendar"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="java.util.Date"%>
<%@page import="in.fiinfra.question.OptionData"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.question.QuestionData"%>
<script>
	function savePolls(action) {
		if(checkValid()){
			$('#action').val(action);
		 	if($('#polls-form').valid()){
		 		$('#polls-form').submit();	
		 	}
		}
		else{
			showMessage('Please Select an option', true);
		}
	}
	function checkValid(){
		if ($('input[name=selectedOptions]:checked').length) {
			return true;
		} 
	}
</script>
 <script>
  $(function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
  });
  </script>
<script>
<% boolean answered = (Boolean)request.getAttribute("answered");
   
   QuestionData lastPoll = (QuestionData) request.getAttribute("last");
   QuestionData poll =  (QuestionData) request.getAttribute("latest");
 /*   boolean lastPollAnswered = false;
   if(lastPoll != null){
   for(OptionData op:lastPoll.getOptions()){
    if(op.getSelectedTotal() >0){
     lastPollAnswered = true;  
    }
   }
   } */
%>

/* var lastPollGraph = ${lastPollGraph};
var currentPollGraph = ${currentPollGraph}; */

<%if(lastPoll != null){%>
<%-- <% if(lastPollAnswered){ %> --%>
var lastPollGraphData = ${lastPollData};//alert(JSON.stringify(lastPollGraphData))
var lastPollCategory = ${lastPollCategories};
var lastPollData = ${lastPolls};
var chartDataForLastPolls = callPollOptionGraph(lastPollData);
//var chartDataForLatestPolls;
    function drawLastPoll() {
    	
        
        var data = google.visualization.arrayToDataTable(lastPollGraphData);
        
        var view = new google.visualization.DataView(data);
        
        

        var options = {
        	legend: {position: 'none'},
        	isStacked: true,  
              
        };

     var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
     chart.draw(view, options);
    }

$(function() {

	
	drawLastPoll();


});

<%-- <%}%> --%>
<%}%>

<%if(answered){%>
//var chartDataForLastPolls;
var currentPollGraphData = ${currentPollData};
	    
	    function drawCurrentPoll() {
	    	
	        var data = google.visualization.arrayToDataTable(currentPollGraphData);
	        
	        var view = new google.visualization.DataView(data);
	        
	        var options = {
	        	legend: {position: 'none'},
	        	isStacked: true,  
	              
	        };

	     var chart = new google.visualization.ColumnChart(document.getElementById('graphPoll'));
	     chart.draw(view, options);
	    }
	    

	    var latest=${latestPolls};
	
	
	
	
	
	var currentPollCategories=${currentPollCategories};
	var chartDataForLatestPolls = callPollOptionGraph(latest);
	
	$(function() {

		
		drawCurrentPoll();


	});


<%}%>





	function callPollOptionGraph(data) {
		var chartDataForPolls=[];
		var options = data['options'];
		chartDataForPolls = toChartDataForPolls(options);
		return chartDataForPolls;
	}


	function toChartDataForPolls(dataList) {
		var chartData = [];
		for (var i = 0; i < dataList.length; i++) {
			chartData[i] = [];
			chartData[i][0] = dataList[i].optionText;
			chartData[i][1] = dataList[i].selectedTotal;
			//chartData[i][1] = 30;
		}
		//alert(chartData);
		return chartData;
	}
</script>
<script>

</script>


 
	<!-- end of "header-strip" id -->

	
	<!-- end of "inner-shadow-strip" id -->
	<%
		QuestionData last = (QuestionData) request.getAttribute("last");
		QuestionData latest = (QuestionData) request.getAttribute("latest");
		
	%>

	<div id="contents">
		<div id="inner-contents-polls" class="clearfix fl">
		<% if(lastPoll != null){ 
		 
		
		%>
		<%-- <% if(lastPollAnswered){ %> --%>
		<%-- <div class="last-poll clearfix fl">
				<!--div id="chart3"  style="height:300px;width:500px; background-color:#CC99FF"></div-->
		<div class="last-poll-icon clearfix fl"></div>
		<div class="last-poll-heading clearfix ">Result of the Last	Poll</div>
        <div id="graphLastPoll" style="width:400px; height: 250px; margin: 0 auto"> </div>
                <div class="underline clearfix fl"></div>
        <div class="question clearfix fl"><%=last.getQuestion()%></div>
        
		</div> --%>
		
		
            
            <div class="row">
                  <div class="col-md-6">
                <div class="space"></div>
		<div class="widget-box">
                      <div class="widget-header">
                    <h4 class="widget-title lighter smaller">Result of the Last	Poll</h4>
                  </div>
                      <div class="widget-body">
                    <div class="widget-main no-padding">
                          <div style="padding:5px;"> <%=last.getQuestion()%>
                        <div id="chart_div" style="width: 100%; height: auto; position: relative;"><div dir="ltr" style="position: relative; width: 394px; height: 200px;"><div aria-label="A chart." style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%;"><svg width="394" height="200" aria-label="A chart." aria-hidden="true" style="overflow: hidden;"><defs id="defs"><clipPath id="_ABSTRACT_RENDERER_ID_0"><rect x="50" y="20" width="344" height="160"></rect></clipPath></defs><rect x="0" y="0" width="394" height="200" stroke="none" stroke-width="0" fill="#ffffff"></rect><g><rect x="50" y="20" width="344" height="160" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g clip-path="url(#_ABSTRACT_RENDERER_ID_0)"><g><rect x="50" y="179" width="344" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="50" y="139" width="344" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="50" y="100" width="344" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="50" y="60" width="344" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect><rect x="50" y="20" width="344" height="1" stroke="none" stroke-width="0" fill="#cccccc"></rect></g><g><rect x="85" y="21" width="45" height="158" stroke="#68bc31" stroke-width="1" fill="#68bc31"></rect><rect x="199" y="140" width="45" height="39" stroke="#da5430" stroke-width="1" fill="#da5430"></rect><rect x="313" y="101" width="45" height="78" stroke="#2091cf" stroke-width="1" fill="#2091cf"></rect></g><g><rect x="50" y="179" width="344" height="1" stroke="none" stroke-width="0" fill="#333333"></rect></g></g><g></g><g><g><text text-anchor="middle" x="107.66666666666666" y="193.85" font-family="&quot;Open Sans&quot;" font-size="11" stroke="none" stroke-width="0" fill="#222222">Yes</text></g><g><text text-anchor="middle" x="222" y="193.85" font-family="&quot;Open Sans&quot;" font-size="11" stroke="none" stroke-width="0" fill="#222222">No</text></g><g><text text-anchor="middle" x="336.3333333333333" y="193.85" font-family="&quot;Open Sans&quot;" font-size="11" stroke="none" stroke-width="0" fill="#222222">May Be</text></g><g><text text-anchor="end" x="39" y="183.35" font-family="&quot;Open Sans&quot;" font-size="11" stroke="none" stroke-width="0" fill="#444444">20</text></g><g><text text-anchor="end" x="39" y="143.6" font-family="&quot;Open Sans&quot;" font-size="11" stroke="none" stroke-width="0" fill="#444444">40</text></g><g><text text-anchor="end" x="39" y="103.85" font-family="&quot;Open Sans&quot;" font-size="11" stroke="none" stroke-width="0" fill="#444444">60</text></g><g><text text-anchor="end" x="39" y="64.1" font-family="&quot;Open Sans&quot;" font-size="11" stroke="none" stroke-width="0" fill="#444444">80</text></g><g><text text-anchor="end" x="39" y="24.35" font-family="&quot;Open Sans&quot;" font-size="11" stroke="none" stroke-width="0" fill="#444444">100</text></g></g></g><g></g></svg><div aria-label="A tabular representation of the data in the chart." style="position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;"><table><tbody><tr><th>Element</th><th>Density</th></tr>
<tr><td>Yes</td><td>100</td></tr>
<tr><td>No</td><td>40</td></tr>
<tr><td>May Be</td><td>60</td></tr>
</tbody></table></div></div></div><div aria-hidden="true" style="display: none; position: absolute; top: 210px; left: 404px; white-space: nowrap; font-family: 'Open Sans'; font-size: 11px; font-weight: bold;">60</div><div></div></div>
                      </div>
                          <form>
                        <div class="form-actions clearfix">
                              <div class="input-group pull-right"> <a href="" class="">Submit your vote here</a> </div>
                            </div>
                      </form>
                        </div>
                    <!-- /.widget-main --> 
                  </div>
                      <!-- /.widget-body --> 
                    </div>
		</div>
		
		<%-- <%} %> --%>
		<%} %>
		
		
		<% if (answered){%>
		
		<%-- <div class="poll-of-day clearfix fl">
				<!--div id="chart3"  style="height:300px;width:500px; background-color:#CC99FF"></div-->
		
		<div id="graphPoll" style="width:400px; height: 250px; margin: 0 auto"> </div>
		<div class="current-poll-icon clearfix fl"></div>
		<div class="current-poll-heading clearfix ">Ongoing Poll</div>
        
                <div class="underline clearfix fl"></div>
        <div class="question clearfix fl"><%=poll.getQuestion()%></div>
        
		</div> --%>
		<div class="col-md-6">
                <div class="space"></div>
		<div class="widget-box">
                      <div class="widget-header">
                    <h4 class="widget-title lighter smaller">Ongoing Poll</h4>
                  </div>
                      <div class="widget-body">
                    <div class="widget-main no-padding">
                          <div style="padding:5px;"> <%=poll.getQuestion()%>
	
		<div id="graphPoll" style="width:400px; height: 240px; margin: 0 auto"> </div>
		<div class="underline clearfix fl"></div>
        <div class="question clearfix fl"></div>
        
		</div> 
		</div>
		           </div>
                    <!-- /.widget-main --> 
                  </div>
                      <!-- /.widget-body --> 
                    </div>
		</div>
		
		
		<%} else { 
		
			Date endDate =  poll.getEndDate();
			Calendar cal = Calendar.getInstance();
			int gap =  CommonUtils.getGapInDays(endDate);
			String gapDays = "";
			String gapTime = ""+(24 - cal.get(Calendar.HOUR_OF_DAY));
			
			
			if(gap >30){
					gapDays = (gap/30)+"m";
					gapTime = (gap%30)+"d";
			}
			else if(gap <30 && gap >1){
				gapDays = gap+"d";
				gapTime = ""+(24 - cal.get(Calendar.HOUR_OF_DAY)) +"hrs";
			}
			else if(gap <1 ){
				gapDays = gap+"H";
				gapTime = ""+(60 - cal.get(Calendar.MINUTE)) +"M";
			}
			else{
					gapDays = gap+"d";
			}
			
		
		%>
		 
<%-- 		  <div class="col-md-6">
                <div class="space"></div>
                <div class="widget-box">
                       <div class="widget-header">
                    <h4 class="widget-title lighter smaller">Poll of the day</h4>
                  </div>
		 <div class="poll-of-day clearfix fl"> 
        <!--div id="chart3"  style="height:300px;width:500px; background-color:#CC99FF"></div-->
     
       
		 <div class="widget-body">
                    <div class="widget-main no-padding" style="padding:5px;">
		<form method="POST" action="${pageContext.request.contextPath}/question/polls/save" id="polls-form">
		<input type = "hidden" name = "questionId" value = "<%=poll.getQuestionId()%>"/>
		<input type = "hidden" name = "questionnaireId" value = "<%=poll.getQuestionnaireId()%>"/>
		
        <div class="poll-of-day_in">
          <div class="time"><%=gapDays%> : <%=gapTime%> Remaining</div>
          <div class="bx">
            <div class="title clearfix">
              <div class="fl type">Q.</div>
              <div class="fl ans"><%=poll.getQuestion() %> </div>
            </div>
            <%for(OptionData op:latest.getOptions()){ %>
            <div class="txt_bx clearfix">
              <div class="fl type">
                <input name="selectedOptions" type="radio" value="<%=op.getOptionId()%>" id="getOption">
              </div>
              <div class="fl ans"><%=op.getOptionText()%></div>
            </div>
            
            <%} %>
            <div align="center" class="btn_bx clearfix">
             <!--  <input type="button" value="Submit" class="main-btn fl" onClick="savePolls('new')" > -->
                <a href="javascript:void(0)" class="btn btn-success" type="submit" onClick="savePolls()" >Submit</a>
              <a class="btn btn-danger" href="${pageContext.request.contextPath}/profile/dashboard" >Cancel</a>
            </div>
          </div>
        </div>
        </form>
        </div>
        </div>
        <div id="dialog" title="Message">
  <p>Please select an option to save</p>
</div>
      </div>
     
      </div>
      </div> --%>
      
      
       <div class="col-md-6">
                <div class="space"></div>
		<div class="widget-box">
                      <div class="widget-header">
                    <h4 class="widget-title lighter smaller">Poll of the day</h4>
                  </div><br/>
                      <div class="widget-body">
                    <div class="widget-main no-padding">
                          <div style="padding:5px;"> 
							<form method="POST" action="${pageContext.request.contextPath}/question/polls/save" id="polls-form">
		<input type = "hidden" name = "questionId" value = "<%=poll.getQuestionId()%>"/>
		<input type = "hidden" name = "questionnaireId" value = "<%=poll.getQuestionnaireId()%>"/>
		 <div class="poll-of-day_in">
          <div class="time"><%=gapDays%> : <%=gapTime%> Remaining</div>
          <div class="bx">
            <div class="title clearfix">
              <div class="fl type">Q.</div>
              <div class="fl ans"><%=poll.getQuestion() %> </div>
            </div>
            <%for(OptionData op:latest.getOptions()){ %>
            <div class="txt_bx clearfix">
              <div class="fl type">
                <input name="selectedOptions" type="radio" value="<%=op.getOptionId()%>" id="getOption">
              </div>
              <div class="fl ans"><%=op.getOptionText()%></div>
            </div>
            
            <%} %>
            <div align="center" class="btn_bx clearfix">
             <!--  <input type="button" value="Submit" class="main-btn fl" onClick="savePolls('new')" > -->
                <a href="javascript:void(0)" class="btn btn-success" type="submit" onClick="savePolls()" >Submit</a>
              <a class="btn btn-danger" href="${pageContext.request.contextPath}/profile/dashboard" >Cancel</a>
            </div>
          </div>
        </div>
        </form>
                      </div>
                         
                        </div>
                        <div id="dialog" title="Message">
  <p>Please select an option to save</p>
</div>
                    <!-- /.widget-main --> 
                  </div>
                      <!-- /.widget-body --> 
                    </div>
		</div>
      </div>

      
		 
			<%} %>
			<!-- end of "last-poll" id -->
	<div class="current-poll clearfix fr"></div>
			<!-- end of "current-poll" id -->
		</div>
		<!-- end of "inner-contents-polls" id -->
	</div>
	<!-- end of "contents" id -->






 