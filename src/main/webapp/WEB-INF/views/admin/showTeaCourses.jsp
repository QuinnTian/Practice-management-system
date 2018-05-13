<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>课程安排管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen"
		type="text/css" />
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script> 
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
		
		function getTeaCourse(){
			
			$.ajax({
				type:"get",
				url:"admin/getTeaCourse.do?",
				data:getSendDate(),//即使参数为空 也要有该属性 否则会报错
				datatype:"text",
				success: function(ajaxData){
					setData(ajaxData);
				},
				error: function(result,status){
					if(status=='error'){
						alert("请选择正确的年份或者学期");
					}
				}
				
			});
		}
		
		function getSendDate(){
			var year = $("#year").val();
			var semester = $("#semester").val();
			return "year="+year+"&semester="+semester;
		}
		
		function setData(ajaxData){
			$("table[id='courseTab'] tr[id!='tableHeader']").remove();
			$("#tableHeader").after(ajaxData);
		}
	
		function importButton(){
			var year = $("#year").val();
			var semester = $("#semester").val();
			if(year=="请选择年份" ){
				alert("请选择年份");
				return;
			}
			if(semester=="请选择学期"){
				alert("请选择学期");
				return;
			}
			location.href="admin/courseArrangementImport.do?year="+year+"&semester="+semester;
		}
	</script>
</head>
<body>
	<h2 align='left'>课程安排管理</h2>
	<b>学年：</b>
	<select id="year" name="year" style="width:110px">
		<option value="请选择年份">请选择年份</option>
		<option value="2014">2014-2015</option>
		<option value="2015">2015-2016</option>
		<option value="2016">2016-2017</option>
	</select>
	<b>学期：</b>
	<select id="semester" name="semester" style="width:110px">
	<option value="请选择学期">请选择学期</option>
		<option value="1">1</option>
		<option value="2">2</option>
	</select>
	<input type="button" id="query" name="query" value="查询"onclick="getTeaCourse()"/>
	<input type="button" value="导入" onClick="importButton()">
	&nbsp;&nbsp;
	<input type="button" value="添加" onClick="location.href='admin/courseArrangementAdd.do'"/>
	<table id="courseTab" border="1" width="850" class="sjjx-table" cellspacing="0"
		cellpadding="0">
		<tr id="tableHeader">
			<th width="150">序号</th>
			<th width="150">课程编号</th>
			<th width="150">课程名称</th>
			<th width="150">课程类型</th>
			<th width="300">任课教师</th>
			<th width="150">教工号</th>
		</tr>
		
			
	</table>
</body>
</html>
