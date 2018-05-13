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

<title>My JSP 'index.jsp' starting page</title>
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
	//定义了城市的二维数组，里面的顺序跟省份的顺序是相同的。通过selectedIndex获得省份的下标值来得到相应的城市数组
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
		for (var i = 0; i < olist.length; i++) {
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
		for (var i = 0; i < finalolist.length; i++) {
			sltCity[i + 1] = new Option(finalolisttitle[i], finalolist[i]);
		}
	}
</script>

</head>

<body>
	<div class="container-fluid">

		<c:if test="${!empty result}">
			<font color="red">${result}</font>
		</c:if>

		<br />


		<form
			action="<%=path %>/wjdc/question/${q.questionnaire_id}/insert.do?q_id=${q.id}"
			method="post" name="form1">

			<div align="center">
				<table class="table">
					<caption align="top" style="font-size:30px">创建问卷</caption>
					<thead>
						<tr>
							<th>问题标题</th>
							<th>问题类型</th>
							<th>是否其他</th>
							<th>是否必答</th>
							<th>问题样式</th>
							<th>依赖关系</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><div class="col-sm-15">
									<input type="text" class="form-control" id="title" name="title"
										placeholder="title" value="${q.title}" />
								</div></td>
							<td><select id="type" name="type" class="form-control">
									<option <c:if test="${q.type == '单选'}">selected</c:if>
										value="单选">单选</option>
									<option <c:if test="${q.type == '多选'}">selected</c:if>
										value="多选">多选</option>
									<option <c:if test="${q.type == '文本'}">selected</c:if>
										value="文本">文本</option>
									<option <c:if test="${q.type == '说明'}">selected</c:if>
										value="说明">说明</option>
							</select></td>
							<td><select id="other" name="other" class="form-control">
									<option <c:if test="${q.other == '是'}">selected</c:if>
										value="是">是</option>
									<option <c:if test="${q.other == '否'}">selected</c:if>
										value="否">否</option>
							</select></td>
							<td><select id="answer" name="answer" class="form-control">
									<option <c:if test="${q.answer == '是'}">selected</c:if>
										value="是">是</option>
									<option <c:if test="${q.answer == '否'}">selected</c:if>
										value="否">否</option>
							</select></td>
							<td><select id="style" name="style" class="form-control">
									<option value="默认">默认</option>
							</select></td>
							<td><select id="province" onChange="getCity()"
								class="form-control">
									<option value="">请选择一个问题</option>
									<c:forEach var="qt" items="${qlist}">
										<option value="${qt.id}">${qt.title}</option>
									</c:forEach>
							</select> <select id="depend" name="depend" class="form-control">
									<option value="">无</option>
							</select></td>

							<td><input type="submit" value="确定"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</div>
</body>
</html>
