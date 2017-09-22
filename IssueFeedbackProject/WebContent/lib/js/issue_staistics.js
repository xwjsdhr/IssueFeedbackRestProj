$(document).ready(

		function() {
			var countArr = [];
			var statusNameArr = [];
			var maxCount = 0;
			$.ajax({
				url : "/IssueFeedbackProject/AllIssueRest",
				method : "get",
				success : function(data) {

					$.each(data.items, function(index, value) {

						countArr.push(value.count);
						statusNameArr.push(value.status.statusName);
						if(value.count > maxCount){
							maxCount = value.count;
						}
					});
					
					var ctx = document.getElementById("myChart").getContext(
							"2d");
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

					var myNewChart = new Chart(ctx, {
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

		});
