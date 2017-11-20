var color = Chart.helpers.color;
var dataset = [];
var labels = [];
var backgroundColors =  [];

var issueCount = $("#issueCount");
var userCount = $("#userCount");
var deptCount = $("#deptCount");
var projectCount = $("#projectCount");
var datasets = [];

var barChartData = {
	labels : labels,
	datasets : datasets
};



$(document).ready(function() {
	var ctx = document.getElementById("canvas").getContext("2d");
	window.myBar = new Chart(ctx, {
		type : 'bar',
		data : barChartData,
		options : {
			barPercentage:0.2,
			categoryPercentage:0.2,
			barThickness:20,
			responsive : true,
			legend : {
				boxWidth:20,
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
				}]
			}
		}
	});
	
	$.ajax({
		 url:"/IssueFeedbackProject/getHomeMainData",
		 method:"get",
		 success:function(data){
			 issueCount.text(data.result.issueCount);
			 deptCount.text(data.result.deptCount);
			 projectCount.text(data.result.projectCount);
			 userCount.text(data.result.userCount);
		 }
	 });
	
	$.ajax({
		 url:"/IssueFeedbackProject/issueCount",
		 method:"post",
		 data:{
			 year:2017,
			 type:"week_of_year",
		 },
		 success:function(data){
			 
			 $.each(data.result,function(index,data){
				 console.log(data);
				 var dataset = makeDataset(data);
				 datasets.push(dataset);
			 });
			 window.myBar.update(); 
		 }
	 });
	
	initListener();
});

function randomColor(){
	var color = "#";
	for(var i = 0 ;i<6 ;i++){
		color = color.concat(Math.floor(Math.random()*10));
	}
	return color;
}
function makeDataset(data){
	
	var data = 	 {
			label :"第"+data.week+"周",
			borderWidth : 1,
			backgroundColor :randomColor(),
			borderColor : randomColor(),
			data : [data.count],
			
	 };
	return data;
}
function initListener(){
	
	$('#card_dept').click(function(event){
		window.location.href="dept_management";
	});
	
	$('#card_issue').click(function(event){
		window.location.href="index";
	});
	
	$('#card_project').click(function(event){
		window.location.href="project_management";
	});
	
	$('#card_permission').click(function(event){
		window.location.href="permission_management";
	});
	
}


