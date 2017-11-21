var selectorDept = $("#selectorDept");
var inputProjectName = $("#inputProjectName");
var selectorDept = $("#selectorDept");
var inputProjectDesc = $("#inputProjectDesc");

var updateProjectModal = $("#updateProjectModal");
var formUpdateProject = $("#formUpdateProject");
var inputUpdateProjectName = $("#inputUpdateProjectName");
var selectorUpdateDept = $("#selectorUpdateDept");
var inputUpdateProjectDesc = $("#inputUpdateProjectDesc");
var btnUpdateProject = $("#btnUpdateProject");
var deptArr = [];
$(document).ready(function(){
	
	$("#formAddProject").validate({
		rules:{
			inputProjectName: "required",
			inputProjectDesc :"required"
		},
		messages:{
			inputProjectName:"<div class='alert alert-danger col-lg-12' style='margin-top:10px' role='alert'>请输入项目名</div>",
			inputProjectDesc:"<div class='alert alert-danger col-lg-12' style='margin-top:10px' role='alert'>请输入项目描述</div>"
		}
	});
	
	$.ajax({
		url:"/IssueFeedbackProject/allDepts",
		method:"get",
		success:function(data){
			$.each(data.result,function(index,element){
				var row = $("<option>").val(element.id).text(element.deptName);
				selectorDept.append(row);
			});
			$.each(data.result,function(index,element){
				deptArr.push(element);
//				var row = $("<option>").val(element.id).text(element.deptName);
//				selectorUpdateDept.append(row);
			});
		}
	});
	
	$("#btnAddProject").click(function(){
		$("#addProjectModal").modal({
			show:true
		});
	});
	
	$("#formUpdateProject").submit(function(event){
		event.preventDefault();
		$.ajax({
			url:"/IssueFeedbackProject/updateProject",
			method:"get",
			data:{
				project_id:btnUpdateProject.attr("id").split("-")[1],
				project_desc:inputUpdateProjectDesc.val(),
				project_name:inputUpdateProjectName.val(),
				dept_id:selectorUpdateDept.val()
			},
			success:function(data){
				console.log(data);
				updateProjectModal.modal("hide");
				projectTable.ajax.reload();
			}
		});
	});
	
	
	$("#formAddProject").submit(function(event){
		event.preventDefault();
		var projectName = inputProjectName.val();
		var projectDescription = inputProjectDesc.val();
		if(projectName.trim().length == 0 || projectDescription.trim().length ==0){
			return;
		}
		$.ajax({
			url:"/IssueFeedbackProject/addProject",
			method:"get",
			data:{
				project_name:inputProjectName.val(),
				dept_id:$("#selectorDept :selected").val(),
				project_description:inputProjectDesc.val()
			},
			success:function(data){
				if(data.result){
					projectTable.ajax.reload(false,null);
					emptyDialog();
					$("#addProjectModal").modal("hide");
				}
			}
		})
	});
	
	$('#project_table tbody').on( 'click', '.btnUpdate', function () {
        var data = projectTable.row( $(this).parents('tr') ).data();
		updateProjectModal.modal({
			show:true
		});
		inputUpdateProjectName.val(data.projectName);
		inputUpdateProjectDesc.val(data.description);
		btnUpdateProject.attr("id","udpate-"+data.id);
		selectorUpdateDept.empty();
		console.log(data);
		var row = $("<option>").val(data.dept.id).text(data.dept.deptName);
		selectorUpdateDept.prepend(row);
		$.each(deptArr,function(index,element){
			if(data.dept.deptName != element.deptName){
				var row = $("<option>").val(element.id).text(element.deptName);
				selectorUpdateDept.append(row);
			}
		});
		
    });
	
});
/**
 * 清空添加部门对话框
 * @returns
 */
function emptyDialog(){
	inputProjectName.val("");
	inputProjectDesc.val("");
}
var projectTable = $("#project_table").DataTable({
		ajax : {
			"url" : "/IssueFeedbackProject/allProjects",
			"dataSrc" : "result",
			"data":function(){
				notification("加载项目成功","success");
			}
		},
		searching:true,
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
				data : "dept.deptName",
				render : function(data, type, row, meta) {
					return data;
				}
			},
			{
				data : "description",
				render : function(data, type, row, meta) {
					return data;
				}
			},
			 
			{
				data : "id",
				render : function(data, type, row, meta) {
					return "<button href='#' class='btn btn-primary btnUpdate' >修改</button>";
				}
			}
		]
});