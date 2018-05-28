var pstList;
var mstList;
var fpaList;
var mst2List;
var exisingList;
var selectedPartyId;
var teamMemberDepartment;
var formId;
var contactType;


var files = [];
var file_temp;
String.prototype.contains = function(it) {
	return this.indexOf(it) != -1;
};



function renderEditDetails(){
	  // alert('renderEditDetails common');	
	   var templateId = localStorage.getItem('temmplateIdForEdit');
	  // alert(templateId);
	   if(templateId != '')
		   editTemplate(templateId);
	}


// $(document).bind("contextmenu",function(e){
// e.preventDefault();
//});

function getInternetExplorerVersion()
// Returns the version of Windows Internet Explorer or a -1
// (indicating the use of another browser).
{
	var rv = -1; // Return value assumes failure.
	if (navigator.appName == 'Microsoft Internet Explorer') {
		var ua = navigator.userAgent;
		var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
		if (re.exec(ua) != null)
			rv = parseFloat(RegExp.$1);
	}
	return rv;
}
function checkIEVersion() {
	var ver = getInternetExplorerVersion();
	// alert( msg );
	return ver;
}

// returns to the back page
function back() {
	 history.go(-1);
//	window.location.reload(true);
}

// clears the date in input box (kept this because as textbox is read only)
function clearDate(pId) {
	document.getElementById(pId).value = '';
}

// function validates for the decimal no.
function ValidateDecimal(pDecimal, pDigits, pPrecision) {
	pDecimal = $.trim(pDecimal);
	var isValid = true;
	var allowedDigits = Number(pDigits) - Number(pPrecision);
	if ((isNaN(pDecimal)) || (pDecimal.contains('-'))) {
		isValid = false;
	} else if (pDecimal.contains('.')) {
		var temp = pDecimal.split('.');
		if ((temp[0].length) > allowedDigits)
			isValid = false;
		else if ((temp[1].length) > pPrecision) {
			isValid = false;
		}
	} else if (pDecimal.length > allowedDigits) {
		isValid = false;
	}
	return isValid;
}

// function removes the loan details row from dynamic input
function remove(tableId, checkboxId, precordType, functionToBeCalled, pDetails) {
	// alert(tableId);
	var checks = [];
	//var temp = 'goalCheckEmergencyFund';
	//alert((this.id).substring());
	if(this.id !='goalCheckEmergencyFund')
		checks = getCheckedIdsForRemoval(tableId, checkboxId, precordType);
	
	// (checks);
	
	if (checks.length == 0)
		// alert('You have not selected any record');
		showAlertMessage1("Message", "You have not selected any record.",
				"information", doNothing);
	else {
		isAllBankAccountSelected = false;
		checks = checks.reverse();
		// alert(checks);
		for ( var i = 0; i < checks.length; i++) {
			var rowNo = checks[i];
			var tableSize = $('#' + tableId + ' tr').size();
			// alert(rowNo);
			$("#" + (rowNo)).remove();
		}
		var rowNo = $('#' + tableId + ' tr').size();
		if ((rowNo - 1) == 0) {
			$('#' + tableId).empty();
			if (pDetails == '')
				var temp = [ functionToBeCalled(1, '') ];
			else
				var temp = [ functionToBeCalled(1, '', pDetails) ];
			$('#' + tableId).append(temp);
		}
	}
}

// function returns the row ids(which are present) of table specified
function getRowIdsForTable(pTableId, pRecordType) {
	var rowIds = [];
	$("#" + pTableId + " tr").each(function() {
		var id = $(this).attr('id');
		if (id != 0) {
			var len = pRecordType.length;
			id = id.substring(len, id.length);
			rowIds.push(id);
		}
	});
	return rowIds;
}

// function returns the array of seleted inputs which are to be removed from
// dynamic UI
function getCheckedIdsForRemoval(pTableId, pCheckOptionId, pRecordType) {
	var checks = [];
	var temp = 'goalCheck';
	//alert(pCheckOptionId.substring(temp.length,pCheckOptionId.length));
	$("#" + pTableId + " tr").each(function() {
		var id = $(this).attr('id');
		if (id != 0) {
			var len = pRecordType.length;
			id = id.substring(len, id.length);
			var goalType = '';
			
			if(pRecordType == 'goal')
				goalType = document.getElementById('goalGoalType'+id).value;
			
			if(goalType != 37008){
				if (document.getElementById(pCheckOptionId + id).checked)
					checks.push(pRecordType + id);
			}

		}
	});
	return checks;
}

// function returns the max id for the specified table
function getMaxId(pTableId, pRecordType) {
	var maxId;
	$("#" + pTableId + " tr").each(function() {
		var id = $(this).attr('id');
		if (id != 0) {
			var len = pRecordType.length;
			id = Number(id.substring(len, id.length));
			maxId = (maxId > id) ? maxId : id;
		}
	});
	return maxId + 1;
}

// function returns you the Querystring value of the specified parameter
function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
	var regexS = "[\\?&]" + name + "=([^&#]*)";
	var regex = new RegExp(regexS);
	var results = regex.exec(window.location.search);
	if (results == null)
		return "";
	else
		return decodeURIComponent(results[1].replace(/\+/g, " "));
}

// checking for input is only alphabets
function isAlphabet(elem) {
	var alphaExp = /^[a-zA-Z ]+$/;
	if (elem.match(alphaExp)) {
		return true;
	} else {
		return false;
	}
}

// checking for input is only alphanumeric
function isAlphaNumeric(elem) {
	var alphaExp = /^[a-zA-Z0-9 ]+$/;
	if (elem.match(alphaExp)) {
		return true;
	} else {
		return false;
	}
}

// checking for valid email address
function IsValidEmail(pEmail) {
	var atpos = pEmail.indexOf("@");
	var dotpos = pEmail.lastIndexOf(".");
	// (!/^[a-zA-Z0-9-\_.]+@[a-zA-Z0-9-\_.]+\.[a-zA-Z0-9.]{2,3}$/
	// .test(emailId))
	if (!/^[a-zA-Z0-9-\_.]+@[a-zA-Z0-9-\_.]+\.[a-zA-Z0-9.]{2,3}$/.test(pEmail)) {
		return false;
	}
	return true;
}

// this function checks for the numeric key codes
function isNumberKey(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
	// alert(charCode);
	var kCode = event.keyCode || e.charCode;
	if ((charCode == 17 || charCode == 2))
		return false;
	if (((charCode > 47) && (charCode < 58)) || (charCode == 8))
		return true;

	// added by amol c.

	// checking for input is only alphabets
	function isAlphabet(elem) {
		var alphaExp = /^[a-zA-Z ]+$/;
		if (elem.match(alphaExp)) {
			return true;
		} else {
			return false;
		}
	}

	// checking for input is only alphanumeric
	function isAlphaNumeric(elem) {
		var alphaExp = /^[a-zA-Z 0-9]+$/;
		if (elem.match(alphaExp)) {
			return true;
		} else {
			return false;
		}
	}

	// checking for valid email address
	function IsValidEmail(pEmail) {
		var atpos = pEmail.indexOf("@");
		var dotpos = pEmail.lastIndexOf(".");
		// (!/^[a-zA-Z0-9-\_.]+@[a-zA-Z0-9-\_.]+\.[a-zA-Z0-9.]{2,3}$/
		// .test(emailId))
		if (!/^[a-zA-Z0-9-\_.]+@[a-zA-Z0-9-\_.]+\.[a-zA-Z0-9.]{2,3}$/
				.test(pEmail)) {
			return false;
		}
		return true;
	}

	// this function checks for the numeric key codes
	function isNumberKey(evt) {
		var charCode = (evt.which) ? evt.which : event.keyCode
		// alert(charCode);
		var kCode = event.keyCode || e.charCode;
		if ((charCode == 17 || charCode == 2))
			return false;
		if (((charCode > 47) && (charCode < 58)) || (charCode == 8))
			return true;

		return false;
	}

	// checks if PAN card number is valid or not
	function isValidPAN(pPanCardNo) {
		alert(pPanCardNo);
		if (pPanCardNo != "") {
			var panPat = /^([A-Z]{5})(\d{4})([A-Z]{1})$/;
			if (pPanCardNo.search(panPat) == -1) {
				return false;
			}
		}
		return true;
	}

	// checks if mobile no is valid or not
	function isValidMobile(pMobileNo) {
		var mobileNoLength = pMobileNo.length;
		var firstIndexCharacter = pMobileNo.slice(0, 1);
		var remainingNo = pMobileNo.slice(1, mobileNoLength);
		var intRegex = /^\d+$/;

		if (firstIndexCharacter == '+') {
			if (!intRegex.test(remainingNo)) {
				return false;
			}
		} else {
			if (!intRegex.test(pMobileNo)) {
				return false;
			}
		}
		return true;
	}

	// checks if entered input is numeric or not
	function isNumeric(pVal) {
		if (pVal.contains('.')) {
			return false;
		}
		if (isNaN(pVal)) {
			return false;
		}
		return true;
	}

	// ---------------------------------------------------------------------

	/**
	 * @param e
	 *            event
	 * @param functionToBeCalled
	 *            function name to be called on pressing enter key
	 */
	function checkEnterKeyOnPopup(e, functionToBeCalled) {
		e.which = e.which || e.keyCode;
		if (e.which == 13) {
			[ functionToBeCalled() ];
		}
	}

	/**
	 * checks for browser's back button and reload the page.
	 */
	function logicForBackbutton() {
		var d = new Date();
		d = d.getTime();
		// alert($('#reloadValue').val());
		if ($('#reloadValue').val().length == 0) {
			$('#reloadValue').val(d);
			$('body').show();
		} else {
			$('#reloadValue').val('');
			location.reload();
		}
	}
	return false;
}

// checks if PAN card number is valid or not
function isValidPAN(pPanCardNo) {
	if (pPanCardNo != "") {
		var panPat = /^([a-zA-Z]{5})(\d{4})([a-zA-Z]{1})$/;
		if (pPanCardNo.search(panPat) == -1) {
			return false;
		}
	}
	return true;
}

// checks if mobile no is valid or not
function isValidMobile(pMobileNo) {
	var mobileNoLength = pMobileNo.length;
	var firstIndexCharacter = pMobileNo.slice(0, 1);
	var remainingNo = pMobileNo.slice(1, mobileNoLength);
	var intRegex = /^\d+$/;

	if (firstIndexCharacter == '+') {
		if (!intRegex.test(remainingNo)) {
			return false;
		}
	} else {
		if (!intRegex.test(pMobileNo)) {
			return false;
		}
	}
	return true;
}


//checks if username  is valid or not
function isValidUserId(username) {
	var alphaExp = /^[a-zA-Z0-9@_.-]+$/;
	if (username.match(alphaExp)) {
		
		return true;
	} else {
		
		return false;
		
	}
}

function isValidLengthUserId(username)
{
		
	if((!username.match(/[A-Za-z]/)) ||  (username.length<3) )
		{
		return false;
		}
	else
		{
		return true;
		}
}
function isSpaceInUserId(username) {
	
	if (username.contains(' ')) {
		//alert('space hay');
		return false;
	} else {
		
		return true;
		
	}
}

// checks if entered input is numeric or not
function isNumeric(pVal) {
	try{
	if (pVal.contains('.')) {
		return false;
	}
	if (isNaN(pVal)) {
		return false;
	}
	return true;
	}catch(e)
	{
		
	}
}

/**
 * @param e
 *            event
 * @param functionToBeCalled
 *            function name to be called on pressing enter key
 */
function checkEnterKeyOnPopup(e, functionToBeCalled) {
	e.which = e.which || e.keyCode;
	if (e.which == 13) {
		[ functionToBeCalled() ];
	}
}

/**
 * checks for browser's back button and reload the page.
 */
function logicForBackbutton() {
	try{
	var d = new Date();
	d = d.getTime();
	// alert($('#reloadValue').val());
	if ($('#reloadValue').val().length == 0) {
		$('#reloadValue').val(d);
		$('body').show();
	} else {
		$('#reloadValue').val('');
		location.reload();
	}
	}catch(e){
		
	}
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
	halfHeightOfPopup=110;
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

/**
 * @param titleOfAlert
 *            e.g "Error","Message"
 * @param contentOfAlert
 *            e.g "Invalid username or password"
 * @param typeOfAlert
 *            e.g "information","confirmation","error" shows the alert message
 *            according to received parameter
 */

function showAlertMessage(titleOfAlert, contentOfAlert, typeOfAlert,
		functionToBeCalled) {
//	var $jq_1_9_3=$;
//	var $jq_1_9_4=$;
	if (contentOfAlert == 'Something went wrong please try again.') {
		contentOfAlert = 'The connection to the server has been lost. Please try again later.';
	}
	try {

		$.Zebra_Dialog(contentOfAlert, {
			'type' : typeOfAlert,
			'title' : titleOfAlert,
			'onClose' : (function() {
				[ functionToBeCalled() ];
			})
		});
//	$('.ZebraDialog').css('z-index', '50001');
	} catch (e) {
		try {

			$jq_1_9_1.Zebra_Dialog(contentOfAlert, {
				'type' : typeOfAlert,
				'title' : titleOfAlert,
				'onClose' : (function() {
					[ functionToBeCalled() ];
				})
			});
//			$('.ZebraDialog').css('z-index', '50001');
		} catch (e) {
			
			
					try {
						profileLogout(typeOfAlert,contentOfAlert,titleOfAlert,functionToBeCalled);

						$jq_1_9_2.Zebra_Dialog(contentOfAlert, {
							'type' : typeOfAlert,
							'title' : titleOfAlert,
							'onClose' : (function() {
								[ functionToBeCalled() ];
							})
						});
//						$('.ZebraDialog').css('z-index', '50001');
					} catch (e) {
						try {
							profileLogout(typeOfAlert,contentOfAlert,titleOfAlert,functionToBeCalled);

							$jq_1_9_2.Zebra_Dialog(contentOfAlert, {
								'type' : typeOfAlert,
								'title' : titleOfAlert,
								'onClose' : (function() {
									[ functionToBeCalled() ];
								})
							});
//							$('.ZebraDialog').css('z-index', '50001');
						} catch (e) {
							try {
								profileLogout(typeOfAlert,contentOfAlert,titleOfAlert,functionToBeCalled);

								$jq_1_9_2.Zebra_Dialog(contentOfAlert, {
									'type' : typeOfAlert,
									'title' : titleOfAlert,
									'onClose' : (function() {
										[ functionToBeCalled() ];
									})
								});
//								$('.ZebraDialog').css('z-index', '50001');
							} catch (e) {
								alert(contentOfAlert);
								[ functionToBeCalled() ];
							}
//							alert(contentOfAlert);
//							[ functionToBeCalled() ];
						}
//						alert(contentOfAlert);
//						[ functionToBeCalled() ];
					}
		}
	}


}
/**
 * 
 * @param action
 *            name to be called
 */
function redirectFunction(action) {
	window.location.href = localStorage.getItem('actionName');
}
/**
 * does nothing.
 */
function doNothing() {
	//alert("doNothing:"+options);
}

function generateFP() {

	isPlaneGenerated = localStorage.getItem('isPlaneGenerated');
	if (isPlaneGenerated == 1) {
		window.open('generateFPForMemebr');
	} else {
		showAlertMessage('Message', 'Your Financial Plan is not generated.', 'information',
				doNothing);

	}

}

function showAlertMessage1(titleOfAlert, contentOfAlert, typeOfAlert,
		functionToBeCalled) {
	showAlertMessage(titleOfAlert, contentOfAlert, typeOfAlert,
			functionToBeCalled);
	return;
	if (contentOfAlert == 'Something went wrong please try again.') {
		contentOfAlert = 'The connection to the server has been lost. Please try again later.';
	}
	try {

		jq_1_9_3.Zebra_Dialog(contentOfAlert, {
			'type' : typeOfAlert,
			'title' : titleOfAlert,
			'onClose' : (function() {
				[ functionToBeCalled() ];
			})
		});
//		$('.ZebraDialog').css('z-index', '50001');
	} catch (e) {
		//alert(e)
		try {

			$.Zebra_Dialog(contentOfAlert, {
				'type' : typeOfAlert,
				'title' : titleOfAlert,
				'onClose' : (function() {
					[ functionToBeCalled() ];
				})
			});
//			$('.ZebraDialog').css('z-index', '50001');
		} catch (e) {
			alert(contentOfAlert);
			[ functionToBeCalled() ];
		}
	}

}
/**
 * 
 * @param action
 *            name to be called
 */
function redirectFunction1(action) {
	window.location.href = localStorage.getItem('actionName');
}
/**
 * does nothing.
 */
function doNothing1() {
//	$('.ZebraDialog').css('z-index','999999');
}
/**
 * does nothing.
 */
function doNothing() {

}

function selection(tableId, id, EmergencyFundIndex) {
	//alert(EmergencyFundIndex);
	if (document.getElementById(id).checked) {
		$('#' + tableId + ' input[type="checkbox"]').each(function() {
			if(this.id !='goalCheckEmergencyFund');
				this.checked = true;
		});
	} else {
		$('#' + tableId + ' input[type="checkbox"]').each(function() {
			//alert(this.id);
			$(this).removeAttr("checked");

		});
	}
}

function selectionExpense(tableId, id, recordType) {
	// alert(recordType);
	if (document.getElementById(id).checked) {
		// $('#'+tableId+' input[type="checkbox"]').each(function() {
		// this.checked=true;
		// });

		for ( var i = 1; i < $('#' + tableId + ' tr').size(); i++) {
			document.getElementById(recordType + 'Check' + i).checked = true;
		}
	} else {
		for ( var i = 1; i < $('#' + tableId + ' tr').size(); i++) {
			document.getElementById(recordType + 'Check' + i).checked = false;
		}
	}
}

/**
 * validate person mobile.
 */
function isValidPersonMobile(pMobileNo) {
	var mobileNoLength = pMobileNo.length;
	var intRegex = /^\d+$/;
	if (mobileNoLength != 10) {
		return false;
	} else if (!intRegex.test(pMobileNo)) {
		return false;
	}
	return true;
}

function showMyPortfolio() {
	var ver = checkIEVersion();
	contextPath = $jq_1_9_1("#contextPath").val();
	if (ver > -1) {
		if (($jq_1_9_1('#ffreedom_uname').val() == ''
				|| $jq_1_9_1('#ffreedom_uname').val() == 'null' || $jq_1_9_1(
				'#ffreedom_uname').val() == null)
				|| ($jq_1_9_1('#ffreedom_pass').val() == ''
						|| $jq_1_9_1('#ffreedom_pass').val() == 'null' || $jq_1_9_1(
						'#ffreedom_pass').val() == null)) {
			showAlertMessage1("Message", $jq_1_9_1('#dialog-modal50').html()
					+ '.', "information", doNothing);

		} else {
			localStorage.setItem('ffreedom_username', $jq_1_9_1(
					'#ffreedom_uname').val());
			localStorage.setItem('ffreedom_password', $jq_1_9_1(
					'#ffreedom_pass').val());
			window.open($jq_1_9_1("#contextPath").val() + '/ffreedom.jsp');
		}
	} else {
		var uname = $jq_1_9_1('#ffreedom_frame').contents().find('#txtUserID');
		var pass = $jq_1_9_1('#ffreedom_frame').contents().find('#txtUserPass');
		if (($jq_1_9_1('#ffreedom_uname').val() == ''
				|| $jq_1_9_1('#ffreedom_uname').val() == 'null' || $jq_1_9_1(
				'#ffreedom_uname').val() == null)
				|| ($jq_1_9_1('#ffreedom_pass').val() == ''
						|| $jq_1_9_1('#ffreedom_pass').val() == 'null' || $jq_1_9_1(
						'#ffreedom_pass').val() == null)) {

			showAlertMessage1("Message", $jq_1_9_1('#dialog-modal50').html()
					+ '.', "information", doNothing);

		} else {
			$jq_1_9_1('#ffreedom_frame').contents().find('#txtUserID').attr(
					'value', $jq_1_9_1('#ffreedom_uname').val());
			$jq_1_9_1('#ffreedom_frame').contents().find('#txtUserPass').attr(
					'value', $jq_1_9_1('#ffreedom_pass').val());
			var form = $jq_1_9_1('#ffreedom_frame').contents().find('#myform');
			form.submit();
			showPopup();
		}
	}
}
function showPopupInCatch() {
	var height = ($jq_1_9_1(window).height() / 2) - 275;
	$jq_1_9_1('#ffreedom_popup').css('margin-top', height);
	var width = ($jq_1_9_1(window).width() / 2) - 475;
	$jq_1_9_1('#ffreedom_popup').css('margin-left', width);
	$jq_1_9_1('#common_popup_div').show();
	$jq_1_9_1('#ffreedom_popup').show();
	$jq_1_9_1('#shadow_div_web_app').show();
}
function closeFFreedomInCatch() {
	$jq_1_9_1('#common_popup_div').hide();
	$jq_1_9_1('#ffreedom_popup').hide();
	$jq_1_9_1('#shadow_div_web_app').hide();
	$jq_1_9_1('#ffreedom_popup').empty();
	$jq_1_9_1('#ffreedom_popup')
			.append(
					'<image class="close_img" src="'
							+ contextPath
							+ '/images/x_button_close.png" onclick="closeFFreedom()" /><br/><iframe id="ffreedom_frame"src="'
							+ $jq_1_9_1('#contextPath').val()
							+ '/ffreedom"> </iframe>');
}

/**
 * submits the data collection
 */
function submitDataCollection() {
	// showAlertMessage("Message","<br/><br/>Are you sure you want to submit
	// data
	// collection?","question",doNothing1);
//	alert($('#entityStage').val()+'-----------------Data Collection');
	if($('#entityStage').val() == 'Data Collection' || $('#entityStage').val() == 15001){
		if (confirm("Are you sure you want to submit data collection?")) {
			
			window.location.href = $('#contextPath').val()+"/submitDataCollection.action";
		}
	}
	

}
function storeAttachment(){
	file_temp = $('#queryAttachment').prop("files");
	$.each(file_temp, function(i, obj) {
		files.push(obj);
		// alert(obj.name);
	});
// alert(files.length);
	localStorage.setItem('queryAttachment',JSON.stringify(files));
}
function uploadAttachment(){
	
 var files=localStorage.getItem('queryAttachment');
 files=JSON.parse(files);
// alert(files.length);
 for (var z = 0; z < files.length; z++) {
 uploadFile(files[z]);
 }
}

function uploadFile(file) {
// alert(file);
	var formData = new FormData();
	formData.append("file", file);
// var xhr = new XMLHttpRequest();
// alert(formData);
// xhr.upload.addEventListener("progress", uploadProgress, false);
// xhr.addEventListener("load", uploadComplete, false);
// xhr.open("POST", "uploadattachment", false);
// xhr.send(formData);
	
		$
	 					.ajax({
	 						type : "POST",
	 						url : $('#contextPath').val()+'/uploadattachment',
	 						data : formData,
	 						processData: false,
	 					    contentType: false,
	 						success : function(result) {
	 							
	 						}
	 					});
}
/*
 * get the upload status.
 */
function uploadProgress(event) {
// var progress = Math.round(event.loaded / event.total * 100);
// document.getElementById("status").innerHTML = "Progress " + progress + "%";
}
/*
 * get the upload status.
 */
function uploadComplete(event) {
// document.getElementById("status").innerHTML = event.target.responseText;
}
 function showDefaultImageOnError(id) {
	   // alert("hello");
	   $('img[id="' + id + '"]').attr('src', $('#contextPath').val()+'/images/images.jpg');
	   // alert("hello"+$('#img').attr('src') );
	   // this.src='images/profile-pic.png';
 
}
/**
 * Approves the data collection
 */
function approveDataCollection() {
	// showAlertMessage("Message","<br/><br/>Are you sure you want to submit
	// data
	// collection?","question",doNothing1);
	if (confirm("Are you sure you want to accept data collection?")) {
		window.location.href = $('#contextPath').val()+"/submitDataCollection.action";
	}

}
/**
 * submits the data collection
 */
function rejectDataCollection() {

	if (confirm("Are you sure you want resubmission of data collection?")) {
		// openPopupWebApp("rejectionForm",250,300);
		$('#rejectionForm').show();
		$('#shadow_div_web_app').show();
		$('#common_popup_div').show();
		$('#rejectionNote').val('');
		$('.modal-window').css('width', '500px !important');

		// window.location.href = "rejectDataCollection.action";
	}

}
/**
 * manages the data collection lock upon conditions.
 */
function manageDataCollectionLock() {
	
//	 alert($('#entityName').val());
	 if($('#entityName').val()==''){
		 $('#entityName').val($('#user_name').val());
	 }
//	 alert($('#entityStage').val()+">>>>>>>>>>>>"+$('#hasPartnerSubmitted').val()+">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+$('#userType').val());
	if (($('#entityStage').val() == 15001 && ($('#hasMemberSubmitted').val() != 'true' && $(
			'#userType').val() == 95002))
			|| $('#entityStage').val() == 'Data Collection'
			&& ($('#hasMemberSubmitted').val() != 'true' && $('#userType')
					.val() == 95002)
			|| $('#userType').val() != 95002) {
		$("#detailsContainerId :input").attr("disabled", false);
		$('.search-button').css('cursor', 'pointer');
		$('#clientName').html($('#entityName').val());

	} else {
		// alert("in else");
		$("#detailsContainerId :input").attr("disabled", true);
		$('.action-buttons').empty();
		$('.datacollection_submit input').attr("disabled", true);
		$('#datacollection_submit .search-button').css('background', 'none');
		$('#datacollection_submit .search-button').css('border', '1px solid');
		$('#datacollection_submit .search-button').css('color', 'black');
		$('#datacollection_submit_bottom .search-button').css('background',
				'none');
		$('#datacollection_submit_bottom .search-button').css('border',
				'1px solid');
		$('#datacollection_submit_bottom .search-button').css('color', 'black');
		$('#datacollection_submit_bottom .search-button').css('cursor',
				'auto !important');
		// if (!$('#entityStage').val() == 'Data Collection'
		// && !$('#entityStage').val() == 15001) {
		$('#data_collection_message')
				.append(
						'Data Collection input is under review and you will not able to update any information.');
		$('#data_collection_message').css('position', 'relative');
		$('#data_collection_message').css('top', '20px');
		$('#clientName').html($('#entityName').val());
		$('#backbuttonBottom').attr("disabled", false);
		$('#backbutton').attr("disabled", false);
		$('.datacollection_submit input').attr("disable", 'disabled');
		// }

	}
	if ($('#userType').val() == 95006) {
		if ($('#entityStage').val() == 15001
				|| $('#entityStage').val() == 'Data Collection') {
			// alert($('#entityName').val());
			$('#clientName').html($('#entityName').val());

		} else {
			// alert($('#entityName').val());
			$('#approve_button').attr("disabled", true);
			$('#approve_button').css('background', 'none !important');
			$('#approve_button').css('border', '1px solid');
			$('#approve_button').css('color', 'black');
			$('#approve_button').css('background', 'none');
			$('#approve_button').css('border', '1px solid');
			$('#approve_button').css('color', 'black');
			$('#approve_button').css('cursor', 'auto');

			$('#approve_button_bottom').attr("disabled", true);
			$('#approve_button_bottom').css('background', 'none');
			$('#approve_button_bottom').css('border', '1px solid');
			$('#approve_button_bottom').css('color', 'black');
			$('#approve_button_bottom').css('background', 'none');
			$('#approve_button_bottom').css('border', '1px solid');
			$('#approve_button_bottom').css('color', 'black');
			$('#approve_button_bottom').css('cursor', 'auto');
			$('#clientName').html($('#entityName').val());
		}
	}
}

function storeAttachment() {
	file_temp = $('#queryAttachment').prop("files");
	$.each(file_temp, function(i, obj) {
		files.push(obj);
		// alert(obj.name);
	});
	// alert(files.length);
	localStorage.setItem('queryAttachment', JSON.stringify(files));
}
function uploadAttachment() {

	var files = localStorage.getItem('queryAttachment');
	files = JSON.parse(files);
	// alert(files.length);
	for ( var z = 0; z < files.length; z++) {
		uploadFile(files[z]);
	}
}

function uploadFile(file) {
	// alert(file);
	var formData = new FormData();
	formData.append("file", file);
	// var xhr = new XMLHttpRequest();
	// alert(formData);
	// xhr.upload.addEventListener("progress", uploadProgress, false);
	// xhr.addEventListener("load", uploadComplete, false);
	// xhr.open("POST", "uploadattachment", false);
	// xhr.send(formData);

	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/uploadattachment',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {

		}
	});
}
/*
 * get the upload status.
 */
function uploadProgress(event) {
	// var progress = Math.round(event.loaded / event.total * 100);
	// document.getElementById("status").innerHTML = "Progress " + progress +
	// "%";
}
/*
 * get the upload status.
 */
function uploadComplete(event) {
	// document.getElementById("status").innerHTML = event.target.responseText;
}
function showDefaultImageOnError(id) {
	// alert("hello");
	$('img[id="' + id + '"]').attr('src',
			$('#contextPath').val() + '/images/chatuser.png');
	// alert("hello"+$('#img').attr('src') );
	// this.src='images/profile-pic.png';
}

function cancelDatacollectionRejectNote() {
	$('#rejectionForm').hide();
	$('#shadow_div_web_app').hide();
	$('#common_popup_div').hide();
	$('#rejectionNote').val('');
}

function submitDatacollectionRejectNote() {
	if ($('#rejectionNote').val() == '') {
		showAlertMessage("Message", "Please enter Resubmission Note.", "error",
				doNothing);
	} else {
		var form=$('#datacollection_reject_note_form');
		form.submit();
//		alert(form);
		//document.datacollection_reject_note_form.submit();
	}
}



//converts ammount string to indian rs style
function intToFormat(nStr)
{
 nStr += '';
 x = nStr.split('.');
 x1 = x[0];
 x2 = x.length > 1 ? '.' + x[1] : '';
 var rgx = /(\d+)(\d{3})/;
 var z = 0;
 var len = String(x1).length;
 var num = parseInt((len/2)-1);

  while (rgx.test(x1))
  {
    if(z > 0)
    {
      x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    else
    {
      x1 = x1.replace(rgx, '$1' + ',' + '$2');
      rgx = /(\d+)(\d{2})/;
    }
    z++;
    num--;
    if(num == 0)
    {
      break;
    }
  }
 return x1 + x2;
}





/**
 * for team members
**/

function openAlocationPage(id,isParty){
	localStorage.setItem('isNewPartner','false');
	selectedPartyId=id;
	$
	.ajax({
		type : "POST",
		url : $('#contextPath').val()
				+ '/getTeammembers?partyId=' + id+'&isParty='+isParty,
		success : function(result) {
			result = JSON.parse(result);
			pstList=result[0];
			mstList=result[1];
			fpaList=result[2];
			mst2List=result[3];
			exisingList=result[4];
			localStorage.setItem('pstList',JSON.stringify(pstList));
			localStorage.setItem('mstList',JSON.stringify(mstList));
			localStorage.setItem('fpaList',JSON.stringify(fpaList));
			localStorage.setItem('mst2List',JSON.stringify(mst2List));
			localStorage.setItem('exisingList',JSON.stringify(exisingList));
			localStorage.setItem('selectedPartyId',selectedPartyId);
			
			openTeamMemberPopup();
		}
	});
}

function openTeamMemberLookup(teamMember){
	localStorage.setItem('teamMemberDepartment',teamMember);
	localStorage.setItem('isNewPartner','false');
	teamMemberDepartment=teamMember;
//	alert($("#contextPath").val() + '/Operational/Jsp/teammemberlookup.jsp')
	var w = window
	.open(
			$("#contextPath").val() + '/Operational/Jsp/teammemberlookup.jsp',
			'popUpWindow',
			'height=600,width=900,left=50,top=20,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes');
}

function generateTemmeberTable(){
	var listToIterate;
	teamMemberDepartment=localStorage.getItem('teamMemberDepartment');
	var isNewPartner=localStorage.getItem('isNewPartner');
	if(isNewPartner=="true"){
		var buId=localStorage.getItem('buId');
		if(teamMemberDepartment=="BU"){
			$.ajax({
				type : "POST",
				url : $('#contextPath').val()
						+ '/getLookUpDataNewPartner?key='+teamMemberDepartment,
				success : function(result) {
					result = JSON.parse(result);
					var list=result;
					$('#teammember_table').empty();
					$('#teammember_table').append('<table id="teammembertable"></table>');
					$('#teammembertable').append('<tr><th class="income_links"></th><th>Name</th><th>Email</th></tr>');
					$(list).each(function(i, obj){
						$('#teammembertable').append('<tr><td class="income_links"><a onclick="closeTeamMemberPopup(\''+teamMemberDepartment+'\',\''+obj.teamMemberId+'\',\''+obj.name+'\')" style="cursor:pointer">Select</a></td><td>'+obj.name+'</td><td>'+obj.emailId+'</td></tr>');
					});
					$('#headerLookup').html('List Of Business Units');
				}
			});
		}else{
			if(buId!=undefined && buId!=0){
				$.ajax({
					type : "POST",
					url : $('#contextPath').val()
							+ '/getLookUpDataNewPartner?key='+teamMemberDepartment+'&buId='+buId,
					success : function(result) {
						result = JSON.parse(result);
						var list=result;
						$('#teammember_table').empty();
						$('#teammember_table').append('<table id="teammembertable"></table>');
						$('#teammembertable').append('<tr><th class="income_links"></th><th>Name</th><th>Business Unit</th><th>Email</th><th>Phone Number</th></tr>');
						$(list).each(function(i, obj){
							$('#teammembertable').append('<tr><td class="income_links"><a onclick="closeTeamMemberPopup(\''+teamMemberDepartment+'\',\''+obj.teamMemberId+'\',\''+obj.name+'\')" style="cursor:pointer">Select</a></td><td>'+obj.name+'</td><td>'+obj.buName+'</td><td>'+obj.emailId+'</td><td>'+obj.mobilePhone+'</td></tr>');
						});
						$('#headerLookup').html('List Of Team Members');
					}
				});
			}else{
				showAlertMessage("Message", "Please select Business Unit first.", "information",closeLookup);
				
			}
		}
		
	}else{
		if(teamMemberDepartment=='PST'){
			listToIterate=JSON.parse(localStorage.getItem('pstList'));
		}else if(teamMemberDepartment=='MST'){
			listToIterate=JSON.parse(localStorage.getItem('mstList'));
		}else if(teamMemberDepartment=='FPA'){
			listToIterate=JSON.parse(localStorage.getItem('fpaList'));
		}else if(teamMemberDepartment=='MST2'){
			listToIterate=JSON.parse(localStorage.getItem('mst2List'));
		}
		$('#teammember_table').empty();
		$('#teammember_table').append('<table id="teammembertable"></table>');
		$('#teammembertable').append('<tr><th class="income_links"></th><th>Name</th><th>Business Unit</th><th>Email</th><th>Phone Number</th></tr>');
		$(listToIterate).each(function(i, obj){
			$('#teammembertable').append('<tr><td class="income_links"><a onclick="closeTeamMemberPopup(\''+teamMemberDepartment+'\',\''+obj.teamMemberId+'\',\''+obj.name+'\')" style="cursor:pointer">Select</a></td><td>'+obj.name+'</td><td>'+obj.buName+'</td><td>'+obj.emailId+'</td><td>'+obj.mobilePhone+'</td></tr>');
		});
	}
	
}

function closeTeamMemberPopup(teamMemberDepartment,id,name){
	window.opener.setTeamMember(teamMemberDepartment,id,name);
	window.close();
}
function setTeamMember(teamMemberDepartment,id,name){
	var isNewPartner=localStorage.getItem('isNewPartner');
	if(isNewPartner=="true"){
		if(teamMemberDepartment=='PST'){
			$('#partnerForm #pstName').val(name);
			$('#partnerForm #pstId').val(id);
		}else if(teamMemberDepartment=='MST'){
			$('#partnerForm #mstName').val(name);
			$('#partnerForm #mstId').val(id);
		}else if(teamMemberDepartment=='FPA'){
			$('#partnerForm #fpaName').val(name);
			$('#partnerForm #fpaId').val(id);
		}else if(teamMemberDepartment=='MST2'){
			$('#partnerForm #mst2Name').val(name);
			$('#partnerForm #mst2Id').val(id);
		}else if(teamMemberDepartment=='BU'){
			$('#partnerForm #buName').val(name);
			$('#partnerForm #buId').val(id);
			$('#partnerForm #pstName').val('');
			$('#partnerForm #pstId').val(0);
			$('#partnerForm #mstName').val('');
			$('#partnerForm #mstId').val(0);
			$('#partnerForm #fpaName').val('');
			$('#partnerForm #fpaId').val(0);
		}
	}else{
		if(teamMemberDepartment=='PST'){
			$('#teammemberForm #pstName').val(name);
			$('#teammemberForm #pstId').val(id);
		}else if(teamMemberDepartment=='MST'){
			$('#teammemberForm #mstName').val(name);
			$('#teammemberForm #mstId').val(id);
		}else if(teamMemberDepartment=='FPA'){
			$('#teammemberForm #fpaName').val(name);
			$('#teammemberForm #fpaId').val(id);
		}else if(teamMemberDepartment=='MST2'){
			$('#teammemberForm #mst2Name').val(name);
			$('#teammemberForm #mst2Id').val(id);
		}
	}
	
}

function openTeamMemberPopup() {
	$('.query-modal-wrap').show();
	$('#shadow_div_web_app').show();
	var height = ($(window).height() / 2) - 170;
	$('.modal-window group').css('left', '0px');
	$('.modal-window group').css('margin-left', '0px');
	$('#centerLoadingImage').hide();
	$('#queryAttachment').val('');
	$('.vertical-offset').css('width','750px');
	$('.vertical-offset').css('top', height);
	var width = ($(window).width() / 2)- (parseInt($('.vertical-offset').css('width')) / 2);
	$('.vertical-offset').css('left', width);
	resetTeamMembers();
	selectedPartyId=localStorage.getItem('selectedPartyId');
	if(selectedPartyId!=0 && selectedPartyId!=='0'){
		var exisingList=JSON.parse(localStorage.getItem('exisingList'));
		$(exisingList).each(function(i, obj){
//				alert(obj);
			$('#teammemberForm #pstName').val(obj.pst);
			$('#teammemberForm #pstId').val(obj.pstId);
			$('#teammemberForm #mstName').val(obj.mst);
			$('#teammemberForm #mstId').val(obj.mstId);
			$('#teammemberForm #fpaName').val(obj.fpa);
			$('#teammemberForm #fpaId').val(obj.fpaId);
			$('#teammemberForm #mst2Name').val(obj.mst2);
			$('#teammemberForm #mst2Id').val(obj.mst2Id);
		});
//			$('#checkboxDiv').hide();
//			$('#isAllMember').hide();
		
	}else{
//			$('#checkboxDiv').show();
//			$('#isAllMember').show();
	}
}
function resetTeamMembers(){
	$('#teammemberForm #pstName').val('');
	$('#teammemberForm #pstId').val(0);
	$('#teammemberForm #mstName').val('');
	$('#teammemberForm #mstId').val(0);
	$('#teammemberForm #fpaName').val('');
	$('#teammemberForm #fpaId').val(0);
	$('#teammemberForm #mst2Name').val('');
	$('#teammemberForm #mst2Id').val(0);
}

function saveTeamMembers(){
	selectedPartyId=localStorage.getItem('selectedPartyId');
	if(selectedPartyId!=0 && selectedPartyId!=='0'){
		$('#selectedIds').val('');
		$('#selectedPartyId').val(selectedPartyId);
//			$('#isAllLead').val(0);
//			$('#isAllMember').val(0);
	}else{
		var list = new Array();
		$('#data :checked').each(function(i, obj) {
			list[i] = $(this).val();
		});
		$('#selectedIds').val(list);
		$('#selectedPartyId').val(0);
		
	}
	if($('#isAllLead').is(':checked')){
		$('#isAllLeadHidden').val(1);
	}else{
		$('#isAllLeadHidden').val(0);
	}
	if($('#isAllMember').is(':checked')){
		$('#isAllMemberHidden').val(1);
	}else{
		$('#isAllMemberHidden').val(0);
	}
	if($('#teammemberForm #pstId').val()==0 && $('#teammemberForm #mstId').val()==0 && $('#teammemberForm #fpaId').val()==0 && $('#teammemberForm #mst2Id').val()==0){
	
	}else{
		openPopupWebApp('centerLoadingImage',25,35);
		$.ajax({
			type : "POST",
			url : $('#contextPath').val()
					+ '/saveTeamMemberAllocations',
			data:	$('#teammemberForm').serialize(),
			success : function(result) {
				try{
				showAlertMessage("Message", "Workstation changes has been updated successfully for selected users.", "information", reloadPage);
				closePopupWebApp('centerLoadingImage'); 
				}catch(e){
					showAlertMessage("Error", "The connection to the server has been lost. Please try again later.", "error", reloadPage);
					closePopupWebApp('centerLoadingImage'); 
				}
			}
		});
	}
	
}
function openTeamMemberPopupBulk(entity,isParty){
	var list = new Array();
	$('#data :checked').each(function(i, obj) {
		list[i] = $(this).val();
	});

	if (list.length == 0) {
		showAlertMessage("Message", "Please select atleast one "+entity+".", "information", doNothing);
	}else{
		openAlocationPage(0,isParty);
	}
	
}

function reloadPage(){
	closeTeamMemberPopupBulk();
	setResult('');
}
function closeLookup(){
	closeTeamMemberPopup('','','');
}
function resetAddPartnerDiv(){
	$('#partnerForm #pstName').val('');
	$('#partnerForm #pstId').val(0);
	$('#partnerForm #mstName').val('');
	$('#partnerForm #mstId').val(0);
	$('#partnerForm #fpaName').val('');
	$('#partnerForm #fpaId').val(0);
//	$('#partnerForm #buName').val('');
//	$('#partnerForm #buId').val(0);
	$('#partnerForm #firstName').val('');
	$('#partnerForm #lastName').val('');
	$('#partnerForm #emailId').val('');
	$('#partnerForm #phoneNo').val('');
	$('#partnerForm #arnCode').val('');
	$('#partyIdHidden').val(0);
	$('#partnerForm input').each(function(i,obj) {
		$(obj).css('border-color','grey');
		$(obj).removeAttr('title');
	});
}
function closeTeamMemberPopupBulk(){
	$('.query-modal-wrap').hide();
	$('#shadow_div_web_app').hide();
}

function closeNewQueryDiv() {
	$('.query-modal-wrap').hide();
	$('#shadow_div_web_app').hide();
	// 		closePopupWebApp('query_form_div');
}

function inputPathFinder(leadId,leadName,isPathFinderSubmitted,isMember,buId){
//	alert('buId='+buId+' '+'isPathFinderSubmitted='+isPathFinderSubmitted);
	if(isMember==1){
		localStorage.setItem('fromMemberPage','true');
	}else{
		localStorage.setItem('fromMemberPage','false');
	}
	//leadName2=leadName2.replace("'",'&#39;');
	if(isPathFinderSubmitted==true || isPathFinderSubmitted =='true'){
		checkForPFsubmitted(leadId,leadName,buId);
	}else{
		proceed(1,leadId,leadName,buId);
	}	
}

function checkForPFsubmitted(leadId,leadName,buId){
	showAlertMessage("Message","" +
			"Analysis report and Action Plan will be regenerated. Are you sure you want to proceed? Click Yes to proceed and No to cancel.","question",doNothing1);
			$('.ZebraDialog_Question').css('background-size','149px');
//		$('.ZebraDialog_Question').css('background-position-x','5px');
//		$('.ZebraDialog_Question').css('background-position-y','2px');
//		$('.ZebraDialog_Question').css('background-position','5px 2px');
//		$('.ZebraDialog_Question').css('background-image','url("'+$("#context").val()+'"/images/question1.png") !important');
//		$('.ZebraDialog').css('width','500px');
		
		$('.ZebraDialog_Button0').attr('href','javascript:proceed(0,\''+leadId+'\',\''+leadName+'\',\''+buId+'\')');
		$('.ZebraDialog_Button1').attr('href','javascript:proceed(1,\''+leadId+'\',\''+leadName+'\',\''+buId+'\')');
}
function proceed(proceed,leadId,leadName,buId){
	if(proceed==1){
		setTimeout(function() {
			showAlertMessage("Message","Transferring to DC tool...","information",doNothing1);
			$('.ZebraDialog').css('height','100px');
//			Please <b style=\"color:#428bca\">LOGOUT</b> to come back to this screen.
			$('.ZebraDialog_Buttons').empty();
//			alert('in proces='+buId);
			setTimeout(function() {
				$('#viewOutput').empty();
				$('#viewOutput').append('<input type="hidden" name="leadId" value="'+leadId+'" />');
				$('#viewOutput').append('<input type="hidden" name="leadName" value="'+leadName+'" />');
				$('#viewOutput').append('<input type="hidden" name="buId" value="'+buId+'" />');
				$('#viewOutput').attr('target','');
				document.viewOutput.action=$('#contextPath').val()+'/partner/redirectPathfinderInput';
				document.viewOutput.submit();
			},5000 );
		},1000 );
		
		
	}else{
		return;
	}
}


function loadJs(){
	$('body').append('<script src="'+ $("#contextPath").val()+'/js/bootstrap.js"></script>');
	$('body').append('<script src="'+ $("#contextPath").val()+'/js/jquery.js"></script>');
	$('body').append('<script src="'+ $("#contextPath").val()+'/js/bootstrap-collapse.js"></script>');
	$('body').append('<script src="'+ $("#contextPath").val()+'/js/bootstrap-tab.js"></script>');
	
}

function validateAssumption(id,e){
	id=id.substring(id.indexOf('assumption')+10)
	if(id==98021 || id==98022 || id==98027 || id==98046 || id==98019 || id==98001){
	
	if ( $.inArray(e.keyCode,[46,8,9,27,13]) !== -1 ||
            // Allow: Ctrl+A
           (e.keyCode == 65 && e.ctrlKey === true) || 
            // Allow: home, end, left, right
           (e.keyCode >= 35 && e.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
       }
       else {
           // Ensure that it is a number and stop the keypress
           if (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105 )) {
               event.preventDefault(); 
           }   
       }
//	
		
}else{
//	alert(e.keyCode)
	if ( $.inArray(e.keyCode,[46,8,9,27,13,190,110]) !== -1 ||
            // Allow: Ctrl+A
           (e.keyCode == 65 && e.ctrlKey === true) || 
            // Allow: home, end, left, right
           (e.keyCode >= 35 && e.keyCode <= 39)) {
		if($('#assumption'+id).val().indexOf('.')>-1){
 		   if(e.keyCode==190 || e.keyCode==110){
 			   event.preventDefault(); 
 		   }
 	   } 
       }
       else {
           // Ensure that it is a number and stop the keypress
           if (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105 )) {
               event.preventDefault(); 
           }else{
//        	   alert($('#'+id).val()+String.fromCharCode(e.keyCode));
//        	   alert(ValidateDecimal($('#'+id).val()+String.fromCharCode(e.keyCode), 18, 2));
               // let it happen, don't do anything
        	   var val='0';
//        	   alert(e.keyCode);
        	   if(e.keyCode==96)
        		   val='0';
        	   else if(e.keyCode==97)
        		   val='1';
        	   else if(e.keyCode==98)
        		   val='2';
        	   else if(e.keyCode==99)
        		   val='3';
        	   else if(e.keyCode==100)
        		   val='4';
        	   else if(e.keyCode==101)
        		   val='5';
        	   else if(e.keyCode==102)
        		   val='6';
        	   else if(e.keyCode==103)
        		   val='7';
        	   else if(e.keyCode==104)
        		   val='8';
        	   else if(e.keyCode==105)
        		   val='9';
               if(!ValidateDecimal($('#assumption'+id).val()+val, 18, 2)){
               	event.preventDefault();
               }
           }   
       }
}
}

function hasDecimalPlace(value, x) {
    var pointIndex = value.indexOf('.');
    return  pointIndex >= 0 && pointIndex < value.length - x;
}


function isValidLeadEmail(leadId,emailId){
	$
	.ajax({
		type : "POST",
		url : $('#contextPath').val()
				+ '/checkLeadEmailAvailability?leadId=' + leadId+'&emailId='+emailId,
		success : function(result) {
			result = JSON.parse(result);
			if (result == "true") {
					return true;
//				isValidated = true;
			} else {
				showAlertMessage('Message', 'This Email Address is alerady exists. Please use the different one.', 'information',
						doNothing);
				$('.ZebraDialog').css('height','196px');
				var height = ($(window).height() / 2) - (parseInt($('.ZebraDialog').css('height')) / 2);
				var width = ($(window).width() / 2)- (parseInt($('.ZebraDialog').css('width')) / 2);
				
	//	 		alert($(window).height() / 2+'---------'+(parseInt($('.ZebraDialog').css('height')) / 2));
				$('.ZebraDialog').css('top', height);
				return false;
			}
		}
		});
}



function validateInputForm(formId){
	var isValid = true;
	$('#'+formId+' input').each(function (index, obj) {
		try{
		var validate_type = $(obj).attr("validate");
		var fieldvalue 	  = $(obj).val();
		var obj_id 		  = $(obj).attr("id");
		var message		  = $(obj).attr("emsg");
		var errormessage  = validateName(validate_type, fieldvalue, message);			
		if( errormessage.length > 0){
			addCssStyles(obj_id, errormessage);
			$('#'+obj_id+'_error').removeClass('hide');;
			$('#'+obj_id+'_error').parent().parent().addClass('has-error');
			isValid = false;
		}else{
			removeCssStyles(obj_id);
			$('#'+obj_id+'_error').addClass('hide');
			$('#'+obj_id+'_error').parent().parent().removeClass('has-error');
			
		}
		}catch(e){
			
		}
	   // alert(obj); // "this" is the current element in the loop
	});
	$('#'+formId+' textarea').each(function (index, obj) {
		var validate_type = $(obj).attr("validate");
		var fieldvalue 	  = $(obj).val();
		var obj_id 		  = $(obj).attr("id");
		var message		  = $(obj).attr("emsg");
		var errormessage  = validateName(validate_type, fieldvalue, message);			
		if( errormessage.length > 0){
			addCssStyles(obj_id, errormessage);
			$('#'+obj_id+'_error').removeClass('hide');;
			$('#'+obj_id+'_error').parent().parent().addClass('has-error');
			isValid = false;
		}else{
			removeCssStyles(obj_id);
			$('#'+obj_id+'_error').addClass('hide');
			$('#'+obj_id+'_error').parent().parent().removeClass('has-error');
		}
	   // alert(obj); // "this" is the current element in the loop
	});
	$('#'+formId+' select').each(function (index, obj) {
		var validate_type = $(obj).attr("validate");
		var fieldvalue 	  = $(obj).val();
		var obj_id 		  = $(obj).attr("id");
		var message		  = $(obj).attr("emsg");
		var errormessage  = validateName(validate_type, fieldvalue, message);
		if( errormessage.length > 0){
			addCssStyles(obj_id, errormessage);
			$('#'+obj_id+'_error').removeClass('hide');
			$('#'+obj_id+'_error').parent().parent().addClass('has-error');
			isValid = false;
		}else{
			removeCssStyles(obj_id);
			$('#'+obj_id+'_error').addClass('hide');
			$('#'+obj_id+'_error').parent().parent().removeClass('has-error');
		}
	   // alert(obj); // "this" is the current element in the loop
	});
	if(isValid==false){
		showAlertMessage("Error","There are some validation errors,please check to proceed further.", 'error', doNothing);
		$('.ZebraDialog').css('z-index','9999999999999999');
	}
	return isValid;
}

function validateName(validatetype, fieldvalue, message){
	var pattern = '';
	var errormessage = '';
	switch( validatetype ){
		case 'name'  : pattern =  new RegExp(/^[a-zA-Z ]+$/);
					   //pattern1 =  new RegExp(/^[0-9]+$/);
					 if( !pattern.test(fieldvalue)){
					 	errormessage = 'Please enter valid '+message;
					 }
					 break;
		case 'email' : pattern = new RegExp(/^(("[\w-+\s]+")|([\w-+]+(?:\.[\w-+]+)*)|("[\w-+\s]+")([\w-+]+(?:\.[\w-+]+)*))(@((?:[\w-+]+\.)*\w[\w-+]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][\d]\.|1[\d]{2}\.|[\d]{1,2}\.))((25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\.){2}(25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\]?$)/i);
		    		 if( !pattern.test($.trim(fieldvalue)) || $.trim(fieldvalue)==''){
					 	errormessage = 'Please enter valid '+message;
					 }
		    		 break;
		case 'emailoptional' : pattern = new RegExp(/^(("[\w-+\s]+")|([\w-+]+(?:\.[\w-+]+)*)|("[\w-+\s]+")([\w-+]+(?:\.[\w-+]+)*))(@((?:[\w-+]+\.)*\w[\w-+]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][\d]\.|1[\d]{2}\.|[\d]{1,2}\.))((25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\.){2}(25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\]?$)/i);
				 if( !pattern.test($.trim(fieldvalue)) && !fieldvalue==''){
				 	errormessage = 'Please enter valid '+message;
				 }
				 break;
		case 'float' : pattern = new RegExp(/^\d{0,8}(\.\d{1,2})?$/);
						 if( !pattern.test(fieldvalue)){
						 	errormessage = 'Please enter valid '+message;
						 }
						 break;  
		case 'age' : pattern = new RegExp(/^([0-9]{2})|(\.+([0-9]))+$/);			
						 if( !pattern.test(fieldvalue)){
						 	errormessage = 'Please enter valid '+message;
						 }
						 break; 
		case 'select': if(fieldvalue=='0' || fieldvalue==0){
							errormessage = 'Please select '+message;
						}	
						break;
		case 'time' : 	pattern = new RegExp(/(\d{1,2}\:\d{1,2})/gm);
						//pattern = new RegExp('^(0[01]|1[012])[:](0[1-5]|[1][1-5]$');
		                if(!pattern.test(fieldvalue)){
						 //errormessage = 'Please Select Proper Time';
						}
		                break;
		case 'date' : 	pattern = new RegExp(/^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/);
						//pattern = new RegExp(/^(\d{1,2})(\/|-)([a-zA-Z]{3})(\/|-)(\d{4})$/);
						//alert('in');
						//alert(pattern.test(fieldvalue));
				        if(!pattern.test(fieldvalue) && fieldvalue!='' && fieldvalue!=undefined){
						 errormessage = 'Please enter valid '+message;
						}   
				        break;
		case 'mobile' : pattern = new RegExp(/^([0-9]{10})+$/);
					    if(!pattern.test(fieldvalue) && $.trim(fieldvalue)!=''){
				        	errormessage = 'Please enter valid '+message;
						}
				        break;
		case '1'  : //mandatory	
					 if(fieldvalue=='' || fieldvalue==undefined){
					 	errormessage = 'Please enter '+message;
					 }
					 break;
		case '2'  : //mandatory date	
						pattern = new RegExp(/^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/);
						//pattern = new RegExp(/^(\d{1,2})(\/|-)([a-zA-Z]{3})(\/|-)(\d{4})$/);
						//alert('in');
						//alert(pattern.test(fieldvalue));
					 if(fieldvalue=='' || fieldvalue==undefined){
					 	errormessage = 'Please enter '+message;
					 }else if(!pattern.test(fieldvalue) && fieldvalue!='' && fieldvalue!=undefined){
						 errormessage = 'Please enter valid '+message;
						}   
					 break;
		case '3'  : //mandatory email	
				pattern = new RegExp(/^(("[\w-+\s]+")|([\w-+]+(?:\.[\w-+]+)*)|("[\w-+\s]+")([\w-+]+(?:\.[\w-+]+)*))(@((?:[\w-+]+\.)*\w[\w-+]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][\d]\.|1[\d]{2}\.|[\d]{1,2}\.))((25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\.){2}(25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\]?$)/i);
				 if(fieldvalue=='' || fieldvalue==undefined){
				 	errormessage = 'Please enter '+message;
				 }else  if( !pattern.test($.trim(fieldvalue)) || $.trim(fieldvalue)==''){
					 	errormessage = 'Please enter valid email address';
				 }
		 break;
		case '4'  : //numeric
			pattern = new RegExp(/^(("[\w-+\s]+")|([\w-+]+(?:\.[\w-+]+)*)|("[\w-+\s]+")([\w-+]+(?:\.[\w-+]+)*))(@((?:[\w-+]+\.)*\w[\w-+]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][\d]\.|1[\d]{2}\.|[\d]{1,2}\.))((25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\.){2}(25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\]?$)/i);
			 if(fieldvalue=='' || fieldvalue==undefined){
			 	
			 }else  if(!isNumeric(fieldvalue)){
				 	errormessage = 'Please enter valid '+message;
			 }
	 break;
		case 'pan'  : //pan num
			pattern = new RegExp(/^(("[\w-+\s]+")|([\w-+]+(?:\.[\w-+]+)*)|("[\w-+\s]+")([\w-+]+(?:\.[\w-+]+)*))(@((?:[\w-+]+\.)*\w[\w-+]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][\d]\.|1[\d]{2}\.|[\d]{1,2}\.))((25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\.){2}(25[0-5]|2[0-4][\d]|1[\d]{2}|[\d]{1,2})\]?$)/i);
			 if(fieldvalue=='' || fieldvalue==undefined){
			 	
			 }else  if(!isValidPAN(fieldvalue)){
				 	errormessage = 'Please enter valid '+message;
			 }
	 break;
	 
	}
	
	return errormessage;
}


//adds the css class applied for the validations
function addCssStyles(pElementId, pErrorMsg) {
	$('#'+pElementId).css('border-color','#d16e6c');
	$('#'+pElementId).attr('title', pErrorMsg);
}

//removes the css class applied for the validations
function removeCssStyles(pElementId) {
	$('#'+pElementId).css('border-color','#d5d5d5');
	$('#'+pElementId).removeAttr('title');
}


function downloadAttachment(docId){
	if(docId==0){
		showAlertMessage1("Message", '<br/><span style="top:-5px;position:relative">Document is not available.</span>','information',
				doNothing1);
	}else{
		$('#documentIdToDownload').removeAttr('disabled');
		$('#documentIdToDownload').val(docId);
		$('#downloadAttachmentForm').submit();
	}
	
	
}

Array.prototype.contains = function(obj) {
	var i = this.length;
	while (i--) {
		if (this[i] == obj) {
			return true;
		}
	}
	return false;
}

function test_skill(id) {
	
    var junkVal=$('#'+id).val();
	//alert(junkVal)
    junkVal=Math.floor(junkVal);
    var obStr=new String(junkVal);
    numReversed=obStr.split("");
    actnumber=numReversed.reverse();
 
    if(Number(junkVal) >=0){
        //do nothing
    }
    else{
    	showAlertMessage("Error",
				"Invalid Charactor,Please Enter Numeric Value.",
				"error", doNothing);
//         alert('Wrong Number cannot be converted');
        return false;
    }
    if(Number(junkVal)==0){
       // $('#'+id+'moneyText').html(obStr+''+' Rupees Zero Only');
        $('#'+id+'moneyText').html('Zero Rs. Only');
        return false;
    }
    if(actnumber.length>9){
    	actnumber.junkVal=0;
    	 $('#'+id+'moneyText').html('');
		//alert('Oops!!!! The Number is too long to covert');
        return false;
    }
 
    var iWords=["Zero", " One", " Two", " Three", " Four", " Five", " Six", " Seven", " Eight", " Nine"];
    var ePlace=['Ten', ' Eleven', ' Twelve', ' Thirteen', ' Fourteen', ' Fifteen', ' Sixteen', ' Seventeen', ' Eighteen', ' Nineteen'];
    var tensPlace=['dummy', ' Ten', ' Twenty', ' Thirty', ' Forty', ' Fifty', ' Sixty', ' Seventy', ' Eighty', ' Ninety' ];
 
    var iWordsLength=numReversed.length;
    var totalWords="";
    var inWords=new Array();
    var finalWord="";
    j=0;
    for(i=0; i<iWordsLength; i++){
        switch(i)
        {
        case 0:
            if(actnumber[i]==0 || actnumber[i+1]==1 ) {
                inWords[j]='';
            }
            else {
                inWords[j]=iWords[actnumber[i]];
            }
            inWords[j]=inWords[j]+' ';
            break;
        case 1:
            tens_complication();
            break;
        case 2:
            if(actnumber[i]==0) {
                inWords[j]='';
            }
            else if(actnumber[i-1]!=0 && actnumber[i-2]!=0) {
                inWords[j]=iWords[actnumber[i]]+' Hundred and';
            }
            else {
                inWords[j]=iWords[actnumber[i]]+' Hundred';
            }
            break;
        case 3:
            if(actnumber[i]==0 || actnumber[i+1]==1) {
                inWords[j]='';
            }
            else {
                inWords[j]=iWords[actnumber[i]];
            }
            if(actnumber[i+1] != 0 || actnumber[i] > 0){
                inWords[j]=inWords[j]+" Thousand";
            }
            break;
        case 4:
            tens_complication();
            break;
        case 5:
            if(actnumber[i]==0 || actnumber[i+1]==1) {
                inWords[j]='';
            }
            else {
                inWords[j]=iWords[actnumber[i]];
            }
            if(actnumber[i+1] != 0 || actnumber[i] > 0){
                inWords[j]=inWords[j]+" Lakh";
            }
            break;
        case 6:
            tens_complication();
            break;
        case 7:
            if(actnumber[i]==0 || actnumber[i+1]==1 ){
                inWords[j]='';
            }
            else {
                inWords[j]=iWords[actnumber[i]];
            }
            inWords[j]=inWords[j]+" Crore";
            break;
        case 8:
            tens_complication();
            break;
        default:
            break;
        }
        j++;
    }
 
    function tens_complication() {
        if(actnumber[i]==0) {
            inWords[j]='';
        }
        else if(actnumber[i]==1) {
            inWords[j]=ePlace[actnumber[i-1]];
        }
        else {
            inWords[j]=tensPlace[actnumber[i]];
        }
    }
    inWords.reverse();
    for(i=0; i<inWords.length; i++) {
        finalWord+=inWords[i];
    }
   //alert(finalWord)
    //$('#'+id+'moneyText').html(obStr+'  '+finalWord);
    $('#'+id+'moneyText').html(finalWord+'Rs.');
	
}

function cheackValidNumeric(id)
{
	
	var junkVal=$('#'+id).val();
		//alert(junkVal)
	    junkVal=Math.floor(junkVal);
	   
	 
	    if(Number(junkVal) >=0){
	        //do nothing
	    	 return true;
	    }
	    else{
//	    	showAlertMessage("Error",
//					"Invalid Charactor,Please Enter Numeric Value.",
//					"error", doNothing);
//	         alert('Wrong Number cannot be converted');
	        return false;
	    }
}

function validateExpencePercentage(id)
{
	var junkVal=$('#'+id).val();
	//alert(junkVal)
   // junkVal=Math.floor(junkVal);
   
 
    if(junkVal >100){
        //do nothing
    	$('#'+id).val(100)
//    	 return true;
    }
    else if(junkVal=='100.')
    	{
    	$('#'+id).val(100)
    	}
    else{
//    	showAlertMessage("Error",
//				"Invalid Charactor,Please Enter Numeric Value.",
//				"error", doNothing);
//         alert('Wrong Number cannot be converted');
//        return false;
    }

}
function nospecialCharacters(id,e){
//	alert(e.keyCode);
if (e.keyCode == 222 || e.keyCode == 192 || e.keyCode == 49 || e.keyCode == 50 || e.keyCode == 51 || e.keyCode == 52 || e.keyCode == 53 || e.keyCode == 54 || 
	e.keyCode == 55 || e.keyCode == 56 || e.keyCode == 106 || e.keyCode == 57 || e.keyCode == 48 || e.keyCode == 189 || e.keyCode == 109 ||e.keyCode == 107 || 
	e.keyCode == 187 || e.keyCode == 191 || e.keyCode == 111|| e.keyCode == 192 || e.keyCode == 188 || e.keyCode == 190 || e.keyCode == 188 || e.keyCode == 186 || 
	e.keyCode == 220 || e.keyCode == 219 || e.keyCode == 221 || e.keyCode == 86) {
//		alert('In if'+e.keyCode);
		$('#'+id).css('border-color','red');
		$('#'+id).attr('title', 'Special Characters not Allowed.');
		 document.getElementById(id).value = "";
        return false;
    } else {
    	removeCssStyles(id);
    	if (e.shiftKey || (e.keyCode >= 65 && e.keyCode <= 90)) {
//    		alert(e.keyCode);
    	}
//    	if (e.keyCode==8 || (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105 )) {
//    	e.preventDefault();
        return true;
//    	}
    }
}



function allowIntegersOnly(id,e){
//	alert(e.keyCode)
	if ( $.inArray(e.keyCode,[46,8,9,27,13]) !== -1 ||
            // Allow: Ctrl+A
           (e.keyCode == 65 && e.ctrlKey === true) || 
            // Allow: home, end, left, right
           (e.keyCode >= 35 && e.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
       }
       else {
           // Ensure that it is a number and stop the keypress
           if (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105 )) {
               e.preventDefault(); 
           }   
       }
	try{
		$('input[name="'+id+'"]').removeAttr('checked');
	}catch(e){
		
	}

}

function allowIntegersOnlyForGoal(id,e){
	var id=id.substring(id.indexOf('94227_')+6);
//	alert(id)
//	alert(e.keyCode)
	if ( $.inArray(e.keyCode,[46,8,9,27,13]) !== -1 ||
            // Allow: Ctrl+A
           (e.keyCode == 65 && e.ctrlKey === true) || 
            // Allow: home, end, left, right
           (e.keyCode >= 35 && e.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
       }
       else {
           // Ensure that it is a number and stop the keypress
           if (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105 )) {
               e.preventDefault(); 
           }else if($('#94145_'+(parseInt(id)-7)).val()=='' && $('#94146_'+id).val()==''){
        	   e.preventDefault(); 
           }   
       }

}

function allowIntegersOnlyUpToHundred(id,e){
		if($('#'+id).val()>100){
        	   $('#'+id).val(100);
        }
//		else if($('#'+id).val()==''){
//        	$('#'+id).val(0);
//        }   
}

function updatePercentageavailToGoal(id,e){
	var id1=id.substring(id.indexOf('94145_')+6);
//	alert(id1.indexOf('_'));
	if(id1.indexOf('_')==-1){
//		alert($('#'+id).val())
//		alert($('#94146_'+(parseInt(id1)+7)).val())
		if($('#'+id).val()!='' && ($('#94227_'+(parseInt(id1)+7)).val()=='' || $('#94227_'+(parseInt(id1)+7)).val()==0))
		$('#94227_'+(parseInt(id1)+7)).val(100);
		else if($('#'+id).val()=='' && $('#94146_'+(parseInt(id1)+7)).val()=='')
		$('#94227_'+(parseInt(id1)+7)).val(0);
	}else{
		id1=id.substring(id.indexOf('94146_')+6);
		if($('#'+id).val()!='' && ($('#94227_'+(parseInt(id1))).val()=='' || $('#94227_'+(parseInt(id1))).val()==0))
		$('#94227_'+(parseInt(id1))).val(100);
		else if($('#'+id).val()=='' && $('#94145_'+(parseInt(id1)-7)).val()=='')
		$('#94227_'+(parseInt(id1))).val(0); 
	}
}
 


function redirectDcInput()
{
//	alert('in common  js');
		window.location.href= $('#contextPath').val()+"/opportunity/redirectDcInput.htm";				
	
}
function redirectToOpportunity()
{
//	if(by=='opportunity')
	window.location.href= $('#contextPath').val()+"/opportunity/getOpportunitiesList.htm";
//	else
//		window.location.href= $('#contextPath').val()+"/client/getClientList.htm";
}

function submitDcOutput(isContainsEmergencyR)
{
	var sectionGenration= new Array();
	$('input[name=analysisComprehensive]:checked').each(function() {
	    //selectedGroups.push($(this).val());
		sectionGenration.push($(this).val());
	});
	if(sectionGenration.length==0)
		{
		showAlertMessage("Error",
				"Please select at least one report to generate.<br><br>",
				"error", doNothing);
		}
	else{
		checkMinimumDataPF(1,isContainsEmergencyR);	
	}
	
	
}

function submitDcOutput1()
{
	showAlertMessage("Message","Thank you for submitting the Financial Health Check-Up Form." +
			"<br>We will analyse your form and get back to you soon with the Report & future Action Plans.","question",doNothing1);
//			$('.ZebraDialog_Question').css('background-size','149px');
//		$('.ZebraDialog_Question').css('background-position-x','5px');
//		$('.ZebraDialog_Question').css('background-position-y','2px');
//		$('.ZebraDialog_Question').css('background-position','5px 2px');
		$('.ZebraDialog').css('width','500px');
		$('.ZebraDialog_Button0').html('Cancel');
		$('.ZebraDialog_Button1').html('Next');
	
	$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
	$('.ZebraDialog_Button1').attr('href','javascript:showInsuranceMethods()');
	
}


function generateReportA(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration){
	if(isAnalysisReportAGeneration==true){
		$.ajax({
   	     type : "POST",
   	     url : $('#baseServerURL').val()+'/FIINFRA-M-WEB/partner/report/generate-report-analysis/'+$('#dcInputPartyId').val()+'/'+$('#partyIdHidden').val()+'/'+$('#usernamefromsession').val()+'/'+$('#buId').val()+'/A?TOKEN=abc&USER_NAME='+$('#usernamefromsession').val(),
   	     success : function(result) {
   	    	generateReportB(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration)
   	     },
   	     error : function(err){
   	    	generateReportB(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration)
		}
		});
	}else{
		generateReportB(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration);
	}
}

function generateReportB(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration){
	if(isAnalysisReportBGeneration==true){
		$.ajax({
   	     type : "POST",
   	     url : $('#baseServerURL').val()+'/FIINFRA-M-WEB/partner/report/generate-report-analysis/'+$('#dcInputPartyId').val()+'/'+$('#partyIdHidden').val()+'/'+$('#usernamefromsession').val()+'/'+$('#buId').val()+'/B?TOKEN=abc&USER_NAME='+$('#usernamefromsession').val(),
   	     success : function(result) {
   	    	generateReportC(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration)
   	     },
   	     error : function(err){
   	    	generateReportC(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration)
		}
		});
	}else{
		generateReportC(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration);
	}
}

function generateReportC(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration){
	if(isAnalysisReportCGeneration==true){
		$.ajax({
   	     type : "POST",
   	     url : $('#baseServerURL').val()+'/FIINFRA-M-WEB/partner/report/generate-report-analysis/'+$('#dcInputPartyId').val()+'/'+$('#partyIdHidden').val()+'/'+$('#usernamefromsession').val()+'/'+$('#buId').val()+'/C?TOKEN=abc&USER_NAME='+$('#usernamefromsession').val(),
   	     success : function(result) {
   	    	generateReportActionPlans(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration)
   	     },
   	     error : function(err){
   	    	generateReportActionPlans(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration)
		}
		});
	}else{
		generateReportActionPlans(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration);
	}
}

function generateReportActionPlans(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration){
	if(isActionPlanGeneration==true){
		$.ajax({
   	     type : "POST",
   	     url : $('#baseServerURL').val()+'/FIINFRA-M-WEB/partner/report/generate-report-analysisClient/'+$('#dcInputPartyId').val()+'/'+$('#partyIdHidden').val()+'/'+$('#usernamefromsession').val()+'/'+$('#buId').val()+'/advisor?TOKEN=abc&USER_NAME='+$('#usernamefromsession').val(),
   	     success : function(result) {
   	    	$.ajax({
	   	   	     type : "POST",
	   	   	     url : $('#baseServerURL').val()+'/FIINFRA-M-WEB/partner/report/generate-report-analysisClient/'+$('#dcInputPartyId').val()+'/'+$('#partyIdHidden').val()+'/'+$('#usernamefromsession').val()+'/'+$('#buId').val()+'/client?TOKEN=abc&USER_NAME='+$('#usernamefromsession').val(),
	   	   	     success : function(result) {
	   	   	    	 generateReportCoprihencive(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration);
	   	   	     },
		   	   	 error : function(err){
		   	    	generateReportCoprihencive(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration);
				}
   	    	});
   	     },
   	     error : function(err){
   	    	 $.ajax({
	  	   	     type : "POST",
	  	   	     url : $('#baseServerURL').val()+'/FIINFRA-M-WEB/partner/report/generate-report-analysisClient/'+$('#dcInputPartyId').val()+'/'+$('#partyIdHidden').val()+'/'+$('#usernamefromsession').val()+'/'+$('#buId').val()+'/client?TOKEN=abc&USER_NAME='+$('#usernamefromsession').val(),
	  	   	     success : function(result) {
	  	   	    	 generateReportCoprihencive(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration);
	  	   	     },
	   	   		 error : function(err){
		   	    	generateReportCoprihencive(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration);
				}
  	    	});
		}
		});
	}else{
		generateReportCoprihencive(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration);
	}
}

function generateReportCoprihencive(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration){
	if(isAnalysisReportGenration==true){
		$.ajax({
   	     type : "POST",
   	     url :$('#contextPath').val()+'/dc/generateReport.htm?dcInputPartyId='+$('#dcInputPartyId').val(),
   	     success : function(result) {
   	    	 showAlertMessage1("Message",
      					"<br/>Report Generated Successfully.",
      					"confirmation", doNothing);
					 $('.ZebraDialog').css('top','250px');
   	    
   	     }});
	}else{
		showAlertMessage1("Message",
					"<br/>Report Generated Successfully.",
					"confirmation", doNothing);
				 $('.ZebraDialog').css('top','250px');
	}
}




function submit(){
//	showInsuranceMethods();
	var isAnalysisReportGenration=false;
	var isActionPlanGeneration=true;
	var isAnalysisReportAGeneration=false;
	var isAnalysisReportBGeneration=false;
	var isAnalysisReportCGeneration=false;
	var analysisReportType;
	var dcInputPartyId=$('#dcInputPartyId').val();
	var sectionGenration= new Array();
	
	
	$('input[name=analysisComprehensive]:checked').each(function() {
	    //selectedGroups.push($(this).val());
		//alert('======'+$(this).val());
		sectionGenration.push($(this).val());
	});
	//alert('section Generation='+sectionGenration)
	if(sectionGenration.length==0)
		{
		showAlertMessage("Error",
				"Please select at least one report to generate.<br><br>",
				"error", doNothing);
		}
	else{
		
	
	for(var i=0;i<=sectionGenration.length;i++)
		{
			if(sectionGenration[i]=='1')
				{
				isAnalysisReportGenration=true;
				analysisReportType=383;
				}
//			else if(sectionGenration[i]=='2')
//				{
//				isActionPlanGeneration=true;
//				}
			else if(sectionGenration[i]=='3')
				{
				isAnalysisReportAGeneration=true;
				analysisReportType=384;
				}
			else if(sectionGenration[i]=='4')
				{
				isAnalysisReportBGeneration=true;
				analysisReportType=385;
				}
			else if(sectionGenration[i]=='5')
				{
				isAnalysisReportCGeneration=true;
				analysisReportType=386;
				}
			isActionPlanGeneration=true;
		}
	//alert('isAnalysisReportGenration='+isAnalysisReportGenration)
	//alert('isActionPlanGeneration='+isActionPlanGeneration)
	var isAlertOpen=false;
	$('#analysiReportGenerationMsg').show();
	$.ajax({
	     type : "POST",
	     url : $('#contextPath').val()+'/dc/submitDcInput.htm?isAnalysisReportGenration='+isAnalysisReportGenration+'&isActionPlanGeneration='+isActionPlanGeneration+'&analysisReportType='+analysisReportType,
	     data :  $('form').serialize(), 
	     success : function(result) {
	    	 
	    	 generateReportA(isAnalysisReportGenration,isActionPlanGeneration,isAnalysisReportAGeneration,isAnalysisReportBGeneration,isAnalysisReportCGeneration);

	     }});
	}
	     
}

function checkMinimumDataPF(isToProceed,isContainsEmergencyR){
	//alert('in='+isToProceed);
	if(isToProceed==1){
		localStorage.setItem('checkMinimumDataPF','true');
		$.ajax({
		     type : "POST",
		     url : $('#contextPath').val()+'/dc/checkMinimumDataForAnalysisReport.htm',
		     success : function(result) {
		    	
		    	var goalCount=result.goalCount;
//		    	var pageWiseData=a.split('-');
		    	var retirmentAge=result.retirmentAge;
		    	var cashflow_income_Value=result.cashflowIncomeValue;
		    	
		    	var cashflow_expenditure_Value=result.cashflowExpenditureValue;
		    
		    	var emergency_income_option=result.emergencyIncomeOption;
		    	var riskProfileFilledQuestionCount=result.count;
		    	var isPageduplicate=result.isPersonalInfoFilled;
		    	
		    	//var leadBuId=$('#leadBuId').val();
		    	
		    	
		    	var pages='';
	    		if(isPageduplicate==0)
	    			{
	    			if(pages=='')
					{
	    				pages+='Personal Information';
					}
				else{
	    				pages+=',Personal Information';
	    			}
	    			}
		    	
	    		if(retirmentAge==0 || retirmentAge==null)
		    			{
		    			if(pages=='')
						{
		    				pages+='Retirement Planing';
						}
					else{
		    				pages+=',Retirement Planing';
		    			}
	    			}
	    		if ((cashflow_income_Value==0 || cashflow_income_Value==null) )
	    		{
//	    			if((cashflow_income_option==0 || cashflow_income_option==null)){
	    				isPageduplicate='Cash Flow';
	    				if(pages=='')
						{
	    					pages+='Cash Flow';
						}
					else{
	    				
	    				pages+=',Cash Flow';
	    				}
//	    			}
	    		}	
	    		
	    		
	    			if((cashflow_income_Value==0 )){
	    				if(isPageduplicate==',Cash Flow')
	    					{
	    						
	    					}
	    				else{
	    					if(pages=='')
	    					{
	    						pages+='Cash Flow';
	    					}
		    				else{
		    					pages+=',Cash Flow';
		    				}
	    				}
	    			}
	    			
	    		
//	    		expenduture
	    		
	    		
	    			if((cashflow_expenditure_Value==0 || cashflow_expenditure_Value==null)){
	    				if(isPageduplicate=='Cash Flow')
						{
							
						}
					else{
						if(pages=='')
						{
							pages+='Cash Flow';
						}
	    				else{
	    					pages+=',Cash Flow';
	    				}
					}
	    			
	    			
	    		}	
	    		if(isContainsEmergencyR==true){
	    			
	    		}else{
	    			if(emergency_income_option==0 || emergency_income_option==null)
	    			{
		    			if(pages=='')
						{
		    				pages+='Emergency Readiness';
						}
						else{
							pages+=',Emergency Readiness';
						}
	    				
	    			}
	    		}
	    			
	    		
	    		if(riskProfileFilledQuestionCount<8)
	    			{
		    			if(pages=='')
						{
		    				pages+='Risk Profile.';
						}
						else{
							pages+=',Risk Profile.';
						}
	    				
	    			}
//	    		alert('pages==='+pages);
	    		if(pages==''){
	    			submitDcOutput1();
	    		}else{

	    			
	    			showAlertMessage("Error",
							"You have not filled Mandatory details in below sections.<br>"+pages+".<br>",
							"error", doNothing);
		    			
		    			}
//		    	}ELSE{
//		    		SUBMIT();
//		    	}
		     }
		     });
	}
	
}
function submit1(){
//	alert('in submit1');
//setTimeout(function() {
						showAlertMessage("Message","The data has been submitted successfully!","information",submitForm);
//						 				}, 500);

}
function submitForm(){
//	alert('in submitForm');
		//alert('submitForm:'+$('#contextPath').val());
		//$('body').hide();
		
//		setTimeout(function() {
//		document.forms[0].action=$('#contextPath').val() + "/partner/submitPathFinder";
//		document.forms[0].submit();	
//		}, 100);
		//alert('i am in submitForm');
		
		
		$.ajax({
		     type : "POST",
		     url : $('#contextPath').val()+'/partner/submitPathFinder',
		     data :  $('form').serialize(), 
		     success : function(result) {
		    	 //showAlertMessage("Message","Data saved successfully.", "information", doNothing1);
		    	 
		    	 openPopupWebApp('centerLoadingImage', 25, 35);
		    	 document.showPathFinderOutputPdfForm.action=$('#contextPath').val() + "/partner/showPathFinderOutputPDF";
		 		 document.showPathFinderOutputPdfForm.submit();	
		    	// window.location.href= $('#contextPath').val()+'/partner/showPathFinderOutputPDF?';
		    	/* var x=window.open($('#contextPath').val()+'/partner/showPathFinderOutputPDF?','newwindow','fullscreen=yes,titlebar=no,toolbar=no,status=no,width=150,height=135');
//		    	 window.location.href=$('#contextPath').val()+'/partner/showPathFinderOutputPDF?';
//		    	 window.blur();
		    	 window.focus();
		    	 x.onbeforeunload =logout1;*/
		     }
		     });
}


function setAgeFromDOB(id,counter) {
	var dob=$('#'+id+counter).val();
	
	//alert('dob='+dob);
	id=id.substring(0,id.indexOf('Dob'));
//	id+='Age';
    var date1 = new Date();
    var  dob1= dob.split("/");;
    date2= new Date(dob1[2], dob1[1] - 1, dob1[0]);
//     var date2=new Date(dob);
    var pattern = /^\d{1,2}\/\d{1,2}\/\d{4}$/; //Regex to validate date format (dd/mm/yyyy)
    if (pattern.test(dob)) {
        var y1 = date1.getFullYear(); //getting current year
        var y2 = date2.getFullYear(); //getting dob year
        
        var age = y1 - y2;           //calculating age 
//        alert(age)
//         document.write("Age : " + age);
        $('#'+id+'Age'+counter).val(getAge(date2));
        $('#'+id+'age'+counter).val(getAge(date2));
        return true;
    } else {
    	 $('#'+id+'Age'+counter).val(0);
         $('#'+id+'age'+counter).val(0);
//         alert("Invalid date format. Please Input in (dd/mm/yyyy) format!");
        return false;
    }

}

function openConvertClientPopup(currentRecordType,contactPartyId){
	$('#contactPartyId').val(contactPartyId);
	$('#convertToContactType').val(0);
	$('#currentContactType').html('');
	$('#convertNote').val('')
	/*$('#popUpConvertClient').show();
	$('#blanket').show();
	var height = ($(window).height() / 2) - (parseInt($('#popUpConvertClient').css('height'))/2);
	$('#popUpConvertClient').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpConvertClient').css('width'))/2);
	$('#popUpConvertClient').css('margin-left', width);
	$('#popUpConvertClient').css('position','fixed');*/
	$('#currentContactType').html(currentRecordType);
	$('#popUpConvertClient').modal('show') ;
}
function openMergeClientPopup(isAllClients,partyId)
{
	/*$('#popUpMergeClient').show();
	$('#blanket').show();
	var height = ($(window).height() / 2) - (parseInt($('#popUpMergeClient').css('height'))/2);
	$('#popUpMergeClient').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpMergeClient').css('width'))/2);
	$('#popUpMergeClient').css('margin-left', width);
	$('#popUpMergeClient').css('position','fixed');*/
	/*bootbox.dialog({
        title: "Merge Other Clients",
        message: $('#popupMergeClientHtml').html(),
		       className: "popUpMergeClient",
		    }
		);
	$(".popUpMergeClient .modal-dialog").css('width','60%');
	$('.modal-body').addClass('clearfix');*/
	$('#popUpMergeClient').modal('show');
}
function openClientPopup()
{
	$('#popUpOpenClient').modal('show');
	/*$('#blanket').show();
	var height = ($(window).height() / 2) - (parseInt($('#popUpOpenClient').css('height'))/2);
	$('#popUpOpenClient').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popUpOpenClient').css('width'))/2);
	$('#popUpOpenClient').css('margin-left', width);
	$('#popUpOpenClient').css('position','fixed');*/
}
function cloeseClientPopup()
{
	
	$('#popUpOpenClient').hide();
	$('#blanket').hide();
}

function openPopupDcInput(partyId,buId,pname,datacollectionChange,fpPlanTypeId)
{
	//alert('in common.js')
	$('#partyId_DcInput').val(partyId)
	$('#opportunityName_DcInput').val(pname)
	$('#datacollectionChange_DcInput').val(datacollectionChange)
	$('#fpPlanTypeId').val(fpPlanTypeId);
	
	$('#dc_Input_Desktop_Version_btn img').attr('onclick','redirectDcInput()');
	$('#dc_Input_FPT_btn  img').attr('onclick','redirectDcInputFpt()');
	$('#dc_Input_FPT_Details_btn  img').attr('onclick','redirectDcInputFptDetails()');
	$('#dc_Input_FPT_Details_btn').removeClass('inactiveLink');
	$('#dc_Input_Desktop_Version_btn').removeClass('inactiveLink');
	$('#dc_Input_FPT_btn').removeClass('inactiveLink');
	$('#dc_Input_Desktop_Version_btn img').css('cursor','pointer');
	$('#dc_Input_FPT_btn  img').css('cursor','pointer');
	$('#dc_Input_Desktop_Version_btn a').css('cursor','pointer');
	$('#dc_Input_FPT_btn a').css('cursor','pointer');
	$('#thumbdc_Input_Desktop_Version').removeClass('selected');
	$('#themedc_Input_FPT').removeClass('selected');
	$('#thumbdc_Input_FPT_Details').removeClass('selected');
	//alert('fpPlanTypeId='+fpPlanTypeId)
	if(fpPlanTypeId=='522002')
		{
		$('#dc_Input_FPT_Details_btn').removeClass('inactiveLink');
		$('#dc_Input_Desktop_Version_btn').addClass('inactiveLink');
		$('#dc_Input_FPT_btn').addClass('inactiveLink');
		$('#thumbdc_Input_FPT_Details').addClass('selected');
		$('#dc_Input_Desktop_Version_btn img').removeAttr('onclick');
		$('#dc_Input_FPT_btn  img').removeAttr('onclick');
		$('#dc_Input_Desktop_Version_btn img').css('cursor','default');
		$('#dc_Input_FPT_btn  img').css('cursor','default');
		$('#dc_Input_Desktop_Version_btn a').css('cursor','default');
		$('#dc_Input_FPT_btn a').css('cursor','default');
		
		}
	else if(fpPlanTypeId=='522001'){
		$('#dc_Input_Desktop_Version_btn').removeClass('inactiveLink');
		$('#dc_Input_FPT_btn').removeClass('inactiveLink');
		//$('#dc_Input_FPT_Details_btn').addClass('inactiveLink');
		$('#thumbdc_Input_Desktop_Version').addClass('selected');
		$('#themedc_Input_FPT').addClass('selected');
		
	}else{
		$('#dc_Input_Desktop_Version_btn').removeClass('selected');
		$('#dc_Input_FPT_btn').removeClass('selected');
		$('#thumbdc_Input_FPT_Details').removeClass('selected');
		
	}
	/*$('#popupDcInput').show();
	$('#blanket').show();
	var height = ($(window).height() / 2) - (parseInt($('#popupDcInput').css('height'))/2);
	$('#popupDcInput').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#popupDcInput').css('width'))/2);
	$('#popupDcInput').css('margin-left', width);
	$('#popupDcInput').css('position','fixed');*/
	
	/*bootbox.dialog({
        title: "Dc Input Links",
        message: $('#popupDcInputHtml').html()
		       //className: "popUpAlertaddnote",
		    }
		);
	$('.modal-body').addClass('clearfix');*/
	$('#popupDcInput').modal('show');
}

function closePopupDcInput()
{
	$('#popupDcInput').hide();
	$('#blanket').hide();
	}
function cloeseMergeClientPopup(){
	$('#popUpMergeClient').hide();
	$('#blanket').hide();
}
function openMatchingTagPopup(currentRecordType,contactPartyId)
{
	
	
	$('#contactPartyId').val(contactPartyId);
	$('#convertToContactType').val(0);
	$('#currentContactType').html('');
	$('#convertNote').val('');
	$('#convertToContactType_error').addClass('hide');
	$('#convertNote_error').addClass('hide');
	//$('#sendPotentialPing').show();
//	$('#blanket').show();
// var height = ($(window).height() / 2) - (parseInt($('#sendPotentialPing').css('height'))/2);
//$('#sendPotentialPing').css('top',height);
//var width = ($(window).width() / 2) - (parseInt($('#sendPotentialPing').css('width'))/2);
//$('#sendPotentialPing').css('margin-left', width);
//$('#sendPotentialPing').css('position','fixed');
//$('#currentContactType').html(currentRecordType);
getMatchingTagsAndPotentialPings(contactPartyId);
}
function cloeseConvertClientPopup(){
	$('#popUpConvertClient').hide();
	$('#blanket').hide();
}

function convertContact(formId1,contactType1){
	formId=formId1;
	contactType=contactType1;
	var isValidated=true;
	isValidated=validateInputForm(formId);
	if(isValidated==true){
	showAlertMessage1("Message", '<br/> Converting'+$('#partyName'+$('#contactPartyId').val()).html()+' from '+$('#currentContactType').html()+' to '+$('#convertToContactType option:selected').text()+'. Please confirm action.', "question",
			doNothing1);
	$('.ZebraDialog').css('z-index','99999999999999');
	$('.ZebraDialog_Button1').attr('href','javascript:convertContactTrue()');
	$('.ZebraDialog_Button0').attr('href','javascript:doNothing()');
//	var contactType='Contact';
	}
	return false;
}
function convertContactTrue(){
	setTimeout(function() {
	
		$.ajax({
		     type : "POST",
		     url : $('#contextPath').val()+'/partner/convertContact.htm',
		     data :  $('#'+formId).serialize(), 
		     success : function(result) {
//		    	 alert(result)
		    	 var recordCount=result[0];
					var isExistAnyUser=result[1];
//					alert(isExistAnyUser)
		    	 if(recordCount>0){
						showAlertMessage("Success", '<br/>'+contactType+' converted successfully.', "confirmation", reloadPage)
						$('.ZebraDialog').css('z-index','9999999999');
						cloeseConvertClientPopup();
					} else if(isExistAnyUser>0){
						showAlertMessage("Success", '<br/>'+contactType+' converted successfully.', "confirmation", reloadPage)
//						showAlertMessage("Error",
//								"<br/>"+" Username already exist. Please change EmailId and then try again.",
//								"error", doNothing);
						$('.ZebraDialog').css('z-index','9999999999');
						cloeseConvertClientPopup();						
					}else{
						showAlertMessage("Error","<br/>The connection to the server has been lost. Please try again later.", 'error', doNothing);
						$('.ZebraDialog').css('z-index','9999999999');
					}
		    	 
		    	
		     	}
		     });
	
	},500);
}

function reloadPage(){
	location.reload();
}

function isLeap(year) {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }


function getAge(birthDate) {
	  var now = new Date();
	  
	 
	  // days since the birthdate    
	  var days = Math.floor((now.getTime() - birthDate.getTime())/1000/60/60/24);
	  var age = 0;
	  // iterate the years
	  for (var y = birthDate.getFullYear(); y <= now.getFullYear(); y++){
	    var daysInYear = isLeap(y) ? 366 : 365;
	    if (days >= daysInYear){
	      days -= daysInYear;
	      age++;
	      // increment the age only if there are available enough days for the year.
	    }
	  }
	  return age;
	}


function sendDCReminder(partyId){
	$.ajax({
	     type : "POST",
	     url : $('#contextPath').val()+'/partner/sendDCReminder.htm?partyId='+partyId,
	     success : function(result) {
	    	 if(result=='success')
					showAlertMessage("Success", '<br/>Reminder sent successfully.', "confirmation", doNothing)
	     	}
	     });
}

function showSelectedTab(id){
	$('#'+id).attr('class','active');
}


function isObjectNull(obj){
	if($.type(obj)==='undefined' || $.type(obj)==='null'){
		return true;
	}
	return false;
}

function GetURLParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
            return sParameterName[1];
        }
    }
}
function allowOnlyDecimal(id,e){

//	alert(e.keyCode)
	if ( $.inArray(e.keyCode,[46,8,9,27,13,190,110]) !== -1 ||
            // Allow: Ctrl+A
           (e.keyCode == 65 && e.ctrlKey === true) || 
            // Allow: home, end, left, right
           (e.keyCode >= 35 && e.keyCode <= 39)) {
		if($('#'+id).val().indexOf('.')>-1){
 		   if(e.keyCode==190 || e.keyCode==110){
 			   event.preventDefault(); 
 		   }
 	   } 
       }
       else {
           // Ensure that it is a number and stop the keypress
           if (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105 )) {
               event.preventDefault(); 
           }else{
//        	   alert($('#'+id).val()+String.fromCharCode(e.keyCode));
//        	   alert(ValidateDecimal($('#'+id).val()+String.fromCharCode(e.keyCode), 18, 2));
               // let it happen, don't do anything
        	   var val='0';
//        	   alert(e.keyCode);
        	   if(e.keyCode==96)
        		   val='0';
        	   else if(e.keyCode==97)
        		   val='1';
        	   else if(e.keyCode==98)
        		   val='2';
        	   else if(e.keyCode==99)
        		   val='3';
        	   else if(e.keyCode==100)
        		   val='4';
        	   else if(e.keyCode==101)
        		   val='5';
        	   else if(e.keyCode==102)
        		   val='6';
        	   else if(e.keyCode==103)
        		   val='7';
        	   else if(e.keyCode==104)
        		   val='8';
        	   else if(e.keyCode==105)
        		   val='9';
               if(!ValidateDecimal($('#'+id).val()+val, 18, 2)){
               	event.preventDefault();
               }
           }   
       }

}
function allowOnlyDecimal1(id,e){

//	alert(e.keyCode)
	if ( $.inArray(e.keyCode,[46,8,9,27,13,190,110]) !== -1 ||
            // Allow: Ctrl+A
           (e.keyCode == 65 && e.ctrlKey === true) || 
            // Allow: home, end, left, right
           (e.keyCode >= 35 && e.keyCode <= 39)) {
		if($('#'+id).val().indexOf('.')>-1){
 		   if(e.keyCode==190 || e.keyCode==110){
 			   event.preventDefault(); 
 		   }
 	   } 
       }
       else {
           // Ensure that it is a number and stop the keypress
           if (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105 )) {
               event.preventDefault(); 
           }else{
//        	   alert($('#'+id).val()+String.fromCharCode(e.keyCode));
//        	   alert(ValidateDecimal($('#'+id).val()+String.fromCharCode(e.keyCode), 18, 2));
               // let it happen, don't do anything
        	   var val='0';
//        	   alert(e.keyCode);
        	   if(e.keyCode==96)
        		   val='0';
        	   else if(e.keyCode==97)
        		   val='1';
        	   else if(e.keyCode==98)
        		   val='2';
        	   else if(e.keyCode==99)
        		   val='3';
        	   else if(e.keyCode==100)
        		   val='4';
        	   else if(e.keyCode==101)
        		   val='5';
        	   else if(e.keyCode==102)
        		   val='6';
        	   else if(e.keyCode==103)
        		   val='7';
        	   else if(e.keyCode==104)
        		   val='8';
        	   else if(e.keyCode==105)
        		   val='9';
               if(!ValidateDecimal($('#'+id).val()+val, 4, 2)){
               	event.preventDefault();
               }
           }   
       }

}
    
function allowOnlyDecimal2(id,e){

//	alert(e.keyCode)
	if ( $.inArray(e.keyCode,[46,8,9,27,13,190,110]) !== -1 ||
            // Allow: Ctrl+A
           (e.keyCode == 65 && e.ctrlKey === true) || 
            // Allow: home, end, left, right
           (e.keyCode >= 35 && e.keyCode <= 39)) {
		if($('#'+id).val().indexOf('.')>-1){
 		   if(e.keyCode==190 || e.keyCode==110){
 			   event.preventDefault(); 
 		   }
 	   } 
       }
       else {
           // Ensure that it is a number and stop the keypress
           if (e.shiftKey || (e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105 )) {
               event.preventDefault(); 
           }else{
//        	   alert($('#'+id).val()+String.fromCharCode(e.keyCode));
//        	   alert(ValidateDecimal($('#'+id).val()+String.fromCharCode(e.keyCode), 18, 2));
               // let it happen, don't do anything
        	   var val='0';
//        	   alert(e.keyCode);
        	   if(e.keyCode==96)
        		   val='0';
        	   else if(e.keyCode==97)
        		   val='1';
        	   else if(e.keyCode==98)
        		   val='2';
        	   else if(e.keyCode==99)
        		   val='3';
        	   else if(e.keyCode==100)
        		   val='4';
        	   else if(e.keyCode==101)
        		   val='5';
        	   else if(e.keyCode==102)
        		   val='6';
        	   else if(e.keyCode==103)
        		   val='7';
        	   else if(e.keyCode==104)
        		   val='8';
        	   else if(e.keyCode==105)
        		   val='9';
               if(!ValidateDecimal($('#'+id).val()+val, 5, 2)){
               	event.preventDefault();
               }
           }   
       }

}    
    

	

function isNewAnalysisReportGenerationRequired()
{
	var isDatacollectionChange = $('#dcInputDocId_AnalysisReport').val();
	//alert('doc id in personal info='+isDocIdAvailable);
	if(isDatacollectionChange==0 || isDatacollectionChange=='0' || isDatacollectionChange==null )
		{
		
		}
	else{
		showAlertMessage("Success", "<br/>Please click on Generate Report if you would like to see the revised Analysis Report.", "confirmation", doNothing);		
	}
}

function showInsuranceMethods(){
	$('#insuranceMethodsPopup').modal('show');
	/*$('#blanket').show();
	var height = ($(window).height() / 2) - (parseInt($('#insuranceMethodsPopup').css('height'))/2);
	$('#insuranceMethodsPopup').css('top',height);
	var width = ($(window).width() / 2) - (parseInt($('#insuranceMethodsPopup').css('width'))/2);
	$('#insuranceMethodsPopup').css('margin-left', width);
	$('#insuranceMethodsPopup').css('position','fixed');*/
	$.ajax({
	     type : "POST",
	     url : $('#contextPath').val()+'/dc/getLifeInsuranceForAllMethods.htm',
	     success : function(result) {
//	    	 alert(result[0]);
//	    	 alert(result[1]);
//	    	 alert(result[2]);
//	    	 alert(result[3]);
	    	 $('#hlvAmount').html(parseInt(result[1]));
	    	 $('#expenseAmount').html(parseInt(result[2]));
	    	 $('#incomeAmount').html(parseInt(result[3]));
	    	 $('#liMethodSelect').val(parseInt(result[4]))
	     }
	});
}

function closeInsuranceMethodsPopup(){
	$('#insuranceMethodsPopup').hide();
	$('#blanket').hide();
}
function saveLIMethod(){
	
	$.ajax({
	     type : "POST",
	     url : $('#contextPath').val()+'/dc/saveLifeInsuranceMethod.htm?liMethodSelect='+$('#liMethodSelect').val(),
	     success : function(result) {
	    	 closeInsuranceMethodsPopup()
	    	 submit();
	     }
	});
}
function checkIfArrayIsUnique(myArray) 
{
    for (var i = 0; i < myArray.length; i++) 
    {
        for (var j = 0; j < myArray.length; j++) 
        {
            if (i != j) 
            {
                if (myArray[i] == myArray[j]) 
                {
                    return true; // means there are duplicate values
                }
            }
        }
    }
    return false; // means there are no duplicate values.
}

function addPartnerRequiredValidation(){
	
	var isValid=true;
	if ($('#partner_firstName').val().trim()=="") {
		// alert("First name is required.");
		 $('#partner_firstName').css('border-color','red');
		$('#partner_firstName').attr('title', 'Please Enter First Name.');
		isValid= false;
    } 
	 else{
		 $('#partner_firstName').css('border-color','grey');
			$('#partner_firstName').removeAttr('title');
		
	 }
	 if ($('#partner_lastName').val().trim()=="") {
		 $('#partner_lastName').css('border-color','red');
			$('#partner_lastName').attr('title', 'Please Enter Last Name.');
			isValid= false;
    } 
	 else{
		 $('#partner_lastName').css('border-color','grey');
			$('#partner_lastName').removeAttr('title');
		
	 }
	 if ($('#partner_loginName').val().trim()=="") {
		 $('#partner_loginName').css('border-color','red');
			$('#partner_loginName').attr('title', 'Please Enter Username.');
			isValid= false;
     
    } 
	 else{
		 $('#partner_loginName').css('border-color','grey');
			$('#partner_loginName').removeAttr('title');
		
	 }
	 if ($('#partner_contactEmail').val().trim()=="") {
			
		 $('#partner_contactEmail').css('border-color','red');
			$('#partner_contactEmail').attr('title', 'Please Enter Contact Email.');
			isValid= false;
    } 
	 else{
		 $('#partner_contactEmail').css('border-color','grey');
			$('#partner_contactEmail').removeAttr('title');
		
	 }
	if(validEmail()== false)
	{
		 	//alert('Please enter the valid Alternate Email');
		 	$("#partner_contactEmail").val('');
			$("#partner_contactEmail").focus();
			isValid= false;
   }
	
//	 if ($('#partner_ARN').val().trim()=="") {
//		 $('#partner_ARN').css('border-color','red');
//			$('#partner_ARN').attr('title', 'Please Enter ARN.');
//			isValid= false;
//    }
//	 else{
//		 $('#partner_ARN').css('border-color','grey');
//			$('#partner_ARN').removeAttr('title');
//		
//	 }
//	 if ($('#partner_euin').val().trim()=="") {
//		 $('#partner_euin').css('border-color','red');
//			$('#partner_euin').attr('title', 'Please Enter EUIN.');
//			isValid= false;
//    }
//	 else{
//		 $('#partner_euin').css('border-color','grey');
//			$('#partner_euin').removeAttr('title');
//		
//	 }
	 if ($('#isHeadNode').val()=="0") {
		 $('#isHeadNode').css('border-color','red');
			$('#isHeadNode').attr('title', 'Please Select Head Node or Not.');
			isValid= false;
    }
	 else{
		 $('#isHeadNode').css('border-color','grey');
			$('#isHeadNode').removeAttr('title');
		
	 }
	 
	 
	 
	return isValid;

	
	//return true;
}

function validEmail() 
{
	var email = $('#partner_contactEmail').val().toLowerCase(); 
    var filter =/^([a-z0-9_\-\.])+\@([a-z0-9_\-\.])+\.([a-z]{2,4})$/;
    
    if (filter.test(email)) 
    {
        return true;
    }
    else 
    {
        return false;
    }
}

function imageFormat( cellvalue, options, rowObject ){
	//alert(options.colModel.formatoptions.baseLinkUrl);
	return '<a href="'+options.colModel.formatoptions.baseLinkUrl+cellvalue+'"><div title="Edit selected row" class="ui-pg-div ui-inline-edit" onmouseover="jQuery(this).addClass(\'ui-state-hover\');" onmouseout="jQuery(this).removeClass(\'ui-state-hover\')" ><span class="ui-icon ui-icon-pencil"></span></div></a>';
}
function yesNoFormat( cellvalue, options, rowObject ){
	if(parseInt(cellvalue)<1)
		return 'No';
	else
		return 'Yes';
}

function percentageFormat(cellvalue, options, rowObject){
	if(cellvalue=='Open'){
		return "<div class='progress pos-rel' data-percent='0%' title='"+cellvalue+"' onclick='showDCStagePopup("+rowObject.partyId+")'><div class='progress-bar' style='width:0%;'></div></div>";
	}else if(cellvalue=='DCT Initiated'){
		return "<div class='progress pos-rel' data-percent='25%' title='"+cellvalue+"' onclick='showDCStagePopup("+rowObject.partyId+")'><div class='progress-bar' style='width:25%;'></div></div>";
	}else if(cellvalue=='DCT Partially Filled'){
		return "<div class='progress pos-rel' data-percent='50%' title='"+cellvalue+"' onclick='showDCStagePopup("+rowObject.partyId+")'><div class='progress-bar' style='width:50%;'></div></div>";
	}else if(cellvalue=='DCT Completed' || cellvalue=='DCT Submitted'){
		return "<div class='progress pos-rel' data-percent='75%' title='"+cellvalue+"' onclick='showDCStagePopup("+rowObject.partyId+")'><div class='progress-bar' style='width:75%;'></div></div>";
	}else if(cellvalue=='Execution Open'){
		return "<div class='progress pos-rel' data-percent='90%' title='"+cellvalue+"' onclick='showDCStagePopup("+rowObject.partyId+")'><div class='progress-bar' style='width:90%;'></div></div>";
	}else if(cellvalue=='Execution Complete'){
		return "<div class='progress pos-rel' data-percent='100%' title='"+cellvalue+"'  onclick='showDCStagePopup("+rowObject.partyId+")'><div class='progress-bar' style='width:100%;'></div></div>";
	}else{
		return '';
	}
	
}

function showDCStagePopup(partyId){
	//alert(partyId);
	$('#dcStageTable').empty();
	$.ajax({
		type : "POST",
		url : $('#contextPath').val()+'/opportunity/getOpportunityStageList.htm?partyId='+partyId,
		success : function(result) {
//				alert(result)
			$('#dcStageTable').append('<tr id=""><th class="thead">Stage</th><th class="thead">Status</th><th class="thead">Start Date</th><th class="thead">End Date</th></tr>');
			$(result).each(function(i,obj) {
//					alert(obj.partyId)
				if(obj.fpStageEndDate==''){
					$('#dcStageTable').append('<tr><td>'+obj.stage+'</td><td><i class="fa fa-close"></i></td><td></td><td></td></tr>');
				}else{
					$('#dcStageTable').append('<tr><td>'+obj.stage+'</td><td><i class="fa fa-check"></i></span></td><td>'+obj.fpStageEndDate+'</td><td>'+obj.fpStageEndDateTime+'</td></tr>');
					//$('#dcStageTable').parent().parent().attr('title',obj.stage);
				}
			});
			//$('.progress_dialog').removeClass('hide');
			$( ".progress_dialog" ).removeClass('hide').dialog({
				resizable: false,
				modal: true,
				width: "auto",
                
			});
		}});
}