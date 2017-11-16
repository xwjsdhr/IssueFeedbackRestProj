var btnUpdatePermission = $("#btnUpdatePermission");
var updatePermissionModal = $("#updatePermissionModal");
var btnUpdatePermissionOk = $("#btnUpdatePermissionOk");

$(document).ready(function(){
	btnUpdatePermission.attr("disabled",true);
	var detailsTable = $("#update_permission_table").DataTable({
		columnDefs: [ {
            orderable: false,
            className: 'select-checkbox',
            targets: 0
        } ],
        "lengthMenu":[
			[5,20],[5,20]
		],
        select: {
        	style: 'multi',
        },
		ajax:{
			"url":"/IssueFeedbackProject/allPermissions",
			"dataSrc":"result",
		},
		rowId:"id",
		columns : [
			{
				data : "permissionName",
				render : function(data, type, row, meta) {
					return data ;
				},
			}
		]
	});
	
	btnUpdatePermissionOk.click(function(event){
		
		var arr = detailsTable.rows(".selected").data();
		var parr = [];
		$.each(arr,function(index,element){
			parr.push(element.id);
		});
		
		console.log($(this).data("dept_id"));
		$.ajax({
			url:"/IssueFeedbackProject/grantPermissionToDept",
			method:"get",
			data:{
				dept_id:$(this).data("dept_id"),
				permissions:parr
			},
			success:function(data){
				if(data.result){
					updatePermissionModal.modal("hide");
					pTable.ajax.reload();
				}
			}
		});
		
	});
	
	btnUpdatePermission.click(function(event){
		updatePermissionModal.modal({
			show:true
		});
		var id = deptTable.rows(".selected").data().id;
		$.ajax({
			url:"/IssueFeedbackProject/getDeptById",
        	method:"get",
        	data:{
        		id:deptTable.rows(".selected").data()[0].id
        	},
        	success:function(data){
        		console.log(data.result.permissionsList);
        		detailsTable.rows().deselect();
        		$.each(data.result.permissionsList,function(index,element){
        			console.log(element.id);
        			detailsTable.rows("#"+element.id).select();
        		});
        	}
		});
		
	});
	
	
	
	var pTable =$("#dept_table_details").DataTable({
		searching:false,
		paging:true,
		ajax:{
			url:"/IssueFeedbackProject/getDeptById?id=1",
			dataSrc:"result.permissionsList"
		},
		"lengthMenu":[
			[5,10,25,-1],[5,10,25,"全部"]
		],
		"language": {
            "lengthMenu": "每页显示 _MENU_ 条记录",
            "zeroRecords": "未查询到任何权限",
            "info": "第 _PAGE_ 页 ，共  _PAGES_页",
            "infoEmpty": "无任何权限",
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
            searchPlaceholder:"请输入查询信息"
        },
        columns:[
        	{
        		data:"permissionName",
        		render:function(data){
        			return data;
        		}
        	}
        ]
	 });
	var deptTable = $("#dept_table").DataTable({
		ajax : {
			"url" : "/IssueFeedbackProject/allDepts",
			"dataSrc" : "result"
		},
		rowId:"id",
		searching:false,
		paging:true,
		select:true,
		"lengthMenu":[
			[5,10,25,-1],[5,10,25,"全部"]
		],
		"language": {
            "lengthMenu": "每页显示 _MENU_ 条记录",
            "zeroRecords": "未查询到任何部门记录",
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
            searchPlaceholder:"请输入查询信息"
        },
		columns : [
			{
				data : "deptName",
				render : function(data, type, row, meta) {
					data+","+row.id 
					return "<div id='dept-"+row.id+"'>"+data+"</div>" ;
				},
			}
		]
	});
	
	 $("#dept_table tbody").on("click","tr",function(event){
		if ($(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            btnUpdatePermission.attr("disabled",true);
        }
        else {
        	deptTable.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            btnUpdatePermission.attr("disabled",false);
            btnUpdatePermissionOk.data("dept_id",$(this).attr("id"));
            
            pTable.ajax.url("/IssueFeedbackProject/getDeptById?id="+$(this).attr("id")).load();
            
            
//            $.ajax({
//            	url:"/IssueFeedbackProject/getDeptById",
//            	method:"get",
//            	data:{
//            		id:$(this).attr("id")
//            	},
//            	success:function(data){
//            		pTable.clear().draw(false);
//            		$.each(data.result.permissionsList,function(index,element){
//            			pTable.row.add([
//            				element.permissionName
//            			]).draw(false);
//            		});
//            		
//            	}
//            });
        }
	});
	
	
});
