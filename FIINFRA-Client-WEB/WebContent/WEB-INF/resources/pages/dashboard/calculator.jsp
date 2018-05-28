
<!-- <script>
$(document).ready(function(){
	
	window.onload = function() {
		  
		}
	$("emi_la_value").load(function() {
		
	});
    //$('.common_in_content').slimScroll();
	//Down Payment value Slider
	  createSlider('#emi_la',0,100,1,"#emi_la_value",function() {  downPayment();  })
	  createSlider('#emi_roi',1,30,0.01,"#emi_roi_value",function() {  downPayment();  })
	  createSlider('#emi_noy',5,30,1,"#emi_noy_value",function() {  downPayment();  })
	//Auto Loan Calculator
	  createSlider('#al_01',0,100,1,"#al_01_value",function() {  autoLoanCalculate();  })
	  createSlider('#al_02',5,100,1,"#al_02_value",function() {  autoLoanCalculate();  })
	  createSlider('#al_03',1,30,0.10,"#al_03_value",function() {  autoLoanCalculate();  })
	  createSlider('#al_04',1,84,1,"#al_04_value",function() {  autoLoanCalculate();  })

	//Retirement Calculator
	  createSlider('#rc_01',0,100,1,"#rc_01_value",function() {  retirementCalculate();  })
	  createSlider('#rc_02',5,100,1,"#rc_02_value",function() {  retirementCalculate();  })
	  createSlider('#rc_03',1,500,1,"#rc_03_value",function() {  retirementCalculate();  })
	  createSlider('#rc_04',0,500,0.1,"#rc_04_value",function() {  retirementCalculate();  })
	  createSlider('#rc_05',0,500,1,"#rc_05_value",function() {  retirementCalculate();  })
	  createSlider('#rc_06',1,15,0.10,"#rc_06_value",function() {  retirementCalculate();  })
	  createSlider('#rc_07',1,15,0.10,"#rc_07_value",function() {  retirementCalculate();  })


	//SIP Calculator
	  createSlider('#sip_01',1,100,1,"#sip_01_value",function() {  sipCalculate();  })
	  createSlider('#sip_02',5,30,1,"#sip_02_value",function() {  sipCalculate();  })
	  createSlider('#sip_03',5,30,1,"#sip_03_value", function() {  sipCalculate();  }
	  );
  

});

function onChange(element, val){
	$("#error").val("");
	var data = [];
	//$(element).closest(".calculator")
	var index = 0;
	var calculatorName = $(element).closest(".calculator").prop('id');
	$(element).closest(".calculator").find("input").each(function( index) {
		data[index++] = $(this).val();
	});
	calculate(element,calculatorName,data);
}

function calculate(element, name, data){
	if("pnl-emi"== name){
		//EMI Calculator
		emiCalculate(element,data)
	}
	if("pnl-financial"== name){
		//Auto Laon  Calculator
		autoLoanCalculate(element,data)
	}
	if("pnl-retirement"== name){
		//Retirement Calculator
		retirementCalculate(element,data)
	}
	if("pnl-sip"== name){
		//SIP Calculator
		sipCalculate(element,data)
	}
	//console.log( name +' '+ data );
}

function emiCalculate(element,data){
  //E = P×r×(1 + r)n/((1 + r)n - 1)
  var r = data[1]/1200;
  var n = data[2]*12;	   
  var principalAmt=data[0]*100000;
  var rateCal=Math.pow(r+1, n); //(1+r)raised n
  var totalEMI1=principalAmt*r*rateCal;//P×r×(1 + r)n
  var totalEMI2=rateCal-1;//(1 + r)n - 1)
  var totalEMI=totalEMI1/totalEMI2;
  var finalEMI=Math.round(totalEMI);
 
  $("#totalEMI").text(format1(finalEMI)+'/-');
  
//  console.log( data+' p:'+principalAmt+ ' n: '+n+' Total: '+finalEMI+' Total:'+totalAmtToPay);
}

function autoLoanCalculate(element,data){
	  var amt=data[0]*100000
	  var dp=(data[1]*amt)/100;
	  //var downPayment=Math.round(dp);
	  var downPayment=dp;
	  var principalAmt=amt-downPayment;
	  var r = data[2]/1200;
	  var n = data[3];	   
	  var rateCal=Math.pow(r+1, n); //(1+r)raised n
	  var totalEMI1=principalAmt*r*rateCal;//P×r×(1 + r)n
	  var totalEMI2=rateCal-1;//(1 + r)n - 1)
	  var totalEMI=totalEMI1/totalEMI2;
	  var finalEMI=Math.round(totalEMI);
	  var totalAmtToPay=Math.round(totalEMI*n);
	  var totalInterestToPay=totalAmtToPay-principalAmt;
	  var toalAmt=amt+totalInterestToPay;
	  //$("#totalEMI").text(finalEMI+'/-');
	 /*  var rate=data[2];//i
	  var cal =Math.pow(rate+1, n); //(1+i) raise to n
	  var PV=dp;//PV
	  var div= 1/cal;// 1/cal
	  var diff = 1-div;// 1-div 
	 	var deno =diff/rate;
	  var finalData=PV/deno; */
	  //alert(val1);       
	  $("#totalMonthlyPament").text(format1(finalEMI)+'/-');
	  //$("#totalMonthlyPament").text(format1(finalData)+'/-');
	  $("#totalInterestPament").text(format1(totalInterestToPay)+'/-');
	  $("#totalAmountPament").text(format1(toalAmt)+'/-');
	  
}

function retirementCalculate(element,data){
	
	var annuity;
	var roi;
	var tenure;
	var remain;
	var fv;
	var cost;
	
	var amt;
	var inf;
	var tp;
	var sav;
	var age;
	var ret;
	var retamt;
	var current;
    var msav;
    
    age=data[0];
    ret=data[1];
    retamt=data[2]*100000;
    tenure=ret-age;
    $("#error").text("");
    if(tenure<0)
	{
		//alert('Retirement age should be more than your current age');
		
		//$('#pnl-retirement').page();
		$("#error").text("Retirement age should be more than your current age");
		/*$('#rc_02_value').val(ret+1);*/
		//$('#rc_02_value').slider('refresh'); 
		return false;
	}
    current=data[3]*100000;console.log(current);
    roi=Math.pow(1+data[5]/100,1/12)-1;
    var roi1=data[5]/100;
    inf=data[6]/100;
    fv=retamt*Math.pow(1+inf,tenure);
	remain=fv-current*Math.pow((1+roi1),tenure);
	msav=data[4]*1000;
	tp=msav*(Math.pow(1+roi,tenure*12)-1)/roi;
	
	if(isNaN(Math.round((remain*roi)/(Math.pow((1+roi),tenure*12)-1))))
	{
		//alert('One or more of the numeric fields is wrong. Please Check');
		$("#error").text("Retirement age should be more than your current age");
	}
	else
	{
		var txtNeedToSave=Math.round((remain*roi)/(Math.pow((1+roi),tenure*12)-1));
		var txtRequiredAmt=Math.round(fv);
		var txtAbleToSave=Math.round(tp+current*Math.pow((1+roi1),tenure));
		if(isFinite(txtNeedToSave)){
		
		$("#txtNeedToSave").text(format1(txtNeedToSave)+'/-');
		}else{$("#txtNeedToSave").text('0/-');
		}
		$("#txtRequiredAmt").text(format1(txtRequiredAmt)+'/-');
		$("#txtAbleToSave").text(format1(txtAbleToSave)+'/-');
		//console.log(txtNeedToSave+'  '+ txtRequiredAmt+'  '+txtAbleToSave);
	}
	//console.log( data);
	}
function sipCalculate(element,data){
	var ExpAmt =data[0]*100000;
/*     var Period =data[1];
    var Return =data[2];
    Return=Return / 1200;
    Period=Period*12;	
    var Factor=Math.pow((1 + Return), Period) - 1;
    var Numerator=ExpAmt*Return;
    var Denominator= Factor*(1+Return);	 
    var Result=Numerator/Denominator;	
    console.log('Numerator:'+Numerator+'  '+'Denominator'+Denominator);
    var finalSIP=Math.round(Result);
	
	$("#sipResult").text(format1(finalSIP)+'/-'); */
	//console.log('ExpAmt:'+ExpAmt+' Return:'+ Return+' Period:'+Period+' finalSIP:'+ finalSIP+"re"+Result);
	function SIfuturevalue_sipneedcalc(returnspercent)
	   {
	   	 var rate = returnspercent/100;
		 var nper = 1/12;
		 var PMT= 0;
		 var pv = -100;
		 var type = 1;
		 var fv;
		 fv =(PMT*(1+rate*type)*(1- Math.pow(1+ rate,nper))/rate)-pv*Math.pow(1+rate,nper);
		 return (fv);
	  }
	var cl_returns=data[2];
	var cl_tenure=data[1];
	var cl_famt=ExpAmt;
	
	var A = (1+(cl_returns/100))* (((Math.pow(1+(cl_returns/100),cl_tenure)-1)))/ ((1+(cl_returns/100))-1);
    var B = (SIfuturevalue_sipneedcalc(cl_returns))-100;
    var C = (1+(B/100))* (((Math.pow(1+(B/100),12*cl_tenure)-1)))/ ((1+(B/100))-1);
    var D = cl_famt/A;
    var cl_sipcalculated = Math.round(cl_famt/C);
    $("#sipResult").text(format1(cl_sipcalculated)+'/-');
    /* console.log("SIP:"+cl_sipcalculated); */
}



function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox, callback) {
//alert(ctrlName);
$(ctrlName).slider({
min: minVal,
max: maxVal,
step: stepBy,
change: function (event, ui) {
    $(ctrlTextBox).val(ui.value);
    onChange($(ctrlTextBox));
},
slide: function (event, ui) {
    $(ctrlTextBox).val(ui.value);
    onChange($(ctrlTextBox));
}


});

var currentValue = parseInt($(ctrlTextBox).val(),10);  
$(ctrlName).slider('value', isNaN(currentValue) ? 0:currentValue);
$(ctrlTextBox).val($(ctrlName).slider('value'));



$(ctrlTextBox).keyup(function () {
	
	if($.isNumeric($(ctrlTextBox).val())){
		$(ctrlName).slider('value', $(ctrlTextBox).val());
		onChange($(ctrlTextBox));
	}
	else{
		this.value = this.value.replace(/[^0-9\.]/g,'');
	}
	
});

}

function format1(n) {
    return  n.toFixed(0).replace(/./g, function(c, i, a) {
        return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "," + c : c;
    });
}



</script> -->
<!-- custom scroll to "common_in_content" -->
<!-- <script>
$(document).ready(function () {
    /* Equity*/
    $('.btn_bx_in').on('click', function() {
        var pnlid = $(this).attr('id');
        pnlid = pnlid.replace('_div_dragger', '');
        $(".list_bx").not('#pnl-'+pnlid).hide();
        $('#pnl-'+pnlid).fadeIn();
        $('.btn_bx_in').removeClass('active');
        $(this).addClass('active');
    }).eq(0).trigger('click');
    
    /*$("#emi_div_dragger").click(function () {
      //  $(".equity_list_bx").FadeIn("slow");
      
		 $.when($(".list_bx").not(".Emi_Calculator").fadeOut("slow")).done(function() {
          $(".Emi_Calculator").fadeToggle("slow");
		  });
       });

    $("#financial_div_dragger").click(function () {
      //  $(".travel_goals_list_bx").slideToggle("slow");
	   $.when($(".list_bx").not(".Financial_Calculator").fadeOut("slow")).done(function() {
          $(".Financial_Calculator").fadeToggle("slow");
		  });
    });

    $("#retirement_div_dragger").click(function () {
      //  $(".travel_goals_list_bx").slideToggle("slow");
	   $.when($(".list_bx").not(".Retirement_Calculator").fadeOut("slow")).done(function() {
          $(".Retirement_Calculator").fadeToggle("slow");
		  });
    });

    $("#sip_div_dragger").click(function () {
      //  $(".travel_goals_list_bx").slideToggle("slow");
	   $.when($(".list_bx").not(".SIP_Calculator").fadeOut("slow")).done(function() {
          $(".SIP_Calculator").fadeToggle("slow");
		  });
    });*/

});
</script> -->
  <script>
$(function() {
$( "#accordion1" ).accordion({
	collapsible: true ,
	heightStyle: "content",
	animate: 250,
	header: ".accordion-header"
}).sortable({
	axis: "y",
	handle: ".accordion-header",
	stop: function( event, ui ) {
		// IE doesn't register the blur when sorting
		// so trigger focusout handlers to remove .ui-state-focus
		ui.item.children( ".accordion-header" ).triggerHandler( "focusout" );
	}
});
});

</script>
<script>
function isNumberKey(evt)
          {
             var charCode = (evt.which) ? evt.which : event.keyCode
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
 
             return true;
          }
 </script>
<!-- <script>
$('input[type="range"]').val(10).change();
</script> -->
  <%-- <div id="header-strip" class="fl">
  <jsp:include page="../menu.jsp"></jsp:include>
    <h3 class="clearfix fl">CALCULATOR</h3>
   </div> --%>
  <!-- end of "header-strip" id -->
  
 <!--  <div id="inner-shadow-strip"></div> -->
  <!-- end of "inner-shadow-strip" id -->
  
  <!-- <div id="contents"> 
    <div id="data-graph-bx">
      <div id="data-graph" class="common_sliding_radio"> <span class="lbl_first lbl">Data</span> <span class="lbl_second lbl">Graph</span> </div>
      <div class="clr"></div>
    </div>
    
    
    <section class="in_content clearfix" id="calculator">
      <div class="left_bx fl">
        <div id="pnl-emi" class="Emi_Calculator list_bx calculator">
          <label>EMI Calculator</label>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Loan Amount</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">100</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="emi_la" class="effect2"></div>
                  </div>
                  <div class="counter_parent rupee calci">
                    <input type="text" id="emi_la_value" class="range_counter"  value="0"/>
                    <span class="unit">lac</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Rate of Interest</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">5</span><span class="high extrem">30</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="emi_roi" class="effect2"></div>
                  </div>
                  <div class="counter_parent emi_roi02">
                    <input type="text" id="emi_roi_value" class="range_counter" />
                    <span class="unit">%</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>No. of Years</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">5</span><span class="high extrem">30</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="emi_noy" class="effect2"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="emi_noy_value" class="range_counter" />
                    <span class="unit">yrs</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="ipm">
            <div class="total-value">INSTALMENT PER MONTH/-</div>
            <div class="total-asset-value"> <span id="totalEMI">2170/-</span> </div>
          </div>
        </div>
        
        
        <div id="pnl-financial" class="Financial_Calculator list_bx calculator">
          <label>Auto Loan Calculator</label>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Amount(Vehical Price)</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">100</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="al_01" class="effect2"></div>
                  </div>
                  <div class="counter_parent rupee">
                    <input type="text" id="al_01_value" class="range_counter" value="0" />
                    <span class="unit">lac</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Down Payment</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">5</span><span class="high extrem">100</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="al_02" class="effect2"></div>
                  </div>
                  <div class="counter_parent emi_roi02">
                    <input type="text" id="al_02_value" class="range_counter" />
                    <span class="unit">%</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Annual Interest Rate</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">1</span><span class="high extrem">30</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="al_03" class="effect2"></div>
                  </div>
                  <div class="counter_parent emi_roi02">
                    <input type="text" id="al_03_value" class="range_counter" />
                    <span class="unit">%</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Term/Period</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">1</span><span class="high extrem">84</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="al_04" class="effect2"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="al_04_value" class="range_counter" />
                    <span class="unit">mths</span></div>
                </div>
              </div>
            </div>
          </div>
          
          
          <div>          
          <div class="ipm fl">
            <div class="total-value">MONTHLY PAYMENT</div>
            <div class="total-asset-value"> <span id="totalMonthlyPament"></span> </div>
          </div> 
          
          <div class="ipm fl">
            <div class="total-value">TOTAL INTEREST PAYMENT</div>
            <div class="total-asset-value"> <span id="totalInterestPament"></span> </div>
          </div>
          
          <div class="ipm fl">
            <div class="total-value">TOTAL AMOUNT TO PAY</div>
            <div class="total-asset-value"> <span id="totalAmountPament"></span> </div>
          </div>
          
          </div>
        </div>
        
        
        
      <div id="pnl-retirement" class="Retirement_Calculator list_bx calculator">
          <label>Retirement Calculator</label>
          <div style="height: 20px;">
          <span id="error" style="display: block;margin-left: 24% ;padding-top: 5px;color: #f00;font-size:14px; "></span>
          <label class="error"></label>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Your Age</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">100</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="rc_01" class="effect2"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="rc_01_value" class="range_counter"  />
                    <span class="unit">yrs</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Age your plan to retire</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">5</span><span class="high extrem">100</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="rc_02" class="effect2"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="rc_02_value" class="range_counter" />
                    <span class="unit">yrs</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Amount you want to retire with (Per Annum at today's prices)</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">1</span><span class="high extrem">500</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="rc_03" class="effect2"></div>
                  </div>
                  <div class="counter_parent rupee">
                    <input type="text" id="rc_03_value" class="range_counter" />
                    <span class="unit">lacs</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Your current savings</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">500</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="rc_04" class="effect2"></div>
                  </div>
                  <div class="counter_parent rupee">
                    <input type="text" id="rc_04_value" class="range_counter" />
                    <span class="unit">lacs</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Your monthly savings</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">0</span><span class="high extrem">500</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="rc_05" class="effect2"></div>
                  </div>
                  <div class="counter_parent rupee">
                    <input type="text" id="rc_05_value" class="range_counter" />
                    <span class="unit">k</span></div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Return you earn on your savings % (p.a.)</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">1</span><span class="high extrem">15</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="rc_06" class="effect2"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="rc_06_value" class="range_counter" />
                    <span class="unit">%</span></div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Expected Inflation Rate % (p.a.)</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">1</span><span class="high extrem">15</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="rc_07" class="effect2"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="rc_07_value" class="range_counter" />
                    <span class="unit">%</span></div>
                </div>
              </div>
            </div>
          </div>
          
          
     
          <div>
          <div class="ipm fl">
            <div class="total-value">YOU NEED TO SAVE<br>
			(Per Month)</div>
            <div class="total-asset-value"> <span id="txtNeedToSave"></span> </div>
          </div> 
          
          <div class="ipm fl">
            <div class="total-value">AT RETIREMENT YOU WOULD<br>REQUIRE</div>
            <div class="total-asset-value"> <span  id="txtRequiredAmt"></span> </div>
          </div>
          
          <div class="ipm fl">
            <div class="total-value">WITH YOUR CURRENT SAVINGS YOU SHOULD BE ABLE TO SAVE</div>
            <div class="total-asset-value"> <span  id="txtAbleToSave"></span> </div>
          </div>
          </div>
       
        </div>
        
        
        
        <div id="pnl-sip" class="SIP_Calculator list_bx calculator" id ="sip">
          <label>SIP Calculator</label>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Expected Amount</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">1</span><span class="high extrem">100</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="sip_01" class="effect2"></div>
                  </div>
                  <div class="counter_parent rupee">
                    <input type="text" id="sip_01_value" class="range_counter" />
                    <span class="unit">lac</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>No. Of Years</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">5</span><span class="high extrem">30</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="sip_02" class="effect2"></div>
                  </div>
                  <div class="counter_parent">
                    <input type="text" id="sip_02_value" class="range_counter" />
                    <span class="unit">yrs</span></div>
                </div>
              </div>
            </div>
          </div>
          <div class="calcy_li_bx">
            <div class="calcy_li_bx_in">
              <label>Expected Return (p.a.)</label>
              <div class="range_parent">
                <div class="scale clearfix">
                  <div class="scale_range"><span class="low extrem">5</span><span class="high extrem">30</span></div>
                  <div class="ui-slider-box-shadow">
                    <div id="sip_03" class="effect2"></div>
                  </div>
                  <div class="counter_parent emi_roi02">
                    <input type="text" id="sip_03_value" class="range_counter emi_roi" />
                    <span class="unit">%</span></div>
                </div>
              </div>
            </div>
          </div>
          
          
          <div class="ipm">
            <div class="total-value">SIP NEEDED (Per Month)</div>
            <div class="total-asset-value"><span id="sipResult"></span></div>
          </div>
        </div>
        
        
      </div>
      <div class="right_bx">
        <label>List of Calculators</label>
        <div class="cnt">
          <div class="btn_bx"><a class="btn_bx_in" id="emi_div_dragger" href="#">EMI Calculator</a></div>
     
          <div class="btn_bx"><a class="btn_bx_in" id="financial_div_dragger" href="#">Auto Loan Calculator</a></div>
       
          <div class="btn_bx"><a class="btn_bx_in" id="retirement_div_dragger" href="#">Retirement Calculator</a></div>
       
          <div class="btn_bx"><a class="btn_bx_in" id="sip_div_dragger" href="#">SIP Calculator</a></div>
        </div>
      </div>
      
      DC submenu Ends 
      
    </section>
    <div class="clr"></div>
    
    end of "inner-contents" id 
  </div> -->
  <!-- end of "contents" id -->
  <style>

	 input[type='range'] {
		-webkit-appearance: none;
		border-radius: 5px;
		/* box-shadow: inset 0 0 5px #333; */
		background-color: #438eb9;
		height: 10px;
		vertical-align: middle;
	}
	input[type='range']::-moz-range-track {
		-moz-appearance: none;
		border-radius: 5px;
		/* box-shadow: inset 0 0 5px #333; */
		background-color: #438eb9;
		height: 10px;
	}
	input[type='range']::-webkit-slider-thumb {
		-webkit-appearance: none !important;
		border-radius: 10px;
		background-color: #FFF;
		/* box-shadow:inset 0 0 10px rgba(000,000,000,0.5); */
		border: 3px solid #2e6589;
		height: 20px;
		width: 20px;
	}
	input[type='range']::-moz-range-thumb {
		-moz-appearance: none;
		border-radius: 10px;
		background-color: #FFF;
/* 		box-shadow:inset 0 0 10px rgba(000,000,000,0.5); */
		border: 3px solid #2e6589;
		height: 20px;
		width: 20px;
	} 
</style>

									<div class="col-lg-12">
										<!-- #section:elements.accordion -->
										<div id="accordion1" class="accordion-style1 panel-group">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne">
															<i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
															&nbsp;EMI Calculator
														</a>
													</h4>
												</div>

												<div class="panel-collapse collapse in" id="collapseOne">
													<div class="panel-body">
														<span>Loan Amount :</span>
														<div class="row">
															<div class="col-sm-9">
																<span class="fl">0</span><span class="fr">100</span>
																<input id="loanAmount" type="range" onkeypress="return isNumberKey(event)" min="0" max="100" step="1" value="0" oninput="setLoanAmountVal(); emiCalculate(); ">
																
															</div>
															<div class="col-lg-1"><i class="fa fa-inr fa-2x fr"></i></div>
															<div class="col-lg-1">
																<input id="txtLoanAmount" type="text" onkeypress="return isNumberKey(event)" class="form-control fl" value="0" oninput="setSliderLoanAmountVal();emiCalculate();">
															</div>
															<div class=""><span>Lac</span></div>
														</div>
														<br><br>

														<span>Rate of Interest</span>
														<div class="row">
															<div class="col-sm-9">
																<span class="fl">1</span><span class="fr">30</span>
																<input id="rateOfInterest" type="range" min="1" max="30" step="0.01" value="1" oninput="setRateOfInterestVal();emiCalculate();">
															</div>	
															<div class="col-lg-1"></div>
															<div class="col-lg-1">
																<input id="txtRateOfInterest" type="text" onkeypress="return isNumberKey(event)" class="form-control" value="1" oninput="setSliderRateOfInterestVal();emiCalculate();">
															</div>
															
															<div class=""><span>%</span>
															</div>
														</div>
														<br><br>
														
														
														<span>No. of Years :</span>
														<div class="row">
															<div class="col-sm-9">
																<span class="fl">5</span><span class="fr">30</span>
																<input id="noOfYears" type="range" min="5" max="30" step="1" value="5" oninput="setNoOfYearsVal();emiCalculate();">
															</div>	
															<div class="col-lg-1"></div>
															<div class="col-lg-1">
																<input id="txtNoOfYears"type="text" onkeypress="return isNumberKey(event)" class="form-control" value="5" oninput="setSliderNoOfYearVal();emiCalculate();">
															</div>
															
															<div class=""><span>Yrs</span></div>
														</div>
														<br><br>
														
														
														<div class="col-sm-12 center">
															<label>INSTALLMENT PER MONTH</label>
															
														</div>
														<div class="col-sm-12 center">
															
															<input id="txtInstalmentPerMonth" type="text" disabled="disabled">
														</div>
														
													</div>
												</div>
											</div>
									
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo">
															<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
															&nbsp;Auto Loan Calculator
														</a>
													</h4>
												</div>

												<div class="panel-collapse collapse" id="collapseTwo">
													<div class="panel-body">
														<!-- slider bar -->
														<span>Amount(Vehical Price) :</span>
														<div class="row">
															<div class="col-sm-9">
																<span class="fl">0</span><span class="fr">100</span>
																<input id="amountVehicalPrice" type="range" min="0" max="100" step="1" value="0" oninput="setAmountVehicalPrice();autoLoanCalculate();">
																
															</div>
															<div class="col-lg-1"><i class="fa fa-inr fa-2x fr"></i></div>
															<div class="col-lg-1">
																<input id="txtAmountVehicalPrice"type="text" onkeypress="return isNumberKey(event)" class="form-control fl" oninput="setSliderAmountVehicalPrice();autoLoanCalculate();" value="0">
															</div>
															<div class=""><span>Lac</span></div>
														</div>
														<br><br>

														<span>Down Payment :</span>
														<div class="row">
															<div class="col-sm-9">
																<span class="fl">5</span><span class="fr">100</span>
																<input id="downPayment"type="range" min="5" max="100" step="1" value="5" oninput="setDownPayment();autoLoanCalculate();">
															</div>	
															<div class="col-lg-1"></div>
															<div class="col-lg-1">
																<input id="txtDownPayment" type="text" onkeypress="return isNumberKey(event)" class="form-control" oninput="setSliderDownPayment();autoLoanCalculate();" value="5">
															</div>
															
															<div class=""><span>%</span>
															</div>
														</div>
														<br><br>	
														
														<span>Annual Interest Rate :</span>
														<div class="row">
															<div class="col-sm-9">
																<span class="fl">1</span><span class="fr">30</span>
																<input id="annualInterestRate" type="range" min="1" max="30" step="0.1" value="1" oninput="setAnnualInterestRate();autoLoanCalculate();">
															</div>	
															<div class="col-lg-1"></div>
															<div class="col-lg-1">
																<input id="txtAnnualInterestRate"type="text" onkeypress="return isNumberKey(event)" class="form-control" oninput="setSliderAnnualInterestRate();autoLoanCalculate();" value="1">
															</div>
															
															<div class=""><span>%</span>
															</div>
														</div>
														<br><br>	
														
														<span>Term/Period :</span>
														<div class="row">
															<div class="col-sm-9">
																<span class="fl">1</span><span class="fr">84</span>
																<input id="period" type="range" min="1" max="84" step="1" value="1" oninput="setPeriod();autoLoanCalculate()">
															</div>	
															<div class="col-lg-1"></div>
															<div class="col-lg-1">
																<input id="txtPeriod"type="text" onkeypress="return isNumberKey(event)" class="form-control" oninput="setSliderPeriod();autoLoanCalculate()" value="1">
															</div>
															
															<div class=""><span>mnths</span>
															</div>
														</div>
														<br><br>
					<div class="row">
						<div>
							<div class="col-sm-12 center">
								<label>&nbspMONTHLY PAYMENT</label>
								<label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspTOTAL INTEREST PAYMENT</label>
								<label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspTOTAL AMOUNT TO PAY</label>
							</div>
							<div class="col-sm-12 center">
								<input id="monthlyPayment" type="text" disabled="disabled">
								<input id="totalInterestPayment" type="text" disabled="disabled">
								<input id="totalAmountToPay" type="text" disabled="disabled">
							</div>
						</div>
					</div>
					<!-- slider bar end -->
													</div>
												</div>
											</div>

											<div class="panel panel-default">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree">
															<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
															&nbsp;Retirement Calculator
														</a>
													</h4>
												</div>

												<div class="panel-collapse collapse" id="collapseThree">
													<div class="panel-body">
														<!-- Retirement Slider -->
													
														<span>Your Age :</span>
														<div class="row">
															<div class="col-sm-7">
																<span class="fl">0</span><span class="fr">100</span>
																<input id="yourAge" type="range" min="0" max="100" step="1" value="0" oninput="setYourAge();retirementCalculate();">
																
															</div>
															<div class="col-lg-1"></div>
															<div class="col-lg-1">
																<input id="txtYourAge" type="text" onkeypress="return isNumberKey(event)" class="form-control fl" oninput="setSliderYourAge();retirementCalculate();" value="0">
															</div>
															<div class=""><span>Yrs</span></div>
														</div>
													
														<br><br>

														<span>Age your plan to retire :</span>
														<div class="row">
															<div class="col-sm-7">
																<span class="fl">5</span><span class="fr">100</span>
																<input id="ageRetire" type="range"  min="5" max="100" step="1" value="5" oninput="setAgeRetire();retirementCalculate();">
															</div>	
															<div class="col-lg-1"></div>
															<div class="col-lg-1">
																<input id="txtAgeRetire" type="text" onkeypress="return isNumberKey(event)" class="form-control" oninput="setSliderAgeRetire();retirementCalculate();" value="5">
															</div>
															
															<div class=""><span>Yrs</span>
															</div>
														</div>
														<br><br>	
														
														<span>Amount you want to retire with (Per Annum at today's prices) :</span>
														<div class="row">
															<div class="col-sm-7">
																<span class="fl">1</span><span class="fr">500</span>
																<input id="amountRetire" type="range" min="1" max="500" step="1" value="1" oninput="setAmountRetire();retirementCalculate();">
															</div>	
															<div class="col-lg-1"><i class="fa fa-inr fa-2x fr"></i></div>
															<div class="col-lg-1">
																<input id="txtAmountRetire" type="text" onkeypress="return isNumberKey(event)" class="form-control" oninput="setSliderAmountRetire();retirementCalculate();" value="1">
															</div>
															
															<div class=""><span>Lac</span>
															</div>
														</div>
														<br><br>	
														
														<span>Your current savings :</span>
														<div class="row">
															<div class="col-sm-7">
																<span class="fl">0</span><span class="fr">500</span>
																<input id="yourCurrentSavings" type="range" min="0" max="500" step="0.1" value="1" oninput="setYourCurrentSavings();retirementCalculate();">
															</div>	
															<div class="col-lg-1"><i class="fa fa-inr fa-2x fr"></i></div>
															<div class="col-lg-1">
																<input id="txtYourCurrentSavings"type="text" onkeypress="return isNumberKey(event)" class="form-control" oninput="setSliderYourCurrentSavings();retirementCalculate();" value="0">
															</div>
															
															<div class=""><span>Lac</span>
															</div>
														</div>
														<br><br>
														
														<span>Your monthly savings :</span>
														<div class="row">
															<div class="col-sm-7">
																<span class="fl">0</span><span class="fr">500</span>
																<input id="yourMonthlySavings" type="range" min="0" max="500" step="1" value="1" oninput="setYourMonthlySavings();retirementCalculate();">
															</div>	
															<div class="col-lg-1"><i class="fa fa-inr fa-2x fr"></i></div>
															<div class="col-lg-1">
																<input id="txtYourMonthlySavings" type="text" onkeypress="return isNumberKey(event)" class="form-control" oninput="setSliderYourMonthlySavings();retirementCalculate();" value="0">
															</div>
															
															<div class=""><span>K</span>
															</div>
														</div>
														<br><br>	
														
														<span>Return you earn on your savings % (p.a.) :</span>
														<div class="row">
															<div class="col-sm-7">
																<span class="fl">1</span><span class="fr">15</span>
																<input id="returnSavings" type="range" min="1" max="15" step="0.1" value="1" oninput="setReturnSavings();retirementCalculate();">
															</div>	
															<div class="col-lg-1"></div>
															<div class="col-lg-1">
																<input id="txtReturnSavings"type="text" onkeypress="return isNumberKey(event)" class="form-control" oninput="setSliderReturnSavings();retirementCalculate();" value="1">
															</div>
															
															<div class=""><span>%</span>
															</div>
														</div>
														<br><br>	
														
														<span>Expected Inflation Rate % (p.a.) :</span>
														<div class="row">
															<div class="col-sm-7">
																<span class="fl">1</span><span class="fr">15</span>
																<input id="expectedInflation"type="range" min="1" max="15" step="0.1" value="1" oninput="setExpectedInflation();retirementCalculate();">
															</div>	
															<div class="col-lg-1"></div>
															<div class="col-lg-1">
																<input id="txtExpectedInflation" type="text" onkeypress="return isNumberKey(event)" class="form-control" oninput="setSliderExpectedInflation();retirementCalculate();" value="1">
															</div>
															
															<div class=""><span>%</span>
															</div>
														</div>
														<br><br>
					<div class="row">
						<div>
							<div class="col-sm-12 center">
								<label>&nbspYOU NEED TO SAVE<br>(Per Month)</label>
								<label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspAT RETIREMENT YOU WOULD<br>REQUIRE</label>
								<label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbspWITH YOUR CURRENT SAVINGS YOU<br> SHOULD BE ABLE TO SAVE</label>
							</div>
							<div class="col-sm-12 center">
								<input id="youNeedToSave"type="text" disabled="disabled">
								<input id="atRetirementYouWouldRequired"type="text" disabled="disabled">
								<input id="yourCurrentSavingsAble"type="text" disabled="disabled">
							</div>
						</div>
					</div>
														<!-- Retirement Slider End -->
													</div>
												</div>
											</div>
											
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4 class="panel-title" >
														<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour">
															<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
															&nbsp;SIP Calculator
														</a>
													</h4>
												</div>

												<div class="panel-collapse collapse" id="collapseFour">
													<div class="panel-body">
														<!-- SIP Slider -->
														<span>Expected Amount :</span>
														<div class="row">
															<div class="col-sm-9">
																<span class="fl">1</span><span class="fr">100</span>
																<input id="expectedAmount"type="range" min="1" max="100" step="1" value="1" oninput="setExpectedAmount();sipCalculate();">
																
															</div>
															<div class="col-lg-1"><i class="fa fa-inr fa-2x fr"></i></div>
															<div class="col-lg-1">
																<input id="txtExpectedAmount"type="text" onkeypress="return isNumberKey(event)" class="form-control fl" oninput="setSliderExpectedAmount();sipCalculate();" value="5">
															</div>
															<div class=""><span>Lac</span></div>
														</div>
														<br><br>

														<span>No. Of Years</span>
														<div class="row">
															<div class="col-sm-9">
																<span class="fl">5</span><span class="fr">30</span>
																<input id="sipNoOfYears"type="range" min="5" max="30" step="1" value="5" oninput="setSipNoOfYears();sipCalculate();">
															</div>	
															<div class="col-lg-1"></div>
															<div class="col-lg-1">
																<input id="txtSipNoOfYears"type="text" onkeypress="return isNumberKey(event)" class="form-control" oninput="setSliderSipNoOfYears();sipCalculate();" value="5">
															</div>
															
															<div class=""><span>Yrs</span>
															</div>
														</div>
														
														
														<br><br>
														
														
														<span>Expected Return (p.a.) :</span>
														<div class="row">
															<div class="col-sm-9">
																<span class="fl">5</span><span class="fr">30</span>
																<input id="expectedReturn"type="range" min="5" max="30" step="1" value="5" oninput="setExpectedReturn();sipCalculate();">
															</div>	
															<div class="col-lg-1"></div>
															<div class="col-lg-1">
																<input id="txtExpectedReturn" type="text" onkeypress="return isNumberKey(event)" class="form-control" value="5" oninput="setSliderExpectedReturn();sipCalculate();"> 
															</div>
															
															<div class=""><span>Yrs</span></div>
														</div>
														<br><br>
														<div class="col-sm-12 center">
															<label>SIP NEEDED (Per Month)</label>
															
														</div>
														<div class="col-sm-12 center">
															
															<input id="sipNeeded" type="text" disabled="disabled" align="center">
														</div>
														<!-- SIP Slider End -->
													</div>
												</div>
											</div>
										</div>

										<!-- /section:elements.accordion -->
									</div><!-- /.col -->
<!-- Script for EMI Calculator -->
<script>
function emiCalculate()
{
  //E = P×r×(1 + r)n/((1 + r)n - 1)
  var ri=$("#txtRateOfInterest").val();
  var r = ri/1200;
  var nm=$("#txtNoOfYears").val();
  var n = nm*12;	   
  var la=$("#txtLoanAmount").val();
  var principalAmt=la*100000;
  var rateCal=Math.pow(r+1, n); //(1+r)raised n
  var totalEMI1=principalAmt*r*rateCal;//P×r×(1 + r)n
  var totalEMI2=rateCal-1;//(1 + r)n - 1)
  var totalEMI=totalEMI1/totalEMI2;
  var finalEMI=Math.round(totalEMI);
  $("#txtInstalmentPerMonth").val(finalEMI+'/-');
//  console.log( data+' p:'+principalAmt+ ' n: '+n+' Total: '+finalEMI+' Total:'+totalAmtToPay);
}
</script>

<script>
function setLoanAmountVal()
{
	$("#txtLoanAmount").val($("#loanAmount").val());
	
}


function setSliderLoanAmountVal()
{
	if($('#txtLoanAmount').val()=='' || $('#txtLoanAmount').val()==null)
		{
		$("#loanAmount").val(0);
		}
	else{
	$("#loanAmount").val(parseInt($('#txtLoanAmount').val()));
	}
	
}

function setRateOfInterestVal()
{
	$("#txtRateOfInterest").val($("#rateOfInterest").val());
}

function setSliderRateOfInterestVal()
{
	 if($("#txtRateOfInterest").val()=='' || $("#txtRateOfInterest").val()==null)
		{
		$("#rateOfInterest").val(0);
		}
	else{ 
		$("#rateOfInterest").val(parseFloat($("#txtRateOfInterest").val()));	
	 } 
}

function setNoOfYearsVal()
{
	$("#txtNoOfYears").val($("#noOfYears").val());
}

function setSliderNoOfYearVal()
{
	if($("#txtNoOfYears").val()=='' || $("#txtNoOfYears").val()==null)
		{
		$("#noOfYears").val(5);
		}
	else{
		$("#noOfYears").val(parseInt($("#txtNoOfYears").val()));
	}
}
</script>

<!-- Script for EMI Calculator End -->			
<!-- Script for Auto Loan Calculator -->
<script >
function autoLoanCalculate(){
	var avp=$("#txtAmountVehicalPrice").val();
	  var amt=avp*100000;
	  var tdp=$("#txtDownPayment").val();
	  var dp=(tdp*amt)/100;
	  //var downPayment=Math.round(dp);
	  var downPayment=dp;
	  var principalAmt=amt-downPayment;
	  var tai=$("#txtAnnualInterestRate").val();
	  var r = tai/1200;
	  var tp=$("#txtPeriod").val();
	  var n = tp;	   
	  var rateCal=Math.pow(r+1, n); //(1+r)raised n
	  var totalEMI1=principalAmt*r*rateCal;//P×r×(1 + r)n
	  var totalEMI2=rateCal-1;//(1 + r)n - 1)
	  var totalEMI=totalEMI1/totalEMI2;
	  var finalEMI=Math.round(totalEMI);
	  var totalAmtToPay=Math.round(totalEMI*n);
	  var totalInterestToPay=totalAmtToPay-principalAmt;
	  var toalAmt=amt+totalInterestToPay;
	  $("#monthlyPayment").val(finalEMI+'/-');
	  $("#totalInterestPayment").val(totalInterestToPay+'/-');
	  $("#totalAmountToPay").val(toalAmt+'/-');
}
</script>
<script>
	function setAmountVehicalPrice()
	{
		$("#txtAmountVehicalPrice").val($("#amountVehicalPrice").val());
	}
	function setSliderAmountVehicalPrice()
	{
		if($("#txtAmountVehicalPrice").val()==''|| $("#txtAmountVehicalPrice").val()==null)
			{
			$("#amountVehicalPrice").val(0);
			}
		else{
		$("#amountVehicalPrice").val(parseInt($("#txtAmountVehicalPrice").val()));
		}
	}

	function setDownPayment()
	{
		$("#txtDownPayment").val($("#downPayment").val());
	}
	function setSliderDownPayment()
	{
		if($("#txtDownPayment").val()==''||$("#txtDownPayment").val()==null)
			{
			$("#downPayment").val(0);
			}
		else{
			$("#downPayment").val(parseInt($("#txtDownPayment").val()));
		}
	}
	
	function setAnnualInterestRate()
	{
		$("#txtAnnualInterestRate").val($("#annualInterestRate").val());
	}
	function setSliderAnnualInterestRate()
	{
		if($("#txtAnnualInterestRate").val()==''||$("#txtAnnualInterestRate").val()==null)
			{
			$("#annualInterestRate").val(0);
			}
		else{
			$("#annualInterestRate").val(parseFloat($("#txtAnnualInterestRate").val()));
		}
	}
	
	function setPeriod()
	{
		$("#txtPeriod").val($("#period").val());
	}
	function setSliderPeriod()
	{
		if($("#txtPeriod").val()==''||$("#txtPeriod").val()==null)
			{
			$("#period").val(0);
			}
		else{
			$("#period").val($("#txtPeriod").val());
		}
	}
</script>
<!-- Script for Auto Loan Calculator End -->		
<!-- Script for Retirement Calculator -->
<script>
function retirementCalculate(){
	var annuity;
	var roi;
	var tenure;
	var remain;
	var fv;
	var cost;
	var amt;
	var inf;
	var tp;
	var sav;
	var age;
	var ret;
	var retamt;
	var current;
    var msav;
    age=$("#txtYourAge").val();
    ret=$("#txtAgeRetire").val();
    var ar=$("#txtAmountRetire").val();
    retamt=ar*100000;
    tenure=ret-age;
    $("#error").text("");
    if(tenure<0)
	{
		$("#error").text("Retirement age should be more than your current age");
		return false;
	}
    var ycs=$("#txtYourCurrentSavings").val();
    current=ycs*100000;console.log(current);
    var trs=$("#txtReturnSavings").val();
    roi=Math.pow(1+trs/100,1/12)-1;
    var roi1=trs/100;
    var ten=$("#txtExpectedInflation").val();
    inf=ten/100;
    fv=retamt*Math.pow(1+inf,tenure);
	remain=fv-current*Math.pow((1+roi1),tenure);
	var tms=$("#txtYourMonthlySavings").val();
	msav=tms*1000;
	tp=msav*(Math.pow(1+roi,tenure*12)-1)/roi;
	if(isNaN(Math.round((remain*roi)/(Math.pow((1+roi),tenure*12)-1))))
	{
		$("#error").text("Retirement age should be more than your current age");
	}
	else
	{
		var txtNeedToSave=Math.round((remain*roi)/(Math.pow((1+roi),tenure*12)-1));
		var txtRequiredAmt=Math.round(fv);
		var txtAbleToSave=Math.round(tp+current*Math.pow((1+roi1),tenure));
		if(isFinite(txtNeedToSave)){
		$("#youNeedToSave").val(txtNeedToSave+'/-');
		}else{$("#youNeedToSave").val('0/-');
		}
		$("#atRetirementYouWouldRequired").val(txtRequiredAmt+'/-');
		$("#yourCurrentSavingsAble").val(txtAbleToSave+'/-');
	}
	}
</script>
<script>

function setYourAge()
{
	$("#txtYourAge").val($("#yourAge").val());
}
function setSliderYourAge()
{
	if($("#txtYourAge").val()==''||$("#txtYourAge").val()==null)
		{
		$("#yourAge").val(0);
		}
	else{
		$("#yourAge").val(parseInt($("#txtYourAge").val()));
	}
}

function setAgeRetire()
{
	$("#txtAgeRetire").val($("#ageRetire").val());
}
function setSliderAgeRetire()
{
	if($("#txtAgeRetire").val()==''||$("#txtAgeRetire").val()==null)
		{
		$("#ageRetire").val(0);
		}
	else{
		$("#ageRetire").val(parseInt($("#txtAgeRetire").val()));
	}
}

function setAmountRetire()
{
	$("#txtAmountRetire").val($("#amountRetire").val());
}
function setSliderAmountRetire()
{
	if($("#txtAmountRetire").val()==''||$("#txtAmountRetire").val()==null)
		{
		$("#amountRetire").val(0);
		}
	else{
		$("#amountRetire").val(parseInt($("#txtAmountRetire").val()));
	}
}

function setYourCurrentSavings()
{
	$("#txtYourCurrentSavings").val($("#yourCurrentSavings").val());
}
function setSliderYourCurrentSavings()
{
	if($("#txtYourCurrentSavings").val()==''||$("#txtYourCurrentSavings").val()==null)
		{
		$("#yourCurrentSavings").val(0);
		}
	else{
		$("#yourCurrentSavings").val(parseFloat($("#txtYourCurrentSavings").val()));
	}
}

function setYourMonthlySavings()
{
	$("#txtYourMonthlySavings").val($("#yourMonthlySavings").val());
}
function setSliderYourMonthlySavings()
{
	if($("#txtYourMonthlySavings").val()==''||$("#txtYourMonthlySavings").val()==null)
		{
		$("#yourMonthlySavings").val(0);
		}
	else{
		$("#yourMonthlySavings").val(parseInt($("#txtYourMonthlySavings").val()));
	}
}

function setReturnSavings()
{
	$("#txtReturnSavings").val($("#returnSavings").val());
}
function setSliderReturnSavings()
{
	if($("#txtReturnSavings").val()==''||$("#txtReturnSavings").val()==null)
		{
		$("#returnSavings").val(1);
		}
	else{
		$("#returnSavings").val(parseFloat($("#txtReturnSavings").val()));
	}
}

function setExpectedInflation()
{
	$("#txtExpectedInflation").val($("#expectedInflation").val());
}
function setSliderExpectedInflation()
{
	if($("#txtExpectedInflation").val()==''||$("#txtExpectedInflation").val()==null)
		{
		$("#expectedInflation").val(1);
		}
	else{
		$("#expectedInflation").val(parseFloat($("#txtExpectedInflation").val()));
	}
}
</script>
<!-- Script for Retirement Calculator End -->
<!-- Script for SIP Calculator -->
<script>
function sipCalculate(){
	var tea=$("#txtExpectedAmount").val();
	var ExpAmt =tea*100000;
	function SIfuturevalue_sipneedcalc(returnspercent)
	   {
	   	 var rate = returnspercent/100;
		 var nper = 1/12;
		 var PMT= 0;
		 var pv = -100;
		 var type = 1;
		 var fv;
		 fv =(PMT*(1+rate*type)*(1- Math.pow(1+ rate,nper))/rate)-pv*Math.pow(1+rate,nper);
		 return (fv);
	  }
	var cl_returns=$("#txtExpectedReturn").val();
	var cl_tenure=$("#txtSipNoOfYears").val();
	var cl_famt=ExpAmt;
	
	var A = (1+(cl_returns/100))* (((Math.pow(1+(cl_returns/100),cl_tenure)-1)))/ ((1+(cl_returns/100))-1);
    var B = (SIfuturevalue_sipneedcalc(cl_returns))-100;
    var C = (1+(B/100))* (((Math.pow(1+(B/100),12*cl_tenure)-1)))/ ((1+(B/100))-1);
    var D = cl_famt/A;
    var cl_sipcalculated = Math.round(cl_famt/C);
    $("#sipNeeded").val(cl_sipcalculated+'/-');
    /* console.log("SIP:"+cl_sipcalculated); */
}
</script>
<script>

function setExpectedAmount()
{
	$("#txtExpectedAmount").val($("#expectedAmount").val());
}
function setSliderExpectedAmount()
{
	if($("#txtExpectedAmount").val()==''||$("#txtExpectedAmount").val()==null)
		{
		$("#expectedAmount").val(1);
		}
	else{
		$("#expectedAmount").val(parseInt($("#txtExpectedAmount").val()));
	}
}

function setSipNoOfYears()
{
	$("#txtSipNoOfYears").val($("#sipNoOfYears").val());
}
function setSliderSipNoOfYears()
{	
	if($("#txtSipNoOfYears").val()=='' || $("#txtSipNoOfYears").val()==null)
		{
		$("#sipNoOfYears").val(5);
		}
	else{
		$("#sipNoOfYears").val(parseInt($("#txtSipNoOfYears").val()));
	}
}

function setExpectedReturn()
{
	$("#txtExpectedReturn").val($("#expectedReturn").val());
}
function setSliderExpectedReturn()
{
	if($("#txtExpectedReturn").val()==''||$("#txtExpectedReturn").val()==null)
		{
		$("#expectedReturn").val(5);
		}
	else{
		$("#expectedReturn").val(parseInt($("#txtExpectedReturn").val()));
	}
}
</script>
<!-- Script for SIP Calculator End -->


