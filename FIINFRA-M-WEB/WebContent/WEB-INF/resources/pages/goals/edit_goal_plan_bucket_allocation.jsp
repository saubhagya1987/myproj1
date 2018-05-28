<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
	.productSearch{
		 width:300px;
	}
	#confirmDialog {
		display: block;
		height: 130px;
		display: none;
		width: 355px;
		box-shadow: 0 0 15px 1px #757575;
	}
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
<script>
$(document).ready(function(){
     
	$(".top_box select").selectBoxIt();
	
	
	var roleBaseLinks = "${roleBaseLinks}";
	var links = roleBaseLinks.split(",");
	if(links != ""){
		for(var i=0;i<links.length;i++){
			$("."+links[i]).attr("href","#");
			$("."+links[i]).addClass("inactiveLink");
			if(links[i].indexOf("save")>-1)
			{
				if(document.forms[0] != undefined){
				document.forms[0].action = "";
				}
			}
		}
	}
	
	$(".wrapper").addClass("view_bucket_allocation_warpper");
	 // Calls the selectBoxIt method on your HTML select box
      $('.scrollable_data').slimScroll();
	   /* Alrternate row color */
        $("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content:even").addClass("even_row");
        $("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content:odd").addClass("odd_row");
       
	   createSlider('#allocation_type',1,2,1,'#type_count');
       $("#allocation_type .ui-slider-handle").text("Product Recommdenations");
	   $("#allocation_type .ui-slider-handle").css({'width':'107px','line-height':'13px','margin-left': '3px'});
		   
	   $("#confirmDialog .close").click(function(){
	        $(".overlay").fadeOut("slow");
	    	$("#confirmDialog").fadeOut("slow");
	    	 });
	   
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
		
		$("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content .fifth").on("click", ".add", function() {
	  
			var productCount=parseInt($("#productCount").val());
			productCount = productCount + 1;
			$("#productCount").val(productCount);
			
			  $(this).prev(".close").fadeIn("slow");			 
		      
		      var productSearchElement=$(this).parent().closest(".dynamic_products").children(".ui-widget").children(".combobox").prop('id');
		      var pieces = productSearchElement.split("_"); 
		      
		      $(this).parent().closest(".dynamic_products").after("<div class='dynamic_products'>" + 
					  "<div class='ui-widget'><select class='combobox common_input proSearch_"+ productCount +"' id='productSearch_"+ pieces[1] +"_"+ pieces[2] +"_"+ pieces[3] +"_"+ productCount +"' name='productSearch_"+ productCount +"' value=''  placeholder='Search product'/></select></div>"+
					  " <input type='text' class='common_input product_percentage_edit_input productPercent_"+ productCount +"' id='productPercent_"+ pieces[1] +"_"+ pieces[2] +"_"+ pieces[3] +"_"+ productCount +"' name='productPercent_"+ productCount +"' onchange='calculateProductPercentage(\"#productSearch_"+ pieces[1] +"_"+ pieces[2] +"_"+ pieces[3] +"_"+ productCount +"\",\".productPercent_"+ productCount +"\");' value='0.0'/>" +
					  " <span class='percent_sign'>%</span>" +
					  "<div class='close'>X</div>" +
					  "<div class='add'>+</div>" +
					  "</div>");
			   
			  //$("select").selectBoxIt();
			  
			  getAutoComplete();
			  
			  $(this).fadeOut("fast");
	  
		   $(this).closest("li.fifth").closest("#gp_view_bucket_alloc .product_allocaton.tabular_data.edit .table_content").find(".table_cell").css("height","auto");
	  
		  calc_height($(this));
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
	 
	
	});
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
<!-- Wrapper starts-->
<div class="wrapper"> 
  <!-- Main starts-->
  <section class="main"> 
    <!-- Common_content Starts-->
    <section class="content common_content">

     <jsp:include page="../layout/submenu_small.jsp"></jsp:include>

      <section class="in_content common_in_content clearfix" id="gp_view_bucket_alloc">
      <form id="goalRecommendaionForm" method="post" action="${pageContext.request.contextPath}/partner/saveGoalPlanBucket">
      	<input type="hidden" name="riskProfileId" value="${riskProfileId}"/>
      	<input type="hidden" name="goalYearRangeId" value="${goalYearRangeId}"/>
      	<%-- <input type="hidden" name="assetClassId" value="${assetClassId}"/>
      	<input type="hidden" name="productTypeId" value="${productTypeId}"/>
      	<input type="hidden" name="categoryId" value="${categoryId}"/> --%>
        <div class="top_box clearfix">
          <div class="fl alloc_partnet hide">
            <div id="allocation_type" class="common_sliding_radio"> <span class="lbl_first lbl">Product Recommdenations</span> <span class="lbl_second lbl">Allocation %</span> </div>
            <input type="text" id="type_count" class="range_counter hide-elem">
          </div>
          <div class="fl">
            <h2 class="fl heading">Risk Profile</h2>
            <select class="fl inactiveLink" id="riskProfile">
              <option value="40001">Conservative</option>
              <option value="40002">Balanced</option>
              <option value="40003">Aggressive</option>
              <option value="-1">All</option>
            </select>
          </div>
          <div class="fl year_to_goal">
            <h2 class="fl heading">Year to Goal</h2>
            <select class="fl inactiveLink" id="goalYearRange">
              <option value="62009">0-3 Years</option>
              <option value="62010">3-5 Years</option>
              <option value="62011">5-7 Years</option>
              <option value="62012">7-9 Years</option>
              <option value="62013">More Than 9 Years</option>
            </select>
          </div>
          <a class="back fr hide" style="display : none;" href="#">Back</a>
          <a class="edit fr hide" style="display : none;" href="#">Edit</a>
          <a class="set_default_btn fr dyanmic_buttons saveGoalPlanLink" style="display : block;" href="#">Set Default</a>
          <a class="cancelBack fr dyanmic_buttons" href="#" style="display : block;">Back</a>
          <a class="cancel fr dyanmic_buttons" href="#" style="display : block;">Cancel</a>
          <c:if test="${sessionScope.userSession.buId!='27829' || (sessionScope.userSession.buId=='27829' && sessionScope.userSession.roleId=='212')}">
            <a class="save fr dyanmic_buttons saveGoalPlanLink" href="#" style="display : block;">Save</a>
          </c:if>          
         </div>
        
        <c:set var="tempAssetClassId" value="0"/>
        <c:set var="tempProductTypeId" value="0"/>
        <c:set var="tempCategoryId" value="0"/>
        <c:set var="totalAssetPercentage" value="0"/>
        <c:set var="totalProductPercentage" value="0"/>
        <c:set var="assetCount" value="0"/>
        <c:set var="equityPercent" value="0"/>
        <c:set var="debtPercent" value="0"/>
        <c:set var="goldPercent" value="0"/>
        <c:set var="tempPercent" value="0"/>
        <c:set var="productCount" value="0"/>
        <div class="tabular_data product_allocaton edit">
          <ul class="table_head reset clearfix">
            <li class="fl sec_col">
              <div class="second theme_background">Asset Class</div>
              <div class="third hide">Product Type</div>
              <div class="fourth hide">Product Category</div>
              <div class="fifth theme_background"><div class="col_name">Product</div>
              <div class="fl name">Name</div><div class="fl percentage">%</div>
              <div class="clr"></div>
              </div>
              <div class="clr"></div>
            </li>
          </ul>
          <div class="scrollable_data">
            <c:forEach items="${recommendationMap}" var="adviceRecommendationList" varStatus="mapCounter">                               
                       
            <c:forEach items="${adviceRecommendationList.value}" var="adviceRecommendation" varStatus="counter">
            
            <c:set var="productCount" value="${productCount + 1}"/>
                                    
            	<!-- <ul class="table_content clearfix reset"> -->
            		<c:choose>
            			<c:when test="${not(tempAssetClassId eq adviceRecommendation.assetClassId)}">
            			<ul class="table_content clearfix reset">
            				<li class="second fl table_cell"><div class="fl" style=" width: 75px;">${adviceRecommendation.assetName}</div> <div class="fl" style=" width: 100px;"><input type="text" name="assetClassPercentage_${productCount}" id="assetPercent_${adviceRecommendation.assetClassId}" class="common_input asset_class_edit_input assetPercent_${productCount}"  value="${adviceRecommendation.allocationPercentAssetClass}" onchange="calculateAssetPercentage('.assetPercent_${productCount}');"/><span class="percent_sign">%</span></div></li>            				
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
            				<li class="fifth fl table_cell">
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
				                	<div class="add">+</div>
				                </c:if>				                
				                </div>        
			               </li>
			            </ul>			               
            			<c:set var="tempAssetClassId" value="${adviceRecommendation.assetClassId}"/>
            			</c:when>
            			<c:when test="${not(adviceRecommendation.productId eq 0)}">
            			<ul class="table_content clearfix reset">
            				<li class="second fl table_cell">&nbsp;</li>
            				<li class="fifth fl table_cell">
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
				                	<div class="add">+</div>
				                </c:if>
				                </div>            					              
			               </li>
			            </ul>			                
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
            		</c:choose> --%>
            		
            		<%-- <li class="fifth fl table_cell">
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
	               </li> --%>
	            <!-- </ul> -->	            
        		<c:set var="totalProductPercentage">${totalProductPercentage + adviceRecommendation.allocationPercentProductId}</c:set>
            </c:forEach>
          	</c:forEach>
           
          </div>
          <div class="bottom_total clearfix">
          	<div class="fl edit_asset_class_percentage_total rel"><span class="lbl">Total :</span><input class="common_input" id="totalAssetPercentage" readonly="readonly"/></div>
          	<div class="fr edit_product_total rel"><span class="lbl">Total :</span><input class="common_input" id="totalProductPercentage" readonly="readonly"/></div>
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
<div id="confirmDialog" class="common_custom_modal_aa">
  <span class="close">X</span>
  <div class="modal_content"> 
    <div class="aa_up">
        <spring:message code="deleteRecord" /></div>
     
         <div class="aa_down"> <a style="cursor:pointer;" class="aa_yes">Yes </a> 
         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>


  </div>
</div>
<!-- Wrapper ends-->
<script>

var initialData=[];
var finalData=[];

$(document).ready(function(){
	
	$("#totalAssetPercentage").val("<fmt:formatNumber type='number' pattern='#.##' maxFractionDigits='1' value='${totalAssetPercentage}' />");
	
	$("#totalProductPercentage").val("<fmt:formatNumber type='number' pattern='#.##' maxFractionDigits='1' value='${totalProductPercentage}' />");
	
	var selectBox = $("#riskProfile").selectBoxIt().data('selectBox-selectBoxIt');
	selectBox.selectOption('${riskProfileId}');
	
	var selectBox1 = $("#goalYearRange").selectBoxIt().data('selectBox-selectBoxIt');			    
    selectBox1.selectOption('${goalYearRangeId}');
    
    $(".save").click(function(){
    	
    	$(".save").addClass("inactiveLink");
    	
    	var finalData=[];
    	
    	if(verifyProduct()){
    		var totalAssetPercentage=parseFloat($("#totalAssetPercentage").val());
        	var totalProductPercentage=parseFloat($("#totalProductPercentage").val());
        	if((totalAssetPercentage < 100) || (totalAssetPercentage > 100)){
        		displayMsg("<spring:message code='assetAllocation' />");
        		$(".save").removeClass("inactiveLink");
        		return false;
        	}else if((totalProductPercentage < 100) || (totalProductPercentage > 100)){
        		displayMsg("<spring:message code='assetAllocation' />");
        		$(".save").removeClass("inactiveLink");
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
						$(".save").removeClass("inactiveLink");
		        		return false;
					}
				}else{
					displayMsg("Asset percentage must be equal to product percentage.");
					$(".save").removeClass("inactiveLink");
	        		return false;
				}        		
        	}	
    	}else{
    		$(".save").removeClass("inactiveLink");
    	}    	
    });
    
    $(".set_default_btn").click(function(){
   		if("${recordTypeId}"==14003){
   			$(".aa_up").html("<spring:message code='goalPlanning.dataReset' />");
   			$(".aa_yes").on('click',function(){performReset();});	
   			var innerHTML='<a style="cursor:pointer;" class="aa_yes" onclick="performReset();">Yes </a> ';
   			innerHTML=innerHTML+ '<a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a>';
   			$(".aa_down").html(innerHTML);
   			$(".overlay").fadeIn();
   			$("#confirmDialog").fadeIn();			
   		}else{
   			displayMsg("<spring:message code='dataAlreadyRestored' />");
   		}
    });
    
    $(".cancel").click(function(){
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
    
    $(".cancelBack").click(function(){
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

function displayMsg(msg){
	$("#successDialog").html(msg);
	 $( "#successDialog").dialog( "open" );
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
				//$("#totalProductPercentage").val(totalPercent);
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
	$(".overlay").fadeOut("slow");
	$("#confirmDialog").fadeOut("slow");
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
</body>
</html>