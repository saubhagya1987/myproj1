<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
</style>
<style>
.no_data_message{ font-family: "aller bold"; font-size: 17px; height:43px; position:relative; text-align: center; padding-top: 14px; background-color:#FFF; }
.no_data_message:after{ position:absolute; content:"";width:100%;background: url(../../resources/images/shadow_list.png) no-repeat center bottom; height:10px;left:0; right:0; bottom:0}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
<title>My Expense</title>
<script>
$(document).ready(function(){
	/* var rate = ${inflationRate};
	var per=0;
	if(rate>=0) {
		per=100+rate*10;
	} else {
		per=100-(rate*10)*-1;
	}
	$('.current-year').css({"left":per}); */
	$("#frmExpense").validate({
		  ignore:'', //i.e. do not ignore hidden elements 
		 });
	
	var count = ${expenseListSize};
	if(count == 0) {
		$("#nodata").show();
		$(".my_exp_title_bx").hide();
		$(".total-value").html("0.00/-");
	} else {
		$("#nodata").hide();
		$(".my_exp_title_bx").show();
	}
	
	    $("select").selectBoxIt();
		$('.in_content').slimScroll();
	  	$('.my_income_li_bx_parent').slimScroll();
			$('.my_income_li_bx_parent').closest(".slimScrollDiv").addClass("record_scroll");

	  	$("#confirmDialog .close").click(function(){
		    $(".overlay").fadeOut("slow");
		 $("#confirmDialog").fadeOut("slow");
		  }); 
	  	
  });
</script>

<!-- custom scroll to "common_in_content" -->
<script>
var expenseData = [];
var totalMonthlyIncome=0;
$(document).ready(function(){
	var listSize = $("#expenseListSize").val();	
	var i=0;
	var totalMonthlyExpense = 0.00;
	
	
	for(i=0;i<listSize;i++) {
		var expenseTypeVar = "#hiddenExpenseType"+i; 
		jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=ExpenseTypeID", '{}', "#expenseType"+i, "expenseType"+i, $(expenseTypeVar).val());
	}
	
	for(i=0;i<listSize;i++) {		
		//$("#expenseAmount"+i).rules("add",{min:1,max:100});
		var expenseFrequencyIdVar = "#hiddenFrequencyType"+i;		
		jsonPopulateDropdownForIncomeFrequency("${pageContext.request.contextPath}/common/codevalues?codeTypeId=FrequencyID", '{}', "#expenseFrequencyType"+i, "expenseFrequencyType"+i, $(expenseFrequencyIdVar).val());		
	}
	
	 for(i=0;i<listSize;i++) {		
		var hiddenExpenseAmountVar = "#hiddenexpenseAmount"+i;
		var expenseAmount = "#expenseAmount"+i;	
		var scale=1000;
		if($("#denomination"+i).val()==142001) {
			scale = 1000;
			$("#unit"+i).html("K");
		} else if($("#denomination"+i).val()==142002) {
			scale=100000;
			$("#unit"+i).html("Lac");
		} else if($("#denomination"+i).val()==142003) {
			scale=10000000;
			$("#unit"+i).html("Cr");
		}
		if($("#denomination"+i).val()==0) {
			$("#denomination"+i).val(142001);
		}
		jsonPopulateDropdownForScale("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CurrencyDenominationId", '{}', "#select_"+i, "select_"+i, $("#denomination"+i).val());
		$(expenseAmount).val($(hiddenExpenseAmountVar).val()/scale);		
	} 
	
	for(i=0;i<listSize;i++) {		
		var expenseFrequencyId = $("#hiddenFrequencyType"+i).val();		
		var amt = $("#hiddenexpenseAmount"+i).val();
		if(expenseFrequencyId == 63006) {
			amt = amt*12;			
		}
		else if(expenseFrequencyId == 63005)
		{
			amt = amt*6;
		}else if(expenseFrequencyId == 63004)
		{
			amt = amt*3;
		}
		totalMonthlyExpense = parseFloat(totalMonthlyExpense) + parseFloat(amt);
		$(".total-value").html(totalMonthlyExpense + "/-");
		
	}

	
	for(i=0;i<listSize;i++) {
		createSliderAndSetValue('#down_payment'+i,0,100,1,'#expenseAmount'+i,$('#expenseAmount'+i).val());
		$("#down_payment"+i).val($('#expenseAmount'+i).val());
	}
  
	 /* createSlider('#down_payment09',0,500,1,"#d_payment09") */
	 
	$("body").on("click", ".delete_row", function() {
		$(this).closest(".my_exp_li_bx").removeClass('changed-input');
		
		var div = $(this).closest(".my_exp_li_bx");
		var delId = $(this).attr('id');
		var cnt = delId.substring(delId.indexOf("_")+1,delId.length);
		var ExpenseId = $("#expenseId"+cnt).val();  
		showConfirm("Delete Current Record ?", function() {
			if(ExpenseId && ExpenseId >0){					
				deleteRow(ExpenseId);
			}
			else{				
				$(div).remove();
				var actualListSize = $("#actualExpenseListSize").val();
				actualListSize--;						
				 if(actualListSize <= 0) {
					 	$("#nodata").show();
						$(".my_exp_title_bx").hide();
						$(".total-value").html("0.00/-");					
				 }
				 $("#actualExpenseListSize").val(actualListSize);
				closeDialog();
				calculateNetIncome();
				
			}
		});
		
	});
	 
	$("body").on("click", ".add-income-btn", function() {
		$("#nodata").hide();
		$(".my_exp_title_bx").show();
		  //$(".data-graph-income").slider('value',0);		 
		  var listSize = $("#expenseListSize").val();
		  var actualListSize = $("#actualExpenseListSize").val();		 
		  var html = '';
		  html+="<div class='my_exp_li_bx'><div class='my_exp_li_bx_in'><ul class='reset'><input type='hidden' name='expenseId " +listSize+ "' id='expenseId"+ listSize+"' value='0'><li class='input_txt_one fl rel'><div id='icon_"+listSize+"' name='icon_"+listSize+"' class='icon_75006'></div></li><input type='hidden' name='hiddenExpenseType"+listSize+"' id='hiddenExpenseType"+listSize+"' value=''><li  class='input_txt_two fl rel'><select class='sel_wid' id='expenseType"+ listSize +"' name='expenseType"+listSize+"' onchange='changeLogo(" + listSize +");'></select></li><li class='input_txt_three fl rel'><input class='grt_bx' id='expenseName"+ listSize +"' name='expenseName"+ listSize +"' value=''></li><li class='input_txt_four fl rel'><div class='range_parent'><div class='scale clearfix'><div class='scale_range'><span class='low extrem'>0</span><span class='high extrem'>100</span></div><div id='down_payment"+ listSize +"' name='down_payment"+listSize+"'></div><div class='counter_parent rupee'><input type='hidden' name='hiddenexpenseAmount"+ listSize+"' id='hiddenexpenseAmount"+listSize+"' value=''><input type='text' id='expenseAmount"+listSize+"' name='expenseAmount"+listSize+"' value='' onchange='calculateNetIncome();' class='range_counter' /></div></div></div><select id='select_"+listSize+"' class='miniselect' onChange='changeScale("+listSize+");'></select></li><input type='hidden' name='hiddenFrequencyType"+listSize+"' id='hiddenFrequencyType"+listSize+"' value='${expense.expenseFrequencyID}'><li class='input_txt_five fl rel'><select class='sel_wid' id='expenseFrequencyType"+listSize+"' name='expenseFrequencyType"+listSize+"' value='' onchange='calculateNetIncome();' ></select></li><li class='input_txt_seven fl'> <a class='save_row' onClick='saveExpenseData("+listSize+");'> </a> </li><li class='input_txt_eight fl'> <a class='delete_row' id='deleteBtn_"+listSize+"'> </a></li><li class='input_txt_nine fl'> <a class='add_doc add_note' onClick='showNotes("+ listSize +")'> </a></li><li class='input_txt_ten fl'> <a class='add_query'> </a></li><div class='clr'></div></ul></div></div>";		
		  $( ".my_income_li_bx_parent" ).prepend( html );		  	  
		  $("#inner_contents_my_income_data").prepend(html);
		  $("#expenseType"+listSize).selectBoxIt();
		  $("#expenseFrequencyType"+listSize).selectBoxIt();
		  $("#select_"+listSize).selectBoxIt();
		  createSlider('#down_payment'+listSize,0,100,1,"#expenseAmount"+listSize);
		  jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=ExpenseTypeID", '{}', "#expenseType"+listSize, "expenseType"+listSize, '');
		  jsonPopulateDropdownForIncomeFrequency("${pageContext.request.contextPath}/common/codevalues?codeTypeId=FrequencyID", '{}', "#expenseFrequencyType"+listSize, "expenseFrequencyType"+listSize, '');
		  jsonPopulateDropdownForScale("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CurrencyDenominationId", '{}', "#select_"+listSize, "select_"+listSize, '142001');
		  //$("#expenseAmount"+listSize).rules("add",{min:1,max:100});
		  listSize++;
		  actualListSize++;		  
		  $("#expenseListSize").val(listSize);	
		  $("#actualExpenseListSize").val(actualListSize);		 
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

function closeDialog(){
	  $(".overlay").fadeOut("slow");
	     $("#confirmDialog").fadeOut("slow");
}	

function deleteRow(expenseId) {
	window.location.replace('${pageContext.request.contextPath}/incomeExpense/deleteExpense?expenseId='+expenseId+"&partyId=${partyId}");
}

function saveExpenseData(cnt) {
	expenseData = [];
	expenseData.push($("#expenseId"+cnt).val());
	expenseData.push(${partyId});
	expenseData.push($("#expenseType"+cnt).val());
	expenseData.push($("#expenseName"+cnt).val());
	var expAmt = Math.ceil(parseFloat($("#expenseAmount"+cnt).val()) * 100)/100;
	expAmt = expAmt.toFixed(0);
	var scale=1000;
	if($("#select_"+cnt).val()==142001) {
		scale = 1000;
	} else if($("#select_"+cnt).val()==142002) {
		scale=100000;
	} else if($("#select_"+cnt).val()==142003) {
		scale=10000000;
	}
	expenseData.push($("#expenseAmount"+cnt).val()*scale);
	expenseData.push($("#expenseFrequencyType"+cnt).val());
	if($("#expenseFrequencyType"+cnt).val() == 63003) {
		expenseData.push(expAmt*12*scale);
	} else if($("#expenseFrequencyType"+cnt).val() == 63004) {
		expenseData.push(expAmt*4*scale);
	}
	else if($("#expenseFrequencyType"+cnt).val() == 63005){
		expenseData.push(expAmt*2*scale);
	}
	else{
		expenseData.push(expAmt*scale);
	}
	expenseData.push($("#select_"+cnt).val());
	$("#resultData").val(expenseData.toString());
	var res = $("#resultData").val();	
	$("#expenseType"+cnt).addClass('required');
	//$("#expenseName"+cnt).addClass('required');
	$("#expenseAmount"+cnt).addClass('required');
	$("#expenseFrequencyType"+cnt).addClass('required');
	$("#expenseAmount"+cnt).rules("add",{min:1,max:100});
	if($('#frmExpense').validate().form()){
		window.location.replace('${pageContext.request.contextPath}/incomeExpense/addExpense?partyId=${partyId}&resultData='+res);		
	}
	
}

function changeLogo(cnt) {		
	var expenseType = $("#expenseType"+cnt).val();
	var iconClass = $("#icon_"+cnt).attr('class');
	if(expenseType != '') {
		$("#icon_"+cnt).removeClass(iconClass);
		$("#icon_"+cnt).addClass("icon_"+expenseType);
	}
}

function calculateNetIncome() {
	var listSize = $("#expenseListSize").val();
	var i=0;
    totalMonthlyIncome=0;
	var scale=1000;
	for(i=0;i<listSize;i++) {		
		var expenseFrequencyId = $("#expenseFrequencyType"+i).val();
		var amt = $("#expenseAmount"+i).val();		
		if(expenseFrequencyId != 'undefined' && expenseFrequencyId != undefined) {
			//alert(amt);
			//alert(totalMonthlyIncome);
			if(amt != NaN && amt!='NaN') {
				var scale = 1000;
				if($("#select_"+i).val()==142001) {
					scale = 1000;
				}else if($("#select_"+i).val()==142002) {
					scale=100000;
				}else if($("#select_"+i).val()==142003) {
					scale=10000000;
				}
				var amt = $("#expenseAmount"+i).val()*scale;												
					if(expenseFrequencyId == 63006) {
						amt = amt/12;			
					}
					else if(expenseFrequencyId == 63005)
					{
						amt = amt/6;	
					}
					else if(expenseFrequencyId == 63004)
					{
						amt = amt/3;	
					}
					totalMonthlyIncome = parseFloat(totalMonthlyIncome) + parseFloat(amt);
				}
			}
		}
	
	 var roundOff = Math.round(totalMonthlyIncome*100)/100;
	$(".total-value").html(roundOff + "/-");
}

function showNotes(cnt) {
	var expenseId = $("#expenseId"+cnt).val();
	if(expenseId<=0) {
		$("#successDialog").html("Please first save expense to add a note");
		$( "#successDialog").dialog( "open" );
	} else {
		window.location ='${pageContext.request.contextPath}/notes/note?refTypeId=111013&returnUrl=/incomeExpense/showExpense/${partyId}&refId='+expenseId+'&partyId=${partyId}&headerName=expense';
	}
}

function addQuery(cnt) {
	var expenseId = $("#expenseId"+cnt).val();
	if(expenseId<=0) {
		$("#successDialog").html("Please first save expense to add a note");
		$( "#successDialog").dialog( "open" );
	} else {
		var partyId = '${partyId}';
		window.location ='${pageContext.request.contextPath}/query/add?returnUrl=${pageContext.request.contextPath}/incomeExpense/showExpense/'+partyId;
	}
}

function jsonPopulateDropdownForIncomeFrequency(url, data, dropdown, fieldName, selectedValue) {
	$(dropdown).empty();
	$(dropdown).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	
	$.ajax({
			type : "GET",
			url : url,
			data : data,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				$.each(msg, function(index, item) {	
					if(item.codeValueId ==63006 || item.codeValueId ==63003 || item.codeValueId==63004 || item.codeValueId==63005 ) {
						$(dropdown).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });
					}
				});

				var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			    selectBox.selectOption(selectedValue);
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
}

function jsonPopulateDropdownForScale(url, data, dropdown, fieldName, selectedValue) {
	$(dropdown).empty();
	//$(dropdown).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	
	$.ajax({
			type : "GET",
			url : url,
			data : data,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				$.each(msg, function(index, item) {	
					if(item.codeValueId <=142003) {
						$(dropdown).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });
					}
				});

				var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			    selectBox.selectOption(selectedValue);
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
}

function changeScale(cnt) {
	if($("#select_"+cnt).val()==142001) {
		$("#unit"+cnt).text("K");
	} else if($("#select_"+cnt).val()==142002) {
		$("#unit"+cnt).text("Lac");
	} else if($("#select_"+cnt).val()==142003) {
		$("#unit"+cnt).text("Cr");
	}
	
	calculateNetIncome();
}

</script>
<!-- custom scroll to "common_in_content" -->


</head>
<body>
<!-- Wrapper starts-->
<div class="" id="my_expense"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Header Starts-->
    
    <!-- Header Ends--> 
    
    <!-- Common_content Starts-->
    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>      
      <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content clearfix">
   <form name="frmExpense" id="frmExpense">  
   <div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  				<div class="modal_content">
    			<div class="aa_up">
     			 <spring:message code="dataChanged" />
    			</div>
   				 <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onClick="closeDialog();" class="aa_no">No</a> </div>
 			 </div>
			</div>
  <div class="clearfix">
  <%-- <div class="sen_msg_txt fl">You have declared <span class="sen_msg_amt theme_color"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${dcExpense/100000}"/></span> <span class="sen_msg_txt_unit theme_color">Lac/Per Month</span> of  <span class="sen_msg_bld_txt theme_color">Total Expense</span> in Financial Plan</div> --%>
    <div id="inner-contents" class="fr">
        <div class="goals inflation-rate">  
         <%String  inflationStartRange=(String) request.getAttribute("inflationStartRange");
    String  inflationEndRange=(String) request.getAttribute("inflationEndRange");
   
    String inflationRate=(String) request.getAttribute("inflationRate"); 
    double leftPercentage=( CommonUtils.getPercentage(Double.valueOf(inflationStartRange),Double.valueOf(inflationEndRange),Double.valueOf(inflationRate)))*.87;
    %>
        <div class="range_parent">
        				<%-- <h2>Inflation Rate</h2>
                    	<div class="start-year">${inflationStartRange}</div> 
                        <div class="end-year">${inflationEndRange}</div><!--
                         end of "end-year" class--> 
                        <div id="goalYear" class="slider-bg theme_border"></div>
                        <div class="current-year" style="left:<%=leftPercentage%>%;"><span class="year">${inflationRate}</span></div>
                         <div class="inner-shadow-strip2"></div><!-- end of "inner-shadow-strip2" id --> --%>
                    </div></div></div>
                    
                    </div>
    
    <div id="inner_contents_my_expenses_data">
  	
    <div class="clearfix southspace1">
    <a class="common_btn my_exp" href="${pageContext.request.contextPath}/incomeExpense/showIncome/${partyId}">My Income</a>
  	<a href="#" class="add-income-btn clearfix fr common_btn">Add Expense</a> </div> 
    <c:if test="${empty expenseDataList}">
      <c:set var="amt" value="0.0"/>
      <c:set var="unit" value="lac"/>
            <c:if test="${not empty ExpenceAmount}">
            <c:set var="amt" value="${ExpenceAmount/1000}"/>
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
      
      	<div style="margin-left: 270px;">You have declared <b class="theme_color">${amt} ${unit}</b> per year of total expense in financial plan.</div>
      </c:if>
    	<div id="nodata" style="display: none;">
  		<div class="clr"></div>
     	<div class="no_data_message theme_color">There is no Expense Defined by you</div>
  	  </div>
                    
      
      <!--title starts-->
      <div class="my_exp_title_bx">
        <ul class="reset">
          <li class="input_title_one fl">&nbsp;</li>
          <li class="input_title_two fl">Expense Category</li>
          <li class="input_title_three fl">Expense Title</li>
          <li class="input_title_four fl">Amount</li>
          <li class="input_title_five fl">Period</li>
          <!--<li class="input_title_six fl">Expected Growth</li>-->
          <li class="input_title_seven fl">Save</li>
          <li class="input_title_eight fl">Remove</li>
          <li class="input_title_nine fl">Add Notes</li>
          <li class="input_title_ten fl">Raise Query</li>
          <div class="clr"></div>
        </ul>
      </div>
      <!--title ends--> 
      <div class="my_income_li_bx_parent">
       <!--txt starts-->
      <input type="hidden" name="expenseListSize" id="expenseListSize" value="${expenseListSize }">
      <input type="hidden" name="actualExpenseListSize" id="actualExpenseListSize" value="${expenseListSize}">
      <input type="hidden" name="resultData" id="resultData" value=""> 
      <c:set value="0" var="fcnt"></c:set>      
      <c:forEach items="${expenseDataList}" var="expense" varStatus="count" >
      <div class="my_exp_li_bx">
      <div class="my_exp_li_bx_in">
        <ul class="reset">
        <input type="hidden" name="expenseId${fcnt}" id="expenseId${fcnt}" value="${expense.partyExpenseID}">
          <li class="input_txt_one fl rel">
            <div id="icon_${fcnt}" name="icon_${fcnt}" class="icon_${expense.expenseTypeID}"></div>
          </li>
          	<input type="hidden" name="hiddenExpenseType${fcnt}" id="hiddenExpenseType${fcnt}" value="${expense.expenseTypeID}">
            <li  class="input_txt_two fl rel">
              <select class="sel_wid" onchange="changeLogo(${fcnt});" id="expenseType${fcnt}" name="expenseType${fcnt}"  >                
              </select>
            </li>
          <li class="input_txt_three fl rel">
            <input class="grt_bx " id="expenseName${fcnt}" name="expenseName${fcnt}" value="${expense.expenseName}">
          </li>
          <li class="input_txt_four fl rel">
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">100</span></div>
               
                    <div id="down_payment${fcnt}" name="down_payment_${fcnt}"></div>
                  
                  <div class="counter_parent rupee">
                  	<input type="hidden" name="hiddenexpenseAmount${fcnt}" id="hiddenexpenseAmount${fcnt}" value="${expense.expenseAmount}">
                    <input type="text" id="expenseAmount${fcnt}" name="expenseAmount${fcnt}" value="" class="range_counter" onchange="calculateNetIncome();"/>
                    <!--<span class="unit" id="unit${fcnt}">k</span>--></div>
                </div>
              </div>
               <select id="select_${fcnt}" class="miniselect" value="${expense.currencyDenominationId}" onChange="changeScale(${fcnt});"></select>
            </li>
            <input type="hidden" name="hiddenFrequencyType${fcnt}" id="hiddenFrequencyType${fcnt}" value="${expense.expenseFrequencyID}">
          <li class="input_txt_five fl rel">
            <select class="sel_wid" id="expenseFrequencyType${fcnt}" name="expenseFrequencyType${fcnt}" value="${expense.expenseFrequencyID}" onchange="calculateNetIncome();">                
              </select>
          </li>
          <li class="input_txt_seven fl"> <a class="save_row" onClick="saveExpenseData(${fcnt});"> </a> </li>
          <li class="input_txt_eight fl"> <a class="delete_row" id="deleteBtn_${fcnt}"> </a></li>
          <li class="input_txt_nine fl"> <a class="add_doc add_note" onClick="showNotes(${fcnt})"> </a></li>
          <li class="input_txt_ten fl"> <a class="add_query" onClick="addQuery(${fcnt});"> </a></li>
          <input type="hidden" name="denomination${fcnt}" id="denomination${fcnt}" value="${expense.currencyDenominationId}">
         
          <div class="clr"></div>
        </ul>
      </div>
    </div>
     <c:set value="${fcnt+1 }" var="fcnt"></c:set>
    </c:forEach>
    
      </div>
     <!--  <div class="my_exp_bx">
     </div> -->
      <div class="nt_income theme_border">
        <div class="total-asset-value"> <span>Net Expenses:</span>
          <div class="total-value rupee theme_color">5000/-</div>
          <span class="unit dynamic">per month</span></div>
      </div>
    </div>
    <!-- end of "inner-contents" id --> 
  </section>
   </form>
            <!-- Common_in_contnet ends-->
    <section class="common_footer_actions">      	
        <div id="main_actions" class="clearfix">
        <ul class="reset clearfix fr btn_grup2">
          <li class="fl list">
          <a href="${pageContext.request.contextPath}/partner/datacollection/cash-flow/${partyId}" class="back navgation"><span class="txt">Back</span></a>
          </li>
          </ul>
        </div>
    
  </section>  
    </section>
    <!-- Common_content Ends--> 
    
  <!-- Main ends--> 
  </section>
</div>
<!-- Wrapper ends-->
<div class="overlay"></div>
</body>
</html>