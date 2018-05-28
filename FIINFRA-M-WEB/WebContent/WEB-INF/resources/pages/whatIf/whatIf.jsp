<!DOCTYPE html>
<%@page import="in.fiinfra.partner.controller.PartnerProfileController"%>
<%@page import="in.fiinfra.common.diy.models.UserSession"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<% 
 UserSession user = (UserSession) request.getSession().getAttribute("userSession");
 String theme = PartnerProfileController.getThemePath(user);
 if(PartnerProfileController.getThemePath(user)==null)
 {
	 theme="theme_red/theme_red";
 }
%>


<html>
    <head>
    <!-- Start Google Analytics -->
	<script>
		 (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		 (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		 m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		 })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		 ga('create', 'UA-48212643-3', 'auto');
		 ga('send', 'pageview');
		
	</script>
	<!-- End Google Analytics -->
    
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
        <title>What If</title>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/perfect-scrollbar.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
        
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-1.11.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-ui.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/perfect-scrollbar.js"></script>

        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/plugin/jqplot/jquery.jqplot.min.css" />
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jqplot/jquery.jqplot.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jqplot/plugins/jqplot.mobile.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jqplot/plugins/jqplot.barRenderer.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jqplot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jqplot/plugins/jqplot.pointLabels.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jqplot/plugins/jqplot.canvasTextRenderer.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jqplot/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jqplot/plugins/jqplot.highlighter.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jqplot/plugins/jqplot.cursor.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jqplot/plugins/jqplot.dragable.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jqplot/plugins/jqplot.dateAxisRenderer.min.js"></script>

        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/plugin/SmoothDivScroll/css/smoothDivScroll.css" />
        <script src="${pageContext.request.contextPath}/resources/js/plugin/SmoothDivScroll/js/jquery.kinetic.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/SmoothDivScroll/js/jquery.mousewheel.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/SmoothDivScroll/js/jquery.smoothDivScrollcustom.js"></script>

        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.ui.touch-punch.js"></script>

        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-simulate-ext/libs/jquery.simulate.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-simulate-ext/src/jquery.simulate.ext.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery-simulate-ext/src/jquery.simulate.drag-n-drop.js"></script>
        
        <script src="${pageContext.request.contextPath}/resources/js/plugin/jquery.form.js"></script>
        
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css" />
        <script src="${pageContext.request.contextPath}/resources/js/common_modal.js"></script>
         <%if(theme != null){ %>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme/<%=theme %>" />
		<%} %>
                

        <!--[if lt IE 9]>
        <script src="${pageContext.request.contextPath}/resources/js/html5shiv.js"></script>
        <![endif]-->

        <script type="text/javascript">
            var plot1;
            var autoDragGoalFlag = false;
            var inflationRate = ${inflationRate}; 
            var actualGoalValues = [];
            var firstTime = "yes";
           
            //var s1 = [3.55, 12, -14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86];
            // Ticks should match up one for each y value (category) in the series.
            var ticks = [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042, 2043, 2044, 2045, 2046, 2047, 2048, 2049, 2050];

            //var s1 = [3.55, 12, -14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86];
            var gbArrData = [];
            /*var gbArrDataDB = [
                {"goalid": 1, "goaltype": 35001, "goalsubtype": 21, "goalyear": 2022, "goalvalue": 43},
                {"goalid": null, "goaltype": 35001, "goalsubtype": 24, "goalyear": 2033, "goalvalue": 20}
            ];*/
            //var gbArrDataDB = [{"gridpos": {"x": 311.5, "y": 172}, "goalid": "1", "goalsubtype": "24", "goalyear": "2021", "goalvalue": "9"}];
            
            var gbArrDataDB = [{"goalid": null,"goaltype": 99001,"goalsubtype":99,"goalyear":${retirementYear},"goalvalue":${retirementAmountNeeded},"goaltitle":"Retirement Goal"}];
            <c:set var="cntr" value="1"></c:set>
            <core:forEach items="${whatIfOutPutDataList}" varStatus="counter" var="whatIfOutPutData">
            	//alert('${cntr}')
	            //var n = ${whatIfOutPutData.goalYear} - ${startYear}; 
	            //var ir = 1 + ${inflationRate};
	            //var pv = ${whatIfOutPutData.goalAmount};
	            actualGoalValues['clonediv${cntr}'] = ${whatIfOutPutData.goalAmount};
	            <c:set var="cntr" value="${cntr+1}"></c:set>
	            //var fv = pv*Math.pow(ir,n);
	            var data= {"goalid":${whatIfOutPutData.goalId},"goaltype":${whatIfOutPutData.goalTypeId},"goaltitle":"${whatIfOutPutData.goalName}","goalsubtype":${whatIfOutPutData.goalSubType},"goalyear":${whatIfOutPutData.goalYear},"goalvalue":${whatIfOutPutData.goalAmount}};
	            gbArrDataDB.push(data);
            </core:forEach>
            
            
            $.each(gbArrDataDB, function(k, v) {
                gbArrDataDB[k] = $.extend(gbArrDataDB[k], {'clonediv': "clonediv" + (k+1)});
            });
            var ymin = 0;
            var ymax = 10;

            function getAmtArr(goals) {
                ymin = 0;
                ymax = 10;
                var lumpsum = ${toatalInitialAsset}; 
                var lumpsumperc = ${lumpsumPerc}; // current
                
                var ongoing = ${toatalMonthlyInvestment}; //per month
                var ongoingperc = ${ongoingPerc}; // 0.08; //per month
                
                var startyear = ${startYear};
                
                //var endyear = 2050;
                
                var retAmtAvailable = ${retirementAmountAvailable}; // retirementAmountAvailable
                var retirementperc =  ${retirementPerc} ;  // retirementInterest
                
                ticks = [];
                var i = 0;
                while(i <= ${lifeExpectancy}) {
                    ticks.push(startyear + i);
                    i++;
                }
                
                $('#initial_asset .value').html(lumpsum);
                $('#monthly_saving .value').html(ongoing);
                
                var amtArr = [];
                amtArr[startyear - 1] = lumpsum;
        
                var ts1 = [];
                var retirementamtremaining = 0;
                $.each(ticks, function(k1, year) {
                    var amount = amtArr[year - 1];
                    
                    // Calcuation for Initial Asset value
                    //var calc_c = year - (k1 == 0 ? year : parseInt(ticks[k1 - 1]));
                    var calc_c = parseInt(ticks[k1]) - startyear;
                    var calc_d = lumpsumperc;
                    var calc_e = calc_d + 1;
                    //var calc_f = Math.pow(calc_e, calc_c);
                    var calc_f = Math.pow(calc_e, 1);
                    if(amount > 0) {
                        amount = calc_f * amount;
                    }
                    if(retirementamtremaining > 0) {
                        retirementamtremaining += (retirementamtremaining * retirementperc);
                    }
                    
                    // Calcuation for Fixed monthly installment value
                    //var calc2_c = (calc_c + 1) * 12;
                    if(ongoing > 0) {
	                    var calc2_c = 12;
	                    var calc2_d = parseFloat(ongoingperc / 12);
	                    var calc2_e = calc2_d + 1;
	                    var calc2_f = Math.pow(calc2_e, calc2_c);
	                    var calc2_g = parseFloat(calc2_f - 1);
	                    var calc2_h = parseFloat(calc2_g / calc2_d);
	                    var calc2_i = parseFloat(calc2_h * ongoing);
	
	                    amount += calc2_i;
                    }
                    var retirementamtremaining2 = 0;

                    $.each(goals, function(k2, goal) {
                    	
                    	var pv = goal['goalvalue'];
                    	var n =  goal['goalyear'] - ${startYear};
                        var ir = 1 + ${inflationRate};
                        var fv = pv*Math.pow(ir,n);
                        
                        var goalAmt = parseInt(fv);
                        if (goal['goalyear'] == year) {
                            goalAmt = goalAmt * 100000;
                            if(goal['goaltype'] == 99001) { // Retirement goal
                            	goalAmt = ${retirementFV}; // for retirement FV new added
                            	goalAmt = goalAmt*100000; // for retirement FV new added
                                ongoing = ongoing / 5;
                                if(retAmtAvailable > goalAmt) {
                                    retirementamtremaining2 = retAmtAvailable - goalAmt;
                                    amount += goalAmt;
                                } else {
                                    amount += retAmtAvailable;
                                }
                            }
                            amount -= goalAmt;
                        }
                    });
                    
                    amtArr[year] = amount;
                    amount = (parseInt(amount) + retirementamtremaining2 + retirementamtremaining) / 100000;
                    ts1.push(amount);
                    retirementamtremaining = (retirementamtremaining2 > 0 ? retirementamtremaining2 : retirementamtremaining);
                    
                    if(amount >= ymax) {
                        ymax = amount;
                        ymax = Math.round((ymax + 5)/ 10.0) * 10.0;
                    }
                    if(amount <= ymin) {
                        ymin = amount;
                        ymin = Math.round((ymin - 5)/ 10.0) * 10.0;
                    }
                    //ymin = (-1) * ymax;
                    //ymin = (ymin < 0 ? ((-1) * ymax) : 0);
                });
                $.each(goals, function(k2, goal) {
                    if(goal['goaltype'] != 99001) { // Not a Retirement goal
                    	
                    	var pv = goal['goalvalue'];
                    	var n =  goal['goalyear'] - ${startYear};
                        var ir = 1 + ${inflationRate};
                        var fv = pv*Math.pow(ir,n);
                    	
                        var goalAmt = parseInt(fv);
                        
                        if(goalAmt >= ymax) {
                            ymax = goalAmt;
                            ymax = Math.round((ymax + 10)/ 10.0) * 10.0;
                        }
                        if(goalAmt < ymin) {
                            ymin = goalAmt;
                            ymin = Math.round((ymin - 10)/ 10.0) * 10.0;
                        }
                        //ymin = (-1) * ymax;
                    }
                });
                if (ymax > 1000) {ymax=500;}
                //ymin = (-1) * ymax;
                ymin = (ymin < 0 ? ((-1) * ymax) : 0);
                return ts1;
            }//end of function getAmtArr

            //var s1 = getAmtArr(gbArrDataDB);
            //var st = '';$.each(s1, function(k, v) {st += "\n" + k + " => " + v;});alert(st);
            (function($) {
                /**
                 *  Namespace: the namespace the plugin is located under
                 *  pluginName: the name of the plugin
                 */
                var extensionMethods = {
                    getEventPosition: function(ev) {
                        var plot = ev.data.plot;
                        var go = plot.eventCanvas._elem.offset();
                        var gridPos = {x: ev.pageX - go.left, y: ev.pageY - go.top};
                        var dataPos = {xaxis: null, yaxis: null, x2axis: null, y2axis: null, y3axis: null, y4axis: null, y5axis: null, y6axis: null, y7axis: null, y8axis: null, y9axis: null, yMidAxis: null};
                        var an = ['xaxis', 'yaxis', 'x2axis', 'y2axis', 'y3axis', 'y4axis', 'y5axis', 'y6axis', 'y7axis', 'y8axis', 'y9axis', 'yMidAxis'];
                        var ax = plot.axes;
                        var n, axis;
                        for (n = 11; n > 0; n--) {
                            axis = an[n - 1];
                            if (ax[axis].show) {
                                dataPos[axis] = ax[axis].series_p2u(gridPos[axis.charAt(0)]);
                            }
                        }

                        return {offsets: go, gridPos: gridPos, dataPos: dataPos};
                    },
                    /*
                     * retrieve the id of the element
                     * this is some context within the existing plugin
                     */
                    getTooltipDataPosition: function(ev, plot, itmid) {
                    	//alert(itmid)
                        var c = plot.plugins.cursor;
                        var s = '';
                        var addbr = false;

                        ev.data = {'plot': plot};
                        var positions = $.jqplot.Cursor.prototype.getEventPosition(ev);

                        var gridpos = positions.gridPos;
                        var datapos = positions.dataPos;

                        var g;
                        for (var i = 0; i < c.tooltipAxisGroups.length; i++) {
                            g = c.tooltipAxisGroups[i];
                            if (addbr) {
                                s += '<br />';
                            }
                            if (c.useAxesFormatters) {
                                for (var j = 0; j < g.length; j++) {
                                    if (j) {
                                        s += ', ';
                                    }
                                    var af = plot.axes[g[j]]._ticks[0].formatter;
                                    var afstr = plot.axes[g[j]]._ticks[0].formatString;
                                    s += af(afstr, datapos[g[j]]);
                                }
                            } else {
                                s += $.jqplot.sprintf(c.tooltipFormatString, datapos[g[0]], datapos[g[1]]);
                            }
                            addbr = true;
                        }

                        $('#' + itmid).children('.jqplot-goal-tooltip').remove();
                        var elem = document.createElement('div');
                        var pts = s.split(',');
                        var acualGoalValue = actualGoalValues[itmid];
                        var pv=0.0; 
                        if(firstTime == "no")
                        {
                          pv = parseFloat(pts[1]).toFixed(1);
                        }
                        else if(firstTime == "yes"){
                          pv = parseFloat(acualGoalValue).toFixed(1);
                          if(isNaN(pv))
                          {
                        	  pv = parseFloat(pts[1]).toFixed(1);
                          }
                        }
                       
                        var n =  pts[0] - ${startYear};
                        var ir = 1 + ${inflationRate};
                        
                        var fv = pv*Math.pow(ir,n);
                        
                        if($('#' + itmid).hasClass('dragged99')) {
                        	pv = ${retirementAmountNeeded};
                        	fv = ${retirementFV};
                        }
                        
                        $(elem).addClass('jqplot-goal-tooltip').html('<strong class="rs_symbol">FV </strong><span class="axv-amt">' + parseFloat(fv).toFixed(1) + '</span><br/><strong class="rs_symbol">PV </strong><span class="axv-amt">'+  parseFloat(pv).toFixed(1) +'</span><br/><strong>Year </strong><span class="axv-year">' + pts[0]) + '</span>';

                        if (gridpos.y < 42) {
                            $(elem).css({'top': '50px'});
                        }
                        if (gridpos.x < 120) {
                            $(elem).css({'left': '60px'});
                        }
                        $('#' + itmid).append(elem);

                        $('.jqplot-goal-canvas-' + itmid).remove();
                        $.jqplot.Cursor.prototype.drawLine(gridpos.x, gridpos.y, {}, plot, itmid);

                        var itmNumber = $('#' + itmid).attr('class').match(/dragged(\d+)/)[1];
                        var arrdata = {};
                        //arrdata.gridpos = gridpos;
                        //arrdata.itmid = itmid;
                        //arrdata.datapos = {'xaxis': datapos.xaxis, 'yaxis': datapos.yaxis};

                        arrdata.clonediv = itmid;//.replace('clonediv', '');
                        if ($('#' + itmid).attr('class').search(/goalid(\d+)/) !== -1) {
                            arrdata.goalid = $('#' + itmid).attr('class').match(/goalid(\d+)/)[1];
                        }
                        
                        arrdata.goaltype = $('#dragitem'+itmNumber).parent('.wrap-dragitem').attr('id').match(/dragparent(\d+)/)[1];
                        arrdata.goalsubtype = itmNumber;
                        pointvalues = s.split(',');
                        arrdata.goalyear = $.trim(pointvalues[0]);
                        arrdata.goalvalue = $.trim(pointvalues[1]);
                        var arrkfound = false;
                        
                        $.each(gbArrData, function(k, v) {
                            if(v.clonediv == itmid && v.goaltype == 99001 && gbArrDataDB[k]) { // Retirement goal
                                if(ymax < gbArrDataDB[k].goalvalue) {
                                    gbArrData[k] = gbArrDataDB[k];
                                    $('#' + gbArrDataDB[k].clonediv).addClass('retireexceed');
                                    //$('#' + gbArrDataDB[k].clonediv).find('.axv-amt').html(gbArrDataDB[k].goalvalue);
                                    
                                } else {
                                    gbArrData[k] = arrdata;
                                }
                                arrkfound = true;
                            } else if (v.clonediv == itmid && v.goaltype != 99001) {
                                gbArrData[k] = arrdata;
                                arrkfound = true;
                            }
                        });
                        
                        if (!arrkfound) {
                            gbArrData.push(arrdata);
                        }

                        $('#datapos').html(JSON.stringify(gbArrData));

                        return s;
                    },
                    drawLine: function(bx, by, opts, plot, itmid) {
                        var canvas = new $.jqplot.GenericCanvas();
                        plot.eventCanvas._elem.before(canvas.createElement(plot._gridPadding, 'jqplot-goal-canvas-' + itmid, plot._plotDimensions, plot));
                        canvas.setContext();
                        var ctx = canvas._ctx;
                        ctx.save();
                        opts = opts || {lineCap: 'square', strokeStyle: 'blue', lineWidth: 3};
                        if (opts.lineWidth == null || opts.lineWidth != 0) {
                            $.extend(true, ctx, opts);
                            var lncolor = '#726F6F';// $.jqplot.Cursor.prototype.getRandomColor();

                            /*if (typeof ctx.setLineDash !== 'undefined') {
                             ctx.setLineDash([3, 4]);
                             }
                             ctx.strokeStyle = lncolor;// '#75BE00';
                             ctx.lineWidth = 1;
                             ctx.beginPath();
                             ctx.moveTo(0, (by + 0.5));
                             ctx.lineTo(bx, (by + 0.5));
                             ctx.closePath();
                             ctx.stroke();
                             ctx.restore();*/

                            if (typeof ctx.setLineDash !== 'undefined') {
                                ctx.setLineDash([3, 4]);
                            }
                            ctx.strokeStyle = lncolor;
                            ctx.lineWidth = 1;
                            ctx.beginPath();
                            ctx.moveTo((bx + 0.5), by);
                            ctx.lineTo((bx + 0.5), by + bx);
                            ctx.closePath();
                            ctx.stroke();
                            ctx.restore();
                        }
                    },
                    getRandomColor: function() {
                        var letters = '0123456789ABCDEF'.split('');
                        var color = '#';
                        for (var i = 0; i < 6; i++) {
                            color += letters[Math.floor(Math.random() * 16)];
                        }
                        return color;
                    }
                };

                $.extend(true, $.jqplot.Cursor.prototype, extensionMethods);
            })(jQuery);


            function renderGraph(cdata) {
                //var ticks = [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029, 2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2039, 2040, 2041, 2042, 2043, 2044, 2045, 2046, 2047, 2048, 2049, 2050];
                //$('#chart1').empty()
                if (plot1) {
                    plot1.destroy();
                    $('#chart1').empty();
                }

                plot1 = $.jqplot('chart1', [cdata], {
                    //stackSeries: true,
                    captureRightClick: true,
                    // Turns on animatino for all series in this plot.
                    animate: true,
                    // Will animate plot on calls to plot1.replot({resetAxes:true})
                    //animateReplot: true,
                    series: [
                        {label: 'Available Funds'},
                        {label: 'Goal Expected'},
                        {label: 'Assigned'}
                    ],
                    seriesColors: ['#A6A6A6'],
                    seriesDefaults: {
                        renderer: $.jqplot.BarRenderer,
                        shadow: false,
                        //lineWidth: 5,
                        rendererOptions: {
                            fillToZero: true,
                            barPadding: 0,
                            barMargin: 2,
                            barDirection: 'vertical',
                            barWidth: 12,
                            varyBarColor: false,
                            highlightMouseOver: true,
                            highlightMouseDown: false,
                            highlightColor: null,
                            barImageSrc: '${pageContext.request.contextPath}/resources/css/theme/<%=theme.substring(0,theme.indexOf("/")) %>/images/bar-chartbarbg.png'
                        },
                        pointLabels: {show: true, location: 's', ypadding: 3, formatString: '%.1f'}
                    },
                    axesDefaults: {
                        labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
                        labelOptions: {
                            fontFamily: '"allerregular", Georgia, Serif',
                            fontSize: '12pt',
                            fontWeight: 'bold'
                        }
                    },
                    legend: {
                        show: true,
                        placement: 'insideGrid',
                        location: 'nw'
                    },
                    axes: {
                        xaxis: {
                            label: 'Years(Goals Duration)',
                            ticks: ticks,
                            renderer: $.jqplot.CategoryAxisRenderer,
                            //tickRenderer: $.jqplot.CanvasAxisTickRenderer,
                            formatString: '%d',
                            tickOptions: {
                                formatter: $.jqplot.DateTickFormatter
                            }
                        },
                        yaxis: {
                            label: 'Amt Rs.(in lacs)',
                            pad: 0.05,
                            min: ymin,
                            max: ymax,
                            tickOptions: { 
                                formatString: '%.1f'
                            }
                        }
                    },
                    cursor: {
                        show: false,
                        followMouse: false,
                        useAxesFormatters: true,
                        showTooltipUnitPosition: true,
                        tickOptions: {
                            formatter: $.jqplot.DateTickFormatter
                        }
                    },
                    highlighter: {
                        show: true,
                        tooltipAxes: 'both',
                        yvalues: 1
                    },
                    grid: {
                        drawGridLines: true,
                        borderWidth: 0,
                        shadow: false
                    }
                });
                $(document).ready(function() {
                	
                	//alert(gbArrData.length)
                    //var st='';$.each(gbArrDataDB, function(k,v){st+="\n"+k+" => "+v;});alert(st);
                    $('.dragitem.dropped').remove();
                    counter = 0;//alert(gbArrDataDB.length)
                    $.each(gbArrDataDB, function(k, nv) {
                        //var st='';$.each(nv, function(k,v){st+="\n"+k+" => "+v;});alert(st);
                        autoDragGoal(nv);
                    });
                    
                    var buttons = $( "#errorDialog" ).dialog( "option", "buttons" );
                	// setter
                	$("#errorDialog").dialog("option", "buttons", [{
                	   text: "Ok",
                	   click: function () {
                		   $(this).dialog('close');
                	   }
                	}]);
                	$(document).on("dialogopen", "#errorDialog", function(event, ui) {
                		setTimeout("$('#errorDialog').dialog('close')",2500);
                	});
                    
                    
                    if ( document.readyState === "complete" ) {
                    	firstTime = "no";
                    }

                });

                return plot1;
            }

            function findCenter2(elem) {
                var offset, $elem = $(elem);
                offset = $elem.offset();
                return {
                    x: offset.left + $elem.outerWidth() / 2,
                    y: offset.top + $elem.outerHeight() / 2
                };
            }

            function autoDragGoal(nv) {
                autoDragGoalFlag = true;
                var $dropTarget = $('.jqplot-event-canvas');
                //var dropOffset = $dropTarget.offset();
                //var nx = findCenter2($dropTarget);

                //Calculate pixels per point
                var adxaxis = plot1.axes['xaxis'];
                var pxl = 0;
                var pxlAvg = 40;
                for (var i = 1; i < adxaxis._ticks.length; i++) {
                    var px1 = adxaxis._ticks[i - 2];
                    if (px1 !== undefined) {
                        var px2 = adxaxis._ticks[i];
                        if (nv.goalyear >= parseInt(px1.label) && nv.goalyear < parseInt(px2.label)) {
                            var p1pos = px1.getPosition();
                            var p2pos = px2.getPosition();
                            pxl = (p2pos.left - p1pos.left) / (parseInt(px2.label) - parseInt(px1.label));
                            pxlAvg = pxl + 16;
                            pxl = p2pos.left - (pxl * (nv.goalyear - parseInt(px1.label)));
                            break;
                        }
                    }
                }
                pxl = (pxlAvg - (pxl - (plot1.axes['xaxis']._plotWidth / 2))) * (-1);

                var adyaxis = plot1.axes['yaxis'];
                var pxt = 0;
                var pxtAvg = 30;
                nv.goalvalue = (nv.goalvalue <= 0 ? 0 : nv.goalvalue);
                
                for (var i = 1; i < adyaxis._ticks.length; i++) {
                    var px1 = adyaxis._ticks[i - 1];
                    var px2 = adyaxis._ticks[i];

                    if (nv.goalvalue >= px1.value && nv.goalvalue < px2.value) {
                        var p1pos = px1.getPosition();
                        var p2pos = px2.getPosition();
                        
                        pxt = ((p1pos.top - p2pos.top) / (px2.value - px1.value)).toFixed(3);
                        pxtAvg = pxt - 4;
                        pxt = (p1pos.top - (pxt * (nv.goalvalue - px1.value + 1)));
                        break;
                    }
                }
                pxt += (pxtAvg - ($('.jqplot-series-canvas').height() / 2));
                
                $('#dragitem' + nv.goalsubtype).simulate("drag-n-drop", {
                    dropTarget: $dropTarget,
                    dx: 0,
                    dy: 0,
                    callback: function() {
                        var $dropped = $('.dragitem.dropped').eq(0);
                        $dropped.addClass('goalid'+nv.goalid).simulate("drag", {
                            dx: pxl, //x - nx.x + dropOffset.left - 3.5,
                            dy: pxt //y - nx.y + dropOffset.top
                        }).simulate("drop");
                        autoDragGoalFlag = false;
                        
                        if(nv.goalid > 0) {
                            $dropped.addClass('saved').attr('title', nv.goaltitle).prepend('<span class="icn saved"></span>');
                        }
                        
                        //$('.dragitem.dropped').not('.dragged99').on('dblclick', function(ev) {
                       $('.dragitem.dropped').on('dblclick', function(ev) {
                        	ev.stopImmediatePropagation();
                            var goalSubTypeId = $(this).attr('class').match(/dragged(\d+)/)[1];
                            if (goalSubTypeId !== -1) {
                                //var goalId = $(this).attr('id').match(/clonediv(\d+)/)[1];
                                var goalAmount = $(this).find('.axv-amt').html();
                                var goalYear = $(this).find('.axv-year').html();
                                var goalType = $('#dragitem'+goalSubTypeId).parent('.wrap-dragitem').attr('id').match(/dragparent(\d+)/)[1];

                                $('#whatIfFrm input#goalSubTypeId').val(goalSubTypeId);
                                $('#whatIfFrm input#goalId').val(nv.goalid);
                                $('#whatIfFrm input#goalAmount').val(goalAmount);
                                $('#whatIfFrm input#goalYear').val(goalYear);

                                //alert(gbArrDataDB);
                                //return;
                                //localStorage.setItem('gbArrDataDB');
                                
                                $("#whatIfFrm").attr("action", "${pageContext.request.contextPath}/whatIf/processGraph/"+goalType+"/"+${partyId});
                                $("#whatIfFrm").submit();
                            }
                        });
                        
                        $('.dragitem.dropped').not('.dragged99').addSwipeEvents().bind('doubletap', function(evt, touch) {
                           	$(this).trigger('dblclick');
                        });
                        $('.dragitem').on('mouseover', function(){
                        	//$('.jqplot-goal-tooltip').css({'z-index': 1, 'opacity': .8});
                        	//$(this).find('.jqplot-goal-tooltip').css({'z-index': 999, 'opacity': 1});
                        	$('.dragitem').css({'z-index': 1, 'opacity': .8});
                        	$(this).css({'z-index': 999, 'opacity': 1});
                        });
                    }
                });
            }

            $(document).ready(function() {
                $.jqplot.DateTickFormatter = function(format, value) {
                    return ticks[Math.round(value) - 1];
                };

                $.jqplot.config.enablePlugins = true;

                //gbArrData = gbArrDataDB;
                plot1 = renderGraph(getAmtArr(gbArrDataDB));

                counter = 0;
                $(".dragitem").draggable({
                    helper: 'clone',
                    cursorAt: {left: 30, top: 30},
                    start: function(ev, ui) {
                        $('#datapostooltip').hide();
                        if ($(this).attr('class').search(/dragitem(\d+)/) == -1) {
                            var itmNumber = $(this).attr('id').match(/dragitem(\d+)/)[1];
                            $(ui.helper).addClass("dragged" + itmNumber);
                        }
                    },
                    stop: function(ev, ui) {
                        ev.stopImmediatePropagation();
                        //objName = "#clonediv" + counter;
                        /*var itmNumber = $(this).attr('id').match(/dragitem(\d+)/)[1];
                        $.each(gbArrDataDB, function(k,v){
                            if(v.goalsubtype == itmNumber) {
                                objName = "#" + v.clonediv;
                                return false;
                            }
                        });*/
                        objName = "#clonediv" + $('#chart1').find('.dragitem.dropped').length;
                        var tpos = $('#chart1').offset();
                        $(objName).css({
                            'left': ev.pageX - tpos.left - 30,
                            'top': ev.pageY - tpos.top - 30,
                            'position': 'absolute'
                        });
                        $(objName).removeClass("drag");
                        //When an existiung object is dragged
                        $(objName).draggable({
                            containment: 'parent',
                            cursorAt: {left: 30, top: 30},
                            drag: function(ev, ui) {
                                $('#datapostooltip').hide();
                                var ps = ($.jqplot.Cursor.prototype.getTooltipDataPosition(ev, plot1, $(this).attr('id')));
                            },
                            revert: function(event) {
                            	//if($(this).hasClass('saved')) {return false;}
                                $(this).data("uiDraggable").originalPosition = {
                                    top: 0,
                                    left: 0
                                };
                                if (event === false) {
                                    var $dragitem = $('#dragitem' + $(this).attr('class').match(/dragged(\d+)/)[1]);
                                    if(!$dragitem.is(":visible")) {
                                        $dragitem = $('#nav-goals');
                                    }
                                    var eoff = $dragitem.offset();
                                    var tpos = $('#chart1').position();
                                    var clonediv = $(this).attr('id');
                                    //clonediv = clonediv.replace('clonediv', '');
                                    $(this).animate({top: eoff.top - tpos.top + 'px', left: eoff.left - tpos.left + 'px'}, 500, function() {
                                        $.each(gbArrData, function(k, v) {
                                            if (v && v.clonediv == clonediv) {
                                                gbArrData.splice(k, 1);
                                                $('#datapos').html(JSON.stringify(gbArrData));
                                                gbArrDataDB = gbArrData;
                                            }
                                        });
                                        $(this).remove();
                                        replotOnDrop(ev);
                                    });
                                }
                                return !event;
                            },
                            stop: function(ev, ui) {
                                ev.stopImmediatePropagation();
                                if($(this).children('.icn').hasClass('icn-retire')) {
                                    ev.preventDefault();
                                    $(this).removeClass('ui-draggable-dragging');
                                    return false;
                                }
                            }
                        });
                    }
                });
                
                var replotOnDrop = function(event) {
                    //event.stopImmediatePropagation();
                    event.stopPropagation();
                    if (!autoDragGoalFlag) {
                        setTimeout(function () {
                        $(document).ready(function() {
                            gbArrDataDB = gbArrData;
                            plot1 = renderGraph(getAmtArr(gbArrDataDB));
                        });}, 400);
                    }
                };

                $('.jqplot-event-canvas').droppable({
                    containment: ".jqplot-series-shadowCanvas",
                    cancel: ".title",
                    accept: '.dragitem',
                    //tolerance: 'touch',
                    drop: function(ev, ui) {
                        ev.stopImmediatePropagation();
                        if (ui.draggable.attr('id').search(/dragitem[0-9]/) !== -1) {
                            counter++;
                            var element = $(ui.draggable).clone();
                            element.addClass("tempclass").attr("id", "clonediv" + counter).removeClass("tempclass").addClass("dragged" + ui.draggable.attr('id').match(/dragitem(\d+)/)[1]);
                            if(autoDragGoalFlag) {
                                //element.addClass("saved");
                            }
                            $(this).after(element);
                            draggedNumber = counter;
                        } else {
                            draggedNumber = $(ui.draggable).attr('id').match(/clonediv(\d+)/)[1];
                        }
                        $("#clonediv" + draggedNumber).addClass("dropped");
                        var ps = ($.jqplot.Cursor.prototype.getTooltipDataPosition(ev, plot1, "clonediv" + draggedNumber));

                        replotOnDrop(ev);
                    },
                    out: function(event, ui) {
                        $('.jqplot-goal-canvas-' + $(ui.draggable).attr('id')).remove();
                        $(ui.draggable).children('.jqplot-goal-tooltip').remove();
                        $(ui.draggable).removeClass('dropped');
                    }
                });

                $('#wrap-chart1').smoothDivScroll({
                    mousewheelScrolling: "",
                    manualContinuousScrolling: false,
                    autoScrollingMode: "",
                    hiddenOnStart: false,
                    hotSpotScrolling: true,
                    hotSpotScrollingStep: 15, // Pixels
                    hotSpotScrollingInterval: 100,
                    easingAfterHotSpotScrolling: false
                });
                $('.jqplot-xaxis-label').css({'left': '300px'});
                
    	// retirement goal include start
                var retirementGoal;
                $.each(gbArrDataDB, function(k, v) {
                    if(v && v.goaltype == 99001) {
                        retirementGoal = v;
                    }
                });
                    
                $('#chk-includeretire').on('change', function(ev){
                    $.each(gbArrDataDB, function(k, v) {
                        if(v && v.goaltype == 99001) {
                            gbArrDataDB.splice(k, 1);
                        } else if(v && v.goaltype != 99001) {
                            v.clonediv = 'clonediv'+(k+1);
                            gbArrDataDB[k] = v;
                        }
                    });
                    if($(this).is(':checked')) {
                    	var retirementYear = ${retirementYear};
                    	if(retirementYear!= 0)
                        {
	                        retirementGoal.clonediv = 'clonediv'+(gbArrDataDB.length+1);
	                        gbArrDataDB.push(retirementGoal);
	                    }
                    	else
                    	{
                    		$("#errorDialog").html("Please fill retirement age.");
							$( "#errorDialog").dialog( "open" );
							$(this).attr('checked',false);
                    		
                    	}
                    }
                    gbArrData = [];
                    $(document).ready(function() {
                        $('.dragitem.dropped').remove();
                        counter = 0;
                        $.each(gbArrDataDB, function(k, nv) {
                        autoDragGoal(nv);
                        });
                    });
                    replotOnDrop(ev);
                }).trigger('change');
                /* if(typeof retirementGoal == 'object') {
                	$('#chk-includeretire').prop('checked', true).triggerHandler('click');
                } */
             // retirement goal include end
             
             
            /*  // Start This Code is for rolebase security 
                var partnerSetupLinks = "${partnerSetupLinks}";
                var pieces = partnerSetupLinks.split(",");
                for(var i=0;i<pieces.length;i++){
                 $("."+pieces[i]).attr("href","#");
                 $("."+pieces[i]).addClass("inactiveLink");
                }
               // End This Code is for rolebase security  
 */
            });

            $(document).ready(function() {
                $('#nav-goals ul li').on('click', function(e) {
                    e.stopImmediatePropagation();
                    var glclass = $(this).attr('class');
                    $('.wrap-dragitem').not('.' + glclass).slideUp();
                    $('#nav-goals ul li').not(this).removeClass('active');
                    $('.wrap-dragitem.' + glclass).slideToggle();

                    if ($(this).hasClass('active')) {
                        $(this).removeClass('active');
                    } else {
                        $(this).addClass('active');
                    }
                });

                $("#successDialog").dialog();
                $(document).on("dialogopen", "#successDialog", function(event, ui) {
                    setTimeout("$('#successDialog').dialog('close')",3000);
                });
                
                <c:if test="${not empty success}">
            		<spring:message code="${success}" var="success"/>
            	</c:if>
                var success = '${success}';
                
                if(success != null && success != ""){
                    $("#successDialog").html(success);
                    $("#successDialog").dialog("open");
                }
                <c:if test="${not empty error}">
                <spring:message code="${error}" var="error"/>
                </c:if>
                var error = '${error}';
                
                if(error != null && error != ""){
                    $("#successDialog").html(error);
                    $("#successDialog").dialog("open");
                }


            });
            
            function doValidate(url)
            {
            	var flag = true;
            	var goalId = 0;
            	 $.each(gbArrData, function(k, v) {
            		//alert(gbArrData[k].goalid);
            		 goalId = gbArrData[k].goalid;
            		 if(goalId == undefined)
            		 {
            			flag = false;
            		 }
            	 });
	             if(flag)
	       		  {
	            	 window.location.href = url;
	              }
	       		 else
	       		  {
	       			doConfirm(url);
	       		  }
	            	
            }
            
            function doConfirm(url){
        		$(".overlay").fadeIn("slow");
        		$("#confirmDialog").fadeIn("slow");	
        		$("#returnUrl").val(url);
        	}	
            
            function closeDialog(){
        		$("#urlLink").val("");
        		$("#confirmDialog").fadeOut("slow");
        		$(".overlay").fadeOut("slow");
        	}

            function doCancel(){
        		var url = $("#returnUrl").val();
        		window.location.href = url;
        		$("#confirmDialog").fadeOut("slow");
        		$(".overlay").fadeOut("slow");
            }
        </script>
        <style>
			#confirmDialog { display: block; height: 130px; display: none; width: 360px; box-shadow: 0 0 15px 1px #757575; }
		</style>
    </head>
    <body>
        <!-- Wrapper starts-->
        <div class="wrapper">
            <!-- Main starts-->
            <section class="main">
                <!-- Common_content Starts-->
                <section class="content common_content">
                    <!-- Common_in_contnet starts-->
                    <section class="in_content common_in_content clearfix" id="what_if">
                         <div class="top">
                            <div class="show clearfix">
                                <p><span>What If</span> Analysis </p>
                                <div class="arrow"></div>
                            </div>
                            <div id="includeretire" class="display_box clearfix"><p class="txt">Include Retirement ?</p><input class="value" type="checkbox" name="chk-includeretire" id="chk-includeretire" value="0" /></div>
                            <fmt:formatNumber var="toatalInitialAsset_format" type="number" maxFractionDigits="2" value="${toatalInitialAsset}"/>
                            <div id="initial_asset" class="display_box clearfix"><div class="icon"></div><p class="txt">Intial asset value</p><div class="value">${toatalInitialAsset_format}</div><a href="${pageContext.request.contextPath}/partner/datacollection/financial-readiness/${partyId}?fromWhatIf=yes"><div class="action whatIfAssetAllocation">+</div></a></div>
                            <fmt:formatNumber var="toatalMonthlyInvestment_format" type="number" maxFractionDigits="2" value="${toatalMonthlyInvestment}"/>
                            <div id="monthly_saving" class="display_box clearfix"><p class="txt">Monthly Investment</p><div class="value">${toatalMonthlyInvestment_format}</div></div>
                            <a class="back" href="javascript:void(0)"  onclick="doValidate('${pageContext.request.contextPath}/partner/datacollection/${partyId}/<%=request.getSession().getAttribute("headerName")%>/2')">Back</a>
                            <div style="text-align: center;margin-bottom:10px;margin-top: 10px;font-size: 18px;">${headerName}</div>
                        </div>
                        
                        <div id="container" class="clearfix">
                            <div id="wrap-chart1">
                                <div id="chart1"></div>
                            </div>
                        </div>
                        <div id="nav-goals" class="clearfix">
                            <!-- div id="nav-main">
                                <ul>
                                    <li class="edu"><span class="name">Education</span></li>
                                    <li class="travel"><span class="name">Travel</span></li>
                                    <li class="car"><span class="name">Car</span></li>
                                    <li class="property"><span class="name">Property</span></li>
                                    <li class="wedding"><span class="name">Wedding</span></li>
                                    <li class="business"><span class="name">Buisness</span></li>
                                    <li class="spc_goals"><span class="name">Special Goals</span></li>
                                    <li class="others"><span class="name">Others</span></li>
                                </ul>
                            </div-->
                            <div id="wrap-dragitems" class="clearfix">
                                <div id="dragparent35001" class="wrap-dragitem edu education-align">
                                    <div class="dragitem" id="dragitem132004"><span class="icn icn-edu">Educational</span></div>
                                 <!--    <div class="dragitem" id="dragitem132003"><span class="icn icn-edu">International</span></div> -->
                                </div>
                                <div id="dragparent35005" class="wrap-dragitem travel travel-align">
                             <!--        <div class="dragitem" id="dragitem132005"><span class="icn icn-travel">Domestic</span></div> -->
                                    <div class="dragitem" id="dragitem132001"><span class="icn icn-travel">Travel</span></div>
                                </div>
                                <div id="dragparent35006" class="wrap-dragitem car car-align">
                                    <!-- <div class="dragitem" id="dragitem21"><span class="icn icn-car">Mini Car</span></div>
                                    <div class="dragitem" id="dragitem22"><span class="icn icn-car">Sports Car</span></div> -->
                                    <div class="dragitem" id="dragitem23"><span class="icn icn-car">Car</span></div>
                                    <!-- <div class="dragitem" id="dragitem24"><span class="icn icn-car">Hatchback</span></div>
                                    <div class="dragitem" id="dragitem25"><span class="icn icn-car">SUV</span></div>
                                    <div class="dragitem" id="dragitem26"><span class="icn icn-car">Wagon</span></div> -->
                                </div>
                                <div id="dragparent35003" class="wrap-dragitem property-align property">
                                   <!--  <div class="dragitem" id="dragitem106022"><span class="icn icn-property">Industrial Land</span></div>
                                    <div class="dragitem" id="dragitem106025"><span class="icn icn-property">Agricultural Land</span></div> -->
                                    <div class="dragitem" id="dragitem106002"><span class="icn icn-property">Property</span></div>
                                   <!--  <div class="dragitem" id="dragitem106003"><span class="icn icn-property">Row House</span></div>
                                    <div class="dragitem" id="dragitem106004"><span class="icn icn-property">Villa</span></div>
                                    <div class="dragitem" id="dragitem106010"><span class="icn icn-property">Commercial</span></div> -->
                                </div>
                                <div id="dragparent35004" class="wrap-dragitem wedding-align wedding">
                                    <div class="dragitem" id="dragitem10"><span class="icn icn-wedding">Wedding</span></div>
                                   <!--  <div class="dragitem" id="dragitem11"><span class="icn icn-wedding">Female</span></div> -->
                                </div>
                                <div id="dragparent35012" class="wrap-dragitem business-align business">
                                    <div class="dragitem dragitem-other" id="dragitem12"><span class="icn icn-business">Business</span></div>
                                </div>
                                <div id="dragparent35008" class="wrap-dragitem special-align spc_goals">
                                    <div class="dragitem dragitem-other" id="dragitem13"><span class="icn icn-special">Parental</span></div>
                                </div>
                                <div id="dragparent35013" class="wrap-dragitem other-align others">
                                    <div class="dragitem dragitem-other" id="dragitem14"><span class="icn icn-other">Other</span></div>
                                </div>
                                <div id="dragparent99001" class="wrap-dragitem retire hidden" style="display: none;">
                                    <div class="dragitem" id="dragitem99"><span class="icn icn-retire">Retirement</span></div>
                                </div>
                            </div>
                        </div>
                        <div align="left" style="margin-top: 5px;margin-left: 20px;">
                        <span style="background:green;width:15px;height:15px;display:inline-block;border: 1px solid #000;"></span><span style="font-size:14px;display:inline-block;text-align: center;">&nbsp;: Represent Saved Goals</span>
                        &nbsp;&nbsp;
                        <span style="background:white;width:15px;height:15px;display:inline-block;border: 1px solid #000;"></span><span style="font-size:14px;display:inline-block;">&nbsp;: Represent New Goals ( Draged Goals )</span>
                        &nbsp;&nbsp;<span style="font-size:14px;display:inline-block;">Tap twice on goal to save or edit it.</span>
                        </div>
                    </section>
                    <!-- Common_in_contnet ends -->
                </section>
                <!-- Common_content Ends-->
            </section>
            <!-- Main ends-->
        </div>
        
        <div id="confirmDialog" class="common_custom_modal_aa">
		  <span class="close" onclick="closeDialog();">X</span>
		  <div class="modal_content"> 
		    <div class="aa_up" style="text-align: center;">You have created new goal and not saved it, are you sure you want to exit?</div>
		    <div class="aa_down" id="yes"> <a style="cursor:pointer;" onclick="doCancel();" class="aa_yes">Yes </a> 
		         <a style="cursor:pointer;" onclick="closeDialog();" class="aa_no">No</a> </div>
		  </div>
  		</div>
  		
  		<div id="errorDialog" class="common_dialog" style="text-align: center;"> </div> 
  		
        <div id="datapostooltip" style="display:none"></div>
        <!-- <div id="datapos" style="width:100%;height:100px;background-color: #ccc;float: right;display:block;"></div> -->
        <form name="whatIfFrm" id="whatIfFrm" method="POST">
            <input type="hidden" name="goalYear" id="goalYear" value=""/>
            <input type="hidden" name="goalAmount" id="goalAmount" value=""/>
            <input type="hidden" name="goalId" id="goalId" value=""/>
            <input type="hidden" name="goalSubTypeId" id="goalSubTypeId" value=""/>
        </form>
        <div id="successDialog" class="common_dialog" style="text-align: center;"> </div>
        <!-- Wrapper ends-->
        <input type="hidden" id="returnUrl" name="returnUrl"/> 
        <div class="overlay"></div>
    </body>
</html>
