<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML >
<html>
<head>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>添加学生会成员</title>
<script type="text/javascript">
//接受ajax从后台传来的数据
	var getAjaxData;
	function setValues() {
		var province = document.getElementById("id");
		var pindex = province.selectedIndex;
		var pValue = province.options[pindex].value;
		var pText = province.options[pindex].text;
		document.getElementById("org_name").value = pText;
	}
	function check() {
		$.ajax({
			type : "get",
			/* contentType : "application/json", */
			url : "checkStuCode.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为text                
			success : function(data) { //成功时执行的方法					
				eval("getAjaxData="+data); 
				showPractice(getAjaxData.temp1);
				$("#true_name").attr("value",getAjaxData.true_name);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert("error");
				}
			}
		});
	}
	function getSendData() {
		var stu_code = $("#stu_code").val();
		var assication_id = $("#id").val();
		var dataSend = "stu_code=" + stu_code + "&assication_id="
				+ assication_id;
		return dataSend;
	}

	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#infor").html(ajaxData);
	};
	function doAdd() {
	 	if($("#stu_code").val()==""){
	 		alert("学号不能为空哦！");
	 		return;
	 	}else if($("#infor").text()=="学号已经在该组织内"){
	 		alert(getAjaxData.true_name+"已经在该组织中");
	 		return;
	 	}else if($("#infor").text()=="系统没有该学号"){
	 		alert("系统不能识别该学号，请您先找管理员添加该学号！");
	 		return;
	 	}else if($("#true_name").val()==""){
	 		alert("姓名不能为空哦！");
	 		return;
	 	}else if($("#duties").val()==""){
	 		alert("职务不能为空哦！");
	 		return;
	 	}else{
	 		document.form1.submit();
	 	}
	}
</script>
</head>
<body>
	<h2 align='left'>成员添加</h2>
	<form name="form1" id="form1" method="post" action="doSaveStuUnionMember.do">
		<input type="hidden" name="id" value="${id}" id="id" />
		<table border="0" width="400">
			<tr>
				<td width="70">学号：</td>
				<td width="600"><input type="text" name="stu_code" required="required" onblur="check()" id="stu_code"
						onkeyup="value=value.replace(/[^\d]/g,'')"><font color="red"><span id="infor"></span></font></td>
			</tr>
			<tr>
				<td width="70">姓名：</td>
				<td width="600"><input type="text" id="true_name" name="true_name" required="required"></td>
			</tr>
			<tr>
				<td width="100">性别：</td>
				<td width="600"><select name="sex" id="sex" required="required">
						<option value="男">男</option>
						<option value="女">女</option>
					</select></td>
			</tr>
			<tr>
				<td width="70">职务：</td>
				<td width=""><select name="duties" id="duties" required="required">
						<option value="1">学生会主席</option>
						<option value="2">学生会副主席</option>
						<option value="3">部长</option>
						<option value="4">副部长</option>
						<option value="5">普通干事</option>
					</select>
			</tr>
			<tr>
				<td width="70">负责学生角色：</td>
				<td width="600"><select name="role_id" id="role_id" required="required">
						<option value="0">请选择</option>
						<c:forEach var="roleList" items="${roleList}" varStatus="stauts">
							<option value="${roleList.id}">${roleList.role_name}</option>
						</c:forEach>

					</select>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doAdd()" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./seeStuUnionMemberDetail.do?id=${id}'">返回</button>
		</div>
	</form>
</body>
</html>


