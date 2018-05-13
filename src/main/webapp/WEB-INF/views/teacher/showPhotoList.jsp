<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page isELIgnored="false" %>

<title>班级照片显示</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="styles.css">
	
<style type="text/css">

.divda{
width:900px;
hetght:auto;
margin:1px #FF00FF;
float:left;
}

.divxiao{
padding:20px;
float:left;
}

</style>
</head>

<body>
	
<h1 >学生实训照片列表</h1>
	<div class="divda">

			<c:forEach var="s" items="${result}" varStatus="stauts">
					<div class="divxiao" >
				<a href="showPhoto.do?stu_code=${s.STU_CODE}">
				<img src="../${s.POSITION}" height="150" width="100" ><br>
				${s.STU_CODE}<br>	
				${s.TRUE_NAME}
				</a>	
    </div>	
           	
			</c:forEach>
		
	</div>

</body>
</html>
