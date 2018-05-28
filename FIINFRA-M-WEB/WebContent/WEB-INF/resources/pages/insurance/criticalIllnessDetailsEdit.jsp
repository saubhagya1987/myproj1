<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="in.fiinfra.common.common.InsuranceData"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
/*#Add_Profile_Info .family_details .li_three {
	width: 20%;
}*/
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>

initialData = [];
finalData = [];
function checkDataInitial(){
	initialData = [];
	initialData.push($("#productID").val());
	initialData.push($("#coverAmout").val());
	initialData.push($("#premium_Amount").val());
	//initialData.push('${insuranceData.insurancePremiumPeriodTypeID}');
	initialData.push($("#associatedFamilyPartyId").val());
	initialData.push($("#commencementDate").val());
}
function checkDataFinal(){
	finalData = [];	
	finalData.push($("#productID").val());
	finalData.push($("#coverAmout").val());
	finalData.push($("#premium_Amount").val());
	//finalData.push($("#premium_type").val());	
	finalData.push($("#associatedFamilyPartyId").val());
	finalData.push($("#commencementDate").val());
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

$(function() {
	  $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
  	  showOn: "button",
	  buttonText: '',
	  changeMonth: true,
      changeYear: true,
      maxDate: '0',
      yearRange: "-100:+100"
 });
});

$(document).ready(function(){
	getAutoComplete();
	$("#frmCriticalInsurance").validate({
		  ignore:'', //i.e. do not ignore hidden elements 
		 });
 $('.wrapper').addClass("edit_critical_illness_wrapper add_assets");
 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );
 // $('.common_in_content').slimScroll();
   $('.mebmers_covered').listbox();
    var availableProducts = ["ActionScript","AppleScript","Asp","BASIC","C","C++","Clojure","COBOL",
							"ColdFusion","Erlang","Fortran","Groovy","Haskell","Java","JavaScript","Lisp","Perl","PHP",
							"Python","Ruby","Scala","Scheme"];
   // $( ".product_list" ).autocomplete({source: availableProducts});
    $(".premium_type").selectBoxIt();
    /* jsonPopulateDropdown("${pageContext.request.contextPath}/common/codevalues?codeTypeId=FrequencyID", '{}', "#premium_type", "premium_type",'${insuranceData.insurancePremiumPeriodTypeID}'); */
    $('#productId').val('${insuranceData.productID}');
 // ...then you need to set the display text of the actual autocomplete box.
 $('#productId').siblings('.ui-combobox').find('.ui-autocomplete-input').val("${insuranceData.productName}");
 $("#confirmDialog .close").click(function(){
	    $(".overlay").fadeOut("slow");
	 $("#confirmDialog").fadeOut("slow");
	  });
 $("#associatedFamilyPartyId").val('');
 $('#familyMembers :selected').each(function(i, selected){ 					  
		$("#associatedFamilyPartyId").val($(selected).val() + "," + $("#associatedFamilyPartyId").val());		
	});
 checkDataInitial();
});

var cnt = 1;
function saveInsurance(url, isNew) {
	$("#associatedFamilyPartyId").val('');
	  $("#insuranceCoverAmount").val($("#coverAmout").val());
	 $("#insurancePremiumAmount").val($("#premium_Amount").val());
	 //$("#insurancePremiumPeriodTypeID").val($("#premium_type").val()); 
	 $("#product").val($("#productID").val());
	 $("#productName").val($("#productId option:selected").text());
	 $('#familyMembers :selected').each(function(i, selected){ 					  
			$("#associatedFamilyPartyId").val($(selected).val() + "," + $("#associatedFamilyPartyId").val());
			$("#familyMembersName").val($(selected).text() + "," + $("#familyMembersName").val() );
		});
			 
	 $("#frmCriticalInsurance").attr("action", url);
	 
	 var partyId='${partyId}';
	 if(isNew) {
		 $("#returnUrl").val('insurance/critical-illness-insurance-details-add/'+partyId);
	 } else {		 
		 $("#returnUrl").val('insurance/general-insurance-details/criticalIllness/'+partyId);
	 }
	 
	 if($('#frmCriticalInsurance').validate().form()){		 
		 checkDataFinal();		 
			if(initialData.toString() == finalData.toString()){ 
				alertMessage("You haven't changed any data yet. Please make some changes then save.");
			} else {
				if(cnt == 1) {
					cnt++;					
	 				$("#frmCriticalInsurance").submit();
	 				$(".save_new").addClass("inactiveLink");
					$(".save_close").addClass("inactiveLink");
				}
			}
	 }
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

function back(url){
	javascript:location.href=url;
}

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
			    data: {'productData':productData,'assetClassId':'46004','productTypeId':'47006','categoryId':'${categoryId}'},
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

}

$(function() {

	$(document).ajaxStop(function() {
		 $('#page_loader').fadeOut();
	});

	$(document).ajaxStart(function() {
		 $('#page_loader').fadeIn();
	});

});

</script>
</head>
<body>

<% InsuranceData reqInsuranceData=(InsuranceData)request.getAttribute("insuranceData");
	String premiumAmount = "";
	String insuranceAmount = "";
   if(reqInsuranceData.getInsurancePremiumAmount() != null) {
	   premiumAmount = (reqInsuranceData.getInsurancePremiumAmount().longValue()) + "";
   }
   if(reqInsuranceData.getInsuranceCoverAmount() != null) {
	   insuranceAmount = (reqInsuranceData.getInsuranceCoverAmount().longValue()) + "";
   }
%>
<!-- Wrapper starts-->
<div class=""> 
  <!-- Main starts-->
  <form action="" id="frmCriticalInsurance" name="frmCriticalInsurance" commandName="insuranceData">
   <input type="hidden" name="insuranceCoverAmount" id="insuranceCoverAmount">
  <input type="hidden" name="insurancePremiumAmount" id="insurancePremiumAmount">
  <!-- <input type="hidden" name="insurancePremiumPeriodTypeID" id="insurancePremiumPeriodTypeID"> -->
  <input type="hidden" name="insuranceTypeID" id="insuranceTypeID" value="${insuranceTypeId}" }>
  <input type="hidden" name="associatedFamilyPartyId" id="associatedFamilyPartyId" value="">
  <input type="hidden" name="familyMembersName" id="familyMembersName" value="">
<input type="hidden" name="productName" id="productName" value="">
<input type="hidden" name="product" id="product" value="">
<input type="hidden" name="returnUrl" id="returnUrl" value="">
<input type="hidden" name="partyInsuranceId" id="partyInsuranceId" value="0">
<input type="hidden" name="partyID" id="partyID" value="${partyId}">

<c:choose>
	<c:when test="${empty insuranceData.partyInsuranceId}">
		<script>			
			$("#partyInsuranceId").val(0);
		</script>
	</c:when>
	<c:otherwise>
		<script>		
		$("#partyInsuranceId").val(${insuranceData.partyInsuranceId});
		</script>		
	</c:otherwise>
</c:choose>  
  <section class="main"> 
    <!-- Common_content Starts-->
    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
    <div id="page_loader"></div>
      <section class="in_content common_in_content"> 
      <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
			<div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  				<div class="modal_content">
    			<div class="aa_up">
     			 <spring:message code="dataChanged" />
    			</div>
   				 <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
 			 </div>
			</div>
        <!-- Common_in_contnet starts-->               
        <section id="edit_critical_illness_insurance" class="in_content common_in_content clearfix">
          <div class="continer_parent">
            <div class="fd_box dynamic_box northspace6">
              <ul class="clearfix head_title first_level_heading reset">
                <li class="title_one label fl">Family Member</li>
                <li class="title_two label fl">Policy Name</li>
                <li class="title_three label fl">Policy Number</li>
                <li class="title_four label fl">Insured Amount</li>
              
                
              </ul>
              <ul class="clearfix data_inputs first_level_inputs reset">
                <li class="input_one label fl rel">
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
                <li class="input_two label fl rel">
                  <!-- <input type="text" class="common_input product_list"/> -->
                  <select class="common_input product_list required" id="productID" name="productID">
                  <option selected="selected" class="products" value="${insuranceData.productID}">${insuranceData.productName}</option>
                  </select>
                </li>
                <li class="input_three label fl rel">
                  <input type="text" class="common_input" id="insurancePolicyNumber" name="insurancePolicyNumber" value="${insuranceData.insurancePolicyNumber}" maxlength="25"/>
                </li>
                <li class="input_four label fl rel">
                  <input type="text" class="common_input required amount Number1" id="coverAmout" name="coverAmout" value="<%=insuranceAmount%>" maxlength="10"/>
                </li>
               
                
              </ul>
              <ul class="clearfix head_title second_level_heading reset">
                <li class="title_four label fl">Premium Amount</li>
                <li class="title_five label fl">Commencement Date</li> 
               
               
              </ul>
              <ul class="clearfix data_inputs second_level_inputs reset">
                <li class="input_four label fl premium_li rel">
                  <input type="text" class="common_input required amount Number1" id="premium_Amount" name="premium_Amount" value="<%=premiumAmount%>" maxlength="10"/>                             
                </li>
                <c:set  value="${insuranceData.commencementDate}" var="commencementDate"/>
              <%
					String connDate = "";
               		if(pageContext.getAttribute("commencementDate") != null)
						connDate = pageContext.getAttribute("commencementDate").toString().replace(" ","-");
               		else 
               			connDate = "";
				%>  
                <li class="input_five label fl rel">
                 <input type="text" class="common_input datepicker fl required date" name="commencementDate" id="commencementDate" value="<%=connDate %>" readonly="readonly" />
                </li>
                
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
            
            <li class="fl list"><a href="#" class="anch save_new" onClick="saveInsurance('${pageContext.request.contextPath}/insurance/saveInsurance/${partyId}',true)"><span class="txt">Save &amp; Add</span></a></li>
            <li class="fl list"><a href="#" class="anch save_close" onClick="saveInsurance('${pageContext.request.contextPath}/insurance/saveInsurance/${partyId}',false)"><span class="txt">Save &amp; Close</span></a></li>
            <li class="fl list"><a href="#" class="anch cancel" onClick="CancelPage('${pageContext.request.contextPath}/insurance/general-insurance-details/criticalIllness/${partyId}')"><span class="txt">Cancel</span></a></li>
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

</body>
</html>