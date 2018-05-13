<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String p_home = request.getContextPath();
%>

<title>My JSP 'ys.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="width=device-width" />
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


</head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
		  <a class="navbar-brand" style="color:white;" href="<%=p_home %>/login.do">首页</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
<!--             <li><a style="color:white;" href="#">首页</a></li> -->
<!--             <li><a href="user/home.htm" style="color:white;">个人中心</a></li> -->
            <li><a href="#contact" style="color:white;">关于</a></li>
<!--             <li><a href="user/quit.do" style="color:white;">退出</a></li> -->
<!--             <li class="dropdown"> -->
<!--               <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a> -->
<!--               <ul class="dropdown-menu" role="menu"> -->
<!--                 <li><a href="#">Action</a></li> -->
<!--                 <li><a href="#">Another action</a></li> -->
<!--                 <li><a href="#">Something else here</a></li> -->
<!--                 <li class="divider"></li> -->
<!--                 <li class="dropdown-header">Nav header</li> -->
<!--                 <li><a href="#">Separated link</a></li> -->
<!--                 <li><a href="#">One more separated link</a></li> -->
<!--               </ul> -->
<!--             </li> -->
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

	

<!-- 	<script -->
<!-- 		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<!-- 	<script src="http://v3.bootcss.com/dist/js/bootstrap.min.js"></script> -->
<!-- 	<script src="http://v3.bootcss.com/assets/js/docs.min.js"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!-- 	<script -->
<!-- 		src="http://v3.bootcss.com/assets/js/ie10-viewport-bug-workaround.js"></script> -->
</body>
</html>
