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
				data:{
					weekOfYear:new Date().getWeek()
				},
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
			
			$.ajax({
				url:"/IssueFeedbackProject/AllWeek",
				method:"get",
				data:{
					year:new Date().getFullYear()
				},
				success:function(data){
					var select = $("#inlineSelect");
					select.empty();
					$.each(data.list ,function(index,value){
						if(value == new Date().getWeek()){
							var option = $("<option>").val(value)
							.attr("selected","selected")
							.text(value);
							select.append(option);
						}else{
							var option = $("<option>").val(value)
							.text(value);
							select.append(option);
						}
						
					});
				}
			});
			
			$.ajax({
				url:"/IssueFeedbackProject/AllYears",
				method:"get",
				success:function(data){
					var root = $("#inlineSelectYear");
					$.each(data.list,function(index,value){
						var year = new Date().getFullYear();
						if(value == year){
							var optionElement =  $("<option>")
							.attr("selected","selected")
							.val(value)
							.text(value);
							root.append(optionElement);
						}else{
							var optionElement =  $("<option>")
							.val(value)
							.text(value);
							root.append(optionElement);
						}
					});
				}
			});
			
			$("#inlineSelectYear").change(function(event){
				var value = event.target.value;
				console.log(value);
				$.ajax({
					url:"/IssueFeedbackProject/AllWeek",
					method:"get",
					data:{
						year:value
					},
					success:function(data){
						var select = $("#inlineSelect");
						select.empty();
						$.each(data.list ,function(index,value){
							var option = $("<option>").val(value).text(value);
							select.append(option);
						});
					}
				});
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

Date.prototype.getWeek = function(){
    // We have to compare against the first monday of the year not the 01/01
    // 60*60*24*1000 = 86400000
    // 'onejan_next_monday_time' reffers to the miliseconds of the next monday after 01/01

    var day_miliseconds = 86400000,
        onejan = new Date(this.getFullYear(),0,1,0,0,0),
        onejan_day = (onejan.getDay()==0) ? 7 : onejan.getDay(),
        days_for_next_monday = (8-onejan_day),
        onejan_next_monday_time = onejan.getTime() + (days_for_next_monday * day_miliseconds),
        // If one jan is not a monday, get the first monday of the year
        first_monday_year_time = (onejan_day>1) ? onejan_next_monday_time : onejan.getTime(),
        this_date = new Date(this.getFullYear(), this.getMonth(),this.getDate(),0,0,0),// This at 00:00:00
        this_time = this_date.getTime(),
        days_from_first_monday = Math.round(((this_time - first_monday_year_time) / day_miliseconds));

    var first_monday_year = new Date(first_monday_year_time);

    // We add 1 to "days_from_first_monday" because if "days_from_first_monday" is *7,
    // then 7/7 = 1, and as we are 7 days from first monday,
    // we should be in week number 2 instead of week number 1 (7/7=1)
    // We consider week number as 52 when "days_from_first_monday" is lower than 0,
    // that means the actual week started before the first monday so that means we are on the firsts
    // days of the year (ex: we are on Friday 01/01, then "days_from_first_monday"=-3,
    // so friday 01/01 is part of week number 52 from past year)
    // "days_from_first_monday<=364" because (364+1)/7 == 52, if we are on day 365, then (365+1)/7 >= 52 (Math.ceil(366/7)=53) and thats wrong

    return (days_from_first_monday>=0 && days_from_first_monday<364) ? Math.ceil((days_from_first_monday+1)/7) : 52;
}
