<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>用户角色添加</title>
<script type="text/javascript">
//查出学院所对应的系部名称
	function changexibu(){
	var Org_Name=$("#collegeList_name").val();
	    $.ajax({
				type : "get",
				url : "xibuList.do?Org_Name="+Org_Name, 
				data:Org_Name,
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
				showPractice1(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
	    }
	    function showPractice1(ajaxData) {//根据返回数据显示搜索结果
		$("#xi_id").html(ajaxData);
	    };
</script>
</head>
<body>
<h2 align='center'>参数添加</h2>
	<form name="form1" id="myform" method="post" action="doAddParam.do">
		 <table border="0" width="1000">
		 	<tr>
				<td width="100">所属学院：</td>
				<td width="700">
				<select id="collegeList_name" name="collegeList_name" style="width:200px" onchange="changexibu()">
						<option value="请选择学院">请选择学院</option>
						<c:forEach var="collegeList" items="${collegeList}" varStatus="stauts">
							<option value="${collegeList.id}">${collegeList.org_name}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
			<td width="100">所属系部：</td>
			<td width="700">
			<select id="xi_id" name="xi_id"  style="width:120px">
  			<option value="请选择系部">请选择系部</option>
  			
  	</select>
			</tr>
			<tr>
			<td width="100">学年：</td>
			<td width="700">
			<select name="year" id="param_year">
			<c:forEach var="add_years" items="${add_years}" varStatus="stauts">
							<option value="${add_years}">${add_years}</option>
						</c:forEach>
				</select>
			</tr>
			<tr>
				<td width="100">学期：</td>
				<td width="700">
				<select name="tearm" id="param_tearm">
						<option value="1">第一学期</option>
						<option value="2">第二学期</option>
				</select></td>
			</tr>
			<tr>
				<td width="100">参数编码：</td>
				<td width="300"><input type="text" name="param_code" id="code_id"/>
				</td>
			</tr>
			
			<tr>
				<td width="100">参数名称：</td>
				<td width="300"><input type="text" name="param_name" id="param_id"/>
				</td>
			</tr>
			<tr>
				<td width="100">参数数值：</td>
				<td width="300"><input type="text" name="param_value" id="value_id" style="width:200px" />
				</td>
			</tr>
			<tr>
				<td width="100">状态：</td>
				<td width="300">
				<select name="state" id="state">
						<option value="1">有效</option>
						<option value="2">无效</option>
				</select>
				</td>
			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="submit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./paramList.do'">返回</button>
		</div>
	</form>
</body>
</html>
