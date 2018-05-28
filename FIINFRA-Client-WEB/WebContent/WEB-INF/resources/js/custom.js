// JavaScript Document

/* Target type selector Two */   

var GRAPH_COLORS = ['#327649', '#2b378d','#31204d','#2d0f5a','#740f53','#d00008', '#6e0803', '#2e4b0b','#1c2755','#430b32','#2c3e85','#193f52','#ae6544','#1c8583','#506381','#b64358','#594401','#1d6d6e','#8d4701','#6d82bb'];
                    //'#250a15','#340e1d','#431226','#52152e','#611937','#701d3f','#7f2147', 

function toChartData(dataList){
	var chartData=[];
	for(var i=0;i<dataList.length;i++){
		 chartData[i] = [];
		 chartData[i][0] = dataList[i].label;
		 chartData[i][1] = dataList[i].data;
		
		 
	 }
	
	return chartData;
}

function jsonPopulateDropdownForGoals(url, data, dropdown, fieldName, selectedValue) {
	$(dropdown).empty();
	$(dropdown).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	
	$.ajax({
			type : "GET",
			url : url,
			data : data,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				$.each(msg, function(index, item) {					
					$(dropdown).data("selectBox-selectBoxIt").add({ value: item.value, text: item.text });					
				});

				var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			    selectBox.selectOption(selectedValue);
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
}

//Function not in use 
function jsonSetSlider(url, data, slider, fieldName) {	
	$(slider).slider( "option", "value", 0);
	
	$.ajax({
			type : "GET",
			url : url,
			data : data,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				$.each(msg, function(index, item) {		
				});
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
}

function createSliderAndSetValue(ctrlName, minVal, maxVal, stepBy, ctrlTextBox,value) {

    $(ctrlName).slider({
        min: minVal,
        max: maxVal,
        step: stepBy,
        value: value,
        slide: function (event, ui) {
            $(ctrlTextBox).val(ui.value);
			
        }
    });
    $(ctrlTextBox).val($(ctrlName).slider("value"));

    $(ctrlTextBox).keyup(function () {
        $(ctrlTextBox).val();
        $(ctrlName).slider('value', $(ctrlTextBox).val());
    });
	
}
function jsonPopulateDropdownED(url, data, dropdown, fieldName, selectedValue) {
	$(dropdown).empty();
	$.ajax({
			type : "GET",
			url : url,
			data : data,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				$.each(msg, function(index, item) {					
					$(dropdown).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });					
				});

				var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			    selectBox.selectOption(selectedValue);
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
}

function setTextDataED(url, textField) {
		$.ajax({
			type : "GET",
			url : url,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				$.each(msg, function(index, item) {					
					 $(textField).val(item.codeValue);					
				});

			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
}




function jsonPopulateDropdown(url, data, dropdown, fieldName, selectedValue, allowNull) {
	
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
            	    options += '<option value="' + item.codeValueId + '">'
					+ item.codeValue
					+ '</option>';
				});
					
                    options += '</select>';
                    parent.html(options);
                  
                    $("select").selectBoxIt();


				var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			    selectBox.selectOption(selectedValue);
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
}

function jsonPopulateKeyValue(url, data, dropdown, fieldName, selectedValue, allowNull) {
  
    
    $.ajax({
                  type : "GET",
                  url : url,
                  data : data,
                  async: true,
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
                    	    options += '<option value="' + item.id + '">'
    						+ item.name
    						+ '</option>';
                        });
                        options += '</select>';
                        parent.html(options);
                      
                        $("select").selectBoxIt();
                        
                       var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');                     
                       selectBox.selectOption(selectedValue);
                      
                  },
                  error : function(msg) {
                        $('.result').html(msg.d);
                  }
           });
    return false;
}

function getAttributeCode(questId, attVal){
	var attCodeId = "";
	$.each(parsedQuestionOptionMap, function(key, value){
		console.log("questId : " + key);
		if(questId == key){
	    	$.each(value, function(key,val){
	    		console.log("attId : " + val.id + " ; value : " + val.val);
	            if(val.val == attVal){
	            	attCodeId = val.id;
	            	return;
	            }
	        });
	    }		
	});
	
	return attCodeId;
}
function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox) {
	//alert(ctrlName);
$(ctrlName).slider({
    min: minVal,
    max: maxVal,
    step: stepBy,
    slide: function (event, ui) {
    	$(ctrlTextBox).addClass('changed-input');
        $(ctrlTextBox).val(ui.value);
		
    }
});

var currentValue = parseInt($(ctrlTextBox).val(),10);  
$(ctrlName).slider('value', isNaN(currentValue) ? 0:currentValue);
$(ctrlTextBox).val($(ctrlName).slider('value'));

$(ctrlTextBox).keyup(function () {
    $(ctrlTextBox).val();
    $(ctrlName).slider('value', $(ctrlTextBox).val());
});
}



function convertToNumber(textField){
	var value = textField.val();
	value = value.replace('/','');
	value = value.replace('-','');
	value = value.replace(',','');
	return isNaN(parseInt(value,10)) ? 0:parseInt(value,10);
}

function toNumber(value){
	value = value.replace('/','');
	value = value.replace('-','');
	value = value.replace(',','');
	return isNaN(parseInt(value,10)) ? 0:parseInt(value,10);
}

function showGooglePieChart(title,data,options, elementId ){
	  var chartData=[];
	  chartData[0] = [];
	  chartData[0][0] = title;
	  chartData[0][1] = 'Value';
		for(var i=0;i<data.length;i++){
			 chartData[i+1] = [];
			 chartData[i+1][0] = data[i].label;
			 chartData[i+1][1] = data[i].data;
		 }
		//alert(JSON.stringify(chartData));
		
		
        var graph = google.visualization.arrayToDataTable(chartData);
        
        var formatter = new google.visualization.NumberFormat(
        	      {pattern: 'Rs ##,###'});
        formatter.format(graph, 1); 
        
        var chart = new google.visualization.PieChart(document.getElementById(elementId));
        chart.draw(graph, options);

	  
}

$.validator.addMethod("bankName", function(value, element) {
    return this.optional(element) || /^[a-zA-Z\s&().]+$/i.test(value);
}, "Enter Valid Data");

$.validator.addMethod("accountName", function(value, element) {
    return this.optional(element) || /^[a-zA-Z\s]+$/i.test(value);
}, "Invalid Account Name");

jQuery.validator.addMethod("exactlength", function(value, element, param) {
	 return this.optional(element) || value.length == param;
	}, $.validator.format("Invalid Length"));

jQuery.validator.addMethod(
        "regex",
        function(value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "Invalid value."
);


$.validator.addMethod("validEmail", function(value, element, param) {
	 return this.optional(element) || isValidEmail(value);
	}, $.validator.format("Invalid Email"));

$.validator.addMethod("CheckDOB", function (value, element) {
    var selectedDate = $(element).datepicker('getDate');
    var now = new Date();
    return selectedDate <= now ; 
    
}, "Date Can not be in Future ");



$.validator.addMethod("checkValidName", function(value, element) {
	console.log(value +'  '+element);
    return this.optional(element) || /^[a-z0-9_ \-]+$/i.test(value); 
}, "Invalid Name");

$.validator.addMethod("isDuplicate", function(value, element) {
	
	var count = 0;
	$(".my_income_li_bx:not(.dummy)").each(function( element) {
		
		if($(this).find("[name='incomeName']").val() == value){
			count++;
		}
	});
	
	if(count >1){
		return true;
	}
	return false;
}, "Duplicate Name");

function isValidEmail(emailAddress) {
	  var sQtext = '[^\\x0d\\x22\\x5c\\x80-\\xff]';
	  var sDtext = '[^\\x0d\\x5b-\\x5d\\x80-\\xff]';
	  var sAtom = '[^\\x00-\\x20\\x22\\x28\\x29\\x2c\\x2e\\x3a-\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]+';
	  var sQuotedPair = '\\x5c[\\x00-\\x7f]';
	  var sDomainLiteral = '\\x5b(' + sDtext + '|' + sQuotedPair + ')*\\x5d';
	  var sQuotedString = '\\x22(' + sQtext + '|' + sQuotedPair + ')*\\x22';
	  var sDomain_ref = sAtom;
	  var sSubDomain = '(' + sDomain_ref + '|' + sDomainLiteral + ')';
	  var sWord = '(' + sAtom + '|' + sQuotedString + ')';
	  var sDomain = sSubDomain + '(\\x2e' + sSubDomain + ')*';
	  var sLocalPart = sWord + '(\\x2e' + sWord + ')*';
	  var sAddrSpec = sLocalPart + '\\x40' + sDomain; // complete RFC822 email address spec
	  var sValidEmail = '^' + sAddrSpec + '$'; // as whole string

	  var reValidEmail = new RegExp(sValidEmail);

	  if (reValidEmail.test(emailAddress)) {
	    return true;
	  }

	  return false;
	}

function calculateAmountMonthly(amount, freq) {
	var multiply;
	if(freq == "63001"){
		multiply= 30;
	}
	else if(freq == "63002"){
		multiply= 4;
	}
	else if(freq == "63003"){
		multiply= 1;
	}
	else if(freq == "63004"){
		multiply= 3;
	}
		
	else if(freq == "63005"){
		multiply= 6;
	}
	else if(freq == "63006"){
		multiply= 12;
	}
	else{
		multiply= 1;
	}
	if(multiply ==0){
		multiply = 1;
	}
		
	return parseInt(amount/multiply,10);
}

function calculateAmountYearly(amount, freq) {
	console.log(amount+" "+freq);
	var multiply;
	if(freq == "63001"){
		multiply= 365;
	}
	else if(freq == "63002"){
		multiply= 52;
	}
	else if(freq == "63003"){
		multiply= 12;
	}
	else if(freq == "63004"){
		multiply= 4;
	}
		
	else if(freq == "63005"){
		multiply= 2;
	}
	else if(freq == "63006"){
		multiply= 1;
	}
	else{
		multiply= 1;
	}
	if(multiply ==0){
		multiply = 1;
	}
	console.log(multiply +'  '+ parseInt(amount*multiply,10));
		
	return parseInt(amount*multiply,10);
}
$(document).ready(function(){
	$('.numbersOnly').keyup(function () { 
	    this.value = this.value.replace(/[^0-9\.]/g,'');
	});
});

function numberWithCommas(x) {
	x=x.toString();
	var lastThree = x.substring(x.length-3);
	var otherNumbers = x.substring(0,x.length-3);
	if(otherNumbers != '')
	    lastThree = ',' + lastThree;
	return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;
    //return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


/**
 * @param id
 *            id of popup to be opened
 * @param halfHeightOfPopup
 *            half the hieght of the popup to be opened
 * @param halfWidhtOfPopup
 *            half the width of popup to be opend opens the popup having the id
 *            equals to received id at the center of window
 */
function openPopupWebApp(id, halfHeightOfPopup, halfWidhtOfPopup) {
	$('#shadow_div_web_app').show();
	$('#common_popup_div').show();
	$('#' + id).show();
	var height = ($(window).height() / 2) - halfHeightOfPopup;
	$('#' + id).css('margin-top', height);
	var width = ($(window).width() / 2) - halfWidhtOfPopup;
	$('#' + id).css('margin-left', width);
	// alert(id);

}

/**
 * @param id
 *            id of popup to be closed close the popup having the id equals to
 *            received id
 */
function closePopupWebApp(id) {

	$('#common_popup_div').hide();
	$('#' + id).hide();
	// $("#loadingImage_backPage").css({
	// opacity: 1.0
	// });
	$('#shadow_div_web_app').hide();
}


function split( val ) {
	 return val.split( /;\s*/ );
  }
function extractLast( term ) {
		 return split( term ).pop();
	}
String.prototype.contains = function(it) {
	return this.indexOf(it) != -1;
};
Array.prototype.contains = function(obj) {
	var i = this.length;
	while (i--) {
		if (this[i] == obj) {
			return true;
		}
	}
	return false;
}
