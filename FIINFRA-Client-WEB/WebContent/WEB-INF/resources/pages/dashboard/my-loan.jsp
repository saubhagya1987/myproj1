
<%@page import="in.fiinfra.cp.LoanData"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.cp.IncomeData"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>

<script type="text/javascript">
			jQuery(function($) {
			
				window.prettyPrint && prettyPrint();
				$('#id-check-horizontal').removeAttr('checked').on('click', function(){
					$('#dt-list-1').toggleClass('dl-horizontal').prev().html(this.checked ? '&lt;dl class="dl-horizontal"&gt;' : '&lt;dl&gt;');
				});
			
			})
		</script>
<script type="text/javascript">

var data = ${loanGraph};
var leaving = true;


//google.setOnLoadCallback(drawChart);
   function drawChart(graphData) {
    	  
	   var chartData = [];
  	 chartData[0] = [];
  	 chartData[0][0] = 'label';
  	 chartData[0][1] = 'Value';
  	 
  	 for(var i=0;i<graphData.length;i++){
  		 chartData[i+1] = [];
  		 chartData[i+1][0] = graphData[i]["label"];
  		 chartData[i+1][1] = graphData[i]["data"];
  		
  	 }
  	 
      	var options = {
        title: 'My Loan',
        backgroundColor: { fill:'transparent' },
        width:600,
        height:400,
        colors:GRAPH_COLORS,
        legend : { textStyle: {fontSize: 12}},
        pieSliceText: 'percentage',
        chartArea: { left: 150, top: 10, width: "80%", height: "100%"},
        backgroundColor: { stroke: "#5A5A5A", strokeWidth: 2},

        // add this line
        pieSliceBorderColor : "#5A5A5A"
        
      };
     
     var graph = google.visualization.arrayToDataTable(chartData);
     var formatter = new google.visualization.NumberFormat(
    	      {pattern: 'Rs ##,###'});
    formatter.format(graph, 1); 
     var chart = new google.visualization.PieChart(document.getElementById('container'));
     chart.draw(graph, options);

      }
    </script>
<% 
     List<LoanData> lstLoan = (List<LoanData>) request.getAttribute("loanData");
	List<CodeValueData> loanTypes= (List<CodeValueData>) request.getAttribute("loanTypes");
      %> 
<script>

var loanTypes = [];
		<% for (int i=0; i<loanTypes.size(); i++) { 
		 CodeValueData cv = loanTypes.get(i);
		%>
		loanTypes[<%= cv.getCodeValueId() %>] = [];
		loanTypes[<%= cv.getCodeValueId() %>][0] = "<%= StringUtils.isEmpty(cv.getMappedValue1())?0:cv.getMappedValue1() %>";
		loanTypes[<%= cv.getCodeValueId() %>][1] = "<%= StringUtils.isEmpty(cv.getMappedValue2())?500:cv.getMappedValue2() %>";
		loanTypes[<%= cv.getCodeValueId() %>][2] = "<%= CommonUtils.getCssClassFromCodeValue(cv.getCodeValue(), "") %>";
		<% } %>
      
		function attachAllControls(){
			$(".my_portfolio_li_bx:not(.dummy)").each(function( element) {
				attachControls($(this));
			});
		}
		
		function attachControls(form){
			
			/* $(form).find("[name='loanTypeId']").selectBoxIt();
			$(form).find("[name='emiFreqId']").selectBoxIt(); */
			
			//createSlider(divSlider,incomeTypes[incomeType][0],incomeTypes[incomeType][1],1,input);

			$(form).find("[name='emiFreqId']").change(function() {
				  calculate();
			});
			$(form).find("[name='emiAmount']").change(function() {
				  calculate();
			});

			$(form).find("[name='loanTypeId']").change(function() {
				 var val = $(this).val();
			
				 $(form).find("#typeIcon").removeAttr("class").addClass("icon_"+val);
			});

		}


//}

$(document).ready(function(){
	
	attachAllControls();
   // $("select").selectBoxIt();
	 // Calls the selectBoxIt method on your HTML select box
	 
	
  $("body").on("click", ".add-income-btn", function() {
	  var newIndex = 0;
	  for(var i=1;i<100;i++){
		  if(!$('#loanDiv_'+i).length){
			  newIndex = i;
			  break;
		  }
	  }
	  var id = "loanDiv_"+newIndex;
	  var html = '';
	  
	  html += '<div id="'+id+'" class="my_portfolio_li_bx " >';
	  html += $("#loanDiv_0").html();
	  html += '</div>';
	
	  $( ".my_portfolio_title_bx" ).after( html );
	  
	  //$(".my_portfolio_title_bx").append(html);
	  var div = $("#"+id);
	  
	  attachControls(div.find('form'));
	  ensureData();
  });
	 
  /* if(!$('#loanDiv_1').length){
	  $("#loanDiv_0").show();
  }	  */
	
  $('body').on('change keyup keydown', 'input, textarea, select', function (e) {
	    $(this).addClass('changed-input');
	});
	
	$(window).on('beforeunload', function (e) {
		
	    if ( $('.changed-input').length) {
	        return 'You haven\'t saved your changes.';
	    }
	});	  
  
  

	$("body").on("click", ".save_row", function() {
		
		/* var validator = $("#profile-form").validate();
		  validator.resetForm(); */
		  $('.changed-input').removeClass('changed-input');
		
		var form = $(this).closest("form");
		  
		  if( validateLoanForm(form)){
			  
			  $(form).find('.changed-input').removeClass('changed-input');
			  save(form);
		  }
		  //if(validateIncomeForm){

			
				
		//}
	});
	$('body').on('change keyup keydown', 'input, textarea, select', function (e) {
	    $(this).addClass('changed-input');
	});
	$(window).on('beforeunload', function () {
	    if ( $('.changed-input').length) {
	        return 'You haven\'t saved your changes.';
	    }
	});
$("body").on("click", ".add_query", function() {
		var form = $(this).closest("form");
		var partyLoanId =  $(form).find('[name=partyLoanId]').val();
		if(partyLoanId >0){
			window.location = '${pageContext.request.contextPath}/query/add?refTypeId=111013&<%=BaseRequest.encode("returnUrl", "/portfolio/myLoan")%>&refId='+partyLoanId;	
		}
		else{
			showMessage('Please Save Record First !!!',false);
		}
		
			
	});

	$("body").on("click", ".add_doc", function() {
		
		var form = $(this).closest("form");
		var partyLoanId =  $(form).find('[name=partyLoanId]').val();
		if(partyLoanId >0){
			window.location = '${pageContext.request.contextPath}/notes/note?refTypeId=111013&<%=BaseRequest.encode("returnUrl", "/portfolio/myLoan")%>&refId='+partyLoanId;	
		}
		else{
			showMessage('Please Save Record First !!!',false);
		}
	});


	$("body").on("click", ".delete_row", function() {
		/* $('.changed-input').removeClass('changed-input');
		if(($(this).closest(".my_portfolio_li_bx").hasClass("dummy"))){
			$(this).closest(".my_portfolio_li_bx").hide();
			return;
		}
		var form = $(this).closest("form");
		showConfirm("Delete Current Loan Record ?", function() {
			var partyLoanId =  $(form).find('[name=partyLoanId]').val();
			if(partyLoanId && partyLoanId >0){
				$(form).find('[name=action]').val('del');
				$(form).submit();
			}
		}); */
		
	$(this).closest(".my_portfolio_li_bx").removeClass('changed-input');
		
		var div = $(this).closest(".my_portfolio_li_bx");
		var form = $(this).closest("form");
		var partyLoanId =  $(form).find('[name=partyLoanId]').val();
		
		showConfirm("Delete Current Record ?", function() {
			
			if(partyLoanId && partyLoanId >0){
				$(form).find('[name=action]').val('del');
				save($(form));
			}
			else{
				$(div).remove();
				ensureData();
			}
		});
	});
	

	
	
	
	function save(form){
		 var del = $(form).find('[name=action]').val() == 'del';
		 var data = $(form).serialize();
		 $("body").addClass("loading");
		 
		 $.ajax(
				    {
				        url : "${pageContext.request.contextPath}/portfolio/myLoan/save",
				        type: "POST",
				        dataType: 'json',
				        data : data,
				        success:function(data, textStatus, jqXHR)
				        {	
				        	$("body").removeClass("loading");
				        	if(del){
				        		$(form).closest(".my_portfolio_li_bx").remove();
				        	}
				        	else{
				        		$(form).find('[name=partyLoanId]').val(data);
				        		showMessage('Loan Record Saved.',false);
				        	}
				        	ensureData();			        	
				        	//scores[index] = data.score;
				        },
				        error: function(jqXHR, textStatus, errorThrown)
				        {
				        	$("body").removeClass("loading");
				        	alert(errorThrown); 
				        }
				    });

		 
	 }
	
	

	 
 });
 
function showGraph(){
	
	 //var data =  getLoanData();
	 if(data){
	 if(data[0]){
		 $("#nodata").hide();
		 drawChart(data);
	 }
	 else{
		 $(".nt_income").hide();
		 $("#inner-contents-graph").hide();
		 $("#nodata").show();
		
		 
	 }
	 } 
}


function calculate(){
	var data =  getLoanData();
	var sum = 0;
	for(var i=0;i<data.length;i++){
		sum += data[i][1];
	}
	//sum = sum *1000;
	$("#totalMonthly").html(numberWithCommas(sum));
	//$("#totalMonthly").format({format:"#,###", locale:"us"});
}




function getLoanData(){
	 var i = 0;
	  var chartData=[];
	  
	$(".my_portfolio_li_bx:not(.dummy)").each(function( ) {
		var value = $(this).find('input[name=emiAmount]').val();
		
		var name = $(this).find("[name='loanTypeId' ] option:selected").text();
		
		//var name = $(this).find("[name='LoanName']").val();
		var freq = $(this).find("[name='emiFreqId']").val();
		
		chartData[i] = [];
		chartData[i][0] = name;
		chartData[i][1] = calculateAmountMonthly(toNumber(value),freq);
		chartData[i][2] = freq;
		console.log(name +'  '+chartData[i][1] +'  '+value +' '+freq);
		i++;
	});
	return chartData;
    alert(chartData);
}
function ensureData(){
	 
	 if($(".my_portfolio_li_bx").length ==1){
	  
		 $("#contents").hide();
	  $("#nodata").show();
	 }
	 else{
		
	  $("#contents").show();
	  $("#nodata").hide();
	 }
	}
</script>


<script>

/* $(document).ready(function(){
	//$("select").selectBoxIt();
	ensureData();
	
    $(".data-graph-loan").slider({
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
                $("#loanTable").show();
                ensureData();
			
            } else if (ui.value == 2) {
            	$(".add-income-btn").hide();
            	$("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               //$("#data-graph .ui-slider-handle").css("margin-left", "-42px");
               $("#data-graph .ui-slider-handle").text("Graph");
               $("#inner-contents-graph").show();
               $("#loanTable").hide();
               
               showGraph();

               //RenderPieChart('container', data); 
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
/* 	
  });
 */
</script>
  <script>
  function communicateIFA(key){
  /* showConfirm("Are you sure; you want to communicate amount change to your IFA?", function() {
		window.location.href="${pageContext.request.contextPath}/portfolio/sendToIFA?ifa="+key;
	}); */
  
  bootbox.confirm("Are you sure; you want to communicate amount change to your IFA?", function(result) {
		if(result==true)
			{
			window.location.href="${pageContext.request.contextPath}/portfolio/sendToIFA?ifa="+key;
			}
		else
			{
			
			}
		  /* Example.show("Confirm result: "+result); */
		}); 
  
  }
  </script>
<script>

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
				$("#inner-contents-graph").hide();
				$("#loanTable").show();
				}
			else
				{
				$("#loanTable").hide();
				$("#inner-contents-graph").show();
	            showGraph();
				}
		});
	})

</script>
  <div class="sen_msg_txt fl">You have declared<span class="fa fa-inr fa-2x sen_msg"><%=request.getAttribute("dcOutstandingLoan")!=null?CommonUtils.formatAmountINR((Double)request.getAttribute("dcOutstandingLoan")):"0" %></span> <span class="sen_msg_txt_unit"></span> of  <span class="sen_msg_txtm">Outstanding Loan</span> in Financial Plan</div>&nbsp;
  
          <a href="#" class="btn-primary btn-xs btn" onclick="communicateIFA('loan')" > Communicate change in amount to your IFA</a>
          <div class="topmenu pull-right">
           <a href="${pageContext.request.contextPath}/portfolio/myLoan/addUpdate" class="btn-primary btn-xs btn">Add Loan</a>
           </div>
  <div id="contents">
  

<%--  <div id="data-graph-bx">
      <div id="data-graph" class="common_sliding_radio data-graph-loan">
      <span class="lbl_first lbl">Data</span>
      <span class="lbl_second lbl">Graph</span></div>
      <div class="clr"></div>
      
      <div id="data-graph-margin" style="position:relative; z-index:2;top: -22px;left: 7px; opacity:0.0;">
      <span class="lbl_first lbl"><a  href="#">Data</a></span>
      <span class="lbl_second lbl"><a  href="${pageContext.request.contextPath}/financial/income/graph">Graph</a></span>
      <div class="clr"></div>
      
      
    </div>  --%>
     
     
     <!-- <div id="data-graph-bx">
      <div id="data-graph" class="common_sliding_radio data-graph-loan"><span class="lbl_first lbl">Data</span><span class="lbl_second lbl">Graph</span></div>
      <div class="clr"></div>
      
      div id="data-graph-margin" style="position:relative; z-index:2;top: -22px;left: 7px; opacity:0.0;"><span class="lbl_first lbl"><a  href="#">Data</a></span><span class="lbl_second lbl"><a  href="${pageContext.request.contextPath}/financial/income/graph>Graph</a></span></div
      <div class="clr"></div>
      
      
    </div> -->
    </div>
    <br>
    <span class="col-sm-1 fr"> <label class="pull-right inline">
		 <input	id="id-button-borders" checked="" type="checkbox" class="ace ace-switch ace-switch-5" /> <span class="lbl middle"></span>
	</label>
	</span>
    
    <div class="row">
    	<div class="col-xs-12">
    <div id="inner-contents-graph" class="clearfix fl">
        	
        	<div class="margin-box clearfix fl">
        	
      	
           <div id="container"></div></div>
           </div>     
        </div>
        </div>
        

  <!-- end of "contents" id -->
<div id="nodata" style="display:none">
  <div class="clr"></div>
     <div class="no_data_message">There is no Loan Defined by you</div>
  </div>
  <!-- New Code Start -->
    <!--<div id="data-graph-bx">
      <div id="data-graph" class="common_sliding_radio"> <span class="lbl_first lbl">Data</span> <span class="lbl_second lbl">Graph</span> </div>
      <div class="clr"></div>
    </div>-->
    <div id="loanTable">
    <%if (lstLoan !=null && !lstLoan.isEmpty()) {%>
    <br><br><br>
    <div class="col-xs-12">
    <form action="GET" >
    
    </form>
								<table id="sample-table-1"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="">Loan Type</th>
												<th class="">Amount</th>
												<th class="">Tenure</th>
												<th class="">EMI</th>
												<th class="">EMI Frequency</th>
												<th class="">Actions</th>
											</tr>
										</thead>
										
										<tbody>
											<% for(LoanData n:lstLoan){%>
											<tr>
												<td class=""><%=CommonUtils.emptyIfNull(n.getLoanType()) %></td>
												<td class=""><%=CommonUtils.formatAmountINR(n.getLoanAmount(),true) %></td>
												<td class=""><%=n.getLoanTenureMonths() %></td>
												<td class=""><%= CommonUtils.formatAmountINR(n.getEmiAmount(), true) %></td>
												<td class=""><%=n.getEmiFreqValue() %></td>
												<td class=""><div>
             
												
															<a class="fa fa-pencil fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Edit"  href="${pageContext.request.contextPath}/portfolio/myLoan/addUpdate?partyLoanId=<%=n.getPartyLoanId()%>">
															</a>&nbsp;&nbsp;
													

														<a class="fa fa-trash fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Delete"  href="${pageContext.request.contextPath}/portfolio/myLoan/delete?partyLoanId=<%=n.getPartyLoanId()%>" onclick="return myConfirm(this.href);" >
															</a>&nbsp;&nbsp;
														

														<a class="fa fa-question fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Add Question" href="${pageContext.request.contextPath}/query/add">
															</a>&nbsp;&nbsp;
															<a class="icon-add-notes fa-lg has-tip [tip-top tip-bottom tip-left tip-right] [radius round]" data-options="show_on:large" title="Click here to Add Notes" href="${pageContext.request.contextPath}/notes/note?refId=<%=n.getPartyLoanId()%>&refTypeId=111015&<%=BaseRequest.encode("returnUrl", "/portfolio/myLoan")%>"> </a>
														
            </div></td>
																									
               <%}%> 
												
												<%-- <td>
													<div class="hidden-sm hidden-xs btn-group">
             
														<button class="btn btn-xs btn-info">
															<a href="${pageContext.request.contextPath}/query/edit?queryId=<%=query.getQueryId()%>">
															<i class="fa fa-pencil btn-xs btn-info"></i></a>
														</button>

														<button class="btn btn-xs btn-danger"><a onClick="onDelete(<%=query.getQueryId()%>)">
															<i class="ace-icon fa fa-trash-o btn-xs btn-danger"></i></a>
														</button>

														<button class="btn btn-xs btn-warning"><a href="${pageContext.request.contextPath}/query/messages?queryId=<%=query.getQueryId()%>">
															<i class="ace-icon fa fa-comments-o btn-xs btn-warning"></i></a>
														</button>
            </div>
												</td> --%>
											</tr>
											
											
											</tbody>
									</table>
        </div>
        </div>
   <%} else { %>
     <div class="clr"></div>     
        <div class="no_data_message">NO DATA FOUND</div> 
 <%} %>
    <!-- end of "inner-contents" id --> 
    <div class="fr">
        
      
       <div class="pull-left label label-lg arrowed-in-right arrowed-in hidden-xs"> <span>Total EMI: </span>

                  <div class="fa fa-inr"  id = "totalMonthly">${totalEmi} </div>

          <span>per month</span></div>
    </div>
 <!-- </div> -->

  <!-- new code ends -->
  