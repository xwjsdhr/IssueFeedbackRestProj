/*!
 * Start Bootstrap - SB Admin v4.0.0-beta.2 (https://startbootstrap.com/template-overviews/sb-admin)

 * Copyright 2013-2017 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap-sb-admin/blob/master/LICENSE)
 */
var inputIssueTitle = $("#inputIssueTitle");
var inputIssueProject = $("#inputIssueProject");
var inputIssueContent = $("#inputIssueContent");

var lclstrg = window.localStorage;

$(document).ready(function() {
	
	var issueTable = $("#issue_table").DataTable({
		dom:"Bfrtip",
		ajax : {
			"url" : "/IssueFeedbackProject/allUserLogs",
			"dataSrc" : "result"
		},
		paging : true,
		buttons:[
			'excel'
		],
		"lengthMenu":[
			[10,25,50,-1],[10,25,50,"全部"]
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
				data : "user.realName",
				render : function(data, type, row, meta) {
					return data;
				}
			}, 
			{
				data : "logTime",
				render : function(data, type, row, meta) {
					return moment(data).fromNow();
				}
			}, 
			{
				data : "ipAddr",
				render : function(data, type, row, meta) {
					return  data;
				}
			}, 
			{
				data : "logType.typeName",
				render : function(data, type, row, meta) {
					var str = "badge-success";
					var icon = "<i class='fa fa-fw fa-sign-in'></i>";
					switch(row.logType.id){
					case 1:
						str = "badge-success";
						icon = "<i class='fa fa-fw fa-sign-in'></i>";
						break;
					case 2:
						str = "badge-danger";
						icon = "<i class='fa fa-fw fa-sign-out'></i>";
						break;
					}
					return  "<span class='badge "+str+" '>"+icon+"&nbsp;"+data+" </span>";
				}
			}
		]
	})
});

