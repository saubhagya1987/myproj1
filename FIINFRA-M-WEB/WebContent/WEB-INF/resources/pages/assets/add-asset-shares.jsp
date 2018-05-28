<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<head>
<style>
#assetSharesForm label[for="investmentValue"]{top: -44px;}
#assetSharesForm label[for="currentValue"]{top: -44px;}
</style>	
<script>
$(function() {
	  $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
      showOn: "button",
	  buttonText: '',
	  changeMonth: true,
      changeYear: true,
      maxDate: '0',
      yearRange: "-100:+0"
     });
  });

jQuery.validator.addMethod("mynumber", function (value, element) {
    return this.optional(element) || /^(\d+|\d+,\d{1,2})$/.test(value);
}, "Please enter only digits");

</script>

<script>

var oldValues = [];
var cntrSave=1;
$(document).ready(function(){
	
	$(".head_txt").html('${title}');
	
	var buttons = $( "#dialog1" ).dialog( "option", "buttons" );
	// setter
	$("#dialog1").dialog("option", "buttons", [{
	   text: "Ok",
	   click: function () {
		   $(this).dialog('close');
	   }
	}]);
	$(document).on("dialogopen", "#dialog1", function(event, ui) {
		setTimeout("$('#dialog1').dialog('close')",3000);
	});
	
	$(window).bind("load", function() {
//	$( document ).ajaxComplete(function() {
	var x = document.getElementById("assetSharesForm");
    for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
	   	{
	   		oldValues[i] = x.elements[i].value;
	    }
    }
	}).trigger('load');

$(function() {

	$(document).ajaxStop(function() {
		 $('#page_loader').fadeOut();
	});

	$(document).ajaxStart(function() {
		 $('#page_loader').fadeIn();
	});

});

function closeDialog(){
	 $(".overlay").fadeOut("slow");
	    $("#confirmDialog").fadeOut("slow");
	 }

 $('.wrapper').addClass("add_assets_shares_wrapper add_assets");
 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );
  $('.common_in_content').slimScroll();
     $("#ownerPartyId").selectBoxIt();
     
     $("body").on("click", "#saveAdd", function() {
    	 if($('#assetSharesForm').validate().form()){
	    	 if(checkChangeData()){
		 			if(cntrSave==1){
		 				$("#saveAdd").addClass("inactiveLink");
    	    			$("#saveClose").addClass("inactiveLink");
		 				$('#assetSharesForm').submit();
		 				cntrSave++;
		 			}
	    		 	
		 	   	}
    	 }
     });
     
     $("body").on("click", "#saveClose", function() {
    	 if($('#assetSharesForm').validate().form()){
	    	 if(checkChangeData()){
	    		 if(cntrSave==1){
	    			 $("#saveAdd").addClass("inactiveLink");
 	    			$("#saveClose").addClass("inactiveLink");
	    			 $('#assetSharesForm').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
	 	  			$('#assetSharesForm').submit();
	 	  			cntrSave++;
		 			}
	  	   	}
    	 }
     });
     
    /*  $("body").on("click", "#cancel", function() {
 		$('#assetCancel').submit();
 }); */
     
 $("#ownerPartyId").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]); 
 $("#ownerPartyId").selectBoxIt().data('selectBox-selectBoxIt').add(${familyMembersList});
 
 var selectBox1 = $("#ownerPartyId").selectBoxIt().data('selectBox-selectBoxIt');			    
 selectBox1.selectOption('${assetStock.ownerPartyId}');
 
 getAutoComplete();
 
 $("#assetSharesForm").validate({ignore:'', rules:{investmentValue:{min:1}, currentValue:{min:1}}});
 
 $("#totalUnitsQty").rules("add", {regex:"^[0-9]*(?:\.[0-9]{0,4})?$",messages: {regex: "Enter valid Quantity" }});
 
 $("li").addClass("rel");
     
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
	    	 
			var productData=request.term;

			//var dropdownElement=$("#productSearch_"+pieces[1]+"_"+pieces[2]+"_"+pieces[3]+"_"+pieces[4]);
			
			$("#productSearch").children(".products").remove();
			
			$.ajax({
			    url: "${pageContext.request.contextPath}/assets/getAssetProductList",
			    type: "GET",
			    dataType: "json",
			    data: {'productData': productData,'assetTypeId' : '72001'},
			    success: function( data ) {
			             
			    	$.each(data, function(index, product){
			    		$("#productSearch").append("<option class='products' value="+ product.value +">"+product.text+"</option>");
			    	});
			        
			        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
			        response( $("#productSearch").children( "option" ).map(function() {
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

	    		$("#assetComp").val("");
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
		        	getManufacturer();
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
// 		alert("Hii");
 		$( ".combobox" ).combobox();
   }); 

}

function doAction(url){
	checkData(url);
}

function cancelPage(url){
	window.location.href=url;
}

function checkData(url){
	var x = document.getElementById("assetSharesForm");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValues[i] != x.elements[i].value && x.elements[i].id!="refer"){
	   			flag=0;
	   		}
	    }
    }
	if(flag==0){
		$(".aa_up").html("<spring:message code='dataChanged' />");
		$(".aa_yes").click(function(){cancelPage(url)});	
		$(".overlay").fadeIn();
		$("#confirmDialog").fadeIn();
		return false;
	}else{
		window.location.href=url;
	}
}

function checkChangeData(){
	var x = document.getElementById("assetSharesForm");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValues[i] != x.elements[i].value && x.elements[i].id!="refer"){
	   			flag=0;
	   		}
	    }
    }
	if(flag==1){
		alertMessage("You haven't changed any data yet. Please make some changes then save.")
		return false;
	}else{
		return true;
	}
}

function alertMessage(msg)
{
	$("#dialog1").html(msg);
	$( "#dialog1").dialog( "open" );
}

function getManufacturer(){
	 var productId = $("#productSearch").val();
	 
	 $.ajax({
	     url: "${pageContext.request.contextPath}/assets/getManufacturer",
	     type: "GET",
	     data: {'productId': productId},
	     success: function( data ) {
	       $("#assetComp").val(data); 
	     },
	     error: function (error) {
	        alert('error: ' + error);
	     }
	  });
	}

</script>


</head>

<body>
<!-- Wrapper starts-->
<div class="wrapper"> 
  <!-- Main starts-->
  
  <section class="main"> 
    <!-- Common_content Starts-->
    <section class="content common_content">
    <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <section class="in_content common_in_content"> 
        <!-- Common_in_contnet starts-->         
        <%-- <form:form id="assetCancel" method="POST" action="${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0">
        </form:form> --%>
          <form:form id="assetSharesForm" name="assetSharesForm" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
          <input name="assetTypeId" type="hidden" value="48006"/>
          <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
          <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
          <div id="page_loader"></div>
          <c:if test="${not(empty assetStock.partyAssetId)}">
          	<input type="hidden" id="partyAssetId" name="partyAssetId" value="${assetStock.partyAssetId}"/>
          </c:if>
          <input type="hidden" id="assetPage" name="assetPage" value="6"/>          
        <section id="add_assets_shares" class="in_content common_in_content clearfix">
          
          <div class="continer_parent">
            <div class="fd_box dynamic_box northspace6">
              <ul class="clearfix head_title first_level_heading reset">
                <li class="title_one label fl">Owner</li>
                <li class="title_two label fl">Stock Name</li>
                <li class="title_three label fl">Institute Name</li>
                <li class="title_four label fl">Investment Date</li>
                <li class="title_five label fl">Investment Amount</li>
               
              </ul>
              <ul class="clearfix data_inputs first_level_inputs reset">
                <li class="input_one label fl">
                  <select class="required" id="ownerPartyId" name="ownerPartyId">
                  </select>
                </li>
                <li class="input_two label fl">
                  <!-- <input type="text" class="common_input" name="assetName"> -->
                  	<div class="ui-widget">
					  <select class="common_input combobox required" id="productSearch" name="productId" onChange="getManufacturer();">
					    <option selected="selected" class="products" value="${assetStock.productId}">${assetStock.assetName}</option>
					  </select>
					</div>
                </li>
                <li class="input_three label fl">
                  <input type="text" class="common_input" id="assetComp" readonly="readonly" value="${assetStock.assetMgntComp}"/>
                </li>
                <li class="input_four label fl">
                  <input type="text" class="common_input datepicker fl required date" readonly="readonly" id="investmentDate" name="investmentDate" value="${assetStock.commcementDate}"/>
                </li>
                <li class="input_five label fl">
                  <input type="text" class="common_input required mynumber" id="investmentValue" name="investmentValue" value="${assetStock.monthlyDeposited}"/>
                </li>
                
              </ul>
              <ul class="clearfix head_title second_level_heading reset">
               <li class="title_six label fl">Quantity</li>
                <!-- <li class="title_eight label fl">Growth Rate(%)</li> -->
                <li class="title_seven label fl">Current Value</li>
              
              </ul>
              <ul class="clearfix data_inputs second_level_inputs reset">
              <li class="input_six label fl">
                  <input type="text" class="common_input required number" maxlength="18" id="totalUnitsQty" name="totalUnitsQty" value="${assetStock.noOfUnits}"/>
                </li>
                <li class="input_seven label fl"></li>
                <%-- <li class="input_nine label fl">
                  <input type="text" class="common_input number required" name="interestRate" value="${assetStock.interestRate}"/>
                </li> --%>
                <li class="input_eight label fl">
                  <input type="text" class="common_input required mynumber" id="currentValue" name="currentValue" value="${assetStock.currentBalance}"/>
                </li>
                
                
              </ul>
              <c:choose>
             <c:when test="${partyAssetId gt 0 }">
              <ul class="clearfix head_title third_level_heading reset">
               <li class="title_eleven label fl linked_goal_header">No. of Linked Goals</li>
              </ul>
              <ul class="clearfix data_inputs third_level_inputs reset">
               
                <li class="input_twelve label fl">
                <c:choose>
                <c:when test="${fn:length(linkedGoals) > 0}">
                  <c:forEach items="${linkedGoals}" var="linkedGoal" varStatus="counter">
                  <c:choose>
                  <c:when test="${linkedGoal.goalTypeId eq '35001'}">
                  <div class="fl education_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Education</span>
                  </div>
                  </c:when>
                  
                  <c:when test="${linkedGoal.goalTypeId eq '35005'}">
                  <div class="fl travel_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Travel</span>
                  </div>
                  </c:when>
                 
                 <c:when test="${linkedGoal.goalTypeId eq '35004'}"> 
              <div class="fl wedding_goal_icon goal_icon">
              <div class="bg"></div>
              <span class="icon_label">Wedding</span>
             
              </div>
              </c:when>
              
              <c:when test="${linkedGoal.goalTypeId eq '35006'}">
                  <div class="fl car_goal_icon goal_icon">
                  <div class="bg"></div>
                  <span class="icon_label">Car</span>
                  </div>
                 </c:when> 
                  
                  <c:when test="${linkedGoal.goalTypeId eq '35003'}">
              <div class="fl property_goal_icon goal_icon">
                <div class="bg"></div>
              <span class="icon_label">Property</span>
              </div>
              </c:when>
              
              <c:when test="${linkedGoal.goalTypeId eq '35012'}">
            <div class="fl business_goal_icon goal_icon">
                <div class="bg"></div>
            <span class="icon_label">Business</span>
            </div>
            </c:when>
            
            <c:when test="${linkedGoal.goalTypeId eq '35008'}">
           <div class="fl special_goal_icon goal_icon">
             <div class="bg"></div>
           <span class="icon_label">Special</span>
           </div>
           </c:when>
           
           <c:when test="${linkedGoal.goalTypeId eq '35013'}">
          <div class="fl other_goal_icon goal_icon">
            <div class="bg"></div>
          <span class="icon_label">Other</span>
          </div>
          </c:when>
          </c:choose>
         </c:forEach>
         </c:when>
         <c:otherwise>
         	<p>No Linked Goals To Shares</p>
         </c:otherwise>
         </c:choose>
                  <div class="clr"></div>
                </li>
              </ul>
              </c:when>
              </c:choose>
            </div>
           
          </div>
        </section>
        <!-- Common_in_contnet ends-->
        </form:form>
        <div class="overlay"></div>
      </section>
      <!-- Common footer starts -->
      <section class="common_footer_actions">
        <div id="main_actions" class="clearfix">
          <ul class="reset clearfix fr btn_grup2">
            </li>
            <!--<li class="fl list"><a href="#" class="anch save"><span class="txt">Save</span></a></li>-->
            
           <li class="fl list"><a href="#" class="anch save_new" id="saveAdd"><span class="txt">Save &amp; Add</span></a></li>
           <li class="fl list"><a href="#" class="anch save_close" id="saveClose"><span class="txt">Save &amp; Close</span></a></li>
           <li class="fl list"><a href="#" class="anch cancel" id="cancel" onclick="doAction('${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0?assetPage=6');"><span class="txt">Cancel</span></a></li>
          </ul>
        </div>
        <!-- <a href="list-of-tasks.html" class="back navgation"><span class="txt">Back</span></a> <a href="list-of-tasks.html" class="next navgation"><span class="txt">Next</span></a>--> </section>
      
      <!-- Common footer ends --> 
    </section>
    <!-- Common_content Ends--> 
    <div id="confirmDialog" class="common_custom_modal_aa"> <span class="close">X</span>
  <div class="modal_content">
    <div class="aa_up">
      <spring:message code="dataChanged" />
    </div>
    <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
  </div>
</div>
  </section>
  <!-- Main ends--> 
</div>
<!-- Wrapper ends--> 
<!-- For Common Custom File Input--> 
 
<!-- For Common Custom File Input Ends-->
</body>
</html>
