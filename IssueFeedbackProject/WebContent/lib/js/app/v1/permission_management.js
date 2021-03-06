/**
 * 用来标记当前所选择的部门
 */
var curremtDeptId = -1;
var permissions = [];
$(document).ready(function() {

	initDeptDrawer();
	btnSave.click(function(event){
		if(curremtDeptId == -1)return;
		btnSave.attr("disabled",true);
		btnSave.text("正在更新。。。");
		$.ajax({
			url:"/IssueFeedbackProject/grantPermissionToDept",
			data:{
				dept_id:curremtDeptId,
				permissions:permissions
			},
			method:"get",
			success:function(data){
				if(data.result){
					setTimeout(() => {
						$('.modal').modal({
							show:true
						});
						btnSave.attr("disabled",false);
						btnSave.text("保存");
					}, 500);
				}
			}
		});
	});

});
/**
 * 初始化左边部门列表
 * 
 * @returns
 */
function initDeptDrawer() {

	$.ajax({
		url : "/IssueFeedbackProject/allDepts",
		method : "get",
		success : function(data) {
			$.each(data.result, function(index, element) {
				$(".my-drawer").append(makeRowForDept(element));
			});
			setListenerForDeptItem();
		}
	});

	$.ajax({
		url : "/IssueFeedbackProject/allPermissions",
		method : "get",
		success : function(data) {
			progressRoot.css("width","100%");
			if(data.result){
				$.each(data.result, function(index, element) {
					var row = makeRowForPermission(element);
					$("#permissionListBody").append(row);
				});
				setListenerForDeptItem();
				setListenerForPermissionItem();
				
				
				setTimeout(() => {
					progressRoot.attr("hidden",true);
				}, 500);
			}
			
		}
	});
}
/**
 * 为每一个权限对象创建一个行标签
 * 
 * @param per
 * @returns
 */
function makeRowForPermission(per) {

	var rowParent = $("<div>").addClass("funkyradio-success");
	var rowChild2 = $("<label>").attr("for", "checkbox-" + per.id).text(
			per.permissionName);
	var rowChild1 = $("<input>").addClass("my-check").attr("type", "checkbox")
			.attr("id", "checkbox-" + per.id);
	rowParent.append(rowChild1).append(rowChild2);
	return rowParent;
}
function setListenerForPermissionItem(){
	$(".my-check").on("change",function(event){
		var length = $(".my-check:checked").length;
		permissions = [];
		console.log("aaaa");
		for(var i = 0 ;i<length ;i++ ){
			permissions.push($(".my-check:checked")[i].id.split("-")[1]);
		}
	});
}
/**
 * 为部门行标签添加点击事件 根据点击的部门记录获取指定的权限
 * 
 * @returns
 */
function setListenerForDeptItem() {
	$(".my-dept-row").on("click", function(event) {
		progressRoot.attr("hidden",false);
		progressRoot.css("width","35%");
		
		// 根据点击的部门记录获取指定的权限
		$.ajax({
			url : "/IssueFeedbackProject/getDeptById",
			method : "get",
			data : {
				id : event.target.id
			},
			success : function(data) {
				progressRoot.css("width","100%");
				curremtDeptId = event.target.id;
				$("#pDeptName").text(event.target.text);
				$(".my-check").prop("checked", false);
				$("#raido-dept-" + event.target.id).prop("checked", true);

				currentPermission = [];
				$.each(data.result.permissionsList, function(index, element) {
					$("#checkbox-" + element.id).prop("checked", true);
					currentPermission.push(element.id);
				});
				setTimeout(() => {
					progressRoot.attr("hidden",true);
				}, 500);
			}
		});
	});

}
/**
 * 为每一个部门对象创建一个行标签
 * 
 * @param dept
 *            部门对象
 * @returns a 标签
 */

function makeRowForDept(dept) {
	var row = $("<a class='mdl-navigation__link'>").addClass("my-dept-row").attr("href", "#").attr("id", dept.id).text(dept.deptName);
	return row;
}

var btnSave = $("#btnSave");
