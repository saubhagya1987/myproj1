<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.asset_allo_goal .bm_bx .label_bx .label_two {
	width: 83px;
	font: 11px/12px "aller bold", sans-serif;
}
</style>

<script>
$(document).ready(function(){
	
	for(var i=0;i<10;i++){
		var currentValue = parseFloat($("#futureValue").val());
		allocatedAmount = parseFloat($("#allocatedAmount_"+i).val());
		if(currentValue <= 0.0 ){
			allocatedPercent = 0;
		}
		else if(allocatedAmount != null || allocatedAmount != ''){
			allocatedPercent = ((allocatedAmount/currentValue) * 100).toFixed(2);	
		}
		$("#allocatedPercent_"+i).val(allocatedPercent);
	}
	
	$(".assetTypes").selectBoxIt({
		 populate: {"data": ${assetTypeList}}
	});  
	
	$(".assetName").selectBoxIt();
	
	for(var i=0;i<10;i++){
		$( "body" ).on( "change", "#assetTypes_"+i , function(){
			var assetTypeId = this.value;
			var goalId = ${goalId};
			var dropdownIdArray=this.id.split("_");
			var assetNameDropDown = "#assetName_"+dropdownIdArray[1];
			var selectedAssetId = "#assetNameId_"+dropdownIdArray[1];
						
			//$("#availableValue_"+dropdownIdArray[1]).val("0");
			//$("#allocatedAmount_"+dropdownIdArray[1]).val("0");
			//$("#allocatedPercent_"+dropdownIdArray[1]).val("0");
			//$("#maturityDate_"+dropdownIdArray[1]).val("");
			
			$("#assetsAllocationForm").ajaxSubmit({
				url: "${pageContext.request.contextPath}/assets/getAssetNameList",
				type : "GET",
				data : {'assetTypeId' : assetTypeId,'goalId' : goalId},
				 success: function(msg){
					$(assetNameDropDown).empty();	
					$.each(msg, function(index, item) {	
						$(assetNameDropDown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
					}); 
					var selectBox = $(assetNameDropDown).selectBoxIt().data('selectBox-selectBoxIt');
					selectBox.selectOption($(selectedAssetId).val());
					$(selectedAssetId).val("");
					/* alert(""+msg.length());
					if(msg.length()>2){
						$("#availableValue_"+dropdownIdArray[1]).val("0");
						$("#allocatedAmount_"+dropdownIdArray[1]).val("0");
						$("#allocatedPercent_"+dropdownIdArray[1]).val("0");
						$("#maturityDate_"+dropdownIdArray[1]).val("");
					} */
				}
			}); 
		});
		
		$( "body" ).on( "change", "#assetName_"+i , function(){
			var partyAssetId = this.value; 
			var dropdownIdArray=this.id.split("_");
			var goalId = ${goalId};
			var partyId = ${partyId};
			var dropdownId = "#assetName_"+ dropdownIdArray[1];
			var selectedAsset=$( dropdownId +" option:selected").text();
			
			//$("#allocatedAmount_"+dropdownIdArray[1]).val("0");
			//$("#allocatedPercent_"+dropdownIdArray[1]).val("0");
			
			if(parseInt(partyAssetId) != -1){
				for(var i=0;i<10;i++){
					if(($(dropdownId).val()!=-1) && (i!=dropdownIdArray[1]) && (partyAssetId == parseInt($("#assetName_"+i).val()))){					
						$(dropdownId).val("-1");
						var selectBox = $(dropdownId).selectBoxIt().data('selectBox-selectBoxIt');			    
						selectBox.selectOption("-1");
						displayMsg("You have already selected "+ selectedAsset +" asset.");
						return false;
					}
				}
				//var assetNameDropDown = "#assetName_"+dropdownIdArray[1];
				$("#assetsAllocationForm").ajaxSubmit({
					url: "${pageContext.request.contextPath}/assets/getAssetAvailableValue",
					type : "GET",
					data : {'partyAssetId' : partyAssetId,'goalId':goalId,'partyId':partyId},
					 success: function(result){
						$("#availableValue_"+dropdownIdArray[1]).val(result.availableValue);					
					}
				});
			}else{
				$("#availableValue_"+dropdownIdArray[1]).val("0");
			}
			 
		});
		
		$( "body" ).on( "change", "#allocatedAmount_"+i , function(){
			var dropdownIdArray=this.id.split("_");
			var availableAmount = parseInt($("#availableValue_"+dropdownIdArray[1]).val());			
			var allocatedAmount = 0;
			if(this.value != ""){
				allocatedAmount = parseInt(this.value);
			}				
			
			var totalAvailableAmount = availableAmount;
			
			if($("#assetName_"+dropdownIdArray[1]) != "-1"){
				
				if($("#savedAllocatedAmount_"+dropdownIdArray[1]).val()!=null && $("#savedAllocatedAmount_"+dropdownIdArray[1]).val()!=""){
						totalAvailableAmount = availableAmount + parseInt($("#savedAllocatedAmount_"+dropdownIdArray[1]).val());
						availableAmount = totalAvailableAmount;
						if(allocatedAmount <= availableAmount){
							availableAmount = availableAmount - allocatedAmount;
						}						
						$("#availableValue_"+dropdownIdArray[1]).val(availableAmount);
						$("#savedAllocatedAmount_"+dropdownIdArray[1]).val(0);
				}
				
				if(this.value != ""){					
					if(allocatedAmount <= totalAvailableAmount){
						calculateTotalAllocatedValue(dropdownIdArray[1]);
						//var totalAllocatedValue = parseInt($("#allocatedValue").val());						
						$("#savedAllocatedAmount_"+dropdownIdArray[1]).val(allocatedAmount);
						//var allocatedPercent = ((allocatedAmount/totalAllocatedValue) * 100).toFixed(2);					
						//$("#allocatedPercent_"+dropdownIdArray[1]).val(allocatedPercent); */
					}else{
						displayMsg("Allocated amount must be smaller than or equal to available amount.");
						this.value = 0; 
						calculateTotalAllocatedValue(dropdownIdArray[1]);
					}
				}else{
					displayMsg("Allocated amount must be greater than 0.");
					this.value = 0;
					calculateTotalAllocatedValue(dropdownIdArray[1]);
				}
			
				
			}else{
				displayMsg("Please select asset name first.");
				this.value = 0;
				calculateTotalAllocatedValue(dropdownIdArray[1]);
			}
			
		});
		
		$("body").on("click", "#clear_"+i, function() {
			
			
			var dropdownIdArray=this.id.split("_");
			var dropdownId = "#assetTypes_"+ dropdownIdArray[1];
			
			//alert(dropdownIdArray[1]);
			//alert(dropdownId);
			//alert($(dropdownId).val());
			
			var futureValue = parseFloat($("#futureValue").val());
			var allocatedValue = parseFloat($("#allocatedValue").val());
			var allocatedAmount = parseFloat($("#allocatedAmount_"+dropdownIdArray[1]).val());
			
			$("#allocatedValue").val((allocatedValue-allocatedAmount).toFixed(2));
			
			allocatedValue = parseFloat($("#allocatedValue").val());
			$("#requiredValue").val((futureValue-allocatedValue).toFixed(2));
			
			
			$(dropdownId).val("-1");
			var selectBox = $(dropdownId).selectBoxIt().data('selectBox-selectBoxIt');			    
			selectBox.selectOption("-1");
			$("#availableValue_"+dropdownIdArray[1]).val("0.0");
			$("#allocatedAmount_"+dropdownIdArray[1]).val("0.0");
			$("#allocatedPercent_"+dropdownIdArray[1]).val("0.0");
			
			
			
		    //$("#currentValue_"+dropdownIdArray[1]).val("");
			//calculateTotalAllocatedValue(-1);
		});
		
	}	
	
  	$('.asset_allo_goal_third_row').slimScroll();
 	//	$('.asset_to_goal_slider_bx_out').bxSlider();
  });
  
function calculateTotalAllocatedValue(id){
	var totalAllocatedValue = 0;
	for(var i=0;i<10;i++){
		totalAllocatedValue = totalAllocatedValue + parseInt($("#allocatedAmount_"+i).val());
	}
	if(id==-1){
		for(var i=0;i<10;i++){
			$("#allocatedPercent_"+i).val("0.0");
		}
		return true;
	}
	$("#allocatedValue").val(totalAllocatedValue);
	var allocatedAmount = 0;	
	var allocatedPercent = 0;
	/* for(var i=0;i<10;i++){
		if(totalAllocatedValue != 0){
			allocatedAmount = parseInt($("#allocatedAmount_"+i).val());
			allocatedPercent = ((allocatedAmount/totalAllocatedValue) * 100).toFixed(2);					
			$("#allocatedPercent_"+i).val(allocatedPercent);
		}else{
			$("#allocatedPercent_"+i).val("0");
		}		
	} */	
	var currentValue = parseFloat($("#futureValue").val());
	allocatedAmount = parseFloat($("#allocatedAmount_"+id).val());
	if(currentValue <= 0.0){
		allocatedPercent = 0;
	}else {
		allocatedPercent = ((allocatedAmount/currentValue) * 100).toFixed(2);	
	}
	var value = (currentValue-totalAllocatedValue);
	value = value.toFixed(2);
	
	if( value < 0 ){
		value = 0;
	}
	$("#allocatedPercent_"+id).val(allocatedPercent);
	$("#requiredValue").val(""+value);	
}
  
function displayMsg(msg){
	$("#successDialog").html(msg);
	$( "#successDialog").dialog( "open" );
}
 
$(window).load(function(){ 
 
var goaltype = "${goalDesc}";

if(goaltype == 'Retirement'){
	 for(var i=0;i<10;i++){
		 $("#assetTypes_"+i).selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"72008","text":"Retirement Funds"}]);
	 }
	 $('.urf').css("display","none");
}
})
</script>

<script>
  $(function() {
   
	 // Preferred Product Count Intlalized	
	var count=3;
	
	//Add Button Starts
  $(".asset_allo_goal_third_row").on("click", ".add", function() {
	   $(this).fadeOut();
	   count++;
	   
	$(this).prev(".close").fadeIn();
	
		
		$(this).parent().closest("ul").after("<ul class='reset clearfix Auto_Plan_col clearfix'><li class='input_txt_one fl'><input type='text' class='common_input_ap' value=''></li><li class='input_txt_two fl'><select class='selectbox' id='brand'><option>Select</option><option>Daughter</option><option>Son</option><option>Husband</option></select></li><li class='input_txt_three fl'><select class='selectbox' id='brand'><option>Select</option><option>2023</option><option>2024</option><option>2025</option></select></li><li class='input_txt_four fl'><div class='assumption_bx_input_counter_parent fl'><input type='text' class='common_input' value='' ></div></li><li class='clearfix input_txt_six fl'><span class='common_input3'></span><div class='close'>x</div><div class='add'>+</div></li></ul>");
	   //Preferred Product Count Written
	 $("select").selectBoxIt();
	 // createSlider("#your_age"+count,0,100,1,"#age"+count);
	  
  
	});

// Close Button 
$(".auto_plan_li_bx_fourth_row").on("click", ".close", function() {
	
	$(this).parent().closest("ul").siblings("ul").removeClass("moved_down");
	$(this).parent().closest("ul").prev("ul").addClass("moved_down");
	var count_section = $(this).parent().closest(".EP_cnt ").find(".selectboxit").length;
	
	
	$(this).parent().closest("ul").remove();
    $("ul:last-of-type").find(".add").fadeIn(); 
	// removing record

// Preferred Product Ends

	
	});	
	
	 
  });
  </script>
  
<!-- Common_content Starts-->
    <section class="content common_content">
      <jsp:include page="../layout/dc_submenu.jsp"></jsp:include>
      <!-- Common_in_contnet starts-->
      <section class="asset_to_goal_bx_in">

      <form id="assetsAllocationForm" action="${pageContext.request.contextPath}/assets/saveAssetsAllocatedToGoal" method="post">
      	<input type="hidden" name="partyId" value="${partyId}"/>
      	<input type="hidden" name="goalId" value="${goalId}"/>
      	<input type="hidden" name="fpPlanId" value="${fpPlanId}"/>
      	<input type="hidden" name="finalAssetTypes" id="finalAssetTypes" value=""/>
      	<input type="hidden" name="finalAssetNames" id="finalAssetNames" value=""/>
      	<input type="hidden" name="finalAllocatedAmount" id="finalAllocatedAmount" value=""/>
      	<input type="hidden" name="finalAssetAllocatedPercent" id="finalAssetAllocatedPercent" value=""/>
      	<input type="hidden" name="finalAssetAvailableValue" id="finalAssetAvailableValue" value=""/>      	
      </form>

        <div class="asset_allo_goal">
          <div class="tp_bx">
            <div class="gl_bx fl">
              <label>CURRENT ${goalDescription} VALUE (<span class="WebRupee">.RS</span>)</label>
              <input name="currentValue" id="currentValue" type="text" disabled class="common_input" value="${currentValue}">
            </div>
            <div class="gl_bx fl">
              <label>FUTURE ${goalDescription} VALUE (<span class="WebRupee">.RS</span>)</label>
              <input name="futureValue" id="futureValue" type="text" disabled class="common_input" value="${futureValue}">
            </div>
            <div class="gl_bx fl">
              <label>ALLOCATED ASSET VALUE (<span class="WebRupee">.RS</span>)</label>
              <input name="allocatedValue" id="allocatedValue" type="text" disabled class="common_input" value="0.0">
            </div>
            <div class="aar_bx fr">
              <label>ADDITIONAL ASSETS REQUIRED (<span class="WebRupee">.RS</span>)</label>
              <input name="requiredValue" id="requiredValue" type="text" disabled class="common_input" value="0.0">
            </div>
               <a class="goals_back_btn goals_back_btn2" href="${pageContext.request.contextPath}/assets/assetAllocatedToGoal/${partyId}">Back</a>
               <c:choose>
               	<c:when test="${goalDescription eq 'DOWN PAYMENT'}">
               		<p style="font-size: 18px;">Amount and calculation Shown for Down payment only.</p>
               	</c:when>
               </c:choose>
 </div>
          <div class="title_bx">
            <div class="title">Allocated Assets</div>
            <div class="urf" ><input name="" id="retirement" type="checkbox" value=""> Use Retirement Funds</div>
          </div>
          <div class="bm_bx">
            <div class="label_bx clearfix">
              <div class="label_one fl">Asset Type</div>
              <div class="label_one fl">Asset Name</div>
              <!-- <div class="label_one fl">Asset - Current Value ( <span class="WebRupee">.RS</span> )</div> -->
              <div class="label_one fl">Asset - Future Available Value(In Goal Year) ( <span class="WebRupee">.RS</span> )</div>
              <div class="label_one fl">Allocated to Goal ( <span class="WebRupee">.RS</span> )</div>              
              <div class="label_two fl">Goal Fulfillment ( % )</div>
            </div>
            
            
            
            <div class="asset_allo_goal_third_row">
           <c:set var="allocatedValue" value="0.0"/>     
          <c:forEach items="${assetAllocatedToGoalList}" var="assetAllocatedToGoal" varStatus="counter">
      		<ul class="reset clearfix">
	            <li class="input_txt_one fl">
	               <select class="selectbox assetTypes" id="assetTypes_${counter.index}">
	              </select>
	           </li>
	           <li class="input_txt_one fl">
	              <select class="selectbox assetName" id="assetName_${counter.index}">
	                <option value="-1">---Select---</option>
	              </select>
	            </li>
	            <input type="hidden" id="assetNameId_${counter.index}" value="${assetAllocatedToGoal.partyAssetId}"/>
	            <%-- <li class="input_txt_one fl">
	                <input type="text" disabled id="currentValue_${counter.index}" class="common_input" value="" >
	            </li> --%>
	            <li class="input_txt_two fl"><input type="text" disabled id="availableValue_${counter.index}" class="common_input2 fr" value="0"></li>	            
	            <li class="input_txt_one fl">
	                <input type="text"  class="common_input" id="allocatedAmount_${counter.index}" value="${assetAllocatedToGoal.allocatedAmount}" >
	                <input type="hidden" id="savedAllocatedAmount_${counter.index}" value="${assetAllocatedToGoal.allocatedAmount}" >
	                <c:set var="allocatedValue" value="${allocatedValue + assetAllocatedToGoal.allocatedAmount}"/>
	            </li>	            
	            <li class="input_txt_three fl">
	                <input type="text" disabled id="allocatedPercent_${counter.index}" class="common_input2" value="0" >
	            </li>
	            <li class="clearfix input_txt_six fl"><span class="common_input3"></span>
	              <div class="close" id="clear_${counter.index}">x</div>
	           <!--   <div class="add">+</div>-->
	            </li>
	          </ul>
      	  </c:forEach>
                
          <c:forEach begin="${fn:length(assetAllocatedToGoalList)}" end="9" varStatus="counter">
          	<ul class="reset clearfix">
	            <li class="input_txt_one fl">
	               <select class="selectbox assetTypes" id="assetTypes_${counter.index}">
	              </select>
	           </li>
	            <li class="input_txt_one fl">
	              <select class="selectbox assetName" id="assetName_${counter.index}">
	                <option value="-1">---Select---</option>
	              </select>
	            </li>
	            <%-- <li class="input_txt_one fl">
	                <input type="text" disabled id="currentValue_${counter.index}" class="common_input" value="" >
	            </li> --%>
	            <li class="input_txt_two fl"><input type="text" disabled id="availableValue_${counter.index}" class="common_input2 fr" value="0"></li>
	            <li class="input_txt_one fl">
	                <input type="text"  class="common_input" id="allocatedAmount_${counter.index}" value="0" >
	                <input type="hidden" id="savedAllocatedAmount_${counter.index}" value="0" >
	            </li>	            
	            <li class="input_txt_three fl">
	                <input type="text" disabled id="allocatedPercent_${counter.index}" class="common_input2" value="0" >
	            </li>
	            <li class="clearfix input_txt_six fl"><span class="common_input3"></span>
	              <div class="close" id="clear_${counter.index}">x</div>
	           <!--   <div class="add">+</div>-->
	            </li>
	          </ul>
          </c:forEach>        
         
        </div>
              <input type="button" class="a_to_g_edit fr" value="Save" style="cursor: pointer;" onclick="submitData();">
        
          </div>
        </div>
        
        <!--Footer Starts-->
        
        <div class="asset_to_goal_footer">
          <div class="asset_label_bx fl">
            <div class="asset_label_top fl">Total Value (<span class="WebRupee">Rs</span>)</div>
            <div class="asset_label_bottom fl">Available Value (<span class="WebRupee">Rs</span>)</div>
          </div>
          <!--Mutual Funds-->
          <div class="asset_bx fl">
            <div class="label">Mutual Funds</div>
            <div class="icon_bg">
              <div class="m_f_icon"></div>
            </div>
            <div class="total_value" id="Mtotal_value"></div>
            <div class="available_value" id="Mavailable_value"></div>
          </div>
          <!--Mutual Funds--> 
          <!--Shares-->
          <div class="asset_bx fl">
            <div class="label">Shares</div>
            <div class="icon_bg">
              <div class="shares_icon"></div>
            </div>
            <div class="total_value" id="Stotal_value"></div>
            <div class="available_value" id="Savailable_value"></div>
          </div>
          <!--Shares--> 
          <!--Deposits-->
          <div class="asset_bx fl">
            <div class="label">Deposits</div>
            <div class="icon_bg">
              <div class="deposit_icon"></div>
            </div>
            <div class="total_value" id="Dtotal_value"></div>
            <div class="available_value" id="Davailable_value"></div>
          </div>
          <!--Deposits--> 
          <!--Retirement Funds-->
          <div class="asset_bx fl">
            <div class="label">Retirement Funds</div>
            <div class="icon_bg">
              <div class="rf_icon"></div>
            </div>
            <div class="total_value" id="Rtotal_value"></div>
            <div class="available_value" id="Ravailable_value"></div>
          </div>
          <!--Retirement Funds--> 
          <!--Gold-->
          <div class="asset_bx fl">
            <div class="label">Gold</div>
            <div class="icon_bg">
              <div class="gold_icon"></div>
            </div>
            <div class="total_value" id="Gtotal_value"></div>
            <div class="available_value" id="Gavailable_value"></div>
          </div>
          <!--Gold--> 
          <!--Property-->
          <div class="asset_bx fl">
            <div class="label">Property</div>
            <div class="icon_bg">
              <div class="property_icon"></div>
            </div>
            <div class="total_value" id="Ptotal_value"></div>
            <div class="available_value" id="Pavailable_value"></div>
          </div>
          <!--Property--> 
          <!--Insurance-->
          <div class="asset_bx fl">
            <div class="label">Insurance</div>
            <div class="icon_bg">
              <div class="rf_insurance"></div>
            </div>
            <div class="total_value" id="Itotal_value"></div>
            <div class="available_value" id="Iavailable_value"></div>
          </div>
          <!--Insurance--> 
          <!--Others-->
          <div class="asset_bx fl">
            <div class="label">Others</div>
            <div class="icon_bg">
              <div class="rf_others"></div>
            </div>
            <div class="total_value" id="Ototal_value"></div>
            <div class="available_value" id="Oavailable_value"></div>
          </div>
          <!--Others--> 

        </div>
      </section>
      <!-- Common_in_contnet ends-->
      <div class="overlay"></div>
    </section>
    <!-- Common_content Ends-->
    
 <script>
 
 $(document).ready(function(){
	 
	 $('#retirement').on('change', function(ev){
         if($(this).is(':checked')) {
        	 for(var i=0;i<10;i++){
        		 $("#assetTypes_"+i).selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"72008","text":"Retirement Funds"}]);
        	 }
         }else{
        	 for(var i=0;i<10;i++){
        		 $("#assetTypes_"+i).selectBoxIt().data("selectBox-selectBoxIt").remove(10);
        	 }
         }
     }).trigger('change');
	 
	 
	 $(".head_txt").html("ASSET ALLOCATION FOR ${goalDesc}");
	 <c:forEach items="${assetAllocatedToGoalList}" var="assetAllocatedToGoal" varStatus="counter">
		var fund = "${assetAllocatedToGoal.assetTypeId}";
			 
			 if( fund == '72008' ){
				 $("#retirement").attr("checked",true);
				 for(var i=0;i<10;i++){
		   		 $("#assetTypes_"+i).selectBoxIt().data('selectBox-selectBoxIt').add([{"value":"72008","text":"Retirement Funds"}]);
		   	 }
			 }
		var selectBox = $("#assetTypes_${counter.index}").selectBoxIt().data('selectBox-selectBoxIt');
		selectBox.selectOption("${assetAllocatedToGoal.assetTypeId}");
	</c:forEach> 
	<c:forEach items="${assetSummaryList}" var="assetSummary" varStatus="counter">
		$("#${fn:substring(assetSummary.assetName, 0, 1)}total_value").html("${assetSummary.currentBalance}");
		$("#${fn:substring(assetSummary.assetName, 0, 1)}available_value").html("${assetSummary.allocatedValue}");
	</c:forEach> 
	$("#allocatedValue").val("${allocatedValue}");
	var requiredValue = parseFloat($("#futureValue").val()) - parseFloat($("#allocatedValue").val()).toFixed(2);
	if( requiredValue < 0 ){
		requiredValue = 0 ;
	}
	$("#requiredValue").val(requiredValue);
 });
 
 var partyAssetIdArray = [];
 var assetTypeArray = [];
 var allocatedAmountArray = [];
 var allocatedPercentArray = [];
 var availableValueArray = [];
 
 function submitData(){
	 
	 partyAssetIdArray = [];
	 assetTypeArray = [];
	 allocatedAmountArray = [];
	 allocatedPercentArray = [];
	 availableValueArray = [];
	 
	 var errorMsg = "";
	 var recordCount = 1;
	 
	 for(var i=0;i<10;i++){
		 if(($("#assetTypes_"+i).val() != "") && ($("#assetTypes_"+i).val() != "-1")){
			 if(($("#assetName_"+i).val() != "") && ($("#assetName_"+i).val() != "-1")){
				 if(($("#allocatedAmount_"+i).val() != "") && (parseInt($("#allocatedAmount_"+i).val()) != 0)){
					 recordCount = recordCount + 1;
					 assetTypeArray.push($("#assetTypes_"+i).val());
					 partyAssetIdArray.push($("#assetName_"+i).val());
					 allocatedAmountArray.push($("#allocatedAmount_"+i).val());
					 allocatedPercentArray.push($("#allocatedPercent_"+i).val());
					 availableValueArray.push($("#availableValue_"+i).val());
				 }else{
					 errorMsg = "Allocated amount must be greater than 0.";
					 break;
				 }
			 }else{
				 errorMsg = "Please select asset name.";
				 break;
			 }
		 }
	 }
	 
	 if(errorMsg != ""){		 
		 displayMsg(errorMsg);		 
	 }else if(recordCount > 0){
		 $("#finalAssetTypes").val(assetTypeArray);
		 $("#finalAssetNames").val(partyAssetIdArray);
		 $("#finalAllocatedAmount").val(allocatedAmountArray);
		 $("#finalAssetAllocatedPercent").val(allocatedPercentArray);
		 $("#finalAssetAvailableValue").val(availableValueArray);
		 $("#assetsAllocationForm").submit();
	 }else{
		 displayMsg("Select atleast one asset to be allocated to the goal.")
	 }
	 
 }
 
 </script>