<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.cp.AssetData"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%@page import="in.fiinfra.cp.common.CpConstants"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<% AssetData asset=(AssetData) request.getAttribute("assetData"); %>
<script>
$(document).ready(function(){
 
	$("#asset-stock-form ").validate({
		errorElement:'div',
    	errorClass:'errors',
    	
        rules: {
        	assetName: {required:true,"checkValidName": true,"checkDuplicateExpenses":true},
        	totalUnitsQty: {
                    required: true,
                    min:1,
                    digits:true
                },
                stockPrice: {
                    required: true,
                    min:1,
                    digits:true
                }
        },
        messages: {
        	assetName: {required:"Enter Stock Name","checkValidName" :"Special Character not allowed"},
        	totalUnitsQty: {required:"Enter Quantity",digits:"Please enter numbers only"},
        	stockPrice: {required:"Enter Stock Price",digits:"Please enter numbers only"}
            
            
        }
    });

	 // Calls the selectBoxIt method on your HTML select box
    });
    
</script>

<script>
function saveStock() {
	//alert($('#expense_form').serialize());
 	if($('#asset-stock-form ').valid()){
 		$('#asset-stock-form ').submit();	
 	}
}
</script> 


<script>
var selectedScript = null;

$(document).ready(function(){
	var cache = {};
	
	$("#assetName").autocomplete({
		source: function (request, response) {
			var term = request.term;
	        if ( term in cache ) {
	          response( cache[ term ] );
	          return;
	        }
	        $.getJSON("${pageContext.request.contextPath}/common/product.json?type=Equity&searchStr=" + request.term, function (data) {
	        	
	        	var output  = $.map(data, function (data) {
	        		
	                return {
	                    label: data.name,
	                    value: data.id,
	                    id:data.id

	                };
	            }) ;
	        	cache[ term ] = output;
	            response(output);
	        });
	    },
	    autoFocus: true,
	    minLength: 2,
	    select: function (event, ui) {
	        event.preventDefault();
	        $("#productId").val(ui.item.value);
	        $("#assetName").val(ui.item.label);
	        selectedScript = ui.item.label;
	    }
	});
	
	$( "#assetName" )
	  .focusout(function() {
	        if($("#assetName").val().length <=0 ){
	        	$("#productId").val("");
	        }
	        else if(selectedScript != $("#assetName").val()){
	        	if($("#assetName").val().length >0 && selectedScript.length ==0){
	        		showMessage('Stock name not found.',true);
	        		$("#assetName").focus();
	        	}
	        	$("#assetName").val(selectedScript);
	        	
	        }
	  })
	  ;
	selectedScript = $("#assetName").val();
    
    $('#asset-stock-form').validate({
    	errorClass:"errors", 
        rules: {
        	currentValue: { 
            required: true,
        	digits: true,
        	min:1,
        	maxlength:18
        	},
        	totalUnitsQty:{ 
             required: true,
         	digits: true,
         	min:1,
         	maxlength:10
         
        },
        assetName:{
        	required: true
        }
        },
        messages: {
        	
        }   
       
    });
	 // Calls the selectBoxIt method on your HTML select box
    });
    
</script>
<script>
$(document).ready(function(){

  $(".selectboxit-container ").click(function(){
    //$('#personal_details_accordian').perfectScrollbar("update");
	//$('#contact_details_accordian').perfectScrollbar("update");
//	$('.family_details').perfectScrollbar("update");
	});
	 $(".thumb_select_ul a").click(function(){
		//alert("hi");
    $(this).children(".categoery").toggleClass("applicable");
}) 
}) 
</script>

  <!-- custom scroll to "common_in_content" -->
  <script>
$(document).ready(function(){
	  //Tracker Details Rating value Slider
	  createSlider('#Conversion_Probability',0,100,1,"#C_P_Value")
	  createSlider('#opportunity_rating',1,3,1,"")
	  
	  
  });

$(document).ready(function(){
$( "#stockPrice" ).change(function() {
	/* alert("mul"); */
	  var qty=$('#totalUnitsQty').val();
	 var stockPrice=$('#stockPrice').val();

	  var currentVal=0;
		  	  if(qty!=""&&stockPrice!=""){
		  		currentVal=qty*stockPrice;
		  $('#currentValue').val(currentVal);
	  }
	});
	
$("#totalUnitsQty").change(function() {
	var qty=$('#totalUnitsQty').val();
	 var stockPrice=$('#stockPrice').val();

	  var currentVal=0;
		  	  if(qty!=""&&stockPrice!=""){
		  		currentVal=qty*stockPrice;
		  $('#currentValue').val(currentVal);
	  }
	
	});
});
</script>
  <!-- custom scroll to "common_in_content" -->

  <script>
$(document).ready(function(){
  	$( "#tabs" ).tabs();
	$(function() {
     $( ".datepicker" ).datepicker({
	  dateFormat: "dd-M-yy",
      showOn: "button",
	  buttonText: '',
	  changeMonth: true,
      changeYear: true
     });
	  $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
  });
	$(function() {
		$(".datepicker").datepicker({
			dateFormat : "dd-M-yy",
			showOn : "button",
			buttonText : '',
			yearRange : "-100:+0",
			changeMonth : true,
			changeYear : true,
			endDate: "dateToday"	
		});
		$("#boughtInTheYear").datepicker({
			changeMonth : true,
			changeYear : true,
			autoclose : true,
			dateFormat : 'dd-M-yy',
			endDate: "dateToday"
		});
		$(".ui-datepicker-trigger")
				.wrap(
						"<div class='datepicker-trigger-parent'></div>");
	});
	
	$( ".datepicker" ).attr( 'readOnly' , 'true' );
  
	$( ".datepicker" ).attr( 'readOnly' , 'true' );
  
	$( ".datepicker" ).attr( 'readOnly' , 'true' );
  
    /* $("select").selectBoxIt(); */
	 // Calls the selectBoxIt method on your HTML select box
	 
    $("body").on("click", ".submit_btn", function() {
    	
    	if($('#asset-stock-form').valid()){
	 		$('#asset-stock-form').submit();	
		}
      	// $('#asset-stock-form').submit();
    	  
      });
	 
	 $("body").on("click", "#addSave", function() {
      	
    	if($('#asset-stock-form').valid()){
    		var form=$('#asset-stock-form');
    		form.append('<input name="action" type="hidden" value="add"/>');
    		form.submit();
    	}
    	   	});
	 
	 var assetId="${assetId}";
	 if(assetId>0){
		 //$("#ownerPartyId").attr("disabled",true);
	 }
	 
});
</script>
<!-- end of "nav-menu" id -->

    <!-- <legend>MY ASSETS : <span class="title_it">STOCK</span></legend> -->
   
   <%--  <a href="${pageContext.request.contextPath}/portfolio/myLoan" class="my-loan-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Loans</a> </div> --%>
<!-- end of "header-strip" id -->

<!-- end of "inner-shadow-strip" id -->


   
        <!--title starts-->
        
       <!--  <div class="add_stock_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Stock Name</li>
            <li class="input_title_three fl">Quantity</li>
            <li class="input_title_four fl">Stock Price</li>
            <li class="input_title_five fl">Current Value</li>
            <div class="clr"></div>
          </ul>
          </div> -->
        <!--title ends--> 
        <!--txt starts-->
        <form id=asset-stock-form   action="${pageContext.request.contextPath}/portfolio/myAsset/save" method="POST" >
         <%List<KeyValue> familyMembers=(List<KeyValue>) request.getAttribute("familyMembers"); %>
         <input name="assetTypeId" type="hidden" value="<%=CpConstants.STOCK%>"/>
            <input name="partyAssetId" type="hidden" value="<%=asset.getPartyAssetId() != null?asset.getPartyAssetId():0%>"/>
            <input name="productId" id="productId" type="hidden" value="<%=asset.getProductId() != null? asset.getProductId():0%>"/>
       
            
            
            
            
            <%-- <ul>
               
                <li class="input_txt_one fl">
              
               <%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               
               <%} %>
                <select id="ownerPartyId" name="ownerPartyId" class="required">
                  <%  
                  for (KeyValue idv:familyMembers){
                  %>
                  
                 <option value='<%=idv.getId()%>' <%=idv.getId().equals(asset.getOwnerPartyId())? " selected":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
                  <%}%>
                  </select>
               
			</li>
                <li class="input_txt_two fl"> <input value="<%=CommonUtils.emptyIfNull(asset.getAssetName()) %>" name="assetName" id="assetName" type="text" class="grt_bx" /> </li>
                <li class="input_txt_three fl"><input value="<%=asset.getTotalUnitsQty()>0?asset.getTotalUnitsQty():"" %>" id="totalUnitsQty" name="totalUnitsQty" type="text" class="grt_bx numbersOnly" /> </li>
                <li class="input_txt_four fl"> <input  id="stockPrice" type="text" class="grt_bx numbersOnly" value="<%=asset.getCurrentValue()>0&&asset.getTotalUnitsQty()>0?asset.getCurrentValue()/asset.getTotalUnitsQty() :""%>"/> </li>
                <li class="input_txt_five fl"> <input value="<%=asset.getCurrentValue()>0?asset.getCurrentValue():"" %>" id="currentValue" name="currentValue" type="text" class="grt_bx numbersOnly" /> </li>
              </ul> --%>
              
            <!-- txt ends--> 
            
     
            
        
         
			<!-- New Code -->
			
				<fieldset>
         	<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Owner</label>
					<div class="col-lg-4">
						<!-- <input id="second_col_input" name="url" placeholder="Heading"
								class="form-control" type="text" value=""> -->
								 <%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               <%} %>
						<select  id="ownerPartyId" name="ownerPartyId"  class="form-control">
							<%  
                  for (KeyValue idv:familyMembers){
                  %>

							<option value='<%=idv.getId()%>' <%=idv.getId().equals(asset.getOwnerPartyId())? " selected":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
							 <%}%>
						</select>
					</div>
				</div>
				<br> <br>
			</div>
				<div class="col-xs-12 ">
			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">Transaction Type <span class="required">*</span></label>
				<div class="col-lg-4">
							<select class="form-control" id="transId" name="transId">
							<%
								List<CodeValueData> transtypes = (List<CodeValueData>) request
										.getAttribute("transList");
								for (CodeValueData idv : transtypes) {
							%>

							<option value='<%=idv.getCodeValueId()%>'
								<%=new Integer(idv.getCodeValueId()).equals(asset
						.getTransId()) ? " selected " : ""%>><%=idv.getCodeValue()%></option>
							<%
								}
							%>
						</select>
						
				</div>
			</div>
			<br> <br>
		</div>
		<div class="col-xs-12 ">
			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">Bought in the year</label>
				<div class="col-lg-4">
					<div class="input-group">
					<!-- <input id="second_col_input" name="url" placeholder="Subject" class="form-control" type="text" value=""> -->
					<input type="text" id="boughtInTheYear" name="sipStartDate"
							class="form-control" placeholder="dd-mmm-yyyy"
							aria-invalid="true"
							value="<%=CommonUtils.emptyIfNull(CommonUtils.format(
					asset.getInvestmentDate(), "dd-MMM-yy"))%>">	
					<span class="input-group-addon"> <i class="ace-icon fa fa-calendar"></i>
								</span>
							</div>	
						
				</div>
			</div>
			<br> <br>
		</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Stock Name <span class="required">*</span></label>
					<div class="col-lg-4">
						<!-- <input id="second_col_input" name="url" placeholder="Subject" class="form-control" type="text" value=""> -->

						<input value="<%=CommonUtils.emptyIfNull(asset.getAssetName()) %>" name="assetName" id="assetName" type="text" class="form-control">
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Quantity <span class="required">*</span></label>
					<div class="col-lg-4">
						<input value="<%=asset.getTotalUnitsQty()>0?asset.getTotalUnitsQty():"" %>" id="totalUnitsQty" name="totalUnitsQty" type="text" class="form-control">
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Stock Price</label>
					<div class="col-lg-4">
						<input id="stockPrice" type="text" class="form-control" value="<%=asset.getCurrentValue()>0&&asset.getTotalUnitsQty()>0?asset.getCurrentValue()/asset.getTotalUnitsQty() :""%>">
					</div>
				</div>
				<br> <br>
			</div>
			<div class="col-xs-12 ">
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">Current Value</label>
					<div class="col-lg-4">
						<input value="<%=asset.getCurrentValue()>0?asset.getCurrentValue():"" %>" id="currentValue" name="currentValue" type="text" class="form-control">
					</div>
				</div>
				<br> <br>
			</div>
         </fieldset>
			 </form>
			<!-- New Code End -->
           <%-- <div class="add_btn_bx">
                    	<input type="button" id="addSave" class="submit_btn" value="SAVE &amp; ADD">
                    	<input type="button" class="submit_btn" value="SAVE">
                        <a href="${pageContext.request.contextPath}/portfolio/myAssets" ><input type="button" class="cancel_btn" value="CANCEL"></a>
                      
      		</div> --%>
         
          <!-- Buttons -->
          
          	<div class="col-xs-12" align="center">
			

					<input type="button" class="btn-primary btn-xs btn" value="Save" onClick="saveStock();"></input>
					<input type="button" id="addSave" value="Save &amp; Add" onClick="saveStock();" class="btn-primary btn-xs btn">
			
			<a class="btn-primary btn-xs btn" href="/FIINFRA-Client-WEB/portfolio/myAssets">Cancel</a>
			
			
		</div>
          
          <!-- End Buttons -->   
        

      
    <!-- end of "contents" id -->
  

<!-- End of "wrapper" id -->
