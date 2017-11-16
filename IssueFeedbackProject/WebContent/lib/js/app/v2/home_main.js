$(document).ready(function() {
	
	var issueTable = $("#issue_table").DataTable({
		dom:"Bfrtip",
		ajax : {
			"url" : "/IssueFeedbackProject/allIssues",
			"dataSrc" : "result"
		},
		searching:false,
		paging:true,
		buttons:[
			'excel'
		],
		"lengthMenu":[
			[5],[5]
		],
		"language": {
            "lengthMenu": "每页显示 _MENU_ 条记录",
            "zeroRecords": "未查询到任何问题",
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
		columns : [
			{
				data : "status",
				render : function(data, type, row, meta) {
					var type = null;
					switch(data.id){
						case 1:
							type = "badge-warning";
							break;
						case 2:
							type = "badge-secondary";
							break;
						case 3:
							type = "badge-success";
							break;
						case 4:
							type = "badge-danger";
							break;
					 	
					}
					var row = "<span class='badge "+type+"'>"+data.statusName+"</span>"
					return row;
				}
			},
			{
				data : "title",
				render : function(data, type, row, meta) {
					return data;
				}
			}, 
			{
				data : "lastUpdateTime",
				render : function(data, type, row, meta) {
					return  moment(data).fromNow();
				}
			}, 
			{
				data : "project.projectName",
				render : function(data, type, row, meta) {
					return data;
				}
			}
		]
	});
	
	$("#train_record_table").DataTable({
		dom:"Bfrtip",
		ajax:{
			"url":"/IssueFeedbackProject/allTrainingRecords",
			"dataSrc":"result"
		},
		"lengthMenu":[
			[5],[5]
		],
		buttons:[
			'excel'
		],
		searching:false,
		paging:true,
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
				data:"content",
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
			}
		]
	});

	
	
	$("#project_table").DataTable({
		dom:"Bfrtip",
		ajax : {
			"url" : "/IssueFeedbackProject/allProjects",
			"dataSrc" : "result",
			"data":function(){
				notification("加载项目成功","success");
			}
		},
		buttons:[
			'excel'
		],
		searching:false,
		paging:true,
		"lengthMenu":[
			[5,20],[5,20]
		],
		"language": {
            "lengthMenu": "每页显示 _MENU_ 条记录",
            "zeroRecords": "未查询到任何部门",
            "info": "第 _PAGE_ 页 ，共  _PAGES_页",
            "infoEmpty": "无任何部门",
            "infoFiltered": "(总共_MAX_条记录)",
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
		columns : [
			{
				data : "projectName",
				render : function(data, type, row, meta) {
					return data;
				}
			}, 
			{
				data : "description",
				render : function(data, type, row, meta) {
					return data;
				}
			}
		]
	});
	
	
	
});


