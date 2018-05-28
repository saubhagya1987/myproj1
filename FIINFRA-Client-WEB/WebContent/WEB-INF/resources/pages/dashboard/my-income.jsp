
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.cp.IncomeData"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>

<script type="text/javascript">

/* var data = ${graphData}; */
var data = ${incomeData};
$("#graphBorder").hide();
    </script>
<% 
    List<IncomeData> lstIncome = (List<IncomeData>) request.getAttribute("lstIncome");
	 List<CodeValueData> incomeTypes= (List<CodeValueData>) request.getAttribute("incomeTypes");
	 List<CodeValueData> freqTypes =(List<CodeValueData>) request.getAttribute("freqList");
      %> 
    
 <script>
 var checkPopupRedirect=true;
  function showPasswordPopup(src){
	
	  $('#add_income').dialog('open');
	  $(".ui-dialog-titlebar-close").hide();
  }
 
  $(document).ready(function(){
	  
	  $('#add_income').dialog({
		    autoOpen: false,
		    closeOnEscape: false,
		    dialogClass:'',
			width:'auto',
			height:'auto',
			minHeight: 80,
			modal: true,
			title:"Add Income",
			 buttons: {
			
			        "Submit": function() {
			        	saveIncome();
			        },
			        "Cancel": function() { cancleClick();}
			      }
		});  

	    
  });
  function cancleClick(){
	 	 
	  $('#add_income').dialog('close');
}
  
  function getIncomeData(){
	  var i = 0;
	   var chartData=[];
	   
	 $("#incomerow").each(function( ) {
		 
	  var value = $(this).find("#incomeAmount").text();
	 // var type = $(this).find("#incomeTypeId").val();
	  var name = $(this).find("#incomeName").text();
	  var freq = $(this).find("#incomeFrequencyId").text();
	  chartData[i] = [];
	  chartData[i][0] = name;
	  chartData[i][1] = calculateAmountYearly(toNumber(value)*1000,freq);
	  chartData[i][2] = freq;
	   i++;
	 });
	 /* alert(JSON.stringify(chartData)); */ 
	 return chartData;

	 }
  
 /* function showGraph(){	  
	 
	 var data =  getIncomeData();
	 if(data[0][1]>0){
		 $("#nodata").hide();
		 $("#incomeTable").show();
		 drawChart(data);	 
	 }
	 else{
		 $("#incomeTable").hide();
		 $("#inner-contents-graph").hide();
		 $("#nodata").show();
  }
	// drawChart(data);
} */

function showGraph(){
	  
	  var data =  getIncomeData();
	  if(data[0][1]>0){
	   $("#nodata").hide();
	   drawChart(data);  
	  }
	  else{
	   $(".nt_income").hide();
	   $("#inner-contents-graph").hide();
	   $("#nodata").show();
	  }
	 // drawChart(data);
	 }

  function saveIncomes(){
	  var data = $('#income_form').serialize();
	  /* alert(('#income_form').serialize()); */
		// $(form).closest(".my_income_li_bx").addClass("loading");
		 //$("body").addClass("loading");
		 $.ajax(
				    {
				        url : "${pageContext.request.contextPath}/financial/myIncome/save",
				        type: "POST",
				        dataType: 'json',
				        data : data,
				        success:function(data, textStatus, jqXHR)
				        {	
				        	//$(form).closest(".my_income_li_bx").removeClass("loading");
				        	if(del){
				        		$(form).closest(".my_income_li_bx").remove();
				        		showMessage('Income Record Deleted.',false);	
				        	}
				        	else{
				        		$(form).find('[name=partyIncomeId]').val(data);
				        		showMessage('Income Record Saved.',false);
				        	}
				        	calculate();
			        	
				        }
				       /* , error: function(jqXHR, textStatus, errorThrown)
				        {
				        	$("body").removeClass("loading");
				        	showMessage('Error While Saving.',true);
				        	calculate();
				        } */
				    });

	  
  }
  </script>
<script>
  function communicateIFA(){
	  
	  
 /*  showConfirm("Are you sure; you want to communicate amount change to your IFA?", function() {
		window.location.href="${pageContext.request.contextPath}/portfolio/sendToIFA?ifa=income"; */
		
		bootbox.confirm("Are you sure; you want to communicate amount change to your IFA?", function(result) {
			if(result==true)
				{
				window.location.href="${pageContext.request.contextPath}/portfolio/sendToIFA?ifa=income";
				}
			else
				{
				
				}
			  /* Example.show("Confirm result: "+result); */
			}); 
		
	
  }
  </script> 

<script>

var showGraphPage = <%=request.getParameter("graph") != null ?"true":"false"%>;


function createIncomeSlider(){
	$(".my_income_li_bx").each(function() {
		var div = $(this).find('div[id=amountSlider]');
		var input = $(this).find('input[name=incomeAmount]');
		//var incomeType = $(this).find("[name='incomeTypeId']").val();
		createSlider(div,0,500,1,input);

	});
}



$(document).ready(function(){
	
	
	//$("select").selectBoxIt();
	//createIncomeSlider();
	
    $(".data-graph-income").slider({
        min: 1,
        max: 2,
        step: 1,
        slide: function (event, ui) {
            //$("#data-graph .ui-slider-handle").empty();
            if (ui.value == 1) {
            	$(".add-income-btn").show();
            	$("#data-graph .ui-slider-handle").css("margin-left", "2px");
                //$("#data-graph .ui-slider-handle").css("margin-left", "2px");
                $("#data-graph .ui-slider-handle").text("Data");
                $("#inner-contents-graph").hide();
                $("#inner_contents_my_income_data").show();
                $("#incomeTable").show();
                
			
            } else if (ui.value == 2) {
            	$(".add-income-btn").hide();
            	//$("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").text("Graph");
               $("#inner-contents-graph").show();
               $("#incomeTable").hide();
               
               showGraph();

               //RenderPieChart('container', data); 
            }
        }
    });
    
    
    
    if(!showGraphPage){
        $("#data-graph .ui-slider-handle").text("Data");
        $("#data-graph .ui-slider-handle").css("margin-left", "2px");
        $("#inner-contents-graph").hide();
        
    }
    else{
       $(".add-income-btn").hide();
       $("#data-graph .ui-slider-handle").text("Graph");
       $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
       $("#inner-contents-graph").show();
       $("#inner_contents_my_income_data").hide();
       $(".data-graph-income").slider('value',2);
       showGraph();
    }
	

/* 	$('.required').each(function() {
		$(this).rules('add', {
		required:true
			});
	});
 */
	
  });

</script> 
<script>

function drawChart() {
	  /* alert(JSON.stringify(data)); */
	    var options = {
	      backgroundColor: { fill:'transparent' },
	      width:550,
	      height:400,
	      colors:GRAPH_COLORS,
	      legend : {width:100, textStyle: {fontSize: 12}},
	      pieSliceText: 'percentage',
	      chartArea: { left: 150, top: 10, width: "80%", height: "100%"},
	        backgroundColor: { stroke: "#5A5A5A", strokeWidth: 2},

	        // add this line
	        pieSliceBorderColor : "#5A5A5A"
	    };
	    /* showGooglePieChart('Expense',expenseData,options2,'flotcontainer-expenses-savings'); */
	    showGooglePieChart('Income',data,options,'inner-contents-graph');
	    
	  }

	jQuery(function($) {
		$('#loading-btn').on(ace.click_event, function () {
			var btn = $(this);
			btn.button('loading')
			setTimeout(function () {
				btn.button('reset')
			}, 2000)
			});
	
		$('#id-button-borders').attr('checked' , 'checked').on('click', function(){
			$('#default-buttons .btn').toggleClass('no-border');
			if(this.checked)
				{
				$("#graphBorder").hide();
				$("#inner-contents-graph").hide();
				$("#sample-table-1").show();
				}
			else
				{
				$("#sample-table-1").hide();
				$("#graphBorder").show();
				$("#inner-contents-graph").show();
				drawChart();
				}
		});
	})

</script>
    
 <div class="sen_msg_txt fl">You have declared <span class="fa fa-inr fa-2x sen_msg "><%=request.getAttribute("dcIncome")!=null?CommonUtils.formatAmountINR((Double)request.getAttribute("dcIncome")):"0" %></span> <span class="sen_msg_txtm">per year</span> of  <span class="sen_msg_bld">Total Income</span> in Financial Plan </div>&nbsp;
   <a href="#" class="btn-primary btn-xs btn" onclick="communicateIFA()"> Communicate change in amount to your IFA</a>
     <!--  <div id="data-graph-bx">
      <div id="data-graph" class="common_sliding_radio data-graph-income"><span class="lbl_first lbl">Data</span><span class="lbl_second lbl">Graph</span></div>
      <div class="clr"></div>
      
      div id="data-graph-margin" style="position:relative; z-index:2;top: -22px;left: 7px; opacity:0.0;"><span class="lbl_first lbl"><a  href="#">Data</a></span><span class="lbl_second lbl"><a  href="${pageContext.request.contextPath}/financial/income/graph>Graph</a></span></div
      <div class="clr"></div>
      
      
    </div> -->
    
    
    
 <div class="topmenu pull-right"> 
 <a href="${pageContext.request.contextPath}/financial/myIncome/addUpdate" class="btn-primary btn-xs btn">Add Income</a></div>
 <br><br>   
 <span class="col-sm-1 fr"> <label class="pull-right inline">
		 <input	id="id-button-borders" checked="" type="checkbox" class="ace ace-switch ace-switch-5" /> <span class="lbl middle"></span>
	</label>
	</span>

<div class="row">
	<div id="graphBorder" class="col-xs-12" style="display: none">
		<div class="col-md-3"></div>
		<div class="col-md-5">
			<!-- <div class="widget-box"> -->
			<div id="inner-contents-graph"></div>
			<!-- </div> -->
		</div>
	</div>
</div>


<%
	if (!lstIncome.isEmpty()) {
%> 
 <div id="incomeTable">
     <table id="sample-table-1"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<!-- <th class="hidden-480 center">Income Category</th> -->
												<th class=" ">Income Type</th>
												<th class=" ">Amount</th>
												<th class=" ">Period</th>
												<th class=" ">Expected Growth</th>
												<th class=" ">Actions</th>
											</tr>
										</thead>
										
								 		<tbody>
											<% for(IncomeData n:lstIncome){%>
											<tr id="incomerow">
												<%-- <td class=" "><%=CommonUtils.emptyIfNull(n.getIncomeType()) %></td> --%>
												<td id="incomeName" class=""><%=n.getIncomeName() %></td>
												<td id="incomeAmount" class=" "><%=CommonUtils.formatAmountINR(n.getIncomeAmount(),true) %></td>
												<td id="incomeFrequencyId"class=" "><%=n.getIncomeFrequency() %></td>
												<td><%=n.getAnnualGrowth() %></td>
												<td><div>
             
													
														<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit" href="${pageContext.request.contextPath}/financial/myIncome/addUpdate?incomeId=<%=n.getPartyIncomeId()%>">
															
															</a>&nbsp;&nbsp;
												

														
														<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete" href="${pageContext.request.contextPath}/financial/income/delete?incomeId=<%=n.getPartyIncomeId() %>" onclick="return myConfirm(this.href);" >
															</a>&nbsp;&nbsp;
														

														
														<a class="fa fa-question fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Add Query" href="${pageContext.request.contextPath}/query/add?refTypeId=111013&<%=BaseRequest.encode("returnUrl", "/financial/myIncome")%>&refId=&refId=<%=n.getPartyIncomeId() %>">
															</a>&nbsp;&nbsp;
														
															
														<a class="icon-add-notes fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Add Notes" href="${pageContext.request.contextPath}/notes/note?refTypeId=111013&<%=BaseRequest.encode("returnUrl", "/financial/myIncome")%>&refId=<%=n.getPartyIncomeId() %>">
															</a>
															
														<%-- <button class="btn btn-xs btn-success">
														<a href="${pageContext.request.contextPath}/notes/note?refTypeId=111013&<%=BaseRequest.encode("returnUrl", "/financial/myIncome")%>&refId='+partyIncomeId">
															<i class="ace-icon fa fa-flag-o btn-xs "></i></a>
														</button> --%>
            </div></td>
																									
              
											
												
											</tr>
											
											<%}%> 
											</tbody> 
									</table>
									
									 <div class="fr">
  
   
       <div class="pull-left label label-lg arrowed-in-right arrowed-in hidden-xs"> <span>Net Income:</span>

                  <div class="fa fa-inr" id = "totalMonthly"><%=request.getAttribute("totalIncome") %></div>

          <span>per year</span></div>
    </div>
	</div>
	<%}else{ %>
<div id="nodata">
  <div class="clr"></div>
     <div class="no_data_message">There is no Income Defined by you</div>
  
  
  </div>	
  <% } %>
  					
		