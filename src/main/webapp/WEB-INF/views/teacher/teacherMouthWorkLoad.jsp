<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ page import="java.util.Calendar"%>
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
<title>教师工作量查看</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	function changeMouth() {
		var grade = $("#grade").val();
		if (grade == "0") {
			alert("请选择实习任务");
		} else {
			$.ajax({
				type : "post",
				url : "getTeacherMouthWorkload.do",
				data : "grade=" + grade, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                 
				success : function(data) { //成功时执行的方法					
					showTeacherMouthWorkload(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert("暂无查询数据");
					}
				}
			});
		}
	}

	function showTeacherMouthWorkload(ajaxData) {
		$("table[id='table'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	}
</script>
</head>
<body>

	<h2 align="left">${tea.true_name}老师</span>月工作量统计
	</h2>
	工作量计算方法：（合格实习人数/50）*9*4*系数（1或0.7）[注：合格人数：以学生上传实习月总结并且老师已批阅的数量为准，系数：老师上传工作本月总结系数为1，未上传为0.7]
	<br> 月完成度计算方法：月完成工作量/工作量（全部完成）
	<br> 实习任务：
	<select id="grade" name="grade">
		<option value="0">请选择</option>
		<c:forEach var="s" items="${result}" varStatus="stauts">
			<option value="${s.grade}">${s.task_name}</option>
		</c:forEach>
	</select>
	<input type="button" onclick="changeMouth()" value="查看" />
	<table id="table" border="1" width="300" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<td width="10">序号</td>
			<td width="50">任务时间</td>
			<td width="100">实习任务</td>
			<td width="30">合格人数</td>
			<td width="30">实习人数</td>
			<td width="30">月总结系数</td>
			<td width="30">月完成工作量</td>
			<td width="30">月完成度</td>
		</tr>
		<c:forEach var="tea" items="${t}" varStatus="stauts">
			<tr>
				<c:set var="prc" value="${tea.prac_id}" scope="request">
				</c:set>
				<td width="10">${stauts.index+1}</td>
				<td width="50">${tea.temp1}</td>
				<td width="100" align="left">
					<%
						String prc_id = (String) request.getAttribute("prc");
							out.println(DictionaryService.findPracticeTask(prc_id)
									.getTask_name());
					%>
				</td>
				<td width="30">${tea.qualifiedCount}</td>
				<td width="30">${tea.studentSize}</td>
				<td width="30">${tea.yesOrNo}</td>
				<td width="30">${tea.score}</td>
				<td width="30">${tea.theoryApicScore}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
