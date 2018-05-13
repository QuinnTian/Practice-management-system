<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="errorPage.jsp"%>
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
	
</script>
<script type="text/javascript">
	/* function doAdd() {
		var id = document.getElementById("id").value;
		var sa_name = document.getElementById("sa_name").value;//名称
		var sa_category = document.getElementById("sa_category").value;//类别
		var contacts = document.getElementById("contacts").value;//联系人
		var description = $("#desc").val();//描述
		var datasend = "id=" + id + "&sa_name=" + sa_name + "&sa_category="
				+ sa_category + "&contacts=" + contacts + "&description="
				+ description;
		location.href = "doEditSubmit.do?" + datasend;
	} */
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
</script>
</head>
<body>
	<h2>修改学生会社团</h2>
	<br>
	<form name="form1" id="myform" method="post" action="doEditSubmit.do">
		<!--将数据插入到数据库中-->
		<input type="hidden" name="id" id="id" value="${id}">
		<table border="0" width="1000">
			<tr>
				<td width="100">名称：</td>
				<td width="700"><input type="text" id="sa_name" name="sa_name" value="${ass.sa_name}" required="required" /></td>
			</tr>
			<tr>
				<c:set var="sa_category" value="${ass.sa_category}" scope="request" />
				<%
					String sa_category = (String) request.getAttribute("sa_category");
					String sa_category_name = null;
					if (sa_category.equals("1"))
						sa_category_name = "学生会";
					else
						sa_category_name = "社团";
				%>
				<td width="100">类别：</td>
				<td width="700"><input id="sa_category" name="sa_category" disabled="disabled" required="required"
						value="<%=sa_category_name%>"> <!-- 	<option value="1">学生会</option>
						<option value="2">社团</option> --> </input>
			</tr>
			<tr>
				<td width="100">学生会级别：</td>
				<c:set var="sa_level" value=" ${ass.sa_level}" scope="request"></c:set>
				<%
					String sa_level = (String) request.getAttribute("sa_level");
					sa_level = sa_level.trim();
				%>
				<td width="700"><select id="sa_level" name="sa_level" required="required">
						<option value="请选择">请选择</option>
						<%-- 	<option value="1" <%="2012".equals(sa_level) ? "selected" : ""%>>校级</option> --%>
						<option value="2" <%="2".equals(sa_level) ? "selected" : ""%>>院级</option>
						<option value="3" <%="3".equals(sa_level) ? "selected" : ""%>>系级</option>
					</select>
			</tr>
			<tr>
				<td width="120">负责教师所在系部：</td>
				<td width="700"><select id="xibu" name="xibu" onChange="ajaxTeacher()" required="required" style="width:200px;">
						<option value="请选择">请选择</option>
						<c:forEach var="s" items="${Org_Name}" varStatus="stauts">
							<c:choose>
								<c:when test="${s.id==dept_id}">
									<option value="${s.id}" selected="selected">${s.org_name}</option>
								</c:when>
								<c:otherwise>
									<option value="${s.id}">${s.org_name}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td width="100">负责教师：</td>
				<td width="700"><select name="contacts" id="contacts" style="width:200px;" required="required">
						<option value="${ass.sa_tea_id}">${tea_name}</option>
					</select></td>
			</tr>
			<tr>
				<td width="100">描述：</td>
				<td width="800"><textarea id="desc" cols="58" rows="4" name="description" required="required"
						style="overflow-y: scroll;width:500px;">${ass.sa_describe}</textarea></td>
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
