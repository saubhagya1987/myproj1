<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	        $.getJSON("${pageContext.request.contextPath}/common/product.json?type=Bank&searchStr=" + request.term, function (data) {
	        	
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
	  });
});
	selectedScript = $("#assetName").val();
	</script>
	<%-- 
<div id="contents">
<section class="in_content clearfix" id="personalization">
<div class="add_epf_btn fl">
<form:form
			action="${pageContext.request.contextPath}/portfolio/myFinancialAccount/save"
			commandName="party" method="POST" id = "profile-form">
 <label>Account Name</label><input name="accountName" />
 
 <label>Bank Name</label><input name="bankName" /><br/><br/><br/>
 <label>Account Number</label><input name="accountNumber" />
 <label>IFSC No</label><input name="IFSCNo" />
 <div class="btn_bx2">
 <input type="submit" value="Save" class="submit_btn" />
 </div>
 </form:form>
 </div>
 </section>
 </div>
 
 <div id="header-strip" class="fl">
  <jsp:include page="../menu.jsp"></jsp:include>
    <h3 class="clearfix fl">ADD ACCOUNT</h3></div>
   <a href="${pageContext.request.contextPath}/portfolio/myLoan"  class="my-loan-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png"/>My Loans</a> </div>
 <div id="contents">
      <section class="in_content clearfix" id="personalization">
        <div id="password_details_bx">
        <form
			action="${pageContext.request.contextPath}/portfolio/myFinancialAccount/save"
			commandName="party" method="POST" id ="account-form">
          <div id="password_details">
          
            <div class="fl first_col">
            <form name="password-form" id="password-form" action="${pageContext.request.contextPath}/profile/changePassword" method="post">
              <ul class="reset clearfix first_col_ul">
                <li class="clearfix"> <span > </span>
                  <label class="form_label">Account Name</label>
                  <input name="accountName" type="text" class="common_input">
                </li>
                <li class="clearfix"> <span> </span>
                  <label class="form_label">Bank Name</label>
                  <input  name="assetName" id="assetName" type="text" class="common_input" />
                </li>
                <li class="clearfix"> <span > </span>
                  <label class="form_label">Account Number</label>
                  <input name="accountNumber" type="text" class="common_input">
                </li>
                <li class="clearfix"> <span > </span>
                  <label class="form_label">IFSC Code</label>
                  <input name="IFSCNo" type="text" class="common_input">
                </li>
              </ul>
              </form>
            </div>
            <div class="clr"></div>
           
          </div>
          <div class="btn_bx2">
            
            <input type="button" onclick="saveAccount();" class="submit_btn" value="SUBMIT">
             <a href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=48011"> <input type="button"  class="cancel_btn" value="CANCEL"></a>
            
          </div>
          </form>
        </div>
      </section>
    </div>
    <script>
	function saveAccount(){
 		
		if($('#account-form').validate){
		$('#account-form').submit();  
	 }
	 }
  </script>
  <script>
$(document).ready(function(){
    
    $('#account-form').validate({
    	
        rules: {
        	accountName: { 
            required: true,
            accountName:true
        	},
         
        	bankName:{ 
            required: true,
            bankName:true,
            
        	},
        	accountNumber:{ 
           		required: true,
                digits:true,
                maxlength:20
                	}
        },
        messages: {
        	    		
        	accountNumber:{requrired:"Enter some value",maxlength:"Invalid length"}        	
        }   
       
    });
	 // Calls the selectBoxIt method on your HTML select box
    });
    
  </script>  --%>
      <!-- New Code -->
      <form
			action="${pageContext.request.contextPath}/portfolio/myFinancialAccount/save"
			commandName="party" method="POST" id ="account-form">
			 <form name="password-form" id="password-form" action="${pageContext.request.contextPath}/profile/changePassword" method="post">
      		<fieldset>
						
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Account Name <span class="required">*</span></label>
								<div class="col-lg-4">
										 <input name="accountName" type="text" class="form-control">
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Bank Name <span class="required">*</span></label>
								<div class="col-lg-4">
									<input name="bankName" id="assetName" type="text" class="form-control">
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">Account Number <span class="required">*</span></label>
								<div class="col-lg-4">
									<input name="accountNumber" type="text" class="form-control">
								</div>
							</div>
							<br> <br>
						</div>
						<div class="col-xs-12 ">
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">IFSC Code</label>
								<div class="col-lg-4">
									<input name="IFSCNo" type="text" class="form-control">
								</div>
							</div>
							<br> <br>
						</div>
					</fieldset>
					</form>
				</form>
				<div class="col-xs-12">
				<div class="col-lg-2"></div>
				<div class="col-lg-4">
					<div class="fr">
							<input type="button" onclick="saveAccount();" class="btn-primary btn-xs btn" value="Save">
						<a class="btn-primary btn-xs btn"
							href="${pageContext.request.contextPath}/portfolio/asset/addUpdate/?assetClassId=48011">Cancel</a>
					</div>
				</div>
   				</div>   
      <!-- New Code End -->
   
  <script>
$(document).ready(function(){
    
    $('#account-form').validate({
    	
    	errorElement:'div',
    	errorClass:'errors',
    	
        rules: {
        	accountName: { 
            required: true,
            accountName:true
        	},
         
        	bankName:{ 
            required: true,
            bankName:true,
            
        	},
        	accountNumber:{ 
           		required: true,
                digits:true,
                maxlength:20
                	}
        },
        messages: {
        	    		
        	accountNumber:{requrired:"Enter some value",maxlength:"Invalid length"}        	
        }   
       
    });
	 // Calls the selectBoxIt method on your HTML select box
    });
    
  </script>
   <script>
	function saveAccount(){
 		
		if($('#account-form').validate){
		$('#account-form').submit();  
	 }
	 }
  </script>