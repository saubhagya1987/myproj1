<!DOCTYPE html>
<html lang="en"><head>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content=""> 
<title>Import Notification Template</title> 
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
    <script src="js/holder.js"></script>-->
    

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
                  <div class="pull-left fundtool_left_col_head "> <span style="float:left;">Import Notification Template</span> </div>
                  <input class="btn dbtn" type="button" value="Back" name="Back" onClick="window.history.back();" style="position: relative;bottom:6.5px;"> 
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
		       
	
	<form id="addForm" method="post" action="<%=request.getContextPath()%>/notifytemplate/importTemplateToDB.htm" enctype="multipart/form-data">  
  		     
  	             
   <div class="list-group-item">           
    <div class="row">      
    	
  	  
      
       <!-- ---------------upload file start------------------- --> 
				
				<div class="col-md-4 searchpadding padding_top">Attachment(s) </div>
				
				<span class="searchpadding padding_top" style="float: left; width: 300px;">
				 	<input type="file" id="fileid" name="file" style="height: 0px; width: 0px; overflow: hidden;" /> 
				 	<input type="text" id="ftxtid" name="ftxtid" class="form-control"> <span class="user" id="ftype"></span>
				 </span>
				 <span style="float: left; margin-top: 7px; width: 100px;">
					<input class="dbtn" value="Browse" id="fbtnid" type="button" onclick="getFile();"> 
				</span>    
				<!-- ---------------upload file end------------------- --> 
               
             
             <div class="col-md-4 searchpadding padding_top"  ><br/><br/>	 </div>
             <!--<div class="topbuttonholder">-->
            <div class="col-md-8 searchpadding padding_top">     
       <input class="btn dbtn" type="button" value="Upload" name="Upload" data-toggle="tooltip" onclick="submitAdd(0);" data-placement="left"> 
 	 	
     	<input class="btn dbtn" type="button" value="Cancel" name="Cancel" onClick="window.history.back();"> </div>
   </div>
</div>   
</form>
		
	
			                        
	<!-- Center-->    
     </div> 
     </div>
     
      <div class="col-sm-7" >

       



 
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
<script type="text/javascript">
function getFile(){
	document.getElementById("fileid").click();
	
	} 
	

/* For file Type & size */
var fSize;
$(document).ready(function(){
    $('#fbtnid').mouseleave(function(){
    	var filename = $('#fileid').val().replace(/.*(\/|\\)/, '');
    	var fType= filename.split(".");
    	//alert("fType:"+fType[1]);
    	fSize = document.getElementById('fileid').files[0].size/1024; //size in kb
    	document.getElementById("ftype").innerHTML = "Type: "+fType[1]+", "+"Size: "+Math.floor(fSize)+"kb";
    	
    	var url = document.getElementById("fileid").value;
         var filename = url.replace(/^.*\\/, "");
         document.getElementById("ftxtid").value= filename;
         if(fSize>9765){
        	 showAlertMessage("Message", "<br/>file size should not be greater than 9765 kb", "information");
        	 $('#fileid').val('');
        	 $('#ftxtid').val(''); 
         } 
    	/* var fv = document.getElementById("fileid").value;
    	document.getElementById("ftxtid").value= fv; */
    	//alert("fv:"+fv);
    });
}); 

/* For file Type & size */

var fl = document.getElementById('fileid');

fl.onchange = function(e){ 
    var ext = this.value.match(/\.(.+)$/)[1];
    switch(ext)
    {
         
        case 'xls':
        case 'xlsx':  
        case 'ods':
            //alert('allowed');
            break;
        default:  
            alert('File type not allowed !');
            this.value=''; 
    } 
};


function submitAdd(isToClose){
	  var form = document.getElementById('addForm');  
		form.submit(1);  
		
		alert("Record Added Successfully !"); 			 
		 
	}  
  
 


</script>
<jsp:include page="../common/footer.jsp" />

</body>
</html>