<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Data Collection</title>
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
    <script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
     <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.js"></script>
      <script src="<%=request.getContextPath()%>/js/bootstrap-responsive.min.js"></script>
       <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>

    


<!-- -responsive css-->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<link href="<%=request.getContextPath()%>/css/Ffreedom_dc.css" rel="stylesheet">
<!-- -responsive css-->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>

<link href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->
<script>
var isContainsRiskCover;
var isContainsEmergencyR
var isContainsCahflow;
var isContainsRiskProfile;
var isContainsSuccession;
var isContainsRetirment;
var isContainsGoal;
var isContainsLoan;
var sectionarray;
		$(document)
				.ready(
						function() {
// 							$('#dcinputname').attr('margin-left','5px');
							$('#dcinputname').append($('#dcInputUsername').val());
							 sectionarray = $('#section').val().split(',');
							 isContainsRiskCover=sectionarray.contains("39003");
							 isContainsEmergencyR=sectionarray.contains("39001");
							 isContainsCahflow=sectionarray.contains("39002");
							 isContainsRiskProfile=sectionarray.contains("39009");
							 isContainsSuccession=sectionarray.contains("39007");
							 isContainsRetirment=sectionarray.contains("39006");
							 isContainsGoal=sectionarray.contains("39005");
							 isContainsLoan=sectionarray.contains("39008");
						});
		</script>

</head>
<body>
<!--css popup window start 1-->
<jsp:include page="../../common/header.jsp" />
<jsp:include page="../../common/common_popup.jsp" />
<input type="hidden" name="dcInputUsername" id="dcInputUsername" value="${sessionScope.dcInputUsername}">	
<input type="hidden" name="dcInputPartyId" id="dcInputPartyId" value="${sessionScope.dcInputPartyId}">
<input type="hidden" id="section" value="${sessionScope.Section}"/>

 	
 <!-- Center part start -->
 <section>
 

 
     
    <div class="container">
    	<div class="container-head">
        
          <div class="col-md-12" style="text-align: right;">
          <span style="float:left; font-weight:bold;" id="dcinputname"> Data Collection for&nbsp;<i class="opportunityicon" > </i> </span>  
          <span> 
          <input class="dcbutton" type="button" value="Exit"  id="exit" onclick="redirectToOpportunity()"  name="Exit"> </span>
        </div >
      </div>
       
        <div class="container-body " style="padding:5px;">
        
        </div>
	  	<div class="container-body">
      		<div class="col-md-12 dchead">DATA COLLECTION </div>
     		<div class="dcsubhead">Please enter your details.Our Experts will get back to you.
     		</div>
      
        <!-- center -->
     
        
        
        <div class="col-md-12" style="margin:20px 0 20px 10px;">
     <div class="col-md-3">
               <div class="dcbox">
              <a href="<%=request.getContextPath()%>/DCPersonalInfoFiinfra.htm" title="Personal Information" alt="Personal Information" > <center><img src="<%=request.getContextPath()%>/images/dc1.png"  width="244" height="243"> </center><br>
                      <h3> Personal <br>
                     Information </a></h3></div>
           </div>
          
           <div class="col-md-3"> 
              <div class="dcbox"><br>          
             <a href="<%=request.getContextPath()%>/RiskProfileFiinfra.htm"  title="Risk Profile"alt="Risk Profile"> <center> <img src="<%=request.getContextPath()%>/images/dc4.png" width="244" height="243" ></center> 
              <h3> Risk<br> Profile </a></h3></div>
              </div>
          
         
          
          <div class="col-md-3">
               <div class="dcbox">
                
                <a href="<%=request.getContextPath()%>/CashflowFiinfra.htm" alt="Current Financial Status"  title="Current Financial Status"> <center><img src="<%=request.getContextPath()%>/images/dc3.png"    width="244" height="243"></center><h3>Current
              Financial Status<br></a></h3> </div>
          </div>
          
          <div class="col-md-3">
              <div class="dcbox">
               <a href="<%=request.getContextPath()%>/DCFutureFinancialExpectationFiinfra.htm" title="Future Financial Expectations" alt="Future Financial Expectations"><center> <img src="<%=request.getContextPath()%>/images/dc2.png"  width="244" height="243"></center><br>
                 <h3>
                 Future Financial <br>
               Expectations </a></h3></div>
          </div>
        </div>
        <div class="clearfix"></div>
        <div class="col-md-12" style="margin:30px 0;">
        
        <center><a href="#"> <input class="dcgbutton" type="button" value="Generate Report" name="Generate Report" onclick="submitDcOutput(isContainsEmergencyR);"> </a></center>
        
        </div>
        <!-- center -->
  	  </div>      	<br/><br/>
       	</div>
</div>
      
<!-- Center part End -->          

<jsp:include page="../../common/footer.jsp" />
<%
String serverPath = request
.getRequestURL()
.toString()
.replace(request.getRequestURI().substring(0),
		request.getContextPath());
serverPath=serverPath.substring(0,serverPath.lastIndexOf("/"));
%>
<input id="baseServerURL" value="<%=serverPath%>">
<input type="hidden" id="usernamefromsession" value="${sessionScope.userSession.userName}"/>

</body>
</html>