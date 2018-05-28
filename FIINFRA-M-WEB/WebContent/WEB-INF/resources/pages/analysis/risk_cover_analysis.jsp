<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Wrapper starts-->

<div id="risk_cover"> 
  <!-- Common_content Starts-->
  <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
    <div class="clr"></div>
    <!-- Common_content Starts-->
    <section class="content common_content">
      <c:set var="thumbDir" value=""/>
      <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content clearfix analysis_page" id="risk-cover-analysis">
        <%-- <c:set var="thumbCss" value="thumb_horizontal" ></c:set>
        	<c:choose>
	          	<c:when test="${thumbDir eq 'UP'}">
	          		<c:set var="thumbCss" value="thumb_up" />
	          	</c:when>
	          	<c:when test="${thumbDir eq 'DOWN'}">
	          		<c:set var="thumbCss" value="thumb_down" />
	          	</c:when>
	          	<c:when test="${thumbDir eq 'SIDE'}">
	          	<c:set var="thumbCss" value="thumb_horizontal" />
	          	</c:when>
	          	<c:otherwise>
	          		<c:set var="thumbCss" value="thumb_horizontal blur inactiveLink" />
	          	</c:otherwise>
			</c:choose>   --%>
        <div class="analysis_parent">
          <div class="first_column">
            <h2 class="heading">first take</h2>
            <div class="thumb thumb_down" id="thumbId"></div>
          </div>
          <div class="second_column">
            <h2 class="heading">your <span class="insurance_type"></span> insurance <div class="help_btn">Help</div></h2>
            <div class="insurance_meter clearfix">
              <ul class="reset clearfix rca_icons">
                <li class="rca_life active">
                  <div class="icon"></div>
                  <span class="name">Life</span></li>
                <li class="rca_health">
                  <div class="icon"></div>
                  <span class="name">Health</span></li>
                <li class="rca_critical_illness">
                  <div class="icon"></div>
                  <span class="name">Critical Illness</span></li>
                <li class="rca_accident">
                  <div class="icon"></div>
                  <span class="name">Accident</span></li>
              </ul>
              <ul class="life_insurance_type clearfix reset fl">
                <li>
                  <input type="radio" name="li_type" id="income" onclick="showLiMethods('income');"/>
                  <label for="income" id="incomeLabel">Income</label>
                </li>
                <li>
                  <input type="radio" name="li_type" id="expense" onclick="showLiMethods('expense');"/>
                   <label for="expense" id="expenseLabel">Expense</label>
                </li>
                <li>
                  <input type="radio" name="li_type" id="hlv" onclick="showLiMethods('hlv');"/>
                  <label for="hlv" id="hlvLabel">HLV</label>
                </li>
              </ul>
              
              <div class="i_meter">
                <div class="indication">
                  <div class="current">
                    <div class="background"></div>
                    current</div>
                  <div class="clr"></div>
                  <div class="ideal">
                    <div class="background"></div>
                    ideal</div>
                  <div class="clr"></div>
                </div>
                <span class="range first" id="first"></span> <span class="range second" id="second"></span> <span class="range third" id="third"></span> <span class="range fourth" id="fourth"></span> <span class="range fifth" id="fifth"></span> <span class="range sixth" id="sixth"></span> <span class="arrow current"></span> <span class="arrow ideal"></span> <span class="arrow_base"></span> </div>
            </div>
          </div>
          <div class="clr"></div>
          <div class="first_row">
            <div class="analysis_description">
              <h4 class="head">Importance of insurance.</h4>
              <p>You can manage risks in many ways - build a corpus, build a support system, take insurances, just take better care. Insurances to some extent soften the blow when loss of life or loss of health or other financial difficulties happen. But being under prepared or ill prepared is the same as being not prepared, exposing your family to undue difficulties Risk Planning is a responsibility, a duty we cannot shirk away from.</p>
            </div>
          </div>
        </div>
      </section>
      <!-- Common_in_contnet ends --> 
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup3">
            <li class="fl list inactiveLink"><a href="#" class="anch save"><span class="txt">Save</span></a></li>
            <li class="fl list"><a href="#" onClick="cancelPage('${pageContext.request.contextPath}/partner/datacollection/risk-cover/${partyId}')" class="anch cancel"><span class="txt">Cancel</span></a></li>
            <li class="fl list inactiveLink"><a href="#" class="anch skip"><span class="txt">Skip</span></a></li>
          </ul>
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list inactiveLink"><a href="#" class="anch add_note"><span class="txt">Notes</span></a></li>
            <li class="fl list inactiveLink"><a href="#" class="anch add_doc"><span class="txt">Documents</span></a></li>
          </ul>
          <ul class="reset clearfix fl btn_grup1">
            <li class="fl list"><a href="#" class="anch analysis"><span class="txt">Analysis</span></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/partner/datacollection/suggestion/risk-cover/${partyId}?returnUrl=${returnUrl}" class="anch suggeset"><span class="txt">Suggestion</span></a></li>
            <li class="fl list"><a href="${pageContext.request.contextPath}/actionplan/risk-cover-action-plan/${partyId}?returnUrl=${returnUrl}" class="anch action_plan"><span class="txt">Action Plan</span></a></li>
          </ul>
        </div>
        <a href="#" class="back navgation inactiveLink"><span class="txt">Back</span></a> <a href="#" class="next navgation inactiveLink"><span class="txt">Next</span></a> </section>
      
      <!-- Common footer ends -->
      <div id="life_insurance_help" class="common_custom_modal">
  <h3 class="modal_heading clearfix">Life Insurance Calculation Help <span class="close">X</span></h3>
  <div class="modal_content"> 
<h3>Income Replacement:</h3>
          <h6>Objective:</h6>
          <p> In case of death of primary earning member, financial loss to family is equivalent to the income that person would have earned till his / her retirement. Life insurance can be a way this loss is replaced to the family. Income replacement method uses the formula :</p>
          <!-- <p>Insurance cover = (Current  Annual Income ∗	 number of years to retirement) </p> -->
          <p>Insurance cover = (Current  Annual Income &lowast; number of years to retirement) </p>
          <h3 class="northspace4">Expense Replacement:</h3>
          <h6>Objective:</h6>
          <p> In case of death of the primary earning member, the expenses of the dependents have to be handled till they are alive. To ensure that in the absence of the breadwinner , all the inevitable expenses are  planned for and helps the family to be financially sound.</p>
          <p> Insurance cover = Present value ( expenses for expected life remaining) while accounting for Effective rate of return.  Effective rate of return
            <!-- is based on the growth rate and inflation rate − available cover </p> -->
            is based on the growth rate and inflation rate &minus; available cover </p>
          <h3 class="northspace4">HLV Replacement:</h3>
          <h6>Objective:</h6>
          <p> To ensure that in the absence of the breadwinner , all the inevitable expenses and life goals (goals such as education, marriage) are  planned for. The
            method also takes into account the outstanding loans and current assets. </p>
          <!-- <p> <strong>Calculation</strong>: Insurance cover = Cover as per Expense replacement method without considering EMIs + Value of life goals  + Loans outstanding − Available assets − available cover </p> -->
          <p> <strong>Calculation</strong>:
Insurance cover = Cover as per Expense replacement method without considering EMIs + Value of life goals + Loans outstanding &minus; Available assets &minus; Available cover </p>
          <p class="strong">Example:</p>
          <p>Let's see how it works for Mr. A.B. Joshi. Let's make following assumptions:</p>
          <table class="exmple_table">
            <tbody><tr>
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
          </tbody></table>
          <div class="example2_div clearfix">
            <table class="fl">
              <caption class="strong">
              Goals
              </caption>
              <tbody><tr>
                <th class="col1">Education</th>
                <td class="col2">INR 10 Lac</td>
              </tr>
              <tr>
                <th>Child Marriage</th>
                <td>INR 5.5 Lac</td>
              </tr>
            </tbody></table>
            <table class="fr">
              <caption class="strong">
              Current Investments
              </caption>
              <tbody><tr>
                <th class="col1">Equity</th>
                <td class="col2">INR 5 Lacs</td>
              </tr>
              <tr>
                <th>Debt</th>
                <td>INR 85,000</td>
              </tr>
            </tbody></table>
            </div>
            <div class="northspace3"><h6>Income Replacement</h6>
            <p>Insurance cover = (5 Lac &lowast; (60-35)) &minus; 15 Lac = 1.11 Cr</p>
<h6>Expense Replacement</h6>
<p> ROR = (1+Growth rate)/(1+Inflation Rate) &minus; 1 = (1.07/1.06 &minus; 1) = 0.94%</p>
<p> Insurance cover = PV(ROR/12,(Life Expectancy &minus; Current Age) &lowast; 12, &minus; Monthly expenses,0,0) </p>
<p> = PV (0.94%, (85-35) &lowast; 12, &minus; 45000,0,0) </p>
<p> = 2.15 Cr</p>
<h6> HLV</h6>
<p>Insurance cover as per expense replacement without EMI = 1.43 CR</p>
<p>Insurance cover = 1.43 Cr + 15.5 Lac + 60 Lac &minus; 6 lacs &minus; 15 lacs = 1.97 Cr</p></div>
    
 
   
   
  
  </div>
</div>
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends-->
  <input type="hidden" name="lifeThumb" id="lifeThumb" value="${analysisDetails.firstTakeLife}"/>
  <input type="hidden" name="healthThumb" id="healthThumb" value="${analysisDetails.firstTakeHealth}" />
  <input type="hidden" name="criticalThumb" id="criticalThumb" value="${analysisDetails.firstTakeCritical}" />
  <input type="hidden" name="accidentThumb" id="accidentThumb" value="${analysisDetails.firstTakeAccident}" />
  <input type="hidden" name="analysis" id="analysis" value="${analysisDetails.analysis}" />
</div>
<script>
var lifeAnalysis;
var hlvAmount;
var hlvThumb;
var expenseAmount;
var expenseThumb;
var incomeAmount;
var incomeThumb;
$(document).ready(function(){
	var direction = "";
	
	var analysis = $("#analysis").val();
	var str_array = analysis.split(',');
	lifeAnalysis = str_array[0];
	var lifelIdealAmt = str_array[1]
	var healthAnalysis = str_array[2]
	var criticalAnalysis = str_array[3];
	var accidentAnalysis = str_array[4];
	var healthIdealAmt = str_array[5];
	var criticalIdealAmt = str_array[6];
	var accidentIdealAmt = str_array[7];

	var liValues = '${analysisDetails.insuranceMethod}';
	var liArray = liValues.split('_');
	hlvAmount = liArray[0];
	hlvThumb = liArray[1];
	expenseAmount = liArray[2];
	expenseThumb = liArray[3];
	incomeAmount = liArray[4];
	incomeThumb = liArray[5];
	var method = liArray[6];

	if( method == 0 ){
		$('#hlv').addClass("selected");
		$('#hlvLabel').addClass("theme_color");
		$('#hlv').attr("checked","checked");
	}else if( method == 1 ){
		$('#expense').addClass("selected");
		$('#expenseLabel').addClass("theme_color");
		$('#expense').attr("checked","checked");
	}else if( method == 2 ){
		$('#income').addClass("selected");
		$('#incomeLabel').addClass("theme_color");
		$('#income').attr("checked","checked");
	}
	
	generateAngle(lifeAnalysis,lifelIdealAmt);
	direction = $("#lifeThumb").val();
	thumbDirection(direction);
	$(".insurance_type").html("Life");
	
 $('.analysis_parent .analysis_description').slimScroll();
 $('#life_insurance_help .modal_content').slimScroll();
   $(".rca_icons li").click(function(){
   $(".rca_icons li").removeClass("active");
   $(this).addClass("active");
   $(".insurance_type").text($(this).find(".name").text());
   
  if($(this).find(".name").text()=='Life')
   {
	  $("#risk-cover-analysis .life_insurance_type").fadeIn("slow");
	   $("#risk-cover-analysis .help_btn").fadeIn("slow");
	   generateAngle(lifeAnalysis,lifelIdealAmt);
	   
	   direction = $("#lifeThumb").val();
	   thumbDirection(direction);
   }
   if($(this).find(".name").text()!=='Life')
   {
	 
	  $("#risk-cover-analysis .life_insurance_type").fadeOut("slow");
	  $("#risk-cover-analysis .help_btn").fadeOut("slow");
   }
  
   if($(this).find(".name").text()=='Health')
   {
	   generateAngle(healthAnalysis,healthIdealAmt);
	   
	   direction = $("#healthThumb").val();
	   thumbDirection(direction);
   }
   if($(this).find(".name").text()=='Critical Illness')
   {
	   generateAngle(criticalAnalysis,criticalIdealAmt);
	   
	   direction = $("#criticalThumb").val();
	   thumbDirection(direction);
   }
   if($(this).find(".name").text()=='Accident')
   {
	   generateAngle(accidentAnalysis,accidentIdealAmt);
	   
	   direction = $("#accidentThumb").val();
	   thumbDirection(direction);
   }
   
   });
    $("#risk-cover-analysis .help_btn").click(function(){
		$(".overlay").fadeIn("slow")
		$(".common_custom_modal").fadeIn("slow")
  });   
  $(".common_custom_modal .close").click(function(){
		$(".overlay").fadeOut("slow");
		$(".common_custom_modal").fadeOut("slow")
	});

});

function generateAngle(analysisAmount,idealAmount)
{
	var range=0;
	var $elie='';
	var $elie1='';
	if(analysisAmount=='null'){
		analysisAmount = 0.0;
	}
	else
	{
		analysisAmount = parseFloat(analysisAmount);
	}
	if(idealAmount=='null'){
		idealAmount = 0.0;
	}
	else
	{
		idealAmount = parseFloat(idealAmount);
	}
	var angleToRotate = -90;
	if(analysisAmount > idealAmount){
		range = analysisAmount;
		angleToRotate = 90;
		createRange(range);
  		$elie = $(".arrow.current");
    	rotate(angleToRotate);
 		
 		
 	//set other needle
 	
 	angleToRotate = ((idealAmount/range)*180) - 90;
 	$elie1 = $(".arrow.ideal");
    rotate1(angleToRotate);
 	
 		
	}
	else if(analysisAmount <= idealAmount){
		range = idealAmount;
		createRange(range);
		angleToRotate = 90;
	 	$elie = $(".arrow.ideal");
    	rotate(angleToRotate);
 		
 		//set other needle
 	 	angleToRotate = ((analysisAmount/range)*180) - 90;
 	 	$elie1 = $(".arrow.current");
 	    rotate1(angleToRotate);
 	 	
	}
	
	function rotate(degree) {
	    	$elie.css({
	                 '-webkit-transform': 'rotate(' + degree + 'deg)',
	                 '-moz-transform': 'rotate(' + degree + 'deg)',
	                 '-ms-transform': 'rotate(' + degree + 'deg)',
	                 '-o-transform': 'rotate(' + degree + 'deg)',
	                 'transform': 'rotate(' + degree + 'deg)',
	                 
	     	});
	 	}
	
	function rotate1(degree) {
 		$elie1.css({
             '-webkit-transform': 'rotate(' + degree + 'deg)',
             '-moz-transform': 'rotate(' + degree + 'deg)',
             '-ms-transform': 'rotate(' + degree + 'deg)',
             '-o-transform': 'rotate(' + degree + 'deg)',
             'transform': 'rotate(' + degree + 'deg)',
             
 		});
		}
}

function createRange(highest){
	var range = Math.round(highest);
	$('#first').html('0 L');
	$('#second').html((range*1/500000).toFixed(2) +' L');
	$('#third').html((range*2/500000).toFixed(2)+' L');
	$('#fourth').html((range*3/500000).toFixed(2)+ ' L');
	$('#fifth').html((range*4/500000).toFixed(2)+ ' L');
	$('#sixth').html((range/100000).toFixed(2)+' L');
}


function thumbDirection(direction)
{
	 if(direction=='UP')
	   {
		   $("#thumbId").removeClass("thumb_down");
		   $("#thumbId").removeClass("thumb_horizontal");
		   $("#thumbId").addClass("thumb_up");
	   }
	   if(direction=='DOWN')
	   {
		   $("#thumbId").removeClass("thumb_up");
		   $("#thumbId").removeClass("thumb_horizontal");
		   $("#thumbId").addClass("thumb_down");
	   }
	   if(direction=='SIDE')
	   {
		   $("#thumbId").removeClass("thumb_down");
		   $("#thumbId").removeClass("thumb_up");
		   $("#thumbId").addClass("thumb_horizontal");
	   }
	
}

function showLiMethods(method){
	if( method == "hlv" ){
		generateAngle(lifeAnalysis,hlvAmount);
		thumbDirection(hlvThumb);
	}else if( method == "expense" ){
		generateAngle(lifeAnalysis,expenseAmount);
		thumbDirection(expenseThumb);
	}else if( method == "income" ){
		generateAngle(lifeAnalysis,incomeAmount);
		thumbDirection(incomeThumb);
	}
}

function cancelPage(url) {
	var returnUrl = '${returnUrl}';
	if(returnUrl != null && returnUrl!='') {
		window.location.href = returnUrl;
	} else {
		window.location.href = url;
	}
}
</script> 
