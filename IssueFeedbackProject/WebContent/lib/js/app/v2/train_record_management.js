$(document).ready(function(event){
	$.ajax({
		url:"/IssueFeedbackProject/allTrainingRecords",
		success:function(data){
			console.log(data);
		}
	});
});
var app = null;




$("#train_record_table").DataTable({
	ajax:{
		"url":"/IssueFeedbackProject/allTrainingRecords",
		"dataSrc":"result",
		
	},
	"lengthMenu":[
		[5,20],[5,20]
	],
	"language": {
        "lengthMenu": "每页显示 _MENU_ 条记录",
        "zeroRecords": "未查询到任何记录",
        "info": "第 _PAGE_ 页 ，共  _PAGES_页",
        "infoEmpty": "无任何问题",
        "infoFiltered": "(filtered from _MAX_ total records)",
        "paginate":{
        	"previous":"上一页",
        	"next":"下一页"
        },
        select:{
        	rows:{
        		 _: "    &nbsp;&nbsp;&nbsp;&nbsp;你已经选择了  %d 行",
                 0: "    &nbsp;&nbsp;&nbsp;&nbsp;点击一行选择",
                 1: "    &nbsp;&nbsp;&nbsp;&nbsp;仅 %d 行被选择 "
        	}
        },
        search:"查询",
        searchPlaceholder:"请输入查询信息"
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
			"width":"10%",
			data:"trainedUsers",
			render:function(data, type, row, meta){
				var string = "";
				$.each(data,function(index,element){
					string = string.concat(element.realName).concat(" 、 ");
				});
				
				var str =  "<a tabindex='0' class='btn btn-light' role='button' data-toggle='popover' data-trigger='focus'"+ 
					"title='参加培训人员' data-content='"+string+"'>点击查看</a>"
				$('.btn-light').popover({
					  trigger: 'focus',
					  placement:"top"
				});
				return  str;
			}
		}
	]
});