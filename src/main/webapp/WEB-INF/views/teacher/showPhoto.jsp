<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'showPhoto.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <h1 align="left">学生实训信息</h1>
 <table border="1" width="800" align="center">
			<c:forEach var="s" items="${result}" varStatus="stauts" >		
				<tr><td colspan="2"><img src="../${s.position}" height="200"width="160"></td></tr>
				<tr><td>学号</td><td>${s.stu_code}</td></tr><br>
				<tr><td>姓名</td><td>${s.true_name}</td></tr><br>
				<tr><td>个人联系电话</td><td>${s.phone}</td></tr><br>
				<tr><td>家庭联系电话</td><td>${s.home_phone}</td></tr><br>
				<tr><td>家庭住址</td><td>${s.home_addr}</td></tr><br>
				<tr><td>email</td><td>${s.email}</td></tr><br>
				<tr><td>QQ</td><td>${s.QQNUM}</td></tr><br>
				</div>
		</c:forEach>
		</div>		
	</table>
    	
  </body>
</html>
