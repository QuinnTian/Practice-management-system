<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>学生端</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<title>实践教学管理</title>
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/agile.layout.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.component.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.color.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">

</head>
<body>
	<div id="section_container">
			<section id="addPoints_section" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i></a>
					<h1>添加扣分项</h1>
					<a data-toggle="edit" onclick="location.href='morningExPointsEdit.do?'"><i class="iconfont iconline-write"></i></a>
				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
				<label class="label-left"><font color="red">请检查信息，若信息有误请返回并重新选择</font></label>
					<div class="label-right">
					<output>
					指标:<small>${standard_name}</small>&nbsp;&nbsp;&nbsp;班级:<small>${inclass_name}</small>
					&nbsp;&nbsp;&nbsp;时间:<small>${nowtime}</small>检查人:<small>${inspect_men}</small>&nbsp;&nbsp;&nbsp;班级责任人:<small>${cl_contact_name}</small>
					&nbsp;&nbsp;&nbsp;应到人数:<small>${i}</small></output>
					 </div>
					<hr/>
					<form class="form-group" action="doSaveinformation.do" name="form1"  id="form1" method="post">
					<ul class="listitem">
					<input type="hidden" id="sum_l" name="sum_l" value="">
						<c:if test="${class_id  == null}">
							<li>
							<i class="ricon iconfont iconline-arrow-right"></i>
							<div class="text">
								
							</div>
						</c:if>
						<c:if test="${class_id  != null}">
							<li>
							<i class="ricon iconfont iconline-arrow-right"></i>
							<div class="text" >${inclass_name} <small>${num}</small>
							<input type="hidden" name="sum" id="sum" value="${num}">
							</div>
						</c:if>
						<c:forEach var="stu" items="${use}" varStatus="status">
						<c:if test="${stu.temp1!=null}">						
							<li >
							<i class="ricon iconfont iconline-arrow-right"></i>
							<div class="text" >
								<c:out value="${stu.temp1}"/>
								<small><c:out value="${stu.temp3}" /></small>
								<small><c:out value="${stu.temp2}" /></small>
								<input type="hidden" name="sum" id="sum" value="${stu.temp2}">
							</div>
						</li>
						</c:if>
						 </c:forEach> 
					
		
					</ul>
					</form>
					<div class="card noborder">
					<button id="btninit" class="block "  >
								添加扣分记录
					</button>
					</div>
					<div class="card noborder">
					<button id="btnSave" class="submit width-full"  >
								保存
					</button>
					</div>
					
				</div>
				</article>
		</section>
	</div>
	<!--- third --->
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery-2.1.3.min.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery.mobile.custom.min.js"></script>
	<script src="<%=path%>/AgileLite/assets/third/iscroll/iscroll-probe.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/arttemplate/template-native.js"></script>
	<!-- agile -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/agile/js/agile.js"></script>
	<!--- bridge --->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
	<script type="text/javascript">
	(function() {
	//添加扣分记录按钮	
	$('#btninit').on(A.options.clickEvent, function() {
		location.href="morningExPointsAdd.do";
	});
	//提交记录表单
	$('#btnSave').on(A.options.clickEvent, function() {
		var a=[];
		var arr = document.getElementsByName("sum");
		for(var i = 0;i < arr.length;i++)
		a[i]=arr[i].value;
		$('#sum_l').attr("value",a);
		$('#form1').submit();
	});
	
	})();
	</script>
</body>
</html>
