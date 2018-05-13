<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width" />

<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://cdn.bootcss.com/jquery/1.8.3/jquery.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>


</head>
<body>


	<div data-role="page">
		<div data-role="header">
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" data-transition="pop"
						data-ajax="false" href="<%=path%>/summary/user/home.htm">返回总结列表</a></li>
				</ul>
			</div>
		</div> 
		<!-- 吴敬国 2015-6-16 按要求去掉上面的返回总结列表，下面加上继续答题，功能同上面功能一样。 -->
		<div data-role="content">
			<h3>${result}</h3>
			<%-- <a data-icon="home" data-transition="pop" data-ajax="false" href="<%=path%>/summary/user/home.htm">继续答题</a> --%>
		</div>
	</div>

</body>
</html>
