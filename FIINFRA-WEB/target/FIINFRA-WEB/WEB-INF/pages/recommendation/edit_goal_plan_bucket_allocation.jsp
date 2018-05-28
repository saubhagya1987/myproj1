<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>

<title>Goal Plan Recommendation</title>

 <style>
#gp_view_bucket_alloc .top_box #allocation_type .ui-slider-handle {
    margin-left: 0.2em !important;
    top: 0.1em !important; border-style: none !important;
    border-width: none !important;  
      
}    

.ui-slider .ui-slider-handle:before, .ui-slider .ui-slider-handle:after.ui-slider .ui-slider-handle:before, .ui-slider .ui-slider-handle:after
{margin-left: 0.2em !important;
    top: 0.1em !important; border-style: none !important;
    border-width: none !important;}
#gp_view_bucket_alloc .top_box #allocation_type .ui-slider .ui-slider-handle:before,#gp_view_bucket_alloc .top_box #allocation_type .ui-slider .ui-slider-handle:after{
    margin-left: 0.2em !important;
    top: 0.1em !important; border-style: none !important;
    border-width: none !important;
    
    
} 
.set_default{
font-family: "allerregular" !important;
  background-color: #000000 !important;
  /* border: 1px solid #952754 !important; */
  box-shadow: 1px 1px 4px #000000 !important;
  display: inline-block !important;
  height: 33px !important;
  line-height: 10px !important;
  margin: 7px 6px 0 10px !important;
}

/* #gp_view_bucket_alloc .product_allocaton.edit .custom-combobox-input { */
/* width: 390px !important; */
/* height: 30px !important; */
/* background: #FFF; */
/* } */
#gp_view_bucket_alloc .top_box #allocation_type .ui-slider .ui-slider-handle:before, .ui-slider .ui-slider-handle:after{border-width:none !important;}
</style> 

<%-- <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/partner.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script> 
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/basic.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/jquery-ui.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/toggles.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/selectboxlt.css"/>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/perfect-scrollbar.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/custom.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/main.css" />
<link href="<%=request.getContextPath()%>/css/partner_setup.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/responsive.css" /> --%>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/toggles.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/diy/my_account_submenu.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.slimscroll.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/diy/plugin/selectboxit.js"></script> --%>
<%--  <script src="${pageContext.request.contextPath}/js/diy/plugin/perfect-scrollbar.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.mousewheel.js"></script> --%>
<%--  <script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.ui.touch-punch.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.autosize.input.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/diy/common/common.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.validate.js"></script> --%>
<%--  <script src="${pageContext.request.contextPath}/js/diy/plugin/additional-methods.js"></script> --%>
<%--<script src="${pageContext.request.contextPath}/js/diy/common_modal.js"></script>
<script src="${pageContext.request.contextPath}/js/diy/plugin/jquery.form.js"></script>   --%>
<%--  <link href="<%=request.getContextPath()%>/css/${sessionScope.userSession.themeName}/${sessionScope.userSession.themeName}.css" rel="stylesheet"> --%>

<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/jquery-ui.css" /> --%>
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/diy/main.css" /> --%>


<!-- <style>
#confirmDialog { display: block; height: 130px; display: none; width: 355px; box-shadow: 0 0 15px 1px #757575; }
</style> -->
<script type="text/javascript">
function activateSecurity(){
// 	alert('hiiii----${sessionScope.idList}')
// alert($('#idList').val())
	var controllIds=$('#idList').val().split(',');
	$(controllIds).each(function(){
		//alert(this.replace("[", "").replace("]", ""))
		if(this.replace("[", "").replace("]", "").replace(" ", "")!='')
		$('.'+this.replace("[", "").replace("]", "").replace(" ", "")).remove();	
	});
}
$(document).ready(function() {
	activateSecurity();
	$("#successDialog").dialog();
    $(document).on("dialogopen", "#successDialog", function(event, ui) {
		setTimeout("$('#successDialog').dialog('close')",3000);
	});
	
	
    $("#invalidAgeDialog").dialog();
    $(document).on("dialogopen", "#invalidAgeDialog", function(event, ui) {
		setTimeout("$('#invalidAgeDialog').dialog('close')",3000);
	});
    
    <c:if test="${not empty success}">
    <c:choose>
	    <c:when test="${fn:contains(success, 'success.')}">
	    <spring:message code="${success}" var="success"/>
	    <c:if test="${fn:contains(success, '_')}">
	    <c:set var="success" value="${fn:replace(success, '_', goalName)}" />
	    <c:set var="success" value="${fn:toUpperCase(fn:substring(success, 0, 1))}${fn:substring(success, 1,fn:length(success))}" />
	    </c:if>
		    var hitCnt = $("#hitCount").val();
			if(hitCnt == '0') {
				$("#successDialog").html("${success}");
				$( "#successDialog").dialog( "open" );
				$("#hitCount").val("1");
			}
		</c:when>
		<c:otherwise>
		var hitCnt = $("#hitCount").val();
		if(hitCnt == '0') {
			$("#successDialog").html("${success}");
			$( "#successDialog").dialog( "open" );
			$("#hitCount").val("1");
		}
		</c:otherwise>
	</c:choose>
	</c:if>
	 	
	<c:if test="${not empty error}">
    <c:choose>
	    <c:when test="${fn:contains(error, 'error.')}">
	    <c:if test="${fn:contains(error, '_')}">
	    <c:set var="error" value="${fn:replace(error, '_', goalName)}" />
	    <c:set var="error" value="${fn:toUpperCase(fn:substring(error, 0, 1))}${fn:substring(error, 1,fn:length(error))}" />
	    </c:if>
	    <spring:message code="${error}" var="error"/>
	    <c:set var="error" value="${fn:replace(error, '_', goalName)}" />
		    var hitCnt = $("#hitCount").val();
			if(hitCnt == '0') {
				$("#successDialog").html("${error}");
				$( "#successDialog").dialog( "open" );
				$("#hitCount").val("1");
			}
		</c:when>
		<c:otherwise>
		var hitCnt = $("#hitCount").val();
		if(hitCnt == '0') {
			$("#successDialog").html("${error}");
			$( "#successDialog").dialog( "open" );
			$("#hitCount").val("1");
		}
		</c:otherwise>
	</c:choose>
	</c:if>
	

	
});


</script>
<script>
$(document).ready(function(){
     
	//$(".top_box select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
      $('.scrollable_data').slimScroll();

	   createSlider('#allocation_type',1,2,1,'#type_count');
	   <c:choose>
		<c:when test="${sliderSelectBx eq 'products'}">
		   	$( "#allocation_type" ).slider( "value", 1 );
	        $("#allocation_type .ui-slider-handle").text("Product Recommdenations");
		    $("#allocation_type .ui-slider-handle").css({'width':'113px','line-height':'13px','margin-left': '3px','top': '-3px'});
		    $(".year_to_goal").fadeIn("slow"); 
			$("#sliding_selectBX").val("products");
	   	</c:when>
	   	<c:otherwise>
		   	$( "#allocation_type" ).slider( "value", 2 );
		   	$("#allocation_type .ui-slider-handle").text("Allocation %");
		    $("#allocation_type .ui-slider-handle").css({'width':'74px','line-height':'25px'});
		    $("#allocation_type .ui-slider-handle").css("margin-left", "-87px");
		    $("#sliding_selectBX").val("allocation");
	   	</c:otherwise>
	   </c:choose>

}); 
</script>

<style>
	.productSearch{
		 width:300px;
	}
/* 	#confirmDialog { */
/* 		display: block; */
/* 		height: 130px; */
/* 		display: none; */
/* 		width: 355px; */
/* 		box-shadow: 0 0 15px 1px #757575; */
/* 	} */
	#gp_view_bucket_alloc .product_allocaton.edit .product_percentage_edit_input {
		margin: 6px 0px 0px 46px;
	}
</style>
<style>
  .custom-combobox {
    position: relative;
    display: inline-block;
  }
  .custom-combobox-toggle {
    position: absolute;
    top: 0;
    bottom: 0;
    margin-left: -1px;
    padding: 0;
  }
  .custom-combobox-input {
    margin: 0;
    padding: 5px 10px;
    
  }
  .ui-widget {
		width: 290px;
		float: left;
		margin: 3.5px 0 0 0;
	}
  </style>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugin/select2.js"></script> --%>
<script>
$(document).ready(function(){
     
	///$(".top_box select").selectBoxIt();
	$(".wrapper").addClass("view_bucket_allocation_warpper");
	 // Calls the selectBoxIt method on your HTML select box
      $('.scrollable_data').slimScroll();
	   /* Alrternate row color */
        $("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content:even").addClass("even_row");
        $("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content:odd").addClass("odd_row");
       
	   createSlider('#allocation_type',1,2,1,'#type_count');
       $("#allocation_type .ui-slider-handle").text("Product Recommdenations");
	   $("#allocation_type .ui-slider-handle").css({'width':'107px','line-height':'13px','margin-left': '3px'});
		   
	   /*$("#confirmDialog .close").click(function(){
	        $(".overlay").fadeOut("slow");
	    	$("#confirmDialog").fadeOut("slow");
	    	 });*/
	   
	$( "#allocation_type" ).on("slide", function( event, ui ) {
		
		$("#allocation_type .ui-slider-handle").empty();
            if (ui.value == 1) {
          $("#allocation_type .ui-slider-handle").text("Product Recommdenations");
	   $("#allocation_type .ui-slider-handle").css({'width':'107px','line-height':'13px','margin-left': '3px'});
                $(".allocation_percentage").fadeOut("fast");
				$(".product_allocaton").fadeIn();
				$(".year_to_goal").fadeIn("slow");
			   
			   
                
            } else if (ui.value == 2) {
				$("#allocation_type .ui-slider-handle").text("Allocation %");
                $("#allocation_type .ui-slider-handle").css("margin-left", "-87px");
                $("#allocation_type .ui-slider-handle").css({'width':'74px','line-height':'25px'});
               
			    $(".product_allocaton").fadeOut("fast");
				 $(".year_to_goal").fadeOut("fast");
				 $(".allocation_percentage").fadeIn("slow");
				
			}
		
		
		
		});
		$("#gp_view_bucket_alloc .top_box .edit").click(function(){
			$("#gp_view_bucket_alloc .product_allocaton.tabular_data").fadeOut();
			$("#gp_view_bucket_alloc .top_box .alloc_partnet").fadeOut("fast");
			$("#gp_view_bucket_alloc .top_box select").attr("disabled","disabled");
		    $("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit").fadeIn("slow");
			$("#gp_view_bucket_alloc .top_box .dyanmic_buttons").fadeIn("slow");
			
			
			 calc_height();
			function calc_height()
			{
				var heights = $(thisObj).closest(".table_cell").closest(".table_content").find("li.table_cell").map(function ()
           {
            return $(this).height();
           }).get(),
           maxHeight = Math.max.apply(null, heights);
		$("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content li").css("height",maxHeight);	
			
       }
      });
		
		$(".add").click(function() {
			addRowInPage(this);
		});
	
		function addRowInPage(obj){
			var productCount=parseInt($("#productCount").val());
			productCount = productCount + 1;
			$("#productCount").val(productCount);
			
			  $(obj).prev(".close").fadeIn("slow");			 
		      
		      var productSearchElement=$(obj).parent().closest(".dynamic_products").children(".ui-widget").children(".combobox").prop('id');
		      var pieces = productSearchElement.split("_");
		      /* var assetWiseProductCount=parseInt($("#productCount_"+pieces[1]).val());
		      assetWiseProductCount = assetWiseProductCount + 1;
		      $("#productCount_"+pieces[1]).val(assetWiseProductCount); */ 
		      
			  $(obj).parent().closest(".dynamic_products").after("<div class='dynamic_products'>" + 
			  "<div class='ui-widget'><select class='common_input combobox proSearch_"+ productCount +"' id='productSearch_"+ pieces[1] +"_"+ pieces[2] +"_"+ pieces[3] +"_"+ productCount +"' name='productSearch_"+ productCount +"' value=''  placeholder='Search product'/></select></div>"+
			  " <input type='text' class='common_input product_percentage_edit_input productPercent_"+ productCount +"' id='productPercent_"+ pieces[1] +"_"+ pieces[2] +"_"+ pieces[3] +"_"+ productCount +"' name='productPercent_"+ productCount +"' onchange='calculateProductPercentage(\"#productSearch_"+ pieces[1] +"_"+ pieces[2] +"_"+ pieces[3] +"_"+ productCount +"\",\".productPercent_"+ productCount +"\");' value='0.0'/>" +
			  " <span class='percent_sign'>%</span>" +
			  "<div class='close'>X</div>" +
			  "<div class='add pull-right'>+</div>" +
			  "</div>");
			   
			  //$("select").selectBoxIt();
			  
			  getAutoComplete();
			  
			  $(obj).fadeOut("fast");
	  
			 $(obj).closest("li.fifth").closest("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content").find(".table_cell").css("height","auto");
	  
		  calc_height($(obj));
		   function calc_height(thisObj)
				{
				
				//alert(thisObj.text());
				var heights = $("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content li").map(function ()
	           {
	            return $(this).height();
	           }).get(),
	           maxHeight = Math.max.apply(null, heights);
			   
			$(thisObj).closest("li.fifth").closest("ul.table_content").find(".table_cell").css("height",maxHeight);	
				
	       }
		   $(".add").click(function() {
				addRowInPage(this);
			});
		}
		
	 $("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content .fifth").on("click", ".close", function() {
	 
   
	/*var count_section = $(this).parent().closest("section").find("ul").length;
	if(count_section==2)
	  {
		$(this).parent().closest("ul").siblings("ul").find(".close").addClass("last_close");
	   
	  }
	  else
	  {
		$(this).parent().closest("ul").siblings("ul").find(".close").removeClass("last_close");  
	  }*/
	
	if($(this).parent().closest(".dynamic_products").is(':last-child'))
	{
		
		$(this).parent().closest(".dynamic_products").prev(".dynamic_products").children(".add").fadeIn("slow");
     	
	}
	  $("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content").removeClass("current");
	   $(this).parent().closest(".table_content").addClass("current");
	  // $("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content").removeClass("first_prod");
	 //  $(this).closest(".dynamic_products").closest("li.fifth").find(".dynamic_products:first").addClass("first_prod");	
    var new_height=$(this).closest("li.fifth").closest("ul.table_content").find(".table_cell").height();
   $(this).parent().closest(".dynamic_products").remove();
   
	//alert(new_height);
	var new_height= $("dynamic_products.first_prod").height();
 	$("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content.current").find(".table_cell").css("height",(($("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content.current .table_cell").height())-($(".dynamic_products").height())));	
  
 	recalculateProductPercentage();
	 /* 
	  calc_height($(this));
	   function calc_height(thisObj)
			{

			var heights = $("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content li").map(function ()
           {
            return $(this).height();
           }).get(),
           maxHeight = Math.max.apply(null, heights);
	
	$(".dynamic_products.last").closest("ul.table_content").find(".table_cell").css("height","auto");
	$(".dynamic_products.last").closest("li.fifth").closest("ul.table_content").find(".table_cell").css("height",maxHeight);	
			
     
			
       }*/

	  
	

	
	
});	
	  //close button for Tax planning input end
	  
	  
	
      /* if($( "#allocation_type" ).slider( "value", 2 ))
	   {
		    $("#allocation_type .ui-slider-handle").css("margin-left", "-120px");
               $("#allocation_type .ui-slider-handle").text("Product Recommdenations");
			   $("#allocation_type .ui-slider-handle").css({'width':'107px','line-height':'13px'});
	   }*/
	
	   
	 getAutoComplete();
	   
	  
	   
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
	          .addClass( "form-control  ui-widget ui-widget-content ui-state-default ui-corner-left")
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
			$("#assetClassId").val(pieces[1]);
			$("#productTypeId").val(pieces[2]);
			$("#CategoryId").val(pieces[3]);
			
			//var dropdownElement=$("#productSearch_"+pieces[1]+"_"+pieces[2]+"_"+pieces[3]+"_"+pieces[4]);
			
			$("#productSearch_"+pieces[1]+"_"+pieces[2]+"_"+pieces[3]+"_"+pieces[4]).children(".products").remove();
			
			$.ajax({
			    url: "${pageContext.request.contextPath}/partner/getGoalPlanProductList",
			    type: "GET",
			    dataType: "json",
			    data: {'productData': productData,'assetClassId' : pieces[1],'productTypeId' : pieces[2],'categoryId' : pieces[3]},
			    success: function( data ) {
			             
			    	$.each(data, function(index, product){
			    		$("#productSearch_"+pieces[1]+"_"+pieces[2]+"_"+pieces[3]+"_"+pieces[4]).append("<option class='products' value="+ product.value +">"+product.text+"</option>");
			    	});
			        
			        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
			        response( $("#productSearch_"+pieces[1]+"_"+pieces[2]+"_"+pieces[3]+"_"+pieces[4]).children( "option" ).map(function() {
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
	    	 	//check duplicate
	    		var productCount=parseInt($("#productCount").val());
	    	 	var pieces=ui.item.option.parentElement.id.split("_");
	    	 	
	    	 	var value = this.input.val();
	    	 	for(var i=1;i<=productCount;i++){
	    	 		if((i!=pieces[4]) && (ui.item.option.value==$(".proSearch_"+i).val())){
	    	 			//displayMsg("You have already selected "+ui.item.value+" product");
	    	 			this.input
	    		          .val( "" )
	    		          .attr( "title", "You have already selected " + value + " product." )
	    		          .tooltip( "open" );
	    		        this.element.val( "" );
	    		        this._delay(function() {
	    		          this.input.tooltip( "close" ).attr( "title", "" );
	    		        }, 2500 ); 
	    		        //this.input.autocomplete( "instance" ).term = "";
	    		        $("#productPercent_"+pieces[1]+"_"+pieces[2]+"_"+pieces[3]+"_"+pieces[4]).val("0.0");
	    		        recalculateProductPercentage();
	    		        return false;
	    	 		}
	    	 	}
	    	  
	 
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
		        $("#productPercent_"+pieces[1]+"_"+pieces[2]+"_"+pieces[3]+"_"+pieces[4]).val("0.0");
		        recalculateProductPercentage();
	    	  }else{
	    		  var value = this.input.val();
	    		  var pieces=this.element.prop('id').split("_");
	    		  $("#productPercent_"+pieces[1]+"_"+pieces[2]+"_"+pieces[3]+"_"+pieces[4]).val("0.0");
	    		  recalculateProductPercentage();
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

</script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<input type="hidden" id="idList" value="${sessionScope.idList}"/>
<div class="container">
 <div class="page-header clearfix">
                    <h1 class="pull-left">Partner Setup</h1>
                   
                  </div>
   
	<div class="container-body">
<!-- Wrapper starts-->
<div class="wrapper"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Common_content Starts-->
    <section class="content common_content">     

      <section class="in_content common_in_content clearfix" id="gp_view_bucket_alloc">
      <form id="goalRecommendaionForm" method="post" action="${pageContext.request.contextPath}/partner/saveGoalPlanBucket">
      	<input type="hidden" name="riskProfileId" value="${riskProfileId}"/>  
      	<input type="hidden" name="goalYearRangeId" value="${goalYearRangeId}"/>
      	<%-- <input type="hidden" name="assetClassId" value="${assetClassId}"/>
      	<input type="hidden" name="productTypeId" value="${productTypeId}"/>
      	<input type="hidden" name="categoryId" value="${categoryId}"/> --%>
      	
      
           
        <div class="space-32 .visible-xs-* hidden-md hidden-sm hidden-lg"></div>    <div class="space-12 .visible-xs-* hidden-md hidden-sm hidden-lg"></div>    
        <div class="top_box clearfix">
        
        <div class="col-sm-6">
          <div class="fl alloc_partnet hide">
            <div id="allocation_type" class="common_sliding_radio"> <span class="lbl_first lbl">Product Recommdenations</span> <span class="lbl_second lbl">Allocation %</span> </div>
            <input type="text" id="type_count" class="range_counter hide-elem">
          </div>
          <div class="fl">     
            <h2 class="fl heading">Risk Profile</h2> 
           <!--  <select class="fl chosen-select inactiveLink col-sm-6  col-xs-12" id="riskProfile">
              <option value="40001">Conservative</option>
              <option value="40002">Balanced</option>
              <option value="40003">Aggressive</option>
              <option value="-1">All</option>
            </select>  -->        
            
            <select class="f1 inactiveLink  form-control" id="riskProfileType" data-placeholder="">
                  <option value="40001">Conservative</option>
           	<option value="40002">Balanced</option>
           	<option value="40003">Aggressive</option>  
           	<c:if test="${not (sliderSelectBx eq 'products')}">    
           		<option value="-1">All</option>
           	</c:if>               	
          </select>       
          </div>  
         <!--  <div class="fl year_to_goal">
            <h2 class="fl heading">Year to Goal</h2>
            <select class="fl chosen-select inactiveLink col-sm-6  col-xs-12" id="goalYearRange">
              <option value="62009">0-3 Years</option>
              <option value="62010">3-5 Years</option>
              <option value="62011">5-7 Years</option>
              <option value="62012">7-9 Years</option>
              <option value="62013">More Than 9 Years</option>
            </select>
          </div> -->        
          
          <div class="fl year_to_goal hide1"><h2 class="fl heading">Year to Goal</h2>
         
            
           <select class="form-control inactiveLink" id="goalYearRangeId" data-placeholder="">
            <option value="62009">0-3 Years</option>
            <option value="62010">3-5 Years</option>
            <option value="62011">5-7 Years</option>  
            <option value="62012">7-9 Years</option>
            <option value="62013">More than 9 Years</option>
          </select>
          
          </div> 
          
          </div>
          
<!--           <a class="back fr hide" style="display : none;" href="#">Back</a> -->
<!--           <a class="edit fr hide" style="display : none;" href="#">Edit</a> -->
            
           
											
			<div class="southspace1 westspace1 northspace1 eastspace1  btn btn-primary btn-xs set_default_btn1 fr dyanmic_buttons saveGoalPlanLink">
           <span class="bigger-110 no-text-shadow">Set Default</span></div>
           
<!--           <a class="set_default_btn fr dyanmic_buttons saveGoalPlanLink" style="display : block;" href="#">Set Default</a> -->
          
<!--           <a class="cancelBack fr dyanmic_buttons" href="#" style="display : block;">Back</a> -->
          
           <div class="dyanmic_buttons  southspace1 westspace1 northspace1 btn btn-primary btn-xs cancelBack1 fr">
           <i class="ace-icon fa icon-back bigger-110"></i><span class="bigger-110 no-text-shadow">Back</span></div>
		
			<div class="southspace1 westspace1 northspace1 btn btn-primary btn-xs cancel1 fr dyanmic_buttons  ">
           <span class="bigger-110 no-text-shadow">Cancel</span></div>
             
<!--           <a class="cancel fr dyanmic_buttons" href="#" style="display : block;">Cancel</a> -->
            
             
          
           <c:choose>
        		<c:when test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
<!--           <a class="save fr dyanmic_buttons saveGoalPlanLink" href="#" style="display : block;">Save</a> -->
          
          <div class="southspace1 westspace1 northspace1 btn btn-primary btn-xs save1 fr dyanmic_buttons saveGoalPlanLink">
           <span class="bigger-110 no-text-shadow">Save</span></div>
               
          </c:when>  
          </c:choose>
           </div>  
        
        
        <c:set var="tempAssetClassId" value="0"/>
        <c:set var="tempProductTypeId" value="0"/>
        <c:set var="tempCategoryId" value="0"/>
        <c:set var="totalAssetPercentage" value="0"/>
        <c:set var="totalProductPercentage" value="0"/>
        <c:set var="assetCount" value="0"/>
       <%--  <c:set var="productCount" value="0"/> --%>
        <c:set var="equityPercent" value="0"/>
        <c:set var="debtPercent" value="0"/>
        <c:set var="goldPercent" value="0"/>
        <c:set var="tempPercent" value="0"/>
        <c:set var="productCount" value="0"/>
        
        <div class="tabular_data product_allocaton edit">
        
			 <table class="table_head pull-left" width="100%">
			  <tr>
			    <th class="second theme_background" rowspan="2">Asset Class</th>
			    <th class="col_name theme_background" colspan="2">Product</th>
			  </tr>
			  <tr>
			    <td class="name theme_background">Name</td>
			    <td class="percentage theme_background">%</td>
			  </tr>
			</table>

         <!--  <ul class="table_head reset clearfix">
            <li class="fl sec_col">
              <div class="second theme_background">Asset Class</div>
              <div class="third theme_background hide">Product Type</div>
              <div class="fourth theme_background hide">Product Category</div>
              <div class="fifth theme_background"><div class="col_name">Product</div>
              <div class="fl name">Name</div><div class="fl percentage">%</div>
              <div class="clr"></div>
              </div>
              <div class="clr"></div>
            </li>
          </ul> -->
          <div class="clearfix"></div>
        

          <div class="scrollable_data">
          



            <c:forEach items="${recommendationMap}" var="adviceRecommendationList" varStatus="mapCounter">                               
                       
            <c:forEach items="${adviceRecommendationList.value}" var="adviceRecommendation" varStatus="counter">
            
            <c:set var="productCount" value="${productCount + 1}"/>
                                    
            	<!-- <ul class="table_content clearfix reset"> -->
            		<c:choose>
            			<c:when test="${not(tempAssetClassId eq adviceRecommendation.assetClassId)}">
            		
<!--             			<ul class="table_content clearfix reset even_row"> -->
            			<table class="table_content reset even_row" width="100%">
            				<tbody><tr>
     						<td class="second table_cell">${adviceRecommendation.assetName} 
            				<input type="text" name="assetClassPercentage_${productCount}" id="assetPercent_${adviceRecommendation.assetClassId}" class="common_input  asset_class_edit_input assetPercent_${productCount}"  value="${adviceRecommendation.allocationPercentAssetClass}" onchange="calculateAssetPercentage('.assetPercent_${productCount}');"/><span class="percent_sign">%</span></td>           				
            				<c:set var="totalAssetPercentage">${totalAssetPercentage + adviceRecommendation.allocationPercentAssetClass}</c:set>
            				<%-- <c:set var="assetCount">${assetCount + 1}</c:set> --%>
            				<input type="hidden" name="assetClassId_${productCount}" value="${adviceRecommendation.assetClassId}"/>
            				<c:if test="${not(productCount eq 1)}">
	            				<c:choose>
	            					<c:when test="${tempAssetClassId eq '46001'}">
	            						<c:set var="equityPercent" value="${tempPercent}"/>  
	            						<c:set var="tempPercent" value="0"/>
	            					</c:when>
	            					<c:when test="${tempAssetClassId eq '46002'}">
	            						<c:set var="debtPercent" value="${tempPercent}"/>
	            						<c:set var="tempPercent" value="0"/>
	            					</c:when>	            					
	            				</c:choose>
            				</c:if>
            				
            					<td class="fifth table_cell">

						<div class="dynamic_products">
				              	<div class="ui-widget">
								  <select class="combobox proSearch_${productCount}" id="productSearch_${adviceRecommendation.assetClassId}_0_0_${productCount}" name="productSearch_${productCount}">
								    <option selected="selected" class="products" value="${adviceRecommendation.productId}">${adviceRecommendation.productName}</option>
								  </select>
								</div>		              
					              <!-- <select class="combobox" id="e2"></select> -->
					              <%-- <input type="hidden" id="productId_${adviceRecommendation.assetClassId}"/> --%>
					           
				                
				                				                <input type="text" class="common_input product_percentage_edit_input productPercent_${productCount}" id="productPercent_${adviceRecommendation.assetClassId}_0_0_${productCount}" name="productPercent_${productCount}" 
				                onchange="calculateProductPercentage('#productSearch_${adviceRecommendation.assetClassId}_0_0_${productCount}','.productPercent_${productCount}');" 
				                value="${adviceRecommendation.allocationPercentProductId}"/>
				               <c:set var="tempPercent">${tempPercent + adviceRecommendation.allocationPercentProductId}</c:set>
				               <span class="percent_sign">%</span>
				                
				                <c:if test="${fn:length(adviceRecommendationList.value) eq counter.count}">				                 
				                	<div class="close">X</div>
				                	<div class="add pull-right">+</div>
				                <!-- <div class="btn btn-xs btn-grey delRow" id="close">  <i class="ace-icon fa fa-close bigger-110 icon-only"></i> </div>
								<div class="btn btn-xs btn-light addRow" id="add"> <i class="ace-icon fa fa-plus bigger-110 icon-only"></i> </div>	 -->                
				                
				                </c:if>		
				               	</div>        
			               </td>
			           </tr>
					</tbody></table>	               
            			<c:set var="tempAssetClassId" value="${adviceRecommendation.assetClassId}"/>
            			</c:when>
            			<c:when test="${not(adviceRecommendation.productId eq 0)}">
            			<table class="table_content reset even_row" width="100%">
            				<tbody><tr>
     						<td class="second table_cell">&nbsp;</td>
            				<td class="fifth table_cell">

							<div class="dynamic_products">
				              	<div class="ui-widget">
								  <select class="common_input combobox proSearch_${productCount}" id="productSearch_${adviceRecommendation.assetClassId}_0_0_${productCount}" name="productSearch_${productCount}">
								    <option selected="selected" class="products" value="${adviceRecommendation.productId}">${adviceRecommendation.productName}</option>
								  </select>
								</div>		              
					              <!-- <select class="combobox" id="e2"></select> -->
					              <%-- <input type="hidden" id="productId_${adviceRecommendation.assetClassId}"/> --%>
					              
				                <input type="text" class="common_input product_percentage_edit_input productPercent_${productCount}" id="productPercent_${adviceRecommendation.assetClassId}_0_0_${productCount}" name="productPercent_${productCount}" 
				                onchange="calculateProductPercentage('#productSearch_${adviceRecommendation.assetClassId}_0_0_${productCount}','.productPercent_${productCount}');" 
				                value="${adviceRecommendation.allocationPercentProductId}"/>
				                <c:set var="tempPercent">${tempPercent + adviceRecommendation.allocationPercentProductId}</c:set>
				                <span class="percent_sign">%</span>
				                <c:if test="${fn:length(adviceRecommendationList.value) eq counter.count}">
				                	<div class="close">X</div>
				                	<div class="add pull-right">+</div>
				                </c:if>
				                </div>            					              
			              </td>
			           </tr>
					</tbody></table>		                
            			</c:when>
            		</c:choose>
            		<%-- <c:choose>
            			<c:when test="${not(tempProductTypeId eq adviceRecommendation.productTypeId)}">
            				<li class="third fl table_cell">${adviceRecommendation.productTypeName} (<span class="value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${adviceRecommendation.allocationPercentProductType}" /> %</span>)</li>
            				<c:set var="tempProductTypeId" value="${adviceRecommendation.productTypeId}"/>
            				<input type="hidden" name="productTypeId_${counter.count}" value="${adviceRecommendation.productTypeId}"/>
            			</c:when>
            			<c:otherwise>
            				<li class="third fl table_cell">&nbsp;</li>
            			</c:otherwise>
            		</c:choose>
            		<c:choose>
            			<c:when test="${not(tempCategoryId eq adviceRecommendation.categoryId)}">
            				<li class="fourth fl table_cell">
				              ${adviceRecommendation.categoryName} (<span class="value"><fmt:formatNumber type="number" pattern="#.##" maxFractionDigits="2" value="${adviceRecommendation.allocationPercentCategoryId}" /> %</span>)		             
				            </li>
				            <c:set var="tempCategoryId" value="${adviceRecommendation.categoryId}"/>
				            <input type="hidden" name="categoryId_${counter.count}" value="${adviceRecommendation.categoryId}"/>
            			</c:when>
            			<c:otherwise>
            				<li class="fourth fl table_cell">&nbsp;</li>		             
            			</c:otherwise>
            		</c:choose> 
            		
            		 <li class="fifth fl table_cell">
          				<div class="dynamic_products">
		              	<div class="ui-widget">
						  <select class="common_input combobox proSearch_${counter.count}" id="productSearch_${adviceRecommendation.assetClassId}_${adviceRecommendation.productTypeId}_${adviceRecommendation.categoryId}_${counter.count}" name="productSearch_${counter.count}">
						    <option selected="selected" class="products" value="${adviceRecommendation.productId}">${adviceRecommendation.productName}</option>
						  </select>
						</div>		              
		              <!-- <select class="combobox" id="e2"></select> -->
		              <input type="hidden" id="productId_${adviceRecommendation.assetClassId}"/>
	                <input type="text" class="common_input product_percentage_edit_input productPercent_${counter.count}" id="productPercent_${adviceRecommendation.assetClassId}_${adviceRecommendation.productTypeId}_${adviceRecommendation.categoryId}_${counter.count}" name="productPercent_${counter.count}" 
	                onchange="calculateProductPercentage('#productSearch_${adviceRecommendation.assetClassId}_${adviceRecommendation.productTypeId}_${adviceRecommendation.categoryId}_${counter.count}','.productPercent_${counter.count}');" 
	                value="${adviceRecommendation.allocationPercentProductId}"/>
	                <c:set var="tempPercent">${tempPercent + adviceRecommendation.allocationPercentProductId}</c:set>
	                <span class="percent_sign">%</span>
	                <div class="close">X</div>
	                <div class="add">+</div></div>            					              
	               </li>  --%>
	            <!-- </ul> -->	            
        		<c:set var="totalProductPercentage">${totalProductPercentage + adviceRecommendation.allocationPercentProductId}</c:set>
            </c:forEach>
          	</c:forEach>
          
           
          </div>
          <div class="bottom_total clearfix">
          
           	
          <div class="pull-left col-xs-6 col-sm-3">   <label  for="form-input-readonly" class="lbl col-xs-3 col-sm-3">Total</label> <input type="text" id="totalAssetPercentage" disabled="disabled" placeholder="" class="col-xs-11 col-sm-5" value='${totalAssetPercentage}' /> <span class="col-xs-11 col-sm-1">%</span> </div>
          <div class="pull-right col-xs-6 col-sm-3">   <label  for="form-input-readonly" class="lbl col-xs-3 col-sm-3">Total</label> <input type="text" id="totalProductPercentage" disabled="disabled" placeholder="" class="col-xs-11 col-sm-5" value='${totalProductPercentage}'/> <span class="col-xs-11 col-sm-1">%</span></div>
        <!--  <label>Label name</label> <input type="text" placeholder="Type something…"> -->
          
               <!--   <div class="pull-left col-xs-6 col-sm-3">   <label  for="form-input-readonly" class="lbl col-xs-3 col-sm-3">Total</label> <input type="text" id="totalAssetPercentage" disabled="disabled" placeholder="" class="col-xs-11 col-sm-5"/> <span class="col-xs-11 col-sm-1">%</span> </div>
       	        <div class="pull-right col-xs-6 col-sm-3">   <label  for="form-input-readonly" class="lbl col-xs-3 col-sm-3">Total</label> <input type="text" id="totalProductPercentage" disabled="disabled" placeholder="" class="col-xs-11 col-sm-5"/> <span class="col-xs-11 col-sm-1">%</span></div>
           -->
        <!--   <label for="form-input-readonly" class="col-sm-3 control-label no-padding-right"> Readonly field </label>
          <input type="text" value="This text field is readonly!" id="" class="col-xs-10 col-sm-5" disabled="disabled"> -->
          
<!--           	<div class="pull-left edit_asset_class_percentage_total rel"><span class="lbl">Total :</span><input class="form-control common_input" id="totalAssetPercentage" readonly="readonly"/></div> -->
<!--           	<div class="pull-right edit_product_total rel"><span class="lbl">Total :</span><input class="common_input" id="totalProductPercentage" readonly="readonly"/></div> -->
          </div>
        </div>
        <c:choose>
        	<c:when test="${tempAssetClassId eq '46003'}">
				<c:set var="goldPercent" value="${tempPercent}"/>
				<c:set var="tempPercent" value="0"/>
			</c:when>
        </c:choose>
        <%-- <input type="hidden" name="assetCount" id="assetCount" value="${assetCount}"/> --%>
        <input type="hidden" name="equityPercent" id="equityPercent" value="${equityPercent}"/>
        <input type="hidden" name="debtPercent" id="debtPercent" value="${debtPercent}"/>
        <input type="hidden" name="goldPercent" id="goldPercent" value="${goldPercent}"/>
        <input type="hidden" name="finalData" id="finalData" value=""/>
        <input type="hidden" name="productCount" id="productCount" value="${productCount}"/>
        </form>
      </section>
      <!-- Common_in_contnet ends --> 
      
    </section>
    <!-- Common_content Ends--> 
  </section>
  <!-- Main ends--> 
</div>
<!-- <div id="successDialog" class="common_dialog" style="text-align: center;"> </div> -->
<!--<div id="confirmDialog" class="common_custom_modal_aa">
  <span class="close">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
        <spring:message code="deleteRecord" /></div>
     
         <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>


  </div>
</div>
</div>-->
</div>
<jsp:include page="footer.jsp"></jsp:include>
<!-- Wrapper ends-->
<script>

var initialData=[];
var finalData=[];

$(document).ready(function(){  
	
$("#totalAssetPercentage").val("<fmt:formatNumber type='number' pattern='#.##' maxFractionDigits='1' value='${totalAssetPercentage}' />");
	
	$("#totalProductPercentage").val("<fmt:formatNumber type='number' pattern='#.##' maxFractionDigits='1' value='${totalProductPercentage}' />");
	$("#riskProfile").val('${riskProfileId}');
  //var selectBox = $("#riskProfile").selectBoxIt().data('selectBox-selectBoxIt');
//	selectBox.selectOption('${riskProfileId}');
	
	//var selectBox1 = $("#goalYearRange").selectBoxIt().data('selectBox-selectBoxIt');			    
    //selectBox1.selectOption('${goalYearRangeId}');
     $("#goalYearRange").val();
    $(".save1").click(function(){
    	
    	$(".save1").addClass("inactiveLink");
    	
    	var finalData=[];  
 
    	if(verifyProduct()){
    		var totalAssetPercentage=parseFloat($("#totalAssetPercentage").val());
        	var totalProductPercentage=parseFloat($("#totalProductPercentage").val());
        	if((totalAssetPercentage < 100) || (totalAssetPercentage > 100)){
        		displayMsg("<spring:message code='assetAllocation' />");
        		$(".save1").removeClass("inactiveLink");
        		return false;
        	}else if((totalProductPercentage < 100) || (totalProductPercentage > 100)){
        		displayMsg("<spring:message code='assetAllocation' />");
        		$(".save1").removeClass("inactiveLink");  
        		return false;
        	}else{
        		var productCount=parseFloat($("#productCount").val());
				//var totalPercent=0;
				//var assetPercent=0;
				var insertFlag=1;
				for(var i=1;i<=productCount;i++){
					if($(".assetPercent_"+i).val()){
						/* if(i!=1){ 
							if(assetPercent!=totalPercent){
								insertFlag=0;
    						}
    						totalPercent=0;
						}
						assetPercent = $(".assetPercent_"+i).val(); */
						var assetElementPieces=$(".assetPercent_"+i).prop('id').split("_");
						if(assetElementPieces[1]=="46001"){
							if(parseFloat($(".assetPercent_"+i).val()).toFixed(2)!=parseFloat($("#equityPercent").val()).toFixed(2)){
								insertFlag=0;
								break;
							}
						}else if(assetElementPieces[1]=="46002"){
							if(parseFloat($(".assetPercent_"+i).val()).toFixed(2)!=parseFloat($("#debtPercent").val()).toFixed(2)){
								insertFlag=0;
								break;
							}
						}else if(assetElementPieces[1]=="46003"){
							if(parseFloat($(".assetPercent_"+i).val()).toFixed(2)!=parseFloat($("#goldPercent").val()).toFixed(2)){								
								insertFlag=0;
								break;
							}
						}						
					}
					/* if($(".productPercent_"+i).val()){
						totalPercent = totalPercent + parseFloat($(".productPercent_"+i).val());	
					} */
				}
				if(insertFlag==1){
					if(compareData()){
						var productId="";
						var pieces=[];
						var assetPercent="";
						var productPercent="";
						var tempDataRow="";
						for(var i=1;i<=productCount;i++){
							productId=$(".proSearch_"+i).val();
							if(productId!="-1" && productId!="" && productId!=null){
								pieces=$(".proSearch_"+i).prop('id').split("_");
								assetPercent=$("#assetPercent_"+pieces[1]).val();
								productPercent=$("#productPercent_"+pieces[1]+"_"+pieces[2]+"_"+pieces[3]+"_"+pieces[4]).val();
								tempDataRow=pieces[1]+"_"+assetPercent+"_"+pieces[2]+"_"+pieces[3]+"_"+productId+"_"+productPercent;
								finalData.push(tempDataRow);
							}
							
						}
						$("#finalData").val(finalData);
						$("#goalRecommendaionForm").submit();
					}else{
						displayMsg("<spring:message code='dataNotChanged' />");
						$(".save1").removeClass("inactiveLink");
		        		return false;
					}					
				}else{
					displayMsg("Asset percentage must be equal to product percentage.");
					$(".save1").removeClass("inactiveLink");
	        		return false;
				}        		
        	}	
    	}else{
    		$(".save1").removeClass("inactiveLink");
    	}    	
    });
    
    $(".set_default_btn1").click(function(){
   		/* if("${recordTypeId}"==14003){
   			$(".aa_up").html("<spring:message code='goalPlanning.dataReset' />");
   			$(".aa_yes").on('click',function(){performReset();});	
   			var innerHTML='<a style="cursor:pointer;" class="aa_yes" onclick="performReset();">Yes </a> ';
   			innerHTML=innerHTML+ '<a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a>';
   			$(".aa_down").html(innerHTML);
   			$(".overlay").fadeIn();
   			$("#confirmDialog").fadeIn();			
   		}else{
   			displayMsg("<spring:message code='dataAlreadyRestored' />");
   		} */
   		
   		if("${recordTypeId}"==14003){
   			$(".modal-body").html("<spring:message code='goalPlanning.dataReset' />");
   			$(".btn-primary").on('click',function(){performReset();});			
   			$('#confirmDialog').modal('show');		
   		}else{		
   			$(".modal-body").html("Data already restored!!!");
   			$(".btn-success").html("Ok");
   			$(".btn-success").on('click',function(){closeDialog();});
   			$(".btn-danger").hide();
   			$('#confirmDialog').modal('show');	
   		}
   		closePopupWebApp('');
   		
   		$('#confirmDialog_footer').removeClass('hide');
    });
    
    $(".cancel1").click(function(){
    	if(compareData()){
    		$(".aa_up").html("<spring:message code='dataChanged' />");
    		var innerHTML='<a style="cursor:pointer;" class="aa_yes" onclick="cancelPage();">Yes </a> ';
    		innerHTML=innerHTML+ '<a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a>';
    		$(".aa_down").html(innerHTML);
    		/* $(".aa_yes").on('click',function(){cancelPage();}); */
    		$(".overlay").fadeIn();
    		$("#confirmDialog").fadeIn();
    	}else{
    		$('#goalRecommendaionForm').attr('action', '${pageContext.request.contextPath}/partner/getProductRecommendationList/-1/${riskProfileId}/${goalYearRangeId}/46001,46002,46003');
    		$("#goalRecommendaionForm").submit();		
    	}
    }); 
    
    $(".cancelBack1").click(function(){
    	$('#goalRecommendaionForm').attr('action', '${pageContext.request.contextPath}/partner/getProductRecommendationList/-1/${riskProfileId}/${goalYearRangeId}/46001,46002,46003');
		$("#goalRecommendaionForm").submit();
    });
      
    //set initial data
    var x = document.getElementById("goalRecommendaionForm");
	var j = 0;
    for (var i=0; i<x.length; i=i+1) 
	{
	   	if(typeof(x.elements[i]) != "undefined" && (x.elements[i].id=='totalProductPercentage'
		   	 || x.elements[i].id=='totalAssetPercentage' && x.elements[i].className.split(" ")[1]=='asset_class_edit_input' 
		   	 || x.elements[i].className.split(" ")[1]=='product_percentage_edit_input' || x.elements[i].className.split(" ")[1]=='combobox'))
	   	{    
	   		initialData[j] = x.elements[i].value;
	   		j = j+1;
	    }
    }
	 
});

function compareData(){
	//get final data
	var x = document.getElementById("goalRecommendaionForm");
	var j = 0;
	for (var i=0; i<x.length; i=i+1) 
	{
	   	if(typeof(x.elements[i]) != "undefined" && (x.elements[i].id=='totalProductPercentage'
		   	 || x.elements[i].id=='totalAssetPercentage' && x.elements[i].className.split(" ")[1]=='asset_class_edit_input' 
		   	 || x.elements[i].className.split(" ")[1]=='product_percentage_edit_input' || x.elements[i].className.split(" ")[1]=='combobox'))
	   	{
	   		finalData[j] = x.elements[i].value;
	   		j = j+1;
	    }
    }
	
	//compare
	var changeFlag=0;
	for(var i=0;i<finalData.length;i++){
		if(finalData[i]!=initialData[i]){
			changeFlag=1;
		}
	}
	
	if(changeFlag==1){
		return true;
	}else{
		return false;
	}
	
}

function verifyProduct(){
   	var productCount=parseInt($("#productCount").val());   	
   	for(var i=1;i<=productCount;i++){
   		if(($(".proSearch_"+i).val()!="-1") && ($(".proSearch_"+i).val()!="0") && ($(".proSearch_"+i).val()!="") && ($(".proSearch_"+i).val()!=null) && ($(".productPercent_"+i).val()=="" || $(".productPercent_"+i).val()=="0" || $(".productPercent_"+i).val()=="0.0")){
   			displayMsg("<spring:message code='percentGT0' />");
   			return false;
   		}
   	}
   	return true;
}

// function displayMsg(msg){
// 	$("#successDialog").html(msg);
// 	 $( "#successDialog").dialog( "open" );
// }
function displayMsg(msg){
	$(".modal-body").html(msg);
		$(".btn-success").html("Ok");
		$(".btn-success").on('click',function(){$('#confirmDialog').modal('hide');});
		$(".btn-danger").hide();
		$('#confirmDialog').modal('show');
		closePopupWebApp('');
		$('#confirmDialog_footer').addClass('hide');
		
}

function calculateAssetPercentage(assetPercentId){
	var assetCount=parseFloat($("#productCount").val());
	var totalPercent=0;
	var assetPercent=$(assetPercentId).val();
	for(var i=1;i<=assetCount;i++){
		if($(".assetPercent_"+i).val()){
			totalPercent = totalPercent + parseFloat($(".assetPercent_"+i).val());	
		}		
	}
	totalPercent = totalPercent.toFixed(2);
	var pieces = totalPercent.split(".");
	if(pieces[1]=="00"){
		totalPercent = parseInt(totalPercent);
		$("#totalAssetPercentage").val(totalPercent);
	}else{
		$("#totalAssetPercentage").val(totalPercent);
	}	
	if(assetPercent=="" || isNaN(assetPercent)){
		displayMsg("Enter valid percentage.");
		$(assetPercentId).val("0.0");
	}
}

function calculateProductPercentage(productSearchId,productPercentId){
		var assetPercent=$(productPercentId).parent().parent().parent().children(".second").children(".asset_class_edit_input").val();
		if(assetPercent!="" && assetPercent!="0" && assetPercent!="0.0" && assetPercent!="0.00"){
			if($(productSearchId).val()!="" && $(productSearchId).val()!=null){
				var productCount=parseFloat($("#productCount").val());
				var totalPercent=0;
				//var pieces=productSearchId.split("_");
				var productIdPieces=$(productPercentId).prop('id').split("_");
				$("#equityPercent").val("0.0");
				$("#debtPercent").val("0.0");
				$("#goldPercent").val("0.0");
				var tempPercent=0;
				for(var i=1;i<=productCount;i++){
					if(($(".productPercent_"+i).val()) && ($(".productPercent_"+i).val()!="")){
						productIdPieces=$(".productPercent_"+i).prop('id').split("_");
						totalPercent = totalPercent + parseFloat($(".productPercent_"+i).val());	
						if(productIdPieces[1]=="46001"){							
							tempPercent=parseFloat($("#equityPercent").val());
							tempPercent=tempPercent+parseFloat($(".productPercent_"+i).val());
							$("#equityPercent").val(tempPercent);
						}else if(productIdPieces[1]=="46002"){
							tempPercent=parseFloat($("#debtPercent").val());
							tempPercent=tempPercent+parseFloat($(".productPercent_"+i).val());
							$("#debtPercent").val(tempPercent);
						}else if(productIdPieces[1]=="46003"){
							tempPercent=parseFloat($("#goldPercent").val());
							tempPercent=tempPercent+parseFloat($(".productPercent_"+i).val());
							$("#goldPercent").val(tempPercent);
						}
					}	
					
				}
				totalPercent = totalPercent.toFixed(2);
				var pieces = totalPercent.split(".");
				if(pieces[1]=="00"){
					totalPercent = parseInt(totalPercent);
					$("#totalProductPercentage").val(totalPercent);
				}else{
					$("#totalProductPercentage").val(totalPercent);
				}
				if(($(productPercentId).val()=="") || (isNaN($(productPercentId).val()))){
					displayMsg("Enter valid percentage.");
					$(productPercentId).val("0.0");
				}else{
					/* if(pieces[1]=="46001"){
						var tempPercent=$("#equityPercent").val();
						tempPercent=parseFloat(tempPercent)+parseFloat($(productPercentId).val());
						$("#equityPercent").val(tempPercent);
					}else if(pieces[1]=="46002"){
						var tempPercent=$("#debtPercent").val();
						tempPercent=parseFloat(tempPercent)+parseFloat($(productPercentId).val());
						$("#debtPercent").val(tempPercent);
					}else if(pieces[1]=="46003"){
						var tempPercent=$("#goldPercent").val();
						tempPercent=parseFloat(tempPercent)+parseFloat($(productPercentId).val());
						$("#goldPercent").val(tempPercent);
					} */
				}			
			}else{
				displayMsg("Please select the product first.");
				$(productPercentId).val("0.0");
			}
		}else{
			displayMsg("Please allocate percent to asset first.");
			$(productPercentId).val("0.0");
		}	
	
}

function recalculateProductPercentage(){
	var productCount=parseFloat($("#productCount").val());
	var totalPercent=0;
	var productIdPieces="";
	$("#equityPercent").val("0.0");
	$("#debtPercent").val("0.0");
	$("#goldPercent").val("0.0");
	var tempPercent=0;
	for(var i=1;i<=productCount;i++){
		if(($(".productPercent_"+i).val()) && ($(".productPercent_"+i).val()!="")){
			productIdPieces=$(".productPercent_"+i).prop('id').split("_");
			totalPercent = totalPercent + parseFloat($(".productPercent_"+i).val());	
			if(productIdPieces[1]=="46001"){							
				tempPercent=parseFloat($("#equityPercent").val());
				tempPercent=tempPercent+parseFloat($(".productPercent_"+i).val());
				$("#equityPercent").val(tempPercent);
			}else if(productIdPieces[1]=="46002"){
				tempPercent=parseFloat($("#debtPercent").val());
				tempPercent=tempPercent+parseFloat($(".productPercent_"+i).val());
				$("#debtPercent").val(tempPercent);
			}else if(productIdPieces[1]=="46003"){
				tempPercent=parseFloat($("#goldPercent").val());
				tempPercent=tempPercent+parseFloat($(".productPercent_"+i).val());
				$("#goldPercent").val(tempPercent);
			}
		}	
		
	}
	totalPercent = totalPercent.toFixed(2);
	var pieces = totalPercent.split(".");
	if(pieces[1]=="00"){
		totalPercent = parseInt(totalPercent);
		$("#totalProductPercentage").val(totalPercent);
	}else{
		$("#totalProductPercentage").val(totalPercent);
	}
}

function closeDialog(){
// 	$(".overlay").fadeOut("slow");
	$("#confirmDialog").modal("hide");
}
function performReset(){
	$("#goalRecommendaionForm").attr('action', '${pageContext.request.contextPath}/partner/setDefaultGoalBucket');
	$("#goalRecommendaionForm").submit();
}
function cancelPage(){
	$('#goalRecommendaionForm').attr('action', '${pageContext.request.contextPath}/partner/getProductRecommendationList/-1/${riskProfileId}/${goalYearRangeId}/46001,46002,46003');
	$("#goalRecommendaionForm").submit();
}
</script>

	<div class="modal fade" id="confirmDialog">
    		<div class="modal-dialog">
       		<div class="modal-content">
       		 <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" ><i class="fa fa-info  bigger-130 eastspace2"></i>Message</h4>
		      </div>
            <div class="modal-body">
                <label> You already have ${foundGoal} ${goalTypeString}/s defined. Do you want to modify existing goal ?</label>
             </div>
            <div class="modal-footer hide" id="confirmDialog_footer">
             <button onclick="performReset();"  class="btn btn-primary btn-xs">Yes</button>
  		       <button onclick="closeDialog();" class="btn btn-primary btn-xs">No</button>
		             </div>
    </div>
  </div>
</div>
</body>
</html>