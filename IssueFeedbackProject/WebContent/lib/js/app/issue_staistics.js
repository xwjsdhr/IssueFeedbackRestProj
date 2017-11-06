var countArr = [];
var statusNameArr = [];
var maxCount = 0;
var myNewChart;
var ctx = document.getElementById("myChart").getContext("2d");
$(document).ready( function() {
	progressRoot.attr("hidden",true);
	myNewChart = new Chart(ctx, {
		type : 'bar',
		options : {
			barPercentage : 100,
			layout : {
				padding : {
					left : 0,
					right : 0,
					top : 0,
					bottom : 0
				}
			},
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true,
						steps : 5,
						stepValue : 1,
						max : 5
					// max value for the chart is 60
					}
				} ]
			}
		}
	});
});

