<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >

<html>
<head>
<title>实践教学管理系统</title>
<script type="text/javascript">
	//重置
	function reset() {
		$('#name').val('');
		$('#mima').val('');
	}
</script>

<meta name="viewport" content="width=device-width" />
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="http://v3.bootcss.com/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div>
		<c:if test="${param.error}"> 
		<div class="error">登陆失败：您输入的用户名或密码错误
		    请检查是否按下了大写键</div>
		<%-- ${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}  --%>
		</c:if>
	</div>
	<!-- 	<div align="center"> -->
	<!-- 		<form name="loginForm" id="loginForm" method="post" -->
	<!-- 			action="${pageContext.request.contextPath}/j_spring_security_check" -->
	<!-- 			style="width:260px;text-align:center;"> -->
	<!-- 			<fieldset> -->
	<!-- 				<legend></legend> -->
	<!-- 				用户: <input type="text" id="name" name="j_username" -->
	<!-- 					style="width:150px;" -->
	<!-- 					value="${sessionScope['SPRING_SECURITY_LAST_USERNAME']}" /><br /> -->
	<!-- 				密码: <input type="password" id="mima" name="j_password" -->
	<!-- 					style="width:150px;" /><br /> <input type="submit" value="登陆" /> -->
	<!-- 				<input type="reset" value="重置" onclick="reset()" /> -->
	<!-- 			</fieldset> -->
	<!-- 		</form> -->
	<!-- 	</div> -->

	<div class="container">

		<form class="form-signin" role="form"
			action="${pageContext.request.contextPath}/j_spring_security_check"
			name="loginForm" id="loginForm" method="post">
			<h2 class="form-signin-heading">登陆</h2>
			<input type="text" class="form-control" id="name" name="j_username"
				placeholder="在此输入用户名" required autofocus> <input
				type="password" id="mima" name="j_password" class="form-control"
				placeholder="在此输入密码" required>
			<!--  <div class="form-group">
				<label for="user_role">选择登陆角色</label> <select class="form-control">
					<option>管理员</option>
					<option>教师</option>
					<option>学生</option>
				</select>
			</div>-->
			<button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
			<!-- 			<button class="btn btn-lg btn-primary btn-block" type="button" onclick="reset()">重置</button> -->


		</form>

	</div>
</body>
</html>