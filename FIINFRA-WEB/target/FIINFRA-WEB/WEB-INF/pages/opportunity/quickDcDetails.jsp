<!DOCTYPE html>
<html lang="en">
<!--<link href="css/Axis_dc.css" rel="stylesheet">-->
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<head>
<title>QUICK FINANCIAL PLAN</title>
<script type="text/javascript">
            
        </script>
<style type="text/css">
#pnl-pp .col-actions .icn.close {
	left: 4px;
	border-color: #3A3A3A !important;
	color: #3A3A3A !important;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/common_popup.jsp" />
        <div class="">
          <div class="page-header">
            <h1>QUICK FINANCIAL PLAN REVIEW - <small><b id="clientNameLable"></b></small></h1>
          </div>
          <div class="container-body">
            <form method="post" action="" class="form-horizontal" id="autoPlanForm">
              <div class="widget-box" style="margin-top:10px;">
                <div class="widget-header">
                  <h5 class="widget-title">Goals</h5>
                </div>
                <div class="widget-body">
                  <div class="widget-main clearfix">
                    <div class="list-group" id="pnl-goals">
                      <div class="clearfix list-group-item active visible-lg">
                        <div class="row">
                          <div class="col-lg-3">Goal Type</div>
                          <div class="col-lg-3">Goal/Commitment</div>
                          <!-- <div class="col-lg-2">Goal for</div> -->
                          <div class="col-lg-2">Goal Year</div>
                          <div class="col-lg-2">Amount</div>
                           <div class="col-lg-1">Add</div>
                          <div class="col-lg-1">Delete</div>
                         
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <span style="font-weight: bold;">&nbsp;&nbsp;&nbsp;Note:- Do not add a retirement planning goal, as it has been taken up as by default goal.</span>
              </div>
              <div class="space-8"></div>
              <div class="widget-box" style="margin-top:10px;">
                <div class="widget-header">
                  <h5 class="widget-title">Starting Point</h5>
                </div>
                <div class="widget-body">
                  <div class="widget-main clearfix">
                    <div class="list-group-item active southspace2">Assets</div>
                    <div class="col-md-6">
                      <div class="list-group">
                        <div class="clearfix list-group-item active">
                          <div class="row">
                            <div class="col-lg-5">General Assets</div>
                          </div>
                        </div>
                        <div class="clearfix list-group-item">
                          <div class="col-lg-2">
                            <label>Shares:</label>
                          </div>
                          <div class="col-lg-10"><span class="icn rupee-dark"></span>
                            <input id="94027" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                          </div>
                        </div>
                        <div class="clearfix list-group-item">
                          <div class="col-lg-2">
                            <label>Deposits:</label>
                          </div>
                          <div class="col-lg-10"><span class="icn rupee-dark"></span>
                            <input id="94029" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                          </div>
                        </div>
                        <div class="clearfix list-group-item">
                          <div class="col-lg-2">
                            <label>Gold:</label>
                          </div>
                          <div class="col-lg-10"><span class="icn rupee-dark"></span>
                            <input id="94032" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                          </div>
                        </div>
                        <div class="clearfix list-group-item">
                          <div class="col-lg-2">
                            <label>Property:</label>
                          </div>
                          <div class="col-lg-10"><span class="icn rupee-dark"></span>
                            <input id="94028" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                          </div>
                        </div>
                        <div class="clearfix list-group-item">
                          <div class="col-lg-2">
                            <label>Mutual Funds:</label>
                          </div>
                          <div class="col-lg-10"><span class="icn rupee-dark"></span>
                            <input id="94030" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                          </div>
                        </div>
                        <div class="clearfix list-group-item">
                          <div class="col-lg-2">
                            <label>Bonds:</label>
                          </div>
                          <div class="col-lg-10"><span class="icn rupee-dark"></span>
                            <input id="94031" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                          </div>
                        </div>
                        <div class="clearfix list-group-item">
                          <div class="col-lg-2">
                            <label>Others:</label>
                          </div>
                          <div class="col-lg-10"><span class="icn rupee-dark"></span>
                            <input id="94033" type="text"  class="form-control common_input goalassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="list-group">
                        <div class="clearfix list-group-item active">
                          <div class="row">
                            <div class="col-lg-5">Retirement Assets</div>
                          </div>
                        </div>
                        <div class="clearfix list-group-item">
                          <div class="col-lg-2">
                            <label>Provident Funds:</label>
                          </div>
                          <div class="col-lg-10"><span class="icn rupee-dark"></span>
                            <input id="94051" type="text"  class="form-control common_input retirementassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                          </div>
                        </div>
                        <div class="clearfix list-group-item">
                          <div class="col-lg-2">
                            <label>Pension Plans:</label>
                          </div>
                          <div class="col-lg-10"><span class="icn rupee-dark"></span>
                            <input id="94052" type="text"  class="form-control common_input retirementassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                          </div>
                        </div>
                        <div class="clearfix list-group-item">
                          <div class="col-lg-2">
                            <label>National Pension Schemes:</label>
                          </div>
                          <div class="col-lg-10"><span class="icn rupee-dark"></span>
                            <input id="94053" type="text"  class="form-control common_input retirementassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                          </div>
                        </div>
                        <div class="clearfix list-group-item">
                          <div class="col-lg-2">
                            <label>Others:</label>
                          </div>
                          <div class="col-lg-10"><span class="icn rupee-dark"></span>
                            <input id="94054" type="text"  class="form-control common_input retirementassets" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="space-8"></div>
              <div class="list-group">
                <div class="clearfix list-group-item">
                  <div class="col-lg-8">
                    <label>How much of regular monthly investments do you do (in Rs.)? </label>
                  </div>
                  <div class="col-lg-4"> <span class="icn rupee-dark"></span>
                    <input id="monthlyInvesment" type="text"  class="form-control common_input" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                  </div>
                </div>
                <div class="clearfix list-group-item">
                  <div class="col-lg-8">
                    <label>How would your best friend describe you as risktaker? <span class="red">*</span> </label>
                  </div>
                  <div class="col-lg-4">
                    <select class="form-control wdmin100per" id="riskProfile" name="riskProfileId" style="min-width:76% !important">
                    </select>
                  </div>
                </div>
              </div>
              <div class="space-8"></div>
              <div class="list-group">
                <div class="clearfix list-group-item">
                 <div class="col-lg-4">
                    <div class="col-lg-12">
                      <label>What is your family expenses every month? <span class="red">*</span> </label>
                    </div>
                    <span class="icn rupee-dark"></span>
                    <input id="expenseText" onkeyup="test_skillText(id)" type="text"  class="form-control common_input" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                  </div>
                  <div class="col-lg-1">
                    <label>OR </label>
                  </div>
                  <div class="col-lg-7">
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94162" value="25000" onclick="selectOption(id, name)" type="radio" name="94074" maxlength="15" class="ace"/>
                            <span class="lbl">less than Rs 25,000</span> </label>
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94075" value="37500" onclick="selectOption(id, name)" type="radio" name="94074" maxlength="15" class="ace"/>
                            <span class="lbl">Rs 25,000 to Rs 50,000</span> </label>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94076" value="62500" onclick="selectOption(id, name)" type="radio" name="94074" maxlength="15" class="ace"/>
                            <span class="lbl">Rs 50,000 to Rs 75,000</span> </label>
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94077" value="87500" onclick="selectOption(id, name)" type="radio" name="94074" maxlength="15" class="ace"/>
                            <span class="lbl">Rs 75,000 to Rs 1,00,000</span> </label>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94078" value="100000" onclick="selectOption(id, name)" type="radio" name="94074" maxlength="15" class="ace"/>
                            <span class="lbl">more than Rs 1,00,000</span> </label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="clearfix list-group-item">
                  <div class="col-lg-4">
                    <div class="col-lg-12">
                      <label>How much is your Annual Household Income (post Tax)? <span class="red">*</span> </label>
                    </div>
                    <span class="icn rupee-dark"></span>
                    <input id="moneyText" onkeyup="test_skillText(id)" type="text"  class="form-control common_input" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                  </div>
                  <div class="col-lg-1">
                    <label>OR </label>
                  </div>
                  <div class="col-lg-7">
                  <div class="col-lg-7">
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94161" value="300000" onclick="selectOption(id, name)" type="radio" name="94067" class="ace" />
                            <span class="lbl">less than Rs 3L</span> </label>
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94068" value="450000" onclick="selectOption(id, name)" type="radio" name="94067" class="ace" />
                            <span class="lbl">Rs 3L to Rs 6L</span> </label>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94069" value="800000" onclick="selectOption(id, name)" type="radio" name="94067" class="ace"/>
                            <span class="lbl">Rs 6L to Rs 10L</span> </label>
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94070" value="1250000" onclick="selectOption(id, name)" type="radio" name="94067" class="ace" />
                            <span class="lbl">Rs 10L to 15L</span> </label>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6 col-sm-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94071" value="1750000" onclick="selectOption(id, name)" type="radio" name="94067" class="ace" />
                            <span class="lbl">Rs 15L to 20L</span> </label>
                        </div>
                      </div>
                      <div class="col-md-6 col-sm-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94072" value="2000000" onclick="selectOption(id, name)" type="radio" name="94067" class="ace"/>
                            <span class="lbl">more than Rs 20L</span> </label>
                        </div>
                      </div>
                    </div>
                  </div>              
                 </div>
                 </div>
                 </div>
              <div class="list-group">
                <div class="clearfix list-group-item">
                  <div class="col-lg-8">
                    <label>How much monthly EMI do you pay against Loan? </label>
                  </div>
                  <div class="col-lg-4"> <span class="icn rupee-dark"></span>
                    <input id="emi" type="text"  class="form-control common_input" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                  </div>
                </div>
                <div class="clearfix list-group-item">
                  <div class="col-lg-8">
                    <label>Do you plan to take any loans in Future? </label>
                  </div>
                  <div class="col-lg-4">
                    <div class="row">
                      <div class="col-md-6 col-xs-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94135_94092" type="radio" value="1" name="94092" class="ace"/>
                            <span class="lbl">Yes</span> </label>
                        </div>
                      </div>
                      <div class="col-md-6 col-xs-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="94136_94092" type="radio" value="0" name="94092" class="ace"/>
                            <span class="lbl">No</span> </label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="clearfix list-group-item">
                  <div class="col-lg-8">
                    <label>Have you prepared a WILL for yourself? </label>
                  </div>
                  <div class="col-lg-4">
                    <div class="row">
                      <div class="col-md-6 col-xs-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="willYes" type="radio" value="1" name="will" class="ace"/>
                            <span class="lbl">Yes</span> </label>
                        </div>
                      </div>
                      <div class="col-md-6 col-xs-6">
                        <div class="dcanswer radio">
                          <label>
                            <input id="willNo" type="radio" value="0" name="will" class="ace"/>
                            <span class="lbl">No</span> </label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="space-8"></div>
              <div class="widget-box" style="margin-top:10px;">
                <div class="widget-header">
                  <h5 class="widget-title">Dream Spoilers</h5>
                </div>
                <div class="widget-body">
                  <div class="widget-main clearfix">
                    <div class="list-group">
                      <div class="clearfix list-group-item">
                        <div class="col-lg-7">
                          <label class="emer_94009">How many months do you think you can manage without an income? <span class="red">*</span> </label>
                        </div>
                        <div class="col-lg-5">
                          <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <div class="dcanswer radio">
                                <label>
                                  <input name="94009"  onclick="selectOption(id, name)" type="radio" id="94138" value="2" class="ace">
                                  <span class="lbl">1-3</span> </label>
                              </div>
                            </div>

                            <div class="col-md-6 col-sm-6">
                              <div class="dcanswer radio" >
                                <label>
                                  <input name="94009" onclick="selectOption(id, name)" type="radio" id="94139" value="5" class="ace">
                                  <span class="lbl">3-6</span> </label>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <div class="dcanswer radio">
                                <label>
                                  <input name="94009" onclick="selectOption(id, name)" type="radio" id="94140" value="8" class="ace">
                                  <span class="lbl">6-9</span> </label>
                              </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <div class="dcanswer radio">
                                <label>
                                  <input name="94009" onclick="selectOption(id, name)" type="radio" id="94141" value="11" class="ace">
                                  <span class="lbl">9-12</span> </label>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <div class="dcanswer radio">
                                <label>
                                  <input name="94009" onclick="selectOption(id, name)" type="radio" id="94142" value="12" class="ace">
                                  <span class="lbl">more than 12</span> </label>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    <div class="clearfix list-group-item">
                        <div class="col-lg-4">
                          <label>Do you have any Life Insurance policies? </label>
                        </div>
                        <div class="col-lg-2 clearfix">
                          <div class="dcanswer radio col-xs-6">
                            <label>
                              <input id="lifeYes" value="1" onclick="enableOption(id)" type="radio" name="94013" class="ace"/>
                              <span class="lbl">Yes</span> </label>
                          </div>
                          <div class="dcanswer radio col-xs-6">
                            <label>
                              <input id="lifeNo" value="0" onclick="enableOption(id)" type="radio" name="94013" class="ace"/>
                              <span class="lbl">No</span> </label>
                          </div>
                        </div>
                        <div class="col-lg-3">
                          <label>If yes, how much is the cover? </label>
                        </div>
                        <div class="col-lg-3"> <span class="icn rupee-dark"></span>
                          <input id="94018" name="94018" type="text"  class="form-control common_input answer" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                        </div>
                      </div>
                      <div class="clearfix list-group-item">
                        <div class="col-lg-4">
                          <label>Do you have Health Insurance cover? </label>
                        </div>
                        <div class="col-lg-2 clearfix">
                          <div class="dcanswer radio col-xs-6">
                            <label>
                              <input id="healthYes" value="1" onclick="enableOption(id)" type="radio" name="94020" class="ace"/>
                              <span class="lbl">Yes</span> </label>
                          </div>
                          <div class="dcanswer radio col-xs-6">
                            <label>
                              <input id="healthNo" value="0" onclick="enableOption(id)" type="radio" name="94020" class="ace"/>
                              <span class="lbl">No</span> </label>
                          </div>
                        </div>
                        <div class="col-lg-3">
                          <label>If yes, how much is the cover? </label>
                        </div>
                        <div class="col-lg-3"> <span class="icn rupee-dark"></span>
                          <input id="94019" name="94019" type="text"  class="form-control common_input answer" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                        </div>
                      </div>
                     <div class="clearfix list-group-item">
                        <div class="col-lg-4">
                          <label>Do you have critical illness / accidental disability insurance? </label>
                        </div>
                        <div class="col-lg-2 clearfix">
                          <div class="dcanswer radio col-xs-6">
                            <label>
                              <input id="criticalYes" value="1" onclick="enableOption(id)" type="radio" name="94025" class="ace"/>
                              <span class="lbl">Yes</span> </label>
                          </div>
                          <div class="dcanswer radio col-xs-6">
                            <label>
                              <input id="criticalNo" value="0" onclick="enableOption(id)" type="radio" name="94025" class="ace"/>
                              <span class="lbl">No</span> </label>
                          </div>
                        </div>
                        <div class="col-lg-3">
                          <label>If yes, how much is the cover? </label>
                        </div>
                        <div class="col-lg-3"> <span class="icn rupee-dark"></span>
                          <input id="94024" name="94024" type="text"  class="form-control common_input answer" maxlength="15"  onkeydown="allowIntegersOnly(id,event)"/>
                        </div>
                      </div>
                      <div class="clearfix list-group-item">
                        <div class="col-lg-8">
                          <label>Are all you assets insured for risks like fire / earthquake / theft etc? </label>
                        </div>
                        <div class="col-lg-4 clearfix">
                          <div class="dcanswer radio col-xs-6">
                            <label>
                              <input id="94135_94108" value="1" type="radio" name="94108" class="ace"/>
                              <span class="lbl">Yes</span> </label>
                          </div>
                          <div class="dcanswer radio col-xs-6">
                            <label>
                              <input id="94136_94108" value="0" type="radio" name="94108" class="ace"/>
                              <span class="lbl">No</span> </label>
                          </div>
                        </div>
                      </div>
                      <div class="clearfix list-group-item">
                        <div class="col-lg-8">
                          <label>Is your family aware of all assets you own and loans you have to pay? </label>
                        </div>
                        <div class="col-lg-4 clearfix">
                          <div class="dcanswer radio col-xs-6">
                            <label>
                              <input id="94135_94102" value="1" type="radio" name="94102" class="ace"/>
                              <span class="lbl">Yes</span> </label>
                          </div>
                          <div class="dcanswer radio col-xs-6">
                            <label>
                              <input id="94136_94102" value="0" type="radio" name="94102" class="ace"/>
                              <span class="lbl">No</span> </label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="space-8"></div>
              <div class="widget-box" style="margin-top:10px;">
                <div class="widget-header">
                  <h5 class="widget-title">Your Details</h5>
                </div>
                <div class="widget-body">
                  <div class="widget-main clearfix">
                    <div class="row">
                      <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right" for="salution">Title</label>
                        <div class="col-sm-9">
                          <select name="salutionId" id="salution" class="input-xxlarge">
                          </select>
                        </div>
                      </div>
                     <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right" for="firstname">First Name</label>
                        <div class="col-sm-9">
                          <input type="text" id="firstName" name="firstname" class="input-xxlarge" onkeyup="nospecialCharacters(id,event)" placeholder="First Name"/>
                        </div>
                      </div> 

                    </div>
                    <div class="row">
                      <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right" for="lastname">Last Name<span class="red">*</span></label>
                        <div class="col-sm-9">
                          <input type="text" id="lastName" name="lastName" validate="1" emsg="Last Name" class="input-xxlarge" onkeyup="nospecialCharacters(id,event)" placeholder="Last Name"/>
                          <div id="lastname_error" class="help-block hide">Please provide a valid email.</div>
                        </div>
                      </div>
                      <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right" for="status">Residential Status</label>
                        <div class="col-sm-9">
                          <select name="statusId" id="status" class="input-xxlarge">
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right" for="gender">Gender</label>
                        <div class="col-sm-9">
                          <select name="genderId" id="gender" class="input-xxlarge">
                          </select>
                        </div>
                      </div>
                      <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right" for="dob">Birth Date: <span class="red">*</span></label>
                        <div class="col-sm-9">
                          <input name="dob" type="text" id="dob" validate="date" emsg="Birth Date" class="input-xxlarge dob" placeholder="dd/mm/yyyy" />
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right" for="marital">Marital Status</label>
                        <div class="col-sm-9">
                          <select name="maritalId" id="marital" class="input-xxlarge">
                          </select>
                        </div>
                      </div>
                      <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right" for="occupation">Occupation</label>
                        <div class="col-sm-9">
                          <select name="occupationId" id="occupation" class="input-xxlarge">
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right" for="contactMobile">Mobile No.</label>
                        <div class="col-sm-9">
                          <input type="text" id="contactMobile" name="contactMobile" class="input-xxlarge" onkeydown="allowIntegersOnly(id,event)"/>
                        </div>
                      </div>
                      <div class="form-group col-md-6 clearfix">
                        <label class="col-sm-3 control-label no-padding-right" for="emialId">Email ID:<span class="red">*</span></label>
                        <div class="col-sm-9">
                          <input type="text" id="emialId" name="emailId" validate="email" emsg="Email ID" class="input-xxlarge"/>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="space-8"></div>
              <div class="clearfix"></div>
              <div class="topmenu pull-right">
                <button class="btn-primary btn btn-xs" type="button" name="btn-save" onclick="saveAutoPlanDetails()">Save</button>
		          <a href="#"><button class="btn-primary btn btn-xs" type="button" onclick="doCancel()" name="Cancel">Cancel</button>
		          </a>
		          <button class="btn-primary btn btn-xs" type="button" name="btn-report" onclick="generateReport()">Generate Report & Close</button>
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
    	$('#salution').append('<option value="0">---Select---</option>');
    	$('#status').append('<option value="0">---Select---</option>');
    	$('#gender').append('<option value="0">---Select---</option>');
    	$('#marital').append('<option value="0">---Select---</option>');
    	$('#occupation').append('<option value="0">---Select---</option>');
    	$('#riskProfile').append('<option value="0">---Select---</option>');
        $(function() {
        	
        	$('#94018').attr('disabled','disabled');
        	$('#94019').attr('disabled','disabled');
        	$('#94024').attr('disabled','disabled');
        	
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
                      
                        $(dr1).after($(dr2));
                        $(this).hide();
                     
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
                      
                        var dr1 = $(this).closest('.list-group-item');
                        var dr2 = $(dr1).clone();
                        $(dr2).find('input,select').val("").show();
                       
                        
                        $(dr1).after($(dr2));
                        $(this).hide();
                     
                      
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
        		url : $('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=40,35,26,9,12,13,81,65',
        		success : function(result) {
        	
        			
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
        				}else if(codeTypeId==9){
        					$('#status').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
        				}else if(codeTypeId==12){
        					$('#gender').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
        				}else if(codeTypeId==13){
        					$('#marital').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
        				}else if(codeTypeId==81){
        					$('#salution').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
        				}else if(codeTypeId==65){
        					$('#occupation').append('<option value="'+codevalueId+'">'+codeValue+'</option>');
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
        	        		url : $('#contextPath').val()+'/partner/getQuickDcDetails.htm?partyId='+$('#clientPartyId').val(),
        	        		success : function(result) {
        	        			
        	        			$("#firstName").val(result.firstname);
        	        			$("#lastName").val(result.lastname);
        	        			$("#dob").val(result.dob);
        	        			$("#emialId").val(result.emailId);
        	        				$("#familyMember").val(result.emailId);
        	        				if(!isNaN(parseFloat(result.income).toFixed(0)))
        	        			$("#income").val(parseFloat(result.income).toFixed(0));
        	        			$("#expense").val(parseFloat(result.expense).toFixed(0));
        	        			$("#retirementAge").val(result.retirementAge);
        	        			$("#emergencyMonths").val(result.emergencyMonths);
        	        			$("#contactMobile").val(result.contactNo);
        	        			if(result.riskProfileId == null || result.riskProfileId == "null" || result.riskProfileId == undefined){
        	        				$('select[id="riskProfile"]').val(0);
        	        			}else{
        	        				$('select[id="riskProfile"]').val(result.riskProfileId);	
        	        			}
        	        			$('#city').val(result.city);
        	        			$('#emi').val(result.emi);
        	        			$('#lifeExpectancy').val(result.lifeExpectancy);
        	        			$('#panNo').val(result.panNo);
        	 
        	        			var will = result.will;
        	        		
        	        			if(will == ''){}else
        	        			if(will == 1){
        	        				$("#willYes").attr("checked","checked");
        	        			}else if(will == 0){
        	        				$("#willNo").attr("checked","checked");
        	        			}
        	        			var emermonth = result.emergencyMonths;
        	        			if( emermonth >0 && emermonth <=2 ){
        	        				$('#94138').attr("checked","checked");
        	        			}else if( emermonth >2 &&  emermonth <=5  ){
        	        				$('#94139').attr("checked","checked");
        	        			}else if( emermonth >5 &&  emermonth <=8  ){
        	        				$('#94140').attr("checked","checked");
        	        			}else if( emermonth >8 &&  emermonth <=11  ){
        	        				$('#94141').attr("checked","checked");
        	        			}else if( emermonth >= 12 ){
        	        				$('#94142').attr("checked","checked");
        	        			}
        	        			var expenseValue = result.expense;
        	        			$('#expenseText').val(expenseValue);
        	        			if( expenseValue == 25000 ){
        	        				$('#94162').attr("checked","checked");
        	        			}else if( expenseValue == 37500 ){
        	        				$('#94075').attr("checked","checked");
        	        			}else if( expenseValue == 62500 ){
        	        				$('#94076').attr("checked","checked");
        	        			}else if( expenseValue == 87500 ){
        	        				$('#94077').attr("checked","checked");
        	        			}else if( expenseValue == 100000 ){
        	        				$('#94078').attr("checked","checked");
        	        			}else{
        	        				$('#expenseText').val(expenseValue);
        	        			}
        	        			var incomeValue = result.income;
        	        			$('#moneyText').val(incomeValue);
        	        			if( incomeValue == 300000 ){
        	        				$('#94161').attr("checked","checked");
        	        			}else if( incomeValue == 450000 ){
        	        				$('#94068').attr("checked","checked");
        	        			}else if( incomeValue == 800000 ){
        	        				$('#94069').attr("checked","checked");
        	        			}else if( incomeValue == 1250000 ){
        	        				$('#94070').attr("checked","checked");
        	        			}else if( incomeValue == 1750000 ){
        	        				$('#94071').attr("checked","checked");
        	        			}else if( incomeValue == 2000000 ){
        	        				$('#94072').attr("checked","checked");
        	        			}else{
        	        				$('#moneyText').val(incomeValue);
        	        			}
        	        			$("#monthlyInvesment").val(result.monthlyInvestment);
        	        			if(result.title == null || result.title == "null" || result.title == "NaN" || result.title == ""){
        	        				$('select[id="salution"]').val(0);
        	        			}else{
        	        				$('select[id="salution"]').val(result.title);	
        	        			}
								if(result.residentialStatus == null || result.residentialStatus == "null" || result.residentialStatus == "NaN" || result.residentialStatus == ""){
									$('select[id="status"]').val(0);	
        	        			}else{
        	        				$('select[id="status"]').val(result.residentialStatus);
        	        			}
								if(result.gender == null || result.gender == "null" || result.gender == "NaN" || result.gender == ""){
									$('select[id="gender"]').val(0);	
        	        			}else{
        	        				$('select[id="gender"]').val(result.gender);
        	        			}
								if(result.maritalStatus == null || result.maritalStatus == "null" || result.maritalStatus == "NaN" || result.maritalStatus == ""){
									$('select[id="marital"]').val(0);
        	        			}else{
        	        				$('select[id="marital"]').val(result.maritalStatus);	
        	        			}
								if(result.occupation == null || result.occupation == "null" || result.occupation == "NaN" || result.occupation == "" ){
									$('select[id="occupation"]').val(0);
        	        			}else{
        	        				$('select[id="occupation"]').val(result.occupation);	
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
									'<div class="col-lg-3"><input type="text"  id="lNmae" class="form-control common_input" value="'+name+'"/><input type="hidden" id="familyPartyId" value="'+partyId+'"></div>'+
                                    '<div class="col-lg-3 text-center"><input type="text" id="age" maxlength="2" onkeydown="allowIntegersOnly(id,event)" class="age spinner1" value="'+age+'"/></div>'+
                                    '<div class="col-lg-3">'+relationshipSelect+'</div><div class="col-lg-2 col-actions familyactions" id="actionbuttons'+partyId+'"><div class="icn close" onclick="removeFamilyMember(this)"><span class="fa fa-close"></span></div>'+
 	        						'<span class="common_input3_1"></span></div></div></div>');
									isAnyfamilyMember +=1;
									lastFamilyMemberPartyId = partyId;
									$("#"+partyId+" select").val(relationshipId);
									
								});
        	        			if(isAnyfamilyMember == 0){
        	        				$("#familyMemberDiv").append('<div class="list-group-item"><div class="clearfix row"  id="0">' +
        									'<div class="col-lg-3"><input type="text" id="lNmae" class="form-control common_input"/><input type="hidden" id="familyPartyId" value="0"></div>'+
                                            '<div class="col-lg-3 text-center"><input type="text" id="age" maxlength="2" onkeydown="allowIntegersOnly(id,event)"  class="age spinner1"/></div>'+
                                             '<div class="col-lg-3">'+relationshipSelect+'</div><div class="col-lg-2 col-actions familyactions" id="actionbuttons0"><div class="icn close" onclick="removeFamilyMember(this)"><span class="fa fa-close"></span></div><div id="plusButton" class="icn add" onclick="addFamilyMember()"><span class="fa fa-plus"></span></div>'+
         	        						'<span class="common_input3_1"></span></div></div></div>');
        	        			}else{
        	        				$("#actionbuttons"+lastFamilyMemberPartyId).append('<div id="plusButton" class="icn add" onclick="addFamilyMember()">+</div>');
        	        				
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
                                            '<div class="hidden-lg strong">Goal Type</div><div class="col-lg-3">'+goalTypeSelect+'</div><div class="hidden-lg strong">Goal/Commitment</div><div class="col-lg-3"><input type="text" class="form-control common_input"  id="goalName" value="'+goalName+'" /></div>'+
                                            //'<div class="hidden-lg strong">Goal for</div><div class="col-lg-2">'+familyMemberSelect+'</div>'+
                                            '<div class="hidden-lg strong">Goal Year</div><div class="col-lg-2"><input type="text" class="form-control common_input" maxlength="4" onkeydown="allowIntegersOnly(id,event)" id="goalEndYear" value="'+goalEndYear+'" /></div>'+
                                            '<div class="hidden-lg strong">Amount</div><div class="col-lg-2"><span class="icn rupee-dark"></span><input type="text" id="goalAmountPV" maxlength="15"  onkeydown="allowIntegersOnly(id,event)" class="form-control common_input" value="'+goalAmountPv+'" /></div>'+
                                            '<div class="col-lg-2 col-actions goalActions northspace1" id="actionbuttons'+goalId+'"><div class="icn close eastspace5" onclick="removeGoal(this)"><span class="hidden-lg strong">Close</span><span class="fa fa-close"></span></div>'+                                            
                                             '<span class="common_input3_1"></span></div></div>');
			
									isAnyGoal +=1;
									lastGoalFamilyPartyId = goalId;
									$('#goal'+goalId+' select[id="goalTypeSelect"]').val(goalTypeId);
									//$('#goal'+goalId+' select[id="familyMemberSelect"]').val(goalFamilyPartyId);
									
								});
        	        			if(isAnyGoal == 0){
        	        				$("#pnl-goals").append('<div class="clearfix list-group-item" id="goal0">'+
                                            '<div class="hidden-lg strong">Goal Type</div><div class="col-lg-3 southspace2">'+goalTypeSelect+'</div><div class="hidden-lg strong">Goal/Commitment</div><div class="col-lg-3 southspace2"><input type="text" class="form-control common_input"  id="goalName"  /></div>'+
                                            //'<div class="hidden-lg strong">Goal for</div><div class="col-lg-2 southspace2">'+familyMemberSelect+'</div>'+
                                            '<div class="hidden-lg strong">Goal Year</div><div class="col-lg-2 southspace2"><input type="text" class="form-control common_input" maxlength="4" onkeydown="allowIntegersOnly(id,event)"  id="goalEndYear"  /></div>'+
                                            '<div class="hidden-lg strong">Amount</div><div class="col-lg-2"><span class="icn rupee-dark"></span><input type="text"  id="goalAmountPV" maxlength="15"  onkeydown="allowIntegersOnly(id,event)" class="form-control common_input" /></div>'+
                                            '<div class="col-lg-2 col-actions goalActions northspace1"><div class="icn close eastspace5" onclick="removeGoal(this)"><span class="hidden-lg strong">Close</span><span class="fa fa-close"></span></div><div class="icn add westspace3" id="plusButtonGoal" onclick="addGoal()"><span class="hidden-lg strong">Add</span><span class="fa fa-plus"></span></div>'+                                            
                                             '<span class="common_input3_1"></span></div></div>');
        	        			}else{
        	        					$("#actionbuttons"+lastGoalFamilyPartyId).append('<div id="plusButtonGoal" class="icn add" onclick="addGoal()"><span class="hidden-lg strong">Add</span><span class="fa fa-plus"></span></div>');
        	        				
        	        			}
        	        			
        	        			var partyAttributeDatas=result.partyAttributeDatas;
        	        			$(partyAttributeDatas).each(function(i,obj) {
        	        				var attributeValue=obj.attributeValue;
        	        				var attributeCodeId=obj.attributeCodeId;
        	        				var attributeReferenceValue=obj.attributereferenceValue;
        	        				if(attributeCodeId!=94145 && attributeCodeId!=94148 && attributeCodeId!=94108 && attributeCodeId!=94102 && attributeCodeId!=94092 && attributeCodeId!=94025 && attributeCodeId!=94020 && attributeCodeId!=94013 ){
        	        					$('#'+attributeCodeId).val(parseFloat(attributeValue).toFixed(0));
        	        					if(attributeCodeId==94018){
        	        						if(attributeValue >= 0){
        	        							$('#94018').removeAttr("disabled");
        	        							$('#lifeYes').attr("checked","checked");
        	        						}else{
        	        							$('#lifeNo').attr("checked","checked");
        	        						}
        	        					}
        	        					if(attributeCodeId==94019){
        	        						if(attributeValue >= 0){
        	        							$('#94019').removeAttr("disabled");
        	        							$('#healthYes').attr("checked","checked");
        	        						}else{
        	        							$('#healthNo').attr("checked","checked");
        	        						}
        	        					}
        	        					if(attributeCodeId==94024){
        	        						if(attributeValue >= 0){
        	        							$('#94024').removeAttr("disabled");
        	        							$('#criticalYes').attr("checked","checked");
        	        						}else{
        	        							$('#criticalNo').attr("checked","checked");
        	        						}
        	        					}
        	        				}else if( attributeCodeId==94108 || attributeCodeId==94102 || attributeCodeId==94092 ){
        	        					if( attributeValue == 94135 ){
        	        						$('#'+attributeValue+'_'+attributeCodeId).attr("checked","checked");
        	        					}else{
        	        						$('#'+attributeValue+'_'+attributeCodeId).attr("checked","checked");
        	        					}
        	        				}else if( attributeCodeId==94013 ){
        	        					if( attributeValue == 94135 ){
        	        						$('#lifeYes').attr("checked","checked");	
        	        					}else{
        	        						$('#lifeNo').attr("checked","checked");
        	        					}
        	        				}else if( attributeCodeId==94020 ){
        	        					if( attributeValue == 94135){
        	        						$('#healthYes').attr("checked","checked");	
        	        					}else{
        	        						$('#healthNo').attr("checked","checked");
        	        					}
        	        				}else if( attributeCodeId==94025 ){
        	        					if( attributeValue == 94135){
        	        						$('#criticalYes').attr("checked","checked");	
        	        					}else{
        	        						$('#criticalNo').attr("checked","checked");
        	        					}
        	        				}
        	        				else{
        	        					if(attributeReferenceValue != 'NaN' || attributeReferenceValue != null || attributeReferenceValue != '' || attributeReferenceValue != "" ){
        	        						$('#'+attributeValue).val(parseFloat(attributeReferenceValue).toFixed(0));
        	        					}
        	        				}
								})
        	        			
        	        		}});
        	        		}});
        				
        			
        		}});
        	
        	});
        
        function addFamilyMember(){
        	$('#plusButton').remove();
        	$("#familyMemberDiv").append('<div class="list-group-item"><div class="clearfix row"  id="0">' +
					'<div class="col-lg-3"><input type="text"  id="lNmae" class="form-control common_input"/><input type="hidden" id="familyPartyId" value="0"></div>'+
                    '<div class="col-lg-3 text-center"><input type="text" id="age" maxlength="2" onkeydown="allowIntegersOnly(id,event)"  class="age spinner1"/></div>'+
                     '<div class="col-lg-3">'+relationshipSelect+'</div><div class="col-lg-2 col-actions familyactions" ><div class="icn close" onclick="removeFamilyMember(this)"><span class="fa fa-close"></span></div><div id="plusButton" class="icn add" onclick="addFamilyMember()"><span class="fa fa-plus"></span></div>'+
						'<span class="common_input3_1"></span></div></div></div>');
        }
        
        function selectOption(id, name) {
			$('#'+name).val('');
			var caseIn="";
			if(name=="94074"){
				caseIn="expenseText";
			}
			if(name=="94067"){
				caseIn="moneyText";
			}
			try{			
			var text=$('#'+id+'[name="'+name+'"]').val();
			if(text=='No' || text=='no'){	
				$('#'+id).removeAttr('checked','checked');
			}
			else{
				$('input[id="'+caseIn+'"]').val('');
			}
			$('#'+id).attr('checked','checked');
			}
			catch(e){
				$('#'+id).attr('checked','checked');
			}
			
		}
        
        function test_skillText(id){
        	var checkin = id;
        	if( checkin == "expenseText" ){
        		$('input:radio[name=94074]').each(function () { $(this).prop('checked', false); });
        	}
        	if( checkin == "moneyText" ){
        		$('input:radio[name=94067]').each(function () { $(this).prop('checked', false); });
        	}
        }
        
        function enableOption(id){
        	
        	if(id =="lifeYes"){
        		$('#94018').removeAttr("disabled");
        	}
        	
			if(id =="lifeNo"){
				$('#94018').val('');
				$('#94018').attr('disabled','disabled');       		
			}
			
			if(id =="healthYes"){
				$('#94019').removeAttr("disabled");
			}
			
			if(id =="healthNo"){
				$('#94019').val('');
				$('#94019').attr('disabled','disabled');    		
			}
			
			if(id =="criticalYes"){
				$('#94024').removeAttr("disabled");
			}
			
			if(id =="criticalNo"){
				$('#94024').val('');
				$('#94024').attr('disabled','disabled');
			}
		}
        
        function removeFamilyMember(id){
        	var isPlusRow=0;
        	if($('#plusButton').attr('id')==undefined){
        		isPlusRow=1;
        	}
        	$(id).parent().parent().parent().remove();
        	if(isPlusRow==0){
        		$('.familyactions').last().append('<div id="plusButton" class="icn add" onclick="addFamilyMember()">+</div>');
        	}
    		var cntr=-1;
    			$('.familyactions').each(function(i,obj) {
    				cntr=i;
				});
    		if(cntr==-1){
    			$("#familyMemberDiv").append('<div class="list-group-item"><div class="clearfix row"  id="0">' +
						'<div class="col-lg-3"><input type="text"  id="lNmae" class="form-control common_input"/><input type="hidden" id="familyPartyId" value="0"></div>'+
                        '<div class="col-lg-3 text-center"><input type="text" id="age" maxlength="2" onkeydown="allowIntegersOnly(id,event)" class="age spinner1"/></div>'+
                         '<div class="col-lg-3">'+relationshipSelect+'</div><div class="col-lg-2 col-actions familyactions" id="actionbuttons0"><div class="icn close" onclick="removeFamilyMember(this)"><span class="fa fa-close"></span></div><div id="plusButton" class="icn add" onclick="addFamilyMember()"><span class="fa fa-plus"></span></div>'+
 						'<span class="common_input3_1"></span></div></div></div>');
    		}
        }
        		
        function addGoal(){
        	$('#plusButtonGoal').remove();
        $("#pnl-goals").append('<div class="clearfix list-group-item" id="goal0">'+
                    '<div class="hidden-lg strong">Goal Type</div><div class="col-lg-3">'+goalTypeSelect+'</div><div class="hidden-lg strong">Goal/Commitment</div><div class="col-lg-3"><input type="text" class="form-control common_input"  id="goalName"  /></div>'+
                    //'<div class="hidden-lg strong">Goal for</div><div class="col-lg-2">'+familyMemberSelect+'</div>'+
                    '<div class="hidden-lg strong">Goal Year</div><div class="col-lg-2"><input type="text" class="form-control common_input" maxlength="4" onkeydown="allowIntegersOnly(id,event)"  id="goalEndYear"  /></div>'+
                    '<div class="hidden-lg strong">Amount</div><div class="col-lg-2"><span class="icn rupee-dark"></span><input type="text"  id="goalAmountPV" maxlength="15"  onkeydown="allowIntegersOnly(id,event)" class="form-control common_input" /></div>'+
                    '<div class="col-lg-2 col-actions goalActions northspace1"><div class="icn close eastspace5" onclick="removeGoal(this)"><span class="hidden-lg strong">Close</span><span class="fa fa-close"></span></div><div class="icn add westspace3" id="plusButtonGoal" onclick="addGoal()"><span class="hidden-lg strong">Add</span><span class="fa fa-plus"></span></div>'+
                     '<span class="common_input3_1"></span></div></div>');
        }
        function removeGoal(id){
        	var isPlusRow=0;
        	if($('#plusButtonGoal').attr('id')==undefined){
        		isPlusRow=1;
        	}
        	$(id).parent().parent().remove();
        	if(isPlusRow==0 && $('.goalActions:last').has('#plusButtonGoal').length==0){
        		$('.goalActions').last().append('<div id="plusButtonGoal" class="icn add test" onclick="addGoal()"><span class="hidden-lg strong">Add</span><span class="fa fa-plus"></span></div>');
        	}
    		var cntr=-1;
    			$('.goalActions').each(function(i,obj) {
    				cntr=i;
				});
    		if(cntr==-1){
    			$("#pnl-goals").append('<div class="clearfix list-group-item" id="goal0">'+
    		 '<div class="hidden-lg strong">Goal Type</div><div class="col-lg-3">'+goalTypeSelect+'</div><div class="hidden-lg strong">Goal/Commitment</div><div class="col-lg-3"><input type="text" class="form-control common_input"  id="goalName"  /></div>'+
                        //'<div class="hidden-lg strong">Goal for</div><div class="col-lg-2">'+familyMemberSelect+'</div>'+
                        '<div class="hidden-lg strong">Goal Year</div><div class="col-lg-2"><input type="text" class="form-control common_input" maxlength="4" onkeydown="allowIntegersOnly(id,event)"  id="goalEndYear"  /></div>'+
                        '<div class="hidden-lg strong">Amount</div><div class="col-lg-2"><span class="icn rupee-dark"></span><input type="text" id="goalAmountPV" maxlength="15"  onkeydown="allowIntegersOnly(id,event)" class="form-control common_input" /></div>'+
                        '<div class="col-lg-2 col-actions goalActions northspace1"><div class="icn close eastspace5" onclick="removeGoal(this)"><span class="hidden-lg strong">Close</span><span class="fa fa-close"></span></div><div class="icn add westspace3" id="plusButtonGoal" onclick="addGoal()"><span class="hidden-lg strong">Add</span><span class="fa fa-plus"></span></div>'+                                   
                         '<span class="common_input3_1"></span></div></div>');
    		}
        }
        
        function doCancel(){
        	var client = $('#client').val();
        	if(client == 0){
        		window.location.href= '${pageContext.request.contextPath}/opportunity/getOpportunitiesList.htm';
        	}else{
        		window.location.href= '${pageContext.request.contextPath}/client/getClientList.htm';
        	}
        }
        
        function saveAutoPlanDetails(){
        	var isValidated=true;
        	var selectedVal = "";
        	var selected="";
        	
        	
        	if($('#riskProfile').val() == '' || $('#riskProfile').val() == '0' || $('#riskProfile').val() == null || $('#riskProfile').val() == undefined ){
        		isValidated=false;
        		$('#riskProfile').css('border-color','red');
				 $('#riskProfile').attr('title', '');
        	}
			if($("input[name='94009']:checked").val() == '' || $("input[name='94009']:checked").val() == null || $("input[name='94009']:checked").val() == '0' || $("input[name='94009']:checked").val() == undefined ) {
			 isValidated=false;
		
		
			 $('.emer_94009').css('color','red');
			 
			}else{$('.emer_94009').css('color','black');}
        	if($("input[name='94067']:checked").val() == undefined && $("#moneyText").val()=='' ) {
					 isValidated=false;
					 $("#moneyText").css('border-color','red');
					 $("#moneyText").attr('title', '');
				}					
        	if($("input[name='94074']:checked").val() == undefined && $("#expenseText").val()=="") {
					isValidated=false;
					$("#expenseText").css('border-color','red');
					$("#expenseText").attr('title', '');	 					 
		 		}						
        	if($("input[name='94013']:checked").val() == 1 && $("#94018").val()== "") {
					isValidated=false;
					$('input[name="94018"]').css('border-color','red');
					$('input[name="94018"]').attr('title', '');
		 		}					
        	if($("input[name='94020']:checked").val() == 1 && $("#94019").val()== "") {
					isValidated=false;
					$('input[name="94019"]').css('border-color','red');
					$('input[name="94019"]').attr('title', '');
		 		}					
        	if($("input[name='94025']:checked").val() == 1 && $("#94024").val()== "") {
					isValidated=false;
					$('input[name="94024"]').css('border-color','red');
					$('input[name="94024"]').attr('title', '');					 
		 		}
        	if($('#lastName').val() == ''){
        		isValidated=false;
        		$('#lastName').css('border-color','red');
				 $('#lastName').attr('title', '');
        	}
			if($('#dob').val() == ''){
				isValidated=false;
				$('#dob').css('border-color','red');
				 $('#dob').attr('title', ''); 	
        	}
			if($('#emialId').val() == ''){
				isValidated=false;
				$('#emialId').css('border-color','red');
				 $('#emialId').attr('title', '');
			}
        	if(isValidated==false){
        		showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);	
        	}
					selectedVal = "";
		        	selected="";
		    if(isValidated==true){
        		var dataXML='<Root>';
        		if($('#salution').val() != null || $('#salution').val() != '' || $('#salution').val() != undefined){
        			dataXML+='<Title>'+$('#salution').val()+'</Title>';
        		}else{
        			dataXML+='<Title>'+0+'</Title>';	
        		}
        		dataXML+='<FirstName>'+$('#firstName').val()+'</FirstName>';
        		dataXML+='<LastName>'+$('#lastName').val()+'</LastName>';
        		dataXML+='<DOB>'+$('#dob').val()+'</DOB>';
        		if($('#gender').val() != null || $('#gender').val() != '' || $('#gender').val() != undefined){
        			dataXML+='<Gender>'+$('#gender').val()+'</Gender>';
        		}else{
        			dataXML+='<Gender>'+0+'</Gender>';
        		}
        		if($('#marital').val() != null || $('#marital').val() != '' || $('#marital').val() != undefined){
        			dataXML+='<MaritalStatus>'+$('#marital').val()+'</MaritalStatus>';
        		}else{
        			dataXML+='<MaritalStatus>'+0+'</MaritalStatus>';	
        		}
        		if($('#status').val() != null || $('#status').val() != '' || $('#status').val() != undefined){
        			dataXML+='<ResStatus>'+$('#status').val()+'</ResStatus>';
        		}else{
        			dataXML+='<ResStatus>'+0+'</ResStatus>';	
        		}
        		if($('#occupation').val() != null || $('#occupation').val() != '' || $('#occupation').val() != undefined){
        			dataXML+='<Occupation>'+$('#occupation').val()+'</Occupation>';
        		}else{
        			dataXML+='<Occupation>'+0+'</Occupation>';	
        		}
        		dataXML+='<ContactNo>'+$('#contactMobile').val()+'</ContactNo>';
        		dataXML+='<EmailId>'+$('#emialId').val()+'</EmailId>';
        	
        		if($('#riskProfile').val() != null || $('#riskProfile').val() != '' || $('#riskProfile').val() != undefined){
        			dataXML+='<RiskProfileId>'+$('#riskProfile').val()+'</RiskProfileId>';
        		}else{
        			dataXML+='<RiskProfileId>'+0+'</RiskProfileId>';	
        		}
        		dataXML+='<MonthlyInvesment>'+$('#monthlyInvesment').val()+'</MonthlyInvesment>';
        		dataXML+='<EMI>'+$('#emi').val()+'</EMI>';
        		selected = $("input[name='will']:checked");		
        		if (selected.length > 0) {
        		    selectedVal = selected.val();
        		}
        		dataXML+='<Will>'+selectedVal+'</Will>';
        		dataXML+='<IsSave>'+1+'</IsSave>';
        		dataXML+='</Root>';
        		
        		var partyAttributeDataXML='<Root>';
        		
        		$("#autoPlanForm").find(".answer").each(function (index) {		
        			if($(this).val() != ""){
        				var attrid = $( this ).attr("id");
        				id = "#"+attrid;
        				var attrName= $( this ).attr("name");
        				name=attrName.split('_')[1];
        				if(name != 'undefined') {
        					attributeCodeId = name;
        					attributeValue = attrid;
        					attributereferenceValue = $(id).val();
        				}
        				else {					
        					attributeCodeId = attrid;
        					attributeValue =  $(id).val();
        					attributereferenceValue = $(id).val();
        				}
        				
        			partyAttributeDataXML+='<Data>';
        			partyAttributeDataXML+='<AttributeCodeId>';
        			partyAttributeDataXML+= attributeCodeId;
        			partyAttributeDataXML+='</AttributeCodeId>'
        				
        				partyAttributeDataXML+='<AttributeValue>';
        				partyAttributeDataXML+= attributeValue;
        				partyAttributeDataXML+='</AttributeValue>';
        				
        				partyAttributeDataXML+='<AttributeReferenceValue>';
        				partyAttributeDataXML+= attributereferenceValue;
        				partyAttributeDataXML+='</AttributeReferenceValue>';
        				partyAttributeDataXML+='</Data>';
        			
        			}		
        		});
        		
        		if($("#moneyText").val() == '') {
        			var selectedVal = "";
        			var selected = $("input[name='94067']:checked");
        			var id = $("input[name='94067']:checked").attr('id');
        			if (selected.length > 0) {
        			    selectedVal = selected.val();
        			}			
        			 if(selectedVal != '') {
        				 partyAttributeDataXML+='<Data>';
        				 partyAttributeDataXML+='<AttributeCodeId>';
        				 partyAttributeDataXML+= 94067;
        				 partyAttributeDataXML+='</AttributeCodeId>'
        					
        					 partyAttributeDataXML+='<AttributeValue>';
        					 partyAttributeDataXML+= id;
        					 partyAttributeDataXML+='</AttributeValue>';
        					
        					 partyAttributeDataXML+='<AttributeReferenceValue>';
        					 partyAttributeDataXML+= selectedVal;
        					 partyAttributeDataXML+='</AttributeReferenceValue>';
        					 partyAttributeDataXML+='</Data>';
        			} 
        		}
       			else {
       				partyAttributeDataXML+='<Data>';
       				partyAttributeDataXML+='<AttributeCodeId>';
       				partyAttributeDataXML+= 94067;
       				partyAttributeDataXML+='</AttributeCodeId>'
       			
       					partyAttributeDataXML+='<AttributeValue>';
       					partyAttributeDataXML+= 94067;
       					partyAttributeDataXML+='</AttributeValue>';
       			
       					partyAttributeDataXML+='<AttributeReferenceValue>';
       					partyAttributeDataXML+= $("#moneyText").val();
       					partyAttributeDataXML+='</AttributeReferenceValue>';
       					partyAttributeDataXML+='</Data>';		
        	}
        		
        		if($("#expenseText").val() == '') {
        			var selectedVal = "";
        			var selected = $("input[name='94074']:checked");
        			var id = $("input[name='94074']:checked").attr('id');
        			if (selected.length > 0) {
        			    selectedVal = selected.val();
        			}			
        			 if(selectedVal != '') {
        				 partyAttributeDataXML+='<Data>';
        				 partyAttributeDataXML+='<AttributeCodeId>';
        				 partyAttributeDataXML+= 94074;
        				 partyAttributeDataXML+='</AttributeCodeId>'
        					
        					 partyAttributeDataXML+='<AttributeValue>';
        					 partyAttributeDataXML+= id;
        					 partyAttributeDataXML+='</AttributeValue>';
        					
        					 partyAttributeDataXML+='<AttributeReferenceValue>';
        					 partyAttributeDataXML+= selectedVal;
        					 partyAttributeDataXML+='</AttributeReferenceValue>';
        					 partyAttributeDataXML+='</Data>';
        			} 
        		}
        			else {
        				partyAttributeDataXML+='<Data>';
        				partyAttributeDataXML+='<AttributeCodeId>';
        				partyAttributeDataXML+= 94074;
        				partyAttributeDataXML+='</AttributeCodeId>'
        			
        					partyAttributeDataXML+='<AttributeValue>';
        					partyAttributeDataXML+= 94074;
        					partyAttributeDataXML+='</AttributeValue>';
        			
        					partyAttributeDataXML+='<AttributeReferenceValue>';
        					partyAttributeDataXML+= $("#expenseText").val();
        					partyAttributeDataXML+='</AttributeReferenceValue>';
        					partyAttributeDataXML+='</Data>';
        	}
        		
        		var selectedVal = "";
    			var selected = $("input[name='94008']:checked");
    			var id = $("input[name='94008']:checked").attr('id');
    			if (selected.length > 0) {
    			    selectedVal = selected.val();
    			}			
    			 
    			if(selectedVal != '') {
    				partyAttributeDataXML+='<Data>';
    				partyAttributeDataXML+='<AttributeCodeId>';
    				partyAttributeDataXML+= 94008;
    				partyAttributeDataXML+='</AttributeCodeId>'
    					
    					partyAttributeDataXML+='<AttributeValue>';
    					partyAttributeDataXML+= id;
    					partyAttributeDataXML+='</AttributeValue>';
    					
    					partyAttributeDataXML+='<AttributeReferenceValue>';
    					partyAttributeDataXML+= selectedVal;
    					partyAttributeDataXML+='</AttributeReferenceValue>';
    					partyAttributeDataXML+='</Data>';
    			}
    				
    				var selectedVal = "";
    				var selected = $("input[name='94009']:checked");
    				var id = $("input[name='94009']:checked").attr('id');
    				if (selected.length > 0) {
    				    selectedVal = selected.val();
    				}			
    				if(selectedVal != '') {
    					partyAttributeDataXML+='<Data>';
    					partyAttributeDataXML+='<AttributeCodeId>';
    					partyAttributeDataXML+= 94009;
    					partyAttributeDataXML+='</AttributeCodeId>'
    						
    						partyAttributeDataXML+='<AttributeValue>';
    						partyAttributeDataXML+= id;
    						partyAttributeDataXML+='</AttributeValue>';
    						
    						partyAttributeDataXML+='<AttributeReferenceValue>';													
    						partyAttributeDataXML+= selectedVal;						
    						partyAttributeDataXML+='</AttributeReferenceValue>';
    						partyAttributeDataXML+='</Data>';
    				}	
    					
    					var selectedVal = "";
    					var selected = $("input[name='94013']:checked");
    					var id = $("input[name='94013']:checked").attr('id');
    					var idValue="";
    					if(id == "lifeYes"){
    						idValue = 94135;
    					}else{
    						idValue = 94136;
    					}
    					if (selected.length > 0) {
    					    selectedVal = selected.val();
    					}			
    					if(selectedVal != '') {
    						partyAttributeDataXML+='<Data>';
    						partyAttributeDataXML+='<AttributeCodeId>';
    						partyAttributeDataXML+= 94013;
    						partyAttributeDataXML+='</AttributeCodeId>'
    							
    							partyAttributeDataXML+='<AttributeValue>';
    							partyAttributeDataXML+= idValue;
    							partyAttributeDataXML+='</AttributeValue>';
    							
    							partyAttributeDataXML+='<AttributeReferenceValue>';													
    							partyAttributeDataXML+= selectedVal;						
    							partyAttributeDataXML+='</AttributeReferenceValue>';
    							partyAttributeDataXML+='</Data>';
    						
    					}
    						var selectedVal = "";
    						var selected = $("input[name='94020']:checked");
    						var id = $("input[name='94020']:checked").attr('id');
    						var idValue="";
        					if(id == "healthYes"){
        						idValue = 94135;
        					}else{
        						idValue = 94136;
        					}
    						if (selected.length > 0) {
    						    selectedVal = selected.val();
    						}			
    						if(selectedVal != '') {
    							 partyAttributeDataXML+='<Data>';
    								partyAttributeDataXML+='<AttributeCodeId>';
    								partyAttributeDataXML+= 94020;
    								partyAttributeDataXML+='</AttributeCodeId>'
    								
    								partyAttributeDataXML+='<AttributeValue>';
    								partyAttributeDataXML+= idValue;
    								partyAttributeDataXML+='</AttributeValue>';
    								
    								partyAttributeDataXML+='<AttributeReferenceValue>';													
    								partyAttributeDataXML+= selectedVal;						
    								partyAttributeDataXML+='</AttributeReferenceValue>';
    							partyAttributeDataXML+='</Data>';
    						}	
    							
    							var selectedVal = "";
    							var selected = $("input[name='94025']:checked");
    							var id = $("input[name='94025']:checked").attr('id');
    							var idValue="";
    	    					if(id == "criticalYes"){
    	    						idValue = 94135;
    	    					}else{
    	    						idValue = 94136;
    	    					}
    							if (selected.length > 0) {
    							    selectedVal = selected.val();
    							}			
    							if(selectedVal != '') { 
    								 partyAttributeDataXML+='<Data>';
    									partyAttributeDataXML+='<AttributeCodeId>';
    									partyAttributeDataXML+= 94025;
    									partyAttributeDataXML+='</AttributeCodeId>'
    									
    									partyAttributeDataXML+='<AttributeValue>';
    									partyAttributeDataXML+= idValue;
    									partyAttributeDataXML+='</AttributeValue>';
    									
    									partyAttributeDataXML+='<AttributeReferenceValue>';													
    									partyAttributeDataXML+= selectedVal;						
    									partyAttributeDataXML+='</AttributeReferenceValue>';
    								partyAttributeDataXML+='</Data>';
    							}	
    								
    								var selectedVal = "";
    								var selected = $("input[name='94108']:checked");
    								var id="";
    								if($("input[name='94108']:checked").attr('id') != undefined){
    									id = $("input[name='94108']:checked").attr('id').split("_")[0];	
    								}
    								if (selected.length > 0) {
    								    selectedVal = selected.val();
    								}			
    								if(selectedVal != '') {	 
    									 partyAttributeDataXML+='<Data>';
    										partyAttributeDataXML+='<AttributeCodeId>';
    										partyAttributeDataXML+= 94108;
    										partyAttributeDataXML+='</AttributeCodeId>'
    										
    										partyAttributeDataXML+='<AttributeValue>';
    										partyAttributeDataXML+= id;
    										partyAttributeDataXML+='</AttributeValue>';
    										
    										partyAttributeDataXML+='<AttributeReferenceValue>';													
    										partyAttributeDataXML+= selectedVal;						
    										partyAttributeDataXML+='</AttributeReferenceValue>';
    									partyAttributeDataXML+='</Data>';
    								}		
    								
    								var selectedVal = "";
    								var id="";
    								var selected = $("input[name='94102']:checked");
    								if($("input[name='94102']:checked").attr('id') != undefined){
    									id = $("input[name='94102']:checked").attr('id').split("_")[0];	
    								}
    								if (selected.length > 0) {
    								    selectedVal = selected.val();
    								}			
    								if(selectedVal != '') {	 
    									 partyAttributeDataXML+='<Data>';
    										partyAttributeDataXML+='<AttributeCodeId>';
    										partyAttributeDataXML+= 94102;
    										partyAttributeDataXML+='</AttributeCodeId>'
    										
    										partyAttributeDataXML+='<AttributeValue>';
    										partyAttributeDataXML+= id;
    										partyAttributeDataXML+='</AttributeValue>';
    										
    										partyAttributeDataXML+='<AttributeReferenceValue>';													
    										partyAttributeDataXML+= selectedVal;						
    										partyAttributeDataXML+='</AttributeReferenceValue>';
    									partyAttributeDataXML+='</Data>';
    								}		
    								
    								var selectedVal = "";
    								var id="";
    								var selected = $("input[name='94092']:checked");
    								if($("input[name='94092']:checked").attr('id') != undefined){
    									id = $("input[name='94092']:checked").attr('id').split("_")[0];	
    								}
    								if (selected.length > 0) {
    								    selectedVal = selected.val();
    								}			
    								if(selectedVal != '') {	 
    									 partyAttributeDataXML+='<Data>';
    										partyAttributeDataXML+='<AttributeCodeId>';
    										partyAttributeDataXML+= 94092;
    										partyAttributeDataXML+='</AttributeCodeId>'
    										
    										partyAttributeDataXML+='<AttributeValue>';
    										partyAttributeDataXML+= id;
    										partyAttributeDataXML+='</AttributeValue>';
    										
    										partyAttributeDataXML+='<AttributeReferenceValue>';													
    										partyAttributeDataXML+= selectedVal;						
    										partyAttributeDataXML+='</AttributeReferenceValue>';
    									partyAttributeDataXML+='</Data>';
    								}
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
        				var goalFamilyPartyID=<%=request.getParameter("partyId")%>;//$(obj).contents().find('select[id="familyMemberSelect"]').val();
        				if(goalName!='' || goalEndYear!='' || goalAmountPV!='' || goalTypeId!=0/* || goalFamilyPartyID!=0 */){
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
    	        			goalXML+='<GoalFamilyPartyID>'+goalFamilyPartyID/* $(obj).contents().find('select[id="familyMemberSelect"]').val() */+'</GoalFamilyPartyID>';
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
        		$('#dataXML').val(dataXML);
        		$('#partyAttributeDataXML').val(partyAttributeDataXML);
        		$('#goalXML').val(goalXML);
        		if(isValidated==true){
        			$(".btn").addClass("inactiveLink");
	        	$.ajax({
	        		type : "POST",
	        		url : $('#contextPath').val()+'/partner/saveQuickDcDetails.htm',
	        		data: $('#autoPlanDataForm').serialize(),
	        		success : function(result) {
	        			if(result==1){
	        				showAlertMessage1("Message",
			       					"<br/>Data saved successfully.","confirmation", reloadPage);
			    					 $('.ZebraDialog').css('top','250px');
	    				}
	        		}});
        		}else{
        			showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
        		}
		    }
        }
        function generateReport(){
        	
        	var isValidated=true;
        	var selectedVal = "";
        	var selected="";
        	
        	
        	if($('#riskProfile').val() == '' || $('#riskProfile').val() == '0' || $('#riskProfile').val() == null || $('#riskProfile').val() == undefined ){
        		isValidated=false;
        		$('#riskProfile').css('border-color','red');
				 $('#riskProfile').attr('title', '');
        	}
			if($("input[name='94009']:checked").val() == '' || $("input[name='94009']:checked").val() == null || $("input[name='94009']:checked").val() == '0' || $("input[name='94009']:checked").val() == undefined ) {
			 isValidated=false;
				$('.emer_94009').css('color','red');
			 
			}else{$('.emer_94009').css('color','black');}
        	if($("input[name='94067']:checked").val() == undefined && $("#moneyText").val()=='' ) {
					 isValidated=false;
					 $("#moneyText").css('border-color','red');
					 $("#moneyText").attr('title', '');
				}					
        	if($("input[name='94074']:checked").val() == undefined && $("#expenseText").val()=="") {
					isValidated=false;
					$("#expenseText").css('border-color','red');
					$("#expenseText").attr('title', '');	 					 
		 		}						
        	if($("input[name='94013']:checked").val() == 1 && $("#94018").val()== "") {
					isValidated=false;
					$('input[name="94018"]').css('border-color','red');
					$('input[name="94018"]').attr('title', '');
		 		}					
        	if($("input[name='94020']:checked").val() == 1 && $("#94019").val()== "") {
					isValidated=false;
					$('input[name="94019"]').css('border-color','red');
					$('input[name="94019"]').attr('title', '');
		 		}					
        	if($("input[name='94025']:checked").val() == 1 && $("#94024").val()== "") {
					isValidated=false;
					$('input[name="94024"]').css('border-color','red');
					$('input[name="94024"]').attr('title', '');					 
		 		}
        	if($('#lastName').val() == ''){
        		isValidated=false;
        		$('#lastName').css('border-color','red');
				 $('#lastName').attr('title', '');
        	}
			if($('#dob').val() == ''){
				isValidated=false;
				$('#dob').css('border-color','red');
				 $('#dob').attr('title', ''); 	
        	}
			if($('#emialId').val() == ''){
				isValidated=false;
				$('#emialId').css('border-color','red');
				 $('#emialId').attr('title', '');
			}
        	if(isValidated==false){
        		showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);	
        	}
					selectedVal = "";
		        	selected="";
		    if(isValidated==true){
        		var dataXML='<Root>';
        		if($('#salution').val() != null || $('#salution').val() != '' || $('#salution').val() != undefined){
        			dataXML+='<Title>'+$('#salution').val()+'</Title>';
        		}else{
        			dataXML+='<Title>'+0+'</Title>';	
        		}
        		dataXML+='<FirstName>'+$('#firstName').val()+'</FirstName>';
        		dataXML+='<LastName>'+$('#lastName').val()+'</LastName>';
        		dataXML+='<DOB>'+$('#dob').val()+'</DOB>';
        		if($('#gender').val() != null || $('#gender').val() != '' || $('#gender').val() != undefined){
        			dataXML+='<Gender>'+$('#gender').val()+'</Gender>';
        		}else{
        			dataXML+='<Gender>'+0+'</Gender>';
        		}
        		if($('#marital').val() != null || $('#marital').val() != '' || $('#marital').val() != undefined){
        			dataXML+='<MaritalStatus>'+$('#marital').val()+'</MaritalStatus>';
        		}else{
        			dataXML+='<MaritalStatus>'+0+'</MaritalStatus>';	
        		}
        		if($('#status').val() != null || $('#status').val() != '' || $('#status').val() != undefined){
        			dataXML+='<ResStatus>'+$('#status').val()+'</ResStatus>';
        		}else{
        			dataXML+='<ResStatus>'+0+'</ResStatus>';	
        		}
        		if($('#occupation').val() != null || $('#occupation').val() != '' || $('#occupation').val() != undefined){
        			dataXML+='<Occupation>'+$('#occupation').val()+'</Occupation>';
        		}else{
        			dataXML+='<Occupation>'+0+'</Occupation>';	
        		}
        		dataXML+='<ContactNo>'+$('#contactMobile').val()+'</ContactNo>';
        		dataXML+='<EmailId>'+$('#emialId').val()+'</EmailId>';
        	
        		if($('#riskProfile').val() != null || $('#riskProfile').val() != '' || $('#riskProfile').val() != undefined){
        			dataXML+='<RiskProfileId>'+$('#riskProfile').val()+'</RiskProfileId>';
        		}else{
        			dataXML+='<RiskProfileId>'+0+'</RiskProfileId>';	
        		}
        		dataXML+='<MonthlyInvesment>'+$('#monthlyInvesment').val()+'</MonthlyInvesment>';
        		dataXML+='<EMI>'+$('#emi').val()+'</EMI>';
        		selected = $("input[name='will']:checked");		
        		if (selected.length > 0) {
        		    selectedVal = selected.val();
        		}
        		dataXML+='<Will>'+selectedVal+'</Will>';
        		dataXML+='<IsSave>'+0+'</IsSave>';
        		dataXML+='</Root>';
        		
        		var partyAttributeDataXML='<Root>';
        		
        		$("#autoPlanForm").find(".answer").each(function (index) {		
        			if($(this).val() != ""){
        				var attrid = $( this ).attr("id");
        				id = "#"+attrid;
        				var attrName= $( this ).attr("name");
        				name=attrName.split('_')[1];
        				if(name != 'undefined') {
        					attributeCodeId = name;
        					attributeValue = attrid;
        					attributereferenceValue = $(id).val();
        				}
        				else {					
        					attributeCodeId = attrid;
        					attributeValue =  $(id).val();
        					attributereferenceValue = $(id).val();
        				}
        				
        			partyAttributeDataXML+='<Data>';
        			partyAttributeDataXML+='<AttributeCodeId>';
        			partyAttributeDataXML+= attributeCodeId;
        			partyAttributeDataXML+='</AttributeCodeId>'
        				
        				partyAttributeDataXML+='<AttributeValue>';
        				partyAttributeDataXML+= attributeValue;
        				partyAttributeDataXML+='</AttributeValue>';
        				
        				partyAttributeDataXML+='<AttributeReferenceValue>';
        				partyAttributeDataXML+= attributereferenceValue;
        				partyAttributeDataXML+='</AttributeReferenceValue>';
        				partyAttributeDataXML+='</Data>';
        			
        			}		
        		});
        		
        		if($("#moneyText").val() == '') {
        			var selectedVal = "";
        			var selected = $("input[name='94067']:checked");
        			var id = $("input[name='94067']:checked").attr('id');
        			if (selected.length > 0) {
        			    selectedVal = selected.val();
        			}			
        			 if(selectedVal != '') {
        				 partyAttributeDataXML+='<Data>';
        				 partyAttributeDataXML+='<AttributeCodeId>';
        				 partyAttributeDataXML+= 94067;
        				 partyAttributeDataXML+='</AttributeCodeId>'
        					
        					 partyAttributeDataXML+='<AttributeValue>';
        					 partyAttributeDataXML+= id;
        					 partyAttributeDataXML+='</AttributeValue>';
        					
        					 partyAttributeDataXML+='<AttributeReferenceValue>';
        					 partyAttributeDataXML+= selectedVal;
        					 partyAttributeDataXML+='</AttributeReferenceValue>';
        					 partyAttributeDataXML+='</Data>';
        			} 
        		}
       			else {
       				partyAttributeDataXML+='<Data>';
       				partyAttributeDataXML+='<AttributeCodeId>';
       				partyAttributeDataXML+= 94067;
       				partyAttributeDataXML+='</AttributeCodeId>'
       			
       					partyAttributeDataXML+='<AttributeValue>';
       					partyAttributeDataXML+= 94067;
       					partyAttributeDataXML+='</AttributeValue>';
       			
       					partyAttributeDataXML+='<AttributeReferenceValue>';
       					partyAttributeDataXML+= $("#moneyText").val();
       					partyAttributeDataXML+='</AttributeReferenceValue>';
       					partyAttributeDataXML+='</Data>';		
        	}
        		
        		if($("#expenseText").val() == '') {
        			var selectedVal = "";
        			var selected = $("input[name='94074']:checked");
        			var id = $("input[name='94074']:checked").attr('id');
        			if (selected.length > 0) {
        			    selectedVal = selected.val();
        			}			
        			 if(selectedVal != '') {
        				 partyAttributeDataXML+='<Data>';
        				 partyAttributeDataXML+='<AttributeCodeId>';
        				 partyAttributeDataXML+= 94074;
        				 partyAttributeDataXML+='</AttributeCodeId>'
        					
        					 partyAttributeDataXML+='<AttributeValue>';
        					 partyAttributeDataXML+= id;
        					 partyAttributeDataXML+='</AttributeValue>';
        					
        					 partyAttributeDataXML+='<AttributeReferenceValue>';
        					 partyAttributeDataXML+= selectedVal;
        					 partyAttributeDataXML+='</AttributeReferenceValue>';
        					 partyAttributeDataXML+='</Data>';
        			} 
        		}
        			else {
        				partyAttributeDataXML+='<Data>';
        				partyAttributeDataXML+='<AttributeCodeId>';
        				partyAttributeDataXML+= 94074;
        				partyAttributeDataXML+='</AttributeCodeId>'
        			
        					partyAttributeDataXML+='<AttributeValue>';
        					partyAttributeDataXML+= 94074;
        					partyAttributeDataXML+='</AttributeValue>';
        			
        					partyAttributeDataXML+='<AttributeReferenceValue>';
        					partyAttributeDataXML+= $("#expenseText").val();
        					partyAttributeDataXML+='</AttributeReferenceValue>';
        					partyAttributeDataXML+='</Data>';
        	}
        		
        		var selectedVal = "";
    			var selected = $("input[name='94008']:checked");
    			var id = $("input[name='94008']:checked").attr('id');
    			if (selected.length > 0) {
    			    selectedVal = selected.val();
    			}			
    			 
    			if(selectedVal != '') {
    				partyAttributeDataXML+='<Data>';
    				partyAttributeDataXML+='<AttributeCodeId>';
    				partyAttributeDataXML+= 94008;
    				partyAttributeDataXML+='</AttributeCodeId>'
    					
    					partyAttributeDataXML+='<AttributeValue>';
    					partyAttributeDataXML+= id;
    					partyAttributeDataXML+='</AttributeValue>';
    					
    					partyAttributeDataXML+='<AttributeReferenceValue>';
    					partyAttributeDataXML+= selectedVal;
    					partyAttributeDataXML+='</AttributeReferenceValue>';
    					partyAttributeDataXML+='</Data>';
    			}
    				
    				var selectedVal = "";
    				var selected = $("input[name='94009']:checked");
    				var id = $("input[name='94009']:checked").attr('id');
    				if (selected.length > 0) {
    				    selectedVal = selected.val();
    				}			
    				if(selectedVal != '') {
    					partyAttributeDataXML+='<Data>';
    					partyAttributeDataXML+='<AttributeCodeId>';
    					partyAttributeDataXML+= 94009;
    					partyAttributeDataXML+='</AttributeCodeId>'
    						
    						partyAttributeDataXML+='<AttributeValue>';
    						partyAttributeDataXML+= id;
    						partyAttributeDataXML+='</AttributeValue>';
    						
    						partyAttributeDataXML+='<AttributeReferenceValue>';													
    						partyAttributeDataXML+= selectedVal;						
    						partyAttributeDataXML+='</AttributeReferenceValue>';
    						partyAttributeDataXML+='</Data>';
    				}	
    					
    					var selectedVal = "";
    					var selected = $("input[name='94013']:checked");
    					var id = $("input[name='94013']:checked").attr('id');
    					var idValue="";
    					if(id == "lifeYes"){
    						idValue = 94135;
    					}else{
    						idValue = 94136;
    					}
    					if (selected.length > 0) {
    					    selectedVal = selected.val();
    					}			
    					if(selectedVal != '') {
    						partyAttributeDataXML+='<Data>';
    						partyAttributeDataXML+='<AttributeCodeId>';
    						partyAttributeDataXML+= 94013;
    						partyAttributeDataXML+='</AttributeCodeId>'
    							
    							partyAttributeDataXML+='<AttributeValue>';
    							partyAttributeDataXML+= idValue;
    							partyAttributeDataXML+='</AttributeValue>';
    							
    							partyAttributeDataXML+='<AttributeReferenceValue>';													
    							partyAttributeDataXML+= selectedVal;						
    							partyAttributeDataXML+='</AttributeReferenceValue>';
    							partyAttributeDataXML+='</Data>';
    						
    					}
    						var selectedVal = "";
    						var selected = $("input[name='94020']:checked");
    						var id = $("input[name='94020']:checked").attr('id');
    						var idValue="";
        					if(id == "healthYes"){
        						idValue = 94135;
        					}else{
        						idValue = 94136;
        					}
    						if (selected.length > 0) {
    						    selectedVal = selected.val();
    						}			
    						if(selectedVal != '') {
    							 partyAttributeDataXML+='<Data>';
    								partyAttributeDataXML+='<AttributeCodeId>';
    								partyAttributeDataXML+= 94020;
    								partyAttributeDataXML+='</AttributeCodeId>'
    								
    								partyAttributeDataXML+='<AttributeValue>';
    								partyAttributeDataXML+= idValue;
    								partyAttributeDataXML+='</AttributeValue>';
    								
    								partyAttributeDataXML+='<AttributeReferenceValue>';													
    								partyAttributeDataXML+= selectedVal;						
    								partyAttributeDataXML+='</AttributeReferenceValue>';
    							partyAttributeDataXML+='</Data>';
    						}	
    							
    							var selectedVal = "";
    							var selected = $("input[name='94025']:checked");
    							var id = $("input[name='94025']:checked").attr('id');
    							var idValue="";
    	    					if(id == "criticalYes"){
    	    						idValue = 94135;
    	    					}else{
    	    						idValue = 94136;
    	    					}
    							if (selected.length > 0) {
    							    selectedVal = selected.val();
    							}			
    							if(selectedVal != '') { 
    								 partyAttributeDataXML+='<Data>';
    									partyAttributeDataXML+='<AttributeCodeId>';
    									partyAttributeDataXML+= 94025;
    									partyAttributeDataXML+='</AttributeCodeId>'
    									
    									partyAttributeDataXML+='<AttributeValue>';
    									partyAttributeDataXML+= idValue;
    									partyAttributeDataXML+='</AttributeValue>';
    									
    									partyAttributeDataXML+='<AttributeReferenceValue>';													
    									partyAttributeDataXML+= selectedVal;						
    									partyAttributeDataXML+='</AttributeReferenceValue>';
    								partyAttributeDataXML+='</Data>';
    							}	
    								
    								var selectedVal = "";
    								var selected = $("input[name='94108']:checked");
    								var id="";
    								if($("input[name='94108']:checked").attr('id') != undefined){
    									id = $("input[name='94108']:checked").attr('id').split("_")[0];	
    								}
    								if (selected.length > 0) {
    								    selectedVal = selected.val();
    								}			
    								if(selectedVal != '') {	 
    									 partyAttributeDataXML+='<Data>';
    										partyAttributeDataXML+='<AttributeCodeId>';
    										partyAttributeDataXML+= 94108;
    										partyAttributeDataXML+='</AttributeCodeId>'
    										
    										partyAttributeDataXML+='<AttributeValue>';
    										partyAttributeDataXML+= id;
    										partyAttributeDataXML+='</AttributeValue>';
    										
    										partyAttributeDataXML+='<AttributeReferenceValue>';													
    										partyAttributeDataXML+= selectedVal;						
    										partyAttributeDataXML+='</AttributeReferenceValue>';
    									partyAttributeDataXML+='</Data>';
    								}		
    								
    								var selectedVal = "";
    								var id="";
    								var selected = $("input[name='94102']:checked");
    								if($("input[name='94102']:checked").attr('id') != undefined){
    									id = $("input[name='94102']:checked").attr('id').split("_")[0];	
    								}
    								if (selected.length > 0) {
    								    selectedVal = selected.val();
    								}			
    								if(selectedVal != '') {	 
    									 partyAttributeDataXML+='<Data>';
    										partyAttributeDataXML+='<AttributeCodeId>';
    										partyAttributeDataXML+= 94102;
    										partyAttributeDataXML+='</AttributeCodeId>'
    										
    										partyAttributeDataXML+='<AttributeValue>';
    										partyAttributeDataXML+= id;
    										partyAttributeDataXML+='</AttributeValue>';
    										
    										partyAttributeDataXML+='<AttributeReferenceValue>';													
    										partyAttributeDataXML+= selectedVal;						
    										partyAttributeDataXML+='</AttributeReferenceValue>';
    									partyAttributeDataXML+='</Data>';
    								}		
    								
    								var selectedVal = "";
    								var id="";
    								var selected = $("input[name='94092']:checked");
    								if($("input[name='94092']:checked").attr('id') != undefined){
    									id = $("input[name='94092']:checked").attr('id').split("_")[0];	
    								}
    								if (selected.length > 0) {
    								    selectedVal = selected.val();
    								}			
    								if(selectedVal != '') {	 
    									 partyAttributeDataXML+='<Data>';
    										partyAttributeDataXML+='<AttributeCodeId>';
    										partyAttributeDataXML+= 94092;
    										partyAttributeDataXML+='</AttributeCodeId>'
    										
    										partyAttributeDataXML+='<AttributeValue>';
    										partyAttributeDataXML+= id;
    										partyAttributeDataXML+='</AttributeValue>';
    										
    										partyAttributeDataXML+='<AttributeReferenceValue>';													
    										partyAttributeDataXML+= selectedVal;						
    										partyAttributeDataXML+='</AttributeReferenceValue>';
    									partyAttributeDataXML+='</Data>';
    								}
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
        				var goalFamilyPartyID=<%=request.getParameter("partyId")%>;//$(obj).contents().find('select[id="familyMemberSelect"]').val();
        				if(goalName!='' || goalEndYear!='' || goalAmountPV!='' || goalTypeId!=0 /*||  goalFamilyPartyID!=0 */){

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
    	        			goalXML+='<GoalFamilyPartyID>'+goalFamilyPartyID/* $(obj).contents().find('select[id="familyMemberSelect"]').val() */+'</GoalFamilyPartyID>';
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
        		$('#dataXML').val(dataXML);
        		$('#partyAttributeDataXML').val(partyAttributeDataXML);
        		$('#goalXML').val(goalXML);
        		if(isValidated==true){
        		$(".btn").addClass("inactiveLink");
	        	$.ajax({
	        		type : "POST",
	        		url : $('#contextPath').val()+'/partner/saveQuickDcDetails.htm',
	        		data: $('#autoPlanDataForm').serialize(),
	        		success : function(result) {
		       			$.ajax({
				    	     type : "POST",
				    	     url : $('#contextPath').val()+'/dc/submitDcInput.htm?isAnalysisReportGenration=true'+'&isActionPlanGeneration=true'+'&analysisReportType='+386,
				    	     data :  $('form').serialize(), 
				    	     success : function(result) {
				    	    	 if($('#client').val()==0)
				    	    	 	localStorage.setItem('actionName',$('#contextPath').val()+'/opportunity/getOpportunitiesList.htm');
				    	    	 else
				    	    		 localStorage.setItem('actionName',$('#contextPath').val()+'/client/getClientList.htm');
				    	    	 showAlertMessage1("Message",
					       					"<br/>Reports will generate in 5 mins.","confirmation", redirectFunction);
					    					 $('.ZebraDialog').css('top','250px');
							}});
	        		}});
	        	}else{
        			showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
        		}
        	}
       }
        </script>
        <%
		int partyId=Integer.parseInt(request.getParameter("partyId"));
       
        String name=request.getParameter("name");
        int client=Integer.parseInt(request.getParameter("client"));
        int buId=Integer.parseInt(request.getParameter("buId"));
		%>
        <form id="autoPlanDataForm">
          <input type="hidden" id="partyAttributeDataXML" name="partyAttributeDataXML">
          <input type="hidden" id="familyMemberDataXML" name="familyMemberDataXML">
          <input type="hidden" id="goalXML" name="goalXML">
          <input type="hidden" id="dataXML" name="dataXML">
          <input type="hidden" id="clientPartyId" name="clientPartyId" value="<%=partyId%>">
          <input type="hidden" id="client" name="client" value="<%=client%>">
          <%-- <input type="hidden" id="clientStage" name="clientStage" value="<%=stage%>"> --%>
          <input type="hidden" id="clientNameLabel" name="clientName" value="<%=name%>">
          <input type="hidden" id="dcInputPartyId" name="dcInputPartyId" value="<%=partyId%>" >
          <input type="hidden" id="dcInputBuId" name="dcInputBuId" value="<%=buId%>" >
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
<input id="baseServerURL" value="<%=serverPath%>" type="hidden">
<input type="hidden" id="usernamefromsession" value="${sessionScope.userSession.userName}"/>
</body>
</html>