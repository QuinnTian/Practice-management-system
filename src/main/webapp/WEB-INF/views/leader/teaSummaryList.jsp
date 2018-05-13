<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script language="javascript" type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<title>教师工作总结列表</title>
<script type="text/javascript">
	//ajax 获取系级别的老师
	function ajaxTeacher() {// 向服务器发送搜索请求
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxteacher.do?",
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
		console.log(ajaxData);
		$("#teacher").html(ajaxData);

	}
	function getXiData() {
		var val = $("#xibu").val();
		var dataSend = "xibu=" + val;
		return dataSend;
	}
</script>

<script type="text/javascript">
	function ajaxTeasDieRecs() {
		$.ajax({
			type : "get",
			/* contentType : "application/json", */
			url : "ajaxTeasSummarys.do?",
			data : sendData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				$("table[id='table'] tr[id!='tr']").remove();
				$("#tr").after(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function sendData() {
		var tea_id = encodeURI($("#teacher").val());
		tea_id = encodeURI(tea_id);
		var deptment_id = $("#xibu").val();
		var month = $("#month").val();
		var dataSend = "tea_idAnddeptment_id=" + tea_id + "-" + deptment_id + "*" + month;
		return dataSend;
	}
</script>
</head>
<body>
	<h2 align="left">教师工作总结管理</h2>
	<c:set var="summary_orgname" value="${summary_orgname}" scope="request"></c:set>
	<%
		String summary_orgname = (String) request.getAttribute("summary_orgname");
	%>
	选择条件：院系
	<select id="xibu" name="xibu" onchange="ajaxTeacher()">
		<option value="0">请选择</option>
		<c:forEach var="summary_orgs" items="${summary_orgs}">
			<option value="${summary_orgs.id }"
				<c:if test="${summary_orgs.org_name==summary_orgname}"> selected</c:if>>${summary_orgs.org_name}</option>
		</c:forEach>
	</select> 教师
	<select id="teacher" name="teacher" onchange="ajaxTeasDieRecs()">
		<option value="0">请选择</option>
		<c:forEach var="diec_tea" items="${summary_tealist}">
			<option value="${diec_tea.id }">${diec_tea.true_name}</option>
		</c:forEach>
	</select> 月份
	<input id="month" value="${summary.startDate}" name="month"
		class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM'})">
	<input type="button" value="查询" onclick="ajaxTeasDieRecs()">
	<table id="table" border="1" width="1000" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr id="tr">
			<td width="115">实习任务</td>
			<td width="115">标题</td>
			<td width="80">开始时间</td>
			<td width="80">结束时间</td>
			<td width="100">指导地点</td>
			<!-- <td width="120">指导组织</td> -->
			<td width="250">指导学生</td>
			<!-- <td width="170">文字描述</td> -->
		</tr>
		<c:forEach var="direct" items="${summaryList}" varStatus="stauts">
			<c:set var="practice_id" value="${direct.practice_id}"
				scope="request"></c:set>
			<%
				String practice_id = (String) request.getAttribute("practice_id");
			%>
			<c:set var="stu_id" value="${direct.stu_id}" scope="request"></c:set>
			<%
				String stu_id = (String) request.getAttribute("stu_id");
			%>

			<tr>
				<td>
					<%
						out.println(DictionaryService.findPracticeTask(practice_id).getTask_name());
					%>
				</td>
				<td><a href="editTeaSummary.do?id=${direct.id}">${direct.title}</a>
				</td>
				<td><fmt:parseDate value="${direct.direct_time}"
						var="direct_time" /> <fmt:formatDate value="${direct_time}"
						pattern="yyyy/MM/dd" /></td>
				<td>${direct.temp2}</td>
				<td>${direct.direct_place}</td>
				<td>
					<%
						String stuts = stu_id;
							StringBuffer bf = new StringBuffer();
							String[] sts = stuts.split(",");
							for (int i = 0; i < sts.length; i++) {
								String stuName = DictionaryService.findStudent(sts[i])
										.getTrue_name();
								bf.append(stuName + "、");
							}
							bf.deleteCharAt(bf.length() - 1);
							out.println(bf);
					%>
				</td>
				<%-- <td>${direct.stu_id}</td>	 --%>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
