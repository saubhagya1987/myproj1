<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.title_ten {
	width: 178px;
}

.title_five {
	width: 18%;
}

#page_loader{
	background: #fff url(${pageContext.request.contextPath}/resources/images/loader.gif) no-repeat center center;
}
#assetMFSip label[for="sipAmount"]{top: -44px;}
#assetMFSip label[for="currentValue"]{top: -44px;}

#assetMFLumpSum label[for="investmentValue"]{top: -44px;}
#assetMFLumpSum label[for="currentValue"]{top: -44px;}
</style>
<head>
	
<script>
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
  
  
$(function() {
	  $( ".datepickerEnd" ).datepicker({
	  dateFormat: "dd-M-yy",
    showOn: "button",
	  buttonText: '',
	  changeMonth: true,
    changeYear: true,
    yearRange: "-100:+100"
   });
});
  
jQuery.validator.addMethod("mynumber", function (value, element) {
    return this.optional(element) || /^(\d+|\d+,\d{1,2})$/.test(value);
}, "Please enter only digits");  
  </script>

<script>

var oldValuessip = [];
var oldValueslumpsum = [];
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
		var x = document.getElementById("assetMFSip");
	    for (var i=0; i<x.length; i++) 
	    {
	   	  	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
		   	{
		   		oldValuessip[i] = x.elements[i].value;
		    }
	    }
//	});
	}).trigger('load');
	
	$(window).bind("load", function() {
//	$( document ).ajaxComplete(function() {
		var x = document.getElementById("assetMFLumpSum");
	    for (var i=0; i<x.length; i++) 
	    {
		   	if(typeof(x.elements[i]) != "undefined" && x.elements[i].id!="refer")
		   	{
		   		oldValueslumpsum[i] = x.elements[i].value;
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

var saveAddFlag = "${saveAddFlag}";
if( saveAddFlag == "lumpsum" ){
	$("#lumpSum").attr("checked",true);
	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".rd_box").fadeIn("slow");
		   });
}else if( saveAddFlag == "sip" ){
	$("#sip").attr("checked",true);
	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
	       $(".fd_box").fadeIn("slow");
		   });
}

function closeDialog(){
 $(".overlay").fadeOut("slow");
    $("#confirmDialog").fadeOut("slow");
 }

 $('.wrapper').addClass("add_assets_mutual_fund_wrapper add_assets");
 $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent fl'></div>" );
 
  $('.common_in_content').slimScroll();
     $("#ownerPartyId").selectBoxIt();
     $("#lumpSumPartyId").selectBoxIt();
     $("#sipFreqId").selectBoxIt();
     
     $("#sip").click(function(){
    		if(!($(".fd_box").is(":visible")))
    	   {
    	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
    	       $(".fd_box").fadeIn("slow");
    		   });
    	   }
    	}) 
    	 $("#lumpSum").click(function(){
    	    if(!($(".rd_box").is(":visible")))
    	   {
    	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
    	       $(".rd_box").fadeIn("slow");
    		   });
    	   }

    	})
     
     /* $('#assetMF').validate({
         rules: {
         	accountFolioNo: { 
             required: true,
         	alphanumeric: true,
         	maxlength:20
         	},
         	productSearch: { 
                 required: true
             	
             	},
             	totalUnitsQty: { 
                required: true,
            	digits: true,
            	min : 1,
            	maxlength:10
            	},	
          sipAmount:{ 
              required: true,
          	digits: true,
          	min:1,
          	maxlength:18
          
         },
         sipStartDate:{ 
             required: true
        },
        sipEndDate:{ 
            required: true 
       }
         },
         messages: {
         	
         }   
        
     }); */
     
     $("body").on("click", "#saveAdd", function() {
    	 
    	 if($('#sip').is(':checked')){
    	 
	    	 if($('#assetMFSip').validate().form()){
	    	 if(checkChangeDataSip()){
	    		 $('#sipFreqId').removeAttr('disabled');
	    		 if(cntrSave==1)
	    		 {	
	    			 $("#saveAdd").addClass("inactiveLink");
	    			$("#saveClose").addClass("inactiveLink");
	    		 	$('#assetMFSip').submit();
	    		 	cntrSave++;
	    		 }
	    	 	}
	    	 }
    	 }else {
    		 if($('#assetMFLumpSum').validate().form()){
    	    	 if(checkChangeDataLumpSum()){
    	    		 if(cntrSave==1)
    	    		 {	
    	    			 $("#saveAdd").addClass("inactiveLink");
    	    			$("#saveClose").addClass("inactiveLink");
    	    			$('#assetMFLumpSum').submit();
    	    			cntrSave++;
    	    		 }
    	    	 	}
    	    	 } 
    	 }
     });
     
     $("body").on("click", "#saveClose", function() {
    	 if($('#sip').is(':checked')){
    		
	    	 if($('#assetMFSip').validate().form()){
	    	 	if(checkChangeDataSip()){
	    	 		$('#sipFreqId').removeAttr('disabled');
	    	 		if(cntrSave==1)
   	    		 	{
	    	 			$("#saveAdd").addClass("inactiveLink");
    	    			$("#saveClose").addClass("inactiveLink");
	    	 			$('#assetMFSip').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
			  			$('#assetMFSip').submit();
			  			cntrSave++;
   	    		 	}
	    		}
	    	 }
    	 }else {
    		 if($('#assetMFLumpSum').validate().form()){
 	    	 	if(checkChangeDataLumpSum()){
 	    	 		if(cntrSave==1){
 	    	 			$("#saveAdd").addClass("inactiveLink");
    	    			$("#saveClose").addClass("inactiveLink");
 	    	 			$('#assetMFLumpSum').attr('action', '${pageContext.request.contextPath}/assets/saveAndCloseAssets');
 	 		  			$('#assetMFLumpSum').submit();
 	 		  		cntrSave++;
 	    	 		}
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
  selectBox1.selectOption('${addSip.ownerPartyId}');
  
  $("#lumpSumPartyId").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]);
  
  $("#lumpSumPartyId").selectBoxIt().data('selectBox-selectBoxIt').add(${familyMembersList});
  var selectBox1 = $("#lumpSumPartyId").selectBoxIt().data('selectBox-selectBoxIt');			    
  selectBox1.selectOption('${addLumpSum.ownerPartyId}');
  
  $("#sipFreqId").selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"","text":"---Select---"}]);
  //sipFreqId
  $("#sipFreqId").selectBoxIt().data('selectBox-selectBoxIt').add(${frequencyList});
  var selectBox2 = $("#sipFreqId").selectBoxIt().data('selectBox-selectBoxIt');			    
  
  $("#sipFreqId").attr('disabled','disabled');
  <c:choose>
  	<c:when test="${empty partyAssetId}">
  	selectBox2.selectOption('63003');
  	</c:when>
  	<c:otherwise>
  	selectBox2.selectOption('${addSip.frequency}');
  	</c:otherwise>
  </c:choose>
  
 getAutoComplete();
 /* getAutoCompleteLumpSum(); */
 
 
 <c:choose>
 <c:when test="${not(empty addSip)}">
 	$("#lumpSum").removeAttr("checked");
 	$("#sip").attr("checked",true);
 	if(!($(".fd_box").is(":visible")))
 	   {
 	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
 	       $(".fd_box").fadeIn("slow");
 		   });
 	   }
 	$("#lumpSum").addClass("inactiveLink");
 	$("#lumpSum").attr("disabled", true);
 	var selectBox1 = $("#ownerPartyId").selectBoxIt().data('selectBox-selectBoxIt');			    
 	selectBox1.selectOption('${addSip.ownerPartyId}');
 </c:when>
 <c:when test="${not(empty addLumpSum)}">
 	$("#sip").removeAttr("checked");
 	$("#lumpSum").attr("checked",true);
 	if(!($(".rd_box").is(":visible")))
 	   {
 	   $.when($(".dynamic_box").fadeOut("blind")).done(function() {
 	       $(".rd_box").fadeIn("slow");
 		   });
 	   }
 	$("#sip").addClass("inactiveLink");
 	$("#sip").attr("disabled", true);
 	var selectBox1 = $("#lumpSumPartyId").selectBoxIt().data('selectBox-selectBoxIt');			    
 	selectBox1.selectOption('${addLumpSum.ownerPartyId}');
 </c:when>
 </c:choose>
 
 
 $("#assetMFSip").validate({ignore:'', rules:{sipAmount:{min:1}, currentValue:{min:1}}});
 $("#assetMFLumpSum").validate({ignore:'', rules:{investmentValue:{min:1}, currentValue:{min:1}}});
 
 $("li").addClass("rel");
 
 $('#assetMFSip').validate({
     rules: {totalUnitsQty :{min:1}}
 });
 
 $('#assetMFLumpSum').validate({
     rules: {totalUnitsQty :{min:1}}
 });
 
$("#totalUnitsQty1").rules("add", {regex:"^[0-9]*(?:\.[0-9]{0,4})?$",messages: {regex: "Enter valid No Of Units" }});
$("#totalUnitsQty2").rules("add", {regex:"^[0-9]*(?:\.[0-9]{0,4})?$",messages: {regex: "Enter valid No Of Units" }});
 
});

function doAction(url){
	checkData(url);
}

function cancelPage(url){
	window.location.href=url;
}

function checkData(url){
	var x;
	if($('#sip').is(':checked')){
		x = document.getElementById("assetMFSip");
		oldValues = oldValuessip;
	}else {
		x = document.getElementById("assetMFLumpSum");
		oldValues = oldValueslumpsum;
	}
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

function checkChangeDataSip(){
	var x = document.getElementById("assetMFSip");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValuessip[i] != x.elements[i].value && x.elements[i].id!="refer"){
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

function checkChangeDataLumpSum(){
	var x = document.getElementById("assetMFLumpSum");
    var flag=1;
	for (var i=0; i<x.length; i++) 
    {
	   	if(typeof(x.elements[i]) != "undefined")
	   	{
	   		if( oldValueslumpsum[i] != x.elements[i].value && x.elements[i].id!="refer"){
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

function getAutoComplete(){
	 var pieces;
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
	    	 
    	    pieces=$(this.element).prop("id").split("_");
			var productData=request.term;
			
			//var dropdownElement=$("#productSearch_"+pieces[1]+"_"+pieces[2]+"_"+pieces[3]+"_"+pieces[4]);
			//select box id
			$("#productSearch_"+pieces[1]).children(".products").remove();
			
			$.ajax({
			    url: "${pageContext.request.contextPath}/assets/getAssetProductList",
			    type: "GET",
			    dataType: "json",
			    data: {'productData': productData,'assetTypeId' : '72004'},
			    success: function( data ) {
			             
			    	$.each(data, function(index, product){
			    		$("#productSearch_"+pieces[1]).append("<option class='products' value="+ product.value +">"+product.text+"</option>");
			    	});
			        
			        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
			        response( $("#productSearch_"+pieces[1]).children( "option" ).map(function() {
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
		        	getManufacturer(pieces[1]);	
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

/* function getAutoCompleteLumpSum(){
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
	    	 
    	    var pieces=$(this.element).prop("id").split("_");
			var productData=request.term;
			
			//var dropdownElement=$("#productSearch_"+pieces[1]+"_"+pieces[2]+"_"+pieces[3]+"_"+pieces[4]);
			//select box id
			$("#lumpSumProductSearch").children(".products").remove();
			
			$.ajax({
			    url: "${pageContext.request.contextPath}/assets/getAssetProductList",
			    type: "GET",
			    dataType: "json",
			    data: {'productData': productData,'assetTypeId' : '72004'},
			    success: function( data ) {
			             
			    	$.each(data, function(index, product){
			    		$("#lumpSumProductSearch").append("<option class='products' value="+ product.value +">"+product.text+"</option>");
			    	});
			        
			        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
			        response( $("#lumpSumProductSearch").children( "option" ).map(function() {
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
		        	getManufacturerLumpSum();
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
 		$( "#lumpSumProductSearch" ).combobox();
   }); 

} */

function getManufacturer(cntr){
	var productId = $("#productSearch_"+cntr).val();
	
	$.ajax({
	    url: "${pageContext.request.contextPath}/assets/getManufacturer",
	    type: "GET",
	    data: {'productId': productId},
	    success: function( data ) {
	    		$(".assetComp_"+cntr).val(data); 
	    },
	    error: function (error) {
	       alert('error: ' + error);
	    }
	 });
}

function getManufacturerLumpSum(){
	var productId = $("#ProductSearch_1").val();
	
	$.ajax({
	    url: "${pageContext.request.contextPath}/assets/getManufacturer",
	    type: "GET",
	    data: {'productId': productId},
	    success: function( data ) {
	    		$("#assetCompLumpSum").val(data); 
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
        <%-- <form:form id="assetCancel" method="POST" action="${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0">
        </form:form> --%>
        <section id="add_assets_mutual_funds"
						class="in_content common_in_content clearfix">
						<div class="clearfix top_btn">
							<div class="add_fd_btn btn fl">
								<input name="pf" type="radio" value="" id="sip" checked="">
								<label for="#sip">SIP</label>
							</div>
							<div class="add_rd_btn btn fl westspace2">
								<input name="pf" type="radio" value="" id="lumpSum"> <label
									for="#lumpSum">Lumpsum</label>
							</div>

						</div>
						<div class="continer_parent">
        <form:form id="assetMFSip" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
        <input name="assetTypeId" type="hidden" value="48001"/>
        <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
        <div id="page_loader"></div>
        <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
        <input type="hidden" id="partyAssetId" name="partyAssetId" value="${partyAssetId}"/>
        <input type="hidden" id="assetPage" name="assetPage" value="3"/>
        <input type="hidden" id="saveAddFlag" name="saveAddFlag" value="sip"/>  
            <div class="fd_box dynamic_box northspace6">
              <ul class="clearfix head_title first_level_heading reset">
              	<li class="title_ten label fl">Owner</li>
                <li class="title_one label fl">Fund Scheme</li>
                <li class="title_two label fl">Asset Mgnt. Comp.</li>
                <li class="title_three label fl">Folio Number</li>
                <li class="title_four label fl">SIP Amount</li>
               
              </ul>
              <ul class="clearfix data_inputs first_level_inputs reset">
              	<li class="input_ten label fl">
                  <select id="ownerPartyId" class="required" name="ownerPartyId">
                  </select>
                </li>
                <li class="input_one label fl">
	                <div class="ui-widget">
					  <select class="common_input combobox proSearch required" id="productSearch_0" onchange="getManufacturer('0')" name="productId">
					    <option selected="selected" class="products" value="${addSip.productId}">${addSip.assetName}</option>
					  </select>
					</div>
                </li>
                <li class="input_two label fl">
                  <input type="text" class="common_input assetComp_0" readOnly="readonly" id="assetComp" value="${addSip.assetMgntComp}"/>
                </li>
                <li class="input_three label fl">
                  <input type="text" class="common_input required number" id="accountFolioNo" name="accountFolioNo" value="${addSip.folioNumber}"/>
                </li>
                <li class="input_four label fl">
                  <input type="text" class="common_input required mynumber" id="sipAmount" name="sipAmount" value="${addSip.sipAmount}"/>
                </li>                
                
              </ul>
              <ul class="clearfix head_title second_level_heading reset">
               <li class="title_five label fl">Start Date</li>
               <li class="title_six label fl">End Date</li>
                <li class="title_seven label fl">Frequency</li>
                <li class="title_eight label fl">No. of Units</li>
                <!-- <li class="title_nine label fl">Growth Rate(%)</li> -->
                
              
              </ul>
              <ul class="clearfix data_inputs second_level_inputs reset">
              <li class="input_five label fl">
                  <input type="text" class="common_input datepicker fl date" id="startDate" readonly="readonly" name="sipStartDate" value="${addSip.sipStartDate}"/>
                </li>
              <li class="input_six label fl">
                  <input type="text" class="common_input datepickerEnd fl date" readonly="readonly" id="endDate" name="sipEndDate" onchange="calculateDate();" value="${addSip.sipEndDate}"/>
                </li>
                <!-- <li class="input_seven label fl"></li> -->
                <li class="input_eight label fl">
                  <%-- <input type="text" class="common_input" id="sipFreqId" name="sipFreqId" value="${assetMF.frequency}"/> --%>
                  <select id="sipFreqId" class="required" name="sipFreqId">
                  </select>
                </li>
                <li class="input_nine label fl">
                  <input type="text" class="common_input number required" id="totalUnitsQty1" maxlength="18" name="totalUnitsQty" value="${addSip.noOfUnits}"/>
                </li>
                <%-- <li class="input_ten label fl">
                  <input type="text" class="common_input required number" name="interestRate" value="${addSip.interestRate}"/>
                </li> --%>
                
                
              </ul>
              <ul class="clearfix head_title second_level_heading reset">
              	<li class="title_nine label fl">Current Value</li>
              </ul>
				<ul class="clearfix data_inputs second_level_inputs reset">
              	<li class="input_ten label fl">
                  <input type="text" class="common_input required mynumber" id="currentValue" name="currentValue" value="${addSip.currentBalance}"/>
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
         	<p>No Linked Goals To Mutual Fund</p>
         </c:otherwise>
         </c:choose>
                  <div class="clr"></div>
                </li>
              </ul>
              </c:when>
         </c:choose>
            </div>
        </form:form>
        <form:form id="assetMFLumpSum" method="POST" action="${pageContext.request.contextPath}/assets/saveAssets">
        <input name="assetTypeId" type="hidden" value="48001"/>
        <!-- <div id="dialog1" class="common_dialog" style="text-align: center;"> </div>
        <div id="page_loader"></div> -->
        <input type="hidden" id="partyId" name="partyId" value="${partyId}"/>
        <input type="hidden" id="partyAssetId" name="partyAssetId" value="${partyAssetId}"/>
        <input type="hidden" id="assetPage" name="assetPage" value="3"/>
        <input type="hidden" id="saveAddFlag" name="saveAddFlag" value="lumpsum"/>
            <div class="rd_box dynamic_box hide">
              <ul class="clearfix head_title first_level_heading reset">
              	<li class="title_ten label fl">Owner</li>
                <li class="title_one label fl">Fund Scheme</li>
                <li class="title_two label fl">Asset Mgnt. Comp.</li>
                <li class="title_three label fl">Folio Number</li>
                <li class="title_four label fl">Investment Amount</li>
               
              </ul>
              <ul class="clearfix data_inputs first_level_inputs reset">
              	<li class="input_ten label fl">
                  <select id="lumpSumPartyId" class="required" name="ownerPartyId">
                  </select>
                </li>
                <li class="input_one label fl">
	                <div class="ui-widget">
					  <select class="common_input combobox proSearch required" id="productSearch_1" onchange="getManufacturer('1')" name="productId">
					    <option selected="selected" class="products" value="${addLumpSum.productId}">${addLumpSum.assetName}</option>
					  </select>
					</div>
                </li>
                <li class="input_two label fl">
                  <input type="text" class="common_input assetComp_1" readOnly="readonly" id="assetComp" value="${addLumpSum.assetMgntComp}"/>
                </li>
                <li class="input_three label fl">
                  <input type="text" class="common_input required number" id="accountFolioNo" name="accountFolioNo" value="${addLumpSum.folioNumber}"/>
                </li>
                <li class="input_four label fl">
                  <input type="text" class="common_input required mynumber" id="investmentValue" name="investmentValue" value="${addLumpSum.monthlyDeposited}"/>
                </li>                
                
              </ul>
              <ul class="clearfix head_title second_level_heading reset">
               <!-- <li class="title_five label fl">Start Date</li>
               <li class="title_six label fl">End Date</li>
                <li class="title_seven label fl">Frequency</li> -->
                <li class="title_eight label fl">No. of Units</li>
               <!-- <li class="title_eight label fl">Growth Rate(%)</li> -->
               <li class="title_nine label fl">Current Value</li>
                
              
              </ul>
              <ul class="clearfix data_inputs second_level_inputs reset">
              
                <li class="input_nine label fl">
                  <input type="text" class="common_input number required" id="totalUnitsQty2" maxlength="18" name="totalUnitsQty" value="${addLumpSum.noOfUnits}"/>
                </li>
                <%-- <li class="input_nine label fl">
                  <input type="text" class="common_input number required" name="interestRate" value="${addLumpSum.interestRate}"/>
                </li> --%>
                <li class="input_ten label fl">
                  <input type="text" class="common_input required mynumber" id="currentValue" name="currentValue" value="${addLumpSum.currentBalance}"/>
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
         	<p>No Linked Goals To Mutual Fund</p>
         </c:otherwise>
         </c:choose>
                  <div class="clr"></div>
                </li>
              </ul>
           </c:when>
         </c:choose>     
            </div>
        </form:form>
        <!-- Common_in_contnet ends-->
        </div>
        </section>
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
            <li class="fl list"><a href="#" class="anch cancel" id="cancel" onclick="doAction('${pageContext.request.contextPath}/assets/assetDetails/${partyId}/0?assetPage=3');"><span class="txt">Cancel</span></a></li>
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
