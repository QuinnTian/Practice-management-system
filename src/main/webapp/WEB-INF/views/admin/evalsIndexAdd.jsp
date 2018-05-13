<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getServerName() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加评分标准指标</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script>
	function getEvalustand() {// 向服务器发送搜索请求
		$.ajax({
			type : "get",
			/* contentType : "application/json", */
			url : "getStandName.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				showPractice(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getSendData() {
		var year = $("#year").val();
		var dataSend = "year=" + year;
		return dataSend;
	}

	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#standard_id").html(ajaxData);
	};
	function doEdit(){
			if($("#standard_id").val()=="0"){
				alert("指标编码不能为空");
				return null;
			}
			if($("#index_code").val()==""){
				alert("指标编码不能为空");
				return null;
			}else if($("#index_name").val()==""){
				alert("指标名称不能为空");
				return null;
			}else if($("#description").val()==""){
				alert("描述不能为空");
				return null;
			}else if($("#score").val()==""){
				alert("分值不能为空");
				return null;
			}else{
				document.form1.submit();
			}
		}
</script>
</head>

<body>
	<h2>添加评分标准指标</h2>
	<form name="form1" id="form1" method="post"
		action="doAddEvalsIndex.do">
		<table border="0" width="500">
			<tr>
				<td width="120">请选择年份</td>
				<td width="380"><select id="year" name="year"
					onchange="getEvalustand()">
						<option>请选择</option>
						<c:forEach var="year" items="${years}" varStatus="stauts">
							<option value="${year}">${year}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td width="120">评分标准名称：</td>
				<td width="380"><select name="standard_id" id="standard_id"
					style="width:180px">
						<option value="0">请选择标准</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="120">指标编码：</td>
				<td width="380"><input type="text" name="index_code" id="index_code" style="width:180px"/></td>
			</tr>
			<tr>
				<td width="120">指标名称：</td>
				<td width="380"><input type="text" name="index_name" id="index_name" style="width:180px"/></td>
			</tr>
			<tr>
				<td width="120">描述：</td>
				<td width="380">
					<!-- <input type="text" name="description" /> --> <textarea
						name="description" rows="5" id="description" style="width:180px;resize:none"></textarea>
				</td>
			</tr>
			<tr>
				<td width="120">分值：</td>
				<td width="380"><input type="text" name="score" id="score"style="width:180px"/></td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onClick="doEdit()"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="window.location='./evalsIndexList.do'">返回</button>
		</div>
	</form>
</body>
</html>
