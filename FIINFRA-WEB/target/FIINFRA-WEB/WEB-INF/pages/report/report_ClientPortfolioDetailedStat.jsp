<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Calendar"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Reports</title>

</head>  
<body>
<jsp:include page="../common/header.jsp" />
<input id="contextPath" type="hidden" name="contextPath"
  value="<%=request.getContextPath()%>" />

	<div style="display: none;" id="blanket"></div>
	<div
		style="display: none; width: 650px; height: 620px; top: 100px; overflow: auto;z-index: 10000000000000 !important"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote');resetVal();" href="#"><img alt=""
				src="images/btn_close.gif" /></a>
		</div>

		<div id="reportnote">
			<div id="popupwrapper_contactform">

				<div class="heading_contactform">
					<h3>Report</h3>
				</div>
				<div id="downloadOptions" align="right" style="display:none;"> 
			
					<br><br>
					</div>
				<div id="poptable_contactform" style="padding: 10px; height: 850px;">

					<!--  <span  class="searchpadding padding_top" style="float:left; width:150px;">Party Type   <span class="red">*</span> </span> -->

					<div id="reportview"></div>
				
				</div>
			</div>
		</div>
	</div>

<!--css popup window start 1-->
<div style="display: none;" id="blanket"></div>
<div style="display: none; width:450px; height:380px;" id="popUpDiv">
<div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv')" href="#"><img alt="" src="images/btn_close.gif" /></a></div>

    <div id="popupwrapper_contactform">
   	<div class="heading_contactform"><h3>Log Trouble Ticket</h3></div>
        <div id="poptable_contactform">
        	
             <div class="full">
              <input type="text" class="form-control" placeholder="Subject">
               </div>
                <div class="full" >
               <textarea class="form-control" rows="3" placeholder="Your Question" style="height: 100px;"></textarea>
			</div>
             <div class="full">
              <input type="text" class="form-control" placeholder="Attach File" >
              
               </div>
 </div>
   <div class="topbuttonholder">
        	<form><input class="dbtn" value="Send Email"   id="loginButton" type="button">	
            <input class="dbtn" value="Cancel" onClick="popup('popUpDiv')"  id="loginButton" type="button">	</form>	
        </div>  
        
	</div>
</div>

        <!-- center  part -->
        <span class="list-group"></span>
      
     
     <div class="page-header">
		<h1 class="pull-left">MF Portfolio Reports</h1>
           
           <div class="clearfix"></div>
	</div>
   <!--div starts  -->      
     <div class="row">
  		<jsp:include page="MFPortfolioSidebar.jsp" /> 
  		<div class="col-md-9">
            				
                    <div class="clearfix"></div>
  		<div class="list-group">
        		<a class="list-group-item active" href="#">Portfolio Detail Statement</a>
           <div class="list-group-item">
           
           
<!-- Search start--><div class="modal-body">
			 <form onsubmit="return false" class="form-horizontal">
							<div class="searchboxreport" id="reportview"> 
							<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >Client Name :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input name="text" type="text" id="quickSearch" name="searchString" onKeyUp="quickSearchContacts(this);" placeholder="Quick Search" style="width: 300px;">
									<input name="text" type="hidden" id="quickSearchHidden" name="searchString"  placeholder="Quick Search" style="width: 300px;">
									<div id="er1"></div>
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
						
						
						<div class="form-group">
							<label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >As On Date :</label>
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
									<input type="text" name="Startdatename" id="datepicker" class=" " readonly='true' value=" ">
									
								</div>
							</div> 
						</div>
						<div class="space-2"></div>
						
						 <div class="form-group">
							 <label class="control-laabel col-xs-12 col-sm-3 no-padding-right" >  </label> 
							<div class="col-xs-12 col-sm-9">
								<div class="clearfix">
								<a href="#" style="color: #fff;" >
								<input type="submit" class="btn btn-xs btn-primary " value="Show" title="Show" alt="Show" onClick="chkform();resetVal();">
								</a>
								</div>
							</div> 
						</div> 
						
						<div class="space-2"></div>
         
							</div> 
					 </form>
								</div>
				</div></div>
  		
  		
   	  </div> 	
   	</div> 

      
         	<br/><br/>
       	



 

	<!-- Center part End -->

	
<jsp:include page="../common/footer.jsp" />


	<script type="text/javascript">

function getClientPortfolioDetailStatement(partyid){
		
	var as_on_date1 = $('#datepicker').val();
	var ClientpartyId = $('#quickSearchHidden').val();
		var partner_id = partyid;
			
			if ((ClientpartyId == '')||(ClientpartyId == 'NULL'))
		    {
				ClientpartyId=0;
		    } 
			var dt = as_on_date1.split("-");
			var day = dt[0];
			var mn = dt[1];
			var yr = dt[2];
			as_on_date = mn+"-"+day+"-"+yr;
	
			
		
			  url ="ClientPortfolioDetailStatement&rs:Command=Render&rc:Parameters=false&as_on_date="+as_on_date+"&PartyID="+ClientpartyId+"&partnerId="+partner_id+"&loggedpartyId="+partner_id+"";
			  callReport(url);
			  var actionByUserID = ${sessionScope.userSession.userId};
			  var sourceModule='Client level';
			  var sourceScreen='Client Portfolio Detail Statement';
			  var objectName ='AsOndate::'+as_at_date1+',ClientpartyId::'+ClientpartyId+',PartnerId::'+partner_id+',loggedpartyId::'+partnerId;
			  $.ajax({
					 type :'POST',
			      url : $('#contextPath').val() +"/birtreport/auditForReport.htm?actionByPartyId="+partyid+"&actionByUserID="+actionByUserID+"&eventID="+97191+"&sourceSystemID="+31001+"&sourceModule="+sourceModule+"&sourceScreen="+sourceScreen+"&objectName="+objectName,
					 success : function(result) 
					 {
					

				}
				});
				  
			  }
	 
$('#quickSearch').blur(function(){
	//alert($('#quickSearch').val());
	 var arr = extractLast($('#quickSearch').val());
	 this.value = this.value.replace(arr, '');
	 this.value = this.value.replace(/;/, '');
	
  }); 

$('#quickSearch').click(function(){
	$('#quickSearch').val('');
	$('#quickSearchHidden').val('');
  }); 

	
function quickSearchContacts(e){
	
	var event = window.event ? window.event : e;
	//alert(event.keyCode);
	
	if (event.keyCode==37 || event.keyCode==38 || event.keyCode==39 || event.keyCode==40 )
		return;
	if(event.keyCode==13){
		search();
		return;
	}
	$('#common_popup_div,#shadow_div_web_app').remove();
	//alert($('#quickSearch').val());
$.ajax({
	  url: $('#contextPath').val()+"/birtreport/getClientListOnly.htm?searchString="+$('#quickSearch').val(),
	  method:"post",
	  success:function(result){

		 
					 
					  var userLabelValueList = new Array();
						 $(result).each(function(i,obj){
								var object = {};
								object.value = obj.partyID;
								object.label = obj.clientName;
						
								userLabelValueList.push(object);
							
						 }); 
						 
						 $("#quickSearch")
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
//		 					        	partyId=ui.item.value;
							        	$('#quickSearchHidden').val(ui.item.value)
								
							        terms.push( "" );
							        this.value = terms.join( ";" );
							        
							        var labelArr = $(this).data('label') || new Array();
							        labelArr.push(ui.item);
							        $(this).data('label',labelArr);
							        console.log($(this).data());
							        
							        return false;
						      }
						    });
					  
						
				  }
				});

			}
			 function split( val ) {
				    return val.split( /;\s*/ );
				} 
				function extractLast( term ) {
				    return split( term ).pop();
				} 
			


   
    function addcodevalueDescription()
    {
    
    	
       $.ajax
      ({
                  
          type: "POST",
         // url: $('#contextPath').val()+'/birtReport/getCodeValueDescription.htm',
         url:$('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=6',
          dataType: 'json',
          contentType: 'application/json',
             success:function(result)
          { 
            //result = JSON.parse(result);
            //alert('result='+result);
            $('#opportunityStatusId').empty();
            $(result).each(function(i, obj) 
            		{
            	var module=obj.codeValue;
				var moduleid=obj.codeValueId;
          
   
              $('#opportunityStatusId').append('<option value="'+ moduleid+'">'+ module + '</option>');
            	
            		});
          }
       
       });
     
      
     }
         
    
    $(document).ready(function(){
    	addcodevalueDescription();
    });

    
    
  

  
   $('#quickSearch').keyup(function() {
	     $(this).val(function(i, value) {
	        return value.replace(/\s/, '');
	     }); 
	 });

  
  $(function() {
	  
	    $( "#datepicker" ).datepicker({
	    	dateFormat: "dd-mm-yy",
		      defaultDate: "+1w",
		      changeMonth: true,
		      changeYear: true,
		      yearRange:"1980:2025"
	    });
	  }); 
		    function getCurrentDate(){
		  	  today_date = new Date();
		  	 // alert(today_date)

		  	  today_Date_Str = ((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +today_date.getFullYear();
		  	  var last_Date_Str;	
		  	  last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "-" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "-" +String(today_date.getFullYear()-1);
		  		
		  	 // alert("Last year"+last_Date_Str)

		  		
		  	  return today_Date_Str;
		  	}	
   
		    $(function() {
		        var date = new Date(); // replace with your date
		        $("#datepicker").val(getCurrentDate());
		   });
		    
		    

  
   
   function chkform()
   {
  	if (document.getElementById("quickSearch").value === "" ) 
     {

      document.getElementById("er1").innerHTML = "Please enter client name"; 
      document.getElementById("er1").style.color = "red"; 
      document.getElementById("er1").style.display = "block"; 
      
      $('#common_popup_div,#shadow_div_web_app').remove();
     }
  	else
  	{
  		getClientPortfolioDetailStatement(${sessionScope.userSession.partyId});
  		 document.getElementById("er1").innerHTML=""; 
				
  	}
  	
	}
   
   $(document).ready(function(){
	   $('#ClientPortFolioDetailedStatementLink').css('font-weight','bold');
       $.ajax({
              type :'GET',
           url : $('#contextPath').val() +"/birtreport/urlForReport.htm",
              success : function(result)
              {
                     $('#abc').val(result);
         }
         });
     });
   
   function resetVal()
   {
     
     $('#quickSearch').val('');
     $('#datepicker').val(getCurrentDate());
     $('#quickSearchHidden').val('');
     $('#er1').val('');
   }
  </script>  
   
   

</body>
</html>