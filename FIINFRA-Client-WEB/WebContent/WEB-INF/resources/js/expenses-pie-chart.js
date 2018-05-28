// JavaScript Document

/**** Pie Chart Start ***/


$(function () { 
    var data = [
        {label: "Utilities", data:20},
        {label: "Healthcare", data: 20},
        {label: "Leisure", data: 20},
        {label: "Transport", data: 20},
        {label: "Food", data: 20},

    ];
 
    var options = {
            series: {
                pie: {
                    show: true,
                    radius: 1,
                    tilt: 1,
                    label:{                        
                        radius: 3/4,
                        /*formatter: function (label, series) {
                            return '<div style="font-size:15px;text-align:center;padding:5px;color:#000; font-family:allerregular; border-bottom:1px dashed #000;">' + label + '<br/>' +   
                            Math.round(series.percent) + '%</div>';
                        },
                        background: {
                            opacity: 0.5,
                            color: '#000'
                        }*/
                    }
                }
                    },
            legend: {
                show: false
            }
         };
 
    $.plot($("#flotcontainer"), data, options);  
});


/**** Pie Chart End ***/