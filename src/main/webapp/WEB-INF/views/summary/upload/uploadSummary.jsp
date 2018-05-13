<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../../titlebar.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>导入总结</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/starter-template.css" rel="stylesheet">

<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
</head>
</head>

<div class="<element>container-fluid</element>">

	<c:if test="${!empty result}">
		<font size="5" color="red">${result}</font>
	</c:if>

	<br />

	<form action="<%=path%>/summary/uploadSummary.do" method="post"
		id="form" enctype="multipart/form-data">

		<input type="hidden" id="id" name="id" value="${summary.id}">
		<div align="center">
			<table class="table">
				<caption align="top" style="font-size:30px">上传总结模板</caption>
				<thead>
					<tr>
						<th>总结标题</th>
						<th>总结使用者</th>
						<th>总结使用单位</th>
						<th>学制</th>
						<th>年级</th>
						<th>总结类型</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>

							<div class="col-sm-15">
								<input type="text" class="form-control" id="title" name="title"
									placeholder="title" value="${summary.title}" />
							</div></td>
						<td><select id="user_type" name="user_type"
							class="form-control">
								<option <c:if test="${summary.user_type == 1}">selected</c:if>
									value="1">教师</option>
								<option <c:if test="${summary.user_type == 2}">selected</c:if>
									value="2">学生</option>
						</select>
						</td>
						<td><select id="department" name="department"
							class="form-control">

								<c:forEach var="org" items="${org}">
									<option
										<c:if test="${summary.department == org.id}">selected</c:if>
										value="${org.id}">${org.org_name}</option>
								</c:forEach>

						</select>
						</td>
						<td><select id="studyLength" name="studyLength"
							class="form-control">
								<option value="11">专科2.5+0.5</option>
								<option value="12">专科2+1</option>
								<option value="13">专科五年制</option>
								<option value="21">本科3+1</option>
								<option value="22">本科3.5+0.5</option>
								<option value="23">专本连读</option>
						</select>
						</td>
						<td><select id="year" name="year" class="form-control">
								<option value="2012">2012</option>
								<option value="2013">2013</option>
								<option value="2014">2014</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
						</select>
						</td>
						<td><select id="type" name="type" class="form-control">
								<!-- 								<option onclick="div_data_display(1)" -->
								<!-- 									<c:if test="${summary.type == 1}">selected</c:if> value="1">年总结</option> -->
								<option <c:if test="${summary.type == 2}">selected</c:if>
									value="2">月总结</option>
								<!-- 								<option disabled="disabled" -->
								<!-- 									<c:if test="${summary.type == 3}">selected</c:if> value="3">周总结</option> -->
								<!-- 								<option disabled="disabled" -->
								<!-- 									<c:if test="${summary.type == 4}">selected</c:if> value="4">日总结</option> -->
						</select>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="form-group" align="left">
				<label class="col-sm-2 control-label" for="file"> 选择总结文件 </label>
				<div class="col-sm-10">
					<input type="file" id="file" name="file">
				</div>
				<p class="help-block">请上传按照相应格式填写的Excel问卷</p>
			</div>
			<div id="div_month" style="display: block;">
				<table class="table">
					<caption align="top" style="font-size:30px"></caption>
					<thead>
						<tr>
							<th>开始时间</th>
							<th>结束时间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div>
									<input value="${summary.startDate}" id="startDate"
										name="startDate" class="Wdate" type="text"
										onClick="WdatePicker({dateFmt:'yyyy-MM'})" required> <font
										color=red> &lt;- 单击选择日期 </font>
								</div></td>
							<td>
								<div>
									<input value="${summary.endDate }" id="endDate" name="endDate"
										class="Wdate" type="text"
										onClick="WdatePicker({dateFmt:'yyyy-MM'})" required> <font
										color=red> &lt;- 单击选择日期 </font>
								</div></td>
							<td><input class="btn btn-info" type="button" id="save"
								value="确定" onclick="doSave();">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</form>
</div>
<script type="text/javascript">
	function div_data_display(type) {
	}
	function div_data_display_all_none() {
		document.getElementById("div_month").style.display = 'none';
		document.getElementById("div_year").style.display = 'none';
	}
	$("#save").click(function() {
		var title = $("#title").val();//标题
		var department = $("#department").val();//使用单位
		var startDate = $("#startDate").val();//开始时间
		var endDate = $("#endDate").val();//结束时间
		if (title == "") {
			alert("请填写标题！");
			return;
		}
		 if (department == null) {
			alert("请选择使用单位");
			return;
		} 
		if (startDate == "") {
			alert("请选择开始时间！");
			return;
		}
		if (endDate == "") {
			alert("请选择结束时间！");
			return;
		}
		if (startDate>endDate ) {
			alert("开始时间不能大于结束时间！");
			return;
		}
		$("#form").submit();
	});
</script>
</body>
</html>
