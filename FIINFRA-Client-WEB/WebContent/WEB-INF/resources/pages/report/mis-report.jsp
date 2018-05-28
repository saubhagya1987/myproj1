<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!--<meta name="viewport" content="width=device-width,initial-scale=1">-->
        <meta name="viewport" content="width=1024">
        <title>MIS Reports</title>

        <script>
$(document).ready(function(){
  $('.wrapper').addClass('mis_reports_wrapper');
});
</script>
        
    </head>

    <body>
        <!-- Wrapper starts-->
        <div class="" id="mis_reports">
            <!-- Main starts-->

            <section class="main">
                <!-- Header Starts-->
                <!-- Header Ends-->

                <!-- Common_content Starts-->
                <section class="content common_content">
      				 <jsp:include page="../layout/submenu_small.jsp"></jsp:include>
                    <!-- Common_in_contnet starts-->
                    <section class="in_content common_in_content clearfix mis_reports_bx_in">
                        <div class="report_one_bx fl">
                          <div class="category" id="hexagon_bg"><a class="hit_area" href="${pageContext.request.contextPath}/report/clientholding"><span>Client Holding Report</span></a></div>
                        </div>

                        
                        <!--Screen Two-->
                        <div class="report_two_bx fl">
                          <div class="category" id="hexagon_bg"><a class="hit_area" href="${pageContext.request.contextPath}/report/clientsipdue"><span>Client SIP Due Report</span></a></div>
                        </div>
                        <!--Screen Two-->
                        
                        <!--Screen Three-->
                        <div class="report_three_bx fl"><div class="title"><div class="grey">MIS</div> <div class="title_color">Reports</div></div>
                          <div class="category" id="hexagon_bg"><a class="hit_area" href="${pageContext.request.contextPath}/report/clientportfoliodetailedstatement"><span>Client Portfolio Report</span></a></div>
                        </div>
						 <!--Screen Three-->
                         
                         
                            <!--Screen Four-->
                        <div class="report_four_bx fl">
                          <div class="category" id="hexagon_bg"><a class="hit_area" href="${pageContext.request.contextPath}/report/clienttransactionhistory"><span> Client Transaction History</span></a></div>
                        </div>
						 <!--Screen Four-->
                         
                            <!--Screen Five-->
                        <div class="report_five_bx fl">
                          <div class="category" id="hexagon_bg"><a class="hit_area" href="${pageContext.request.contextPath}/report/clientmissingnomination"><span>Client Missing Nomination</span></a></div>
                        </div>
						 <!--Screen Five-->
                        

                    </section>
                    <!-- Common_in_contnet ends-->
                    <div class="overlay"></div>
                </section>
                <!-- Common_content Ends-->

            </section>
            <!-- Main ends-->
        </div>
        <!-- Wrapper ends-->
    </body>
</html>
