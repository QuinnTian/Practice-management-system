<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../titlebar.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>创建总结问题</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script language="JavaScript" type="text/javascript">
	//定义了城市的二维数组，里面的顺序跟省份的顺序1相同的。通过selectedIndex获得省份的下标值来得到相应的城市数组
	var q;
	//"<c:forEach var="qt" items="${qlist}">";
	//a = "${qt.title}";
	//alert(a);
	//"</c:forEach>";
	function getCity() {
		//获得省份下拉框的对象
		var sltProvince = document.form1.province;
		//获得城市下拉框的对象
		var sltCity = document.form1.depend;

		//var provinceS = document.getElementById("province").value;
		q = document.getElementById("province").value;
		//alert(q);
		var num = 0;
		var olist = new Array();
		var qolist = new Array();
		var qolisttitle = new Array();
		"<c:forEach var="qt" items="${qlist}">";
		"<c:forEach var="ot" items="${qt.option}">";
		olist[num] = "${ot.id}";
		qolist[num] = "${qt.id}";
		qolisttitle[num] = "${ot.title}";
		num++;
		"</c:forEach>";
		"</c:forEach>";

		num = 0;
		var finalolist = new Array();
		var finalolisttitle = new Array();
		for ( var i = 0; i < olist.length; i++) {
			//alert(olist[i]);
			if (qolist[i] == q) {
				finalolist[num] = olist[i];
				finalolisttitle[num] = qolisttitle[i];
				num++;
			}

			//sltCity[i + 1] = new Option(provinceCity[i], provinceCity[i]);
		}
		//清空城市下拉框，仅留提示选项
		sltCity.length = 1;

		//将城市数组中的值填充到城市下拉框中
		for ( var i = 0; i < finalolist.length; i++) {
			sltCity[i + 1] = new Option(finalolisttitle[i], finalolist[i]);
		}
	}
</script>

</head>

<body>
	<c:if test="${!empty result}">
		<font color="red">${result}</font>
	</c:if>

	
	<br/>
	<br/>
	<br/>
	


	<form action="<%=path %>/summary/question/insert.do" method="post" name="form1">

		<input type="hidden" id="id" name="id" value="${summary.summaryQuestion.id}">
		<input type="hidden" id="questionnaire_id" name="questionnaire_id" value="${summary.id}">
		<div align="center">
			<table class="table">
				<caption align="top" style="font-size:30px">创建总结问题</caption>
				<thead>
					<tr>
						<th>问题标题</th>
						<th>问题类型</th>
						<th>是否有其他选项</th>
						<th>是否必答</th>
						<th>问题样式</th>
						<th>回答学生类型</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><div class="col-sm-15">
								<input type="text" class="form-control" id="title" name="title"
									placeholder="title" value="${summary.summaryQuestion.title}" />
							</div>
						</td>
						<td><select id="type" name="type" class="form-control">
								<option <c:if test="${summary.summaryQuestion.type == '1'}">selected</c:if> value="1">多选</option>
								<option <c:if test="${summary.summaryQuestion.type == '2'}">selected</c:if> value="2">单选</option>
								<option <c:if test="${summary.summaryQuestion.type == '3'}">selected</c:if> value="3">文本</option>
								<option <c:if test="${summary.summaryQuestion.type == '4'}">selected</c:if> value="4">说明</option>
						</select>
						</td>
						<td><select id="other" name="other" class="form-control">
								<option <c:if test="${summary.summaryQuestion.other == '1'}">selected</c:if> value="1">是</option>
								<option <c:if test="${summary.summaryQuestion.other == '0'}">selected</c:if> value="0">否</option>
						</select></td>
						<td><select id="answer" name="answer" class="form-control">
								<option <c:if test="${summary.summaryQuestion.answer == '1'}">selected</c:if> value="1">是</option>
								<option <c:if test="${summary.summaryQuestion.answer == '0'}">selected</c:if> value="0">否</option>
						</select>
						</td>
						<td><select id="style" name="style" class="form-control">
								<option <c:if test="${summary.summaryQuestion.style == '1'}">selected</c:if> value="1">默认</option>
						</select></td>
						<td><select id="type_student" name="type_student" class="form-control">
								<option <c:if test="${summary.summaryQuestion.type_student == '1'}">selected</c:if> value="1">没有工作</option>
								<option <c:if test="${summary.summaryQuestion.type_student == '2'}">selected</c:if> value="2">有工作</option>
								<option <c:if test="${summary.summaryQuestion.type_student == '3'}">selected</c:if> value="3">升学考试</option>		
								<option <c:if test="${summary.summaryQuestion.type_student == '4'}">selected</c:if> value="4">通用问题</option>
						</select></td>
						<td><input class="btn btn-info" type="submit" value="确定"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
</body>
</html>
