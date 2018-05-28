function jsonPopulateDropdown(url, data, dropdown, fieldName, selectedValue) {
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

function jsonPopulateAutoComplete(url, data, dropdown, fieldName, selectedValue) {	
	//$(dropdown).val('');
	//$(dropdown).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	//alert("autoComplete");
	$.ajax({
			type : "GET",
			url : url,
			data : data,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				$.each(msg, function(index, item) {					
					//$(dropdown).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });					
				});
				
				var userLabelValueList = new Array();
				 $(msg).each(function(index, item){
						var object = {};
						object.value = item.codeValueId;
						object.label = item.codeValue;
						if(fieldName=='text__16'){
							$('#text__16').val(item.codeValue);
							return;
						}
						
						userLabelValueList.push(object);
				 }); 
				 
				 $(dropdown)
				    // don't navigate away from the field on tab when selecting an item
				    .bind( "keydown", function( event ) {
				      if ( event.keyCode === $.ui.keyCode.TAB &&
				    	$( this ).data( "ui-autocomplete" ).menu.active ) {
				        event.preventDefault();
				      }
				    })
				   
				    
				    .autocomplete({
				      minLength: 0,
				      source: function( request, response ) {
				       last=extractLast(request.term);
				       if(last==null || last=='' || last==' ')
						{
							return false;
						}
				       response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
				      },
				      focus: function() {
				        // prevent value inserted on focus
				        return false;
				      },
				     
				      select: function( event, ui ) {
				    	  var terms = split( this.value );
					        
					        console.log('terms='+terms);
					        
					        // remove the current input
					        terms.pop();
					        // add the selected item 
					        terms.push(ui.item.label);
					        	partyId=ui.item.value;
					        	if(fieldName=='auto__2')
					        		$('#countryIdHidden').val(partyId);
					        	else if(fieldName=='auto__3')
						        	$('#stateIdHidden').val(partyId);
					        	else if(fieldName=='auto__13')
						        	$('#universityIdHidden').val(partyId);
					        	else if(fieldName=='auto__14')
						        	$('#courseIdHidden').val(partyId);
					        	else if(fieldName=='auto__15')
						        	$('#subjectIdHidden').val(partyId);
					        	
							
					        	$(dropdown).change();
//						alert('a='+a);
					        // 					        feedItemPost
//					        alert('id='+ui);
					        
					        // add placeholder to get the comma-and-space at the end
					        terms.push( "" );
					        this.value = terms.join( "" );
					        
					        var labelArr = $(this).data('label') || new Array();
					        labelArr.push(ui.item);
					        $(this).data('label',labelArr);
					        console.log($(this).data());
					        
					        return false;
				      }
				    });				 

				//var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			   // selectBox.selectOption(selectedValue);
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
}

function jsonPopulateAutoCompleteForCarGoal(url, data, dropdown, fieldName, selectedValue) {
	//$(dropdown).val('');
	//$(dropdown).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	//alert("autoComplete");
	$.ajax({
			type : "GET",
			url : url,
			data : data,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				$.each(msg, function(index, item) {					
					//$(dropdown).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });					
				});
				
				var userLabelValueList = new Array();
				 $(msg).each(function(index, item){
						var object = {};
						object.value = item.codeValueId;
						object.label = item.codeValue;						
						userLabelValueList.push(object);
				 }); 
				 
				 $(dropdown)
				    // don't navigate away from the field on tab when selecting an item
				    .bind( "keydown", function( event ) {
				      if ( event.keyCode === $.ui.keyCode.TAB &&
				    	$( this ).data( "ui-autocomplete" ).menu.active ) {
				        event.preventDefault();
				      }
				    })
				   
				    
				    .autocomplete({
				      minLength: 0,
				      source: function( request, response ) {
				       last=extractLast(request.term);
				       if(last==null || last=='' || last==' ')
						{
							return false;
						}
				       response( $.ui.autocomplete.filter(userLabelValueList, request.term) );
				      },
				      focus: function() {
				        // prevent value inserted on focus
				        return false;
				      },
				     
				      select: function( event, ui ) {
				    	  var terms = split( this.value );
					        
					        console.log('terms='+terms);
					        
					        // remove the current input
					        terms.pop();
					        // add the selected item 
					        terms.push(ui.item.label);
					        	partyId=ui.item.value;
					        	if(fieldName=='auto__4')
					        		$('#brandIdHidden').val(partyId);
					        	else if(fieldName=='auto__5')
						        	$('#categoryIdHidden').val(partyId);
					        	else if(fieldName=='auto__6')
						        	$('#modelIdHidden').val(partyId);
					        	else if(fieldName=='auto__7')
						        	$('#courseIdHidden').val(partyId);
					        	else if(fieldName=='auto__14')
						        	$('#stateIdHidden').val(partyId);
					        	else if(fieldName=='autoCity__4')
						        	$('#hiddenStateId').val(partyId);					        					        					      
					        	$(dropdown).change();
//						alert('a='+a);
					        // 					        feedItemPost
//					        alert('id='+ui);
					        
					        // add placeholder to get the comma-and-space at the end
					        terms.push( "" );
					        this.value = terms.join( "" );
					        
					        var labelArr = $(this).data('label') || new Array();
					        labelArr.push(ui.item);
					        $(this).data('label',labelArr);
					        console.log($(this).data());
					        
					        return false;
				      }
				    });				 

				//var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			   // selectBox.selectOption(selectedValue);
			},
			error : function(msg) {
				$('.result').html(msg.d);
			}
		});
	return false;
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

// Function not in use 
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

function createSlider(ctrlName, minVal, maxVal, stepBy, ctrlTextBox){
	
	$(ctrlName).slider({
		min : minVal,
		max : maxVal,
		step : stepBy,
		slide : function(event, ui) {
			$(ctrlTextBox).val(ui.value);
		}
	});
	$(ctrlTextBox).val($(ctrlName).slider("value"));
	
	$(ctrlTextBox).keyup(function() {
		$(ctrlTextBox).val();
		$(ctrlName).slider('value', $(ctrlTextBox).val());
	});
}
//added by kunal
function jsonPopulateDropdownAssignedTo(dropdown){
	$(dropdown).empty();
	$(dropdown).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/partner/getAssignedDropdownvalues",
		async : true,
		contentType : "application/json; charset=utf-8",
		dataType : "json",
		success : function(item) {
				var pstName = item.pstDepartmentName+'-'+item.pstName;
				var mstName = item.mstDepartmentName + '-' +item.mstName;
				var mst2Name = item.mst2DepartmentName + '-' + item.mst2Name;
				var fpaName = item.fpaDepartmentName + '-' + item.fpaName;
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.pstPartyId, text: pstName });
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.mstPartyId, text: mstName });
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.mst2PartyId, text: mst2Name });
				$(dropdown).data("selectBox-selectBoxIt").add({ value: item.fpaPartyId, text: fpaName });
		}
	});
	return false;
}

function jsonPopulateDropdownForTasks(dropdown1, dropdown2, dropdown3) {
	$(dropdown1).empty();
	$(dropdown2).empty();
	
	$(dropdown1).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	$(dropdown2).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	if(dropdown3 != ""){
		$(dropdown3).empty();
		$(dropdown3).data("selectBox-selectBoxIt").add({ value: "", text: " -- Select --"});
	}
	$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/partner/codevalues",
			async : true,
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(msg) {
				$.each(msg, function(index, item) {					
					//$(dropdown).get(0).options[$(dropdown).get(0).options.length] = new Option(item.codeValue, item.codeValueId);
					if(item.codeTypeId == 19){
						$(dropdown1).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });
					}else if(item.codeTypeId == 17){
						$(dropdown2).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });
					}else{
						$(dropdown3).data("selectBox-selectBoxIt").add({ value: item.codeValueId, text: item.codeValue });
					}
					//$(dropdown).val(item.codeValueId);
				});

				//var selectBox = $(dropdown).selectBoxIt().data('selectBox-selectBoxIt');			    
			    //selectBox.selectOption(selectedValue);
			    
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

