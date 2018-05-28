
<%@page import="in.fiinfra.common.diy.models.KeyValue"%>
<%@page import="in.fiinfra.cp.ExpenseData"%>
<%@page import="in.fiinfra.common.common.BaseRequest"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@page import="in.fiinfra.common.common.CodeValueData"%>
<%@page import="java.util.List"%>
<%@page import="in.fiinfra.cp.IncomeData"%>
<%@page import="in.fiinfra.cp.CommonUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

 <%ExpenseData expense=(ExpenseData) request.getAttribute("expense"); 
	int index1 =(Integer) request.getAttribute("index");
	String s1=(String) request.getAttribute("s");
	List<CodeValueData> expenseTypes =(List<CodeValueData>) request.getAttribute("expenseTypes");
%>
 
<script>
$(document).ready(function(){
 
	$("#expense_form").validate({
		errorElement:'div',
    	errorClass:'errors',
    	
        rules: {
        	expenseName: {required:true},
            expenseAmount: {
                    required: true,
                    min:1,
                    digits:true
                }
        },
        messages: {
        	expenseName: {required:"Enter Expense Name"},
        	expenseAmount: {required:"Enter Amount",digits:"Please enter numbers only"}
            
            
        }
    });

	 // Calls the selectBoxIt method on your HTML select box
    });
$(function() {
    $('#expenseTypeID').change(function() {
    	var end = $("option:selected", this).text();
        // and update the hidden input's value
        $('#expenseName').val(end);
    });
});
    
</script>

<script>

$("body").on("click", ".submit_btn", function() {
	
	if($('#expense_form').valid()){
 		$('#expense_form').submit();	
 	}	
	});
  	// $('#asset-stock-form').submit();
	$("body").on("click", "#addSave", function() {
		
		if($('#expense_form').valid()){
    		var form=$('#expense_form');
    		form.append('<input name="action" type="hidden" value="add"/>');
    		form.submit();
    	}
	});  

/* function saveExpense() {
	//alert($('#expense_form').serialize());
 	if($('#expense_form').valid()){
 		$('#expense_form').submit();	
 	}
} */
</script> 

<script>
function drawChart(graphData) {
	  
	 var chartData = [];
	 chartData[0] = [];
	 chartData[0][0] = 'label';
	 chartData[0][1] = 'Value';
	 
	 for(var i=0;i<graphData.length;i++){
		 chartData[i+1] = [];
		 chartData[i+1][0] = graphData[i][0];
		 chartData[i+1][1] = graphData[i][1];
		 
	 }
	 
	
    	var options = {
      
      backgroundColor: { fill:'transparent' },
      width:600,
      height:400,
      colors:GRAPH_COLORS,
      legend : { textStyle: {fontSize: 12}},
      pieSliceText: 'percentage'
      
    };
   // alert(options);
   
   var graph = google.visualization.arrayToDataTable(chartData);
   
   var formatter = new google.visualization.NumberFormat(
  	      {pattern: 'Rs ##,###'});
  formatter.format(graph, 1); 
   var chart = new google.visualization.PieChart(document.getElementById('container'));
   chart.draw(graph, options);

  }


function calculate(){
	var data =  getExpenseData();
	var sum = 0;
	for(var i=0;i<data.length;i++){
		sum += data[i][1];
	}
	//sum = sum *1000;
	$("#totalMonthly").html(numberWithCommas(sum));
}
function getExpenseData(){
	 var i = 0;
	  var chartData=[];
	  
	$(".my_expense_li_bx:not(.dummy)").each(function( ) {
		var value = $(this).find('input[name=expenseAmount]').val();
		var type = $(this).find("[name='expenseTypeID']").val();
		var name = $(this).find("[name='expenseName']").val();
		var freq = $(this).find("[name='expenseFrequencyID']").val();
		chartData[i] = [];
		chartData[i][0] = name;
		chartData[i][1] = calculateAmountMonthly(toNumber(value)*1000,freq);
		chartData[i][2] = freq;
		i++;
	});
	
	return chartData;

}

function ensureData(){
	 
	 if($(".my_expense_li_bx").length ==1){
	  
		$("#contents").hide();
	  	 $("#nodata").show();
	 }
	 else{
		
	  $("#contents").show();
	  $("#nodata").hide();
	 }
	}


function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox, callback) {
	//alert(ctrlName);
	$(ctrlName).slider({
	min: minVal,
	max: maxVal,
	step: stepBy,
	slide: function (event, ui) {
	    $(ctrlTextBox).val(ui.value);
	    calculate();
	}
	});

	var currentValue = parseInt($(ctrlTextBox).val(),10);  
	$(ctrlName).slider('value', isNaN(currentValue) ? 0:currentValue);
	$(ctrlTextBox).val($(ctrlName).slider('value'));

	$(ctrlTextBox).keyup(function () {
		$(ctrlTextBox).val();
		$(ctrlName).slider('value', $(ctrlTextBox).val());
		calculate();
	});

	}

function showGraph(){
	 var data =  getExpenseData();
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

$.validator.addMethod("checkDuplicateExpenses", function(value, element, param) {
	
	var count = 0;
	$(".my_expense_li_bx:not(.dummy)").each(function( element) {
		if($(this).find("[name='expenseName']").val() == value){
			count++;
		}
	});
	if(count >1){
		return false;
	}
	return true;

	}, $.validator.format("Duplicate Name"));


$(document).ready(function(){
	
	
	
  
   // $("select").selectBoxIt();
    attachAllControls();
	 // Calls the selectBoxIt method on your HTML select box
	 
	
	//Add Button Starts
 /*  $("body").on("click", ".add-income-btn", function() {
	  $("#expenseDiv_0").show();
  }); */
  $("body").on("click", ".add-income-btn", function() {
	  //$(".data-graph-income").slider('value',0);
	  var newIndex = 0;
	  for(var i=1;i<100;i++){
		  if(!$('#expenseDiv_'+i).length){
			  newIndex = i;
			  break;
		  }
	  }
	  var id = "expenseDiv_"+newIndex;
	  var html = '';
	  
	  html += '<div id="'+id+'" class="my_expense_li_bx " >';
	  html += $("#expenseDiv_0").html();
	  html += '</div>';
	  
	  $( ".my_exp_title_bx" ).after( html );
	
	 // $("#inner_contents_my_expenses_data").append(html);
	  var div = $("#"+id);

	  attachControls(div.find('form'));
	  ensureData();
	  
  });
	 
  /* if(!$('#expenseDiv_1').length){
	  $("#expenseDiv_0").show();
  }	  */
  
	$('body').on('change keyup keydown', 'input, textarea, select', function (e) {
	    $(this).addClass('changed-input');
	});
	$(window).on('beforeunload', function () {
	    if ($('.changed-input').length) {
	        return 'You haven\'t saved your changes.';
	    }
	});


	 $("body").on("click", ".delete_row", function() {
		 $(this).closest(".my_expense_li_bx").removeClass('changed-input');
			
			var div = $(this).closest(".my_expense_li_bx");
			var form = $(this).closest("form");
			var partyExpenseId =  $(form).find('[name=partyExpenseID]').val();
			showConfirm("Delete Current Record ?", function() {
				
				if(partyExpenseId && partyExpenseId >0){
					$(form).find('[name=action]').val('del');
					save($(form));
					
				}
				else{
					$(div).remove();
					ensureData();
				}
			});
			
		 
		 /* if(($(this).closest(".my_expense_li_bx").hasClass("dummy"))){
			$(this).closest(".my_expense_li_bx").hide();
			return;
		}
		var form = $(this).closest("form");
		$('.changed-input').removeClass('changed-input');
		
		showConfirm("Delete Current Expense Record ?", function() {
			var partyExpenseId =  $(form).find('[name=partyExpenseID]').val();
			if(partyExpenseId && partyExpenseId >0){
				$(form).find('[name=action]').val('del');
				save($(form));
				//$(form).submit();
			}
			else{
				$(div).remove();
			}

		}); */
	});  
	 
		$("body").on("click", ".add_query", function() {
			
			var form = $(this).closest("form");
			var partyExpenseId =  $(form).find('[name=partyExpenseID]').val();
			if(partyExpenseId >0){
				window.location = '${pageContext.request.contextPath}/query/add?refTypeId=111013&<%=BaseRequest.encode("returnUrl", "/financial/myExpenses")%>&refId='+partyExpenseId;	
			}
			else{
				showMessage('Please Save Record First !!!',false);
			}
			
				
		});

		$("body").on("click", ".add_note", function() {
			
			var form = $(this).closest("form");
			var partyExpenseId =  $(form).find('[name=partyExpenseID]').val();
			if(partyExpenseId >0){
				window.location = '${pageContext.request.contextPath}/notes/note?refTypeId=111013&<%=BaseRequest.encode("returnUrl", "/financial/myExpenses")%>&refId='+partyExpenseId;	
			}
			else{
				showMessage('Please Save Record First !!!',false);
			}
		});
	 


	
	$("body").on("click", ".save_row", function() {
		var form = $(this).closest("form");
		$('.changed-input').removeClass('changed-input');
		 if(validateExpenseForm(form)){
			 $(form).find('.changed-input').removeClass('changed-input');
			 save(form);
			 ensureData();
			// $(form).submit();	 
		 }
//		var input = $(form).find('input[name=expenseAmount]');
//		var val =convertToNumber(input);
//		input.val(val*1000);
	
		
	});
	 
	
	function save(form){
		 var del = $(form).find('[name=action]').val() == 'del';
		 var data = $(form).serialize();
		 $(form).closest(".my_expense_li_bx").addClass("loading");
		 $.ajax(
				    {
				        url : "${pageContext.request.contextPath}/financial/myExpense/save",
				        type: "POST",
				        dataType: 'json',
				        data : data,
				        success:function(data, textStatus, jqXHR)
				        {	
				        	$(form).closest(".my_expense_li_bx").removeClass("loading");
				        	if(del){
				        		$(form).closest(".my_expense_li_bx").remove();
				        		showMessage('Expenses Record Deleted.',false);
				        		ensureData();
				        	}
				        	else{
				        		$(form).find('[name=partyExpenseID]').val(data);
				        		showMessage('Expenses Record Saved.',false);
				        	}
				        	calculate();
				        	ensureData();
				        				        	
				        	//scores[index] = data.score;
				        },
				        error: function(jqXHR, textStatus, errorThrown)
				        {
				        	calculate();
				        	$(form).closest(".my_expense_li_bx").removeClass("loading");
				        	console.log(errorThrown);
				        }
				    });

		 
	}

	
	
	/***** My Expenses *****/
	
	ensureData();
	
	    $(".data-graph-expenses").slider({
	        min: 1,
	        max: 2,
	        step: 1,
	        slide: function (event, ui) {
	            //$("#data-graph .ui-slider-handle").empty();
	            if (ui.value == 1) {
	            	$(".add-income-btn").show();
	                $("#data-graph .ui-slider-handle").css("margin-left", "2px");
	                $("#data-graph .ui-slider-handle").text("Data");
	               $("#inner-contents-graph").hide();
	               $("#inner_contents_my_expenses_data").show();
	               ensureData();
				
	            } else if (ui.value == 2) {
	            	$(".add-income-btn").hide();
	                $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
	               $("#data-graph .ui-slider-handle").text("Graph");
	               $("#inner-contents-graph").show();
	               $("#inner_contents_my_expenses_data").hide();
	              // RenderPieChart('container', data); 
	              
	               showGraph();
	            }
	        }

	    });
	    
	    
	    if(!showGraphPage){
		    $("#data-graph .ui-slider-handle").css("margin-left", "2px");
		    $("#data-graph .ui-slider-handle").text("Data");
		    $("#inner-contents-graph").hide();
	    }
	    else{
        	$(".add-income-btn").hide();
            $("#data-graph .ui-slider-handle").css("margin-left", "-42px");
           $("#data-graph .ui-slider-handle").text("Graph");
           $("#inner-contents-graph").show();
           $("#inner_contents_my_expenses_data").hide();
           showGraph();
	       $(".data-graph-expenses").slider('value',2);
	      
	    }
	    
	    
	 
 });
</script>
<script>
function createExpenseSlider(){
	$(".my_expense_li_bx").each(function() {
		
		var div = $(this).find('div[id=amountSlider]');
		var input = $(this).find('input[name=expenseAmount]');
		//var expenseType = $(this).find("[name='expenseTypeID']").val();
		
		createSlider(div,0,100,1,input);
		//createSlider(div,0,100,1,input);
	});
}


$(document).ready(function(){
	
	createExpenseSlider();
 });

</script>
<script>
function addUpdateExpense(formId){
	var formData = $('[name="expense_'+formId+'"]').serialize();
	//alert(formData);
	$(formId).submit();
/* 	var formData = $('[name="expense_'+formId+'"]').serialize();
	//alert(formData);
	$.post( "${pageContext.request.contextPath}/financial/myExpense/save",
            formData,
	             function(data) {
			  alert
               $('#stage1').html(data);
            }
         );
 */}
</script>
<script>
function deleteExpense(formId){
	
	
/* 	var formData = $('[name="expense_'+formId+'"]').serialize();
	alert(formData);
	$.post( "${pageContext.request.contextPath}/financial/expense/delete",
            formData,
	             function(data) {
               $('#stage1').html(data);
            }
         ); */
}
</script>
<script>
  function communicateIFA(){
  showConfirm("Are you sure; you want to communicate amount change to your IFA?", function() {
		window.location.href="${pageContext.request.contextPath}/portfolio/sendToIFA?ifa=expense";
	});
  }
  </script>
        
        
		  <form:form commandName="expense" id="expense_form" action="${pageContext.request.contextPath}/financial/myExpense/save" method="POST">
            <input id="partyExpenseID" name="partyExpenseID" type="hidden"  value="<%=CommonUtils.zeroIfNULL(expense.getPartyExpenseID())%>"/>
            <fieldset>
			<div class="col-xs-12 ">
              <div class="form-group">
             <label for="textArea" class="col-lg-2 control-label">Expense Category</label>
                  <div class="col-lg-4">
                  <form:select  id="expenseTypeID"  class="form-control" path="expenseTypeID">
     <% //List<CodeValueData> expenseTypes =(List<CodeValueData>) request.getAttribute("expenseTypes");
            for (CodeValueData idv:expenseTypes){
                  %>
              <option value='<%=idv.getCodeValueId()%>' <%=new Integer(idv.getCodeValueId()).equals(expense.getExpenseTypeID())?" selected ":"" %>> <%=idv.getCodeValue()%></option>
              <%}%>
   
                  </form:select>
                  </div>
                </div><br> <br>
                
			</div>
			<div class="col-xs-12 ">
                <div class="form-group">
                  <label for="textArea" class="col-lg-2 control-label">Expense Title <span class="required">*</span></label>
                  <div class="col-lg-4">
          		<form:input class="form-control" id="expenseName" path="expenseName"  />
                </div>
                </div><br> <br>
                
			</div>
			<div class="col-xs-12 ">
                <div class="form-group">
                  <label for="textArea" class="col-lg-2 control-label">Amount<span class="required">*</span></label>
                   <div class="col-lg-4">
                  <form:input class="form-control input_txt_four fl" path="expenseAmount" id="expenseAmount" />
                </div>
                </div><br> <br>
                
			</div>
			<div class="col-xs-12 ">
                <div class="form-group">
                  <label for="textArea" class="col-lg-2 control-label">Period</label>
                   <div class="col-lg-4">
                   <form:select  id="expenseFrequencyID"  class="form-control" path="expenseFrequencyID">
           <% List<CodeValueData> freqTypes1 =(List<CodeValueData>) request.getAttribute("freqList");
            for (CodeValueData idv:freqTypes1){
                  %>
              <option value='<%=idv.getCodeValueId()%>' <%=new Integer(idv.getCodeValueId()).equals(expense.getExpenseFrequencyID())?" selected ":"" %>><%=idv.getCodeValue()%></option>
              <%}%>
   
                  </form:select>
                  </div>
                </div><br> <br>
                
			</div>
			
              </fieldset>
              </form:form>
	<div class="col-xs-12">
	<div class="col-lg-2"></div>
	<div class="col-lg-4">
	<div class="fr">
	 <input type="button"
       class="btn-primary btn-xs btn submit_btn" value="Save"></input>
     <input type="button" id="addSave"
       value="Save &amp; Add" class="btn-primary btn-xs btn">
     
      <a class="btn-primary btn-xs btn"
       href="/FIINFRA-Client-WEB/financial/myExpenses">Cancel</a>
       </div>
    </div>
	</div>