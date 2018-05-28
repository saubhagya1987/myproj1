<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Ping Delivery Report</title>
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
    <!--<script src="js/jquery-1.js"></script>
    <script src="js/bootstrap.min.js"></script>
     <script src="js/bootstrap-responsive.js"></script>
      <script src="js/bootstrap-responsive.min.js"></script>
   <script src="js/bootstrap.js"></script>
    <script src="js/holder.js"></script>
-->
    


<!-- -responsive css-->
<!--<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/popup.css" />
--><!-- -responsive css-->
<!--<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/pop.js"></script>
	<script src="js/jquery-1.9.1.js"></script>
	<script src="js/jquery.ui.core.js"></script>
	<script src="js/jquery.ui.widget.js"></script>

<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">
-->


<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

</head>
<body>
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
<!--css popup window 1 close-->

<div class="row headerstrip">
  <div class="headstrip"></div>
   <div class="container">
        <div class="col-md-6 topbanner" >
     <img src="images/banner.png" class="img-responsive">
     </div>
    <div class="col-md-6 " style="padding-top:10px;">
          <div class="nav-no-collapse header-nav">
         	<ul class="nav pull-right" style="margin-top:10px;">
               			<li class="dropdown dropdown-box" >
                    <a class="btn dropdown-toggle" href="#" data-toggle="dropdown">
                     <i class="icon-white"><img src="images/user.png"></i><span class="user">Priyanka Test</span>  <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-menu-title">
                            <span class="user">Account Settings</span></li>
                            <li><a href="partner_profile.html" alt="Profile" title="Profile"><i class="halflings-icon "><img src="images/user.png"></i>
                            <span class="user">Profile</span></a></li>
                            <li><a href="login.html" alt="Logout" title="Logout"><i class="halflings-icon off">
                            <img src="images/logout-menu-button.png"></i><span class="user"  style="margin-left: 10px;">Logout</span></a></li>
                         </ul>
                    </li>
                   </ul>
                   
                          <div class="topLink">
                   	<ul>
                    	<li class="dropdown">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown" alt="Contact" title="Contact">
                        	Contact<span class="caret"></span></a>
                            <ul class="dropdown-menu" style="width:180px;">
                           
                            <li style="float: left;"><a href="#" alt="Call Us" title="Call Us"><i class="callicon"></i><span class="user">Call Us</span></a><br>
                            <span class="dropdown-menutext">022-4222 4333</span>
                          	 <li class="divider"></li>
                         	 <li ><a href="#" alt="Write to us at" title="Write to us at"><i class="emailicon"></i><span class="user" style>Write to us at</span></a>
                            <br>
                            <span class="dropdown-menutext"><a href="mailto:shubhchintak@fi-i.com">shubhchintak@fi-i.com</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  </span>                            </li>
                             <li class="divider"></li>
                            <li><a href="#" alt="FINFRA" title="FINFRA"><i class="addressicon"></i><span class="user">FINFRA</span></a>
                             <br>
                            <span class="dropdown-menutext">506/507, Morya Landmark II,Near Infinity Mall, Link Road,Andheri (W),<br/> Mumbai 400 053
</span>
                            </li>
                             <li class="divider"></li>
                            <li style="float: left;"><a href="#" onClick="popup('popUpDiv')" alt="Open a trouble ticket" title="Open a trouble ticket"><i class="ticketicon"></i><span class="user">Log Trouble Ticket</span></a></li>
                         </ul>
                            </li>
                    	<li class="dropdown">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown" alt="Help" title="Help">
                        	Help <span class="caret"></span></a>
                        
                       	  <ul class="dropdown-menu" >
                            <li><a href="faqs.html" alt="FAQ's" title="FAQ's"><i class="faqsicon"></i><span class="user">FAQ's</span></a></li>
                            <li><a href="knowledge_centre.html" alt="Knowledge Centre" title="Knowledge Centre"><i class="knowledgeicon"></i><span class="user" style>Knowledge Centre</span></a></li>
                            <li><a href="login.html" alt="Demo" title="Demo"><i class="demoicon"></i><span class="user">Demo</span></a></li>
                         </ul>
                        
                      </li>
                      <li><a href="downloads.html" alt="Downloads" title="Downloads ">Downloads </a></li>
                    	<li><a href="#" alt="Setup" title="Setup">Setup</a></li>
                        <li><a href="whatsnew.html"  alt="What's New?" title="What's New?">What's New?</a></li>
                       
                     </ul>
            </div>
        </div>
            </div>
            
	  </div>
    </div> 
    
      <!--Nav Menu Start--> 
 <div class="navbar-inverse">
	<div class="container">
    <div class="navbar-header">
		<button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
    	</button>
    <!--<a class="navbar-brand" href="#"> </a>-->
	</div>
    <div class="collapse navbar-collapse paddingleft"> 
    	<ul class="nav navbar-nav">
       		<li><a href="landing.html" title="Home" onClick="Home">Home</a></li>
            <li><a href="opportunities.html" alt="Opportunities" title="Opportunities">Opportunities</a></li>
            <li><a href="client.html" alt="Clients" title="Clients">Clients</a> </li>
            <li class="active"><a href="pings.html"  alt="Pings" title="Pings">Pings</a> </li>
            <li><a href="goals.html"  alt="Goals" title="Goals">Goals </a> </li>
            <li><a href="executiontracker.html"  alt="Execution" title="Execution">Execution </a> </li>
            <li><a href="advisorportfolio.html"  alt="Portfolio" title="Portfolio">Portfolio </a> </li>
            <li><a href="report.html" alt="Reports" title="Reports" >Reports</a></li>
            <li><a href="analytics.html" alt="Analytics" title="Analytics">Analytics</a></li>
           	<li><a href="chat.html" alt="Chat" title="Chat">Chat</a></li>
            <li><a href="task.html" alt="Tasks" title="Tasks">Tasks</a></li>
            <li><a href="query.html" alt="Query" title="Query">Query</a></li>
        </ul>
      </div>
    </div>
 </div>
<!--Nav Menu End--> 
<!--breadcrum Menu Start--> 
</div>
</div>

 <!-- Center part start -->
 <section>

     
    <div class="container">
    	<div class="container-head">
         <div class="col-md-12" style="text-align: right;">
          <!-- accordion start-->
           
           	  <div class="accordion pull-left col-md-12" id="accordFundSel">
                <div class="accordion-group">
                  <div class="pull-left fundtool_left_col_head "> <span style="float:left;">Pings</span> </div>
                  <div class="accordion-heading" style="float:right;"> <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordFundSel" href="#collapseFundSel"> <span style=" margin-top:0px;" class="searchicon"  alt="Search" title="Search"></span> </a> </div>
                  <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
                    <div class="accordion-inner table-responsive">
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
                                Time </li>
                                
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
                          <div class="head">Time</div>
                          <div class="drop_box_body">
                           <span class="searchtext"> Hours</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" /> 
                            <span class="searchtext">Minutes</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                             <span class="searchtext">AM</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                             <span class="searchtext">PM</span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" />
                            
                            
                          </div>
                         </div> 
                         </div>
                         
                         
                        </div>
                       
                      
          
                    <!-- accordion-inner END -->
                 <div class="col-md-1">
                      <button type="button" id="updatefilterlist" class="btn">Show</button>
                    </div>
                    
                   
                   
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
      <div class=" col-md-3 sidebar-offcanvas" role="navigation" style=" padding-left:10px;" >
            <div class="list-group">
        		<a class="list-group-item active" href="pings.html">Pings</a>
                <a href="pings.html" class="list-group-item">Ping Library Manager </a>
              	<a href="taglist.html" class="list-group-item">Tags List</a>  	
                <a class="list-group-item" href="scheduledpings.html">View Scheduled Pings</a>
                <a href="#" class="list-group-item"><strong>Ping Delivery Report</strong></a> 
                <a class="list-group-item" href="pingmisreport.html">Ping MIS Report </a>  
                <a href="dndlist.html" class="list-group-item">DND List</a>                
            </div>
           
        </div>
        <div class="col-md-9" style=" padding-left:10px;"  >
			
 <!-- center -->
        
         <div class="list-group">
        		<a class="list-group-item active" href="#">Ping Delivery Report</a>
           <div class="list-group-item">
<!-- Search start-->
          	<div  class="searchboxreport">
               <span style="font-size:11px; flaot:left; margin-left:0px;">Search By </span>&nbsp;
                <select  type="button" name="pageSize" id="page" value="10">
                <option value="Select" selected>Date Range</option>
                <option value="Priyanka Test" >Recipient Type </option>
                <option value="Mahesh Test">Scheduled by</option>
                <option value="Aditi Test">Delivery Channel</option>
             </select>
             <span class="style1">Start Date </span>  <input  type="text" class=" " value=" " >
             <span class="style1"> End Date </span> 
             <input  type="text" class=" " value=" " >
             <input  type="button" class="dbtn " value="Show" title="Show" alt="Show"  onClick="$('#showreport').show()">
            </div>
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

<!--Grid start -->
		<div class="table-responsive" id="display_table_lead" style="border:none;">
		  <div id="toreload">
			                        
    <table id="data" class="table table-hover table-bordered table-striped" cellpadding="0" cellspacing="0">
<thead>

<tr>
  <th class="thead"><a href="#">Contact Name </a></th>
  <th width="15%" class="thead"><a href="#">Email Id</a></th>
  <th width="15%" class="thead"> <a href="#">Contact Number</a></th>
  <th width="22%"  class="thead"> <a href="#">Ping Name</a></th>
  <th width="10%"  class="thead"><a href="#">Date</a></th>
  <th width="9%" class="thead"><a href="#">Time</a></th>
  <th width="9%" class="thead"> <a href="#">Delivery Channel </a></th>
</tr></thead>
<tbody>
<tr>
  <td><i class="clienticon" title="Client"></i>Pradip</td>
  <td><a href="#">kumar@pradip.com</a></td>
  <td>918600888146</td>
  <td> Blind spots in your financial plan</td>
  <td>14/11/2013</td>
  <td>8:15 AM</td>
  <td>Email</td>
</tr>
<tr >
  <td><i class="pclienticon" title="PClient"></i>Ameer</td>
  <td><a href="#">ameer@k.com</a></td>
  <td>918600888146</td>
  <td>Tax planning </td>
  <td>14/11/2013</td>
  <td>3:15 AM</td>
  <td> SMS</td>
</tr>
<tr>
  <td><i class="opportunityicon"  title="Opportunity"></i>Sachin</td>
  <td><a href="#">sachin@k.com</a></td>
  <td>918600888146</td>
  <td>Retirement plan</td>
  <td>14/11/2013</td>
  <td>5:50 pM</td>
  <td>SMS</td>
</tr>
<tr >
  <td><i class="clienticon" title="Client"></i>Kunal</td>
  <td><a href="#">kunal@k.com</a></td>
  <td>918600888146</td>
  <td>Child education – 16 to 18 years</td>
  <td>14/11/2013</td>
  <td>8:15 AM</td>
  <td>Email</td>
</tr>
<tr>
  <td><i class="pclienticon" title="PClient"></i>Dilip</td>
  <td><a href="#">dilip@d.com</a></td>
  <td>918600888146</td>
  <td>Need for a Will</td>
  <td>14/11/2013</td>
  <td>5:15 AM</td>
  <td>Email</td>
</tr>
<tr>
  <td><i class="opportunityicon" title="Opportunity"></i>Chetan</td>
  <td><a href="#">Chetan@s.com</a></td>
  <td>918600888146</td>
  <td>Market volatility</td>
  <td>14/11/2013</td>
  <td>6:00 AM</td>
  <td>Email</td>
</tr>
<tr>
  <td ><i class="clienticon" title="Client"></i>Kiran</td>
  <td><a href="#">Kiran@m.com</a></td>
  <td>918600888146</td>
  <td >How much health insurance</td>
  <td>14/11/2013</td>
  <td>8:05 PM</td>
  <td>Email</td>
</tr>
<tr>
  <td><i class="clienticon" title="Client"></i>Salil</td>
  <td><a href="#">Salil@a.com</a></td>
  <td>918600888146</td>
  <td>Health insurance costs</td>
  <td>14/11/2013</td>
  <td>10:15 AM</td>
  <td>Email</td>
</tr>
<tr>
  <td><a href="#" title="Client"><i class="clienticon" title="Client"></i></a>Vinod </td>
  <td><a href="#">Vinod@k.com</a></td>
  <td>918600888146</td>
  <td>SP – Women and Will</td>
  <td>14/11/2013</td>
  <td>11:15 AM</td>
  <td>Email</td>
</tr>
<tr>
  <td ><a href="#" title="Client"><i class="clienticon" title="Client"></i></a>Pravin </td>
  <td><a href="#">Pravin@a.com</a></td>
  <td>918600888146</td>
  <td>-	How much returns exactly?</td>
  <td>14/11/2013</td>
  <td>9:45 AM</td>
  <td>SMS</td>
</tr></tbody></table>
 
        
                     
       
        <!-- Center-->    
     </div> 
    </div> 
<!--Grid End -->
   <div class="row">
     <div class="col-xs-pull-9">
         <ul class="pagination pagination-sm"  style="float:left; margin-right:10px;">
          <li  class="disabled"><a href="#">&laquo;</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
          <li><a href="#">&raquo;</a></li>
        </ul>	
        <div class="topmenuleft" >
         <div  class="customDropdown">
               <span >Page Size:</span>&nbsp;
                 <select  type="button" name="pageSize" id="page" value="10">
                <option selected="selected" value="10">10</option>
                <option value="20">20</option>
                <option value="50">50</option>
                <option value="100">100&nbsp;</option>
             </select> 
           </div>	
        </div>
        <div class="topmenuleft" >
          <ul>
            <li> Export Options: </li>
            <li> <a href="#" title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li>
            <li><a href="#" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li>
            <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li>
          </ul>
         </div>
     </div>
    </div>
</div>
</div></div>      	<br/><br/>
       	</div>
</div></div>
      
<!-- Center part End -->          

<footer>
	<div class="row">
    <div class="bottomstrip">
                	<div class="container">
                     <div id="powerby"><img src="images/finfra_logo.png" ></div>
                   	 <div class="copyright">©2013 Freedom Wealth Solutions Pvt. Ltd. All Rights Reserved.  | <a href="#"  onClick=>Terms Of Use </a>|  <a href="#">Privacy Policy</a></div>
                </div>
              
   	  </div></div>
		  <!-- END login-form -->
		</div>
</div>
</footer>

</body>
</html>