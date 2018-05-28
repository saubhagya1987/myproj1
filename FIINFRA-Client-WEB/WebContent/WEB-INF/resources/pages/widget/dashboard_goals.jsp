
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/exporting.js"></script>

<script>

    var data = ${graphData};
    
    
</script>

<script type="text/javascript">
 $(document).ready(function(){
		
	 
	 RenderPieChart('container', data, 'Goals');
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
		                      text: 'Goals'
		                  },
		                  tooltip: {
		                  	pointFormat: '{point.y}lac : <b>{point.percentage:.1f}%</b>'
		                  },


		                  plotOptions: {
		                      pie: {
		                          allowPointSelect: true,
		                          cursor: 'pointer',
		                          dataLabels: {
		                              enabled: true,
		                              format: '{point.name}: {point.y} lac',
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
      }</script>

  <div id="contents">
   
        <div id="inner-contents-graph" class="clearfix fl">   	
      <div class="margin-box clearfix fl">       	
       <div id="container" style="min-width: 500px; height: 500px; margin: 0 auto"></div>
                           
                
           </div>     
        </div>
    </div> <!-- end of "contents" id -->

  


