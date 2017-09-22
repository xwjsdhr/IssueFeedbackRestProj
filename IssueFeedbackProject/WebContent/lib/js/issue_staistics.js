var countArr = [];
var statusNameArr = [];
var maxCount = 0;
var myNewChart;
var ctx = document.getElementById("myChart").getContext("2d");
$(document).ready(

		function() {

			$.ajax({
				url : "/IssueFeedbackProject/AllIssueRest",
				method : "get",
				success : function(data) {

					$.each(data.items, function(index, value) {

						countArr.push(value.count);
						statusNameArr.push(value.status.statusName);
						if (value.count > maxCount) {
							maxCount = value.count;
						}
					});
					var data = {
						labels : statusNameArr,

						datasets : [ {
							label : statusNameArr[0],
							backgroundColor : [ 'RGB(134,142,150)',
									'RGB(255,193,7)', 'RGB(40,167,69)',
									'RGB(220,53,69)' ],
							data : countArr
						} ],

					};

					myNewChart = new Chart(ctx, {
						type : 'bar',
						data : data,
						options : {
							barPercentage : 0.5,
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
										steps : 1,
										stepValue : 1,
										max : maxCount
									// max value for the chart is 60
									}
								} ]
							}
						}
					});

				}
			});

			$("#inlineSelect").change(
					function(event) {
						var element = event.target;
						$.ajax({
							url : "/IssueFeedbackProject/AllIssueRest",
							data : {
								weekOfYear : element.value
							},
							method : "get",
							success : function(data) {
								console.log(data);
								myNewChart.data.datasets[0].data = [];
								myNewChart.data.labels = [];
								
								$.each(data.items, function(index, value) {
									myNewChart.data.datasets[0].data
											.push(value.count);
									myNewChart.data.labels
											.push(value.status.statusName);
								});

								myNewChart.update();

							}
						});
					});
		});
