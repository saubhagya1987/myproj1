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
.exp_grt_txt { width: 41px; height:30px; }
</style>
<style>
.no_data_message{ font-family: "aller bold"; font-size: 17px; height:43px; position:relative; text-align: center; padding-top: 14px; background-color:#FFF; }
.no_data_message:after{ position:absolute; content:"";width:100%;background: url(../../resources/images/shadow_list.png) no-repeat center bottom; height:10px;left:0; right:0; bottom:0}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
<title>My Income</title>
<script>
var incomeData = [];
$(document).ready(function(){
	var count = ${incomeListSize};
	if(count == 0) {
		$("#nodata").show();
		$(".my_income_title_bx").hide();
		$(".total-value").html("0.00/-");
	} else {
		$("#nodata").hide();
		$(".my_income_title_bx").show();
	}
	 $("#formIncome").validate({
		  ignore:'', //i.e. do not ignore hidden elements 
		 });
	
	    $("select").selectBoxIt();
	  	$('.in_content').slimScroll();
		$('.my_income_li_bx_parent').slimScroll();
		$('.my_income_li_bx_parent').closest(".slimScrollDiv").addClass("record_scroll");
  });
</script>

<!-- custom scroll to "common_in_content" -->
<script>
$(document).ready(function(){
	
	$('.floatNum').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode != 46 &&(charCode<48 || charCode>57)))
	        return false;
	    return true;
	});
	
	
	$("#confirmDialog .close").click(function(){
	    $(".overlay").fadeOut("slow");
	 $("#confirmDialog").fadeOut("slow");
	  }); 
  
	$('.number').bind('keypress', function (evt) {
	    var charCode = (evt.which) ? evt.which : event.keyCode;		   
	    if (charCode > 31 && ((charCode<48 || charCode>57)))
	        return false;
	    return true;
	});
	
    //$('.common_in_content').slimScroll();
	//Down Payment value Slider
	//  createSlider('#big_payment',-10,20,1,"#b_payment")
	 // $( "#big_payment" ).slider({ disabled: true });
	var listSize = $("#incomeListSize").val();
	var i=0;
	var totalMonthlyIncome = 0.00;
	
	for(i=0;i<listSize;i++) {
		var incomeTypeVar = "#hiddenType"+i; 
		jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=IncomeTypeID", '{}', "#incomeType"+i, "incomeType"+i, $(incomeTypeVar).val());
	}
	
	for(i=0;i<listSize;i++) {		
		var incomeFrequencyIdVar = "#hiddenFreq"+i;		
		jsonPopulateDropdownForIncomeFrequency("${pageContext.request.contextPath}/common/codevalues?codeTypeId=FrequencyID", '{}', "#incomeFrequencyId"+i, "incomeFrequencyId"+i, $(incomeFrequencyIdVar).val());
	}
	
	for(i=0;i<listSize;i++) {		
		var hiddenIncomeAmountVar = "#hiddenAmt"+i;
		var incomeAmount = "#incomeAmount"+i;
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
		 				
		createSliderAndSetValue('#down_payment'+i,0,100,1,'#incomeAmount'+i,$(hiddenIncomeAmountVar).val()/scale);
		$("#down_payment"+i).val($(hiddenIncomeAmountVar).val()/scale);
		jsonPopulateDropdownForScale("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CurrencyDenominationId", '{}', "#select_"+i, "select_"+i, $("#denomination"+i).val());		
		$(incomeAmount).val ($(hiddenIncomeAmountVar).val()/scale);
		
	}
	
	for(i=0;i<listSize;i++) {		
		var incomeFrequencyId = $("#hiddenFreq"+i).val();
		var amt = $("#hiddenAmt"+i).val();
		if(incomeFrequencyId == 63006) {
			amt = amt*12;			
		}
		totalMonthlyIncome = parseFloat(totalMonthlyIncome) + parseFloat(amt);
		$(".total-value").html(totalMonthlyIncome + "/-");
		
	}
	
	 for(i=0;i<listSize;i++) {
		 $("#annualGrowth"+i).rules("add",{min:0,max:100});
		// $("#incomeAmount"+i).rules("add",{min:1,max:100});
	}  
	
	$("body").on("click", ".delete_row", function() {
		$(this).closest(".my_income_li_bx").removeClass('changed-input');
		var div = $(this).closest(".my_income_li_bx");
		var delId = $(this).attr('id');
		var cnt = delId.substring(delId.indexOf("_")+1,delId.length);
		var partyIncomeId = $("#partyIncomeId"+cnt).val();  
		showConfirm("Delete Current Record ?", function() {
			if(partyIncomeId && partyIncomeId >0){						
				deleteRow(partyIncomeId);				
			}
			else{
				$(div).remove();
				closeDialog();	
				var actualListSize = $("#actualIncomeListSize").val();
				actualListSize--;
				 $("#actualIncomeListSize").val(actualListSize);
				 if(actualListSize <= 0) {
					 	$("#nodata").show();
						$(".my_income_title_bx").hide();
						$(".total-value").html("0.00/-");					
				 }
				calculateNetIncome();
				
				
			}
		});
		
	});
	
	$("body").on("click", ".add-income-btn", function() {
		$("#nodata").hide();
		$(".my_income_title_bx").show();
		  //$(".data-graph-income").slider('value',0);		 
		  var listSize = $("#incomeListSize").val();
		  var actualListSize = $("#actualIncomeListSize").val();
		  var html = '';
		  html+="<div class='my_income_li_bx'><div class='my_income_li_bx_in'><ul class='reset'><li class='input_txt_one fl rel'><div id='icon"+listSize+"' class='icon_74002'></div></li><input type='hidden' name='partyIncomeId" + listSize + "' id='partyIncomeId" + listSize + "' value='0'> <input type='hidden' name='hiddenType" + listSize + "' id='hiddenType" + listSize+ "' value=''><li  class='input_txt_two fl rel'><select class='sel_wid' onchange='changeLogo(" + listSize + ")' id='incomeType"+ listSize +"' name='incomeType"+ listSize +"' ></select></li><li class='input_txt_three fl rel'><input class='grt_bx common_input' id='incomeName"+ listSize +"'  name='incomeName" + listSize +"' value=''></li><li class='input_txt_four fl rel'><div class='range_parent'><div class='scale clearfix'><div class='scale_range'><span class='low extrem'>0</span><span class='high extrem'>100</span></div><div id='down_payment" +listSize+ "'></div><div class='counter_parent rupee'><input type='text' id='incomeAmount" + listSize +"' class='range_counter number' onchange='calculateNetIncome();' /></div></div></div><select id='select_"+listSize+"' name='select_"+listSize+"' class='miniselect' onChange='changeScale("+listSize+");'></select></li><li class='input_txt_five fl rel'><select class='sel_wid' id='incomeFrequencyId" +listSize+ "' name='incomeFrequencyId" +listSize+ "' onchange='calculateNetIncome();'></select></li><li class='input_txt_six fl rel'><div class='exp_grt_bx'><input type='text' class='exp_grt_txt floatNum' id='annualGrowth" +listSize+ "' name='annualGrowth" +listSize+ "'/><div class='exp_grt_per'>%</div></div></li> <li class='input_txt_seven fl'> <a class='save_row' onclick='saveIncomeData(" + listSize + ")'> </a> </li><li class='input_txt_eight fl'> <a class='delete_row' id='deleteBtn_" +listSize+ "'> </a></li><li class='input_txt_nine fl'> <a class='add_doc add_note' onClick='showNotes("+ listSize +")'> </a></li><li class='input_txt_ten fl'> <a class='add_query' onClick='addQuery("+ listSize +");' > </a></li><div class='clr'></div></ul></div></div>";		
		  $(".my_income_li_bx_parent").prepend( html );		  	  
		  $("#inner_contents_my_income_data").prepend(html);
		  $("#incomeType"+listSize).selectBoxIt();
		  $("#incomeFrequencyId"+listSize).selectBoxIt();
		  $("#select_"+listSize).selectBoxIt();
		  createSlider('#down_payment'+listSize,0,100,1,"#incomeAmount"+listSize);
		  jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=IncomeTypeID", '{}', "#incomeType"+listSize, "incomeType"+listSize, '');
		  jsonPopulateDropdownForIncomeFrequency("${pageContext.request.contextPath}/common/codevalues?codeTypeId=FrequencyID", '{}', "#incomeFrequencyId"+listSize, "incomeFrequencyId"+listSize, '');
		  jsonPopulateDropdownForScale("${pageContext.request.contextPath}/common/codevalues?codeTypeId=CurrencyDenominationId", '{}', "#select_"+listSize, "select_"+listSize, '142001');
		  $("#annualGrowth"+listSize).rules("add",{min:0,max:100});
		  //$("#incomeAmount"+listSize).rules("add",{min:1,max:100});		  
		  listSize++;
		  actualListSize++;
		  $("#incomeListSize").val(listSize);
		  $("#actualIncomeListSize").val(actualListSize);
	  });
  });

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
					if(item.codeValueId ==63006 || item.codeValueId ==63003) {
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


function showConfirm(msg, callBack){
		$( ".aa_up" ).html(msg);
		$(".aa_yes").click(function(){
			callBack();
			});	
			$(".overlay").fadeIn();
			$("#confirmDialog").fadeIn();	
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
	function closeDialog(){
		  $(".overlay").fadeOut("slow");
		     $("#confirmDialog").fadeOut("slow");
	}	
	
	function deleteRow(partyIncomeId) {
		window.location.replace('${pageContext.request.contextPath}/incomeExpense/deleteIncome?incomeId='+partyIncomeId+"&partyId=${partyId}");
	}
	
	function changeLogo(cnt) {
		var incomeType = $("#incomeType"+cnt).val();
		var iconClass = $("#icon"+cnt).attr('class');
		if(incomeType != '') {
			$("#icon"+cnt).removeClass(iconClass);
			$("#icon"+cnt).addClass("icon_"+incomeType);
		}
	}
	
	function saveIncomeData(cnt) {
		incomeData = [];
		incomeData.push($("#partyIncomeId"+cnt).val());
		incomeData.push(${partyId});
		incomeData.push($("#incomeType"+cnt).val());
		incomeData.push($("#incomeName"+cnt).val());
		var scale=1000;
		if($("#select_"+cnt).val()==142001) {
			scale = 1000;
		} else if($("#select_"+cnt).val()==142002) {
			scale=100000;
		} else if($("#select_"+cnt).val()==142003) {
			scale=10000000;
		}
		incomeData.push($("#incomeAmount"+cnt).val()*scale);
		incomeData.push($("#incomeFrequencyId"+cnt).val());
		if($("#incomeFrequencyId"+cnt).val() == 63003) {
			incomeData.push($("#incomeAmount"+cnt).val()*12*scale);
		} else {
			incomeData.push($("#incomeAmount"+cnt).val()*scale);
		}
		incomeData.push($("#annualGrowth"+cnt).val());
		incomeData.push(($("#select_"+cnt).val()));
		$("#resultData").val(incomeData.toString());
		var res = $("#resultData").val();
		
		
		$("#incomeType"+cnt).addClass('required');
		//$("#incomeName"+cnt).addClass('required');
		$("#incomeAmount"+cnt).addClass('required');
		$("#incomeFrequencyId"+cnt).addClass('required');
		$("#annualGrowth"+cnt).addClass('required');
		$("#incomeAmount"+cnt).rules("add",{min:1,max:100});
		if($('#formIncome').validate().form()){			
			window.location.replace('${pageContext.request.contextPath}/incomeExpense/addIncome?partyId=${partyId}&resultData='+res);
			
		}
		
	}
	
	function calculateNetIncome() {
		var listSize = $("#incomeListSize").val();
		var i=0;
		var totalMonthlyIncome=0;
		for(i=0;i<listSize;i++) {		
			var incomeFrequencyId = $("#incomeFrequencyId"+i).val();
			if(incomeFrequencyId != 'undefined' && incomeFrequencyId != undefined) {
				if(amt != NaN && amt!='NaN') {
			var scale = 1000;
			if($("#select_"+i).val()==142001) {
				scale = 1000;
			} else if($("#select_"+i).val()==142002) {
				scale=100000;
			} else if($("#select_"+i).val()==142003) {
				scale=10000000;
			}
			var amt = $("#incomeAmount"+i).val()*scale;												
				if(incomeFrequencyId == 63006) {
					amt = amt/12;			
				}
				totalMonthlyIncome = parseFloat(totalMonthlyIncome) + parseFloat(amt);
			}
		}
		} 
		 var roundOff = Math.round(totalMonthlyIncome*100)/100;
		$(".total-value").html(roundOff + "/-");
	}
	
	function showNotes(cnt) {
		var partyIncomeId = $("#partyIncomeId"+cnt).val();
		if(partyIncomeId<=0) {
			$("#successDialog").html("Please first save income to add a note");
			$( "#successDialog").dialog( "open" );
		} else {
			window.location ='${pageContext.request.contextPath}/notes/note?refTypeId=111013&returnUrl=/incomeExpense/showIncome/${partyId}&refId='+partyIncomeId+'&partyId=${partyId}&headerName=income';
		}
	}
	
	function addQuery(cnt) {
		var partyIncomeId = $("#partyIncomeId"+cnt).val();
		if(partyIncomeId<=0) {
			$("#successDialog").html("Please first save income to add a note");
			$( "#successDialog").dialog( "open" );
		} else {
			var partyId = '${partyId}';
			window.location ='${pageContext.request.contextPath}/query/add?returnUrl=${pageContext.request.contextPath}/incomeExpense/showIncome/'+partyId;
		}
	}
	
	
</script>
<!-- custom scroll to "common_in_content" -->


</head>
<body>
<!-- Wrapper starts-->
<div class="" id="my_income"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Header Starts-->
    
    <!-- Header Ends--> 
    <form name="formIncome" id="formIncome">
    <!-- Common_content Starts-->
    <section class="content common_content">      
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <!-- Common_in_contnet starts-->
      <section class="in_content common_in_content clearfix">  
  <input type="hidden" name="partyId" id="partyId" value="${partyId}">
  <input type="hidden" name="incomeListSize" id="incomeListSize" value="${incomeListSize}">
  <input type="hidden" name="actualIncomeListSize" id="actualIncomeListSize" value="${incomeListSize}">
  <input type="hidden" name="resultData" id="resultData" value="">
  <div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  				<div class="modal_content">
    			<div class="aa_up">
     			 <spring:message code="dataChanged" />
    			</div>
   				 <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onClick="closeDialog();" class="aa_no">No</a> </div>
 			 </div>
			</div>
  <div class="clearfix">
  <div class="sen_msg_txt fl"><!-- You have declared  --><!-- <span class="sen_msg_amt theme_color"> --><%-- <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${dcIncome/100000}"/></span> <span class="sen_msg_txt_unit theme_color">Lacs/Per Year</span> of  <span class="sen_msg_bld_txt">Total Income</span> in Financial Plan --%></div></div>
 
  
    
    <div id="inner_contents_my_expenses_data">
      
      <!--title starts-->
      <div class="clearfix southspace1"> 
      <a href="${pageContext.request.contextPath}/incomeExpense/showExpense/${partyId}"  class="fl common_btn my_exp">My expenses</a>
      
      <a href="#" class="add-income-btn clearfix fr common_btn">Add Income</a></div>
      <c:if test="${empty incomeDataList}">
      <c:set var="amt" value="0.0"/>
      <c:set var="unit" value="lac"/>
            <c:if test="${not empty IncomeAmount}">
            <c:set var="amt" value="${IncomeAmount/1000}"/>
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
      
      	<div style="margin-left: 270px;">You have declared <b class="theme_color">${amt} ${unit}</b> per year of total income in financial plan.</div>
      </c:if>
      <div id="nodata" style="display: none;">
  		<div class="clr"></div>
     	<div class="no_data_message theme_color">There is no Income Defined by you</div>
  	  </div>
      
      <div class="my_income_title_bx">
        <ul class="reset">
          <li class="input_title_one fl">&nbsp;</li>
          <li class="input_title_two fl">Income Category</li>
          <li class="input_title_three fl">Income Title</li>
          <li class="input_title_four fl">Amount</li>
          <li class="input_title_five fl">Period</li>
          <li class="input_title_six fl">Expected Growth</li>
          <li class="input_title_seven fl">Save</li>
          <li class="input_title_eight fl">Remove</li>
          <li class="input_title_nine fl">Add Notes</li>
          <li class="input_title_ten fl">Raise Query</li>
          <div class="clr"></div>
        </ul>
      </div>
      <!--title ends--> 
     <div class="my_income_li_bx_parent">
     <c:set value="0" var="fcnt"></c:set>      
      <c:forEach items="${incomeDataList}" var="income" varStatus="count" >
      <div class="my_income_li_bx">
      <div class="my_income_li_bx_in">
        <ul class="reset">
          <li class="input_txt_one fl">
            <div id="icon${fcnt}" class="icon_${income.incomeTypeId}"></div>
          </li>
          	<input type="hidden" name="hiddenType${fcnt}" id="hiddenType${fcnt}" value="${income.incomeTypeId}">
          	<input type="hidden" name="partyIncomeId${fcnt}" id="partyIncomeId${fcnt}" value="${income.partyIncomeId}">
            <li  class="input_txt_two fl rel">
              <select class="sel_wid" onchange="changeLogo(${fcnt});" id="incomeType${fcnt}" name="incomeType${fcnt}" value="${income.incomeTypeId}"></select>
            </li>
          <li class="input_txt_three fl rel"> <input class="grt_bx common_input" id="incomeName${fcnt}" name="incomeName${fcnt}" value="${income.incomeName}">
          </li>
          <li class="input_txt_four fl rel clearfix">
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">100</span></div>
               
                    <div id="down_payment${fcnt}"></div>
                  <input type="hidden" name="hiddenAmt${fcnt}" id="hiddenAmt${fcnt}" value="${income.incomeAmount}">
                  <div class="counter_parent rupee rel">                  
                    <input type="text" id="incomeAmount${fcnt}" id="incomeAmount${fcnt}" class="range_counter number" value="${income.incomeAmount}" onchange="calculateNetIncome();"/>
                    
                    <!--<span class="unit" id="unit${fcnt}">k</span>--></div>
                </div>
              </div>
              
               <select id="select_${fcnt}" name="select_${fcnt}" class="miniselect" value="${income.currencyDenominationId}" onChange="changeScale(${fcnt});"></select>
            </li>
            <input type="hidden" name="hiddenFreq${fcnt}" id="hiddenFreq${fcnt}" value="${income.incomeFrequencyId}">
          <li class="input_txt_five fl rel">
            <select class="sel_wid" onchange="calculateNetIncome();" id="incomeFrequencyId${fcnt}" name="incomeFrequencyId${fcnt}" value="${income.incomeFrequencyId}"  >
               
              </select>
          </li>
           <li class="input_txt_six fl rel">
              <div class="exp_grt_bx">
                <input type="text" class="exp_grt_txt floatNum" name="annualGrowth${fcnt}" id="annualGrowth${fcnt}" value="<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${income.annualGrowth}"/>"/>
                <div class="exp_grt_per">%</div>
              </div>
            </li> 
          <li class="input_txt_seven fl"> <a class="save_row" id="saveBtn_${fcnt}" onclick="saveIncomeData(${fcnt});"> </a> </li>
          <li class="input_txt_eight fl"> <a class="delete_row" id="deleteBtn_${fcnt}"> </a></li>
          <li class="input_txt_nine fl"> <a class="add_doc add_note" onClick="showNotes(${fcnt});"> </a></li>
          <li class="input_txt_ten fl"> <a class="add_query" onClick="addQuery(${fcnt})"> </a></li>
          <input type="hidden" name="denomination${fcnt}" id="denomination${fcnt}" value="${income.currencyDenominationId}">
         
          <div class="clr"></div>
        </ul>
      </div>
    </div>
    <c:set value="${fcnt+1 }" var="fcnt"></c:set>
    </c:forEach> 
     </div>
     
     <!--  <div class="my_income_bx">
      txt starts
    
      
    </div> -->
      <!--txt starts-->      
  
      <div class="nt_income theme_border">
        <div class="total-asset-value"> <span>Net Income:</span>
          <div class="total-value rupee theme_color"></div>
          <span class="unit dynamic">per month</span></div>
      </div>
    </div>
    <!-- end of "inner-contents" id --> 
  </section>
            <!-- Common_in_contnet ends-->
     <section class="common_footer_actions">      	
        <div id="main_actions" class="clearfix">
        <ul class="reset clearfix fr btn_grup2">
          <li class="fl list">
          <a href="${pageContext.request.contextPath}/partner/datacollection/cash-flow/${partyId}" class="back navgation"><span class="txt">Back</span></a>
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
<div class="overlay"></div>
</body>
</html>