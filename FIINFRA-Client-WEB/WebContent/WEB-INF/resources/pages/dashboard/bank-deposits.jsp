<%@page import="in.fiinfra.cp.AssetData"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<% AssetData asset=(AssetData) request.getAttribute("assetData"); %>
<script>
$(document).ready(function(){
    
    $('#asset-fd-form').validate({
    	errorElement:'div',
    	errorClass:"errors", 
   	
	    
        rules: {
        	investmentDate: { 
            required: true
        	},
        	maturityDate: { 
                required: true,
           	},
        	investmentValue:{ 
            required: true,
         	digits: true,
         	min:1000,
         	maxlength:18
          },
	        maturityAmount:{ 
	            required: true,
	         	digits: true,
	         	min:function() {
				     return $('#investmentValueFD').val() ;
				   },
	         	maxlength:18
	         
	        },
	        
        	bankName:{ 
            required: true,
            bankName:true,
            maxlength:100
        	},
        	
           	accountPolicyNo:{ 
           		required: true,
                alphanumeric:true,
                maxlength:20
                	}
        },
        messages: {
        	accountPolicyNo:{alphanumeric:"Enter Valid Data"},
        	investmentValue:{min:'Minimum amount for FD is 1000',digits:'Enter valid data'},
        	maturityAmount:{min:"Value should be more than Amount deposited"}
        }   
       
    });
	 // Calls the selectBoxIt method on your HTML select box
    });
    
</script>
<script>
$(document).ready(function(){
    
    $('#asset-rd-form').validate({
    	errorElement:'div',
    	errorClass:"errors", 
    	
        rules: {
        	investmentDate: { 
            required: true
        	},
        	maturityDate: { 
                required: true               
            	},
            sipAmount:{ 
            required: true,
         	digits: true,
         	min:100,
         	maxlength:18
          },
        	bankName:{ 
            bankName:true,
            required: true
        	},
            	interestRate:{ 
           		required: true,
                digits:true,
                max : 100
                	}
        },
        messages: {
        	sipAmount:{min:'Enter valid data',
        	digits:'Enter valid data',
        	maxlength:'Enter valid data'}
        }   
       
    });
	 // Calls the selectBoxIt method on your HTML select box
    });
    
</script>
<script>
$(document).ready(function(){
    
    $('#asset-saving-form').validate({
    	errorElement:'div',
    	errorClass:"errors", 
    	 
        rules: {
        	bankName:{ 
            required: true
          },
          currentValue:{ 
	            required: true,
	         	digits: true,
	         	min:1,
	         	maxlength:18
	         
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
	    /* $("select").selectBoxIt(); */
	    
	   /*  $("select#ownerPartyId").bind({
			"change": function(){
				if($("#ownerPartyId").val() != ""){
					alert($('#ownerPartyId').val());
					populateAccount("${pageContext.request.contextPath}/common/accounts.json?partyId="+ $("#ownerPartyId").val() , '{}', "#accountId", true);	
				}
			}
		}); */
		
		$("select#ownerPartyId1").bind({
			"change": function(){
				if($("#ownerPartyId1").val() != ""){
					
					jsonPopulateKeyValue("${pageContext.request.contextPath}/common/accounts.json?partyId=" + $("#ownerPartyId1").val(), '{}', "#accountId", true);	
				}
			}
		});
	    
	    $(function() {
	        $( ".datepicker" ).datepicker({
	   	  dateFormat: "dd-M-yy",
	         showOn: "button",
	         autoclose : true,
	   	yearRange: "-100:+0",
	   	  changeMonth: true,
	         changeYear: true,
	        /*  maxDate:'0' */
	         endDate: "dateToday"
	        });
	        $("#commencementDate").datepicker({
				changeMonth : true,
				changeYear : true,
				autoclose : true,
				dateFormat : 'dd-M-yy',
				minDate : '0'
			});
	   	//  $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
	    $( ".ui-datepicker-trigger" ).wrap( "<div class=''></div>" );
		 });
	    $(function() {
	        $( ".datepicker1" ).datepicker({
	   	  dateFormat: "dd-M-yy",	
	   	autoclose : true,
	         showOn: "button",
	   	  changeMonth: true,
	         changeYear: true,
	         startDate: "dateToday"
	        
	        }); 
	        $("#maturityDate").datepicker({
				changeMonth : true,
				changeYear : true,
				autoclose : true,
				dateFormat : 'dd-M-yy',
				maxDate : '0'
			});
	   	  $( ".ui-datepicker-trigger" ).wrap( "<div class='datepicker-trigger-parent'></div>" );
	     });
	    
	    $( ".datepicker" ).attr( 'readOnly' , 'true' );
	    $( ".datepicker1" ).attr( 'readOnly' , 'true' );
	
	
  $(".selectboxit-container ").click(function(){
	});
 $("#fd").click(function(){
	if(!($(".fd_box").is(":visible")))
   {
   $.when($(".dynamic_box").hide("blind")).done(function() {
       $(".fd_box").fadeIn("slow");
	   });
   }
});
$("body").on("click", ".submit_btn_1", function() {
		if($('#asset-fd-form').valid()){
		$('#asset-fd-form').submit();
	   	}
});
	
$("body").on("click", ".submit_btn_2", function() {	  
		 
		  if($('#asset-rd-form').valid()){
		  $('#asset-rd-form').submit();
		  }
});
	
$("body").on("click", ".submit_btn_3", function() {	 
		  if($('#asset-saving-form').valid()){
		  $('#asset-saving-form').submit();	  
	  }
    }); 

$("body").on("click", "#addSave_1", function() {
	 		if($('#asset-fd-form').valid()){
	 			var form=$('#asset-fd-form');
	    		form.append('<input name="action" type="hidden" value="add"/>');
	    		form.submit();
	 	   	}
 }); 
 $("body").on("click", "#addSave_2", function() {	  
	 		  if($('#asset-rd-form').valid()){
	 			 var form=$('#asset-rd-form');
	     		form.append('<input name="action" type="hidden" value="add"/>');
	     		form.submit();
	 		  $('#asset-rd-form').submit();
	 		  }
 }); 

 $("body").on("click", "#addSave_3", function() {	 
	 		  if($('#asset-saving-form').valid()){
	 			 var form=$('#asset-saving-form');
	     		form.append('<input name="action" type="hidden" value="add"/>');
	     		form.submit();
	 		  $('#asset-saving-form').submit();	  
	 	  }
	    });
 
 $("#rd").click(function(){
    if(!($(".rd_box").is(":visible")))
   {
   $.when($(".dynamic_box").hide("blind")).done(function() {
       $(".rd_box").fadeIn("slow");
	   });
   }
}); 
 $("#savings").click(function(){
	if(!($(".savings_box").is(":visible")))
   {
   $.when($(".dynamic_box").hide("blind")).done(function() {
       $(".savings_box").fadeIn("slow");
	   });
   }
}); 

var key="${key}";
	if(key>0){
	if(key==48011){
		$('#fd').click();
		$(".add_rd_btn").hide();
		$(".add_savings_btn").hide();
		//$("#ownerPartyId").attr("disabled",true);
	}
	else if(key==48053){
		$('#rd').click();
		$(".add_fd_btn").hide();
		//$("#ownerPartyId").attr("disabled",true);
		$(".add_savings_btn").hide();
	}
	else if(key==48052){
		$('#savings').click();
		$(".add_fd_btn").hide();
		$(".add_rd_btn").hide();
		//$("#ownerPartyId1").attr("disabled",true);
		$("#accountId").attr("disabled",true);
		//jQuery('.readonly option:not(:selected)').attr('disabled',true);
		//$("#ownerPartyId").prop("readonly",true);
		//$("#accountId").prop("readonly",true);
		$("#ownerPartyId1").hide();
		$("#accountId").hide();
		
	}
	$( "#rd").unbind( "click" );
	$( "#fd").unbind( "click" );
	$( "#savings").unbind( "click" );
	
	}

}); 
</script>
<script>

function populateAccount(url, data, dropdown, fieldName, selectedValue, allowNull) {
	
	$.ajax({
			type : "GET",
			url : url,
			data : data,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
          	   var parent = $(dropdown).parent();
        	   var selectId = $(dropdown).prop("id");
        	   var selectName = $(dropdown).prop("name");
        	   parent.empty();
        	   
        	    
        	    var options = '<select id="'+selectId+'" name="'+selectName+'">';
        	    if(allowNull){
        	    	options += '<option value="' + "-1" + '">' +"-- Select --"+ '</option>';
        	    }

				$.each(msg, function(index, item) {		
            	    options += '<option value="' + item.partyFinancialAccountID + '">'
					+ item.accountName
					+ '</option>';
				});
                    options += '</select>';
                    parent.html(options);
                   /*  $("select").selectBoxIt(); */
				var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			    selectBox.selectOption(selectedValue);
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
}
</script>

  <!-- end of "header" id -->
  <!-- end of "nav-menu" id -->
  <!-- <legend>MY ASSETS : BANK DEPOSITS</legend> -->
 <%--  <div id="header-strip" class="fl">
    <h3 class="clearfix fl">MY ASSETS : <span class="title_it">BANK DEPOSITS</span></h3>
    <jsp:include page="../menu.jsp"></jsp:include>
    <!--<a href="#" class="my-asset-btn clearfix fr"><img src="../images/transparent.png" />My Assets</a>--> <a href="${pageContext.request.contextPath}/portfolio/myLoan" class="my-loan-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Loans</a> 
    </div> --%>
  <!-- end of "header-strip" id -->
  <!-- <div id="inner-shadow-strip"></div> -->
  <!-- end of "inner-shadow-strip" id -->
  <%-- <div id="contents">
    <section class="in_content clearfix" id="add_assets_bank_deposit">
      <div class="tab_border">
      <div class="clearfix">
        <div class="add_fd_btn fl">
          <input name="assetClassId" type="radio" value="48010" id="fd" checked>
          <label for="fd">Fixed Deposits</label> </div>
           
        <div class="add_rd_btn fl">  <input name="assetClassId" type="radio" value="48010" id="rd">
           <label for="rd"> Recurring Deposits</label> </div>
         
          <div class="add_savings_btn fl"><input name="assetClassId" type="radio" value="48052" id="savings">
          <label for="savings">My Savings</label>
          </div>
          
          </div>
          
           <div class="add_bank_depo_bx">
         <div class="fd_box dynamic_box"> 
            
            <!--title starts-->
            <div class="add_fd_title_bx">
              <ul>
                <li class="input_title_one fl">Owner</li>
                <li class="input_title_two fl">Bank Name</li>
                <li class="input_title_three fl">FD Receipt No.</li>
                <li class="input_title_four fl">Commencement Date</li>
                <div class="clr"></div>
              </ul>
            </div>
            
            <!--title ends--> 
            <!--txt starts-->
            <form id="asset-fd-form"  action="${pageContext.request.contextPath}/portfolio/myAsset/save" method="POST" >
            <div class="add_fd_li_bx first_row">
              
              <ul>
              <input name="partyAssetId" type="hidden" value="<%=asset.getPartyAssetId()!=null?asset.getPartyAssetId():0%>">
           <input name="assetTypeId" type="hidden" value="48011"/>
                <li class="input_txt_one fl">
                 <%List<KeyValue> familyMembers=(List<KeyValue>) request.getAttribute("familyMembers"); %>
                 <%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               <input name="ownerPartyId" type="hidden" value="<%=asset.getOwnerPartyId()%>"/>
               <%} %>
                  <select id="ownerPartyId" name="ownerPartyId" class="required">
                  <%  
                  for (KeyValue idv:familyMembers){
                  %>
                  
                  <option value='<%=idv.getId()%>' <%=idv.getId().equals(asset.getOwnerPartyId())? " selected":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
                  <%}%>
                  </select>
                </li>
                <li class="input_txt_two fl">
                  <input type="text" class="grt_bx" name="bankName" value="<%=CommonUtils.emptyIfNull(asset.getBankName())%>">
                </li>
                <li class="input_txt_three fl">
                  <input type="text" name="accountPolicyNo" class="grt_bx" value="<%=CommonUtils.emptyIfNull(asset.getAccountPolicyNo())%>">
                </li>
                <li class="input_txt_four fl">
                  <input type="text" class="grt_bx datepicker" name="investmentDate" value="<%=CommonUtils.emptyIfNull( CommonUtils.format(asset.getInvestmentDate(), "dd-MMM-yy")) %>">
                </li>
              </ul>
              <!-- txt ends--> 
            </div>
            
            <div class="add_fd_title_bx">
              <ul>
                <li class="input_title_five fl">Maturity Date</li>
                <li class="input_title_six fl">Amount Deposited</li>
                <li class="input_title_seven fl">Description</li>
                <li class="input_title_eight fl">Maturity Value</li>
                <div class="clr"></div>
              </ul>
            </div>
            
            <div class="add_fd_li_bx first_row">
              <ul>
                <li class="input_txt_five fl">
                  <input type="text" class="grt_bx datepicker1" name="maturityDate" value="<%=CommonUtils.emptyIfNull(CommonUtils.format(asset.getMaturityDate(), "dd-MMM-yy")) %>">
                </li>
                <li class="input_txt_six fl">
                  <input id='investmentValueFD' type="text" class="grt_bx" name="investmentValue" value="<%=asset.getInvestmentValue()>0?asset.getInvestmentValue():""%>">
                </li>
                <li class="input_txt_seven fl">
                  <input type="text" class="grt_bx" name="description" value="<%=CommonUtils.emptyIfNull(asset.getDescription())%>">
                </li>
                <li class="input_txt_eight fl">
                  <input type="text" class="grt_bx" name="maturityAmount" value="<%=asset.getMaturityAmount()>0?asset.getMaturityAmount():"" %>">
                </li>
              </ul>
              <!-- txt ends--> 
            </div>
            </form>
          </div>
          
          <!--Fixed Deposit Ends--> 
          
          <!--Recurring Deposit Starts-->
                <div class="rd_box hide dynamic_box"> 
            
            <!--title starts-->
            <div class="add_rd_title_bx">
              <ul>
                <li class="input_title_one fl">Owner</li>
                <li class="input_title_two fl">Commencement Date</li>
                <li class="input_title_three fl">Maturity Date</li>
                <li class="input_title_four fl">Monthly Deposited</li>
                <div class="clr"></div>
              </ul>
            </div>
            <!--title ends--> 
            <!--txt starts-->
            <form id="asset-rd-form"  action="${pageContext.request.contextPath}/portfolio/myAsset/save" method="POST" >
          <div class="add_rd_li_bx first_row">
              
              <ul>
               <input name="partyAssetId" type="hidden" value="<%=asset.getPartyAssetId()!=null?asset.getPartyAssetId():0%>"/>
               <input name="assetTypeId" type="hidden" value="48053"/>
                <li class="input_txt_one fl">
                <%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               <input name="ownerPartyId" type="hidden" value="<%=asset.getOwnerPartyId()%>"/>
               <%} %>
                  <select id="ownerPartyId" name="ownerPartyId" class="required">
                  <%  
                  for (KeyValue idv:familyMembers){
                  %>
                  
                  <option value='<%=idv.getId()%>' <%=idv.getId().equals(asset.getOwnerPartyId())? " selected":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
                  <%}%>
                  </select>
                </li>
                <li class="input_txt_two fl">
                  <input type="text" class="grt_bx datepicker" name="investmentDate" value="<%=CommonUtils.emptyIfNull(CommonUtils.format(asset.getInvestmentDate(), "dd-MMM-yy"))  %>">
                </li>
                <li class="input_txt_three fl">
                  <input type="text" class="grt_bx datepicker1" name="maturityDate" value="<%=CommonUtils.emptyIfNull(CommonUtils.format(asset.getMaturityDate(), "dd-MMM-yy"))  %> ">
                </li>
                <li class="input_txt_four fl">
                  <input type="text" class="grt_bx" name="sipAmount" value="<%=asset.getSipAmount()>0?asset.getSipAmount():""%>">
                </li>
              </ul>
              <!-- txt ends--> 
            </div>
            
            <div class="add_rd_title_bx">
              <ul>
                <li class="input_title_five fl">Bank Name</li>
                <li class="input_title_six fl">Description</li>
                <li class="input_title_seven fl">Interest Rate %</li>
                <div class="clr"></div>
              </ul>
            </div>
            <!--title ends--> 
            <!--txt starts-->
            <div class="add_rd_li_bx first_row">
              <ul>
               
                <li class="input_txt_five fl">
                  <input type="text" class="grt_bx" name="bankName" value="<%=CommonUtils.emptyIfNull(asset.getBankName())%>">
                </li>
                <li class="input_txt_six fl">
                  <textarea name="" cols="" rows="" class="grt_bx" name="description" value="<%=CommonUtils.emptyIfNull(asset.getDescription())%>"></textarea>
                </li>
                <li class="input_txt_seven fl">
                  <input type="text" class="grt_bx" name="interestRate" value="<%= asset.getInterestRate()>0?asset.getInterestRate():""%>">
                </li>
              </ul>
              <!-- txt ends--> 
            </div>
            </form>
          </div>
          <!--Recurring Deposit Ends--> 
          
          <!--Savings Starts-->
          <div class="savings_box hide dynamic_box"> 
            
            <!--title starts-->
            <div class="add_saving_title_bx">
              <ul>
                <li class="input_title_one fl">Owner</li>
                <li class="input_title_three fl">Bank Name</li>
              <li><a href="${pageContext.request.contextPath}/portfolio/myFinancialAccount/add"><span class="add_financial_account fr"></span><span class="add_fin fr">Add Financial Account</span></a></li> 
                <li class="input_title_two fl">Current Balance</li>
                 
                <div class="clr"></div>
              </ul>
              
            </div>
            <!--title ends--> 
            <!--txt starts-->
            <div class="add_saving_li_bx first_row">
              <form id="asset-saving-form"  action="${pageContext.request.contextPath}/portfolio/myAsset/save" method="POST" >
              <ul>
              <input name="partyAssetId" type="hidden" value="<%=asset.getPartyAssetId()!=null?asset.getPartyAssetId():0%>">
               <input name="assetTypeId" type="hidden" value="48052"/>
                <li class="input_txt_one fl">
                 
               <%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               <input name="ownerPartyId" type="hidden" value="<%=asset.getOwnerPartyId()%>"/>
               <%} %>
 			<select id="ownerPartyId1" name="ownerPartyId" class="required">
                  <%  List<KeyValue> accounts=(List<KeyValue>) request.getAttribute("accounts"); 
                  for (KeyValue idv:familyMembers){
                  %>
                  
                  <option value='<%=idv.getId()%>' <%=idv.getId().equals(asset.getOwnerPartyId())? " selected":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%></option>
                  <%}%>
                  </select>                </li>
                  
                   <li class="input_txt_three fl">
                 <%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               <input name="accountId" type="hidden" value="<%=asset.getAccountId()%>"/>
               <%} %>
 				<select id="accountId" name="accountId" class="required <%=asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0?"readonly":"" %>" value="<%=asset.getAccountId()!=null?asset.getAccountId():0 %>">
                  <%  
                  for (KeyValue idv:accounts){
                  %>
                  
                  <option value='<%=idv.getId()%>' <%=idv.getId().equals(asset.getAccountId())? " selected":"" %>><%=CommonUtils.emptyIfNull(idv.getName())%> </option>
                  <%}%>
                  </select>  </li>
                
                <li class="input_txt_three fl">
                  <input type="text" class="grt_bx"  name="bankName" value="<%=CommonUtils.emptyIfNull(asset.getBankName())%>">
                </li>
                <li class="input_txt_two fl">
                  <input type="text" class="grt_bx numbersOnly" value="<%=asset.getCurrentValue()>0?asset.getCurrentValue():""%>" name="currentValue">
                </li>
              </ul>
              </form>
              <!-- txt ends--> 
            </div>
          </div>
          <!--Savings Ends-->
           </div>
           
        <div class="add_btn_bx">
          <form>
            <input type="button" id="addSave" class="submit_btn" value="SAVE &amp; ADD" >
            <input type="button" class="submit_btn" value="SAVE">
            <a href="${pageContext.request.contextPath}/portfolio/myAssets" ><input type="button" class="cancel_btn" value="CANCEL"></a>
          </form>
        </div>
      </div>
      
      <!-- end of "contents" id -->
    </section>
  </div> --%>
  


<!-- End of "wrapper" id -->

		<!-- New Code -->
<%List<KeyValue> familyMembers=(List<KeyValue>) request.getAttribute("familyMembers"); %>		
<div style="padding: 10px 10px 0;">
	<div class="tabbable">
		<ul class="nav nav-tabs" id="myTab4">
			<li class="active"><a data-toggle="tab" href="#tabs-1">
					Fixed Deposits</a></li>

			<li><a data-toggle="tab" href="#tabs-2">Recurring Deposits</a></li>
			<li><a data-toggle="tab" href="#tabs-3">My Savings</a></li>
		</ul>


		<div class="tab-content">
			<div id="tabs-1" class="tab-pane in active">
				<form id="asset-fd-form"  action="${pageContext.request.contextPath}/portfolio/myAsset/save" method="POST" >
					
					<input name="partyAssetId" type="hidden" value="<%=asset.getPartyAssetId()!=null?asset.getPartyAssetId():0%>">
           <input name="assetTypeId" type="hidden" value="48011"/>
					<fieldset>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Owner</label>
								<div class="col-lg-4">
									<!-- <input id="second_col_input" name="url" placeholder="Heading"
								class="form-control" type="text" value=""> -->
									<%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               <%} %>
									<select id="ownerPartyId" name="ownerPartyId" class="form-control">
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
							<div class="form-group ">
								<label for="textArea" class="col-lg-2 control-label">Bank Name <span class="required">*</span></label>
								<div class="col-lg-4">
									<!-- <input id="second_col_input" name="url" placeholder="Subject" class="form-control" type="text" value=""> -->
										<input type="text" class="form-control" name="bankName" value="<%=CommonUtils.emptyIfNull(asset.getBankName())%>">
								</div>
								
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">FD Receipt No. <span class="required">*</span></label>
								<div class="col-lg-4">
									<input type="text" name="accountPolicyNo" class="form-control" value="<%=CommonUtils.emptyIfNull(asset.getAccountPolicyNo())%>">
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Commencement Date</label>
								<div class="col-lg-4">
									<div class="input-group">
									<input type="text" class="form-control datepicker" id="commencementDate"  placeholder="dd-mmm-yyyy" value="<%=CommonUtils.emptyIfNull( CommonUtils.format(asset.getInvestmentDate(), "dd-MMM-yy")) %>" data-date-format="dd/mm/yyyy">
									<span class="input-group-addon"> <i class="ace-icon fa fa-calendar"></i>
								</span>
							</div>
													
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Maturity Date</label>
								<div class="col-lg-4">
									<div class="input-group">
									<input type="text" class="form-control datepicker" placeholder="dd-mmm-yyyy" id="maturityDate" name="maturityDate"  value="<%=CommonUtils.emptyIfNull(CommonUtils.format(asset.getMaturityDate(), "dd-MMM-yy")) %>">
										<span class="input-group-addon"> <i class="ace-icon fa fa-calendar"></i>
								</span>
							</div>
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Amount Deposited <span class="required">*</span></label>
								<div class="col-lg-4">
									<input id='investmentValueFD' type="text" class="form-control" name="investmentValue" value="<%=asset.getInvestmentValue()>0?asset.getInvestmentValue():""%>">
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Description</label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="description" value="<%=CommonUtils.emptyIfNull(asset.getDescription())%>">
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Maturity Value <span class="required">*</span></label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="maturityAmount" value="<%=asset.getMaturityAmount()>0?asset.getMaturityAmount():"" %>">
								</div>
							</div>
							<br> <br>
						</div>
					</fieldset>
				</form>
				<div class="col-xs-12">
					<div class="col-lg-2"></div>
					<div class="col-lg-4">
						<div class="fr">
						<input type="button" id="addSave_1"
							class="btn-primary btn-xs btn" value="Save"></input>
						<input type="button" id="addSave_1"
							value="Save &amp; Add" class="btn-primary btn-xs btn">
						
						<a class="btn-primary btn-xs btn"
							href="/FIINFRA-Client-WEB/portfolio/myAssets">Cancel</a>
							</div>
					</div>
				</div>
				<br><br><br>
			</div>
			<div id="tabs-2" class="tab-pane">
				<form id="asset-rd-form"  action="${pageContext.request.contextPath}/portfolio/myAsset/save" method="POST" >
					
					<input name="partyAssetId" type="hidden" value="<%=asset.getPartyAssetId()!=null?asset.getPartyAssetId():0%>"/>
               <input name="assetTypeId" type="hidden" value="48053"/>
					<fieldset>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Owner</label>
								<div class="col-lg-4">
									<!-- <input id="second_col_input" name="url" placeholder="Heading"
								class="form-control" type="text" value=""> -->
									<%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               <%} %>
									<select id="ownerPartyId" name="ownerPartyId" class="form-control">
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
								<label for="textArea" class="col-lg-2 control-label">Commencement Date</label>
								<div class="col-lg-4">
								<div class="input-group">
									<!-- <input id="second_col_input" name="url" placeholder="Subject" class="form-control" type="text" value=""> -->
										<input type="text" class="form-control datepicker" name="investmentDate" placeholder="dd-mmm-yyyy" value="<%=CommonUtils.emptyIfNull(CommonUtils.format(asset.getInvestmentDate(), "dd-MMM-yy"))  %>">
									<span class="input-group-addon"> <i class="ace-icon fa fa-calendar"></i>
								</span>
							</div>
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Maturity Date</label>
								<div class="col-lg-4">
								<div class="input-group">
									<input type="text" class="form-control datepicker" name="maturityDate" placeholder="dd-mmm-yyyy" value="<%=CommonUtils.emptyIfNull(CommonUtils.format(asset.getMaturityDate(), "dd-MMM-yy"))  %> ">
									<span class="input-group-addon"> <i class="ace-icon fa fa-calendar"></i>
								</span>
							</div>
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Monthly Deposited <span class="required">*</span></label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="sipAmount" value="<%=asset.getSipAmount()>0?asset.getSipAmount():""%>">
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Bank Name <span class="required">*</span></label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="bankName" value="<%=CommonUtils.emptyIfNull(asset.getBankName())%>">
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Description</label>
								<div class="col-lg-4">
									<input class="form-control" name="description" value="<%=CommonUtils.emptyIfNull(asset.getDescription())%>">
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Interest Rate % <span class="required">*</span></label>
								<div class="col-lg-4">
									<input type="text" class="form-control" name="interestRate" value="<%= asset.getInterestRate()>0?asset.getInterestRate():""%>">
								</div>
							</div>
							<br> <br>
						</div>
						
					</fieldset>
				</form>
				<div class="col-xs-12">
				<div class="col-lg-2"></div>
				<div class="col-lg-4">
					<div class="fr">	
					<input type="button" id="addSave_2" class="btn-primary btn-xs btn" value="Save"></input>
					<input type="button" id="addSave_2"
							value="Save &amp; Add" class="btn-primary btn-xs btn">
						
						<a class="btn-primary btn-xs btn" href="/FIINFRA-Client-WEB/portfolio/myAssets">Cancel</a>
					</div>
				</div>
				</div>
				<br><br><br>
			</div>
			<div id="tabs-3" class="tab-pane">
			<form id="asset-saving-form"  action="${pageContext.request.contextPath}/portfolio/myAsset/save" method="POST" >
				 <input name="partyAssetId" type="hidden" value="<%=asset.getPartyAssetId()!=null?asset.getPartyAssetId():0%>">
               <input name="assetTypeId" type="hidden" value="48052"/>
				<fieldset>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Owner</label>
								<div class="col-lg-4">
									
									 <%if (asset.getPartyAssetId()!=null&&asset.getPartyAssetId()>0){ %>
               <%} %>
									<select id="ownerPartyId1" name="ownerPartyId" class="form-control">
										 <%  List<KeyValue> accounts=(List<KeyValue>) request.getAttribute("accounts"); 
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
								<label for="textArea" class="col-lg-2 control-label">Bank Name</label>
								<div class="col-lg-4">
									<%
										if (asset.getPartyAssetId() != null && asset.getPartyAssetId() > 0) {
									%>
									<input name="accountId" type="hidden"
										value="<%=asset.getAccountId()%>" />
									<%
										}
									%>
									<select id="accountId" name="accountId"
										class="form-control <%=asset.getPartyAssetId() != null
					&& asset.getPartyAssetId() > 0 ? "readonly" : ""%>"
										value="<%=asset.getAccountId() != null ? asset.getAccountId() : 0%>">
										<%
											for (KeyValue idv : accounts) {
										%>

										<option value='<%=idv.getId()%>'
											<%=idv.getId().equals(asset.getAccountId()) ? " selected"
						: ""%>><%=CommonUtils.emptyIfNull(idv.getName())%>
										</option>
										<%
											}
										%>
									</select>
									
								</div>
								<div class="col-lg-3">
									<a href="${pageContext.request.contextPath}/portfolio/myFinancialAccount/add" class="badge badge-success"><i class="ace-icon fa fa-plus"></i></a>(Add Financial Account)
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Current Balance <span class="required">*</span></label>
								<div class="col-lg-4">
									<input type="text" class="form-control numbersOnly" value="<%=asset.getCurrentValue()>0?asset.getCurrentValue():""%>" name="currentValue">
								</div>
							</div>
							<br> <br>
						</div>
					</fieldset>
				</form>
				<div class="col-xs-12" align="center">
				<div class="col-lg-2"></div>
				<div class="col-lg-4">
				<div class="fr">
				<input type="button" id="addSave_3"
							class="btn-primary btn-xs btn" value="Save"></input>
					<input type="button" id="addSave_3"
							value="Save &amp; Add" class="btn-primary btn-xs btn">
						
						<a class="btn-primary btn-xs btn"
							href="/FIINFRA-Client-WEB/portfolio/myAssets">Cancel</a>
					</div>		
				</div>			
				</div>
				<br><br><br>
			</div>
</div>			
		
		<!-- New Code End -->

