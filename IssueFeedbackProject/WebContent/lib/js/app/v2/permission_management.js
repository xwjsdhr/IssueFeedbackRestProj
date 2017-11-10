$(document).ready(function(){
	var pTable =$("#dept_table_details").DataTable({
		searching:false,
		paging:false,
	 });
	var deptTable = $("#dept_table").DataTable({
		ajax : {
			"url" : "/IssueFeedbackProject/allDepts",
			"dataSrc" : "result"
		},
		rowId:"id",
		searching:false,
		paging:false,
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
        }
        else {
        	deptTable.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            console.log($(this).attr("id"));
            $.ajax({
            	url:"/IssueFeedbackProject/getDeptById",
            	method:"get",
            	data:{
            		id:$(this).attr("id")
            	},
            	success:function(data){
            		pTable.clear().draw(false);
            		$.each(data.result.permissionsList,function(index,element){
            			pTable.row.add([
            				element.permissionName
            			]).draw(false);
            		});
            		
            	}
            });
        }
	});
	
	 
});
