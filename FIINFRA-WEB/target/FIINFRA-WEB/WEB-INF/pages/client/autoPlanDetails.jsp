<!DOCTYPE html>
<html lang="en">
<head>
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<title>AUTO PLAN REVIEW</title>
<style type="text/css">
#pnl-pp .col-actions .icn.close { left: 4px; border-color: #3A3A3A !important; color: #3A3A3A !important; }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/common_popup.jsp" />
        <div class="container">
          <div class="page-header">
            <h1>AUTO PLAN REVIEW  <span class="size-18">(<b id="clientNameLable"></b>)</span></h1>
             </div>
          <div class="container-body">
          <form method="post" action="" class="form-horizontal" id="autoPlanForm">
            <div class="widget-box" style="margin-top:10px;">
              <div class="widget-header">
                <h5 class="widget-title">Profile</h5>
              </div>
              <div class="widget-body">
                <div class="widget-main clearfix">
                  <div class="row">
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-3 control-label no-padding-right" for="firstname">First Name</label>
                      <div class="col-sm-9">
                        <input type="text" id="firstname" name="firstname" class="input-xxlarge" onkeyup="nospecialCharacters(id,event)" placeholder="First Name"/>
                      </div>
                    </div>
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-3 control-label no-padding-right" for="lastname">Last Name<span class="red">*</span></label>
                      <div class="col-sm-9">
                        <input type="text" id="lastname" name="lastName" validate="1" emsg="Last Name" class="input-xxlarge" onkeyup="nospecialCharacters(id,event)" placeholder="Last Name"/>
                        <div id="lastname_error" class="help-block hide">Please provide last name</div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-3 control-label no-padding-right" for="dob">Date of Birth<span class="red">*</span></label>
                      <div class="col-sm-9">
                        <input name="dob" type="text" name="dob" id="dob" validate="1" emsg="Date Of Birth" class="input-large dob" placeholder="Birth Date"  />
                        <div id="dob_error" class="help-block hide">Please provide date of birth.</div>
                      </div>
                    </div>
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-3 control-label no-padding-right" for="emailId">Email<span class="red">*</span></label>
                      <div class="col-sm-9">
                        <input type="text" class="input-xxlarge" id="emailId" name="emailId" validate="email" emsg="Email" class="form-control" placeholder="Email"/>
                        <div id="emailId_error" class="help-block hide">Please provide a valid email.</div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-3 control-label no-padding-right" for="panNo">PAN No.</label>
                      <div class="col-sm-9">
                        <input type="text" id="panNo" name=panNo validate="pan" class="input-xxlarge" placeholder="PAN Number">
                      </div>
                    </div>
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-3 control-label no-padding-right" for="city">City</label>
                      <div class="col-sm-9">
                        <input type="text" id="city" name=city class="input-xxlarge" placeholder="City">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="space-8"></div>
            <div class="widget-box" style="margin-top:10px;">
              <div class="widget-header">
                <h5 class="widget-title">Assumptions</h5>
              </div>
              <div class="widget-body">
                <div class="widget-main clearfix">
                  <div class="row">
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-6 control-label no-padding-right" for="assumptionValidator">Please Validate Assumptions<span class="red">*</span></label>
                      <div class="col-sm-6">
                        <label class="checkbox">
                          <input name="form-field-checkbox" type="checkbox"  id="assumptionValidator" class="ace">
                          <span class="lbl"></span> </label>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-3 control-label no-padding-right" for="expense">Monthly Expense<span class="red">*</span>:</label>
                      <div class="col-sm-9"><span class="icn rupee-dark"></span>
                        <input type="text" id="expense" name="expense" validate="1" emsg="Monthly Expense" class="input-xxlarge" maxlength="15"  onkeydown="allowIntegersOnly(id,event)">
                        <div id="expense_error" class="help-block hide">Please provide Monthly Expense</div>
                      </div>
                    </div>
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-3 control-label no-padding-right" for="lifeExpectancy">Life Expectancy:</label>
                      <div class="col-sm-9">
                        <input type="text" id="lifeExpectancy" name=lifeExpectancy class="input-xxlarge" maxlength="2"  onkeydown="allowIntegersOnly(id,event)">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-3 control-label no-padding-right" for="riskProfile">Risk Profile<span class="red">*</span>:</label>
                      <div class="col-sm-9">
                        <select name="riskProfile" id="riskProfile" name="riskProfile" class="input-xxlarge" validate="1" emsg="Risk Profile">
                          <option value="">---Select---</option>
                        </select>
                        <div id="riskProfile_error" class="help-block hide">Please provide Monthly Expense</div>
                      </div>
                    </div>
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-3 control-label no-padding-right" for="retirementAge">Retirement Age<span class="red">*</span>:</label>
                      <div class="col-sm-9">
                        <input type="text" id="retirementAge" name=retirementAge class="input-xxlarge" maxlength="2"  onkeydown="allowIntegersOnly(id,event)">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="space-8"></div>
            <!-- </div> -->
            
            <div class="widget-box" style="margin-top:10px;">
              <div class="widget-header">
                <h5 class="widget-title">Goals</h5>
              </div>
              <div class="widget-body">
                <div class="widget-main clearfix">
                  <div class="row">
                    <div class="form-group col-md-6 clearfix">
                      <label class="col-sm-6 control-label no-padding-right" for="goalValidator">Please Validate Goals<span class="red">*</span></label>
                      <div class="col-sm-6">
                        <label class="checkbox">
                          <input name="form-field-checkbox" type="checkbox"  id="goalValidator" class="ace">
                          <span class="lbl"></span> </label>
                      </div>
                    </div>
                  </div>
                  <div class="list-group" id="pnl-goals">
                    <div class="clearfix list-group-item active visible-lg">
                      <div class="row">
                        <div class="col-lg-2">Goal Type</div>
                        <div class="col-lg-2">Name</div>
                        <div class="col-lg-2">Goal for</div>
                        <div class="col-lg-2">Years</div>
                        <div class="col-lg-2">Amount</div>
                        <div class="col-lg-1">Add</div>
                        <div class="col-lg-1">Delete</div>
                        
                        
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="space-8"></div>
            <div class="widget-box" style="margin-top:10px;">
              <div class="widget-header">
                <h5 class="widget-title">Additional Information (Optional)</h5>
              </div>
              <div class="widget-body">
                <div class="widget-main clearfix">
                  <div class="list-group" id="pnl-family">
                    <div class="list-group-item active">Family Members</div>
                    <div class="list-group-item">
                      <div class="row visible-lg" style="font-weight: bold !important;">
                        <div class="col-lg-3">
                          <label style="font-weight: bold !important;">Full Name</label>
                        </div>
                        <div class="col-lg-3 text-center">
                          <label style="font-weight: bold !important;">Age</label>
                        </div>
                        <div class="col-lg-3">
                          <label style="font-weight: bold !important;">Relation</label>
                        </div>
                        
                        <div class="col-lg-1">
                          <label style="font-weight: bold !important;">Add</label>
                        </div>
                        <div class="col-lg-1">
                          <label style="font-weight: bold !important;">Delete</label>
                        </div>
                      </div>
                    </div>
                    <div id="familyMemberDiv"></div>
                  </div>
                  <div class="list-group-item active">Assets</div>
                  <div class="list-group">
                    
                    <div class="clearfix list-group-item">
                      <div class="col-md-6">
                      <div class="clearfix list-group-item active southspace2">
                      <div class="row">
                        <div class="col-lg-5">General Assets</div>
                        
                      </div>
                    </div>
                      <div class="row clearfix southspace2"><div class="col-lg-4">
                        <label>Shares:</label>
                      </div>
                      <div class="col-lg-8"><span class="icn rupee-dark"></span>
                        <input id="94027" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div></div>
                      
                      <div class="row clearfix southspace2">  <div class="col-lg-4">
                        <label>Deposits:</label>
                      </div>
                      <div class="col-lg-8"><span class="icn rupee-dark"></span>
                        <input id="94029" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div></div>
                      
                      <div class="row clearfix southspace2"> <div class="col-lg-4">
                        <label>Golds:</label>
                      </div>
                      <div class="col-lg-8"><span class="icn rupee-dark"></span>
                        <input id="94032" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div></div>
                      
                     <div class="row clearfix southspace2"> <div class="col-lg-4">
                        <label>Property:</label>
                      </div>
                      <div class="col-lg-8"><span class="icn rupee-dark"></span>
                        <input id="94028" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div>
</div>                      
                      <div class="row clearfix southspace2"><div class="col-lg-4">
                        <label>Mutual Funds:</label>
                      </div>
                      <div class="col-lg-8"><span class="icn rupee-dark"></span>
                        <input id="94030" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div></div>
                      
                      <div class="row clearfix southspace2"><div class="col-lg-4">
                        <label>Bonds:</label>
                      </div>
                      <div class="col-lg-8"><span class="icn rupee-dark"></span>
                        <input id="94031" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div></div>
                      
                     <div class="row clearfix southspace2"><div class="col-lg-4">
                        <label>Others:</label>
                      </div>
                      <div class="col-lg-8"><span class="icn rupee-dark"></span>
                        <input id="94033" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div></div>
                    
</div>                      
                      
                     
                      <div class="col-md-6">
                      <div class="clearfix list-group-item active southspace2">
                      <div class="row">
                       
                        <div class="col-lg-5">Retirement Assets</div>
                      </div>
                    </div>
                      <div class="row clearfix southspace2"><div class="col-lg-4">
                        <label>Provident Funds:</label>
                      </div>
                      <div class="col-lg-8"><span class="icn rupee-dark"></span>
                        <input id="94051" type="text"  class="form-control common_input retirementassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div></div>
                      
                      <div class="row clearfix southspace2"><div class="col-lg-4">
                        <label>Pension Plans:</label>
                      </div>
                      <div class="col-lg-8"><span class="icn rupee-dark"></span>
                        <input id="94052" type="text"  class="form-control common_input retirementassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div></div>
                      
                       <div class="row clearfix southspace2"><div class="col-lg-4">
                        <label>National Pension Schemes:</label>
                      </div>
                      <div class="col-lg-8"><span class="icn rupee-dark"></span>
                        <input id="94053" type="text"  class="form-control common_input retirementassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div></div>
                      
                      <div class="row clearfix southspace2"><div class="col-lg-4">
                        <label>Others:</label>
                      </div>
                      <div class="col-lg-8"><span class="icn rupee-dark"></span>
                        <input id="94054" type="text"  class="form-control common_input retirementassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div></div>
                      </div>

                    </div>
                   <!-- 
                    <div class="col-lg-1"></div>
                   <div class="clearfix list-group-item">
                      <div class="col-lg-1"></div>
                      
                    </div>
                    <div class="clearfix list-group-item">
                     
                      <div class="col-lg-1"></div>
                                         </div>
                    <div class="clearfix list-group-item">
                                            <div class="col-lg-1"></div>
                      
                    </div>
                    <div class="clearfix list-group-item">
                                          </div>
                    <div class="clearfix list-group-item">
                      
                    </div>
                    <div class="clearfix list-group-item">
                      
                    </div>
  -->                </div>
                  <div class="list-group-item active">Risk Cover</div>
                  <div class="list-group">
                    <div class="clearfix list-group-item">
                      <div class="col-lg-2">
                        <label>Existing Life Insurance Cover:</label>
                      </div>
                      <div class="col-lg-3"><span class="icn rupee-dark"></span>
                        <input id="94018" type="text"  class="form-control common_input riskcover"  maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div>
                      <div class="col-lg-3">
                        <label>Existing Health Insurance Cover:</label>
                      </div>
                      <div class="col-lg-3"><span class="icn rupee-dark"></span>
                        <input id="94019" type="text"  class="form-control common_input riskcover" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div>
                    </div>
                    <div class="clearfix list-group-item">
                      <div class="col-lg-2">
                        <label>Existing Critical Illness Cover:</label>
                      </div>
                      <div class="col-lg-3"><span class="icn rupee-dark"></span>
                        <input id="94024" type="text"  class="form-control common_input riskcover" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div>
                      <div class="col-lg-3">
                        <label>Existing Accident Cover:</label>
                      </div>
                      <div class="col-lg-3"><span class="icn rupee-dark"></span>
                        <input id="94107" type="text"  class="form-control common_input riskcover" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div>
                    </div>
                  </div>
                  <div class="list-group-item active">General</div>
                  <div class="list-group">
                    <div class="clearfix list-group-item">
                      <div class="col-lg-2">
                        <label>Annual Income:<span class="red">*</span></label>                        
                      </div>
                      <div class="col-lg-3"><span class="icn rupee-dark"></span>
                        <input id="income" type="text" validate="1" emsg="Annual Income"  class="form-control common_input"  maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                        <div id="income_error" class="help-block hide">Please provide Annual Income</div>
                      </div>
                      <div class="col-lg-3">
                        <label>EMI:</label>
                      </div>
                      <div class="col-lg-3"><span class="icn rupee-dark"></span>
                        <input id="emi" type="text"  class="form-control common_input" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                      </div>
                    </div>
                  </div>
                  <div class="list-group-item active">Succession</div>
                  <div class="list-group">
                    <div class="clearfix list-group-item">
                      <div class="col-lg-2">
                        <label>Does Client have a Will?</label>
                      </div>
                      <div class="col-lg-3">
                        <select class="form-control wdmin100per" id="will" name="will">
                          <option value="1">Yes</option>
                          <option value="0">No</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="space-8"></div>
            <div class="topmenu">
              <button class="btn btn-primary btn-xs" type="button" name="btn-save" onclick="saveAutoPlanDetails()">Save</button>
              <a href="${pageContext.request.contextPath}/client/getClientList.htm?autoPlanClient=1">
              <button class="btn btn-primary btn-xs" type="button" name="Cancel">Cancel</button>
              </a>
            <div class="visible-xs northspace1"></div>
              <button class="btn btn-primary btn-xs" type="button" name="btn-report" onclick="generateReport()">Generate Auto Plan</button>
            </div>
            </div>
          </form>
        </div>
      </div>
      <div id="mdl-success" class="modal fade">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
              <h4 class="modal-title">Thank you</h4>
            </div>
            <div class="modal-body">
              <p>Auto plan is generated for Opportunity.</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default">View</button>
              <button type="button" class="btn btn-primary">Contact</button>
            </div>
          </div>
        </div>
      </div>
      <!-- Center part End --> 
      <script>
        var goalTypeSelect='<select id="goalTypeSelect" class="form-control"><option value="0">--Select--</option>';
    	var relationshipSelect='<select class="form-control"><option value="0">--Select--</option>';
    	var familyMemberSelect='';
        $(function() {
        	
        	$('#clientNameLable').html($('#clientNameLabel').val());
        	try{
                $('#mdl-success').modal({show: false});
                $('input[name="btn-save"]').on('click', function(e) {
                    e.preventDefault();
                    $('#mdl-success').modal('show');
                });
				}catch(e){
					
				}
                
                function setrow() {
                    $('#pnl-goals .icn.add').hide();
                    $('#pnl-goals .list-group-item:last .icn.add').show();
                    $('#pnl-goals .icn.add').on('click', function(e) {
                        e.preventDefault();
                        e.stopImmediatePropagation();
                        var dr1 = $(this).closest('.list-group-item');
                        var dr2 = $(dr1).clone();
                        $(dr2).find('input,select').val("").show();
                        //$(dr2).find('.selectboxit-container').remove();
                        $(dr1).after($(dr2));
                        $(this).hide();
                        //$("select").selectBoxIt();
                        setrow();
                    });
                    
                    $('#pnl-goals .icn.close').on('click', function(e) {
                        e.preventDefault();
                        e.stopImmediatePropagation();
                        if($('#pnl-goals .list-group-item').not('.active').length == 1) {
                            alert('You cannot delete all rows.');
                            return false;
                        }
                        $(this).closest('.list-group-item').remove();
                        $('#pnl-goals .icn.add').hide();
                        $('#pnl-goals .list-group-item:last .icn.add').show();
                    });
                }
                setrow();
                
                function setrowfamily() {
                    $('#pnl-family .icn.add').hide();
                    $('#pnl-family .list-group-item:last .icn.add').show();
                    $('#pnl-family .icn.add').on('click', function(e) {
                        e.preventDefault();
                        e.stopImmediatePropagation();
                        //$(".age.spinner").spinner( "destroy" );
                        var dr1 = $(this).closest('.list-group-item');
                        var dr2 = $(dr1).clone();
                        $(dr2).find('input,select').val("").show();
                        //$(dr2).find('.selectboxit-container').remove();
                        
                        $(dr1).after($(dr2));
                        $(this).hide();
                        //$("select").selectBoxIt();
                        //$(".age.spinner").spinner({min: 50, max: 75}).spinner("enable");
                        setrowfamily();
                    });
                    
                    $('#pnl-family .icn.close').on('click', function(e) {
                        e.preventDefault();
                        e.stopImmediatePropagation();
                        if($('#pnl-family .list-group-item').not('.active').length == 2) {
                            alert('You cannot delete all rows.');
                            return false;
                        }
                        $(this).closest('.list-group-item').remove();
                        $('#pnl-family .icn.add').hide();
                        $('#pnl-family .list-group-item:last .icn.add').show();
                    });
                }
                setrowfamily();
                
        	
                try{
					$('.dob').datepicker({
						changeMonth : true,
						changeYear : true,
						maxDate : '0',
						yearRange : "1900:2200",
						dateFormat : "dd/mm/yy"

					});
					}catch(e){
						try{
						$jq_1_9_1('.dob').datepicker({
							changeMonth : true,
							changeYear : true,
							maxDate : '0',
							yearRange : "1900:2200",
							dateFormat : "dd/mm/yy"

						});
						}catch(e){
							$jq_1_9_2('.dob').datepicker({
								changeMonth : true,
								changeYear : true,
								maxDate : '0',
								yearRange : "1900:2200",
								dateFormat : "dd/mm/yy"

							});
						}
					}
        	
        	$.ajax({
        		type : "POST",
        		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=40,35,26',
        		success : function(result) {
        			$('#riskProfile').empty();
        			
        			$(result).each(function(i,obj) {
        				var codeTypeId=obj.codeTypeId;
        				var codeValue=obj.codeValue;
        				var codevalueId=obj.codeValueId;		
        				
        				if(codeTypeId==40){
        				$('#riskProfile').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
        				}else if(codeTypeId==35){
        					goalTypeSelect+='<option value="'+codevalueId+'">'+codeValue+'</option>';
        				}else if(codeTypeId==26){
        					relationshipSelect+='<option value="'+codevalueId+'">'+codeValue+'</option>';
        				}
        				
        			});
        			goalTypeSelect+='</select>';
    				relationshipSelect+='</select>';
        			$.ajax({
        				type : "POST",
        				url : $('#contextPath').val()
        						+ '/partner/getFamilyMemberList.htm?partyId='+$('#clientPartyId').val(),
        						success : function(result) {
        							familyMemberSelect='<select  id="familyMemberSelect" class="form-control"><option value="0">--Select--</option>';
        							$(result).each(function(i,obj) {
        								familyMemberSelect+='<option value="'+obj.partyId+'">'+obj.name+'</option>';
        							});
        							familyMemberSelect+="</select>";
        						
        			
        				$.ajax({
        	        		type : "POST",
        	        		url : $('#contextPath').val()+'/partner/getClientAutoPlanDetails.htm?partyId='+$('#clientPartyId').val(),
        	        		success : function(result) {
        	        			$("#firstname").val(result.firstname);
        	        			$("#lastname").val(result.lastname);
        	        			$("#dob").val(result.dob);
        	        			$("#emailId").val(result.emailId);
        	        				$("#familyMember").val(result.emailId);
        	        				if(!isNaN(parseFloat(result.income).toFixed(0)))
        	        			$("#income").val(parseFloat(result.income).toFixed(0));
        	        			$("#expense").val(parseFloat(result.expense).toFixed(0));
        	        			$("#retirementAge").val(result.retirementAge);
        	        			$("#emergencyMonths").val(result.emergencyMonths);
        	        			$("#riskProfile").val(result.riskProfileId);
        	        			$('#city').val(result.city);
        	        			$('#emi').val(result.emi);
        	        			$('#lifeExpectancy').val(result.lifeExpectancy);
        	        			$('#panNo').val(result.panNo);
        	        			$('#will').val(result.will);
        	        			if($('#clientStage').val()=='Reviewed'){
        	        				$('#assumptionValidator').attr('checked','true');
        	        				$('#goalValidator').attr('checked','true');
        	        			}
        	        			var familyMemberDatas = result.familyMemberDatas;
        	        			$("#familyMemberDiv").empty();
        	        			var isAnyfamilyMember = 0;
        	        			var lastFamilyMemberPartyId = 0;
        	        			$(familyMemberDatas).each(function(i,obj) {
									var age=obj.age;
									var relationshipId=obj.relationshipId;
									var partyId = obj.partyId;
									var name = obj.lastName;
									$("#familyMemberDiv").append('<div class="list-group-item"><div class="clearfix row" id="'+partyId+'">' +
									'<div class="hidden-lg"><label class="strong westspace2">Full Name</label></div><div class="col-lg-3"><input type="text"  id="lNmae" class="form-control common_input" value="'+name+'"/><input type="hidden" id="familyPartyId" value="'+partyId+'"></div>'+
                                    '<div class="hidden-lg"><label class="strong westspace2">Age</label></div><<div class="col-lg-3"><input type="text" id="age" maxlength="2" onkeydown="allowIntegersOnly(id,event)" class="age spinner1 form-control" value="'+age+'"/></div>'+
                                     '<div class="col-lg-3">'+relationshipSelect+'</div><div class="col-lg-2 col-actions familyactions" id="actionbuttons'+partyId+'"><div class="icn close" onclick="removeFamilyMember(this)"><span class="hidden-lg">Delete</span> <span class="fa fa-close"></span></div>'+
 	        						'<span class="common_input3_1"></span></div></div></div>');
									isAnyfamilyMember +=1;
									lastFamilyMemberPartyId = partyId;
									$("#"+partyId+" select").val(relationshipId);
									
								});
        	        			if(isAnyfamilyMember == 0){
        	        				$("#familyMemberDiv").append('<div class="list-group-item"><div class="clearfix row"  id="0">' +
                                 '<div class="hidden-lg"><label class="strong westspace2">Full Name</label></div><div class="col-lg-3"><input type="text" id="lNmae" class="form-control common_input"/><input type="hidden" id="familyPartyId" value="0"></div>'+
                                            '<div class="hidden-lg"><label class="strong westspace2">Age</label></div><div class="col-lg-3"><input type="text" id="age" maxlength="2" onkeydown="allowIntegersOnly(id,event)"  class="age spinner1 form-control"/></div>'+
                                             '<div class="hidden-lg"><label class="strong westspace2">Relation</label></div><div class="col-lg-3">'+relationshipSelect+'</div><div class="col-lg-2 northspace1 col-actions familyactions" id="actionbuttons0"><div class="icn close" onclick="removeFamilyMember(this)"><span class="hidden-lg">Delete</span> <span class="fa fa-close"></span></div><div id="plusButton" class="icn add" onclick="addFamilyMember()"><span class="hidden-lg">Add</span> <span class="fa fa-plus"></span></div>'+
         	        						'<span class="common_input3_1"></span></div></div></div>');
        	        			}else{
        	        				$("#actionbuttons"+lastFamilyMemberPartyId).append('<div id="plusButton" class="icn add" onclick="addFamilyMember()"><span class="hidden-lg">Add</span> <span class="fa fa-plus"></span></div>');
        	        				
        	        			}
        	        			
        	        			var goalDatas = result.goalDatas;
        	        			var isAnyGoal = 0;
        	        			var lastGoalFamilyPartyId = 0;
        	        			$(goalDatas).each(function(i,obj) {
									var goalTypeId=obj.goalTypeId;
									var goalEndYear=obj.goalEndYear;
									var goalAmountPv = parseFloat(obj.goalAmountPv).toFixed(0);
									var goalFamilyPartyId = obj.goalFamilyPartyId;
									var goalName=obj.goalName;
									var goalId=obj.fpGoalId;
									$("#pnl-goals").append('<div class="clearfix list-group-item" id="goal'+goalId+'">'+
                                            '<div class="hidden-lg"><label class="strong westspace2">Goal Type</label></div><div class="col-lg-2">'+goalTypeSelect+'</div><div class="hidden-lg"><label class="strong westspace2">Name</label></div><div class="col-lg-2"><input type="text" class="form-control common_input"  id="goalName" value="'+goalName+'" /></div>'+
                                            '<div class="hidden-lg"><label class="strong westspace2">Goal for</label></div><div class="col-lg-2">'+familyMemberSelect+'</div>'+
                                            '<div class="hidden-lg"><label class="strong westspace2">Years</label></div><div class="col-lg-2"><input type="text" class="form-control common_input" maxlength="4" onkeydown="allowIntegersOnly(id,event)" id="goalEndYear" value="'+goalEndYear+'" /></div>'+
                                            '<div class="hidden-lg"><label class="strong westspace2">Amount</label></div><div class="col-lg-2"><span class="icn rupee-dark"></span><input type="text" id="goalAmountPV" maxlength="15"  onkeydown="allowIntegersOnly(id,event)" class="form-control common_input" value="'+goalAmountPv+'" /></div>'+
                                            '<div class="col-lg-2 col-actions goalActions" id="actionbuttons'+goalId+'"><div class="icn close" onclick="removeGoal(this)"><span class="hidden-lg">Delete</span> <span class="fa fa-close"></span></div>'+                                            
                                             '<span class="common_input3_1"></span></div></div>');
									isAnyGoal +=1;
									lastGoalFamilyPartyId = goalId;
									$('#goal'+goalId+' select[id="goalTypeSelect"]').val(goalTypeId);
									$('#goal'+goalId+' select[id="familyMemberSelect"]').val(goalFamilyPartyId);
									
								});
        	        			if(isAnyGoal == 0){
        	        				$("#pnl-goals").append('<div class="clearfix list-group-item" id="goal0">'+
                                            '<div class="hidden-lg"><label class="strong westspace2">Goal Type</label></div><div class="col-lg-2">'+goalTypeSelect+'</div><div class="hidden-lg"><label class="strong westspace2">Name</label></div><div class="col-lg-2"><input type="text" class="form-control common_input"  id="goalName"  /></div>'+
                                            '<div class="hidden-lg"><label class="strong westspace2">Goal for</label></div><div class="col-lg-2">'+familyMemberSelect+'</div>'+
                                            '<div class="hidden-lg"><label class="strong westspace2">Years</label></div><div class="col-lg-2"><input type="text" class="form-control common_input" maxlength="4" onkeydown="allowIntegersOnly(id,event)"  id="goalEndYear"  /></div>'+
                                            '<div class="hidden-lg"><label class="strong westspace2">Amount</label></div><div class="col-lg-2"><span class="icn rupee-dark"></span><input type="text"  id="goalAmountPV" maxlength="15"  onkeydown="allowIntegersOnly(id,event)" class="form-control common_input" /></div>'+
                                            '<div class="col-lg-2 col-actions goalActions"><div class="icn close" onclick="removeGoal(this)"><span class="hidden-lg">Delete</span> <span class="fa fa-close"></span></div><div class="icn add" id="plusButtonGoal" onclick="addGoal()"><span class="hidden-lg">Add</span> <span class="fa fa-plus"></span></div>'+                                            
                                             '<span class="common_input3_1"></span></div></div>');
        	        			}else{
        	        				$("#actionbuttons"+lastGoalFamilyPartyId).append('<div id="plusButtonGoal" class="icn add" onclick="addGoal()"><span class="hidden-lg">Add</span> <span class="fa fa-plus"></span></div>');
        	        				
        	        			}
        	        			
        	        			var partyAttributeDatas=result.partyAttributeDatas;
        	        			$(partyAttributeDatas).each(function(i,obj) {
        	        				var attributeValue=obj.attributeValue;
        	        				var attributeCodeId=obj.attributeCodeId;
        	        				var attributeReferenceValue=obj.attributereferenceValue;
        	        				if(attributeCodeId!=94145 && attributeCodeId!=94148){
        	        					$('#'+attributeCodeId).val(parseFloat(attributeValue).toFixed(0));
        	        				}else{
        	        					$('#'+attributeValue).val(parseFloat(attributeReferenceValue).toFixed(0));
        	        				}
								})
        	        			
        	        		}});
        	        		}});
        				
        			
        		}});
        	
        	});
        
        function addFamilyMember(){
        	$('#plusButton').remove();
        	$("#familyMemberDiv").append('<div class="list-group-item"><div class="clearfix row"  id="0">' +
					'<div class="hidden-lg"><label class="strong westspace2">Full Name</label></div><div class="col-lg-3"><input type="text"  id="lNmae" class="form-control common_input"/><input type="hidden" id="familyPartyId" value="0"></div>'+
                    '<div class="hidden-lg"><label class="strong westspace2">Age</label></div><div class="col-lg-3"><input type="text" id="age" maxlength="2" onkeydown="allowIntegersOnly(id,event)"  class="age spinner1 form-control"/></div>'+
                     '<div class="hidden-lg"><label class="strong westspace2">Relation</label></div><div class="col-lg-3">'+relationshipSelect+'</div><div class="col-lg-2 col-actions familyactions" ><div class="icn close" onclick="removeFamilyMember(this)"><span class="hidden-lg">Delete</span> <span class="fa fa-close"></span></div><div id="plusButton" class="icn add" onclick="addFamilyMember()"><span class="hidden-lg">Add</span> <span class="fa fa-plus"></span></div>'+
						'<span class="common_input3_1"></span></div></div></div>');
        }
        function removeFamilyMember(id){
        	var isPlusRow=0;
        	if($('#plusButton').attr('id')==undefined){
        		isPlusRow=1;
        	}
        	$(id).parent().parent().parent().remove();
        	if(isPlusRow==0){
        		$('.familyactions').last().append('<div id="plusButton" class="icn add" onclick="addFamilyMember()"><span class="hidden-lg">Add</span> <span class="fa fa-plus"></span></div>');
        	}
    		var cntr=-1;
    			$('.familyactions').each(function(i,obj) {
    				cntr=i;
				});
    		if(cntr==-1){
    			$("#familyMemberDiv").append('<div class="list-group-item"><div class="clearfix row"  id="0">' +
						'<div class="hidden-lg"><label class="strong westspace2">Full Name</label></div><div class="col-lg-3"><input type="text"  id="lNmae" class="form-control common_input"/><input type="hidden" id="familyPartyId" value="0"></div>'+
                        '<div class="hidden-lg"><label class="strong westspace2">Age</label></div><div class="col-lg-3"><input type="text" id="age" maxlength="2" onkeydown="allowIntegersOnly(id,event)" class="age spinner1 form-control"/></div>'+
                         '<div class="hidden-lg"><label class="strong westspace2">Relation</label></div><div class="col-lg-3">'+relationshipSelect+'</div><div class="col-lg-2 col-actions familyactions" id="actionbuttons0"><div class="icn close" onclick="removeFamilyMember(this)"><span class="hidden-lg">Delete</span> <span class="fa fa-close"></span></div><div id="plusButton" class="icn add" onclick="addFamilyMember()"><span class="hidden-lg">Add</span> <span class="fa fa-plus"></span></div>'+
 						'<span class="common_input3_1"></span></div></div></div>');
    		}
        }
        		
        function addGoal(){
        	$('#plusButtonGoal').remove();
        	$("#pnl-goals").append('<div class="clearfix list-group-item" id="goal0">'+
                    '<div class="hidden-lg"><label class="strong westspace2">Goal Type</label></div><div class="col-lg-2">'+goalTypeSelect+'</div><div class="hidden-lg"><label class="strong westspace2">Name</label></div><div class="col-lg-2"><input type="text" class="form-control common_input"  id="goalName"  /></div>'+
                    '<div class="hidden-lg"><label class="strong westspace2">Goal for</label></div><div class="col-lg-2">'+familyMemberSelect+'</div>'+
                    '<div class="hidden-lg"><label class="strong westspace2">Years</label></div><div class="col-lg-2"><input type="text" class="form-control common_input" maxlength="4" onkeydown="allowIntegersOnly(id,event)"  id="goalEndYear"  /></div>'+
                    '<div class="hidden-lg"><label class="strong westspace2">Amount</label></div><div class="col-lg-2"><span class="icn rupee-dark"></span><input type="text"  id="goalAmountPV" maxlength="15"  onkeydown="allowIntegersOnly(id,event)" class="form-control common_input" /></div>'+
                    '<div class="col-lg-2 col-actions goalActions"><div class="icn close" onclick="removeGoal(this)"><span class="hidden-lg">Delete</span> <span class="fa fa-close"></span></div><div class="icn add" id="plusButtonGoal" onclick="addGoal()"><span class="hidden-lg">Add</span> <span class="fa fa-plus"></span></div>'+                                            
                     '<span class="common_input3_1"></span></div></div>');
        }
        function removeGoal(id){
        	var isPlusRow=0;
        	if($('#plusButtonGoal').attr('id')==undefined){
        		isPlusRow=1;
        	}
        	$(id).parent().parent().remove();
        	if(isPlusRow==0){
        		$('.goalActions').last().append('<div id="plusButtonGoal" class="icn add" onclick="addGoal()"><span class="hidden-lg">Add</span> <span class="fa fa-plus"></span></div>');
        	}
    		var cntr=-1;
    			$('.goalActions').each(function(i,obj) {
    				cntr=i;
				});
    		if(cntr==-1){
    			$("#pnl-goals").append('<div class="clearfix list-group-item" id="goal0">'+
                        '<div class="hidden-lg"><label class="strong westspace2">Goal Type</label></div><div class="col-lg-2">'+goalTypeSelect+'</div><div class="hidden-lg"><label class="strong westspace2">Name</label></div><div class="col-lg-2"><input type="text" class="form-control common_input"  id="goalName"  /></div>'+
                        '<div class="hidden-lg"><label class="strong westspace2">Goal for</label></div><div class="col-lg-2">'+familyMemberSelect+'</div>'+
                        '<div class="hidden-lg"><label class="strong westspace2">Years</label></div><div class="col-lg-2"><input type="text" class="form-control common_input" maxlength="4" onkeydown="allowIntegersOnly(id,event)"  id="goalEndYear"  /></div>'+
                        '<div class="hidden-lg"><label class="strong westspace2">Amount</label></div><div class="col-lg-2"><span class="icn rupee-dark"></span><input type="text" id="goalAmountPV" maxlength="15"  onkeydown="allowIntegersOnly(id,event)" class="form-control common_input" /></div>'+
                        '<div class="col-lg-2 col-actions goalActions"><div class="icn close" onclick="removeGoal(this)"><span class="hidden-lg">Delete</span> <span class="fa fa-close"></span></div><div class="icn add" id="plusButtonGoal" onclick="addGoal()"><span class="hidden-lg">Add</span> <span class="fa fa-plus"></span></div>'+                                            
                         '<span class="common_input3_1"></span></div></div>');
    		}
        }
        
        function saveAutoPlanDetails(){
        	var isValidated=true;
        	isValidated=validateInputForm('autoPlanForm');
        	
        	if($('#assumptionValidator').is(":checked")==false && isValidated==true){
        		isValidated=false;
        		showAlertMessage("Error","<br/>Please validate Assumption.", 'error', doNothing);
        	}else if($('#goalValidator').is(":checked")==false && isValidated==true){
        		isValidated=false;
        		showAlertMessage("Error","<br/>Please validate Goals.", 'error', doNothing);
        	}
        	if(isValidated==true){
        		var dataXML='<Root>';
//         		dataXML+='<FirstName>'+$('#firstname').val()+'</FirstName>';
        		dataXML+='<FirstName>'+$('#firstname').val()+'</FirstName>';
        		dataXML+='<LastName>'+$('#lastname').val()+'</LastName>';
        		dataXML+='<DOB>'+$('#dob').val()+'</DOB>';
        		dataXML+='<EmailId>'+$('#emailId').val()+'</EmailId>';
        		dataXML+='<Income>'+$('#income').val()+'</Income>';
        		dataXML+='<Expense>'+$('#expense').val()+'</Expense>';
        		dataXML+='<RetirementAge>'+$('#retirementAge').val()+'</RetirementAge>';
//         		dataXML+='<EmergencyMonth>'+$('#emergencyMonths').val()+'</EmergencyMonth>';
        		dataXML+='<EmergencyMonth></EmergencyMonth>';
        		dataXML+='<RiskProfileId>'+$('#riskProfile').val()+'</RiskProfileId>';
        		dataXML+='<PanNo>'+$('#panNo').val()+'</PanNo>';
        		dataXML+='<City>'+$('#city').val()+'</City>';
        		dataXML+='<LifeExpectancy>'+$('#lifeExpectancy').val()+'</LifeExpectancy>';
        		dataXML+='<EMI>'+$('#emi').val()+'</EMI>';
        		dataXML+='<Will>'+$('#will').val()+'</Will>';
        		dataXML+='</Root>';
        		
        		var partyAttributeDataXML='<Root>';
        		$('.riskcover').each(function(i,obj) {
        			if($(obj).val()!='' && $(obj).val()!=0){
	        			partyAttributeDataXML+='<Data>';
	        			partyAttributeDataXML+='<AttributeCodeId>'+$(obj).attr('id')+'</AttributeCodeId>';
	        			partyAttributeDataXML+='<AttributeValue>'+$(obj).val()+'</AttributeValue>';
	        			partyAttributeDataXML+='<AttributeReferenceValue>'+$(obj).val()+'</AttributeReferenceValue>';
	        			partyAttributeDataXML+='</Data>';
        			}
				});
        		$('.goalassets').each(function(i,obj) {
        			if($(obj).val()!='' && $(obj).val()!=0){
	        			partyAttributeDataXML+='<Data>';
	        			partyAttributeDataXML+='<AttributeCodeId>94145</AttributeCodeId>';
	        			partyAttributeDataXML+='<AttributeValue>'+$(obj).attr('id')+'</AttributeValue>';
	        			partyAttributeDataXML+='<AttributeReferenceValue>'+$(obj).val()+'</AttributeReferenceValue>';
	        			partyAttributeDataXML+='</Data>';
        			}
				});
        		$('.retirementassets').each(function(i,obj) {
        			if($(obj).val()!='' && $(obj).val()!=0){
	        			partyAttributeDataXML+='<Data>';
	        			partyAttributeDataXML+='<AttributeCodeId>94148</AttributeCodeId>';
	        			partyAttributeDataXML+='<AttributeValue>'+$(obj).attr('id')+'</AttributeValue>';
	        			partyAttributeDataXML+='<AttributeReferenceValue>'+$(obj).val()+'</AttributeReferenceValue>';
	        			partyAttributeDataXML+='</Data>';
        			}	
				});
        		partyAttributeDataXML+='</Root>';
        		var goalXML='<Root>';
        		$('#pnl-goals .clearfix').each(function(i,obj) {
        			if($(obj).contents().find('input[id="goalName"]').val()!=undefined){
        				var goalName=$(obj).contents().find('input[id="goalName"]').val();
        				var goalEndYear=$(obj).contents().find('input[id="goalEndYear"]').val();
        				var goalAmountPV=$(obj).contents().find('input[id="goalAmountPV"]').val();
        				var goalTypeId=$(obj).contents().find('select[id="goalTypeSelect"]').val();
        				var goalFamilyPartyID=$(obj).contents().find('select[id="familyMemberSelect"]').val();
        				if(goalName!='' || goalEndYear!='' || goalAmountPV!='' || goalTypeId!=0 || goalFamilyPartyID!=0){
//         					alert(goalName+'--'+goalEndYear+'---'+goalAmountPV+'--'+goalTypeId+'----'+goalFamilyPartyID);
        					if(goalName==''){
        						$(obj).contents().find('input[id="goalName"]').css('border-color','red');
        						$(obj).contents().find('input[id="goalName"]').attr('title', 'Please enter Name.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('input[id="goalName"]').css('border-color','grey');
        						$(obj).contents().find('input[id="goalName"]').removeAttr('title');
        					}
        					if(goalEndYear==''){
        						$(obj).contents().find('input[id="goalEndYear"]').css('border-color','red');
        						$(obj).contents().find('input[id="goalEndYear"]').attr('title', 'Please enter Year.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('input[id="goalEndYear"]').css('border-color','grey');
        						$(obj).contents().find('input[id="goalEndYear"]').removeAttr('title');
        					}
        					if(goalAmountPV==''){
        						$(obj).contents().find('input[id="goalAmountPV"]').css('border-color','red');
        						$(obj).contents().find('input[id="goalAmountPV"]').attr('title', 'Please enter Amount.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('input[id="goalAmountPV"]').css('border-color','grey');
        						$(obj).contents().find('input[id="goalAmountPV"]').removeAttr('title');
        					}
        					if(goalTypeId==0){
        						$(obj).contents().find('select[id="goalTypeSelect"]').css('border-color','red');
        						$(obj).contents().find('select[id="goalTypeSelect"]').attr('title', 'Please Goal Type.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('select[id="goalTypeSelect"]').css('border-color','grey');
        						$(obj).contents().find('select[id="goalTypeSelect"]').removeAttr('title');
        					}
        					if(goalFamilyPartyID==0){
        						$(obj).contents().find('select[id="familyMemberSelect"]').css('border-color','red');
        						$(obj).contents().find('select[id="familyMemberSelect"]').attr('title', 'Please Goal for.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('select[id="familyMemberSelect"]').css('border-color','grey');
        						$(obj).contents().find('select[id="familyMemberSelect"]').removeAttr('title');
        					}
        						
        					goalXML+='<Goal>';
    	        			goalXML+='<GoalDescription><![CDATA['+$(obj).contents().find('input[id="goalName"]').val()+']]></GoalDescription>';
    	       				goalXML+='<GoalEndYear><![CDATA['+$(obj).contents().find('input[id="goalEndYear"]').val()+']]></GoalEndYear>';
    	    				goalXML+='<GoalAmountPv><![CDATA['+$(obj).contents().find('input[id="goalAmountPV"]').val()+']]></GoalAmountPv>';
    	        			goalXML+='<GoalTypeId><![CDATA['+$(obj).contents().find('select[id="goalTypeSelect"]').val()+']]></GoalTypeId>';
    	        			goalXML+='<GoalFamilyPartyID>'+$(obj).contents().find('select[id="familyMemberSelect"]').val()+'</GoalFamilyPartyID>';
    	        			goalXML+='<GoalStartYear>'+$(obj).contents().find('input[id="goalEndYear"]').val()+'</GoalStartYear>';
    	        			goalXML+='<IsLoan>0</IsLoan>';
    	        			goalXML+='<LoanAmount>0</LoanAmount>';
    	        			goalXML+='<LoanDownPayment><![CDATA['+$(obj).contents().find('input[id="goalAmountPV"]').val()+']]></LoanDownPayment>';
    	        			goalXML+='<LoanInterestPercentage>0</LoanInterestPercentage>';
    	        			goalXML+='<LoanDurationYears>0</LoanDurationYears>';
    	        			goalXML+='<GoalName><![CDATA['+$(obj).contents().find('input[id="goalName"]').val()+']]></GoalName>';
    	        			goalXML+='</Goal>';
        				}
	        			
        			}
				});
        		goalXML+='</Root>';
        		
        		var familyMemberDataXML='<Root>';
        		$('#familyMemberDiv .list-group-item .clearfix').each(function(i,obj) {
        			if($(obj).contents().find('input[id="lNmae"]').val()!=undefined){
        				var relationshipId=$(obj).contents().find('select').val();
        				var name=$(obj).contents().find('input[id="lNmae"]').val();
        				var age=$(obj).contents().find('input[id="age"]').val();
        				if(relationshipId!=0 || name!='' || age!=''){
        					
        					if(relationshipId==0){
        						$(obj).contents().find('select').css('border-color','red');
        						$(obj).contents().find('select').attr('title', 'Please select Relation.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('select').css('border-color','grey');
        						$(obj).contents().find('select').removeAttr('title');
        					}
        					
        					if(name==''){
        						$(obj).contents().find('input[id="lNmae"]').css('border-color','red');
        						$(obj).contents().find('input[id="lNmae"]').attr('title', 'Please enter Full Name.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('input[id="lNmae"]').css('border-color','grey');
        						$(obj).contents().find('input[id="lNmae"]').removeAttr('title');
        					}
        					
        					if(age==''){
        						$(obj).contents().find('input[id="age"]').css('border-color','red');
        						$(obj).contents().find('input[id="age"]').attr('title', 'Please enter Age.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('input[id="age"]').css('border-color','grey');
        						$(obj).contents().find('input[id="age"]').removeAttr('title');
        					}
        					
	        				familyMemberDataXML+='<FamilyMember>';
	        				familyMemberDataXML+='<RelationshipId>'+$(obj).contents().find('select').val()+'</RelationshipId>';
	        				familyMemberDataXML+='<Name><![CDATA['+$(obj).contents().find('input[id="lNmae"]').val()+']]></Name>';
	        				familyMemberDataXML+='<Age>'+$(obj).contents().find('input[id="age"]').val()+'</Age>';
	        				familyMemberDataXML+='<PartyId>'+$(obj).contents().find('input[id="familyPartyId"]').val()+'</PartyId>';
	        				familyMemberDataXML+='</FamilyMember>';
        				}
        			}
        		});
        		familyMemberDataXML+='</Root>';
        		console.log('dataXML:----'+dataXML);
        		console.log('partyAttributeDataXML:----'+partyAttributeDataXML);
        		console.log('goalXML:----'+goalXML);
        		console.log('familyMemberDataXML:----'+familyMemberDataXML);
        		$('#dataXML').val(dataXML);
        		$('#partyAttributeDataXML').val(partyAttributeDataXML);
        		$('#goalXML').val(goalXML);
        		$('#familyMemberDataXML').val(familyMemberDataXML);
        		if(isValidated==true){
	        	$.ajax({
	        		type : "POST",
	        		url : $('#contextPath').val()+'/partner/saveClientAutoPlanDetails.htm',
	        		data: $('#autoPlanDataForm').serialize(),
	        		success : function(result) {
	        			if(result==1){
	    					showAlertMessage("Success", "<br/>Data saved successfully.", "confirmation", doNothing);
	    				}
	        		}});
        		}else{
        			showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
        		}
        	}
        }
        function generateReport(){
        	showAlertMessage1("Message", "<br/>Will you want to merge these clients ? If yes then mearge clients and then generate report.", "question",submitForm);
          //$('.ZebraDialog_Button1').attr('href','javascript:showAlertMessage(\'Message\', \'Please mearge clients and then generate report.\', \'information\',doNothing);');
			$('.ZebraDialog_Button0').attr('href','javascript:generateReport1()');
		 	
        }
        function generateReport1(){
        	var dcInputPartyId=$('#clientPartyId').val();
        	localStorage.setItem('IsAutoPlan','true');
        	var isValidated=true;
        	isValidated=validateInputForm('autoPlanForm');
        	
        	if($('#assumptionValidator').is(":checked")==false && isValidated==true){
        		isValidated=false;
        		showAlertMessage("Error","<br/>Please validate Assumption.", 'error', doNothing);
        	}else if($('#goalValidator').is(":checked")==false && isValidated==true){
        		isValidated=false;
        		showAlertMessage("Error","<br/>Please validate Goals.", 'error', doNothing);
        	}
        	if(isValidated==true){
        		var dataXML='<Root>';
//         		dataXML+='<FirstName>'+$('#firstName').val()+'</FirstName>';
        		dataXML+='<FirstName>'+$('#firstname').val()+'</FirstName>';
        		dataXML+='<LastName>'+$('#lastname').val()+'</LastName>';
        		dataXML+='<DOB>'+$('#dob').val()+'</DOB>';
        		dataXML+='<EmailId>'+$('#emailId').val()+'</EmailId>';
        		dataXML+='<Income>'+$('#income').val()+'</Income>';
        		dataXML+='<Expense>'+$('#expense').val()+'</Expense>';
        		dataXML+='<RetirementAge>'+$('#retirementAge').val()+'</RetirementAge>';
//         		dataXML+='<EmergencyMonth>'+$('#emergencyMonths').val()+'</EmergencyMonth>';
        		dataXML+='<EmergencyMonth></EmergencyMonth>';
        		dataXML+='<RiskProfileId>'+$('#riskProfile').val()+'</RiskProfileId>';
        		dataXML+='<PanNo>'+$('#panNo').val()+'</PanNo>';
        		dataXML+='<City>'+$('#city').val()+'</City>';
        		dataXML+='<LifeExpectancy>'+$('#lifeExpectancy').val()+'</LifeExpectancy>';
        		dataXML+='<EMI>'+$('#emi').val()+'</EMI>';
        		dataXML+='<Will>'+$('#will').val()+'</Will>';
        		dataXML+='</Root>';
        		
        		var partyAttributeDataXML='<Root>';
        		$('.riskcover').each(function(i,obj) {
        			if($(obj).val()!='' && $(obj).val()!=0){
	        			partyAttributeDataXML+='<Data>';
	        			partyAttributeDataXML+='<AttributeCodeId>'+$(obj).attr('id')+'</AttributeCodeId>';
	        			partyAttributeDataXML+='<AttributeValue>'+$(obj).val()+'</AttributeValue>';
	        			partyAttributeDataXML+='<AttributeReferenceValue>'+$(obj).val()+'</AttributeReferenceValue>';
	        			partyAttributeDataXML+='</Data>';
        			}
				});
        		$('.goalassets').each(function(i,obj) {
        			if($(obj).val()!='' && $(obj).val()!=0){
	        			partyAttributeDataXML+='<Data>';
	        			partyAttributeDataXML+='<AttributeCodeId>94145</AttributeCodeId>';
	        			partyAttributeDataXML+='<AttributeValue>'+$(obj).attr('id')+'</AttributeValue>';
	        			partyAttributeDataXML+='<AttributeReferenceValue>'+$(obj).val()+'</AttributeReferenceValue>';
	        			partyAttributeDataXML+='</Data>';
        			}
				});
        		$('.retirementassets').each(function(i,obj) {
        			if($(obj).val()!='' && $(obj).val()!=0){
	        			partyAttributeDataXML+='<Data>';
	        			partyAttributeDataXML+='<AttributeCodeId>94148</AttributeCodeId>';
	        			partyAttributeDataXML+='<AttributeValue>'+$(obj).attr('id')+'</AttributeValue>';
	        			partyAttributeDataXML+='<AttributeReferenceValue>'+$(obj).val()+'</AttributeReferenceValue>';
	        			partyAttributeDataXML+='</Data>';
        			}	
				});
        		partyAttributeDataXML+='</Root>';
        		var goalXML='<Root>';
        		$('#pnl-goals .clearfix').each(function(i,obj) {
        			if($(obj).contents().find('input[id="goalName"]').val()!=undefined){
        				var goalName=$(obj).contents().find('input[id="goalName"]').val();
        				var goalEndYear=$(obj).contents().find('input[id="goalEndYear"]').val();
        				var goalAmountPV=$(obj).contents().find('input[id="goalAmountPV"]').val();
        				var goalTypeId=$(obj).contents().find('select[id="goalTypeSelect"]').val();
        				var goalFamilyPartyID=$(obj).contents().find('select[id="familyMemberSelect"]').val();
        				if(goalName!='' || goalEndYear!='' || goalAmountPV!='' || goalTypeId!=0 || goalFamilyPartyID!=0){
//         					alert(goalName+'--'+goalEndYear+'---'+goalAmountPV+'--'+goalTypeId+'----'+goalFamilyPartyID);
        					if(goalName==''){
        						$(obj).contents().find('input[id="goalName"]').css('border-color','red');
        						$(obj).contents().find('input[id="goalName"]').attr('title', 'Please enter Name.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('input[id="goalName"]').css('border-color','grey');
        						$(obj).contents().find('input[id="goalName"]').removeAttr('title');
        					}
        					if(goalEndYear==''){
        						$(obj).contents().find('input[id="goalEndYear"]').css('border-color','red');
        						$(obj).contents().find('input[id="goalEndYear"]').attr('title', 'Please enter Year.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('input[id="goalEndYear"]').css('border-color','grey');
        						$(obj).contents().find('input[id="goalEndYear"]').removeAttr('title');
        					}
        					if(goalAmountPV==''){
        						$(obj).contents().find('input[id="goalAmountPV"]').css('border-color','red');
        						$(obj).contents().find('input[id="goalAmountPV"]').attr('title', 'Please enter Amount.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('input[id="goalAmountPV"]').css('border-color','grey');
        						$(obj).contents().find('input[id="goalAmountPV"]').removeAttr('title');
        					}
        					if(goalTypeId==0){
        						$(obj).contents().find('select[id="goalTypeSelect"]').css('border-color','red');
        						$(obj).contents().find('select[id="goalTypeSelect"]').attr('title', 'Please Goal Type.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('select[id="goalTypeSelect"]').css('border-color','grey');
        						$(obj).contents().find('select[id="goalTypeSelect"]').removeAttr('title');
        					}
        					if(goalFamilyPartyID==0){
        						$(obj).contents().find('select[id="familyMemberSelect"]').css('border-color','red');
        						$(obj).contents().find('select[id="familyMemberSelect"]').attr('title', 'Please Goal for.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('select[id="familyMemberSelect"]').css('border-color','grey');
        						$(obj).contents().find('select[id="familyMemberSelect"]').removeAttr('title');
        					}
        						
        					goalXML+='<Goal>';
    	        			goalXML+='<GoalDescription><![CDATA['+$(obj).contents().find('input[id="goalName"]').val()+']]></GoalDescription>';
    	       				goalXML+='<GoalEndYear><![CDATA['+$(obj).contents().find('input[id="goalEndYear"]').val()+']]></GoalEndYear>';
    	    				goalXML+='<GoalAmountPv><![CDATA['+$(obj).contents().find('input[id="goalAmountPV"]').val()+']]></GoalAmountPv>';
    	        			goalXML+='<GoalTypeId><![CDATA['+$(obj).contents().find('select[id="goalTypeSelect"]').val()+']]></GoalTypeId>';
    	        			goalXML+='<GoalFamilyPartyID>'+$(obj).contents().find('select[id="familyMemberSelect"]').val()+'</GoalFamilyPartyID>';
    	        			goalXML+='<GoalStartYear>'+$(obj).contents().find('input[id="goalEndYear"]').val()+'</GoalStartYear>';
    	        			goalXML+='<IsLoan>0</IsLoan>';
    	        			goalXML+='<LoanAmount>0</LoanAmount>';
    	        			goalXML+='<LoanDownPayment>0</LoanDownPayment>';
    	        			goalXML+='<LoanInterestPercentage>0</LoanInterestPercentage>';
    	        			goalXML+='<LoanDurationYears>0</LoanDurationYears>';
    	        			goalXML+='<GoalName><![CDATA['+$(obj).contents().find('input[id="goalName"]').val()+']]></GoalName>';
    	        			goalXML+='</Goal>';
        				}
	        			
        			}
				});
        		goalXML+='</Root>';
        		
        		var familyMemberDataXML='<Root>';
        		$('#familyMemberDiv .list-group-item .clearfix').each(function(i,obj) {
        			if($(obj).contents().find('input[id="lNmae"]').val()!=undefined){
        				var relationshipId=$(obj).contents().find('select').val();
        				var name=$(obj).contents().find('input[id="lNmae"]').val();
        				var age=$(obj).contents().find('input[id="age"]').val();
        				if(relationshipId!=0 || name!='' || age!=''){
        					
        					if(relationshipId==0){
        						$(obj).contents().find('select').css('border-color','red');
        						$(obj).contents().find('select').attr('title', 'Please select Relation.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('select').css('border-color','grey');
        						$(obj).contents().find('select').removeAttr('title');
        					}
        					
        					if(name==''){
        						$(obj).contents().find('input[id="lNmae"]').css('border-color','red');
        						$(obj).contents().find('input[id="lNmae"]').attr('title', 'Please enter Full Name.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('input[id="lNmae"]').css('border-color','grey');
        						$(obj).contents().find('input[id="lNmae"]').removeAttr('title');
        					}
        					
        					if(age==''){
        						$(obj).contents().find('input[id="age"]').css('border-color','red');
        						$(obj).contents().find('input[id="age"]').attr('title', 'Please enter Age.');
        						isValidated=false;
        					}else{
        						$(obj).contents().find('input[id="age"]').css('border-color','grey');
        						$(obj).contents().find('input[id="age"]').removeAttr('title');
        					}
        					
	        				familyMemberDataXML+='<FamilyMember>';
	        				familyMemberDataXML+='<RelationshipId>'+$(obj).contents().find('select').val()+'</RelationshipId>';
	        				familyMemberDataXML+='<Name><![CDATA['+$(obj).contents().find('input[id="lNmae"]').val()+']]></Name>';
	        				familyMemberDataXML+='<Age>'+$(obj).contents().find('input[id="age"]').val()+'</Age>';
	        				familyMemberDataXML+='<PartyId>'+$(obj).contents().find('input[id="familyPartyId"]').val()+'</PartyId>';
	        				familyMemberDataXML+='</FamilyMember>';
        				}
        			}
        		});
        		familyMemberDataXML+='</Root>';
        		console.log('dataXML:----'+dataXML);
        		console.log('partyAttributeDataXML:----'+partyAttributeDataXML);
        		console.log('goalXML:----'+goalXML);
        		console.log('familyMemberDataXML:----'+familyMemberDataXML);
        		$('#dataXML').val(dataXML);
        		$('#partyAttributeDataXML').val(partyAttributeDataXML);
        		$('#goalXML').val(goalXML);
        		$('#familyMemberDataXML').val(familyMemberDataXML);
        		if(isValidated==true){
	        	$.ajax({
	        		type : "POST",
	        		url : $('#contextPath').val()+'/partner/saveClientAutoPlanDetails.htm',
	        		data: $('#autoPlanDataForm').serialize(),
	        		success : function(result) {
        	//alert('dcInputPartyId='+dcInputPartyId);
       	$.ajax({
		     type : "POST",
		     url : $('#contextPath').val()+'/dc/submitDcInput.htm?isAnalysisReportGenration=true&isActionPlanGeneration=true&dcInputPartyId='+dcInputPartyId+'&dcInputBuId='+$('#buId').val(),
		     data :  $('form').serialize(), 
		     success : function(result) {
        	
			    	        	    	 $.ajax({
			    	        	    	     type : "POST",
			    	        	    	     url : $('#baseServerURL').val()+'/FIINFRA-M-WEB/partner/report/generate-report-analysis/'+$('#clientPartyId').val()+'/'+$('#partyIdHidden').val()+'/'+$('#usernamefromsession').val()+'/'+$('#buId').val()+'/C?TOKEN=abc&USER_NAME='+$('#usernamefromsession').val(),
			    	        	    	     success : function(result) {
			    	        	    	    	 
			    	        	    	    	 $.ajax({
			    	        	    	       	     type : "POST",
			    	        	    	       	     url : $('#baseServerURL').val()+'/FIINFRA-M-WEB/partner/report/generate-report-analysisClient/'+$('#clientPartyId').val()+'/'+$('#partyIdHidden').val()+'/'+$('#usernamefromsession').val()+'/'+$('#buId').val()+'/advisor?TOKEN=abc&USER_NAME='+$('#usernamefromsession').val(),
			    	        	    	       	     success : function(result) {
			    	        	    	       	    	$.ajax({
			    	        	    	    	   	   	     type : "POST",
			    	        	    	    	   	   	     url : $('#baseServerURL').val()+'/FIINFRA-M-WEB/partner/report/generate-report-analysisClient/'+$('#clientPartyId').val()+'/'+$('#partyIdHidden').val()+'/'+$('#usernamefromsession').val()+'/'+$('#buId').val()+'/client?TOKEN=abc&USER_NAME='+$('#usernamefromsession').val(),
			    	        	    	    	   	   	     success : function(result) {
			    	        	    	    	   	   	   
					    	        		    	    	    	 showAlertMessage1("Message",
					    	        		    	       					"<br/>Auto Plan Generated Successfully.",
					    	        		    	       					"confirmation", doNothing);
					    	        		    	 					 $('.ZebraDialog').css('top','250px');
					    	        		    	    	    
					    	        		    	    	    // }});
			    	        	    	    	   	   	     },
			    	        	    	    		   	   	 error : function(err){
			    	        	    	    				}
			    	        	    	       	    	});
			    	        	    	       	     }});
			    	        	    	    	    	
			    	        		    	    	 
			    	        	    	     }});
			    	        	    	
			    	    	     //}});
								       // }});
		     }});
	        		}});
	        		}
        	}
       }
        </script>
      <%
		int partyId=Integer.parseInt(request.getParameter("partyId"));
        String stage=request.getParameter("stage");
        String name=request.getParameter("name");
		%>
      <form id="autoPlanDataForm">
        <input type="hidden" id="partyAttributeDataXML" name="partyAttributeDataXML">
        <input type="hidden" id="familyMemberDataXML" name="familyMemberDataXML">
        <input type="hidden" id="goalXML" name="goalXML">
        <input type="hidden" id="dataXML" name="dataXML">
        <input type="hidden" id="clientPartyId" name="partyId" value="<%=partyId%>">
        <input type="hidden" id="clientStage" name="clientStage" value="<%=stage%>">
        <input type="hidden" id="clientNameLabel" name="clientName" value="<%=name%>">
      </form>
      <jsp:include page="../common/footer.jsp" />
<%
String serverPath = request
.getRequestURL()
.toString()
.replace(request.getRequestURI().substring(0),
		request.getContextPath());
serverPath=serverPath.substring(0,serverPath.lastIndexOf("/"));
%>
<input id="baseServerURL" value="<%=serverPath%>">
<input type="hidden" id="usernamefromsession" value="${sessionScope.userSession.userName}"/>
</body>
</html>