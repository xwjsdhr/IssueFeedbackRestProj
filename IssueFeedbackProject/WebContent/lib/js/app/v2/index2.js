/*!
 * Start Bootstrap - SB Admin v4.0.0-beta.2 (https://startbootstrap.com/template-overviews/sb-admin)

 * Copyright 2013-2017 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap-sb-admin/blob/master/LICENSE)
 */
var inputIssueTitle = $("#inputIssueTitle");
var inputIssueProject = $("#inputIssueProject");
var inputIssueContent = $("#inputIssueContent");
var inputIssueProjectModule = $("#inputIssueProjectModule");

var localStorage = window.localStorage;
$(document).ready(function() {
	
	inputIssueProject.select2({});
	
	var select2Module = inputIssueProjectModule.select2({
		tags: true,
		tokenSeparators: [",", " "],
		createTag: function (tag) {
	        return {
	            id: tag.term,
	            text: tag.term,
	            isNew : true
	        };
	    }
	});
	
	
	select2Module.on("select2:select", function(e) {
	    if(e.params.data.isNew){
	        // append the new option element prenamently:
	        $(this).find('[value="'+e.params.data.id+'"]').replaceWith('<option selected value="'+e.params.data.id+'">'+e.params.data.text+'</option>');
	        $.ajax({
	        	url: "/IssueFeedbackProject/addModuleToProject",
	        	method:"get",
	        	data:{
	        		project_id:inputIssueProject.val(),
	        		module_name:e.params.data.text
	        	},
	        	success:function(data){
	        		inputIssueProjectModule.empty();
	        		$.ajax({
	        			url:"/IssueFeedbackProject/getModuleByProjectId",
	        			method:"get",
	        			data:{
	        				project_id:1
	        			},
	        			success:function(data){
	        				inputIssueProjectModule.empty();
	        				if(data.result!= null){
	        					$.each(data.result,function(index,element){
	        						if(element!= null){
	        							var row = $("<option>").val(element.id).text(element.projectModuleName);
	        							inputIssueProjectModule.append(row);
	        						}
	        					});
	        				}
	        			}
	        		});
	        	}
	        });
	        
	    }
	});
	
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
	
	$.ajax({
		url:"/IssueFeedbackProject/getModuleByProjectId",
		method:"get",
		data:{
			project_id:1
		},
		success:function(data){
			inputIssueProjectModule.empty();
			if(data.result!= null){
				$.each(data.result,function(index,element){
					if(element!= null){
						var row = $("<option>").val(element.id).text(element.projectModuleName);
						inputIssueProjectModule.append(row);
					}
				});
			}
		}
	});
	
	inputIssueProject.on("change",function(event){
		var id = $(this).val();
		console.log(id);
		$.ajax({
			url:"/IssueFeedbackProject/getModuleByProjectId",
			method:"get",
			data:{
				project_id:id
			},
			success:function(data){
				inputIssueProjectModule.empty();
				if(data.result!= null){
					$.each(data.result,function(index,element){
						if(element!= null){
							var row = $("<option>").val(element.id).text(element.projectModuleName);
							inputIssueProjectModule.append(row);
						}
					});
				}
				
			}
		});
	});
	
	$("#formAddIssue").submit(function(event){
		event.preventDefault();
	    $(this).addClass("was-validated");
	});
//	$("#formAddIssue").validate({
//		rules:{
//			inputIssueTitle:"required",
//			inputIssueContent:"required"
//		},
//		messages:{
//			inputIssueTitle :"<div class='alert alert-danger col-lg-12' style='margin-top:10px' role='alert'>请输入问题标题</div>",
//			inputIssueContent:"<div class='alert alert-danger col-lg-12' style='margin-top:10px' role='alert'>请输入问题描述</div>"
//		}
//	});
	$("#chkAboutMe").change(function(event){
		var issueUrl = null;
		if(this.checked){
			console.log("true")
			issueUrl = "/IssueFeedbackProject/issueAboutMe";
		}else{
			console.log("false")
			issueUrl = "/IssueFeedbackProject/allIssues";
		}
		issueTable.ajax.url(issueUrl).load();
		
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
				project_id:inputIssueProject.val(),
				module_id:inputIssueProjectModule.val()
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
			{
				extend :'excel',
				text:"<i class='fa fa-table'></i>&nbsp;导出为Excel",
				className:"btn btn-sm btn-success"
			}
			
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
            search:"<label class='btn btn-sm btn-primary'><i class='fa fa-search'></i>&nbsp;查询</label>",
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
						case 5:
							type= "badge-info";
							break;
					 	
					}
					var row = "<span class='badge "+type+"'>"+data.statusName+"</span>"
					return row;
				}
			},
			{
				data : "title",
				width:"15%",
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
				data : "user",
				width:"5%",
				render : function(data, type, row, meta) {
									
					var btn = "<button type='button' id='contact-"+data.id+"' class='btn btn-sm btn-secondary contact text-white' data-toggle='tooltip' data-placement='top'><i class='fa fa-user'></i> &nbsp;" +
							data.username
							"</button>";
//					$('#contact-'+data.id).tooltip({
//						html:true,
//						title:
//							"<div class='card border-primary text-primary'>" +
//								"<div class='card-header border-primary'>" +
//								data.realName+"  的联系方式" +
//								"</div>" +
//								"<div class='card-body border-primary ' style='color:white'>" +
//									"<b style='color:black'>电话<br/>"+data.telephone+"</b><br/>" +
//									"<b style='color:black'>电子邮箱<br/>"+data.email+"</b>" +
//								"</div>" +
//							"</div>",
//						template:'<div class="tooltip" role="tooltip" style:"padding:0;"><div  style="background-color:white;padding:0; width:200px " class="tooltip-inner"></div></div>'
//					});
					return  btn;
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
				data : "projectModule.projectModuleName",
				render : function(data, type, row, meta) {
					return "<p class='text-center'>"+ data+"</p>";
				}
			}, 
			{
				data : "id",
				width:"5%",
				render : function(data, type, row, meta) {
					return "<a class='btn btn-primary btn-sm' href='"+data+"'>查看&nbsp;<i class='fa fa-arrow-right'></i></a>";
				}
			}
		]
	})
});

