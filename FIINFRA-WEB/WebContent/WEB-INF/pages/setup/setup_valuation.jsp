<!DOCTYPE html>
<html lang="en">
    <head>
        <title></title>
        <script src="${pageContext.request.contextPath}/js/jquery-1.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap-responsive.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap-responsive.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/js/holder.js"></script>
        <script src="${pageContext.request.contextPath}/js/common.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zebra_dialog.css" type="text/css">
        <!-- -responsive css-->
        <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/partner_setup.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/partner.css" rel="stylesheet">
        <!-- -responsive css-->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/pop.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.ui.core.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.ui.widget.js"></script>
        <link href="${pageContext.request.contextPath}/images/favicon.ico" rel="shortcut icon" />

        <link href="${pageContext.request.contextPath}/css/custom2.css" rel="stylesheet">
        <style type="text/css">
        #biz-panels .amt{
        	width: 36px;
        }
        #revenueDiv .amt{
        	width: 46px !important;
        }
        .col-3 {
			width: 35%;
		}
        .customeSpan{
        	display: inline-block;
			font-size: 16px;
			font-weight: bold;
			margin-bottom: 10px;
			color :#ae2760;
        	
        }
        </style>
    </head>
    <body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/common_popup.jsp" />
            <div class="container">
                <div class="container-head">
                    <div class="col-md-12 text-right">
                        <span class="pull-left">Partner Setup </span>
                    </div>
                </div>

                <div class="container-body">
                    <!-- center -->
                  <jsp:include page="sidebar_setup.jsp"></jsp:include>
				<form id="businessValuationForm">
                    <div class="col-md-9" style="margin-top:10px; padding-left:10px;" id="pnl-bv">
                        <div class="list-group">
                            <a href="" class="list-group-item active">Business Valuation</a>
                            <div class="list-group-item" id="biz-panels">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-2"></div>
                                            <div class="col-lg-6 lbl">Current No. of Customers<span class="pull-right">: </span></div>
                                            <div class="col-lg-4"><span class="icn"></span><input class="amt" maxlength="5" id="currentNoCustomer" name="currentNoOfCustomer" onkeydown="allowIntegersOnly(id,event)" onchange="checkForSystemAutoRevenue();"/></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2"></div>
                                            <div class="col-lg-6 lbl">Revenue Per Customer<span class="pull-right">: </span></div>
                                            <div class="col-lg-4"><span class="icn rupee-dark"></span><input class="amt"  maxlength="5" id="revenuePerCustomer" name="revenuePercustomer" onkeydown="allowIntegersOnly(id,event)" onchange="checkForSystemAutoRevenue();"/></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2"></div>
                                            <div class="col-lg-6 lbl">Last Two Years Revenue (Lacs)<span class="pull-right">: </span></div>
                                            <div class="col-lg-2"> <span class="pull-left"> 2013</span> <span class="icn rupee-dark"></span><input class="amt" name="revenuePastYear1"  maxlength="5" id="revenuePastYear1" onkeydown="allowOnlyDecimal(id,event)"  /></div>
                                            <div class="col-lg-2"><span class="pull-left">2014</span> <span class="icn rupee-dark"></span><input class="amt" name="revenuePastYear2" maxlength="5" id="revenuePastYear2" onkeydown="allowOnlyDecimal(id,event)"  /></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-2"></div>
                                            <div class="col-lg-6 lbl">Additional Customers Per Year (Lacs)<span class="pull-right">: </span></div>
                                            <div class="col-lg-4"><span class="icn"></span><input class="amt" maxlength="5" id="additionalCustomerPerYear" name="additionalCustomerPerYear" onkeydown="allowIntegersOnly(id,event)"  onchange="checkForSystemAutoRevenue();"/></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-2"></div>
                                            <div class="col-lg-6 lbl">Growth in Revenue Per Customer (Lacs)<span class="pull-right">: </span></div>
                                            <div class="col-lg-4"><span class="icn"></span><input class="amt" maxlength="5" id="growthRevenuePerCustomer" name="growthPercentRevenuePercustomer" onkeydown="allowOnlyDecimal(id,event)"  onchange="checkForSystemAutoRevenue();"/><span class="per">%</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div id="pnl-target">
                                    <span class="customeSpan">Annual Revenue Targets</span>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-lg-4 lbl">Years</div>
                                                <div class="col-lg-1">2015</div>
                                                <div class="col-lg-1">2016</div>
                                                <div class="col-lg-1">2017</div>
                                                <div class="col-lg-1">2018</div>
                                                <div class="col-lg-1">2019</div>
                                            </div>
                                        </div>
                                        <div class="panel-body" id="revenueDiv">
                                            <div class="row">
                                                <div class="col-lg-4 lbl">System Determined Annual Revenue</div>
                                                <div class="col-lg-1"><span class="icn rupee-dark"></span><span class="amt" id="nextYear1RevenueSystem"></span><span class="per">Lacs</span></div>
                                                <div class="col-lg-1"><span class="icn rupee-dark"></span><span class="amt" id="nextYear2RevenueSystem"></span><span class="per">Lacs</span></div>
                                                <div class="col-lg-1"><span class="icn rupee-dark"></span><span class="amt" id="nextYear3RevenueSystem"></span><span class="per">Lacs</span></div>
                                                <div class="col-lg-1"><span class="icn rupee-dark"></span><span class="amt" id="nextYear4RevenueSystem"></span><span class="per">Lacs</span></div>
                                                <div class="col-lg-1"><span class="icn rupee-dark"></span><span class="amt" id="nextYear5RevenueSystem"></span><span class="per">Lacs</span></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-4 lbl">Self Set Annual Targets</div>
                                                <div class="col-lg-1"><span class="icn rupee-dark"></span><input class="amt" name="nextYear1Revenue" maxlength="5" id="nextYear1Revenue" onkeydown="allowOnlyDecimal(id,event)"  /><span class="per">Lacs</span></div>
                                                <div class="col-lg-1"><span class="icn rupee-dark"></span><input class="amt" name="nextYear2Revenue" maxlength="5" id="nextYear2Revenue" onkeydown="allowOnlyDecimal(id,event)"  /><span class="per">Lacs</span></div>
                                                <div class="col-lg-1"><span class="icn rupee-dark"></span><input class="amt" name="nextYear3Revenue" maxlength="5" id="nextYear3Revenue" onkeydown="allowOnlyDecimal(id,event)"  /><span class="per">Lacs</span></div>
                                                <div class="col-lg-1"><span class="icn rupee-dark"></span><input class="amt" name="nextYear4Revenue" maxlength="5" id="nextYear4Revenue" onkeydown="allowOnlyDecimal(id,event)" /><span class="per">Lacs</span></div>
                                                <div class="col-lg-1"><span class="icn rupee-dark"></span><input class="amt" name="nextYear5Revenue" maxlength="5" id="nextYear5Revenue" onkeydown="allowOnlyDecimal(id,event)" /><span class="per">Lacs</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                
                                    <div class="col-3 pull-right text-right">
                                    	<input type="button" class="btn" value="Back" id="zimmedariMeter" onclick="redirectToPanel(id)"/>
                                        <input type="button" class="btn" value="Save" onclick="SaveBusinessValuaiton();"/>
                                        <input type="button" class="btn" value="Next" id="masterasuumption" onclick="redirectToPanel(id)"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </div></div>
            <br/><br/>
            <!-- Center part End -->

       
<script>
var lastYearRevenue=0;
$(document).ready(function() {
	$('#businessvaluation').css('font-weight','bold');
	$.ajax({
		type : 'GET',
		url : $('#contextPath').val()+"/partner/getBusinessValuationDetails.htm",
		success : function(result) {
							
			$("#currentNoCustomer").val(result.currentNoOfCustomer);
			$("#revenuePerCustomer").val(result.revenuePercustomer);
			$("#additionalCustomerPerYear").val(result.additionalCustomerPerYear);
			$("#growthRevenuePerCustomer").val(result.growthPercentRevenuePercustomer);
			
			$("#revenuePastYear1").val(result.revenuePastYear1);
			$("#revenuePastYear2").val(result.revenuePastYear2);
			$("#nextYear1Revenue").val(result.nextYear1Revenue);
			$("#nextYear2Revenue").val(result.nextYear2Revenue);
			$("#nextYear3Revenue").val(result.nextYear3Revenue);
			$("#nextYear4Revenue").val(result.nextYear4Revenue);
			$("#nextYear5Revenue").val(result.nextYear5Revenue);
			checkForSystemAutoRevenue();
			
		}
	});
	
	});
	
function checkForSystemAutoRevenue(){
	var noOfcustomer = parseInt($("#currentNoCustomer").val());
	var revenuePerCustomer = parseFloat($("#revenuePerCustomer").val());
	var additionalCustomerPerYear = parseInt($("#additionalCustomerPerYear").val());
	var growthRevenuePerCustomer = parseFloat($("#growthRevenuePerCustomer").val());
	lastYearRevenue=0;
	//nextYear1Revenue
	if(!isNaN(noOfcustomer)  && !isNaN(revenuePerCustomer) && !isNaN(additionalCustomerPerYear) && !isNaN(growthRevenuePerCustomer) ){
		$("#nextYear1RevenueSystem").html(calculateAutoRevenue(noOfcustomer,revenuePerCustomer,additionalCustomerPerYear,growthRevenuePerCustomer,1));
		$("#nextYear2RevenueSystem").html(calculateAutoRevenue(noOfcustomer,revenuePerCustomer,additionalCustomerPerYear,growthRevenuePerCustomer,2));
		$("#nextYear3RevenueSystem").html(calculateAutoRevenue(noOfcustomer,revenuePerCustomer,additionalCustomerPerYear,growthRevenuePerCustomer,3));
		$("#nextYear4RevenueSystem").html(calculateAutoRevenue(noOfcustomer,revenuePerCustomer,additionalCustomerPerYear,growthRevenuePerCustomer,4));
		$("#nextYear5RevenueSystem").html(calculateAutoRevenue(noOfcustomer,revenuePerCustomer,additionalCustomerPerYear,growthRevenuePerCustomer,5));		
	}	
}

function calculateAutoRevenue(noOfcustomer,revenuePerCustomer,additionalCustomerPerYear,growthRevenuePerCustomer,year){
	
	var customerForYear = noOfcustomer+(additionalCustomerPerYear*year);
	if(lastYearRevenue==0)
		lastYearRevenue=revenuePerCustomer;
// 	var revenuePerCustomerForYear =  lastYearRevenue+((growthRevenuePerCustomer*revenuePerCustomer/100));
// 	var revenuePerCustomerForYear =  revenuePerCustomer*(1+(growthRevenuePerCustomer/100)*year);
	var revenuePerCustomerForYear =  revenuePerCustomer*(Math.pow((1+growthRevenuePerCustomer/100), year));
	
	console.log('customerForYear:--'+customerForYear);
	console.log('revenuePerCustomerForYear:--'+revenuePerCustomerForYear);
	var revenueForYear = customerForYear*revenuePerCustomerForYear;
	return (revenueForYear/100000).toFixed(2);

}
function SaveBusinessValuaiton(){
	
	$.ajax({
		type : 'POST',
		url : $('#contextPath').val()+"/partner/saveBusinessValuationData.htm",
		data:$("#businessValuationForm").serialize(),
		success : function(result) {
			if(result>0){
				showAlertMessage("Success",
						'<br/>Data Saved Successfully.' ,
						"confirmation", doNothing);
				$('.ZebraDialog').css('z-index','9999999999999999');
			}else{
				showAlertMessage("Error",
						"The connection to the server has been lost. Please try again later.",
						"error", doNothing);
				$('.ZebraDialog').css('z-index','9999999999999999');
			}
			
		}
	});
}
</script>      
  <jsp:include page="../common/footer.jsp" />  
    </body>
</html>