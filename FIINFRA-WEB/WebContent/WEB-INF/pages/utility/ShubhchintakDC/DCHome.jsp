<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
		<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Financial Plan</title>
		<!-- Just for debugging purposes. Don't actually copy this line! -->
		<!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements andz media queries -->
		<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<!-- <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
<script src="<%=request.getContextPath()%>/js/common.js"></script>-->

		<!-- -responsive css-->
		<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
-->
		<link href="<%=request.getContextPath()%>/css/Axis_dc.css" rel="stylesheet">
		<!-- -responsive css-->
		<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>

<link href="<%=request.getContextPath()%>/images/shubhachintak/favicon.ico" rel="shortcut icon">
-->
		<!--<link href="<%=request.getContextPath()%>/css/custom2.css" rel="stylesheet">-->

		<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

		<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
		<style>
#centerLoadingImage_image { margin-top: 10%; margin-left: 42%; }
.close_img { cursor: pointer; }
#centerLoadingImage { display: none;/* 	width: 300px; */
	/* 	height: 300px; */
	/* 	position: fixed; */
	/* 	z-index: 2005; */
}
#common_popup_div { display: none; position: fixed; filter: alpha(opacity = 00); width: 100%; height: 100%; z-index: 2000; opacity: 12; z-index: 10000000; }
#shadow_div_web_app { background-color: #000000; display: none; height: 100%; left: 0; opacity: 0.1; position: fixed; top: 0; width: 100%; z-index: 999999; }
</style>
		<script>
	$(document)
	.ready(
			function() {
				$(document).ajaxStop(function() {
					closePopupWebApp('centerLoadingImage');
				});

				$(document).ajaxStart(function() {
					openPopupWebApp('centerLoadingImage', 25, 35);
				});
				
			});
	var isContainsRiskCover;
	var isContainsEmergencyR
	var isContainsCahflow;
	var isContainsRiskProfile;
	var isContainsSuccession;
	var isContainsRetirment;
	var isContainsGoal;
	var isContainsLoan;
	var sectionarray;
		$(document).ready(function() {
 							/* $('#dcinputname').attr('margin-left','5px');
							   $('#dcinputname').append($('#dcInputUsername').val()); */
							 sectionarray = $('#section').val().split(',');
							 isContainsRiskCover=sectionarray.contains("39003");
							 isContainsEmergencyR=sectionarray.contains("39001");
							 isContainsCahflow=sectionarray.contains("39002");
							 isContainsRiskProfile=sectionarray.contains("39009");
							 isContainsSuccession=sectionarray.contains("39007");
							 isContainsRetirment=sectionarray.contains("39006");
							 isContainsGoal=sectionarray.contains("39005");
							 isContainsLoan=sectionarray.contains("39008");
						     /*$('#tgl-help').on('click', function(e) {
						            //e.preventDefault();
						            var icnd = $(this).children('.icn');
						            if($(icnd).hasClass('active')) {
						                $('#tgl-helptext').addClass('hide').slideUp();
						                $(icnd).removeClass('active');
						            } else {
						                $('#tgl-helptext').removeClass('hide').slideDown();
						                $(icnd).addClass('active');
						            }
						        });*/
						     
						    
						});
	
		
		</script>
		<style>
.exmple_table th, .currentInvestment th, .goals th { border: 1px solid #000;/*padding: 4px;*/
		}
.exmple_table td, .currentInvestment td, .goals td { border: 1px solid #000;/*padding: 4px;*/
		}
.goals { float:left; }
.currentInvestment { float:right; width: 45%; }
.strong { font-weight: bold; }
</style>
		</head>
		<body>
<!--css popup window start 1-->
<jsp:include page="../../common/header.jsp" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">
<input type="hidden" name="dcInputPartyId" id="dcInputPartyId" value="${sessionScope.dcInputPartyId}">
<input type="hidden" name="dcInputDocId_AnalysisReport" id="dcInputDocId_AnalysisReport" value="${sessionScope.dcInputDocId_AnalysisReport}">
<input type="hidden" id="section" value="${sessionScope.Section}"/>
<input type="hidden" id="redirectToPage" value="${sessionScope.redirectToClient}"/>

<!-- Center part start -->
<div id="shadow_div_web_app" style="display: none"></div>
<div id="common_popup_div" style="display: none">
  <!-- 	<div id="centerLoadingImage"> -->
  <img  id="centerLoadingImage"

		style="display: none"
		src="<%=request.getContextPath()%>/images/loading15.gif"
		name="loadingImage" />
  
  <!-- 		<h4 style="position:absolute;top: 54%; left: 38%; color: #0e0828;">Please wait ..the report is being generated. Do not close or refresh the window.</h4> -->
  <!-- 	</div> -->
  
</div>
<section>
<div class="container">
  <div class="container-head">
    <div class="col-md-12" style="text-align: right;"><span style="float:left; font-weight:bold;" id="dcinputname">Financial Plan for&nbsp;<i class="opportunityicon" ></i></span><span>
      <input class="dcbutton" type="button" value="Exit"  id="exit" onclick="redirectToOpportunity()"  name="Exit">
      </span></div >
  </div >
  <div class="container-body " style="padding:5px;"></div>
  <div class="container-body">
    <div class="col-md-12 dchead">FINANCIAL PLAN</div>
    <div class="dcsubhead">Please enter your details.Our Experts will get back to you.</div>
    
    <!-- center -->
    
    <div class="col-md-12" style="margin:20px 0 20px 10px;">
      <div class="col-md-3">
        <div class="dcbox"><a href="<%=request.getContextPath()%>/DCPersonalInfoShubhchintak.htm" title="Personal Information" alt="Personal Information" >
          <center>
            <img src="<%=request.getContextPath()%>/images/${sessionScope.userSession.themeName}/dc1.png"  width="244" height="243">
          </center>
          <br>
          <h3>Personal<br>
            Information</a></h3>
        </div>
      </div>
      <div class="col-md-3">
        <div class="dcbox"><br>
          <a href="<%=request.getContextPath()%>/RiskProfile.htm"  title="Risk Profile" alt="Risk Profile">
          <center>
            <img src="<%=request.getContextPath()%>/images/${sessionScope.userSession.themeName}/dc4.png" width="244" height="243" >
          </center>
          <h3>Risk<br>
            Profile</a></h3>
        </div>
      </div>
      <div class="col-md-3">
        <div class="dcbox">
          <h3><a href="<%=request.getContextPath()%>/EmergencyReady.htm" alt="Current Financial Status"  title="Current Financial Status">
            <center>
              <img src="<%=request.getContextPath()%>/images/${sessionScope.userSession.themeName}/dc3.png"    width="244" height="243">
            </center>
            Current<br>
            Financial Status<br>
            </a></h3>
        </div>
      </div>
      <div class="col-md-3">
        <div class="dcbox"><a href="<%=request.getContextPath()%>/DCFutureFinancialExpectationShubhchintak.htm" title="Future Financial Expectations" alt="Future Financial Expectations">
          <center>
            <img src="<%=request.getContextPath()%>/images/${sessionScope.userSession.themeName}/dc2.png"  width="244" height="243">
          </center>
          <br>
          <h3>Future Financial<br>
            Expectations</a></h3>
        </div>
      </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-md-12" style="margin:30px 0;">
      <input type="radio" name="analysisComprehensive" id="analysisGoals" value="3" >
      Analysis - Goals
      &nbsp;
      <input type="radio" name="analysisComprehensive" id="analysisGoalsandRisk" value="4" >
      Analysis - Goals and Risk
      &nbsp;
      <input type="radio" name="analysisComprehensive" id="analysisGoalsRiskSuccession" value="5" >
      Analysis - Goals, Risk & Succession
      &nbsp;
      <input type="radio" name="analysisComprehensive" id="analysisComprehensive" value="1" checked="checked">
      Analysis - Comprehensive
      <!--          &nbsp;<input type="checkbox" name="analysisComprehensive" id="actionPlan" value="2" checked="checked" style="display: none;"> Action Plan -->
      
      <center>
        <br>
        <a href="#">
        <input class="btn-primary btn btn-xs" type="button" value="Generate Report" name="Generate Report" onclick="submitDcOutput(isContainsEmergencyR);">
        </a>
      </center>
    </div>
    <!-- center -->
  </div>
  <br/>
  <br/>
</div>
</div>
<div style="display: none;" id="blanket"></div>

<!-- -->
<div class="modal fade" id="insuranceMethodsPopup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Life Insurance Methods</h4>
      </div>
      <div class="modal-body">
        <div class="row"><br>
          <br>
          <div class="list-group" id="liMethodsDetailsDiv" >
            <form id="pnl-zm">
              <div class="row clearfix">
                <button class="btn btn-primary btn-xsall pull-right eastspace4" id="tgl-help"><span class="fa fa-question"></span> Help</button>
                <div class="clearfix"></div>
                <div id="tgl-helptext" style="width:71%;
height: 300px;position:absolute;padding: 10px;z-index: 999;position: absolute;top:97px;overflow-y: auto; right:10px;background:#ccc; display:none"><span>Please see below description about calculation methods.</span>
                  <ul>
                    <li><b>Income Replacement  :</b><br/>
                      <b>Objective:</b>In case of death of primary earning member, financial loss to family is equivalent to the income that person would have earned till his / her retirement. Life insurance can be a way this loss is replaced to the family.<br/>
                      <b>Insurance cover =</b>(Current  Annual Income * number of years to retirement)</li>
                    <li><b>Expense Replacement  :</b><br/>
                      <b>Objective:</b>In case of death of the primary earning member, the expenses of the dependents have to be handled till they are alive. To ensure that in the absence of the breadwinner , all the inevitable expenses are  planned for and helps the family to be financially sound.<br/>
                      <b>Insurance cover =</b>Present value ( expenses for expected life remaining) while accounting for Effective rate of return.  Effective rate of return 
                      is based on the growth rate and inflation rate - available cover</li>
                    <li><b>HLV Replacement  :</b><br/>
                      <b>Objective:</b>To ensure that in the absence of the breadwinner , all the inevitable expenses and life goals (goals such as education, marriage) are  planned for. The 
                      method also takes into account the outstanding loans and current assets.<br/>
                      <b>Insurance cover =</b>Cover as per Expense replacement method without considering EMIs + Value of life goals  + Loans outstanding - Available assets - available cover</li>
                    <li><b>Example:</b>Let's see how it works for Mr. A.B. Joshi. Let's make following assumptions:
                      <table class="exmple_table">
                        <tbody>
                          <tr>
                            <th class="col1">Age</th>
                            <td class="col2">35</td>
                            <th class="col3">Inflation rate</th>
                            <td class="col4">6%</td>
                          </tr>
                          <tr>
                            <th>Income</th>
                            <td>INR 5 Lac p.a.</td>
                            <th>Return on Existing investment</th>
                            <td>7%</td>
                          </tr>
                          <tr>
                            <th>Expenses</th>
                            <td>INR 30,000/-  p.m.</td>
                            <th>Life expectancy</th>
                            <td>85</td>
                          </tr>
                          <tr>
                            <th>EMIs</th>
                            <td>INR 15,000/- p.m.</td>
                            <th>Retirement Age</th>
                            <td>60</td>
                          </tr>
                          <tr>
                            <th>Existing cover</th>
                            <td>INR 15 Lac</td>
                            <th>Existing Loans</th>
                            <td>INR 60 Lac</td>
                          </tr>
                        </tbody>
                      </table>
                      <table class="goals">
                        <caption class="strong">
                        Goals
                        </caption>
                        <tbody>
                          <tr>
                            <th class="col1">Education</th>
                            <td class="col2">INR 10 Lac</td>
                          </tr>
                          <tr>
                            <th>Child Marriage</th>
                            <td>INR 5.5 Lac</td>
                          </tr>
                        </tbody>
                      </table>
                      <table class="currentInvestment">
                        <caption class="strong">
                        Current Investments
                        </caption>
                        <tbody>
                          <tr>
                            <th class="col1">Equity</th>
                            <td class="col2">INR 5 Lacs</td>
                          </tr>
                          <tr>
                            <th>Debt</th>
                            <td>INR 85,000</td>
                          </tr>
                        </tbody>
                      </table>
                      <br/>
                      <br/>
                      <br/>
                      <br/>
                      <b>Income Replacement</b><br/>
                      Insurance cover = (5 Lac * (60-35)) - 15 Lac = 1.11 Cr<br/>
                      <b>Expense Replacement</b><br/>
                      ROR = (1+Growth rate)/(1+Inflation Rate)-1 = (1.07/1.06-1) = 0.94% 
                      Insurance cover = PV(ROR/12,(Life Expectancy-Current Age)*12,-Mothly expenses,0,0) 
                      = PV (0.94%, (85-35)*12, -45000,0,0) 
                      = 2.15 Cr<br/>
                      <b>HLV</b><br/>
                      Insurance cover as per expense replacement without EMI = 1.43 CR 
                      Insurance cover = 1.43 Cr.  + 15.5 Lac + 60 Lac - 6 Lacs - 15 lacs = 1.97 Cr</li>
                  </ul>
                </div>
              </div>
              <table class="table table-striped" cellpadding="5" cellspacing="5" id="liMethodsTable" style="width: 98%;margin-left: 10px;margin-top: 10px;">
                <tr>
                  <th width="22%" style="border-top: none !important;">Calculation Method</th>
                  <th width="78%" style="border-top: none !important;" >Insurance Amount</th>
                </tr>
                <tr>
                  <td width="22%" style="border-top: none !important;">HLV</td>
                  <td width="78%" style="border-top: none !important;" id="hlvAmount"></td>
                </tr>
                <tr>
                  <td width="22%" style="border-top: none !important;">Expense Replacement</td>
                  <td width="78%" style="border-top: none !important;" id="expenseAmount"></td>
                </tr>
                <tr>
                  <td width="25%" style="border-top: none !important;">Income Replacement</td>
                  <td width="78%" style="border-top: none !important;" id="incomeAmount"></td>
                </tr>
              </table>
              <table class="table table-striped" cellpadding="5" cellspacing="5" id="liMethodsTable" style="width: 98%;margin-left: 10px;margin-top: 10px;">
                <tr>
                  <th colspan="2">Select calculation method for this contact</th>
                </tr>
                <tr>
                  <td colspan="2"><select id="liMethodSelect" class="form-control"  style="background-color:rgb(255, 255, 255);border:1px solid rgb(204, 204, 204);box-shadow:0px 1px 1px rgba(0, 0, 0, 0.075) inset;width: 50%">
                      <option value="0">HLV</option>
                      <option value="1">Expense Replacement</option>
                      <option value="2">Income Replacement</option>
                    </select></td>
                </tr>
                <tr>
                  <td><input id="save" class="btn btn-primary btn-xsall" type="button" value="Submit"   onclick="saveLIMethod()"></td>
                </tr>
              </table>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Center part End -->
<jsp:include page="../../common/common_popup.jsp" />
<jsp:include page="../../common/footer.jsp" />
<%
String serverPath = request
.getRequestURL()
.toString()
.replace(request.getRequestURI().substring(0),
		request.getContextPath());
serverPath=serverPath.substring(0,serverPath.lastIndexOf("/"));
%>
<%-- <input id="baseServerURL" value="<%=serverPath%>"> --%>
<input type="hidden" id="usernamefromsession" value="${sessionScope.userSession.userName}"/>
<script>
        $(document).ready(function() {
        	$('#dcinputname').append($('#dcInputUsername').val());
        	$('#tgl-help').on('click',function(){
						            //e.preventDefault();
						            $('#tgl-helptext').slideToggle();
								   // var icnd = $(this).children('.icn');
						           /* if($(icnd).hasClass('active')) {
						                $('#tgl-helptext').addClass('hide').slideUp();
						                $(icnd).removeClass('active');
						            } else {
						                $('#tgl-helptext').removeClass('hide').slideDown();
						                $(icnd).addClass('active');
						            }*/
						        });
								});
        
        </script>
</body>
</html>
