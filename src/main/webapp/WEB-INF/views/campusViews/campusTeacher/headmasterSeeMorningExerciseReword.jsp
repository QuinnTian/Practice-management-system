<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<base href="<%=basePath%>">
<title>My JSP 'seeMorningExerciseReword.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="/springmvc_mybatis/css/datatables/jquery.dataTables.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="/springmvc_mybatis/js/datatables/jquery.dataTables.min.js"></script>

<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>

<script type="text/javascript">
	function ajaxGetDailyIns() {
		var begin_time =$("#begin_Time").val();
		var year=$("#year").val();
		var leibie=$("#leibie").val();
		if(begin_time==null || begin_time==""){
			alert("请选择查询日期");
			return ;
		}
		if(year=="0"){
			alert("请选择查询年级");
			return ;
		}
		if(leibie=="0"){
			alert("请选择查询类别");
			return ;
		}
		$.ajax({
			type : "get",
			/* contentType : "application/json", */
			url : "CampusTeacher/web/ajaxGetDailyIns.do?",
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
	function showPractice(ajaxData){
		//$("#tableHead").after().remove();
		$("table[id='teaTable'] tr[id!='tableHead']").remove();
		$("#tableHead").after(ajaxData);
	}
	function getSendData() {
			var begin_Time = $("#begin_Time").val();	
			var year = $("#year").val();	
			var leibie=$("#leibie").val();
			var dataSend = "begin_Time=" + begin_Time+"&year="+year+"&leibie="+leibie;			
			return dataSend;
		}
</script>

</head>
<body>
	<h2>早操记录</h2>
	<br>
	<b>日期：</b>
	<input type="text" name="begin_Time" id="begin_Time" class="Wdate"
		onClick="WdatePicker()" placeholder="单击选择日期">
	&nbsp;
	<b>年级：</b>
	<select id="year" name="year">
		<option value="0">请选择年级</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<option value="2016">2016</option>
		<option value="2017">2017</option>
	</select>
	&nbsp;
	<b>量化类别</b>
	<select id="leibie" name="leibie">
		<option value="0">请选择量化类别</option>
		<option value="1">早操</option>
		<option value="2">晚自习</option>
		<option value="3">服务学习</option>
		<option value="4">宿舍检查</option>
		<option value="5">宿舍违禁</option>
	</select>
	<input type="button" value="查询" id="select" onclick="ajaxGetDailyIns()"/>
	<form name="form1" method="post" action="#">
	<table id="teaTable" border="1" width="1300" class="sjjx-table" cellspacing="0" cellpadding="0">
			<tr id="tableHead">
				<th width="100">班级：</th>
				<th width="100">分数：</th>
				<th width="100">扣分情况：</th>
			</tr>
			 <c:forEach var="orgList" items="${orgList}" varStatus="stauts">
			<tr>
				 <td>
				 <c:set var="pn" value="${orgList.sdi_class_id}" scope="request"></c:set>
							<%
								String sdi_class_id = (String) request.getAttribute("pn");
								out.println(DictionaryService.findOrg(sdi_class_id).getOrg_name());
							%>
				
				</td>
				<td>${orgList.sum_grade}</td>
				<td>${orgList.temp1}</td>
			</tr>
		</c:forEach>
		</table>
	</form>
</body>

</html>
