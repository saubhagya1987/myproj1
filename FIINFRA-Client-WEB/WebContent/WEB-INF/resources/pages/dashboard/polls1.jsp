<%@page import="in.fiinfra.question.OptionData"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.question.QuestionData"%>
<script	src="${pageContext.request.contextPath}/resources/js/exporting.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/highcharts.js"></script>

<script>
var lastPollGraph = ${lastPollGraph};
var currentPollGraph = ${currentPollGraph};

var chartDataForLastPolls;
var chartDataForLatestPolls;
	$(document).ready(function() {
		var last = ${lastPolls};
		var latest=${latestPolls};
		var latestOptions=latest['options'];
		/* for(var i=0;i<latestOptions.length;i++){
			if(latestOptions[i]['selectedTotal']>0){
				$("#latestPollResult").empty();
				var html=pollResult(latest,latestOptions);
				$("#latestPollResult").html(html);
				
				break;
			}
		} */
		//Condition  Use To load The Graph For Latest Poll After Submit If The page Reload
		if(latest['answered']==true){
			$("#latestPollResult").empty();
			var html=pollResult(latest,latestOptions);
			$("#latestPollResult").html(html);
		}
		//alert(JSON.stringify(latest));
		$('#save').click(function(e) {
			e.preventDefault();
			savePollsData();
			
		});
		$('#cancle').click(function(e) {
			document.getElementById("savePoll").reset();
		});
		chartDataForLatestPolls=callPollOptionGraph(latest);
		chartDataForLastPolls=callPollOptionGraph(last);

	});

	function callPollOptionGraph(data) {
		var chartDataForPolls=[];
		var options = data['options'];
		chartDataForPolls = toChartDataForPolls(options);
		return chartDataForPolls;
	}
	function pollResult(data,options){
		var html='';
		html='<div class="last-poll clearfix fl" style="margin:0px!important;border-left:0px;!important">'
			+'<div class="last-poll-icon clearfix fl"></div>'
			+'<div class="last-poll-heading clearfix ">Poll Of the Day</div>'
			+'<div id="container2"	style="width: 400px; height: 250px; margin: 0 auto"></div>'
			+'<ul class="reset legend_cat">'
			for(var i=0;i<options.length;i++){
			if(i==0){
			html+='<li class="no">'
			+'<div class="color"></div>'+options[i]['optionText']+''
			+'<div class="clr"></div>'
			+'</li>';
			}
			if(i==1){
				html+='<li class="may_be">'
				+'<div class="color"></div>'+options[i]['optionText']+''
				+'<div class="clr"></div>'
				+'</li>';
				}
			if(i==2){
				html+='<li class="yes">'
				+'<div class="color"></div>'+options[i]['optionText']+''
				+'<div class="clr"></div>'
				+'</li>';
				}
			}
		html+='</ul>'
			+'<div class="underline clearfix fl"></div>'
			+'<div class="question clearfix fl" id="lastQuestion">'+data['question']+'</div></div>'
		return html;
	}
	function savePollsData() {
		//alert($('#savePoll').serialize());
		$.ajax({
			url : "${pageContext.request.contextPath}/question/polls/save",
			type : "POST",
			data : $('#savePoll').serialize(),
			success : function(data, textStatus, jqXHR) {
				location.reload(true);//reload a page After Ajax Call
				//$(this).html();
				//alert('success');
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('Error Thrown');
				alert(errorThrown);
			}
		}); 
		
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
	$(function() {
		try{
		$('#graphLastPoll').highcharts(
						{chart : {type : 'column',},title : {text : ''},subtitle : {text : ''},
						 xAxis : {
								lineWidth : 0,
								minorGridLineWidth : 0,
								lineColor : 'transparent',
								type : 'category',
								minorTickLength : 0,
								tickLength : 0,
								labels : {enabled : false}
							},
							yAxis : {
								gridLineWidth : 0,
								min : 0,
								title : {text : ''},
								labels : {
									enabled : false
								}
							},
							plotOptions : {
								column : {
									borderRadius : 6,
									colorByPoint : true,
									dataLabels : {
										useHTML : true,
										enabled : true,

										formatter : function() {
											//var pcnt = (this.y / dataSum) * 100;
											var percentage = this.percentage;

											return '<span style="color:' + this.point.color + '">'
													+ this.point.y + '</span>';

										}
									}
								}
							},
							colors : [ '#c0504d', '#4f81bd','#9bbb59' ],
							legend : {enabled : false},
							tooltip : {	
								enabled : false
							},
							series : [ {
								name : '',
								data : chartDataForLastPolls,
								/*  data: [
								     ['No',10],
								     ['May Be',45],
								     ['yes',100],
								    
								 ], */
								dataLabels : {
									enabled : true,

									rotation : 0,
									color : '#000',
									align : 'right',

									x : -15,
									y : 0,
									style : {
										fontSize : '12px',
										fontFamily : 'allerregular',

									}
								}
							} ],
						});
	}catch(err){
		
	}
	});
</script>
<script>
	$(function() {
		try {
		$('#container2').highcharts(
						{
							chart : {
								type : 'column',

							},
							title : {
								text : ''
							},
							subtitle : {
								text : ''
							},
							xAxis : {
								lineWidth : 0,
								minorGridLineWidth : 0,
								lineColor : 'transparent',
								type : 'category',
								minorTickLength : 0,
								tickLength : 0,
								labels : {

									enabled : false
								}

							},
							yAxis : {
								gridLineWidth : 0,
								min : 0,
								title : {
									text : ''
								},
								labels : {
									enabled : false
								}
							},
							plotOptions : {
								column : {
									borderRadius : 6,
									colorByPoint : true,
									dataLabels : {
										useHTML : true,
										enabled : true,

										formatter : function() {
											//var pcnt = (this.y / dataSum) * 100;
											var percentage = this.percentage;

											return '<span style="color:' + this.point.color + '">'
													+ this.point.y + '</span>';

										}
									}
								}
							},
							colors : [ '#c0504d', '#4f81bd',

							'#9bbb59' ],
							legend : {
								enabled : false
							},
							tooltip : {
								// pointFormat: '<b>{point.y:.1f} %</b>',
								enabled : false
							},
							series : [ {
								name : '',
								data : chartDataForLatestPolls,
								/*  data: [
								     ['No',10],
								     ['May Be',45],
								     ['yes',100],
								    
								 ], */
								dataLabels : {
									enabled : true,

									rotation : 0,
									color : '#000',
									align : 'right',

									x : -15,
									y : 0,
									style : {
										fontSize : '12px',
										fontFamily : 'allerregular',

									}
								}
							} ]
							,
							exporting: {
				              	  enabled: false
				            },
				            credits: {
				               enabled: false
				            }
						});
		}catch(err){
			
		}
	});
	
</script>

<div id="wrapper" class="clearfix">

	<!-- end of "header-strip" id -->

	<div id="inner-shadow-strip"></div>
	<!-- end of "inner-shadow-strip" id -->

	<div id="contents">
		<div id="inner-contents-polls" class="clearfix fl">
			<div class="last-poll clearfix fl">
				<!--div id="chart3"  style="height:300px;width:500px; background-color:#CC99FF"></div-->
				<%
					QuestionData last = (QuestionData) request.getAttribute("last");
				%>
				<div class="last-poll-icon clearfix fl"></div>
				<div class="last-poll-heading clearfix ">Result of the Last	Poll</div>
				<%-- <div class="ans-no clearfix fl"></div>
        <div class="ans-may clearfix fl"></div>
        <div class="ans-yes clearfix fl"></div>
        <div class="no-graph clearfix fl"><%=last.getOptions().get(0).getOptionText() %></div>
        <div class="may-graph clearfix fl"><%=last.getOptions().get(1).getOptionText() %></div>
        <div class="yes-graph clearfix fl"><%=last.getOptions().get(2).getOptionText() %></div>
        <div id="container" style="width:400px; height: 250px; margin: 0 auto"> </div>
        <ul class="reset legend_cat" id="pollResult">
          <!-- <li class="no"> <div class="color"></div> No <div class="clr"></div></li>
          <li class="may_be"><div class="color"></div>May Be<div class="clr"></div></li>
          <li class="yes"><div class="color"></div>Yes<div class="clr"></div></li> -->
        </ul> --%>
      	<div id="graphLastPoll"	style="width: 400px; height: 250px; margin: 0 auto"></div>
				<div class="underline clearfix fl"></div>
				<div class="question clearfix fl" id="lastQuestion"><%=last.getQuestion()%></div>
		</div>
		<div class="poll-of-day clearfix fl" style="margin:0px!important;border-left:0px;!important;margin-left:15px !important;">
				<!--div id="chart3"  style="height:300px;width:500px; background-color:#CC99FF"></div-->
				<div id="latestPollResult">
				<div class="last-poll-icon clearfix fl"></div>
				<div class="last-poll-heading clearfix ">Poll of the Day</div>
					
					<div class="poll-of-day_in">
						<div class="time">2d : 04 hrs Remaining</div>
						<form id="savePoll">
						<div class="bx">
							<div class="title clearfix">
								<!-- <div class="fl type">Q.</div> -->
								<%
									QuestionData latest = (QuestionData) request.getAttribute("latest");
								%>

								<div class="fl ans"><%=latest.getQuestion()%></div>
							</div>
							<%for(OptionData lst:latest.getOptions()){ %>
							<div class="txt_bx clearfix">
								<div class="fl type">
									<input  type="radio" name="optionChoosen" value="<%=lst.getOptionId()%>" id="getOption">
								</div>
								<div class="fl ans"><%=lst.getOptionText()%></div>
							</div>
							<%} %>
							<div class="btn_bx clearfix">
							<input type="hidden" name="questionId" id="questionId"	value="<%=latest.getQuestionId()%>">
							<input type="hidden" name="questionnaireId" id="questionnaireId" value="<%=latest.getQuestionnaireId()%>">
						    <input 	type="submit" value="Submit" class="login_btn fl" id="save">
							<input type="submit" value="Cancel" class="login_btn fl" id="cancle">
							</div>
						</div>
						</form>
					</div>
					</div>
			</div>
			<!-- end of "last-poll" id -->
			<div class="current-poll clearfix fr"></div>
			<!-- end of "current-poll" id -->
		</div>
		<!-- end of "inner-contents-polls" id -->
	</div>
	<!-- end of "contents" id -->


</div>
<!-- End of "wrapper" id -->



