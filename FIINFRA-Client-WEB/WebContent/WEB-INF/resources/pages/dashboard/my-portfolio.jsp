
<!-- Custom Selectbox starts -->
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="in.fiinfra.common.utility.GoalData"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.cp.AssetData"%>
<script src="${pageContext.request.contextPath}/resources/js/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/exporting.js"></script>
<script>
$(document).ready(function(){
	
	var data = ${graphData};
    $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
    });
</script>
<!-- Custom Selectbox Ends -->

<script>
$(document).ready(function () {
    /* Equity*/
    $("#inner_contents_my_portfolio_data #div_dragger").click(function () {
    	var parent =  $(this).closest('.my_portfolio_li_bx');
    	//$(parent).next('.list_bx').fadeToggle("slow");
      //  $(".equity_list_bx").FadeIn("slow");
        var listBx = $(this).closest('.my_portfolio_li_bx').find("#list_bx");
        $(listBx).fadeToggle("slow");
       });
    
    
    $(".data-graph-portfolio").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            //$("#data-graph .ui-slider-handle").empty();
            if (ui.value == 1) {
            	$("#data-graph .ui-slider-handle").css("margin-left", "2px");
                //$("#data-graph .ui-slider-handle").css("margin-left", "2px");
                $("#data-graph .ui-slider-handle").text("Data");
                $("#inner-contents-graph").hide();
                $("#inner_contents_my_portfolio_data").show();
			
            } else if (ui.value == 2) {
            	$("#data-graph .ui-slider-handle").css("margin-left", "-46px");
               //$("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").text("Graph");
               $("#inner-contents-graph").show();
               $("#inner_contents_my_portfolio_data").hide();
               //RenderPieChart('grapth_container', data);
               drawChart();
            }
        }
    });
    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
    $("#data-graph .ui-slider-handle").text("Data");
    $("#inner-contents-graph").hide();
	

/* 	$('.required').each(function() {
		$(this).rules('add', {
		required:true
			});
	});
 */
	
  });


</script>
<script type="text/javascript">

function drawChart() {
	  
    var options = {
      
      backgroundColor: { fill:'transparent' },
      pieSliceText: 'percentage',
      width:600,
      height:400,
      colors:GRAPH_COLORS,
          
    };
    
    showGooglePieChart('Portfolio',data,options,'grapth_container');

  }


       
       var data = ${graphData};
</script>
 

  <div id="header-strip" class="fl">
    <h3 class="clearfix fl"><span class="title_it">MY PORTFOLIO</span></h3>
        <jsp:include page="../menu.jsp"></jsp:include>
    	<a href="${pageContext.request.contextPath}/portfolio/myLoan" class="my-loan-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Loan</a>
    	<a href="${pageContext.request.contextPath}/portfolio/myAssets" class="my-asset-btn clearfix fr"><img src="${pageContext.request.contextPath}/resources/images/transparent.png" />My Assets</a>
  </div>
  
  <!-- end of "header-strip" id -->
  
  <div id="inner-shadow-strip"></div>
  <!-- end of "inner-shadow-strip" id -->
  <% 
  long currentValTotal=(Long)request.getAttribute("currentValTotal");
  long netInvestment=(Long)request.getAttribute("netInvestment");

  %>
  
  <div id="contents"  class="my_portfolio">
    <div id="data-graph-bx">
      
      <div id="data-graph" class="common_sliding_radio data-graph-portfolio ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false"> <span class="lbl_first lbl">Data</span> <span class="lbl_second lbl">Graph</span> <a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 0%; margin-left: 2px;">Data</a></div>
     
      <div class="clr"></div>
    </div>
        <div id="inner-contents-graph" class="clearfix fl">
        	
        	<div class="margin-box clearfix fl">
      	  
           <div id="grapth_container" style="min-width: 500px; height: 500px; margin: 0 auto"></div>
                <div class="net-income clearfix fl" >
                	<span class="txt clearfix fl">Net Investment :</span>
                    <img class ="rs clearfix fl" src="${pageContext.request.contextPath}/resources/images//transparent.png">
                    <span class="digit clearfix fl"><%=CommonUtils.formatAmountINR(netInvestment,true) %></span>
                    <span class="txt clearfix fl"></span>
                </div><!-- end of "net-expenses" class -->
           </div>     
        </div><!-- end of "margin-box" class --> 
    <div id="inner_contents_my_portfolio_data"> 
      <%
      	List<AssetData> lstAsset=(List<AssetData>)request.getAttribute("assetList");

      int previous=0;
      if(lstAsset==null || lstAsset.isEmpty()){ %>
    	  
		<div class="no_data_message">No Record found</div>
    <%  }
      else{
      %>
      
      <!--title starts-->
      <div class="my_portfolio_title_bx">
        <ul>
          <li class="input_title_one fl"><img name="" src="" width="1" height="1" alt=""></li>
          <li class="input_title_two fl">Asset Class /<br/>
            Product Name</li>
          <li class="input_title_three fl">Invested Amount</li>
          <li class="input_title_four fl">Current Value</li>
          <li class="input_title_five fl">CAGR</li>
          <li class="input_title_six fl">Linked Goals</li>
          <li class="input_title_seven fl"></li>
          <div class="clr"></div>
        </ul>
      </div>
      <!--title ends--> 
      <!--txt starts-->
            <%   for(AssetData a:lstAsset) { 
     %>
			
	      
	      <%if( previous!=a.getAssetTypeId()){ %>
	      <% if(previous !=0){ %>
	       </div>
	       </div>
	      <%} %>
	      <div class="my_portfolio_li_bx">
       <div class="my_portfolio_li_bx_grey_in">
          <ul>
            <li class="input_txt_one fl">
              <div class="<%=CommonUtils.retriveCssClassFromCodeValue(a.getAssetType(), "icon") %>"></div>
            </li>
            <li class="input_txt_two fl"><%=a.getAssetType() %></li>
            <li class="input_txt_three fl">
              <div class="my_plan_rupee"><%=CommonUtils.formatAmountINR(a.getInvestmentValue()) %></div>
            </li>
            <li class="input_txt_four fl"> <%=CommonUtils.formatAmountINR(a.getCurrentValue()) %> </li>
            <% double growth = 0d;
    		NumberFormat f = DecimalFormat.getInstance();
    		f.setMaximumFractionDigits(2);
    		f.setMinimumFractionDigits(2);

             if(a.getInvestmentValue() != 0){
            	 growth = Math.round(((a.getCurrentValue() - a.getInvestmentValue())/a.getInvestmentValue())*100); 
             }
            %>
            <li class="input_txt_five fl"> <%=f.format(growth) %>%</li>
            
            <% if(a.getGoals() != null && !a.getGoals().isEmpty()){ for (GoalData goal:a.getGoals()){%>
           
            <li class="input_txt_six fl icon_small_<%=goal.getGoalTypeId() %>">  </li>
            <%}}else{%>
            <li class="input_txt_six fl ">  </li>
            <%} %>
            <li class="input_txt_ten fl">
              <div id = "div_dragger" class="<%=a.getAssetType()%>_div_dragger">Details</div>
            </li>
            <div class="clr"></div>
          </ul>
          <!-- txt ends--> 
          </div>
        <div class="equity_list_bx   list_bx" id = "list_bx">
        <%}else{ %>
      
        
          <div class="my_portfolio_li_bx_in">
            <ul>
              <li class="input_txt_one fl"> <img name="" src="" width="1" height="1" alt=""> </li>
              <li class="input_txt_two fl"><%=StringUtils.left(a.getAssetName(),15) %></li>
              <li class="input_txt_three fl">
                <div class="my_plan_rupee"><%=CommonUtils.formatAmountINR(a.getInvestmentValue()) %></div>
              </li>
              <li class="input_txt_four fl"> <%=CommonUtils.formatAmountINR(a.getCurrentValue()) %> </li>
              <li class="input_txt_five fl"> <%=a.getPerformanceCAGR()!=0 ? Long.toString(a.getPerformanceCAGR()):"-" %> </li>
              
               <%int index=0;
               for(GoalData g:a.getGoals()){ %> 
               <%if(!StringUtils.isEmpty(g.getGoalTypeName()) && index<=4) {%>
              <li class="input_txt_six fl"> <a href="#" class="<%=CommonUtils.retriveCssClassFromCodeValue(g.getGoalTypeName(), "") %>"> </a> </li> 
              <!-- <li class="input_txt_six fl"> <a href="#" class="delete_row"> </a> </li>
               <li class="input_txt_seven fl"><a href="#" class="add_doc"> </a></li>
              <li class="input_txt_eight fl"><a href="#" class="add_query"> </a></li>
              <li class="input_txt_nine fl"><a href="#" class="success_icon"> </a></li>  -->
              <%} %>
               <%index++; } %> 
              <li class="input_txt_ten fl"><img name="" src="" width="1" height="1" alt=""></li>
              <div class="clr"></div>
            </ul>
            <!-- txt ends--> 
            
          </div>
        <%} %>
      
      <%
      previous=a.getAssetTypeId();
      } 
      }
      %>
      </div>
      </div>
      <div class="nt_income">
        <div class="total-asset-value"> <span>Current Value:</span>
          <div class="total-value rupee"><%=CommonUtils.formatAmountINR(currentValTotal,true) %></div>
          <span class="unit dynamic"></span></div>
      </div>
      <div class="nt_income">
        <div class="total-asset-value"> <span>Net Investment :</span>
          <div class="total-value rupee"><%=CommonUtils.formatAmountINR(netInvestment,true) %></div>
          <span class="unit dynamic"></span></div>
      </div>
    </div>
    <!-- end of "inner-contents" id --> 
  
 
  <!-- end of "contents" id -->
