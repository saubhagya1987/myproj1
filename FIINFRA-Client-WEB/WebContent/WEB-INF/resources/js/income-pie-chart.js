// JavaScript Document

/**** Pie Chart Start ***/


$(function () { 
    var data = [
        {label: "My Salary", data:50},
        {label: "Wife Salary", data: 30},
        {label: "Consulting", data: 11},
        {label: "House Rent", data: 9},

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