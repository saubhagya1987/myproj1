<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Report</title>
 <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   <!-- <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>-->
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/nicEdit.js"></script>
<style>

#ui-id-1{
	width:168px!important;
	padding-left:20px!important;}
#ui-id-2{
	width:168px!important;
	padding-left:24px!important;}
.ui-menu-item{
	list-style:none !important;}
.ui-corner-all{
	margin-left:-10px!important;}
.ui-helper-hidden-accessible{color:#000;}

</style>  
 <!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">-->
<link href="<%=request.getContextPath()%>/css/style_serviceportal.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<!--<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.ui.all.css" />-->
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<!--<script src="js/jquery-1.9.1.js"></script>-->
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.position.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.menu.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.autocomplete.js"></script>-->









<script type="text/javascript">
	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>
	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/report.js"> </script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/report.css" />


<style>
a.list-group-item.active {
 z-index: 0;
  color: #ffffff;
  background-color: #ae2760;
  border-color: #ae2760;
}
</style>

</head>
<body>
<jsp:include page="../common/header.jsp" />
<input id="contextPath" type="hidden" name="contextPath"
  value="<%=request.getContextPath()%>" />

	<div style="display: none;" id="blanket"></div>
	<div
		style="display: none; width: 650px; height: 620px; top: 100px; overflow: auto;"
		id="popUpAlertaddnote" class="alert">
		<div class="close" style="margin-right: 10px;">
			<a onClick="popup('popUpAlertaddnote');resetVal();location.reload();" href="#"><img alt=""
				src="images/btn_close.gif" /></a>
		</div>

		<div id="reportnote">
			<div id="popupwrapper_contactform">

				<div class="heading_contactform">
					<h3>Report</h3>
				</div>
				<div id="downloadOptions" align="right" style="display:none;">
			
					<br><br>
					Download Report as:
					 <a class="pdficon" title="Download in Pdf" alt="Download in Pdf"href="#" onclick="downloadReport1('pdf',${sessionScope.userSession.partyId})"></a>
					 <a class="excelicon" title="Download in Excel" alt="Download in Excel"href="#" onclick="downloadReport1('xls',${sessionScope.userSession.partyId})"></a>
					 <a class="docicon" title="Download in Doc" alt="Download in Doc" href="#" onclick="downloadReport1('doc',${sessionScope.userSession.partyId})"></a>
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

     
    <div class="container white">
    	<div class="container-head">
         <div class="col-md-12" style="text-align: right;">
          <!-- accordion start-->
           
           	  <div class="accordion pull-left col-md-12" id="accordFundSel">
                <div class="accordion-group">
                  <div class="pull-left fundtool_left_col_head "> <span style="float:left;">Reports</span> </div>
                  <!-- <div class="accordion-heading" style="float:right;"> <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordFundSel" href="#collapseFundSel"> <span style=" margin-top:0px;" class="searchicon"  alt="Search" title="Search"></span> </a> </div> -->
                  <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
                    <div class="accordion-inner">
                     <div style="width: 1211px;">
                        <!--1 search start -->
                        <div class="filterbox searchpadding ">
                          <div class="head">Filter</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                             
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Date Range</li>
                                <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Status </li>
                                
                                </ul>
                          </div>
                        </div>
                          <div class="filterbox searchpadding">
                            <div class="head">Date Range </div>
                           <div class="drop_box_body">
                            <span class="searchtext"> Start Date</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" /> 
                            <span class="searchtext"> End Date</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                            
                             <br>
                         	</div>
                         </div>
                        <div class="filterbox searchpadding">
                          <div class="head">Status</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox"  checked>
                                New </li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Open</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox"  checked>
                               Cancelled</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Converted</li>
                              
                             
                            </ul>
                          </div>
                         </div> 
                         </div>
                        <div class="box_button pull-left">
                      <button type="button" id="updatefilterlist" class="btn">Show</button>
                    </div>
                    </div>
                        
                       
                      
          
                    <!-- accordion-inner END -->
                
                    
                    
                   
                  </div>
                  <!-- accordion-body END -->
                </div>
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
 
              
               <!-- accordion End -->
            </div >
          </div >
         
	  	<div class="container-body">
        
        <!-- center  part -->
        <span class="list-group"></span>
      <jsp:include page="CRMReportSidebar.jsp" />
        <div class="col-md-9"  style="margin-top:10px; padding-left:10px;"  >
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">Service Team open task list</a>
           <div class="list-group-item">
<!-- Search start-->
          			
          			<form onsubmit="return false">
							<div class="searchboxreport">
							<table>
							<tr>
								<td><span class="style1"><b>Query Type </b></span></td>
								<td><select name="querytypeId"	id="querytypeId" ></select></td>
							</tr>
							<tr class="spacer"><td></td></tr>
							<tr class="spacer"><td></td></tr>
							<tr class="spacer"><td></td></tr>
							<tr>
								<td><span class="style1"><b>Query Contact Type  </b></span></td>
								<td><select name="queryconId"	id="queryconId" ></select></td>
							</tr>
							<tr class="spacer"><td></td></tr>
							<tr class="spacer"><td></td></tr>
							<tr class="spacer"><td></td></tr>
							<tr>
								<td><span class="style1"><b>Start Date </b></span></td>
								<td><input type="text" name="Startdatename" id="from" class=" " readonly='true' value=" "></td>
							</tr>
							<tr class="spacer"><td></td></tr>
							<tr class="spacer"><td></td></tr>
							<tr>
								<td><span class="style1"><b>End Date </b></span></td>
								<td><input type="text" name="Enddatename" id="to" class=" " readonly='true' value=" "></td>
							</tr>
							<tr class="spacer"><td></td></tr>
							<tr class="spacer"><td></td></tr>
							<tr>
								<td><a href="#" style="color: #fff;" onClick="reportnote();getPartOpenQueryList('PartnerOpenQueryList.rptdesign',${sessionScope.userSession.partyId})">
									<input type="button" class="dbtn" value="Show" title="Show"alt="Show"  onClick="popup('popUpAlertaddnote')">
								</a> </td>
							</tr>								
						 </table>
						</div>
					</form>
					
<!-- Search start-->
      <div class="row" style="display:none;" id="showreport" > 
        <ul class="pagination pagination-sm">
  <li  class="disabled"><a href="#">&laquo;</a></li>
  <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">&raquo;</a></li>
</ul>	


</div>
</div></div>      	<br/><br/>
       	</div>
</div></div>
     <footer>
  <jsp:include page="../common/footer.jsp" />
 </footer> 
<!-- Center part End -->          


<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script> 
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>-->

	<script type="text/javascript">
    
    function  reportnote()
    {
    	//alert(('#opportunityStatus').val());
    	$("#reportnote").show();
    	$("#popUpAlertaddnote").css ('height','1000px');
    	$("#popUpAlertaddnote").css ('width','1100px');
    }
    
 	
    
    
    function addQueryTypeId()
    {
    
    	
       $.ajax
      ({
                  
          type: "POST",
         // url: $('#contextPath').val()+'/birtReport/getCodeValueDescription.htm',
         url:$('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=20',
          dataType: 'json',
          contentType: 'application/json',
             success:function(result)
          { 
            //result = JSON.parse(result);
            //alert('result='+result);
            $('#querytypeId').empty();
            /*  $('#querytypeId').append('<option value="0">--Select--</option>');  */
            $('#querytypeId').append('<option value=0>All Select</option>');
            $(result).each(function(i, obj) 
            		{
            	var module=obj.codeValue;
				var moduleid=obj.codeValueId;
          
			  
              $('#querytypeId').append('<option value="'+ moduleid+'">'+ module + '</option>');
            	
            		});
            
          }
       
       });
     
      
     }
    $(document).ready(function(){
    	 $('#SPServiceTeamopentasklistReportLink').css('font-weight','bold');
    	addQueryTypeId();
    }); 
    
    
    
    
    
    function addQueryContactTypeId()
    {
    
    	
       $.ajax
      ({
                  
          type: "POST",
         // url: $('#contextPath').val()+'/birtReport/getCodeValueDescription.htm',
         url:$('#contextPath').val()+'/common/getPicklistValues.htm?codeTypeIds=15',
          dataType: 'json',
          contentType: 'application/json',
             success:function(result)
          { 
            //result = JSON.parse(result);
            //alert('result='+result);
            $('#queryconId').empty();
     	    $('#queryconId').append('<option value=0>All Select</option>');
       
            $(result).each(function(i, obj) 
            		{
            	var module=obj.codeValue;
				var moduleid=obj.codeValueId;
          
			  
              $('#queryconId').append('<option value="'+ moduleid+'">'+ module + '</option>');
            	
            		});
            }
       
       });
     
      
     }
     $(document).ready(function(){
    	addQueryContactTypeId();
    });

    
    
    $('#quickSearch').keyup(function() {
	     $(this).val(function(i, value) {
	        return value.replace(/\s/, '');
	     }); 
	 });
 
 

  
  function resetVal()
 {
   
   $('#quickSearch').val('');
   $('#from').val(getLastDate());
   $('#to').val(getCurrentDate());

 } 
  
  $(function() {
	    $( "#from" ).datepicker({
	    	  dateFormat: "dd/mm/yy",
	      defaultDate: "+1w",
	     // changeMonth: true,
	      changeMonth: true,
	      changeYear: true,
	      numberOfMonths: 1,
		 // minDate:"-1Y",
	      onClose: function( selectedDate ) {
	        $( "#to" ).datepicker( "option", "minDate", selectedDate );
	      }
	    });
	    $( "#to" ).datepicker({
	    	  dateFormat: "dd/mm/yy",
	      defaultDate: "+1w",
	      changeMonth: true,
	      changeYear: true,
	      changeMonth: true,
	      //numberOfMonths: 1,
	      onClose: function( selectedDate ) {
	        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
	      }
	    });
	    
	    $(function() {
	        var date = new Date(); // replace with your date
	        $("#to").val(getCurrentDate());
	   });
	    
	    
	    $(function() {
	        var date = new Date(); // replace with your date
	        $("#from").val(getLastDate());
	   });
	  });
	  
	  
	  
  function getCurrentDate(){
	  today_date = new Date();
	 // alert(today_date)

	  today_Date_Str = ((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "/" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "/" +today_date.getFullYear();
	  var last_Date_Str;	
	  last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "/" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "/" +String(today_date.getFullYear()-1);
		
	 // alert("Last year"+last_Date_Str)

		
	  return today_Date_Str;
	}

	function getLastDate(){
		 today_date = new Date();
		 var last_Date_Str;	
		 last_Date_Str=((today_date.getDate() < 10) ? "0" : "") + String(today_date.getDate()) + "/" +((today_date.getMonth() < 9) ? "0" : "") + String(today_date.getMonth() + 1)+ "/" +String(today_date.getFullYear()-1);
		 // alert("Lasttt year"+last_Date_Str)

		 return last_Date_Str;
	}
    </script>
</body>
</html>