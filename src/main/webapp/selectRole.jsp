<%@ page  import="com.sict.service.DictionaryService"  language="java" contentType="text/html; charset=UTF-8"
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
<link href="css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/signin.css"
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="http://v3.bootcss.com/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<script language="javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	function toMainPage(){
		var sele=$("#roles option:selected").val();
		var mainPage="";
		if(sele=="ROLE_ADMIN")
		{
			mainPage="admin/index.do";
		}
		else if(sele=="ROLE_TEACHER")
		{
			mainPage="teacher/index.do";
		}
		else if(sele=="ROLE_LEADER")
		{
			mainPage="leader/index.do";
		}
	
		window.location.href=mainPage;
	}
	</script>
</head>
<body>
	  <div class="container">
		<form class="form-signin" action="" name="loginForm" id="loginForm" method="post">
			<div class="form-group">
				<h2 class="form-signin-heading">请您选择登录角色：</h2> 
				<select class="form-control"name="roles" id="roles" >
					<c:forEach var="role" items="${user_role}" varStatus="stauts">
						<option class="form-control" value="${role}">
							<c:set var="ro" value="${role}" scope="request"></c:set>
							<% String id=(String)request.getAttribute("ro"); %>
							<%= DictionaryService.findRole(id).getRole_name() %>
						</option>
					</c:forEach> 
				</select>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="button" onclick="toMainPage()">登陆</button>
		</form>

	</div>
</body>
</html>