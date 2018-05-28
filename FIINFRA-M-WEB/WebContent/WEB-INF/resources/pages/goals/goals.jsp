<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery_ui_range_slider.js"></script>
<!-- Goals Chart starts -->
<script src="${pageContext.request.contextPath}/resources/js/plugin/highcharts/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/highcharts/exporting.js"></script> --%>
<!-- Goals Chart ends -->

<script>
            $(document).ready(function() {
				
				 /* custom scroll to "common_in_content" */
                $('.common_in_content').slimScroll();
                $('.goals_in_content').slimScroll();
				 $('li.input_txt_three .cust_email').perfectScrollbar();
				 $('.range_counter').perfectScrollbar();
				
                $("select").selectBoxIt();
                // Calls the selectBoxIt method on your HTML select box

                $('.gl-dragger').on('click', function() {
				$('li.input_txt_three .cust_email').perfectScrollbar('update');	
                    var goal = this.id;
                    goal = goal.replace('dgr-', '');
                    if (goal != 'car') {
                        $('.goals_list_bx02').hide();
                    }
                    $('.bx-goal').not('#bx-' + goal).slideUp();
                    $('.gl-dragger').not(this).removeClass('active');
                    $('#bx-' + goal).slideToggle();
					$('li.input_txt_three .cust_email').perfectScrollbar('update');	
                    $('.gl-dragger').not(this).children('span').removeClass('goals_div_dragger_up');
                    $(this).children('span').animate('slow').toggleClass('goals_div_dragger_up', 'slow');
                    if ($(this).hasClass('active')) {
                        $(this).removeClass('active');
                    } else {
                        $(this).addClass('active');
                    }
                });

                /* Alrternate row color */
                $(".records_ul:even").addClass("even_row");
                $(".records_ul:odd").addClass("odd_row");

                /* Common Custom checkbox */
                $(".common_custom_checkbox").click(function() {
                    $(this).toggleClass("common_custom_checkbox_checked");
                    if ($(this).next(".default_checkbox").is(":checked")) {
                        $(this).next(".default_checkbox").prop("checked", false);
                    } else {
                        $(this).next(".default_checkbox").prop("checked", true);
                    }
                });


            });
        </script>
<!--Common Custom checkbox ends-->
      <style type="text/css">
.goals_list_bx ul li{ width:100%}
#wrap-tooltips { display:none; position:absolute; }
ul.tooltip { list-style:none; display:inline-block;/*border: solid 1px #952754;border-radius: 5px;*/ margin:0; padding:0 }
ul.tooltip li { }
ul.tooltip li.header { background-color: #E9E9E9; width:100% }
ul.tooltip li span.col { width:30%; height:30px; line-height:30px; vertical-align:middle; padding: 3px 5px; display:inline-block; text-align:center; border-right: solid 1px #EAEAEA }
ul.tooltip li span.col.name { width: 100px; color: #000; text-align: left }
ul.tooltip li.header span.col.name { width: 100px; }
ul.tooltip li span.col:last-child { border: 0 }
ul.tooltip li span { font-weight: bold }
.btn-toggle { width: 100px; left: 70px; }
.btn-toggle .lbl, .btn-toggle a { width: 50px; min-width: 40px; height:30px; display:inline-block; float:left; line-height:30px; vertical-align:middle; font-size:12px; text-align: center; font-family: "allerregular"; font-size: 12px; color:#FFF; text-shadow: 1px 1px 1px #000; }
#bx-car .btn-toggle { left: 70px }
#bx-edu .btn-toggle { left: 840px }
#bx-travel .btn-toggle { left: 320px }
#bx-wedding .btn-toggle { left: 590px }
#bx-business .btn-toggle { left: 70px }
#bx-corpus .btn-toggle { left: 70px }
#bx-other .btn-toggle { left: 332px }
#bx-special .btn-toggle { left: 590px }
#bx-property .btn-toggle { left: 840px }
#grf-car { margin-top: 3px; }
#grf-travel { margin-top: 3px; }
#grf-edu { margin-top: 3px; }
#grf-prop { margin-top: 3px; }
</style>
        <script type="text/javascript">
            //$(document).ready(function() {
               
            	var arrGoalsEdu =[];
            	var arrGoalsTra =[];
            	var arrGoalsWed =[];
            	var arrGoalsCar =[];
            	var arrGoalsPro =[];
            	var arrGoalsBus =[];
            	var arrGoalsSpe =[];
            	var arrGoalsOth =[];
            	
            	var map = new Object();
            	
                function showTooltip(name, goaltype) {
                    var goal = null; //arrGoals[name];
                    var strd = ''; 
                    if(goaltype=='edu'){
                    	goal = arrGoalsEdu[name];
                    }else if(goaltype=='tra'){
                    	goal = arrGoalsTra[name];
                    }else if(goaltype=='wed'){
                    	goal = arrGoalsWed[name];
                    }else if(goaltype=='car'){
                    	goal = arrGoalsCar[name];
                    }else if(goaltype=='pro'){
                    	goal = arrGoalsPro[name];
                    }else if(goaltype=='bus'){
                    	goal = arrGoalsBus[name];
                    }else if(goaltype=='spe'){
                    	goal = arrGoalsSpe[name];
                    }else if(goaltype=='oth'){
                    	goal = arrGoalsOth[name];
                    }
                        
                        strd = '<li class="header"><span class="col name">Goal Stage</span><span class="col">No. of Goals</span><span class="col">Cost</span></li>';
                    if (goal !== undefined) {
                        var st = '<ul class="tooltip">';
                        st += strd;

                        $.each(goal.cars, function(k, carm) {
                            $.each(carm, function(k, car) {
                                st += '<li><span class="col name">' + name + '</span><span class="col">' + car['nofc'] + '</span><span class="col">' + car['cost'] + ' Lacs</span></li>';
                            });
                        });
                        st += '</ul>';
                    }
                    return st;
                }                                

                function RenderPieChart(elementId, dataList, goaltype) {                	
                    new Highcharts.Chart({
                        chart: {
                            renderTo: elementId,
                            plotBackgroundColor: null,
                            plotBorderWidth: null,
                            plotShadow: false
                        }, title: {
                            text: ''
                        },
                        tooltip: {
                            useHTML: true,
                            borderColor: '#000',
                            borderRadius: 5,
                            formatter: function() {
                               return '<div style="min-width:350px" id="wrap-tooltips1">' + showTooltip(this.point.name, goaltype) + '</div>';
                            }
                        },
                        plotOptions: {
                            pie: {
                                allowPointSelect: true,
                                cursor: 'pointer',
                                dataLabels: {
                                    enabled: true,
                                    color: '#000000',
                                    connectorColor: '#000000',
                                    formatter: function() {
                                        return '<b>' + this.point.name + '</b>: ' + this.percentage.toFixed(2)+ ' %';//Math.round(
                                    }
                                }
                            }
                        },
                        series: [{
                                type: 'pie',
                                name: 'Browser share',
                                data: dataList
                            }]
                    });
                }                                 
                
                 function createToolTipEdu(title,count,amount){
                	 arrGoalsEdu['('+ title +')'] = {                      		
                                'totalamount': count,
                                'cars': [{
                                 '' : {'nofc': count, 'cost': amount}
                              }]
                          }
                }
                 
                 function createToolTipTra(title,count,amount){
                	 arrGoalsTra['('+ title +')'] = {                      		
                                'totalamount': count,
                                'cars': [{
                                 '' : {'nofc': count, 'cost': amount}
                              }]
                          }
                }
                 
                 function createToolTipWed(title,count,amount){
                	 arrGoalsWed['('+ title +')'] = {                      		
                                'totalamount': count,
                                'cars': [{
                                 '' : {'nofc': count, 'cost': amount}
                              }]
                          }
                }
                 
                 function createToolTipCar(title,count,amount){
                	 arrGoalsCar['('+ title +')'] = {                      		
                                'totalamount': count,
                                'cars': [{
                                 '' : {'nofc': count, 'cost': amount}
                              }]
                          }
                }
                 
                 function createToolTipPro(title,count,amount){
                	 arrGoalsPro['('+ title +')'] = {                      		
                                'totalamount': count,
                                'cars': [{
                                 '' : {'nofc': count, 'cost': amount}
                              }]
                          }
                }
                 
                 function createToolTipBus(title,count,amount){
                	 arrGoalsBus['('+ title +')'] = {                      		
                                'totalamount': count,
                                'cars': [{
                                 '' : {'nofc': count, 'cost': amount}
                              }]
                          }
                }
                 
                 function createToolTipSpe(title,count,amount){
                	 arrGoalsSpe['('+ title +')'] = {                      		
                                'totalamount': count,
                                'cars': [{
                                 '' : {'nofc': count, 'cost': amount}
                              }]
                          }
                }
                 
                 function createToolTipOth(title,count,amount){
                	 arrGoalsOth['('+ title +')'] = {                      		
                                'totalamount': count,
                                'cars': [{
                                 '' : {'nofc': count, 'cost': amount}
                              }]
                          }
                }
                                               
        </script>

<div class="" id="goals"> 
  <!-- Main starts-->
  <section class="main"> 
    
    <!-- Common_content Starts-->
    <section class=""> 
      
      <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content clearfix goals_bx_in"> 
        <!-- inside goal page class-->
        <div class="top_bx">
          <ul class="top_bx_ul_bx clearfix">
            <li>
              <div class="top_bx_in">
                <div class="education"></div>
              </div>
              <div class="middle_bx_in">
                <div class="top">
                  <div class="form_label">No. of Goals : </div>
                  <div class="counter_parent">
                    <input type="text" class="range_counter" id="educationGoals" value="${fn:length(educationGoalsList)}" readonly="readonly" />
                  </div>
                </div>
                <div class="bottom clearfix">
                  <div class="form_label">Total Goal Amt : </div>
                  <div class="counter_parent fr">
                    <span class="range_counter" id="educationGoalsAmt"><fmt:formatNumber type="number" maxFractionDigits="2" value="${educationGoalAmount}" /></span>
                     <span class="unit">lacs</span> </div>
                </div>
              </div>
              <div class="bottom_bx_in">
                <div id="dgr-car" class="gl-dragger goals_div_dragger"><span class=""></span></div>
              </div>
            </li>
            <!--Travel-->
            <li>
              <div class="top_bx_in">
                <div class="travel"></div>
              </div>
              <div class="middle_bx_in">
                <div class="top">
                  <div class="form_label">No. of Goals : </div>
                  <div class="counter_parent">
                    <input type="text" class="range_counter" id="travelGoals" value="${fn:length(travelGoalsList)}" readonly="readonly" />
                  </div>
                </div>
                <div class="bottom clearfix">
                  <div class="form_label">Total Goal Amt : </div>
                  <div class="counter_parent fr">
                    <span class="range_counter" id="travelGoalsAmt"><fmt:formatNumber type="number" maxFractionDigits="2" value="${travelGoalAmount}" /></span>
                    <span class="unit">lacs</span></div>
                </div>
              </div>
              <div class="bottom_bx_in">
                <div id="dgr-travel" class="gl-dragger travel_goals_div_dragger"><span></span></div>
              </div>
            </li>
            <li>
              <div class="top_bx_in">
                <div class="wedding"></div>
              </div>
              <div class="middle_bx_in">
                <div class="top">
                  <div class="form_label">No. of Goals : </div>
                  <div class="counter_parent">
                    <input type="text" class="range_counter" id="weddingGoals" value="${fn:length(weddingGoalsList)}" readonly="readonly" />
                  </div>
                </div>
                <div class="bottom clearfix">
                  <div class="form_label">Total Goal Amt : </div>
                  <div class="counter_parent fr">
                   <%-- <input type="text" class="range_counter" id="weddingGoalsAmt" value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${weddingGoalAmount}" />
                    " readonly="readonly" />--%>
                    <span class="range_counter" id="weddingGoalsAmt"><fmt:formatNumber type="number" maxFractionDigits="2" value="${weddingGoalAmount}" /></span>
                     <span class="unit">lacs</span></div>
                </div>
              </div>
              <div class="bottom_bx_in">
                <div id="dgr-wedding" class="gl-dragger wedding_goals_div_dragger"><span></span></div>
              </div>
            </li>
            <li>
              <div class="top_bx_in">
                <div class="car"></div>
              </div>
              <div class="middle_bx_in">
                <div class="top">
                  <div class="form_label">No. of Goals : </div>
                  <div class="counter_parent">
                    <input type="text" class="range_counter" id="carGoals" value="${fn:length(carGoalsList)}" readonly="readonly" />
                  </div>
                </div>
                <div class="bottom clearfix">
                  <div class="form_label">Total Goal Amt : </div>
                  <div class="counter_parent fr">
          <span class="range_counter" id="carGoalsAmt"><fmt:formatNumber type="number" maxFractionDigits="2" value="${carsGoalAmount}" /></span>
                     <span class="unit">lacs</span></div>
                </div>
              </div>
              <div class="bottom_bx_in">
                <div id="dgr-edu" class="gl-dragger education_goals_div_dragger"><span></span></div>
              </div>
            </li>
          </ul>
          <div class="clr"></div>
        </div>
        <div id="bx-car" class="bx-goal car_goals_list_bx">
          <div class="goals_list_bx">
            <div class="btn-toggle common_sliding_radio"> <span class="lbl">Data</span> <span class="lbl">Graph</span></div>
            <div class="pnl-toggle">
              <ul>
                <li class="input_title_one">Sr. No.</li>
                <li class="input_title_two">Customer Name</li>
                <li class="input_title_three">E-mail</li>
                <li class="input_title_four">Phone</li>
                <li class="input_title_five">Goal Amount (FV)</li>
                <li class="input_title_six">Start Year</li>
                <li class="input_title_seven">End Year</li>
                <li class="input_title_eight">Completed (%)</li>
                <li class="input_title_nine">Goal Stage</li>
              </ul>
              <div class="clr"></div>
              <!--title--> 
              <!--txt list-->
              <div class="goals_in_content" id="educationGoalsDiv">
                <c:forEach items="${educationGoalsList}" var="educationGoals" varStatus="loopStatus">
                  <ul>
                    <li class="input_txt_one">${loopStatus.index + 1}</li>
                    <li class="input_txt_two">${educationGoals.name}</li>
                    <li class="input_txt_three"><span class="cust_email">${educationGoals.email}</span></li>
                    <li class="input_txt_four">${educationGoals.phone}</li>
                    <li class="input_txt_five">
                      <fmt:formatNumber type="number" 
            									maxFractionDigits="2" value="${educationGoals.amount}" />
                      lacs</li>
                    <li class="input_txt_six">${educationGoals.startYear}</li>
                    <li class="input_txt_seven">${educationGoals.startYear}</li>
                    <li class="input_txt_eight">
                      <c:choose>
                        <c:when test="${not empty educationGoals.percentGoal}"> ${educationGoals.percentGoal}% </c:when>
                        <c:otherwise> 0% </c:otherwise>
                      </c:choose>
                    </li>
                    <li class="input_txt_nine"> ${educationGoals.stage}
                     </li>
                    <div class="clr"></div>
                  </ul>
                </c:forEach>
              </div>
            </div>
            <div class="pnl-toggle">
              <div id="grf-edu"></div>
              <div class="clr"></div>
              <script>
                                    <c:forEach items="${educationGoalChartList}" var="goalChart" varStatus="rowCount">
                                    	createToolTipEdu('${goalChart.title}','${goalChart.count}','<fmt:formatNumber type="number" maxFractionDigits="2" value="${goalChart.amount}" />');
                                    </c:forEach>
                                    RenderPieChart('grf-edu', [
                                                               <c:forEach items="${educationGoalChartList}" var="goalChart" varStatus="rowCount">
                                                               ['(${goalChart.title})', ((${goalChart.count}/${fn:length(educationGoalsList)})*100)],                                                               
                                                               </c:forEach>
                                                           ], 'edu');
                                    </script> 
            </div>
          </div>
        </div>
        <!-- Car Goals List View--> 
        <!-- Travel Goals List View-->
        <div id="bx-travel" class="bx-goal travel_goals_list_bx">
          <div class="goals_list_bx">
            <div class="btn-toggle common_sliding_radio"> <span class="lbl">Data</span> <span class="lbl">Graph</span></div>
            <div class="pnl-toggle">
              <ul>
                <li class="input_title_one">Sr. No.</li>
                <li class="input_title_two">Customer Name</li>
                <li class="input_title_three">E-mail</li>
                <li class="input_title_four">Phone</li>
                <li class="input_title_five">Goal Amount (FV)</li>
                <li class="input_title_six">Start Year</li>
                <li class="input_title_seven">End Year</li>
                <li class="input_title_eight">Completed (%)</li>
                <li class="input_title_nine">Stage</li>
              </ul>
              <div class="clr"></div>
              <!--title--> 
              <!--txt list-->
              <div class="goals_in_content" id="travelGoalsDiv">
                <c:forEach items="${travelGoalsList}" var="travelGoals" varStatus="loopStatus">
                  <ul>
                    <li class="input_txt_one">${loopStatus.index + 1}</li>
                    <li class="input_txt_two">${travelGoals.name}</li>
                    <li class="input_txt_three"><span class="cust_email">${travelGoals.email}</span></li>
                    <li class="input_txt_four">${travelGoals.phone}</li>
                    <li class="input_txt_five">
                      <fmt:formatNumber type="number" 
            									maxFractionDigits="2" value="${travelGoals.amount}" />
                      lacs</li>
                    <li class="input_txt_six">${travelGoals.startYear}</li>
                    <li class="input_txt_seven">${travelGoals.startYear}</li>
                    <li class="input_txt_eight">
                      <c:choose>
                        <c:when test="${not empty travelGoals.percentGoal}"> ${travelGoals.percentGoal}% </c:when>
                        <c:otherwise> 0% </c:otherwise>
                      </c:choose>
                    </li>
                    <li class="input_txt_nine">
                    ${travelGoals.stage} </li>
                    <div class="clr"></div>
                  </ul>
                </c:forEach>
              </div>
            </div>
            <div class="pnl-toggle">
              <div id="grf-travel"></div>
              <div class="clr"></div>
              <script>
                                    <c:forEach items="${travelGoalChartList}" var="goalChart" varStatus="rowCount">
                                		createToolTipTra('${goalChart.title}','${goalChart.count}','<fmt:formatNumber type="number" maxFractionDigits="2" value="${goalChart.amount}" />');
                                	</c:forEach>
                                    RenderPieChart('grf-travel', [
															<c:forEach items="${travelGoalChartList}" var="goalChart" varStatus="rowCount">
															['(${goalChart.title})', ((${goalChart.count}/${fn:length(travelGoalsList)})*100)],                                                               
															</c:forEach>                    
                                                           ], 'tra');
             </script> 
            </div>
          </div>
        </div>
        <!-- Travel Goals List View--> 
        <!-- Wedding Goals List View-->
        <div id="bx-wedding" class="bx-goal wedding_goals_list_bx">
          <div class="goals_list_bx">
            <div class="btn-toggle common_sliding_radio"> <span class="lbl">Data</span> <span class="lbl">Graph</span></div>
            <div class="pnl-toggle"> 
              <!--title-->
              <ul>
                <li class="input_title_one">Sr. No.</li>
                <li class="input_title_two">Customer Name</li>
                <li class="input_title_three">E-mail</li>
                <li class="input_title_four">Phone</li>
                <li class="input_title_five">Goal Amount (FV)</li>
                <li class="input_title_six">Start Year</li>
                <li class="input_title_seven">End Year</li>
                <li class="input_title_eight">Completed (%)</li>
                <li class="input_title_nine">Status</li>
              </ul>
              <div class="clr"></div>
              <!--title--> 
              <!--txt list-->
              <div class="goals_in_content" id="weddingGoalsDiv">
                <c:forEach items="${weddingGoalsList}" var="weddingGoals" varStatus="loopStatus">
                  <ul>
                    <li class="input_txt_one">${loopStatus.index + 1}</li>
                    <li class="input_txt_two">${weddingGoals.name}</li>
                    <li class="input_txt_three"><span class="cust_email">${weddingGoals.email}</span></li>
                    <li class="input_txt_four">${weddingGoals.phone}</li>
                    <li class="input_txt_five">
                      <fmt:formatNumber type="number" 
            								maxFractionDigits="2" value="${weddingGoals.amount}" />
                      lacs</li>
                    <li class="input_txt_six">${weddingGoals.startYear}</li>
                    <li class="input_txt_seven">${weddingGoals.startYear}</li>
                    <li class="input_txt_eight">
                      <c:choose>
                        <c:when test="${not empty weddingGoals.percentGoal}"> ${weddingGoals.percentGoal}% </c:when>
                        <c:otherwise> 0% </c:otherwise>
                      </c:choose>
                    </li>
                    <li class="input_txt_nine">      
                      ${weddingGoals.stage} </li>
                    <div class="clr"></div>
                  </ul>
                </c:forEach>
              </div>
            </div>
            <div class="pnl-toggle">
              <div id="grf-wedding"></div>
              <div class="clr"></div>
              <script>
                                    <c:forEach items="${weddingGoalChartList}" var="goalChart" varStatus="rowCount">
                                		createToolTipWed('${goalChart.title}','${goalChart.count}','<fmt:formatNumber type="number" maxFractionDigits="2" value="${goalChart.amount}" />');
                                	</c:forEach>
                                    RenderPieChart('grf-wedding', [
														<c:forEach items="${weddingGoalChartList}" var="goalChart" varStatus="rowCount">
														['(${goalChart.title})', ((${goalChart.count}/${fn:length(weddingGoalsList)})*100)],                                                               
														</c:forEach>                   
                                                           ], 'wed');
            </script> 
            </div>
          </div>
        </div>
        <!-- Wedding Goals List View--> 
        <!-- Education Goals List View-->
        <div id="bx-edu" class="bx-goal education_goals_list_bx">
          <div class="goals_list_bx">
            <div class="btn-toggle common_sliding_radio"> <span class="lbl">Data</span> <span class="lbl">Graph</span></div>
            <div class="pnl-toggle">
              <ul>
                <li class="input_title_one">Sr. No.</li>
                <li class="input_title_two">Customer Name</li>
                <li class="input_title_three">E-mail</li>
                <li class="input_title_four">Phone</li>
                <li class="input_title_five">Goal Amount (FV)</li>
                <li class="input_title_six">Start Year</li>
                <li class="input_title_seven">End Year</li>
                <li class="input_title_eight">Completed (%)</li>
                <li class="input_title_nine">Status</li>
              </ul>
              <div class="clr"></div>
              <!--title--> 
              <!--txt list-->
              <div class="goals_in_content" id="carGoalsDiv">
                <c:forEach items="${carGoalsList}" var="carGoals" varStatus="loopStatus">
                  <ul>
                    <li class="input_txt_one">${loopStatus.index + 1}</li>
                    <li class="input_txt_two">${carGoals.name}</li>
                    <li class="input_txt_three"><span class="cust_email">${carGoals.email}</span></li>
                    <li class="input_txt_four">${carGoals.phone}</li>
                    <li class="input_txt_five">
                      <fmt:formatNumber type="number" 
            									maxFractionDigits="2" value="${carGoals.amount}" />
                      lacs</li>
                    <li class="input_txt_six">${carGoals.startYear}</li>
                    <li class="input_txt_seven">${carGoals.startYear}</li>
                    <li class="input_txt_eight">
                      <c:choose>
                        <c:when test="${not empty carGoals.percentGoal}"> ${carGoals.percentGoal}% </c:when>
                        <c:otherwise> 0% </c:otherwise>
                      </c:choose>
                    </li>
                    <li class="input_txt_nine">
 					   ${carGoals.stage} </li>
                    <div class="clr"></div>
                  </ul>
                </c:forEach>
              </div>
            </div>
            <div class="pnl-toggle">
              <div id="grf-car"></div>
              <div class="clr"></div>
              <script>
                                    <c:forEach items="${carGoalChartList}" var="goalChart" varStatus="rowCount">
                            			createToolTipCar('${goalChart.title}','${goalChart.count}','<fmt:formatNumber type="number" maxFractionDigits="2" value="${goalChart.amount}" />');
                            		</c:forEach>
                                    RenderPieChart('grf-car', [
														<c:forEach items="${carGoalChartList}" var="goalChart" varStatus="rowCount">
														['(${goalChart.title})', ((${goalChart.count}/${fn:length(carGoalsList)})*100)],                                                               
														</c:forEach>                    
                                                           ], 'car');
                                    </script> 
            </div>
          </div>
        </div>
        <!-- Education Goals List View-->
        <div class="top_bx southspace6">
          <ul class="top_bx_ul_bx clearfix">
            <li>
              <div class="top_bx_in">
                <div class="property_goal"></div>
              </div>
              <div class="middle_bx_in">
                <div class="top">
                  <div class="form_label">No. of Goals : </div>
                  <div class="counter_parent">
                    <input type="text" class="range_counter" id="propertyGoals" value="${fn:length(propertyGoalsList)}" readonly="readonly" />
                  </div>
                </div>
                <div class="bottom clearfix">
                  <div class="form_label">Total Goal Amt : </div>
                  <div class="counter_parent fr">
                  <span class="range_counter" id="propertyGoalsAmt"><fmt:formatNumber type="number" maxFractionDigits="2" value="${propertyGoalAmount}" /></span>
                    <span class="unit">lacs</span></div>
                </div>
              </div>
              <div class="bottom_bx_in">
                <div id="dgr-business" class="gl-dragger business_goals_div_dragger"><span></span></div>
              </div>
            </li>
            <li>
              <div class="top_bx_in">
                <div class="business"></div>
              </div>
              <div class="middle_bx_in">
                <div class="top">
                  <div class="form_label">No. of Goals : </div>
                  <div class="counter_parent">
                    <input type="text" class="range_counter" id="businessGoals" value="${fn:length(businessGoalsList)}" readonly="readonly" />
                  </div>
                </div>
                <div class="bottom clearfix">
                  <div class="form_label">Total Goal Amt : </div>
                  <div class="counter_parent fr">
                    <%--<input type="text" class="range_counter" id="businessGoalsAmt" value="<fmt:formatNumber type="number" maxFractionDigits="2" value="${businessGoalAmount}" />
                    " readonly="readonly" /> --%>
                    <span class="range_counter" id="businessGoalsAmt"><fmt:formatNumber type="number" maxFractionDigits="2" value="${businessGoalAmount}" /></span>
                    <span class="unit">lacs</span></div>
                </div>
              </div>
              <div class="bottom_bx_in">
                <div id="dgr-other" class="gl-dragger other_goal_div_dragger"><span></span></div>
              </div>
            </li>
            <li>
              <div class="top_bx_in">
                <div class="special_goal"></div>
              </div>
              <div class="middle_bx_in">
                <div class="top">
                  <div class="form_label">No. of Goals : </div>
                  <div class="counter_parent">
                    <input type="text" class="range_counter" id="specialGoals" value="${fn:length(specialGoalsList)}" readonly="readonly" />
                  </div>
                </div>
                <div class="bottom clearfix">
                  <div class="form_label">Total Goal Amt : </div>
                  <div class="counter_parent fr">
                    <span class="range_counter" id="specialGoalsAmt"><fmt:formatNumber type="number" maxFractionDigits="2" value="${specialGoalAmount}" /></span>
                     <span class="unit">lacs</span></div>
                </div>
              </div>
              <div class="bottom_bx_in">
                <div id="dgr-special" class="gl-dragger special_goal_div_dragger"><span></span></div>
              </div>
            </li>
            <li>
              <div class="top_bx_in">
                <div class="other_goal"></div>
              </div>
              <div class="middle_bx_in">
                <div class="top">
                  <div class="form_label">No. of Goals : </div>
                  <div class="counter_parent">
                    <input type="text" class="range_counter" id="otherGoals" value="${fn:length(othersGoalsList)}" readonly="readonly" />
                  </div>
                </div>
                <div class="bottom clearfix">
                  <div class="form_label">Total Goal Amt : </div>
                  <div class="counter_parent fr">
                    <span class="range_counter" id="otherGoalsAmt"><fmt:formatNumber type="number" maxFractionDigits="2" value="${otherGoalAmount}" /></span>
                     <span class="unit">lacs</span></div>
                </div>
              </div>
              <div class="bottom_bx_in">
                <div id="dgr-property" class="gl-dragger property_goal_div_dragger"><span></span></div>
              </div>
            </li>
          </ul>
          <div class="clr"></div>
        </div>
        <div class="clr"></div>
        
        <!-- Business Goals List View-->
        <div id="bx-business" class="bx-goal business_goals_list_bx">
          <div class="goals_list_bx">
            <div class="btn-toggle common_sliding_radio"> <span class="lbl">Data</span> <span class="lbl">Graph</span></div>
            <div class="pnl-toggle"> 
              <!--title-->
              <ul>
                <li class="input_title_one">Sr. No.</li>
                <li class="input_title_two">Customer Name</li>
                <li class="input_title_three">E-mail</li>
                <li class="input_title_four">Phone</li>
                <li class="input_title_five">Goal Amount (FV)</li>
                <li class="input_title_six">Start Year</li>
                <li class="input_title_seven">End Year</li>
                <li class="input_title_eight">Completed (%)</li>
                <li class="input_title_nine">Stage</li>
              </ul>
              <div class="clr"></div>
              <!--title--> 
              <!--txt list-->
              <div class="goals_in_content" id="propertyGoalsDiv">
                <c:forEach items="${propertyGoalsList}" var="propertyGoals" varStatus="loopStatus">
                  <ul>
                    <li class="input_txt_one">${loopStatus.index + 1}</li>
                    <li class="input_txt_two">${propertyGoals.name}</li>
                    <li class="input_txt_three"><span class="cust_email">${propertyGoals.email}</span></li>
                    <li class="input_txt_four">${propertyGoals.phone}</li>
                    <li class="input_txt_five">
                      <fmt:formatNumber type="number" 
            								maxFractionDigits="2" value="${propertyGoals.amount}" />
                      lacs</li>
                    <li class="input_txt_six">${propertyGoals.startYear}</li>
                    <li class="input_txt_seven">${propertyGoals.startYear}</li>
                    <li class="input_txt_eight">
                      <c:choose>
                        <c:when test="${not empty propertyGoals.percentGoal}"> ${propertyGoals.percentGoal}% </c:when>
                        <c:otherwise> 0% </c:otherwise>
                      </c:choose>
                    </li>
                    <li class="input_txt_nine">
                      ${propertyGoals.stage} </li>
                    <div class="clr"></div>
                  </ul>
                </c:forEach>
              </div>
            </div>
            <div class="pnl-toggle" style="display:none;">
              <div id="grf-prop"></div>
              <div class="clr"></div>
              <script>
                                    <c:forEach items="${propertyGoalChartList}" var="goalChart" varStatus="rowCount">
                            			createToolTipPro('${goalChart.title}','${goalChart.count}','<fmt:formatNumber type="number" maxFractionDigits="2" value="${goalChart.amount}" />');
                            		</c:forEach>
                                    RenderPieChart('grf-prop', [
														<c:forEach items="${propertyGoalChartList}" var="goalChart" varStatus="rowCount">
														['(${goalChart.title})', ((${goalChart.count}/${fn:length(propertyGoalsList)})*100)],                                                               
														</c:forEach>                    
                                                           ], 'pro');
                                    </script> 
            </div>
          </div>
        </div>
        <!-- Business Goals List View--> 
        
        <!-- Other Goals List View-->
        <div id="bx-other" class="bx-goal other_goal_list_bx">
          <div class="goals_list_bx">
            <div class="btn-toggle common_sliding_radio"> <span class="lbl">Data</span> <span class="lbl">Graph</span></div>
            <div class="pnl-toggle"> 
              <!--title-->
              <ul>
                <li class="input_title_one">Sr. No.</li>
                <li class="input_title_two">Customer Name</li>
                <li class="input_title_three">E-mail</li>
                <li class="input_title_four">Phone</li>
                <li class="input_title_five">Goal Amount (FV)</li>
                <li class="input_title_six">Start Year</li>
                <li class="input_title_seven">End Year</li>
                <li class="input_title_eight">Completed (%)</li>
                <li class="input_title_nine">Stage</li>
              </ul>
              <div class="clr"></div>
              <!--title--> 
              <!--txt list-->
              <div class="goals_in_content" id="businessGoalsDiv">
                <c:forEach items="${businessGoalsList}" var="businessGoals" varStatus="loopStatus">
                  <ul>
                    <li class="input_txt_one">${loopStatus.index + 1}</li>
                    <li class="input_txt_two">${businessGoals.name}</li>
                    <li class="input_txt_three"><span class="cust_email">${businessGoals.email}</span></li>
                    <li class="input_txt_four">${businessGoals.phone}</li>
                    <li class="input_txt_five">
                      <fmt:formatNumber type="number" 
            								maxFractionDigits="2" value="${businessGoals.amount}" />
                      lacs</li>
                    <li class="input_txt_six">${businessGoals.startYear}</li>
                    <li class="input_txt_seven">${businessGoals.startYear}</li>
                    <li class="input_txt_eight">
                      <c:choose>
                        <c:when test="${not empty businessGoals.percentGoal}"> ${businessGoals.percentGoal}% </c:when>
                        <c:otherwise> 0% </c:otherwise>
                      </c:choose>
                    </li>
                    <li class="input_txt_nine">
                      ${businessGoals.stage} </li>
                    <div class="clr"></div>
                  </ul>
                </c:forEach>
              </div>
            </div>
            <div class="pnl-toggle" style="display:none;">
              <div id="grf-bus"></div>
              <div class="clr"></div>
              <script>
                                    <c:forEach items="${businessGoalChartList}" var="goalChart" varStatus="rowCount">
                            			createToolTipBus('${goalChart.title}','${goalChart.count}','<fmt:formatNumber type="number" maxFractionDigits="2" value="${goalChart.amount}" />');
                            		</c:forEach>
                                    RenderPieChart('grf-bus', [
														<c:forEach items="${businessGoalChartList}" var="goalChart" varStatus="rowCount">
														['(${goalChart.title})', ((${goalChart.count}/${fn:length(businessGoalsList)})*100)],                                                               
														</c:forEach>                    
                                                           ], 'bus');
             </script> 
            </div>
          </div>
        </div>
        <!-- Other Goal List View--> 
        
        <!-- Special Goals List View-->
        <div id="bx-special" class="bx-goal special_goal_list_bx">
          <div class="goals_list_bx">
            <div class="btn-toggle common_sliding_radio"> <span class="lbl">Data</span> <span class="lbl">Graph</span></div>
            <div class="pnl-toggle"> 
              <!--title-->
              <ul>
                <li class="input_title_one">Sr. No.</li>
                <li class="input_title_two">Customer Name</li>
                <li class="input_title_three">E-mail</li>
                <li class="input_title_four">Phone</li>
                <li class="input_title_five">Goal Amount (FV)</li>
                <li class="input_title_six">Start Year</li>
                <li class="input_title_seven">End Year</li>
                <li class="input_title_eight">Completed (%)</li>
                <li class="input_title_nine">Stage</li>
              </ul>
              <div class="clr"></div>
              <!--title--> 
              <!--txt list-->
              <div class="goals_in_content" id="specialGoalsDiv">
                <c:forEach items="${specialGoalsList}" var="specialGoals" varStatus="loopStatus">
                  <ul>
                    <li class="input_txt_one">${loopStatus.index + 1}</li>
                    <li class="input_txt_two">${specialGoals.name}</li>
                    <li class="input_txt_three"><span class="cust_email">${specialGoals.email}</span></li>
                    <li class="input_txt_four">${specialGoals.phone}</li>
                    <li class="input_txt_five">
                      <fmt:formatNumber type="number" 
            								maxFractionDigits="2" value="${specialGoals.amount}" />
                      lacs</li>
                    <li class="input_txt_six">${specialGoals.startYear}</li>
                    <li class="input_txt_seven">${specialGoals.startYear}</li>
                    <li class="input_txt_eight">
                      <c:choose>
                        <c:when test="${not empty specialGoals.percentGoal}"> ${specialGoals.percentGoal}% </c:when>
                        <c:otherwise> 0% </c:otherwise>
                      </c:choose>
                    </li>
                    <li class="input_txt_nine">
                      ${specialGoals.stage} </li>
                    <div class="clr"></div>
                  </ul>
                </c:forEach>
              </div>
            </div>
            <div class="pnl-toggle" style="display:none;">
              <div id="grf-spe"></div>
              <div class="clr"></div>
              <script>
                                    <c:forEach items="${specialGoalChartList}" var="goalChart" varStatus="rowCount">
                            			createToolTipSpe('${goalChart.title}','${goalChart.count}','<fmt:formatNumber type="number" maxFractionDigits="2" value="${goalChart.amount}" />');
                            		</c:forEach>
                                    RenderPieChart('grf-spe', [
														<c:forEach items="${specialGoalChartList}" var="goalChart" varStatus="rowCount">
														['(${goalChart.title})', ((${goalChart.count}/${fn:length(specialGoalsList)})*100)],                                                               
														</c:forEach>                    
                                                           ], 'spe');
                                    </script> 
            </div>
          </div>
        </div>
        <!-- Special Goal List View--> 
        
        <!-- Property Goals List View-->
        <div id="bx-property" class="bx-goal property_goal_list_bx">
          <div class="goals_list_bx">
            <div class="btn-toggle common_sliding_radio"> <span class="lbl">Data</span> <span class="lbl">Graph</span></div>
            <div class="pnl-toggle"> 
              <!--title-->
              <ul>
                <li class="input_title_one">Sr. No.</li>
                <li class="input_title_two">Customer Name</li>
                <li class="input_title_three">E-mail</li>
                <li class="input_title_four">Phone</li>
                <li class="input_title_five">Goal Amount (FV)</li>
                <li class="input_title_six">Start Year</li>
                <li class="input_title_seven">End Year</li>
                <li class="input_title_eight">Completed (%)</li>
                <li class="input_title_nine">Stage</li>
              </ul>
              <div class="clr"></div>
              <!--title--> 
              <!--txt list-->
              <div class="goals_in_content" id="otherGoalsDiv">
                <c:forEach items="${othersGoalsList}" var="otherGoals" varStatus="loopStatus">
                  <ul>
                    <li class="input_txt_one">${loopStatus.index + 1}</li>
                    <li class="input_txt_two">${otherGoals.name}</li>
                    <li class="input_txt_three"><span class="cust_email">${otherGoals.email}</span></li>
                    <li class="input_txt_four">${otherGoals.phone}</li>
                    <li class="input_txt_five">
                      <fmt:formatNumber type="number" 
            								maxFractionDigits="2" value="${otherGoals.amount}" />
                      lacs</li>
                    <li class="input_txt_six">${otherGoals.startYear}</li>
                    <li class="input_txt_seven">${otherGoals.startYear}</li>
                    <li class="input_txt_eight">
                      <c:choose>
                        <c:when test="${not empty otherGoals.percentGoal}"> ${otherGoals.percentGoal}% </c:when>
                        <c:otherwise> 0% </c:otherwise>
                      </c:choose>
                    </li>
                    <li class="input_txt_nine">
                      ${otherGoals.stage} </li>
                    <div class="clr"></div>
                  </ul>
                </c:forEach>
              </div>
            </div>
            <div class="pnl-toggle" style="display:none;">
              <div id="grf-other"></div>
              <div class="clr"></div>
              <script>
                                    <c:forEach items="${othersGoalChartList}" var="goalChart" varStatus="rowCount">
                            			createToolTipOth('${goalChart.title}','${goalChart.count}','<fmt:formatNumber type="number" maxFractionDigits="2" value="${goalChart.amount}" />');
                            		</c:forEach>
                                    RenderPieChart('grf-other', [
														<c:forEach items="${othersGoalChartList}" var="goalChart" varStatus="rowCount">
														['(${goalChart.title})', ((${goalChart.count}/${fn:length(othersGoalsList)})*100)],                                                               
														</c:forEach>                    
                                                           ], 'oth');
             </script> 
            </div>
          </div>
        </div>
        
         <!-- Education Goals List View-->
        <div class="top_bx southspace6">
          <ul class="top_bx_ul_bx clearfix">
            <li>
              <div class="top_bx_in">
                <div class="property_goal"></div>
              </div>
              <div class="middle_bx_in">
                <div class="top">
                  <div class="form_label">No. of Goals : </div>
                  <div class="counter_parent">
                    <input type="text" class="range_counter" id="targetCorpusGoals" value="${fn:length(targetCorpusGoalsList)}" readonly="readonly" />
                  </div>
                </div>
                <div class="bottom clearfix">
                  <div class="form_label">Total Goal Amt : </div>
                  <div class="counter_parent fr">
                    <span class="range_counter" id="targetCorpusGoalsAmt"><fmt:formatNumber type="number" maxFractionDigits="2" value="${targetCorpusGoalAmount}" /></span>
                    <span class="unit">lacs</span></div>
                </div>
              </div>
              <div class="bottom_bx_in">
                <div id="dgr-corpus" class="gl-dragger business_goals_div_dragger"><span></span></div>
              </div>
            </li>
            
            
          </ul>
          <div class="clr"></div>
        </div>
        <div class="clr"></div>
        
         <!-- Target Corpus Goals List View-->
        <div id="bx-corpus" class="bx-goal business_goals_list_bx">
          <div class="goals_list_bx">
            <div class="btn-toggle common_sliding_radio"> <span class="lbl">Data</span> <span class="lbl">Graph</span></div>
            <div class="pnl-toggle"> 
              <!--title-->
              <ul>
                <li class="input_title_one">Sr. No.</li>
                <li class="input_title_two">Customer Name</li>
                <li class="input_title_three">E-mail</li>
                <li class="input_title_four">Phone</li>
                <li class="input_title_five">Goal Amount (FV)</li>
                <li class="input_title_six">Start Year</li>
                <li class="input_title_seven">End Year</li>
                <li class="input_title_eight">Completed (%)</li>
                <li class="input_title_nine">Stage</li>
              </ul>
              <div class="clr"></div>
              <!--title--> 
              <!--txt list-->
              <div class="goals_in_content" id="propertyGoalsDiv">
                <c:forEach items="${targetCorpusGoalsList}" var="targetCorpusGoals" varStatus="loopStatus">
                  <ul>
                    <li class="input_txt_one">${loopStatus.index + 1}</li>
                    <li class="input_txt_two">${targetCorpusGoals.name}</li>
                    <li class="input_txt_three"><span class="cust_email">${targetCorpusGoals.email}</span></li>
                    <li class="input_txt_four">${targetCorpusGoals.phone}</li>
                    <li class="input_txt_five">
                      <fmt:formatNumber type="number" 
            								maxFractionDigits="2" value="${targetCorpusGoals.amount}" />
                      lacs</li>
                    <li class="input_txt_six">${targetCorpusGoals.startYear}</li>
                    <li class="input_txt_seven">${targetCorpusGoals.startYear}</li>
                    <li class="input_txt_eight">
                      <c:choose>
                        <c:when test="${not empty targetCorpusGoals.percentGoal}"> ${targetCorpusGoals.percentGoal}% </c:when>
                        <c:otherwise> 0% </c:otherwise>
                      </c:choose>
                    </li>
                    <li class="input_txt_nine">
                      ${targetCorpusGoals.stage} </li>
                    <div class="clr"></div>
                  </ul>
                </c:forEach>
              </div>
            </div>
            <div class="pnl-toggle" style="display:none;">
              <div id="grf-prop"></div>
              <div class="clr"></div>
              <script>
                                    <c:forEach items="${targetCorpusChartList}" var="goalChart" varStatus="rowCount">
                            			createToolTipPro('${goalChart.title}','${goalChart.count}','<fmt:formatNumber type="number" maxFractionDigits="2" value="${goalChart.amount}" />');
                            		</c:forEach>
                                    RenderPieChart('grf-prop', [
														<c:forEach items="${targetCorpusChartList}" var="goalChart" varStatus="rowCount">
														['(${goalChart.title})', ((${goalChart.count}/${fn:length(targetCorpusGoals)})*100)],                                                               
														</c:forEach>                    
                                                           ], 'pro');
              </script> 
            </div>
          </div>
        </div>
        <!-- Target Corpus Goals List View--> 
        <div class="overlay"></div>
      </section>
      <!-- Common_in_contnet ends--> 
      
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
  
</div>
<form id="goalForm">
  <input type="hidden" id="goalTypeId" name="goalTypeId" value=""/>
</form>
<!-- Wrapper ends--> 



<script>
function searchRecord(elementId,goalTypeId){
	
	$("#goalTypeId").val(goalTypeId);
	
	$("#goalForm").ajaxSubmit({
		url: "${pageContext.request.contextPath}/partner/filterAdvisorGoals",
		type : "GET",
		dataType : "json",		
		data : {'goalTypeId': goalTypeId},
		success: function(goalList){
			
			$('#'+elementId+"Div").html("");
			var newHtmlCode = "";					
			var counter = 0;			
			/* $.each( goalMap, function( parentCount, goalList ) {
				
			} */			
			$('.common_in_content').slimScroll("update");
            $('.goals_in_content').slimScroll("update");
			 $('li.input_txt_three .cust_email').perfectScrollbar("update");
			
		},
		error: function(data){
			displayMsg('Error : ' + data);
			
		},		
	});
	
}
</script>