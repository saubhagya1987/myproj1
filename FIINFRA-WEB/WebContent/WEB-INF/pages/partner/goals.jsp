<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>Goals</title>
<script src="<%=request.getContextPath()%>/js/googleChartApi.js"></script>
<link rel="stylesheet" href="https://www.google.com/jsapi" type="text/css">
<!-- Do not delete -->
<style>
.infobox { height: 125px !important }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
        <input id="contextPath" type="hidden" name="contextPath" 
		value="<%=request.getContextPath()%>" />
        <!--css popup window start 1--> 
        
        <!-- Center part start -->
        <section>
          <div class="">
            <div class="page-header clearfix">
              <h1 class="pull-left">Managed Goal Summary</h1>
              <div class="nav-search pull-right hide" id="">
                <form class="form-search">
                  <span class="input-icon">
                  <input type="text"
										placeholder="Search ..." class="nav-search-input"
										id="search" autocomplete="off">
                  <i
										class="ace-icon fa fa-search nav-search-icon"></i></span>
                </form>
              </div>
            </div>
            <div class="container-body" style="margin-top:0px;margin-top:10px;"> 
              <!-- center -->
              <div class="col-md-12 padding_top" style="margin-top:0px;">
                <div class="col-md-8 list-group" style="padding-left:10px;">
                  <div class="head list-group-item active">Goals by Type</div>
                  <div class="goaldashoard list-group-item">
                    <ul class="clearfix list-unstyled">
                      <li class="pull-left neswspace1">
                        <div class="centerAll goaltype1 infobox infobox-green infobox-small infobox-dark" style="line-height: 12px;">
                          <label id="goalName">Higher Education</label>
                          <div class="calign2"><a href="goalsgrid.html"><a onclick="getGoalList('goalTypeIDEdu','GoalByType')"  title="Education">
                            <input type="hidden" name="goalTypeIDEdu" id="goalTypeIDEdu" value>
                            <i class="fa fa-graduation-cap white bigger-300"></i></a></a></div>
                          <div class="goaltype1white" id="heduAmount"></div>
                          <div><span class="badge" id="heduCount"></span></div>
                        </div>
                      </li>
                      <li class="pull-left neswspace1">
                        <div class="centerAll goaltype1 bggoalm infobox infobox-red infobox-small infobox-dark">Marriage
                          <div class="calign1"><a  onclick="getGoalList('goalTypeIDMarrege','GoalByType')" title="Marriage"> <i class="fa icon-wedding white size-48"></i></a>
                            <input type="hidden" name="goalTypeIDMarrege" id="goalTypeIDMarrege" value>
                          </div>
                          <div class="goaltype1white" id="mamount"></div>
                          <div><span class="badge" id="mcount"></span></div>
                        </div>
                      </li>
                      <li class="pull-left neswspace1">
                        <div class="centerAll goaltype1 bggoalh infobox infobox-orange infobox-small infobox-dark">Property or House
                          <div class="calign2"><a onclick="getGoalList('goalTypeIDProperty','GoalByType')" title="House"> <i class="fa fa-home white bigger-300"></i></a>
                            <input type="hidden" name="goalTypeIDProperty" id="goalTypeIDProperty" value>
                          </div>
                          <div class="goaltype1white" id="phamount"></div>
                          <div><span class="badge" id="phcount"></span></div>
                        </div>
                      </li>
                      <li class="pull-left neswspace1">
                        <div  class="centerAll goaltype1 bggoalcar infobox infobox-blue infobox-small infobox-dark">Car
                          <div class="calign1"><a onclick="getGoalList('goalTypeIDCar','GoalByType')" title="Car"> <i class="fa fa-car white bigger-300"></i></a>
                            <input type="hidden" name="goalTypeIDCar" id="goalTypeIDCar" value>
                          </div>
                          <div class="goaltype1white" id="caramount"></div>
                          <div><span class="badge" id="carcount"></span></div>
                        </div>
                      </li>
                      <li class="pull-left neswspace1">
                        <div class="centerAll goaltype1 bggoalv infobox infobox-green infobox-small infobox-dark">Travel or Vacation
                          <div class="calign2"><a onclick="getGoalList('goalTypeIDTravel','GoalByType')" title="Vacation"> <i class="fa fa-map-marker white bigger-300"></i></a>
                            <input type="hidden" name="goalTypeIDTravel" id="goalTypeIDTravel" value>
                          </div>
                          <div class="goaltype1white" id="tvamount"></div>
                          <div><span class="badge" id="tvcount"></span></div>
                        </div>
                      </li>
                      <li class="pull-left neswspace1">
                        <div class="centerAll goaltype1 bggoalr infobox infobox-blue infobox-small infobox-dark">Retirement
                          <div class="calign1"><a onclick="getGoalList('goalTypeIDRetirment','GoalByType')" title="Retirement"> <i class="fa icon-retirement white size-48"></i></a>
                            <input type="hidden" name="goalTypeIDRetirment" id="goalTypeIDRetirment" value>
                          </div>
                          <div class="goaltype1white" id="retirmentAmount"></div>
                          <div><span class="badge" id="retirmentCount"></span></div>
                        </div>
                      </li>
                      <li class="pull-left neswspace1">
                        <div class="centerAll goaltype1 bggoalp infobox infobox-green infobox-small infobox-dark">Parental Responsibility
                          <div class="calign2"><a onclick="getGoalList('goalTypeIDParentalR','GoalByType')" title="Parental Responsibility"><i class="fa icon-parental-goal white bigger-300"></i></a>
                            <input type="hidden" name="goalTypeIDParentalR" id="goalTypeIDParentalR" value>
                          </div>
                          <div class="goaltype1white" id="parentalResponsibilityAmount" ></div>
                          <div><span class="badge" id="parentalResponsibilityCount"></span></div>
                        </div>
                      </li>
                      <li class="pull-left neswspace1">
                        <div class="centerAll goaltype1 bggoalsb infobox infobox-red infobox-small infobox-dark">Start Business
                          <div class="calign1"><a onclick="getGoalList('goalTypeIDStartB','GoalByType')" title="Start Business"><i class="fa fa-cogs white bigger-300"></i></a>
                            <input type="hidden" name="goalTypeIDStartB" id="goalTypeIDStartB" value>
                          </div>
                          <div class="goaltype1white" id="startBusinessAmount"></div>
                          <div><span class="badge" id="startBusinessCount"></span></div>
                        </div>
                      </li>
                      <li class="pull-left neswspace1">
                        <div class="centerAll goaltype1 bggoalo infobox infobox-orange infobox-small infobox-dark">Others
                          <div class="calign1"><a onclick="getGoalList('goalTypeIDOther','GoalByType')" title="Others"><i class="fa icon-others white size-48"></i></a>
                            <input type="hidden" name="goalTypeIDOther" id="goalTypeIDOther" value>
                          </div>
                          <div class="goaltype1white" id="otherAmount"></div>
                          <div><span class="badge" id="otherCount"></span></div>
                        </div>
                      </li>
                      <li class="pull-left neswspace1">
                        <div class="centerAll goaltype1 bggoalo infobox infobox-blue infobox-small infobox-dark">Target Corpus
                          <div class="calign1"><a onclick="getGoalList('goalTypeIDTargetCorpus','GoalByType')" title="Others"><i class="fa icon-target_corpus white size-48"></i></a>
                            <input type="hidden" name="goalTypeIDTargetCorpus" id="goalTypeIDTargetCorpus" value>
                          </div>
                          <div class="goaltype1white" id="TargetCorpusAmount"></div>
                          <div><span class="badge" id="TargetCorpusCount"></span></div>
                        </div>
                      </li>
                    </ul>
                    <br>
                  </div>
                  <!-- goaldashoard closed --> 
                </div>
                <!-- col-md-8 closed  -->
                
                <div class="col-md-4 list-group" style="padding-left:10px;">
                  <div class="head list-group-item active">Goals by Duration</div>
                  <div class="goaldashoard list-group-item">
                    <div class="goalduration" id="goalDurationName1" style="margin-top:10px;">0-3 Yrs<a onclick="getGoalListByAmount('GoalByDuration','1')" style="text-decoration:none;"><span class="goaltext" id="count1">(0)</span></a><span class="goaltext"></span>
                      <div class="progress progress-sm"  style="width: 100%;">
                        <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" id="progressbar0-3" style=""></div>
                      </div>
                    </div>
                    <div class="goalduration">4-6 Yrs<a onclick="getGoalListByAmount('GoalByDuration','2')" style="text-decoration:none;"><span class="goaltext" id="count2">(0)</span></a>
                      <div class="progress progress-sm"  style="width: 100%;">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="progressbar3-6" style=""></div>
                      </div>
                    </div>
                    <div class="goalduration">7-10 Yrs<a onclick="getGoalListByAmount('GoalByDuration','3')"style="text-decoration:none;"><span class="goaltext" id="count3">(0)</span></a>
                      <div class="progress progress-sm"  style="width: 100%;">
                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="progressbar6-10" style=""></div>
                      </div>
                    </div>
                    <div class="goalduration">11-14 Yrs<a onclick="getGoalListByAmount('GoalByDuration','4')" style="text-decoration:none;"><span class="goaltext" id="count4">(0)</span></a>
                      <div class="progress progress-sm"  style="width: 100%;">
                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="progressbar10-14" style=""></div>
                      </div>
                    </div>
                    <div class="goalduration">15-17 Yrs<a onclick="getGoalListByAmount('GoalByDuration','5')" style="text-decoration:none;"><span class="goaltext" id="count5">(0)</span></a>
                      <div class="progress progress-sm"  style="width: 100%;">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="progressbar14-17" style=""></div>
                      </div>
                    </div>
                    <div class="goalduration">18-20 Yrs<a onclick="getGoalListByAmount('GoalByDuration','6')" style="text-decoration:none;"><span class="goaltext" id="count6">(0)</span></a>
                      <div class="progress progress-sm"  style="width: 100%;">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="progressbar17-20" style=""></div>
                      </div>
                    </div>
                    <div class="goalduration">20+ Yrs<a onclick="getGoalListByAmount('GoalByDuration','7')" style="text-decoration:none;"><span class="goaltext" id="count7">(0)</span></a>
                      <div class="progress progress-sm"  style="width: 100%;">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="progressbar20above" style=""></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- col-md-12 closed -->
              <div class="clearfix"></div>
              <div  class="col-md-12 padding_top" style="margin-bottom:10px;">
                <div  class="col-md-6 padding_top list-group" style="padding-left:10px;">
                  <div class="head list-group-item active">Goals by Stage</div>
                  <div class="goaldashoard1 list-group-item">
                    <div class="calign" id="goalByStatusnew" style="display:block"> </div>
                  </div>
                </div>
                <div  class="col-md-6 padding_top list-group" style="padding-left:10px;">
                  <div class="head list-group-item active">Goals by Amount</div>
                  <div class="goaldashoard1 list-group-item">
                    <div class="calign" id="goalByAmount"> </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- container body closed --> 
          </div>
          <!-- container white closed --> 
        </section>
        <!-- Center part End -->
        
        <jsp:include page="../common/footer.jsp" />
<script type="text/javascript">
var hidePopupTimeoutId;
google.load("visualization", "1", {
 	packages : [ "corechart"]
// packages:['gauge']
});

$(function(){
	showSelectedTab('goalsLink');
 		displayOppByStatusChart(365,'365');
 		
// 		displayGoalByStage();
		drawgoalChart();
	
}) ;

function displayOppByStatusChart(criteria, label) {
	isDataAvailable = true;
	$('#goalByAmount').show();
	//$('#OppChartbyStatus').hide();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/partner/showPieChart.htm?type=goalByAmount',
		success : function(result) {
			var firstRow = new Array();
			firstRow.push('Opp');
			firstRow.push('Opp By Status');
			var title = '';
					//+ $("#leadSourceRange option:selected").text();
			var divId = 'goalByAmount';
			var outerArray = create2dArray(result, firstRow);
			
			drawCharts(outerArray, title, divId);

//				if (isDataAvailable == false) {
//					$('#OppChartbyStatus').hide();
//					//$('#nodata1').show();

//				}else{
//					$('#OppChartbyStatus').show();
//					//$('#nodata1').hide();
//				}
		}
	});
	
	
	function create2dArray(result, firstRow) {
		
		isDataAvailable = false;
		var innerArray = new Array();
		var outerArray = new Array();
		innerArray.push(firstRow[0]);
		innerArray.push(firstRow[1]);
		outerArray.push(innerArray);
		for ( var i = 0; i < result.length; i++) {

			innerArray = new Array();
			//alert(result[i].title);
			//alert(result[i].title);
			innerArray.push(result[i].title);
			innerArray.push(parseFloat(result[i].count));
			outerArray.push(innerArray);
			//alert(outerArray);
			if (result[i].value != 0) {
				isDataAvailable = true;
			}
		}
		return outerArray;
	}

	function drawCharts(outerArray, title, divId) {
		//alert(outerArray);
		var data = google.visualization.arrayToDataTable(outerArray);
		var options = {
			backgroundColor: 'transparent',	
			title : title,
			is3D: true
			,height: 370
			,width: '100%'
			//sliceVisibilityThreshold : 0
		};

		var chart = new google.visualization.PieChart(document
				.getElementById(divId));
		chart.draw(data, options);
		google.visualization.events.addListener(chart, 'select', function(){
		    var row = chart.getSelection()[0].row;
		    var element = data.getValue(row, 0);
		    element =  element.replace('Lacs','');
		    var getIndex ;
    		var firstElement ;
 		    var lastElement;
		    
		    		 getIndex =element.indexOf("-");
		    		 firstElement = element.substr(0,getIndex);
		 		     lastElement = element.substr(getIndex+1,element.length);

		   
// 		    alert('firstElement='+firstElement);
// 		    alert('lastElement='+lastElement);

         

		    
		   getGoalByAmount('GoalByAmount',firstElement,lastElement);
		  });

	}
}

// goalByStatus

function drawgoalChart() {
	
	$('#goalByAmount').show();
	//$('#OppChartbyStatus').hide();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/partner/showPieChart.htm?type=goalbystatus',
		success : function(result) {
			var firstRow = new Array();
			firstRow.push('Goal');
			firstRow.push('Amount in Lac');
			firstRow.push('Goal count');
			var title = '';
					//+ $("#leadSourceRange option:selected").text();
			var divId = 'goalByAmount';
			var outerArray = create2dArray(result, firstRow);
			
			//drawCharts(outerArray, title, divId);
			 var data = google.visualization.arrayToDataTable(outerArray);

			 
			 new google.visualization.ColumnChart(document.getElementById('goalByStatusnew')).
             draw(data,
                  {title:"",
                   width:'100%', height:370,
                   hAxis: {title: "Stage"}}
             );
			
		}
	});
	
}
function create2dArray(result, firstRow) {
	
	isDataAvailable = false;
	var innerArray = new Array();
	var outerArray = new Array();
	innerArray.push(firstRow[0]);
	innerArray.push(firstRow[1]);
	outerArray.push(innerArray);
	for ( var i = 0; i < result.length; i++) {

		innerArray = new Array();
		//alert(result[i].title);
		//alert(result[i].title);
		innerArray.push(result[i].title);
		innerArray.push(parseFloat(result[i].count));
		outerArray.push(innerArray);
		//alert(outerArray);
		if (result[i].value != 0) {
			isDataAvailable = true;
		}
	}
	return outerArray;
}
	
// 	 var data = google.visualization.arrayToDataTable([
// 	                                                   ['Status', 'Count'],
// 	                                                   ['New',  1336060 ],
// 	                                                   ['Open',  1538156 ],
// 	                                                   ['Closed',  1576579 ],
// 	                                                   ['Completed',  1600652 ],
// 	                                                   ['2007',  1968113 ],
// 	                                                   ['2008',  1901067 ]
// 	                                                 ]);

// 	                                                 // Create and draw the visualization.
// 	                                                 new google.visualization.ColumnChart(document.getElementById('goalByStatusnew')).
// 	                                                     draw(data,
// 	                                                          {title:"Yearly Coffee Consumption by Country",
// 	                                                           width:600, height:400,
// 	                                                           hAxis: {title: "Year"}}
// 	                                                     );
 // }


// $(".choose").live("mouseover", function () {
//     clearTimeout( hidePopupTimeoutId );
//     $(".tracker").show();
// });


// $(".choose").live("mouseout", function () {
//     hidePopupTimeoutId = setTimeout( function() {
//         $(".tracker").hide();
//     },500);
// });

// $(".tracker").live("mouseenter", function() {
//     clearTimeout( hidePopupTimeoutId );
// });


// $(".tracker").live("mouseleave", function() {
//     $(".tracker").hide();
// });
 $(document).ready(function() {
// 	 var $jq_1_9_2 = $.noConflict();

	 retriveGoalSummery();
	 
	 
	
 });

function retriveGoalSummery()
{
	
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()
				+ '/goal/getGoalSummaryDetails.htm',
		success : function(result) {
			//alert('in success');
			///result = JSON.parse(result);
			var goalByTypeList = result[0];
			var goalByDurationList = result[1];
			var goalByStatusList = result[2];
			
			$(goalByTypeList).each(
					function(i, obj) {
						
						var goalName = obj.goalName;
						var goalAmount = obj.goalAmount;
						var goalByTypeCount = obj.goalByTypeCount;
						var goalTypeId = obj.goalTypeId;
// 						alert('goalName='+goalName);
// 						alert('goalTypeId='+goalTypeId);
						//alert('goalAmount='+goalAmount);
						if(goalAmount==null || goalAmount =='')
							{
							goalAmount = 0;
							}
						if(goalByTypeCount==null || goalByTypeCount=='')
							{
							goalByTypeCount = 0;
							}
						if(obj.goalName=='Higher Education')
						{
							//alert('in HE');
							$('#heduCount').html(goalByTypeCount);
							$('#heduAmount').html(goalAmount);
							$('#goalTypeIDEdu').val(goalTypeId);
						}
						else if(obj.goalName=='Marriage')
							{
								$('#mcount').html(goalByTypeCount);
								$('#mamount').html(goalAmount);
								$('#goalTypeIDMarrege').val(goalTypeId);
							}
						else if(obj.goalName=='Property or House')
						{
							$('#phcount').html(goalByTypeCount);
							$('#phamount').html(goalAmount);
							$('#goalTypeIDProperty').val(goalTypeId);
						}
						else if(obj.goalName=='Car')
						{
							$('#carcount').html(goalByTypeCount);
							$('#caramount').html(goalAmount);
							$('#goalTypeIDCar').val(goalTypeId);
						}
						else if(obj.goalName=='Travel or Vacation')
						{
							$('#tvcount').html(goalByTypeCount);
							$('#tvamount').html(goalAmount);
							$('#goalTypeIDTravel').val(goalTypeId);
						}
						else if(obj.goalName=='Retirement')
						{
							$('#retirmentCount').html(goalByTypeCount);
							$('#retirmentAmount').html(goalAmount);
							$('#goalTypeIDRetirment').val(goalTypeId);
						}
						else if(obj.goalName=='Asset')
						{
							$('#assetCount').html(goalByTypeCount);
							$('#assetAmount').html(goalAmount);
							$('#goalTypeIDAsset').val(goalTypeId);
						}
						else if(obj.goalName=='Emergency')
						{
							$('#emergencyCount').html(goalByTypeCount);
							$('#emergencyAmount').html(goalAmount);
							$('#goalTypeIDEmergency').val(goalTypeId);
						}
						else if(obj.goalName=='Parental Responsibility')
						{
							$('#parentalResponsibilityCount').html(goalByTypeCount);
							$('#parentalResponsibilityAmount').html(goalAmount);
							$('#goalTypeIDParentalR').val(goalTypeId);
						}
						else if(obj.goalName=='Start Business')
						{
							$('#startBusinessCount').html(goalByTypeCount);
							$('#startBusinessAmount').html(goalAmount);
							$('#goalTypeIDStartB').val(goalTypeId);
						}
						else if(obj.goalName=='Target Corpus'){
							$('#TargetCorpusCount').html(goalByTypeCount);
							$('#TargetCorpusAmount').html(goalAmount);
							$('#goalTypeIDTargetCorpus').val(goalTypeId);
						} else if(obj.goalName=='Others'){
							$('#otherCount').html(goalByTypeCount);
							$('#otherAmount').html(goalAmount);
							$('#goalTypeIDOther').val(goalTypeId);
						}
						//alert('goalAmount='+goalAmount);
					});
			var totalGoalByDurationCount =0;;
			$(goalByDurationList).each(
					function(i, obj) {
						var goalDurayionName = obj.goalDurayionName;
						var goalByDurationCount = obj.goalByDurationCount;
						
						 totalGoalByDurationCount =totalGoalByDurationCount+parseInt(goalByDurationCount);
						
						if(goalDurayionName=='0-3')
						{

// 						$('#goalDurationName1').html(goalDurayionName);
						$('#count1').html('('+goalByDurationCount+')');
						}
						else if(goalDurayionName=='4-6')
							{
							$('#count2').html('('+goalByDurationCount+')');
							}
						else if(goalDurayionName=='7-10')
						{
						$('#count3').html('('+goalByDurationCount+')');
						}
						else if(goalDurayionName=='11-14')
						{
						$('#count4').html('('+goalByDurationCount+')');
						}
						else if(goalDurayionName=='15-17')
						{
						$('#count5').html('('+goalByDurationCount+')');
						}
						else if(goalDurayionName=='18-20')
						{
						$('#count6').html('('+goalByDurationCount+')');
						}
						else if(goalDurayionName=='20+')
						{
						$('#count7').html('('+goalByDurationCount+')');
						}
						
					});
// 			alert('totalGoalByDurationCount='+totalGoalByDurationCount);
			var couterValue1 = $('#count1').text().replace('(','');
			couterValue1 = couterValue1.replace(')','');
			var width1=(couterValue1/parseInt(totalGoalByDurationCount))*100;
			$('#progressbar0-3').css('width',width1 +'%');
			
			var couterValue2 = $('#count2').text().replace('(',''); 
			couterValue2 =couterValue2.replace(')','');
			var width2=(couterValue2/parseInt(totalGoalByDurationCount))*100;
			$('#progressbar3-6').css('width',width2 +'%');
			
			var couterValue3 = $('#count3').text().replace('(','');
			couterValue3=couterValue3.replace(')','');
			var width3=(couterValue3/parseInt(totalGoalByDurationCount))*100;
			$('#progressbar6-10').css('width',width3 +'%');
			
			var couterValue4 = $('#count4').text().replace('(','');
			couterValue4 = couterValue4.replace(')','');
// 			alert('couterValue4='+couterValue4);
			var width4=(couterValue4/parseInt(totalGoalByDurationCount))*100;
			$('#progressbar10-14').css('width',width4 +'%');
			
			var couterValue5 = $('#count5').text().replace('(','');
			couterValue5 = couterValue5.replace(')','');
// 			alert('couterValue4='+couterValue4);
			var width5=(couterValue5/parseInt(totalGoalByDurationCount))*100;
			$('#progressbar14-17').css('width',width5 +'%');
			
			var couterValue6 = $('#count6').text().replace('(','');
			couterValue6 = couterValue6.replace(')','');
// 			alert('couterValue4='+couterValue4);
			var width6=(couterValue6/parseInt(totalGoalByDurationCount))*100;
			$('#progressbar17-20').css('width',width6 +'%');
			
			var couterValue7 = $('#count7').text().replace('(','');
			couterValue7 = couterValue7.replace(')','');
// 			alert('couterValue4='+couterValue4);
			var width7=(couterValue7/parseInt(totalGoalByDurationCount))*100;
			$('#progressbar20above').css('width',width7 +'%');
		
// 			var innerArray = new Array();
// 			var periodArray = new Array();
// 			var amountArray = new Array();
// 			var outerArray = new Array();
			
// 				$(goalByStatusList).each(
// 					function(i, obj) {
// 						//alert('(obj.goalStatus='+obj.goalStatus);
// 						innerArray.push(obj.goalStatus);
// 						periodArray.push(obj.goalByStatusCount);
// 						amountArray.push(obj.goalByStatusAmount);
// 						outerArray.push(obj.goalStatus);
// 						outerArray.push(obj.goalByStatusCount);
// 						outerArray.push(obj.goalByStatusAmount);
						
// 					});
// 				var title = '';
// 				var divId = 'goalByStatus';
			

// 				var data = google.visualization.arrayToDataTable(outerArray);
// 				var options = {
// 					title : 'Opportunities Conversion Ratio',
// 					hAxis : {
// 						title : 'Period',
// 						titleTextStyle : {
// 							color : 'red'
// 						}
// 					}
// 				};
// 				var chart = new google.visualization.ColumnChart(document
// 						.getElementById('goalByStatus'));
// 				chart.draw(data, options);
				//alert(result); 
				
				//var periodArray = [ 'January','December','November','October','September','AUGUST'];
				
			
				
		}
	});
				
				
}
function getGoalList(elementId,condition)
{
	//alert('elementId='+elementId);
	//alert('actual Value='+$('#'+elementId).val());
	var parameterValue = $('#'+elementId).val();
	//alert('parameterValue='+parameterValue)
	window.location.href = $('#contextPath').val()+"/goal/getGoalList.htm?condition="+condition+'&parameterValue='+parameterValue;
}
function getGoalListByAmount(a , b)
{
	window.location.href = $('#contextPath').val()+"/goal/getGoalList.htm?condition="+a+'&parameterValue='+b;
}
function getGoalByAmount(condition,firstElement,lastElement)
{
  if($.trim(lastElement)=='100+')
	  {
	    firstElement=100
	    lastElement=1000000
	    window.location.href = $('#contextPath').val()+"/goal/getGoalList.htm?condition="+condition+'&parameterValue=0'+'&firstElement='+firstElement+'&lastElement='+lastElement;
	  }
  else
	window.location.href = $('#contextPath').val()+"/goal/getGoalList.htm?condition="+condition+'&parameterValue=0'+'&firstElement='+firstElement+'&lastElement='+lastElement;
}


</script>
<script>
// For responsive charts
  $(window).resize(function(){
	  displayOppByStatusChart(365,'365');
 drawgoalChart();
 
  
  });

</script>

</body>
</html>