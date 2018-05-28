// JavaScript Document

/**** Pie Chart Start ***/


$(function () { 
    var data = [
        {label: "My Salary", data:50,},
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
                        formatter: function (label, series) {
                            return '<div style="font-size:10px;text-align:center;padding:0px;color:#000; font-family:allerregular;">' + label ;
                        },
                     /*   background: {
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
 
    $.plot($("#flotcontainer-income-savings"), data, options);  
});


/**** Pie Chart End ***/




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
                        formatter: function (label, series) {
                            return '<div style="font-size:10px;text-align:center;padding:0px;color:#000; font-family:allerregular;">' + label;
                        },
                     /*   background: {
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
 
    $.plot($("#flotcontainer-expenses-savings"), data, options);  
});


/**** Pie Chart End ***/


