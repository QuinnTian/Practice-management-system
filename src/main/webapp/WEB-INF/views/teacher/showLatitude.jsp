<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getServerName() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>修改合理区域</title>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function ggg() {// 向服务器发送学生Id
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "qshowLatitude.do?",
			data : getId(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json   
			success : function(data) { //成功时执行的方法
				showjingweidu(data);
			},
			error : function(result, sid) { //出错时会执行这里的回调函数                     
				if (sid == 'error') {
					console.log("调用失败");
				}
			}
		});

	}

	function getId() {
		var id = $("#id").val();
		console.log("dddddddd+++:" + id);
		var dataId = "id=" + id;
		return dataId;
	}

	function showjingweidu(ajaxData) {
		console.log("ajaxData:" + ajaxData);
		var jingweidu = eval(ajaxData);
		if (jingweidu != null) {
			if(confirm("友情提示：合理地区将修改为学生当前所在地区："+jingweidu.temp3))
				{
					$("#LATITUDE_R").val(jingweidu.latitude);
					$("#LONGITUDE_R").val(jingweidu.longitude);
					document.getElementById("myform").submit();
				}
			
		}
	}
</script>
</head>
<body>
	<h2>修改合理区域</h2>
	<form name="form" id="myform" method="post" action="saveLatitude.do">
		<c:set var="ss" value="${result.stu_id}" scope="request">
		</c:set>
		<table border="0" width="700">
			<tr>
				<td>姓名 ： <%
					String true_name = (String) request.getAttribute("ss");
				%> 
				<%
 					out.println(DictionaryService.findStudent(true_name).getTrue_name());
 				%>
				</td>
				<td>联系方式 ： <%
					String phone = (String) request.getAttribute("ss");
				%> <%
 				out.println(DictionaryService.findStudent(phone).getPhone());
				 %>
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td>学号 ： <%
					String code = (String) request.getAttribute("ss");
				%> <%
 					out.println(DictionaryService.findStudent(code).getStu_code());
 				%>
				</td>
				<td>家庭住址： <%
					String home = (String) request.getAttribute("ss");
				%> <%
 			out.println(DictionaryService.findStudent(home).getHome_addr());
 				%>
				</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td> <input width="220" type="hidden" readonly="readonly" id="LATITUDE_R"
					name="LATITUDE_R"  value="${result.latitude_r}">
					合理地区：${city}
				</td>
				<td>起始时间 ： <input width="250" type="text"  id="begin_time"
					name="begin_time" class="Wdate" onClick="WdatePicker()"
					placeholder="单击选择日期" value="${result.begin_time}"></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td><input width="220" type="hidden" readonly="readonly" id="LONGITUDE_R"
					name="LONGITUDE_R" 
					value="${result.longitude_r}">
					当前位置：${city2}</td>
				<td>终止时间 ： <input width="250" type="text" id="end_time"
					name="end_time" class="Wdate" onClick="WdatePicker()"
					placeholder="单击选择日期" value="${result.end_time}"></td>
			</tr>
			<tr>
			</tr>
		</table>
		<input type="hidden" id="aid" name="aid" value="${result.id}" /> <input
			type="hidden" id="id" name="id" value="${result.stu_id}" /> <br>
		<%--<input type="button" onclick="ggg()" value="调整为今日签到的经纬度" />

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%><input
			type="button"  onclick="ggg()" value="设置当前区域为合理区域" />

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

		<button type="button" onclick="window.location='./bMap.do'">返回</button>

</form>
</body>
</html>
