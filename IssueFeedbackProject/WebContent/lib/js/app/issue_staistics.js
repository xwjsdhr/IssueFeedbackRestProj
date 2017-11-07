var MONTHS = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var color = Chart.helpers.color;
var dataset= [];
var labels = [];
window.chartColors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};
var barChartData = {
    labels: labels,
    datasets: [{
        label: '问题数量',
        borderWidth: 1,
        backgroundColor: "#18FFFF",
        borderColor: "#00554D",
        data: dataset
    }]

};

window.onload = function() {
    var ctx = document.getElementById("canvas").getContext("2d");
    window.myBar = new Chart(ctx, {
        type: 'bar',
        data: barChartData,
        options: {
            responsive: true,
            legend: {
                position: 'top',
            },
            title: {
                display: true,
                text: '问题统计'
            },
            scales:{
            	yAxes:[{
            		ticks:{
            			min:0,
            			stepSize:1
            		}
            	}]
            }
        }
    });
    $.ajax({
    	url:"/IssueFeedbackProject/issueCount",
    	method:"post",
    	data:{
    		year:null,
    		month:null,
    		week:null,
    		type:"status",
    	},
    	success:function(data){
    		console.log(data);
    		$.each(data.result,function(index,data){
    			labels.push("第"+data.week+"周");
    			dataset.push(data.count)
    			
    		});
    		 window.myBar.update();
    		 
    		
    		 setTimeout(() => {
    			 progressRoot.attr("width","100%");
    			
			}, 500);
    		 progressRoot.attr("hidden",true);
    	}
    });

};
