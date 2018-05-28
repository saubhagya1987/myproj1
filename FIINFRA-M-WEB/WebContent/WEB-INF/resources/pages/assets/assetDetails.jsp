<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
<meta name="viewport" content="width=1024">
<link rel="shortcut icon" href="../images/favicon.ico" />
<script>
$(document).ready(function(){
  	$( "#tabs" ).tabs();
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
	 });
</script>
<!-- Custom Selectbox Ends -->


<!-- custom scroll to "common_in_content" -->
<script>
$(document).ready(function(){
	//$( "#tabs" ).tabs({ active: 1 });
	//alert($( "#tabs" ).tabs( "option", "active" ));
	/* $( "#tabs" ).tabs({
  activate: function( event, ui ) {
	 // alert(ui);
	  if($( "#tabs" ).tabs( "option", "active" ) == 1){
			alert('1');
		}else{
			alert('2');
		}
  }
});  */

    $('.asset_details_bx').slimScroll();
  });
	
</script>
<form:form id="assetDetails" method="POST" action="${pageContext.request.contextPath}/assets/assetDetails">
<!-- custom scroll to "common_in_content" -->
<section class="common_in_content auto_plan_in clearfix" id="my_assets"> 
      
    <div style="padding:10px 10px 0;">
    <div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
        <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
        <li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="tabs-1" aria-labelledby="ui-id-1" aria-selected="true"><a href="#tabs-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">Bank Deposit</a></li>
        <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-2" aria-labelledby="ui-id-2" aria-selected="false"><a href="#tabs-2" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2">Retirement Fund</a></li>
        <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-3" aria-labelledby="ui-id-3" aria-selected="false"><a href="#tabs-3" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-3">Mutual Fund</a></li>
        <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-4" aria-labelledby="ui-id-4" aria-selected="false"><a href="#tabs-4" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-4">Gold</a></li>
        <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-5" aria-labelledby="ui-id-5" aria-selected="false"><a href="#tabs-5" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-5">Property</a></li>
        <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-6" aria-labelledby="ui-id-6" aria-selected="false"><a href="#tabs-6" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-6">Stock</a></li>
      </ul>
        <div id="tabs-1" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-1" role="tabpanel" aria-expanded="true" aria-hidden="false"> 
        
          <div class="submit_btn fr" id = "addMoreBankDeposit">Add More</div>
        
        
        <div class="asset_details_bx">
        <c:if test="${fn:length(assetBankDepositsList) > 0}">
        <!--title starts-->
        <div class="my_fd_title_main_title">Fixed Deposits</div>
        <div class="my_fd_title_bx">
            <ul class="clearfix head_title">
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Asset Name</li>
            <li class="input_title_three fl">Bank Name</li>
            <li class="input_title_four fl">A/C No.</li>
            <li class="input_title_five fl">Commcemnt Date</li>
            <li class="input_title_six fl">Amount Deposited</li>
            <li class="input_title_eight_two fl">Maturity Date</li>
            <li class="input_title_nine fl">Maturity Value</li>
            <li class="input_title_ten fl">Interest Rate</li>
            <li class="input_title_eleven fl">No. of Goals</li>
            <li class="input_title_telwe fl">Edit</li>
            <li class="input_title_thirteen fl">Delete</li>
            
          
          </ul>
          </div>
        <!--title ends--> 
        <!--txt starts-->
        <div class="my_fd_li_bx ">
        
        <c:forEach var="asset" items="${assetBankDepositsList}">
            <div class="my_fd_li_bx_in">
            <ul>
                <li class="input_txt_one fl"><span class="name">Harish Kachoria</span></li>
                <li class="input_txt_two fl">${asset.assetName}</li>
                <li class="input_txt_three fl">SBI</li>
                <li class="input_txt_four fl">${asset.accountNo}</li>
                <li class="input_txt_five fl">${asset.investmentDate}</li>
                <li class="input_txt_six fl">${asset.investmentValue} </li>
                <li class="input_txt_seven fl">29-Sep-2015</li>
                <li class="input_txt_eight fl">${asset.maturityValue}</li>
                <li class="input_txt_nine fl"><span class="value">12</span>%</li>
                <li class="input_txt_ten fl">5</li>
                <li class="input_txt_eleven fl"><a href="" class="my_asset_edit_row" > </a></li>
                <li class="input_txt_telwe fl"><a href="" class="my_asset_delete_row"> </a></li>
               
                
                
               
           
               
                <div class="clr"></div>
              </ul>
            <!-- txt ends--> 
            
          </div>
 
         </c:forEach> 
        
 
          
          </div>
        </c:if>
        <!--*----------Recurring Deposits--------------*-->
        <div class="my_fd_title_main_title">Recurring Deposits</div>
        <!--title starts-->
        <div class="my_rd_title_bx">
            <ul class="clearfix head_title">
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Asset Name</li>
            <li class="input_title_three fl">Bank Name</li>
            <li class="input_title_four fl">A/C No.</li>
            <li class="input_title_five fl">Commcemnt Date</li>
            <li class="input_title_six fl">Amount Deposited</li>
            <li class="input_title_eight_two fl">Maturity Date</li>
            <li class="input_title_nine fl">Maturity Value</li>
            <li class="input_title_ten fl">Interest Rate</li>
            <li class="input_title_eleven fl">No. of Goals</li>
            <li class="input_title_telwe fl">Edit</li>
            <li class="input_title_thirteen fl">Delete</li>
            
          
          </ul>
          </div>
        
        <!--title ends--> 
        <!--txt starts-->
        <div class="my_rd_li_bx first_row">
        	
            <div class="my_rd_li_bx_in">
            <ul>
                <li class="input_txt_one fl"><span class="name">Harish Kachoria</span></li>
                <li class="input_txt_two fl">Property</li>
                <li class="input_txt_three fl">SBI</li>
                <li class="input_txt_four fl">20071310238</li>
                <li class="input_txt_five fl">12-Jan-2010 </li>
                <li class="input_txt_six fl">30,000 </li>
                <li class="input_txt_seven fl">29-Sep-2015</li>
                <li class="input_txt_eight fl">45,000</li>
                <li class="input_txt_nine fl"><span class="value">12</span>%</li>
                <li class="input_txt_ten fl">5</li>
                <li class="input_txt_eleven fl"><a href="" class="my_asset_edit_row"> </a></li>
                <li class="input_txt_telwe fl"><a href="" class="my_asset_delete_row"> </a></li>
               
                
                
               
           
               
                <div class="clr"></div>
              </ul>
          </div>

          </div>
        
        <!-- txt ends--> 
        
        <!--*----------Savings Account--------------*-->
        <div class="my_fd_title_main_title">Savings </div>
        <!--title starts-->
        <div class="my_savings_title_bx clearfix">
            <ul class="clearfix head_title">
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Asset Name</li>
            <li class="input_title_three fl">Bank Name</li>
            <li class="input_title_four fl">A/C No.</li>
            
            <li class="input_title_ten fl">Interest Rate</li>
            <li class="input_title_eleven fl">No. of Goals</li>
            <li class="input_title_telwe fl">Edit</li>
            <li class="input_title_thirteen fl">Delete</li>
            
          
          </ul>
          </div>
        <!--title ends--> 
        <!--txt starts-->
        <div class="my_savings_li_bx first_row">
        	
            <div class="my_savings_li_bx_in">
            <ul>
                <li class="input_txt_one fl"><span class="name">Harish Kachoria</span></li>
                <li class="input_txt_two fl">Property</li>
                <li class="input_txt_three fl">SBI</li>
                <li class="input_txt_four fl">20071310238</li>
                <li class="input_txt_nine fl"><span class="value">12</span>%</li>
                <li class="input_txt_ten fl">5</li>
                <li class="input_txt_eleven fl"><a href="" class="my_asset_edit_row"> </a></li>
                <li class="input_txt_telwe fl"><a href="" class="my_asset_delete_row"> </a></li>
               
                
                
               
           
               
                <div class="clr"></div>
              </ul>
            <!-- txt ends--> 
          </div>
	
            <div class="my_savings_li_bx_in">
            <ul>
                <li class="input_txt_one fl"><span class="name">Harish Kachoria</span></li>
                <li class="input_txt_two fl">Property</li>
                <li class="input_txt_three fl">SBI</li>
                <li class="input_txt_four fl">20071310238</li>
                <li class="input_txt_nine fl"><span class="value">12</span>%</li>
                <li class="input_txt_ten fl">5</li>
                <li class="input_txt_eleven fl"><a href="" class="my_asset_edit_row"> </a></li>
                <li class="input_txt_telwe fl"><a href="" class="my_asset_delete_row"> </a></li>
               
                
                
               
           
               
                <div class="clr"></div>
              </ul>
            <!-- txt ends--> 
          </div>
	
          </div>
        
        <!-- txt ends--> 
        
        
        
        <div class="clr"></div>
        
      </div> </div>
        <!-- Tabs 1 Ends--> 
        
        <!-- Tabs 2-->
        <div id="tabs-2" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-2" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;"> 
        
        <div class="submit_btn fr" id = "addMoreRetirementFund">Add More</div>
        
        <div class="asset_details_bx">
        <!--title starts-->
        <div class="my_ppf_title_main_title">Public Provident Fund (PPF)</div>
        <c:if test="${fn:length(assetRetirementFundsList) > 0}">
        <div class="my_ppf_title_bx">
            <ul class="clearfix head_title">
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Asset Name</li>
            <li class="input_title_three fl">Maturity Date</li>
            <li class="input_title_four fl">Accumulated Amount</li>
            <li class="input_title_five fl">Annual contribution</li>
            <li class="input_title_six fl">Interest Rate</li>
            <li class="input_title_eight_two fl">Current Balance</li>
          
            <li class="input_title_ten fl">No. of Goals</li>
            <li class="input_title_telwe fl">Edit</li>
            <li class="input_title_thirteen fl">Delete</li>
            
          
          </ul>
          </div>
        <!--title ends--> 
        <!--txt starts-->
        <div class="my_ppf_li_bx first_row">
        
        <c:forEach var="asset" items="${assetRetirementFundsList}">
            <div class="my_ppf_li_bx_in">
            <ul class="clearfix">
                <li class="input_txt_one fl"><span class="name">Harish Kachoria</span></li>
                <li class="input_txt_two fl">${asset.assetName}</li>
                <li class="input_txt_three fl">${asset.maturityValue}</li>
                <li class="input_txt_four fl">30,000 </li>
                <li class="input_txt_five fl">30,000 </li>
                <li class="input_txt_six fl"><span>12</span>%</li>
                <li class="input_txt_seven fl">45,000</li>
             
                <li class="input_txt_nine fl">5</li>
                <li class="input_txt_ten fl"><a href="" class="my_asset_edit_row"> </a></li>
                <li class="input_txt_eleven fl"><a href="" class="my_asset_delete_row"> </a></li>
               
               
                
                
               
           
               
                
              </ul>
            <!-- txt ends--> 
            
          </div>
         </c:forEach>
          </div>
        
        <!--*----------Employees Provident Funds --------------*-->
        
        <!--title starts-->
        
        
        <!--title ends--> 
        <!--txt starts-->
        
        
        <!-- txt ends--> 
       
        
        <div class="clr"></div>
        </c:if>
      </div>
      </div>
        <!-- Tabs 2 Ends--> 
        
        <!-- Tabs 3-->
        <div id="tabs-3" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-3" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;"> 
        
          <div class="submit_btn fr" id = "addMoreMutualFund">Add More</div>
        <!--title starts-->
           <div class="asset_details_bx">
           <c:if test="${fn:length(assetMutualFundsList) > 0}">
        <div class="my_mf_title_bx">
            <ul>
            <li class="input_title_one fl">Fund Scheme</li>
            <li class="input_title_two fl">Asset Mgnt. Comp.</li>
            <li class="input_title_three fl">Folio Number</li>
            <li class="input_title_four fl">Start Date</li>
            <li class="input_title_five fl">SIP Amount</li>
            <li class="input_title_six fl">End Date</li>
             <li class="input_title_six_two fl">Frequency</li>
            <li class="input_title_seven fl">No. of Units</li>
            <li class="input_title_eight fl">Current Value</li>
            <li class="input_title_nine fl">Edit</li>
            <li class="input_title_ten fl">Delete</li>
           
            <div class="clr"></div>
          </ul>
          </div>
        <!--title ends--> 
        
        <!--*----------Mutual Funds --------------*-->
        
        <div class="my_mf_li_bx first_row">
        
            <!--txt starts-->
            <c:forEach var="asset" items="${assetMutualFundsList}">
            <div class="my_mf_li_bx_in">
            <ul>
                <li class="input_txt_one fl">IDFC Dynamic Equity Fund</li>
                <li class="input_txt_two fl">IDFC Mutual Fund</li>
                <li class="input_txt_three fl">30-4015-009-0020</li>
                <li class="input_txt_four fl">21,000</li>
                <li class="input_txt_five fl">12-Jan-2010</li>
                <li class="input_txt_six fl">12-Jan-2011</li>
                <li class="input_txt_six_two fl">10</li>
                <li class="input_txt_seven fl">100</li>
                <li class="input_txt_eight fl">40,000</li>
                <li class="input_txt_nine fl"><a href="" class="my_asset_edit_row"> </a></li>
                <li class="input_txt_ten fl"><a href="" class="my_asset_delete_row"> </a></li>
                
                
               
              
               
              </ul>
              <div class="clr"></div>
          </div>
          </c:forEach>  
         
            <!--txt starts-->
            
            
         
          </div>
          
         
        
        <div class="clr"></div>
        </c:if>
      </div>
      </div>
        <!-- Tabs 3 Ends--> 
        
        <!-- Tabs 4--> 
        <!--*----------Gold --------------*-->
        <div id="tabs-4" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-4" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;"> 
         <div class="submit_btn fr" id = "addMoreGold">Add More</div>
        <!--title starts-->
           <div class="asset_details_bx">
        <div class="my_gold_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Item Description</li>
            <li class="input_title_three fl">Amount Investment</li>
            <li class="input_title_three_two fl">Current Value</li>
            
            <li class="input_title_four fl">No. of Goals</li>
             <li class="input_title_five fl">Edit</li>
             <li class="input_title_six fl">Delete</li>
           
            <div class="clr"></div>
          </ul>
          </div>
        <!--title ends-->
        
        <div class="my_gold_li_bx first_row"> 
        <div class="white_bg">
        
        
            <!--txt starts-->
            
            <div class="my_gold_li_bx_in">
            
            <ul>
                <li class="input_txt_one fl">Harish Kachoria </li>
                <li class="input_txt_two fl">Lorem ipsum dolor sit amet</li>
                <li class="input_txt_three fl">50,000</li>
                <li class="input_txt_three_two fl">60,000</li>
                <li class="input_txt_four fl">6</li>
                <li class="input_txt_five fl"><a href="" class="my_asset_edit_row"> </a> </li>
                <li class="input_txt_six fl"><a href="" class="my_asset_delete_row"> </a> </li>
               
              </ul>
          
            <!-- txt ends--> 
            <div class="clr"></div>
         </div> 
        
          </div>
          </div>
    
        
        <div class="clr"></div>
          </div></div>
        
        <!--*----------Gold Ends --------------*--> 
        <!-- Tabs 4 Ends--> 
        
        <!-- Tabs 5--> 
        <!--*----------Property --------------*-->
        <div id="tabs-5" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-5" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;"> 
         <div class="submit_btn fr" id = "addMoreProperty">Add More</div>
         <div class="clr"></div>
        <!--title starts-->
        
        <div class="my_property_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Property Name</li>
            <li class="input_title_three fl">Year Brought In</li>
            <li class="input_title_four fl">Growth Rate</li>
            
            <li class="input_title_five fl">Property Value</li>
             <li class="input_title_six fl">No. of Goals</li>
             <li class="input_title_seven fl">Edit</li>
              <li class="input_title_eight fl">Delete</li>
            
            <div class="clr"></div>
          </ul>
          </div>
        <!--title ends-->
        
        <div class="my_property_li_bx first_row">
         <div class="white_bg">
        
            <!--txt starts-->
            
            
            <div class="my_property_li_bx_in">
            <ul>
                <li class="input_txt_one fl">Harish Kachoria </li>
                <li class="input_txt_two fl">Bungalow</li>
                <li class="input_txt_three fl">12-Jan-2010</li>
                 <li class="input_txt_four fl"><span>12</span>%</li> 
                 <li class="input_txt_five fl">12,00,00,000</li> 
                 <li class="input_txt_six fl">12</li>  
                <li class="input_txt_seven fl"><a href="" class="my_asset_edit_row"> </a> </li>
                <li class="input_txt_eight fl"><a href="" class="my_asset_delete_row"> </a> </li>
               
              </ul>
          
            <!-- txt ends--> 
            
             <div class="clr"></div>
            
          </div>
          
          </div>
          </div>
     
        
        <div class="clr"></div>
        
          </div>
        
        <!--*----------Property Ends --------------*--> 
        <!-- Tabs 5 Ends--> 
        
        <!-- Tabs 6--> 
        <!--*----------Property --------------*-->
        <div id="tabs-6" class="tab_border ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-6" role="tabpanel" aria-expanded="false" aria-hidden="true" style="display: none;"> 
           <div class="submit_btn fr" id = "addMoreStock">Add More</div>
         <div class="clr"></div>
        <!--title starts-->
           <div class="asset_details_bx">
        <div class="my_stock_title_bx">
            <ul>
            <li class="input_title_one fl">Owner</li>
            <li class="input_title_two fl">Stock Name</li>
            <li class="input_title_three fl">Institute Name</li>
            <li class="input_title_four fl">Investment Date</li>
            <li class="input_title_four_two fl">Investment Amount</li>
            <li class="input_title_five fl">Quantity</li>
             <li class="input_title_six fl">Current Value</li>
             <li class="input_title_seven fl">No. of Goals</li>
             <li class="input_title_eight fl">Edit</li>
             <li class="input_title_nine fl">Delete</li>
            
            <div class="clr"></div>
          </ul>
          </div>
        <!--title ends-->
        
      
        <div class="my_stock_li_bx first_row"> 
            <div class="white_bg"> 
             <!--txt starts-->
            <div class="my_stock_li_bx_in">
            <ul>
                <li class="input_txt_one fl">Harish Kachoria</li>
                <li class="input_txt_two fl">Kotak Mahindra Bank Ltd</li>
                <li class="input_txt_three fl">Kotak Mahindra</li>
                <li class="input_txt_four fl">12-Jan-2010</li>
                <li class="input_txt_four_two fl">10,000</li>
                <li class="input_txt_five fl">10</li>
                <li class="input_txt_six fl">12,0000</li>
                <li class="input_txt_seven fl">10</li>
              
                <li class="input_txt_nine fl"><a href="#" class="my_asset_edit_row"> </a> </li>
                <li class="input_txt_ten fl"><a href="#" class="my_asset_delete_row"> </a></li>
            <div class="clr"></div>
              </ul>
          </div>
            <!-- txt ends--> 
            
            <!--txt starts-->
            <div class="my_stock_li_bx_in">
            <ul>
                <li class="input_txt_one fl">Harish Kachoria</li>
                <li class="input_txt_two fl">Kotak Mahindra Bank Ltd</li>
                <li class="input_txt_three fl">Kotak Mahindra</li>
                <li class="input_txt_four fl">12-Jan-2010</li>
                <li class="input_txt_four_two fl">10,000</li>
                <li class="input_txt_five fl">10</li>
                <li class="input_txt_six fl">12,0000</li>
                <li class="input_txt_seven fl">10</li>
              
                <li class="input_txt_nine fl"><a href="#" class="my_asset_edit_row"> </a> </li>
                <li class="input_txt_ten fl"><a href="#" class="my_asset_delete_row"> </a></li>
            <div class="clr"></div>
              </ul>
          </div>
            <!-- txt ends--> 
            
            <!--txt starts-->
            <div class="my_stock_li_bx_in">
            <ul>
                <li class="input_txt_one fl">Harish Kachoria</li>
                <li class="input_txt_two fl">Kotak Mahindra Bank Ltd</li>
                <li class="input_txt_three fl">Kotak Mahindra</li>
                <li class="input_txt_four fl">12-Jan-2010</li>
                <li class="input_txt_four_two fl">10,000</li>
                <li class="input_txt_five fl">10</li>
                <li class="input_txt_six fl">12,0000</li>
                <li class="input_txt_seven fl">10</li>
              
                <li class="input_txt_nine fl"><a href="#" class="my_asset_edit_row"> </a> </li>
                <li class="input_txt_ten fl"><a href="#" class="my_asset_delete_row"> </a></li>
            <div class="clr"></div>
              </ul>
          </div>
            <!-- txt ends--> 
            <div class="clr"></div>
          </div>  </div>
          
         
        
        <div class="clr"></div>
        
      </div></div>
        
        <!--*----------Stock Ends --------------*--> 
        <!-- Tabs 6 Ends--> 
        
      </div>
    <!-- end of "contents" id -->
    
    
  </div>
        <!-- inside goal page class-->
        
        
        
        
        
        
        
        
        
        

        
        <!--Assets Starts--> 
        
        
        
        
        
        
        
        
      </section>
      </form:form>
      <!-- Common_in_contnet ends--> 
      <div class="overlay"></div>
    </section>
    <script type="text/javascript">
    $("#addMoreBankDeposit").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addBankDeposits');
		$("#assetDetails").submit();
    	});
    $("#addMoreRetirementFund").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addRetirementFunds');
		$("#assetDetails").submit();
    	});
    $("#addMoreMutualFund").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addMutualFunds');
		$("#assetDetails").submit();
    	});
    $("#addMoreGold").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addGolds');
		$("#assetDetails").submit();
    	});
    $("#addMoreProperty").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addProperties');
		$("#assetDetails").submit();
    	});
    $("#addMoreStock").click(function(){
    	$('#assetDetails').attr('action', '${pageContext.request.contextPath}/assets/addStocks');
		$("#assetDetails").submit();
    	});
	</script>