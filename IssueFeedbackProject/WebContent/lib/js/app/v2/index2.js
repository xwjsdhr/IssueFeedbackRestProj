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
	
	CKEDITOR.replace('inputIssueContent',{
		filebrowserImageUploadUrl: '/IssueFeedbackProject/CommentImageUpload',
		filebrowserImageBrowseUrl: '/IssueFeedbackProject/ImageBrowser',
		toolbar :
		    [
		        { name: 'document',    items : [ 'Source' ] },
		        { name: 'clipboard',   items : [ 'Cut','Copy','Paste','-','Undo','Redo' ] },
		        { name: 'basicstyles', items : [ 'Bold','Italic' ] },
		        { name: 'insert',      items : [ 'Link', 'Image', 'addFile', 'addImage' ] },
		        { name: 'tools',       items : [ 'Maximize' ] }
		    ],
	});
	
	$.ajax({
		url:"/IssueFeedbackProject/allProjects",
		method:"get",
		success:function(data){
			$.each(data.result,function(index,element){
				var row = $("<option>").val(element.id).text(element.projectName);
				inputIssueProject.append(row);
			});
		}
	});
	$("#formAddIssue").validate({
		rules:{
			inputIssueTitle:"required",
			inputIssueContent:"required"
		},
		messages:{
			inputIssueTitle :"<div class='alert alert-danger col-lg-12' style='margin-top:10px' role='alert'>请输入问题标题</div>",
			inputIssueContent:"<div class='alert alert-danger col-lg-12' style='margin-top:10px' role='alert'>请输入问题描述</div>"
		}
	});
	
	$("#formAddIssue").submit(function(event){
		event.preventDefault();
		var content = CKEDITOR.instances['inputIssueContent'].getData();
		var title = inputIssueTitle.val().trim();
		if(title.length == 0){
			return;
		}
		$.ajax({
			url:"/IssueFeedbackProject/addIssue",
			method:"post",
			data:{
				title:inputIssueTitle.val(),
				content:content,
				project_id:inputIssueProject.val()
			},
			success:function(data){
				$("#addIssueModal").modal("hide");
				inputIssueTitle.val("");
				inputIssueContent.val("");
				issueTable.ajax.reload();
				console.log(data);
			}
		});
	});
	
	$("#btnAddIssue").click(function(event){
		$("#addIssueModal").modal({
			show:true
		});
	});
	
	
	var issueTable = $("#issue_table").DataTable({
		dom:"Bfrtip",
		ajax : {
			"url" : "/IssueFeedbackProject/allIssues",
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
				data : "submitTime",
				render : function(data, type, row, meta) {
					return moment(data).fromNow();
				}
			}, 
			{
				data : "lastUpdateTime",
				render : function(data, type, row, meta) {
					return  moment(data).fromNow();
				}
			}, 
			{
				data : "weekOfYear",
				render : function(data, type, row, meta) {
					return data;
				}
			}, 
			{
				data : "project.projectName",
				render : function(data, type, row, meta) {
					return data;
				}
			}, 
			{
				data : "id",
				render : function(data, type, row, meta) {
					/*return "<a href='issue_detail?id="+data+"' class='btn btn-primary'>查看&nbsp;" +
							"<span class='badge badge-light'>"+row.comments.length+"</span>" +
							"</a>";*/
					
					return "<a class='btn btn-primary' href='issue_detail?id="+data+"'>查看&nbsp;" +
							"<span class='badge badge-light'>"+row.comments.length+"</span>" +
							"</a>";
				}
			}
		]
	})
});

