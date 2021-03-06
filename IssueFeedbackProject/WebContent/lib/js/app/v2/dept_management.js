var inputDeptName = $("#inputDeptName");
$(document).ready(function(event){
	
	$("#btnAddDept").click(function(){
		$("#addDeptModal").modal({
			show:true
		});
	});
	
	$.ajax({
		url:"/IssueFeedbackProject/allDepts",
		method:"get",
		success:function(data){
			console.log(data);
		}
	});
	$("#formAddDept").validate({
		rules:{
			inputDeptName:"required"
		},
		messages:{
			inputDeptName:"<div class='alert alert-danger col-lg-12' style='margin-top:10px' role='alert'>请输入部门名称</div>"
		}
	});
	
	$("#formAddDept").submit(function(event){
		event.preventDefault();
		if(inputDeptName.val().trim().length >0){
			$.ajax({
				url:"/IssueFeedbackProject/addDept",
				method:"get",
				data:{
					dept_name:inputDeptName.val()
				},
				success:function(data){
					console.log(data);
					if(data.result){
						$("#addDeptModal").modal("hide");
						inputDeptName.val("");
						deptTable.ajax.reload();
					}
				}
			});
		}
	});
	
	$("#dept_table tbody").on("click",".btn-delete",function(event){
		var id = $(this).attr("id").split("-")[1];
		$.ajax({
			url:"/IssueFeedbackProject/delDeptById",
			data:{
				id:id
			},
			method:"get",
			success:function(data){
				if(data.result != null && data.result){
					deptTable.ajax.reload();
				}
			}
		});
	});
	
});


var deptTable = $("#dept_table").DataTable({
		ajax : {
			"url" : "/IssueFeedbackProject/allDepts",
			"dataSrc" : "result"
		},
		"language": {
            "lengthMenu": "每页显示 _MENU_ 条记录",
            "zeroRecords": "未查询到任何部门",
            "info": "第 _PAGE_ 页 ，共  _PAGES_页",
            "infoEmpty": "无任何部门",
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
		searching:true,
		paging:true,
		columns : [
			{
				data : "deptName",
				render : function(data, type, row, meta) {
					return data;
				}
			},
			{
				data:"description",
				render:function(data, type, row, meta){
					return data;
				}
			},
			{
				data:"permissionsList",
				width:"30%",
				render:function(data, type, row, meta){
					var string = "";
					$.each(data,function(index,element){
						string = string.concat(element.permissionName).concat(" 、 ");
					});
					return  string;
				}
			}
//			,{
//				data:"id",
//				width:"5%",
//				render:function(data, type, row, meta){
//					return  "<button class='btn btn-sm btn-danger btn-delete' id='btn-"+data+"'>删除</button>";
//				}
//			}
		]
});