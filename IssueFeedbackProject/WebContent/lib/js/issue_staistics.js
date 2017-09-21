$(document).ready(
		function() {

			$.ajax({
				url : "/IssueFeedbackProject/AllIssueRest",
				method : "get",
				success : function(data) {
					console.log(data);
				}
			});
			var ctx = document.getElementById("myChart").getContext("2d");
			var data = {
				labels : [ "Monday", "Tuesday", "Wedns", "April", "May",
						"June", "July" ],
				datasets : [ {
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,1)",
					data : [ 65, 59, 90, 81, 56, 55, 40 ]
				}, {
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,1)",
					data : [ 28, 48, 40, 19, 96, 27, 100 ]
				} ]
			};

			var myNewChart = new Chart(ctx, {
				type : 'bar',
				data : data,
				options : {
					layout : {
						padding : {
							left : 0,
							right : 0,
							top : 0,
							bottom : 0
						}
					}
				}
			});
		});
