<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>添加学生会社团</title>
<script language="javascript" type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}

.div {
	border: 1px solid #F00;
	width: 300px;
}
</style>
<script type="text/javascript">
	//ajax 获取系级别的老师
	function ajaxTeacher() {
		$.ajax({
			type : "get",
			url : "ajaxPk_teacher.do?",
			data : getXiData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showTeachers(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}
	function showTeachers(ajaxData) {
		$("#contacts").html(ajaxData);
	}
	function getXiData() {
		var val = $("#xibu").val();
		var dataSend = "xibu=" + val;
		return dataSend;
	}
	$(function() {
		$("#system").hide();
		
		$("#sa_level").change(function() {
			if($("#sa_level").val()==3){
				$("#system").show();
			}
		
		});

	});
	/* //保存验证
	function doAdd() {
		var sa_code = document.getElementById("sa_code").value;
		var sa_name = document.getElementById("sa_name").value;//名称
		var sa_category = document.getElementById("sa_category").value;//类别
		var xibu = document.getElementById("xibu").value;//系部
		var contacts = document.getElementById("contacts").value;//联系人
		var description = $("#desc").val();//描述
		var datasend = "sa_code=" + sa_code + "&sa_name=" + sa_name
				+ "&sa_category=" + sa_category + "&xibu=" + xibu
				+ "&contacts=" + contacts + "&description=" + description;
		location.href = "doAddAss.do?" + datasend;
	}

	$(function() {
		$("#level").hide();
		
		$("#sa_category").change(function() {
			if($("#sa_category").val()==1){
				$("#level").show();
			}
		
		});

	});
	 */
</script>
</head>
<body>
	<h2>添加学生会社团</h2>
	<br>
	<form name="form1" id="myform" method="post" action="doAddAss.do">
		<input type="hidden" value="${sa_code}" name="sa_code" />
		<!--将数据插入到数据库中-->
		<table border="0" width="1000">
			<tr>
				<td width="100">名称：</td>
				<td width="700"><input type="text" name="sa_name" id="sa_name" required="required" onblur="ajaxAssNameRepeat()"
						placeholder="" /> <font color="red"><span id="saName_infor"></span> </font><br></td>
			</tr>
			<tr>
				<td width="100">类别：</td>
				<td width="700"><select id="sa_category" name="sa_category" onchange="aa()">
						<option value="请选择" selected="selected" required="required">请选择</option>
						<option value="1">学生会</option>
						<option value="2">社团</option>
					</select>
			</tr>
			<tr id="level">
				<td width="100">学生会级别：</td>
				<td width="700"><select id="sa_level" name="sa_level" required="required">
						<option value="请选择" selected="selected">请选择</option>
						<!-- 	<option value="1">校级</option> -->
						<option value="2">院级</option>
						<option value="3">系级</option>
					</select>
			</tr>
			<tr id="system">
				<td width="100">所在系：</td>
				<td width="700"><select id="system" name="system" required="required">
							<option value="请选择" selected="selected">请选择</option>
						<c:forEach var="dep" items="${departmentlist}" varStatus="stauts">
							<option value="${dep.id}">${dep.org_name}</option>
						</c:forEach>
					</select>
			</tr>
			<tr>
				<td width="180">负责教师所在系部：</td>
				<td width="700"><select id="xibu" name="xibu" onChange="ajaxTeacher()" required="required" style="width:200px;">
						<option value="请选择" selected="selected">请选择</option>
						<c:forEach var="s" items="${Org_Name}" varStatus="stauts">
							<option value="${s.id}">${s.org_name}</option>
						</c:forEach>
					</select></td>
			</tr>
			
			<tr>
				<td width="100">负责教师：</td>
				<td width="700"><select name="contacts" id="contacts" style="width:200px;" /></select></td>
			</tr>
			<tr>
				<td width="180">负责教师角色：</td>
				<td width="700">
					<select id="role_id" name="role_id"  style="width:200px;">
							<option value="请选择">请选择</option>
							<c:forEach var="roleList" items="${roleList}" varStatus="stauts">
								<option value="${roleList.id}">${roleList.role_name}</option>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td width="100">描述：</td>
				<td width="800"><textarea id="desc" name="desc" required="required" style="resize:none"
						onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);" cols="58" rows="4"
						style="overflow-y: scroll;width:500px;"></textarea></td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="submit" value="保存" onclick="doAdd()" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="window.location='./associationList.do'">返回</button>
		</div>
	</form>
</body>
</html>
