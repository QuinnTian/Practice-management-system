<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<base href="<%=basePath%>">
<title>招聘信息修改</title>

<style type="text/css">
.div {
	border: 1px solid #F00;
	width: 300px;
}

h2 {
	text-align: left;
}
</style>
<script type="text/javascript">
function saveCommany() {//jquery获取复选框值
		var industry = $("#industry").val();
		var com_id = $("#com_id").val();
		var post_id = $("#post_id").val();
		var recruit_prof = $("#recruit_prof").val();
		var recruit_desc = $("#recruit_desc").val();
		var recruit_num = $("#recruit_num").val();
		var recruit_eff = $("#recruit_eff").val();
		var recruit_end = $("#recruit_end").val();

		if (industry == "0") {

			alert("请选择所属行业！");
			return;
		}
		if (com_id == "0") {

			alert("请选择企业！");
			return;
		}
		if (post_id == "") {

			alert("请填写岗位名称！");
			return;
		}
		if (recruit_prof == "") {

			alert("请填写招聘的专业！");
			return;
		}
		if (recruit_desc == "") {

			alert("请填写招聘描述！");
			return;
		}
	
		if (recruit_num == "") {
		
			alert("请填写招聘人数！");
			return;
		}
		
		if (recruit_eff == "") {

			alert("请选择生效时间！");
			return;
		}
		if (recruit_end == "") {

			alert("请选择结束时间！");
			return;
		}
		if (recruit_end < recruit_eff) {
			alert("结束时间不能够早于开始时间，请重新选择！");
			return null;
		}

		document.forms[0].submit();
	}
</script>


</head>
<body>
	<h2>招聘信息修改</h2>
	<form name="form1" method="post" action="admin/doEditRecruitInfo.do">
		<input type="hidden" name="id" name="id" value="${recruitInfo.id}">
		<table border="0" width="400">

			<tr>
				<c:set var="com_id" value="${recruitInfo.com_id}" scope="request"></c:set>
				<%
					String com_id = (String) request.getAttribute("com_id");
				%>
				<c:set var="post_id" value="${recruitInfo.post_id}" scope="request"></c:set>
				<%
					String post_id = (String) request.getAttribute("post_id");
				%>

				<td width="100">企业名称：</td>
				<td width="300"><input type="hidden" name="com_id" id="com_id"
					value="${recruitInfo.com_id}"> <input type="text"
					value="<%out.println(DictionaryService.findCompany(com_id).getCom_name());%>" readonly="readonly">
				</td>
			</tr>

			<tr>
				<td width="100">岗位名称：</td>
				<td width="300">
				<input type="text" id="post_id"  name="post_id"
				value="${recruitInfo.post_id}">
				
				<%-- <select name="post_id" id="post_id"
					style="font-family: sans-serif">
						<option value="0">请选择</option>
						<c:forEach var="r" items="${r2}" varStatus="stauts">
							<option value="${r.id}">${r.post_name}</option>
						</c:forEach>
				</select></td> --%>
			</tr>
			<tr>
				<td width="100">招聘专业：</td>
				<td width="300"><input type="text" name="recruit_prof" id="recruit_prof"
					value="${recruitInfo.recruit_prof}">
				</td>
			</tr>
			<tr>
				<td width="100">招聘描述：</td>
				<td width="300"><textarea name="recruit_desc" id="recruit_desc" rows="5" cols="30">${recruitInfo.recruit_desc}</textarea>
				</td>
			</tr>

			<tr>
				<td width="100">招聘人数：</td>
				<td width="300"><input type="text" name="recruit_num" id="recruit_num"
					value="${recruitInfo.recruit_num}">
				</td>
			</tr>

			<tr>
				<td width="100" >生效日期：</td>
				<td width="300">
				<c:set var="effect_time" value="${recruitInfo.effect_time}" scope="request"></c:set>
				<%
					String e_time=(String) request.getAttribute("effect_time").toString().subSequence(0, 10);
				 %>
				
				
				
				<input type="text"  class="Wdate"
					onClick="WdatePicker()" name="effect_time" id="effect_time"
					value="<%=e_time%>">
				</td>
			</tr>
			<tr>
				<td width="100">失效日期：</td>
				<td width="300">
				<c:set var="end_time" value="${recruitInfo.end_time}" scope="request"></c:set>
				<%
					String end_time=(String) request.getAttribute("end_time").toString().subSequence(0, 10);
				 %>
				<input type="text" name="end_time" id="end_time"
					class="Wdate" onClick="WdatePicker()"
					value="<%=end_time%> ">
				</td>
			</tr>
			<tr>
				<td width="100">状态：</td>
				<td width="300"><select name="state">
						<option value="1">有效</option>
						<option value="2">无效</option>
				</select>
				</td>
			</tr>
		</table>

		<%-- 	<div id="positionType">
			企业类别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="type3"
				id="type3" value="${recruitInfo.type3}" />&nbsp;&nbsp;<font
				color="red">*点击选择</font><input type="button" value="隐藏类型" /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="type1"
				id="type1" value="${recruitInfo.type1}" /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" name="type2"
				id="type2" value="${recruitInfo.type2}" /><br />
			<div id="positionTree" style="border:solid 1px red; display:none;"
				class="div">
				<ul>
					<li>
						<!-- Define where the tree should appear -->
						<div id="tree"></div>
						<div id="selectedNode"></div>
					</li>
				</ul>
			</div>
		</div> --%>

		<div style="margin-top:20px;">
			<input type="submit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button"
				onclick="window.location='./admin/recruitInfoList.do'">返回</button>
		</div>
	</form>
</body>
</html>





















