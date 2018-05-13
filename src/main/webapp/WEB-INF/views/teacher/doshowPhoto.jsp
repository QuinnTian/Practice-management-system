<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>学生照片查看</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
	<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<!-- 2015-01-26 邢志武重新修改 -->
<script type="text/javascript">
	
	function chaGroup(){
		var groupId=$("#groups").val();
		$("#groupId").val(groupId);
		console.log("groupId:"+groupId);
	}
		function ajaxGroupId() {
			$.ajax({
				type : "get",
				contentType : "application/json",
				url : "ajaxStus.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法
					console.log("ajax返回成功");					
					showStus(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
			function getSendData(){
			var val = $("#groupId").val();
			var dataSend = "groupId=" + val;
			return dataSend;
		}
			function showStus(ajaxData){
			 $("table[id='stuTab'] tr[id!='biaotou']").remove();
			 $("#biaotou").after(ajaxData);
		}
	
	
	
</script>
</head>
<body>
	<h2>学生实习照片管理</h2>
	选择任务小组：
	<select onchange="chaGroup()" id="groups">
		<option>请选择</option>
		<c:forEach var="s" items="${result}" varStatus="stauts">
			<option value="${s.id}">${s.group_name}</option>
		</c:forEach>
	</select> 
	<button onclick="ajaxGroupId();">搜索</button>
	<table border="1" width="1000" name="stuTab" id="stuTab">
	<tr id="biaotou">
	<th>班级</th>
	<th>学号</th>
	<th>姓名</th>
	<th>联系电话</th>
	</tr>
	</table>
	<input type="hidden" id="groupId" name="groupId">

</body>



</html>
