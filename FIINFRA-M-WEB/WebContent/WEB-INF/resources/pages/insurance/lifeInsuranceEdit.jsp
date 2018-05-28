<%@page import="java.util.Date"%>
<%@page import="in.fiinfra.common.common.InsuranceData"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set  value="${insuranceData.commencementDate}" var="commencementDate"/>
<c:set value="${insuranceData.maturityDate}" var="maturityDate"/>
<%
					String connDate = "";
               		if(pageContext.getAttribute("commencementDate") != null)
						connDate = pageContext.getAttribute("commencementDate").toString().replace(" ","-");
               		else 
               			connDate = "";
			
					String matDate = "";
               		if(pageContext.getAttribute("maturityDate") != null)
               			matDate = pageContext.getAttribute("maturityDate").toString().replace(" ","-");
               		else 
               			matDate = "";
				%>   

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script>
var insuranceType = ${insuranceTypeId};
function jsonPopulateDropdownForInsurance(url, data, dropdown, fieldName, selectedValue) {
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
					if(item.codeValueId !=63001 && item.codeValueId !=63002 && item.codeValueId !=63008) {
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
 initialData = [];
 finalData = [];

function checkDataInitial(){
	initialData = [];
	initialData.push($("#associatedFamilyPartyId").val());
	initialData.push('${insuranceData.productID}');
	initialData.push($("#insuranceCoverAmount").val());
	initialData.push($("#insurancePremiumAmount").val());
	initialData.push('${insuranceData.insurancePremiumPeriodTypeID}');
	if(insuranceType != 73001)
	{
		initialData.push($("#maturityAmount").val());
		initialData.push($("#currentValue").val());
	}
	//initialData.push($("#insuranceCoverTerm").val());
	initialData.push($("#insurancePaymentTerm").val());
	
	initialData.push($("#tenure").val());
	initialData.push($("#commencementDate").val());
	initialData.push($("#maturityDate").val());
}

function checkDataFinal(){
	finalData = [];
	finalData.push($("#associatedFamilyPartyId").val());
	finalData.push($("#productID").val());
	finalData.push($("#insuranceCoverAmount").val());
	finalData.push($("#insurancePremiumAmount").val());
	finalData.push($("#insurancePremiumPeriodTypeID").val());
	if(insuranceType != 73001)
	{
		finalData.push($("#maturityAmount").val());
		finalData.push($("#currentValue").val());
	}
	//finalData.push($("#insuranceCoverTerm").val());
	finalData.push($("#insurancePaymentTerm").val());
	
	finalData.push($("#tenure").val());
	finalData.push($("#commencementDate").val());
	finalData.push($("#maturityDate").val());
}

function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}

function closeDialog(){
	$(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
}
function CancelPage(url) {
	$("#associatedFamilyPartyId").val('');
	$('#familyMembers :selected').each(function(i, selected){ 					  
	$("#associatedFamilyPartyId").val($(selected).val() + "," + $("#associatedFamilyPartyId").val());		
});
	checkDataFinal();
	if(initialData.toString() == finalData.toString()){ 
		javascript:location.href=url;
	 }else{
		 
		 $(".aa_up").html("<spring:message code='dataChanged' />");
			$(".aa_yes").click(function(){
				javascript:location.href=url;
			});	
			$(".overlay").fadeIn();
			$("#confirmDialog").fadeIn();
	} 	 
}

function changeMaturity() {	
	var ComDate = $("#commencementDate").val();
	var tenure = $("#tenure").val();	
	if(ComDate != '' && tenure != '') {
		var date = new Date(ComDate);
		var year = date.getFullYear();		
		var month = date.getMonth();
		var day = date.getDate();		
		year = parseInt(year) + parseInt(tenure);		
		var monthNames = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun",
		                   "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ];	
		var dateStr = day + "-" + monthNames[month] + "-" + year;		
		$("#maturityDate").val(dateStr);
		
		changeMaturityAmount();
	}
	changeSurrenderAmount();
}

function changeSurrenderAmount() {
	var premiumType = $("#insurancePremiumPeriodTypeID").val();
	var premiumAmount = $("#insurancePremiumAmount").val();
	var ComDate = $("#commencementDate").val();		
	if(premiumType != '' && premiumAmount != '' && ComDate != '') {
		var surrenderAmount = 0;	
		var dateStart = new Date(ComDate);
		var yearStart = dateStart.getFullYear();	
		var dateCurrent = new Date();
		var yearCurrent = dateCurrent.getFullYear();
	
		if(premiumType == 63003)
			premiumAmount = premiumAmount*12;
		else if(premiumType == 63004)
			premiumAmount = premiumAmount*4;
		else if(premiumType == 63005)
			premiumAmount = premiumAmount*2;
		else if(premiumType == 63007)
			 if(yearCurrent!=yearStart)
			{ 
				 premiumAmount = premiumAmount/(yearCurrent-yearStart);	 
			}
		if((yearCurrent-yearStart)==0)
		{
			var amount = premiumAmount * 1;
		}
		else
		{
			var amount = premiumAmount * (yearCurrent-yearStart);
		}
		surrenderAmount = amount + amount*0.06;
	
			$("#currentValue").val(surrenderAmount);
	}
}

function changeMaturityAmount() {
	var sumAssured = $("#insuranceCoverAmount").val();
	var tenure = $("#tenure").val();
	var maturityAmout = 0;
	if(sumAssured != '' && tenure != '' ) {
		
		tenure = parseFloat(tenure);
		maturityAmout = parseFloat(sumAssured)*Math.pow((1+0.06),tenure);
		
			$("#maturityAmount").val(maturityAmout.toFixed(0));
	}
}
var cnt = 1;
function doSave(actions)
{
	if(actions=='close')
	{
		$("#returnUrl").val('${saveAndClose}');
	}
	else if(actions=='new')
	{
		$("#returnUrl").val('${saveAndNew}');
	}
	
	$("#productName").val($("#productID option:selected").text());
	var selectedIds = "";
	var selectedNames = "";
	$('#familyMembers :selected').each(function(i, selected){
		if(selectedIds!=""){
		selectedIds = selectedIds+","+$(selected).val();
		selectedNames = selectedNames+","+$(selected).text();
		}else
		{
			selectedIds = $(selected).val();
			selectedNames = $(selected).text();
		}
	});	
	$("#associatedFamilyPartyId").val(selectedIds);
	$("#familyMembersName").val(selectedNames);
	
	/* $('#familyMembers :selected').each(function(i, selected){ 					  
		$("#associatedFamilyPartyId").val($(selected).val() + "," + $("#associatedFamilyPartyId").val());
		$("#familyMembersName").val($(selected).text() + "," + $("#familyMembersName").val() );
	}); */
	
	if($('#lifeInsuranceForm').validate().form()){		
		 checkDataFinal();
		 var paymentTerm = $("#insurancePaymentTerm").val();
		 var tenure = $("#tenure").val();		 
		  if(initialData.toString()==finalData.toString()){ 
			   alertMessage("You haven't changed any data yet. Please make some changes then save.");
		   } else if(parseInt(paymentTerm)>parseInt(tenure)){				
				 $("#successDialog").html("Payment Term should be less than or equal to tenure period");
					$( "#successDialog").dialog( "open" );
		  } else {
			  if(cnt == 1) {
					cnt++;					
					$("#lifeInsuranceForm").submit();
	 				$(".save_new").addClass("inactiveLink");
					$(".save_close").addClass("inactiveLink");
				}			  
		  }
	 }
}

$(function() {
	  $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
	  showOn: "button",
	  buttonText: '',
	  changeMonth: true,
	  changeYear: true,
      yearRange: "-100:+0",
      maxDate:"0"
	});
});



$(document).ready(function(){
	$(".head_txt").html('${pageHeader}');
	getAutoComplete();
	$("#lifeInsuranceForm").validate({ignore:'',rules:{insuranceCoverAmount:{min:1},insurancePremiumAmount:{min:1},tenure:{min:1},insurancePaymentTerm:{min:1}}});
	$("li").addClass("rel");
	
	
    $('.wrapper').addClass("edit_term_life_insurance_wrapper add_assets");
    $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );
    $('.common_in_content').slimScroll();
    $('.mebmers_covered').listbox();
    var availableProducts = ["ActionScript","AppleScript","Asp","BASIC","C","C++","Clojure","COBOL",
							"ColdFusion","Erlang","Fortran","Groovy","Haskell","Java","JavaScript","Lisp","Perl","PHP",
							"Python","Ruby","Scala","Scheme"];
    //$( ".product_list" ).autocomplete({source: availableProducts});
    // $("select").selectBoxIt();
    $(".premium_type").selectBoxIt();
    jsonPopulateDropdownForInsurance("${pageContext.request.contextPath}/common/codevaluesforInsurance?codeTypeId=FrequencyID", '{}', "#insurancePremiumPeriodTypeID", "insurancePremiumPeriodTypeID",'${insuranceData.insurancePremiumPeriodTypeID}');
  
    $('#productID').siblings('.ui-combobox').find('.ui-autocomplete-input').val("${insuranceData.productName}");
  
	$("#associatedFamilyPartyId").val('');
	$('#familyMembers :selected').each(function(i, selected){ 					  
	 		$("#associatedFamilyPartyId").val($(selected).val() + "," + $("#associatedFamilyPartyId").val());		
	});	
	/* var insuranceType = ${insuranceTypeId};
    if(insuranceType == 73001) {   		
    	$("#currValLabel").hide();
    	$("#currVal").hide();
 		$("#currentValue").removeClass('required');
   		$("#currentValue").removeClass('Number1');
   		//$("#currentValue").removeClass('amount');
   		$("#currentValue").rules("remove");
   		
   		$("#matAmountLable").hide();
   		$(".lastHeader").hide();   		
    	$("#maturityAmount").hide();
 		$("#maturityAmount").removeClass('required');   		
   		$("#maturityAmount").removeClass('amount');
   		$("#maturityAmount").rules("remove");
    }  */
    checkDataInitial();
});

function getAutoComplete(){
	(function( $ ) {
	    $.widget( "custom.combobox", {
	      _create: function() {
	        this.wrapper = $( "<span>" )
	          .addClass( "custom-combobox" )
	          .insertAfter( this.element );
	 
	        this.element.hide();
	        this._createAutocomplete();
	      },
	 
	      _createAutocomplete: function() {
	        var selected = this.element.children( ":selected" ),
	          value = selected.val() ? selected.text() : "";
	 
	        this.input = $( "<input>" )
	          .appendTo( this.wrapper )
	          .val( value )
	          .attr( "title", "" )
	          .addClass( "custom-combobox-input common_input ui-widget ui-widget-content ui-state-default ui-corner-left" )
	          .autocomplete({
	            delay: 500,
	            minLength: 2,
	            source: $.proxy( this, "_source" )
	          })
	          .tooltip({
	            tooltipClass: "ui-state-highlight"
	          });
	 
	        this._on( this.input, {
	          autocompleteselect: function( event, ui ) {
	            ui.item.option.selected = true;
	            this._trigger( "select", event, {
	              item: ui.item.option
	            });
	          },
	 
	          autocompletechange: "_removeIfInvalid"
	        });
	      },
	 
	      _source: function( request, response ) {
	    	 
	    	var productData = request.term;
	    	$(".product_list").children(".products").remove();
			
			$.ajax({
			    url: "${pageContext.request.contextPath}/partner/getProductList",
			    type: "GET",
			    dataType: "json",
			    data: {'productData':productData,'assetClassId':'46004','productTypeId':'47007','categoryId':'${categoryId}'},
			    success: function( data ) {
			             
			    	$.each(data, function(index, product){
			    		$(".product_list").append("<option class='products' value="+ product.value +">"+product.text+"</option>");
			    	});
			        
			        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
			        response( $(".product_list").children( "option" ).map(function() {
			          var text = $( this ).text();
			          if ( this.value && ( !request.term || matcher.test(text) ) )
			            return {
			              label: text,
			              value: text,
			              option: this
			            };
			        }) );
			        
			    },
			    error: function (error) {
			       alert('error: ' + error);
			    }
			 });  	    	 
	        
	      },
	 
	      _removeIfInvalid: function( event, ui ) {
	 
	    	  if ( ui.item ) {	    	  
	 
		        // Search for a match (case-insensitive)
		        var value = this.input.val(),
		          valueLowerCase = value.toLowerCase(),
		          valid = false;
		        this.element.children( "option" ).each(function() {
		          if ( $( this ).text().toLowerCase() === valueLowerCase ) {
		            this.selected = valid = true;		            
		            return false;
		          }
		        });
		 
		        // Found a match, nothing to do
		        if ( valid ) {
		        	return;
		        }
		 
		        // Remove invalid value
		        this.input
		          .val( "" )
		          .attr( "title", value + " didn't match any item" )
		          .tooltip( "open" );
		        this.element.val( "" );
		        this._delay(function() {
		          this.input.tooltip( "close" ).attr( "title", "" );
		        }, 2500 );
		        this.input.autocomplete( "instance" ).term = "";
	    	  }else{
	    		  var value = this.input.val();
	    		  this.input
		          .val( "" )
		          .attr( "title", value + " didn't match any item" )
		          .tooltip( "open" );
		        this.element.val( "" );
		        this._delay(function() {
		          this.input.tooltip( "close" ).attr( "title", "" );
		        }, 2500 );
	    	  }
	      },
	 
	      _destroy: function() {
	        this.wrapper.remove();
	        this.element.show();
	      }
	    });
	  })( jQuery );
	
	$(function() {
 		$( ".product_list" ).combobox();
   }); 
	
	
	$(function() {

		$(document).ajaxStop(function() {
			 $('#page_loader').fadeOut();
		});

		$(document).ajaxStart(function() {
			 $('#page_loader').fadeIn();
		});

	});

}

</script>
</head>
<body>
<!-- Wrapper starts-->
<div class=""> 
  <!-- Main starts-->
  <form name="lifeInsuranceForm" id="lifeInsuranceForm" action="${pageContext.request.contextPath}/insurance/saveInsurance/${partyId}" method="post" commandName="insuranceData">
  <input type="hidden" name="productName" id="productName">
  <input type="hidden" name="returnUrl" id="returnUrl">
  <input type="hidden" name="insuranceTypeID" id="insuranceTypeID" value="${insuranceTypeId}">
  <input type="hidden" name="associatedFamilyPartyId" id="associatedFamilyPartyId" value="">
  <input type="hidden" name="familyMembersName" id="familyMembersName" value="">
  <input type="hidden" name="insurancePremiumType" id="insurancePremiumType">
  <input type="hidden" name="partyInsuranceId" id="partyInsuranceId" value="${partyInsuranceId}"/>
  <input type="hidden" name="assetTypeId" id="assetTypeId" value="${assetTypeId}"/>
  
  
  <section class="main"> 
    <!-- Common_content Starts-->
    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
    <div id="page_loader"></div>
      <section class="in_content common_in_content"> 
        <!-- Common_in_contnet starts-->        
        <section id="edit_endowment_life_insurance" class="in_content common_in_content clearfix">
        <% InsuranceData reqInsuranceData=(InsuranceData)request.getAttribute("insuranceData");
				String premiumAmount = "";
				String insuranceAmount = "";
				String currVal = "";
				String maturityVal = "";
   				if(reqInsuranceData.getInsurancePremiumAmount() != null) {
	   				premiumAmount = (reqInsuranceData.getInsurancePremiumAmount().longValue()) + "";
   				}
   				if(reqInsuranceData.getInsuranceCoverAmount() != null) {
	   				insuranceAmount = (reqInsuranceData.getInsuranceCoverAmount().longValue()) + "";
   				}
   				if(reqInsuranceData.getInsuranceCoverAmount() != null) {
   					currVal = (reqInsuranceData.getCurrentValue().longValue()) + "";
   				}
   				if(reqInsuranceData.getMaturityAmount() != null) {
   					maturityVal = (reqInsuranceData.getMaturityAmount().longValue()) + "";
   				}
			   %>
          <div class="continer_parent">
            <div class="fd_box dynamic_box northspace6">
              <ul class="clearfix head_title first_level_heading reset">
                <li class="title_one label fl">Family Member</li>
                <li class="title_two label fl">Policy Name</li>
                <li class="title_three label fl">Sum Assured</li>
                <li class="title_four label fl">Premium Amount</li>
                <li class="title_five label fl">Premium Type</li>
              </ul>
              <ul class="clearfix data_inputs first_level_inputs reset">
                <li class="input_one label fl">
                  <select class="mebmers_covered required" multiple id="familyMembers" name="familyMembers">
                  <c:forEach items="${relationshipIds}" var="relationShipInfo" begin="0">
				  	<c:if test="${relationShipInfo.text ne null}" >
			    		<option value="${relationShipInfo.value}">${relationShipInfo.text}</option>
				    </c:if>				              				             
			      </c:forEach>                    
                  </select>
                  <c:set var="familyMembers" value="${insuranceData.associatedFamilyPartyId}"/>
			      <c:set var="familyMemberList" value="${fn:split(familyMembers, ',')}"/>
			      <c:if test="${empty insuranceData.associatedFamilyPartyId}">
			      <c:set var="familyMemberList" value="${partyId}"/>
			      </c:if>
			      <c:forEach items="${familyMemberList}" var="member" begin="0">			      	
			      	<script>
			      	$('#familyMembers option[value=${member}]').attr('selected','selected');
			      	</script>			      	
			      </c:forEach>
                </li>
                <li class="input_two label fl"><!-- 
                  <input type="text" class="common_input product_list"/> -->
                  <select class="common_input product_list required" name="productID" id="productID">
                 	 <option selected="selected" class="products" value="${insuranceData.productID}">${insuranceData.productName}</option>
                  </select>
                </li>
                <li class="input_three label fl">
                  <input type="text" class="common_input required amount Number1" name="insuranceCoverAmount" id="insuranceCoverAmount" value="<%=insuranceAmount%>" onchange="changeMaturityAmount();" maxlength="10"/>
                </li>
                <li class="input_four label fl">
                  <input type="text" class="common_input required amount Number1" name="insurancePremiumAmount" id="insurancePremiumAmount" value="<%=premiumAmount%>" onchange="changeSurrenderAmount();" maxlength="10"/>
                </li>
                <li class="input_five label fl">
                  <select class="premium_type required" id="insurancePremiumPeriodTypeID" name="insurancePremiumPeriodTypeID" onchange="changeSurrenderAmount();"></select>
                </li>
              </ul>
              <ul class="clearfix head_title second_level_heading reset">
                <li class="title_six label fl">Commencement Date</li>
                <li class="title_seven label fl">Tenure(in years)</li>
                <li class="title_eight label fl">Payment Term</li>
                <li class="title_nine label fl">Maturity Date</li>
                <li class="title_ten label fl" id="matAmountLable">Maturity Amount</li>
              </ul>
              <ul class="clearfix data_inputs second_level_inputs reset">
                <li class="input_six label fl">
                   <input type="text" class="common_input datepicker fl required date" name="commencementDate" id="commencementDate" value="<%=connDate %>" readonly="readonly" onchange="changeMaturity();"/>
                </li>
                <li class="input_seven label fl">
                  <input type="text" class="common_input required digits Number1" name="tenure" id="tenure" value="${insuranceData.tenure}" onchange="changeMaturity();" maxlength="4"/>
                </li>
                <li class="input_eight label fl">
                  <input type="text" class="common_input required digits" name="insurancePaymentTerm" id="insurancePaymentTerm" value="${insuranceData.insurancePaymentTerm}" maxlength="4" /> 
                </li>
                  <li class="input_nine label fl">
                   <input type="text" class="common_input fl required date" name="maturityDate" id="maturityDate" value="<%=matDate %>" readonly="readonly"/>
                </li>              
                <li class="input_ten label fl">
                   <input type="text" class="common_input fl required amount" name="maturityAmount" id="maturityAmount" value="<%=maturityVal%>" maxlength="10"/>
                </li>
              </ul>
              
              <ul class="clearfix head_title second_level_heading reset lastHeader">
              <c:choose>
              <c:when test="${insuranceTypeId ne 73001}">
                <li class="title_one label fl" id="currValLabel">Surrender Value</li>
                <li class="title_two label fl" id="currValLabel">Policy Number</li>
              </c:when>
              <c:otherwise>
              <li class="title_six label fl" id="currValLabel">Policy Number</li>
              </c:otherwise>   
              </c:choose>                             
              </ul>
              <ul class="clearfix data_inputs second_level_inputs reset">
              <c:choose>
              <c:when test="${insuranceTypeId ne 73001}">
                <li class="input_first label fl" id="currVal">
                <input type="text" class="common_input required Number1" name="currentValue" id="currentValue" value="<%=currVal%>" maxlength="10"/>                
                </li>
                <li class="input_second label fl rel">
                  <input type="text" class="common_input required" id="insurancePolicyNumber" name="insurancePolicyNumber" value="${insuranceData.insurancePolicyNumber}" maxlength="25"/>
                </li>
                </c:when>
                <c:otherwise>
                <li class="input_first label fl rel">
                  <input type="text" class="common_input" id="insurancePolicyNumber" name="insurancePolicyNumber" value="${insuranceData.insurancePolicyNumber}" maxlength="25"/>
                </li>
                </c:otherwise>
                </c:choose>
                <li class="input_seven label fl"></li>
                
              </ul>
        
            </div>
          </div>
        </section>
        <!-- Common_in_contnet ends-->
        
        <div class="overlay"></div>
      </section>
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup2">
            </li>
            <!--<li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>-->
            
            <li class="fl list"><a href="#" class="anch save_new" onclick="doSave('new')"><span class="txt">Save &amp; Add</span></a></li>
            <li class="fl list"><a href="#" class="anch save_close" onclick="doSave('close')"><span class="txt">Save &amp; Close</span></a></li>
            <li class="fl list"><a href="#" onclick="CancelPage('${pageContext.request.contextPath}/insurance/life-insurance-details/${lifeInsuranceType}/${partyId}')" class="anch cancel"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
        <!-- <a href="list-of-tasks.html" class="back navgation"><span class="txt">Back</span></a> <a href="list-of-tasks.html" class="next navgation"><span class="txt">Next</span></a>--> </section>
      
      <!-- Common footer ends --> 
    </section>
    <!-- Common_content Ends--> 
    
  </section>
  </form>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<!-- For Common Custom File Input--> 
<script src="../js/plugin/jquery-filestyle.js"></script> 
<!-- For Common Custom File Input Ends-->
<div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
</body>
</html>