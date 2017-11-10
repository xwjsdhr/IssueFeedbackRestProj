/*!
 * Start Bootstrap - SB Admin v4.0.0-beta.2 (https://startbootstrap.com/template-overviews/sb-admin)
 * Copyright 2013-2017 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap-sb-admin/blob/master/LICENSE)
 */
$(document).ready(function() {
	
	CKEDITOR.replace('inputIssueContent',{
		filebrowserImageUploadUrl: '/IssueFeedbackProject/CommentImageUpload',
		filebrowserImageBrowseUrl: '/IssueFeedbackProject/ImageBrowser',
		toolbar :	// Sample toolbar
		    [
		        { name: 'document',    items : [ 'Source' ] },
		        { name: 'clipboard',   items : [ 'Cut','Copy','Paste','-','Undo','Redo' ] },
		        { name: 'basicstyles', items : [ 'Bold','Italic' ] },
		        { name: 'insert',      items : [ 'Link', 'Image', 'addFile', 'addImage' ] },
		        { name: 'tools',       items : [ 'Maximize' ] }
		    ],
	});
	
	$("#btnAddIssue").click(function(event){
		console.log("aaaa");
		$("#addIssueModal").modal({
			show:true
		});
	});
	$("#issue_table").DataTable({
		ajax : {
			"url" : "/IssueFeedbackProject/allIssues",
			"dataSrc" : "result"
		},
		paging : true,
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
					return "<a href='issue_detail?id="+data+"' class='btn btn-link'>查看</a>";
				}
			}
		]
	})
});