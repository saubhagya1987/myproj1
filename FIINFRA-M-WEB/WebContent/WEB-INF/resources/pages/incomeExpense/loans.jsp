<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
.no_data_message{ font-family: "aller bold"; font-size: 17px; height:43px; position:relative; text-align: center; padding-top: 14px; background-color:#FFF; }
.no_data_message:after{ position:absolute; content:"";width:100%;background: url(../../resources/images/shadow_list.png) no-repeat center bottom; height:10px;left:0; right:0; bottom:0}
</style>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
<title>My Loans</title>
<script>
$(document).ready(function(){
	    $("select").selectBoxIt();
	  
	    var count = ${loanListSize};
		if(count == 0) {
			$("#nodata").show();
			$(".my_income_title_bx").hide();
			$(".total-value").html("0.00/-");
		} else {
			$("#nodata").hide();
			$(".my_income_title_bx").show();
		}
		
		$("#frmLoan").validate({
			  ignore:'', //i.e. do not ignore hidden elements 
			 });
	     
		$('.common_in_content').slimScroll();
		$('.my_income_li_bx_parent').slimScroll();
		$('#inner_contents_my_expenses_data .slimScrollDiv').addClass("record_scroll");
		$('.wrapper').addClass("my_loans");
		
		$("#confirmDialog .close").click(function(){
		    $(".overlay").fadeOut("slow");
		 $("#confirmDialog").fadeOut("slow");
		  }); 

		var listSize = $("#loanListSize").val();
		var i=0;
		var totalMonthlyEmi = 0.00;
		
		for(i=0;i<listSize;i++) {
			var loanTypeVar = "#hiddenType"+i; 
			jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=LoanTypeID", '{}', "#loanType"+i, "loanType"+i, $(loanTypeVar).val());
		}
		
		/* for(i=0;i<listSize;i++) {		
			var emiFrequencyIdVar = "#hiddenFreq"+i;		
			jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevaluesforEMI?codeTypeId=FrequencyID", '{}', "#emiFreqId"+i, "emiFreqId"+i, $(emiFrequencyIdVar).val());
		} */
		
		for(i=0;i<listSize;i++) {		
			var loanFrequencyId = $("#hiddenFreq"+i).val();
			var amt = $("#emiAmount"+i).val();			
			totalMonthlyEmi = parseFloat(totalMonthlyEmi) + parseFloat(amt);
			$(".total-value").html(totalMonthlyEmi + "/-");
			
		}
		
		$("body").on("click", ".add-income-btn", function() {
			$("#nodata").hide();
			$(".my_income_title_bx").show();
			  //$(".data-graph-income").slider('value',0);		 
			  var listSize = $("#loanListSize").val();
			  var actualListSize = $("#actualLoanListSize").val();
			  var html = '';
			  //html+="<div class='my_income_li_bx'><div class='my_income_li_bx_in'><ul class='reset'><li class='input_txt_one fl rel'><div id='icon"+listSize+"' class='icon_74002'></div></li><input type='hidden' name='partyIncomeId" + listSize + "' id='partyIncomeId" + listSize + "' value='0'> <input type='hidden' name='hiddenType" + listSize + "' id='hiddenType" + listSize+ "' value=''><li  class='input_txt_two fl rel'><select class='sel_wid' onchange='changeLogo(" + listSize + ")' id='incomeType"+ listSize +"' name='incomeType"+ listSize +"' ></select></li><li class='input_txt_three fl rel'><input class='grt_bx common_input required' id='incomeName"+ listSize +"'  name='incomeName" + listSize +"' value=''></li><li class='input_txt_four fl rel'><div class='range_parent'><div class='scale clearfix'><div class='scale_range'><span class='low extrem'>0</span><span class='high extrem'>100</span></div><div id='down_payment" +listSize+ "'></div><div class='counter_parent rupee'><input type='text' id='incomeAmount" + listSize +"' class='range_counter number' onchange='calculateNetIncome();' /></div></div></div><select id='select_"+listSize+"' class='miniselect' onChange='changeScale("+listSize+");'></select></li><li class='input_txt_five fl rel'><select class='sel_wid' id='incomeFrequencyId" +listSize+ "' name='incomeFrequencyId" +listSize+ "' onchange='calculateNetIncome();'></select></li><li class='input_txt_six fl rel'><div class='exp_grt_bx'><input type='text' class='exp_grt_txt floatNum' id='annualGrowth" +listSize+ "' name='annualGrowth" +listSize+ "'/><div class='exp_grt_per'>%</div></div></li> <li class='input_txt_seven fl'> <a class='save_row' onclick='saveLoanData(" + listSize + ")'> </a> </li><li class='input_txt_eight fl'> <a class='delete_row' id='deleteBtn_" +listSize+ "'> </a></li><li class='input_txt_nine fl'> <a class='add_doc add_note' onClick='showNotes("+ listSize +")'> </a></li><li class='input_txt_ten fl'> <a class='add_query' onClick='addQuery("+ listSize +");' > </a></li><div class='clr'></div></ul></div></div>";
			  html+="<div class='my_income_li_bx'><div class='my_income_li_bx_in'><ul class='reset clearfix'><li class='input_txt_one fl rel'><div id='icon" + listSize + "' name='icon" + listSize + "' class='icon_76006 theme_doubble_border'></div></li><input type='hidden' name='partyLoanId" + listSize + "' id='partyLoanId" + listSize + "' value='0'><li  class='input_txt_two fl rel'><select class='sel_wid' id='loanType" + listSize + "' name='loanType" + listSize + "' onchange='changeLogo(" + listSize + ");'></select></li><li class='input_txt_three fl rel'> <input class='common_input amount Number1' id='loanAmount" + listSize + "' name='loanAmount" + listSize +"' value=''/></li><li class='input_txt_four fl rel'> <input class='common_input amount Number1' id='tenure" + listSize + "' name='tenure' value=''/></li><li class='input_txt_five fl rel'><input class='common_input amount Number1' id='emiAmount" + listSize + "' name='emiAmount"+ listSize +"' value='' onchange='calculateNetEMI();'/></li><li class='input_txt_six fl rel'><select class='sel_wid' id='emiFreqId"+ listSize +"' name='emiFreqId"+ listSize +"' onchange='calculateNetEMI();'><option value='63003' selected>Monthly</option></select></li><li class='input_txt_seven fl rel'> <a class='save_row' href='#' onclick='saveLoanData(" + listSize + ")'> </a> </li><li class='input_txt_eight fl'> <a class='delete_row' id='deleteBtn_" +listSize+ "' > </a></li><li class='input_txt_nine fl'> <a class='add_doc add_note' onClick='showNotes("+ listSize +")' > </a></li><li class='input_txt_ten fl'> <a class='add_query' onClick='addQuery("+ listSize +");' > </a></li></ul></div></div>";
			  $(".my_income_li_bx_parent").append( html );		  	  
			  $("#inner_contents_my_income_data").append(html);
			  $("#loanType"+listSize).selectBoxIt();
			  $("#emiFreqId"+listSize).selectBoxIt();
			  $("#select_"+listSize).selectBoxIt();			  
			  jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=LoanTypeID", '{}', "#loanType"+listSize, "loanType"+listSize, '');
			  //jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevaluesforEMI?codeTypeId=FrequencyID", '{}', "#emiFreqId"+listSize, "emiFreqId"+listSize, '');			  
			  listSize++;
			  actualListSize++;
			  $("#loanListSize").val(listSize);
			  $("#loanIncomeListSize").val(actualListSize);
		  });
		
		$("body").on("click", ".delete_row", function() {
			$(this).closest(".my_income_li_bx").removeClass('changed-input');
			var div = $(this).closest(".my_income_li_bx");
			var delId = $(this).attr('id');
			var cnt = delId.substring(delId.indexOf("_")+1,delId.length);
			var partyLoanId = $("#partyLoanId"+cnt).val();  
			showConfirm("Delete Current Record ?", function() {
				if(partyLoanId && partyLoanId >0){						
					deleteRow(partyLoanId);				
				}
				else{
					$(div).remove();
					closeDialog();	
					var actualListSize = $("#actualLoanListSize").val();
					actualListSize--;
					 $("#actualLoanListSize").val(actualListSize);
					 if(actualListSize <= 0) {
						 	$("#nodata").show();
							$(".my_income_title_bx").hide();
							$(".total-value").html("0.00/-");					
					 }					 						
				}
				calculateNetEMI();			
			});
			
		});
		
  });
  
function showConfirm(msg, callBack){
	$( ".aa_up" ).html(msg);
	$(".aa_yes").click(function(){
		callBack();
		});	
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();	
}

function changeLogo(cnt) {
	var loanType = $("#loanType"+cnt).val();
	var iconClass = $("#icon"+cnt).attr('class');
	if(loanType != '') {
		$("#icon"+cnt).removeClass(iconClass);
		$("#icon"+cnt).addClass("icon_"+loanType);
	}
}

function saveLoanData(cnt) {
	
	$("#partyLoanId").val($("#partyLoanId"+cnt).val());
	$("#loanTypeId").val($("#loanType"+cnt).val());
	$("#loanAmount").val($("#loanAmount"+cnt).val());
	$("#loanTenureMonths").val($("#tenure"+cnt).val());
	$("#emiAmount").val($("#emiAmount"+cnt).val());
	$("#emiFreqId").val($("#emiFreqId"+cnt).val());	
	
	 $("#loanType"+cnt).addClass('required');	
	$("#loanAmount"+cnt).addClass('required');
	$("#emiAmount"+cnt).addClass('required');
	$("#emiFreqId"+cnt).addClass('required');
	$("#tenure"+cnt).addClass('required'); 
	
	if($('#frmLoan').validate().form()){			
		$("#frmLoan").submit();
	}
	
}

function showNotes(cnt) {
	var partyLoanId = $("#partyLoanId"+cnt).val();
	if(partyLoanId<=0) {
		$("#successDialog").html("Please first save loan to add a note");
		$( "#successDialog").dialog( "open" );
	} else {
		window.location ='${pageContext.request.contextPath}/notes/note?refTypeId=111013&returnUrl=/incomeExpense/showLoan/${partyId}&refId='+partyLoanId+'&partyId=${partyId}&headerName=loan';
	}
}

function addQuery(cnt) {
	var partyLoanId = $("#partyLoanId"+cnt).val();
	if(partyLoanId<=0) {
		$("#successDialog").html("Please first save loan to add a query");
		$( "#successDialog").dialog( "open" );
	} else {
		var partyId = '${partyId}';
		window.location ='${pageContext.request.contextPath}/query/add?returnUrl=${pageContext.request.contextPath}/incomeExpense/showLoan/'+partyId;
	}
}

function deleteRow(partyLoanId) {
	window.location.replace('${pageContext.request.contextPath}/incomeExpense/deleteLoan?loanId='+partyLoanId+"&partyId=${partyId}");
}

function closeDialog(){
	  $(".overlay").fadeOut("slow");
	     $("#confirmDialog").fadeOut("slow");
}

function calculateNetEMI() {
	var listSize = $("#loanListSize").val();
	var i=0;
	var totalMonthlyEmi=0;
	for(i=0;i<listSize;i++) {	
		var amt = $("#emiAmount"+i).val();
		var emiFrequencyId = $("#emiFreqId"+i).val();		
		if(emiFrequencyId != 'undefined' && emiFrequencyId != undefined ) {			
			if(amt != NaN && amt!='NaN' && amt != '') {
				if(emiFrequencyId == 63001)
					totalMonthlyEmi = parseFloat(totalMonthlyEmi) + parseFloat(amt)*30;
				else if(emiFrequencyId == 63002)
					totalMonthlyEmi = parseFloat(totalMonthlyEmi) + parseFloat(amt)*4;
				else if(emiFrequencyId == 63004)
					totalMonthlyEmi = parseFloat(totalMonthlyEmi) + parseFloat(amt)/4;
				else if(emiFrequencyId == 63005)
					totalMonthlyEmi = parseFloat(totalMonthlyEmi) + parseFloat(amt)/6;
				else if(emiFrequencyId == 63006)
					totalMonthlyEmi = parseFloat(totalMonthlyEmi) + parseFloat(amt)/12;
				else 
					totalMonthlyEmi = parseFloat(totalMonthlyEmi) + parseFloat(amt);
				
			}
		}
	} 
	 var roundOff = Math.round(totalMonthlyEmi*100)/100;
	$(".total-value").html(roundOff + "/-");
}


</script>
<style>
.no_data_message { font-family: "aller bold"; font-size: 17px; height: 43px; position: relative; text-align: center; padding-top: 14px; background-color: #FFF; }
.no_data_message:after { position: absolute; content: ""; width: 100%; background: url(../../resources/images/shadow_list.png) no-repeat center bottom; height: 10px; left: 0; right: 0; bottom: 0; }
</style>
</head>
<body>
<!-- Wrapper starts-->
<div class="wrapper"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Header Starts-->
    <!-- Header Ends-->
   <form name="frmLoan" id="frmLoan" action="${pageContext.request.contextPath}/incomeExpense/saveLoan/${partyId}"  commandName="loanData"> 
  <input type="hidden" name="partyId" id="partyId" value="${partyId}">
  <input type="hidden" name="loanListSize" id="loanListSize" value="${loanListSize}">
  <input type="hidden" name="actualLoanListSize" id="actualLoanListSize" value="${loanListSize}">
  <input type="hidden" name="partyLoanId" id="partyLoanId" value="">
  <input type="hidden" name="loanTypeId" id="loanTypeId" value="">
  <input type="hidden" name="loanAmount" id="loanAmount" value="">
  <input type="hidden" name="loanTenureMonths" id="loanTenureMonths" value="">
  <input type="hidden" name="emiAmount" id="emiAmount" value="">
  <input type="hidden" name="emiFreqId" id="emiFreqId" value="">  
  <div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  				<div class="modal_content">
    			<div class="aa_up">
     			 <spring:message code="dataChanged" />
    			</div>
   				 <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onClick="closeDialog();" class="aa_no">No</a> </div>
 			 </div>
  </div>
  
    <!-- Common_content Starts-->
    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <section class="in_content common_in_content clearfix">        
        <!-- Common_in_contnet starts-->
        <section class="">
          <div class="clearfix">
            <div class="sen_msg_txt fl"><%-- You have declared <span class="sen_msg_amt theme_color"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${dcEmi/100000}"/></span> Lacs of <span class="sen_msg_bld_txt">Outstanding Loan</span> in Financial Plan --%></div>
          </div>
          <div id="inner_contents_my_expenses_data">
          <div class="clearfix southspace1">
             <a href="#" class="add-income-btn clearfix fr common_btn">Add Loan</a></div>
             <c:if test="${empty loanDataList}">
      <c:set var="amt" value="0.0"/>
      <c:set var="unit" value="lac"/>
            <c:if test="${not empty LoanAmount}">
            <c:set var="amt" value="${LoanAmount/1000}"/>
            	<c:choose>
                    		
                    		<c:when test="${amt lt 100}">
                    			<c:set var="unit" value="k"/>
                    		</c:when> 
                    		<c:when test="${amt gt 100 or amt eq 100}">
	                    		<c:set var="amt" value="${amt/100}"/>
	                    		<c:if test="${amt lt 100}">
	                    			<c:set var="unit" value="lac"/>
	                    		</c:if>
	                    		<c:if test="${amt gt 100 or amt eq 100}">
	                    			<c:set var="amt" value="${amt/100}"/>
	                    			<c:set var="unit" value="cr"/>
	                    		</c:if>
                    		</c:when> 
                    	
            	</c:choose> 
            </c:if>
      
      	<div style="margin-left: 270px;">You have declared <b class="theme_color">${amt} ${unit}</b> of total loan in financial plan.</div>
      </c:if>
             <div id="nodata" style="display: none;">
  			<div class="clr"></div>
  		   	<div class="no_data_message theme_color">There is no Loan Defined by you</div>
  		  </div>
  
            <div class="clr"></div>
            <div class="no_data_message theme_color hide">There is no Loan Defined by you</div>
            
              
              <!--title starts--> 
       <div class="my_income_title_bx">        
        <ul class="reset clearfix">
          <li class="input_title_one fl">&nbsp;</li>
          <li class="input_title_two fl">Loan Type</li>
          <li class="input_title_three fl">Outstanding Amount</li>
          <li class="input_title_four fl">Tenure(In Months/ Years)</li>
          <li class="input_title_five fl">EMI</li>
          <li class="input_title_six fl">EMI Frequency</li>
          <li class="input_title_seven fl">Save</li>
          <li class="input_title_eight fl">Remove</li>
          <li class="input_title_nine fl">Add Notes</li>
          <li class="input_title_ten fl">Raise Query</li>
       
        </ul>
      </div>  
       
              <!--title ends--> 
               <div class="my_income_li_bx_parent">
              <div class="my_income_bx">
      <c:set value="0" var="fcnt"></c:set>      
      <c:forEach items="${loanDataList}" var="loan" varStatus="count" >
      <input type="hidden" name="hiddenType${fcnt}" id="hiddenType${fcnt}" value="${loan.loanTypeId}">
      <input type="hidden" name="partyLoanId${fcnt}" id="partyLoanId${fcnt}" value="${loan.partyLoanId}">
	  <input type="hidden" name="hiddenFreq${fcnt}" id="hiddenFreq${fcnt}" value="${loan.emiFreqId}">
	            	
      <div class="my_income_li_bx">
      <div class="my_income_li_bx_in">
        <ul class="reset clearfix">
          <li class="input_txt_one fl rel">
            <div id="icon${fcnt}" name="icon${fcnt}" class="icon_${loan.loanTypeId} theme_doubble_border"></div>
          </li>
            <li  class="input_txt_two fl rel">
              <select class="sel_wid" id= "loanType${fcnt}" name="loanType${fcnt}" onchange="changeLogo(${fcnt});">                
              </select>
            </li>
          <li class="input_txt_three fl rel"> <input class="common_input amount number Number1" id="loanAmount${fcnt}" name="loanAmount${fcnt}" value="${loan.loanAmount}"/>
          </li>
          <li class="input_txt_four fl rel">
              <input class="common_input amount number Number1" id="tenure${fcnt}" name="tenure${fcnt}" value="${loan.loanTenureMonths}"/>
            </li>
          <li class="input_txt_five fl rel">
            <input class="common_input amount number Number1" id="emiAmount${fcnt}" name="emiAmount${fcnt}" value="${loan.emiAmount}" onchange="calculateNetEMI();"/>
          </li>
           <li class="input_txt_six fl rel">
              <select class="sel_wid" id="emiFreqId${fcnt}" name="emiFreqId${fcnt}" onchange="calculateNetEMI();">
              <option value="63003" selected>Monthly</option>                
              </select>
            </li> 
          <li class="input_txt_seven fl"> <a class="save_row" onclick="saveLoanData(${fcnt})"> </a> </li>
          <li class="input_txt_eight fl"> <a class="delete_row" id="deleteBtn_${fcnt}"> </a></li>
          <li class="input_txt_nine fl"> <a class="add_doc add_note" onClick="showNotes(${fcnt})"> </a></li>
          <li class="input_txt_ten fl"> <a class="add_query" onClick="addQuery(${fcnts})"> </a></li>
          
        </ul>
      </div>
    </div>
    <c:set value="${fcnt+1}" var="fcnt"></c:set>
    </c:forEach>
           </div>  
            </div>
            <div class="nt_income theme_border">
              <div class="total-asset-value"> <span>Total EMI:</span>
                <div class="total-value rupee theme_color">5000/-</div>
                <span class="unit dynamic">per month</span></div>
            </div>
          </div>
          <!-- end of "inner-contents" id --> 
        </section>
        <!-- Common_in_contnet ends-->
        <div class="overlay"></div>
      </section>
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup2">
            <li class="fl list">
            <a href="/FIINFRA-M-WEB/partner/datacollection/cash-flow/${partyId}" class="back navgation"><span class="txt">Back</span></a>
            </li>
          </ul>
        </div>
        
        <!-- Common footer ends --> 
      </section>
    </section>
    <!-- Common_content Ends--> 
    </form>
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends-->
</body>
</html>