
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/exporting.js"></script>

<script>

    var data = ${graphData};
  var loanData=${loanGraph};
    
    
</script>

<script type="text/javascript">
 $(document).ready(function(){
		
	 
	 RenderPieChart('container', data, 'Asset');
	 RenderPieChart('loan-container', loanData, 'Loan');
});
 
 
</script>
<script>
function RenderPieChart(elementId, dataList, title) {
	 
    
	 
	 var chartData=[];	
		
		for(var i=0;i<dataList.length;i++){
			 chartData[i] = [];
			 chartData[i][0] = dataList[i].label;
			 chartData[i][1] = dataList[i].data;
			
			 
		 }
	 	
		try {
			
		  	 new Highcharts.Chart({
		                  chart: {
		                      renderTo: elementId,
		                      plotBackgroundColor: null,
		                      plotBorderWidth: null,
		                      plotShadow: false
		                  }, title: {
		                      text: ''
		                  },
		                  tooltip: {
		                  	pointFormat: '{point.y}k : <b>{point.percentage:.1f}%</b>'
		                  },


		                  plotOptions: {
		                      pie: {
		                          allowPointSelect: true,
		                          cursor: 'pointer',
		                          dataLabels: {
		                              enabled: true,
		                              format: '{point.name}: {point.y} k',
		                              style: {
		                                  color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                              }
		                          }
		                      }
		                  },
		                  series: [{
		                      type: 'pie',
		                      name: 'My Income',
		                      data: chartData
		                  }]
		              });
			}catch(err){
				//alert(err);
			}
      }
      </script>
<div id="wrapper" class="clearfix">
  <div id="contents">
   
          	
            	
       <div id="inner-contents-graph" class="clearfix fl savings-align" style="display: inline;" >
      
       <div id="container"  class="clearfix fl" style="height:300px; width:200px;" > </div>
       
       	<div id="loan-container"  class="clearfix fl" style="height:300px; width:200px; "></div>
          
          </div>  
          
         <div class="net-income clearfix fl" >
                	<span class="txt clearfix fl">My Networth :</span>
                    <span class="txt clearfix fl"></span>
                    <span class="txt clearfix fl">lacs</span>
                </div>
               
        </div>
    </div> 

  


