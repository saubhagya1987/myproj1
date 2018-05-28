<!DOCTYPE html>
<html lang="en"><head>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Transaction History</title>
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
   <!-- <script src="js/jquery-1.js"></script>
    <script src="js/bootstrap.min.js"></script>  
     <script src="js/bootstrap-responsive.js"></script>
      <script src="js/bootstrap-responsive.min.js"></script>
       <script src="js/bootstrap.js"></script>
    <script src="js/holder.js"></script>
    -->

 <!-- -responsive css-->
<!--<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/carousel.css" rel="stylesheet">-->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css" />
<!-- -responsive css-->
<!--<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pop.js"></script>
	<!--<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.core.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.ui.widget.js"></script>-->
    <script src="<%=request.getContextPath()%>/js/csi.min.js" language="JavaScript1.2"></script>
    
    
<script type="text/javascript">
var hidePopupTimeoutId;

$(".choose").live("mouseover", function () {
    clearTimeout( hidePopupTimeoutId );
    $(".tracker").show();
});


$(".choose").live("mouseout", function () {
    hidePopupTimeoutId = setTimeout( function() {
        $(".tracker2").hide();
    },500);
});

$(".tracker").live("mouseenter", function() {
    clearTimeout( hidePopupTimeoutId );
});


$(".tracker").live("mouseleave", function() {
    $(".tracker").hide();
});



</script>
<script type="text/javascript">//<![CDATA[ 
$(window).load(
function(){
;	
(function ($) {
    var scrollbarWidth = 0;

    function getScrollbarWidth() {
        if (scrollbarWidth) return scrollbarWidth;
        var div = $('<div style="width:50px;height:50px;overflow:auto;position:absolute;top:-200px;left:-200px;"><div style="height:100px;"></div></div>');
        $('body').append(div);
        var w1 = $('div', div).innerWidth();
        div.css('overflow-y', 'auto');
        var w2 = $('div', div).innerWidth();
        $(div).remove();
        scrollbarWidth = (w1 - w2);
        return scrollbarWidth;
    }
    $.fn.tableScroll = function (options) {
        if (options == 'undo') {
            var container = $(this).parent().parent();
            container.find('.tablescroll_head thead').prependTo(this);
            container.find('.tablescroll_foot tfoot').appendTo(this);
            container.before(this);
            container.empty();
            return;
        }
        var settings = $.extend({}, $.fn.tableScroll.defaults, options);
		
        settings.scrollbarWidth = getScrollbarWidth();
        this.each(function () {
            var flush = settings.flush;
            var tb = $(this).addClass('tablescroll_body');
            var wrapper = $('<div class="tablescroll_wrapper"></div>').insertBefore(tb).append(tb);
            // check for a predefined container
            if (!wrapper.parent('div').hasClass(settings.containerClass)) {
                $('<div></div>').addClass(settings.containerClass).insertBefore(wrapper).append(wrapper);
            }
            var width = settings.width ? settings.width : tb.outerWidth();
            wrapper.css({
                'width': width + 'px',
                    'height': settings.height + 'px',
                    'overflow': 'auto'
            });
            tb.css('width', width + 'px');
            // with border difference
            var wrapper_width = wrapper.outerWidth();
            var diff = wrapper_width - width;
            // assume table will scroll
            wrapper.css({
                width: ((width - diff) + settings.scrollbarWidth) + 'px'
            });
            tb.css('width', (width - diff) + 'px');
            if (tb.outerHeight() <= settings.height) {
                wrapper.css({
                    height: 'auto',
                    width: (width - diff) + 'px'
                });
                flush = false;
            }
            // using wrap does not put wrapper in the DOM right
            // away making it unavailable for use during runtime
            // tb.wrap(wrapper);
            // possible speed enhancements
            var has_thead = $('thead', tb).length ? true : false;
            var has_tfoot = $('tfoot', tb).length ? true : false;
            var thead_tr_first = $('thead tr:first', tb);
            var tbody_tr_first = $('tbody tr:first', tb);
            var tfoot_tr_first = $('tfoot tr:first', tb);
            // remember width of last cell
            var w = 0;
            $('th, td', thead_tr_first).each(function (i) {
                w = $(this).width();
                $('th:eq(' + i + '), td:eq(' + i + ')', thead_tr_first).css('width', w + 'px');
                $('th:eq(' + i + '), td:eq(' + i + ')', tbody_tr_first).css('width', w + 'px');
                if (has_tfoot) $('th:eq(' + i + '), td:eq(' + i + ')', tfoot_tr_first).css('width', w + 'px');
            });
            if (has_thead) {
                var tbh = $('<table class="tablescroll_head" cellspacing="0"></table>').insertBefore(wrapper).prepend($('thead', tb));
            }
            if (has_tfoot) {
                var tbf = $('<table class="tablescroll_foot" cellspacing="0"></table>').insertAfter(wrapper).prepend($('tfoot', tb));
            }
            if (tbh != undefined) {
                tbh.css('width', width + 'px');
                if (flush) {
                    $('tr:first th:last, tr:first td:last', tbh).css('width', (w + settings.scrollbarWidth) + 'px');
                    tbh.css('width', wrapper.outerWidth() + 'px');
                }
            }
            if (tbf != undefined) {
                tbf.css('width', width + 'px');
                if (flush) {
                    $('tr:first th:last, tr:first td:last', tbf).css('width', (w + settings.scrollbarWidth) + 'px');
                    tbf.css('width', wrapper.outerWidth() + 'px');
                }
            }
        });
        return this;
    };
    // public
    $.fn.tableScroll.defaults = {
        flush: true, // makes the last thead and tbody column flush with the scrollbar
        width: null, // width of the table (head, body and foot), null defaults to the tables natural width
        height: 300, // height of the scrollable area
        containerClass: 'tablescroll' // the plugin wraps the table in a div with this css class
    };
})(jQuery);




jQuery(document).ready(function ($) {
    $('#thetable').tableScroll({
        Height: 150
    });

    $('#theable').tableScroll({
        Height: 150
    });
	 $('#thetable1').tableScroll({
        Height: 150
    });

   
	$('#thetable2').tableScroll({
        Height: 150
    });
	 $('#theable3').tableScroll({
        Height: 150
    });
	$('.tablescroll_head').each(function () {
    $(this).next().slideToggle();
});
$('.tablescroll_wrapper').css('overflow','auto !important');
});



//accordion
$('.tablescroll_head').click(function () {
    $(this).next().slideToggle();
});
});//]]>  

</script>
<link href="https://myffreedom.in/FFreedom_Portalimages/favicon.ico" rel="shortcut icon">



<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->



</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<!--css popup window start 1-->
 <section>
  <div class="container white">
    	<div class="container-head">
    	  <div class="row" style="text-align: right;"><!-- accordion start-->
             
           	  <div class="accordion pull-left " id="accordFundSel"> 
                <div class="accordion-group">   
                  <div class="pull-left fundtool_left_col_head "> <span style="float:left;">Transaction History</span> </div>
                  <input class="btn btn-sm btn-primary"  type="button" value="Back" name="Back" onClick="window.history.back();" style="position: relative;bottom:6.5px;left: 980px" >  
                     
<!--                   <div class="accordion-heading" style="float:right;"> <a class="accordion-toggle " data-toggle="collapse" data-parent="#accordFundSel" href="#collapseFundSel"> <span style=" margin-top:0px;" class="searchicon"  alt="Search" title="Search"></span> </a> </div> -->
                  <div style="height: auto;" id="collapseFundSel" class="accordion-body pull-left serchboxnew collapse">
                    <div class="accordion-inner table-responsive">
                    	<div style="width: 1411px;">
                        
                        <div class="filterbox searchpadding" style="width:200px;"> 
                            <div class="head"> </div>
                           <div class="drop_box_body">
                            <span class="searchtext"> Batch Id </span> 
                            <input name="text" type="text" id="fname" class="form-control" value="" /> 
                            
                             <br>
                         	</div>
                         </div>
                        <!--1 search start -->
                           <div class="filterbox searchpadding">
                            <div class="head"> Asset Class</div>
                           <div class="drop_box_body">
                             <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Equity </li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Debt</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Gold</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Real Estate</li>
                             
                            </ul>
                         	</div>
                         </div>
                         
                         <div class="filterbox searchpadding">
                          <div class="head">Product Category</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" >
                                Mutual Funds </li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                                Stocks</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" >
                                Fixed Deposit</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" checked>
                              Bonds</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox" >
                                Bank Deposit</li>
                             
                            </ul>
                          </div>
                        </div>
                        
                        <div class="filterbox searchpadding">
                          <div class="head">Product Subcategory</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Large Cap</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Mid Cap</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Small Cap</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Liquid</li>
                                
                             <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Income</li>
                                 <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Stock-Nifty</li>
                                 <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Stock-Large Cap</li>
                                  <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Stock-Mid Cap</li>
                             
                             
                            </ul>
                          </div>
                        </div>
                        
                         <div class="filterbox searchpadding">
                          <div class="head">Product name</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Mutual Funds</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Stocks</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Fixed Deposit</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                              Life Insurance</li>
                                <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               General Insurance</li>
                               
                             <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Service</li>
                             
                             
                            </ul>
                          </div>
                        </div>
                        
                         <div class="filterbox searchpadding">
                          <div class="head">Goal Type</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Home</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Car</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Education</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Emergency funding</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Retirement</li>
                             
                            </ul>
                          </div>
                        </div>
                          <div class="filterbox searchpadding">
                          <div class="head">Goal Name</div>
                          <div class="drop_box_body">
                            <ul class="nav  nav-stacked">
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                 Purchase a House</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                               Child Education</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Build long term health corpus</li>
                              <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                Retirement</li>
                                <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                 Emergency Funding</li>
                             
                             <li>
                                <input id="15Large"  value="15Large" type="checkbox">
                                 Buy a House</li>
                             
                             
                             
                            </ul>
                          </div>
                        </div>
                      
                        </div>
                    </div>
                            <div class="col-md-1">
                      <button type="button" id="updatefilterlist" class="btn">Show</button>
                    </div>
                  </div>
          
                    <!-- accordion-inner END -->
                 <!-- accordion-body END -->
                </div>
           	    <!-- accordion-group END -->
              </div>
           	  <!-- accordion  END -->
 			  <!-- accordion End -->
          </div >
    </div>
  	  <div class="container-body">
        <!-- center -->
       
        <div class="topmenu" >
<!-- <a href="#.html"><input data-params="{}" type="button" class="dbtn createNewBtn" value="  Add Transaction" title="Add Transaction" alt="Add Transaction"></a> -->


 </div>
        <div class="table-responsive" id="display_table_lead" style="border:none;">
		  <div id="toreload">
		       
		  <display:table name="transactionHistoryData" uid="objPortalUser" class="table table-hover table-bordered table-striped"
	requestURI="#" sort="list" pagesize="10" id="data">
	
		<display:column  class="" 
			style=""  title="Txn Id" property="transactionId" sortable="true" >
		</display:column> 
		
		<display:column  class="" 
			style=""  title="Txn Date" property="transactionDate" sortable="true" >
		</display:column>
		
		<display:column  class="" 
			style=""  title="Folio No." property="accountNumber" sortable="true" >
		</display:column>
		 <display:column  class=""   
			style=""  title="Client Name" property="batchId" sortable="true" >
		</display:column>
		
		<display:column  class="" 
			style=""  title="Asset Class" property="assetClass" sortable="true" >
		</display:column>
		<display:column  class="" 
			style=""  title="Product Category" property="productCategory" sortable="true" >
		</display:column> 
		<display:column  class="" 
			style=""  title="subCategory" property="subCategory" sortable="true" >
		</display:column>
		   
		<display:column  class="" 
			style=""  title="Product" property="product" sortable="true" >
		</display:column>
		<display:column  class="" 
			style=""  title="Txn Type" property="transactionType" sortable="true" >
		</display:column>
		<display:column  class="" 
			style=""  title="Txn Amount(Rs)" property="transactionAmount" sortable="true" >
		</display:column>
		<display:column  class="" 
			style=""  title="Units/Qty" property="unitsOrQuantity" sortable="true" >
		</display:column>  
		<display:column  class="" 
			style=""  title="Price" property="price" sortable="true" >
		</display:column> 
		  
		</display:table>
			                        
	<!-- Center-->    
     </div> 
     </div>
     
      <div class="col-sm-7" >

       


<!-- <div class="topmenuleft" > -->
<!--  <div  class="customDropdown"> -->
<!--        <span >Page Size:</span>&nbsp; -->
<!--      <select  type="button" name="pageSize" id="page" value="10"> -->
<!--      	<option selected="selected" value="10">10</option> -->
<!--      	<option value="20">20</option> -->
<!--      	<option value="50">50</option> -->
<!--      	<option value="100">100&nbsp;</option> -->
<!--      </select>  -->
<!--      </div>	 -->
<!-- </div> -->
<!-- <div class="topmenuleft" > -->
 
<!--   <ul> -->
<!--   	<li> Export options: </li> -->
<!--     <li> <a href="#" title="Export in CSV" alt="Export in CSV"><i class="cvsicon"></i></a></li> -->
<!--     <li><a href="#" title="Export in Excel" alt="Export in Excel"> <i class="excelicon"></i></a></li> -->
<!--     <li> <a href="#"  title="Export in XML" alt="Export in XML"><i class="xmlcon"></i></a></li> -->
<!--   </ul> -->
 
  
 
<!--  </div> -->
 
</div>	
       <div class="topmenu" >
<!-- <a href="#"><input data-params="{}" type="button" class="dbtn createNewBtn" value="  Add Transaction" title="Add Transaction" alt="Add Transaction"></a> -->


 </div>

        <!-- 4-->
    </div>
</div>
<!-- Center-->  


	      
  


 </section>           	
<!-- Center part End -->          

<jsp:include page="../common/footer.jsp" />

</body>
</html>