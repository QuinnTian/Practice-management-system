<%@page import="com.sict.service.DictionaryService"%>
<%@page import="com.sict.common.CommonSession"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%

	String p_home = request.getContextPath();
%>

<!DOCTYPE html>
<!-- saved from url=(0048)http://v3.bootcss.com/examples/starter-template/ -->
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- <link rel="icon" href="http://v3.bootcss.com/favicon.ico"> -->
<link rel="shortcut icon" type="image/x-icon" href="<%=p_home%>/images/sict.png">
<style type="text/css">
.modal {
	width: 100%;
	position: fixed;
	text-align: center;
	margin: 0px auto;
	top: 0px;
	left: 0px;
	bottom: 0px;
	right: 0px;
	z-index: 1050;
}

body {
	font-family: "Microsoft YaHei" ! important;
}
</style>

<title>实习总结</title>

<link href="<%=p_home %>/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=p_home %>/css/starter-template.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=p_home%>/css/datatables/jquery.dataTables.css">
<style type="text/css">
object,embed {
	-webkit-animation-duration: .001s;
	-webkit-animation-name: playerInserted;
	-ms-animation-duration: .001s;
	-ms-animation-name: playerInserted;
	-o-animation-duration: .001s;
	-o-animation-name: playerInserted;
	animation-duration: .001s;
	animation-name: playerInserted;
}

@
-webkit-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
-ms-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
-o-keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}

}
@
keyframes playerInserted {
	from {opacity: 0.99;
}

to {
	opacity: 1;
}
}
</style>
<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
.en-markup-crop-options {
	top: 18px !important;
	left: 50% !important;
	margin-left: -100px !important;
	width: 200px !important;
	border: 2px rgba(255, 255, 255, .38) solid !important;
	border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
	margin-left: 0px !important;
}
</style>


</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				
				</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="<%=p_home %>/summary/user/home.htm ">月总结</a>
				</ul>
				<ul class="nav navbar-nav navbar-right hidden-sm">
				
					<li>
					
					<%--<a>当前用户角色：
					</a>
					</li>
					<li>
					
					<a style="color: black;">
					
					<select name="roles" id="roles" onchange="changeUserRole(this)">
						<c:forEach var="role" items="${user_role}" varStatus="stauts">
							<c:set var="nowUserRole" value="<%=CommonSession.getUserRole(session)%>" scope="request"></c:set>
							<option <c:if test="${role == nowUserRole}">selected</c:if> value="${role}">
								<c:set var="ro" value="${role}" scope="request"></c:set>
								<%
									String id = (String) request.getAttribute("ro");
								%>
								<%
									out.println(DictionaryService.findRole(id).getRole_name());
								%>
							</option>
						</c:forEach>
					</select>
					--%></a>
					</li>
					
				
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<!-- 弹出对话框 -->
	<div class="modal fade" id="tip" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">提示</h4>
				</div>
				<div id="myModalBody" class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	
	
	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script src="http://cdn.bootcss.com/bootbox.js/4.4.0/bootbox.min.js"></script>
	<script type="text/javascript" src="<%=p_home%>/js/datatables/jquery.dataTables.min.js"></script>
	
	<script type="text/javascript">
	
		function changeUserRole(role){
			
			
			$.ajax({
				url : '<%=p_home%>/changeUserRole.do?roleName='+role.value,
				type : "get",
				data : null,
				success : function() {
					
					location.reload();					
				}
			});
			
		}
		
	
	</script>

</body>
</html>
