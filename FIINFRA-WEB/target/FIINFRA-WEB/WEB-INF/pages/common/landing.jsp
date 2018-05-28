<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Landing- Home page</title>
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
<!--<script src="<%=request.getContextPath()%>/js/jquery-1.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/js/holder.js"></script>
-->

<!-- -responsive css-->

<!--<link href="<%=request.getContextPath()%>/css/responsive-calendar.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
--><!-- -responsive css-->
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>
--><!--<link href="https://myffreedom.in/FFreedom_Portal/images/favicon.ico" rel="shortcut icon">-->
<script type="text/javascript">
function myFunction()
{
alert("Thank you for writing to us. We will take prompt action on this ticket and revert to you shortly.");
}

</script>

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
<div style="display: none; width:450px; height:380px; top:100px" id="popUpDiv">
  <div class="close" style="margin-right:10px;"><a onClick="popup('popUpDiv')" href="#"><img alt="" src="<%=request.getContextPath()%>/images/btn_close.gif" /></a></div>
  <div id="popupwrapper_contactform">
    <div class="heading_contactform">
      <h3>Log Trouble Ticket</h3>
    </div>
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
      <form>
        <input class="dbtn" value="Send Email"   id="loginButton" type="button">
        <input class="dbtn" value="Cancel" onClick="popup('popUpDiv')"  id="loginButton" type="button">
      </form>
    </div>
  </div>
</div>
<!--css popup window 1 close-->
<div class="row headerstrip">
  <div class="headstrip"></div>
  <div class="container">
    <div class="col-md-6"><span class="logo"><a href="<%=request.getContextPath()%>/landing.htm"><img src="<%=request.getContextPath()%>/images/shubhchintak.png" alt="" ></a></span>
      <div class="logo"></div>
    </div>
    <div class="col-md-6 ">
      <div class="nav-no-collapse header-nav">
        <ul class="nav pull-right" style="margin-top:10px;">
          <li class="dropdown dropdown-box" > <a class="btn dropdown-toggle" href="#" data-toggle="dropdown"> <i class="icon-white"><img src="<%=request.getContextPath()%>/images/user.png"></i><span class="user">Priyanka Test</span> <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li class="dropdown-menu-title"> <span class="user">Account Settings</span></li>
              <li><a href="partner_profile.html" alt="Profile" title="Profile"><i class="halflings-icon "><img src="<%=request.getContextPath()%>/images/user.png"></i> <span class="user">Profile</span></a></li>
              <li><a href="login.html" alt="Logout" title="Logout"><i class="halflings-icon off"> <img src="<%=request.getContextPath()%>/images/logout-menu-button.png"></i><span class="user"  style="margin-left: 10px;">Logout</span></a></li>
            </ul>
          </li>
        </ul>
        <div class="topLink">
          <ul>
            <li class="dropdown"> <a class="dropdown-toggle" href="#" data-toggle="dropdown" alt="Contact" title="Contact"> Contact<span class="caret"></span></a>
              <ul class="dropdown-menu" style="width:180px;">
                <li style="float: left;"><a href="#" alt="Call Us" title="Call Us"><i class="callicon"></i><span class="user">Call Us</span></a><br>
                  <span class="dropdown-menutext">022-4222 4333</span>
                <li class="divider"></li>
                <li ><a href="#" alt="Write to us at" title="Write to us at"><i class="emailicon"></i><span class="user" style>Write to us at</span></a> <br>
                  <span class="dropdown-menutext"><a href="mailto:shubhchintak@fi-i.com">shubhchintak@fi-i.com</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span> </li>
                <li class="divider"></li>
                <li><a href="#" alt="FINFRA" title="FINFRA"><i class="addressicon"></i><span class="user">FINFRA</span></a> <br>
                  <span class="dropdown-menutext">506/507, Morya Landmark II,Near Infinity Mall, Link Road,Andheri (W),<br/>
                  Mumbai 400 053 </span> </li>
                <li class="divider"></li>
                <li style="float: left;"><a href="#" onClick="popup('popUpDiv')" alt="Open a trouble ticket" title="Open a trouble ticket"><i class="ticketicon"></i><span class="user">Log Trouble Ticket</span></a></li>
              </ul>
            </li>
            <li class="dropdown"> <a class="dropdown-toggle" href="#" data-toggle="dropdown" alt="Help" title="Help"> Help <span class="caret"></span></a>
              <ul class="dropdown-menu" >
                <li><a href="<%=request.getContextPath()%>/faqs.htm" alt="FAQ's" title="FAQ's"><i class="faqsicon"></i><span class="user">FAQ's</span></a></li>
                <li><a href="<%=request.getContextPath()%>/knowledge_centre.htm" alt="Knowledge Centre" title="Knowledge Centre"><i class="knowledgeicon"></i><span class="user" style>Knowledge Centre</span></a></li>
                <li><a href="login.html" alt="Demo" title="Demo"><i class="demoicon"></i><span class="user">Demo</span></a></li>
              </ul>
            </li>
            <li><a href="<%=request.getContextPath()%>/downloads.htm" alt="Downloads" title="Downloads ">Downloads </a></li>
            <li><a href="#" alt="Setup" title="Setup">Setup</a></li>
            <li><a href="<%=request.getContextPath()%>/whatsnew.htm"  alt="What's New?" title="What's New?">What's New?</a></li>
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
      <button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <!--<a class="navbar-brand" href="#"> </a>--> 
    </div>
    <div class="collapse navbar-collapse paddingleft">
      <ul class="nav navbar-nav">
        <li class="active"><a href="<%=request.getContextPath()%>/landing.htm" title="Home" onClick="Home">Home</a></li>
        <li ><a href="opportunities.html"  alt="Opportunities" title="Opportunities">Opportunities</a></li>
        <li><a href="client.html"  alt="Clients" title="Clients">Clients</a> </li>
        <li><a href="pings.html"  alt="Pings" title="Pings">Pings</a> </li>
        <li><a href="goals.html"  alt="Goals" title="Goals">Goals </a> </li>
        <li><a href="executiontracker.html"  alt="Execution" title="Execution">Execution </a> </li>
        <li><a href="report.html" alt="Reports" title="Reports">Reports</a></li>
        <li><a href="analytics.html" alt="Analytics" title="Analytics">Analytics</a></li>
        <li><a href="chat.html" alt="Chat" title="Chat">Chat</a></li>
        <li><a href="task.html" alt="Tasks" title="Tasks">Tasks</a></li>
        <li><a href="query.html" alt="Query" title="Query">Query</a></li>
      </ul>
    </div>
  </div>
</div>
</div>
</div>
<div class="container">
  <div class="landingstrip">
    <div class="col-md-6" style="padding:10px 0 0 20px; float:left;">
      <form class="form-search" style="float:left;">
        <div class="input-append">
          <input type="text" class="span2 search-query" value="Sachin" style="padding-top:0px; font-size:11px;">
          <button type="submit" class="btnnew">
          <a href="searchresult.html" style=" color: rgb(51, 51, 51);">Search</a>
          </button>
        </div>
      </form>
    </div>
    <div class="col-md-6" style="margin:10px 0 0 00px; float:right;">
      <div class="dropdown thead" style="float:right;margin-right:20px; padding:5px; width:160px;"> <a class="dropdown-toggle" href="#" data-toggle="dropdown" style="text-decoration:none;">Quick Links <span class="caret" style="float:right;margin-top:4px;"></span></a>
        <ul class="dropdown-menu" style="min-width:110px; padding: 0 20px 0 0; margin-left: -0px">
          <li><a href="#"><i class="emailicon"></i><span class="user">Email</span></a></li>
          <li><a href="#"><i class="websiteicon"></i> </i><span class="user">Website</span></a></li>
          <li><a href="#"><i class="backofficeicon"></i><span class="user">MF BackOffice</span></a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<section> 
  <!--Axis Banner start -->
  <div class="container ">
    <div class="col-md-12" style="margin:20px 0;"><img src="<%=request.getContextPath()%>/images/axisbanner1.jpg" width="1131" height="115" class="img-responsive"> </div>
  </div>
  <!--Axis Banner End --> 
  
  <!--landing banner start -->
  <div class="container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li class="active" data-target="#myCarousel" data-slide-to="0" ></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
        <li data-target="#myCarousel" data-slide-to="5"></li>
        <li data-target="#myCarousel" data-slide-to="6"></li>
        <li data-target="#myCarousel" data-slide-to="7"></li>
        <li data-target="#myCarousel" data-slide-to="8"></li>
        <li data-target="#myCarousel" data-slide-to="9"></li>
      </ol>
      <div class="carousel-inner boxshadow">
        <div class="item active"> <img src="<%=request.getContextPath()%>/images/goals_banner1.jpg" alt="First slide" title="First slide"> </div>
        <div class="item"> <img src="<%=request.getContextPath()%>/images/meter_banner.jpg"  alt="Second slide" title="Second slide" > 
          <!--<div class="container">
           <div class="carousel-caption"><br>
             <div id="g1"></div>
             
            </div></div>--> 
        </div>
        <div class="item"> <img src="<%=request.getContextPath()%>/images/opportunity_banner1.jpg"  alt="Second slide" title="Second slide" > </div>
        <div class="item"> <img src="<%=request.getContextPath()%>/images/opportunity_banner2.jpg"  alt="Third slide" title="Third slide" > </div>
        <div class="item"> <img src="<%=request.getContextPath()%>/images/client_banner1.jpg"  alt="Fourth slide" title="Fourth slide"> </div>
        <div class="item"> <img src="<%=request.getContextPath()%>/images/client_banner2.jpg"  alt="Fifth slide" title="Fifth slide"> </div>
        <div class="item"> <img src="<%=request.getContextPath()%>/images/task_banner1.jpg"  alt="Sixth slide" title="Sixth slide"> </div>
        <div class="item"> <img src="<%=request.getContextPath()%>/images/task_banner2.jpg"  alt="Seventh slide" title="Seventh slide"> </div>
        <div class="item"> <img src="<%=request.getContextPath()%>/images/pings_banner1.jpg"  alt="Eighth slide" title="Eighth slide"> </div>
        <div class="item"> <img src="<%=request.getContextPath()%>/images/pings_banner2.jpg"  alt="Nineth slide" title="Nineth slide"> </div>
      </div>
      <!--  
     <a class="carousel-control left" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="carousel-control right" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
     --> 
    </div>
  </div>
  <!-- /.carousel --> 
  <!--landing banner end --> 
  <!--News start-->
  <div class="container" style="margin-top:20px;">
    <div class="col-md-6">
      <div class="tab_container" style="margin-top:0;padding:0px;">
        <div class="bs-docs-example boxshadownews" style="background-color:#fff;">
          <ul id="myTab" class="nav nav-tabs" style="background-color:#c5c5c5;">
            <li class="active newsheading" style="border-radius:none;"><a href="#news" data-toggle="tab">NEWS</a></li>
            <li class=" newsheading"><a href="#general" data-toggle="tab">GENERAL</a></li>
          </ul>
          <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade active in" id="news">
              <div  class="newstext"> <a href="#"> HDFC launches Two Fixed Maturity Plans under Series 29</a><br>
                Jan 29, 2014 1:47 PM by <a href="#">News Desk </a></div>
              <div class="newstext"> <a href="#"> SBI launches two Debt Funds</a><br>
                Feb 04, 2014 11:00 PM by <a href="#">News Desk </a></div>
              <div class="newstext"> <a href="#"> Sundaram prepones NFO of Sundaram FTP EW</a><br>
                Feb 07, 2014 10:07 AM by <a href="#">News Desk </a></div>
              <div class="newstext"> <a href="#"> Rupee gains for second day amid broad </a><br>
                Feb 09, 2014 1:47 PM by <a href="#">News Desk </a></div>
              <div class="newstext"> <a href="#"> Brent edges above $109 on record China </a><br>
                Feb 10, 2014 4:40 PM by <a href="#">News Desk </a></div>
              <div class="newstext"> <a href="#"> BSE Sensex gains for second day, blue </a><br>
                Feb 11, 2014 1:30 PM by <a href="#">News Desk </a></div>
              <div class="newstext"> <a href="#">Cipla falls after Dec-quarter earnings …</a><br>
                Feb 12, 2014 12:47 PM by <a href="#">News Desk </a><br>
                <br>
                <a href="#">More...</a> <br>
              </div>
            </div>
            <div class="tab-pane fade" id="general">
              <div  class="newstext"> <a href="#"> Choosing Your First Fund</a><br>
                For first time investors, it's important to choose a fund that can provide reasonable returns with moderate risk…... </div>
              <div class="newstext"> <a href="#"> Good news! India's GDP growth is lower</a><br>
                By some twisted logic, news about lower economic growth in recent years is being presented as something positive... </div>
              <div  class="newstext"> <a href="#"> Embraer says Air Costa places firm order</a><br>
                Embraer , the world's largest maker of regional aircraft, said on Thursday India's Air Costa had a placed firm order for 50 jets, in a deal valued at $2.94 billion.</div>
              <div  class="newstext"> <a href="#"> Public sector banks plan preferential allotment of shares to LIC</a><br>
                Indian state-run lenders planning to raise funds via qualified institutional placement mode are now approaching ... </div>
              <div class="newstext"> <a href="#">Facts your insurance advisor may not tell you!</a><br>
                When the insurance advisor approaches to sell a policy or plan, his persuasive tone might drown your doubts that are critical to wise investment... <br>
                <br>
                <br>
                <a href="#">More...</a> <br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="pendingtask newsheading" style="background-color:#c5c5c5; height:43px;">My Pending Task Calendar</div>
      <div class="cal_container boxshadow">
        <div class="responsive-calendar">
          <div class="controls"> <a class="pull-left" data-go="prev">
            <div class="btn btn-primary">Prev</div>
            </a>
            <h4 class="timeInfo"></h4>
            <a class="pull-right" data-go="next">
            <div class="btn btn-primary">Next</div>
            </a> </div>
          <hr/>
          <div class="day-headers">
            <div class="day headernew">Mon</div>
            <div class="day headernew">Tue</div>
            <div class="day headernew">Wed</div>
            <div class="day headernew">Thu</div>
            <div class="day headernew">Fri</div>
            <div class="day headernew">Sat</div>
            <div class="day headernew">Sun</div>
          </div>
          <div class="days" data-group="days"> </div>
        </div>
      </div>
    </div>
  </div>
  <!--News End--> 
  
  <!-- Axis ad start -->
  <div class="container" style="margin-top:15px;">
    <div class="col-md-4" style="padding:0 6px;">
      <div class="adbox1" style="background-color:#fff;">
        <div class="headingad">Give us Feedback </div>
        <p>If you  would like to send us your views, report technical problems or submit questions to our columnists.<br>
          <a href="#" title="Click Here">
          <button type="submit" class="axisbutton" style="float:left;">Go</button>
          </a></p>
      </div>
    </div>
    <div class="col-md-4" style="padding:0 6px;">
      <div class="adbox2"  style="background-color:#fff;">
        <div class="headingad">Want to Refer Someone </div>
        <p>Do a friend a favor ! <br>
          Tell them about Us..<br>
          <br>
          <a href="#" title="Click Here">
          <button type="submit" class="axisbutton" style="float:left;">Click Here</button>
          </a></p>
      </div>
    </div>
    <div class="col-md-4" style="padding:0 6px;">
      <div class="adbox3"  style="background-color:#fff;">
        <p>Build wealth no matter what is happening in the economy.<br>
          <a href="#" title="Click Here">
          <button type="submit" class="axisbutton" style="float:left;">Click Here</button>
          </a> </p>
      </div>
    </div>
  </div>
  
  <!-- Axis ad end --> 
  <!-- Axis Big ad start -->
  <div class="container">
    <div class="col-md-12" style="margin-top:20px;">
      <div class="axisbigadbox"><a href="#"><img src="<%=request.getContextPath()%>/images/bigad.jpg" width="1114" height="112" class="img-responsive" style="margin-top:20px; vertical-align:baseline; text-align:center;"></a></div>
    </div>
  </div>
  <!-- Axis Big ad end --> 
</section>
<jsp:include page="../common/footer.jsp" />
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/responsive-calendar.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap-tab.js"></script>
<script type="text/javascript">
      $(document).ready(function () {
	  	
		$(".responsive-calendar").responsiveCalendar({
          time: '2014-02',
          events: {
            "2014-02-18": {"number": 3, "url": "task.html","dayEvents": [{"name": "Important meeting"}]},
            "2014-02-26": {"number": 1, "url": "task.html","dayEvents": [{"name": "Important meeting"}]}, 
            "2014-02-03":{"number": 1, "url": "task.html","dayEvents": [{"name": "Important meeting"}]}, 
            "2014-03-12": {"number": 1,  "url": "task.html","dayEvents": [{"name": "Important meeting"}]}
			}
		});
		
		});
		
    </script>
</body>
</html>