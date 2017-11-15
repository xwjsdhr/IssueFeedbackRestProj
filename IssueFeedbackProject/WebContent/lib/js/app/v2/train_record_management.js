$(document).ready(function(event){
	$.ajax({
		url:"/IssueFeedbackProject/allTrainingRecords",
		success:function(data){
			console.log(data);
		}
	});
});
$("#train_record_table").DataTable({
	ajax:{
		"url":"/IssueFeedbackProject/allTrainingRecords",
		"dataSrc":"result"
	},
	columns:[
		
		{
			data:"trainingType.trainingTypeName",
			render:function(data, type, row, meta){
				return data;
			}
		},
		{
			data:"content",
			render:function(data, type, row, meta){
				return data;
			}
		},
		{
			data:"createTime",
			render:function(data, type, row, meta){
				return data;
			}
		},
		{
			data:"trainingWay.trainingWayName",
			render:function(data, type, row, meta){
				return data;
			}
		},
		{
			data:"teachDept.deptName",
			render:function(data, type, row, meta){
				return data;
			}
		},
		
		{
			data:"trainingTime",
			render:function(data, type, row, meta){
				return data;
			}
		},
		{
			data:"teacher.realName",
			render:function(data, type, row, meta){
				return data;
			}
		},
		{
			data:"duration", 
			render:function(data, type, row, meta){
				return data+" "+row.timeUnit.timeUnitName;
			}
		},
		{
			data:"prepareduration",
			render:function(data, type, row, meta){
				return data+""+row.timeUnit.timeUnitName;
			}
		},
		{
			data:"trainedUsers",
			render:function(data, type, row, meta){
				var string = "";
				$.each(data,function(index,element){
					string = string.concat(element.realName).concat(" 、 ");
				});
				return  string;
			}
		}
	]
});