var type = null;
var year = null;
var month = null;
var color = Chart.helpers.color;
var dataset = [];
var labels = [];

window.chartColors = {
	red : 'rgb(255, 99, 132)',
	orange : 'rgb(255, 159, 64)',
	yellow : 'rgb(255, 205, 86)',
	green : 'rgb(75, 192, 192)',
	blue : 'rgb(54, 162, 235)',
	purple : 'rgb(153, 102, 255)',
	grey : 'rgb(201, 203, 207)'
};
var barChartData = {
	labels : labels,
	datasets : [ {
		label : '问题数量',
		borderWidth : 1,
		backgroundColor : "#18FFFF",
		borderColor : "#202425",
		data : dataset
	} ]

};
$(document).ready(function(event) {
	
	var ctx = document.getElementById("canvas").getContext("2d");
	window.myBar = new Chart(ctx, {
		type : 'bar',
		data : barChartData,
		options : {
			responsive : true,
			legend : {
				position : 'top',
			},
			title : {
				display : true,
				text : '问题统计'
			},
			scales : {
				yAxes : [ {
					ticks : {
						min : 0,
						stepSize : 1
					}
				} ]
			}
		}
	});
	selectorType.change(function(event) {
		switch ($(event.target).val()) {
		case "month":
			type = "month";
			colYear.attr("hidden",false);
			break;
		case "week_of_year":
			type = "week_of_year";
			colYear.attr("hidden",false);
			break;
		case "year":
		case "dept_id":
		case "project":
		case "status_id":
			type = $(event.target).val();
			colYear.attr("hidden",true);
			year = null;
			break;
		}
	});
	
	selectorYear.change(function(event){
		var value = $(event.target).val();
		console.log(value);
		year = value.length==0? null :value;
	});
	
	
	btnQuery.click(function(event){
		
		
		 $.ajax({
			 url:"/IssueFeedbackProject/issueCount",
			 method:"post",
			 data:{
				 year:year,
				 type:type,
			 },
			 success:function(data){
				 	
				 $.each(data.result,function(index,data){
					 labels.push(data.week);
					 dataset.push(data.count)    			
				 });
				 console.log(data.result);
				 window.myBar.update(); 
				 
				 setTimeout(() => {
					progressRoot.attr("width","100%");
				 	progressRoot.attr("hidden",true);
				 }, 500);
				 
			 }
		 });
		
	});
});

var selectorType = $("#selectorType");
var selectorYear = $("#selectorYear");
var colType =$("#colType");
var colYear = $("#colYear");
var btnQuery = $("#btnQuery");
var image = $("#img");
colYear.attr("hidden",true);
