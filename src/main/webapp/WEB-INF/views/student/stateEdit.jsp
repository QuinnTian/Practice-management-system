<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改就业材料</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript"
	src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<script type="text/javascript">
	function save() {
		if (window.confirm("确定修改实习状态?")) {
			$("#form1").submit();
		}
	}

	$(function() {
		var dfstate = $("#ds").val();
		$("#state").val(dfstate);
	});
</script>
</head>
<body>
	<h2>修改实习状态</h2>
	<form id="form1" action="doStateEdit.do" method="post">
		<input type="hidden" id="ds" value="${stu.practice_state}" /> 姓名：
		<output>${stu.true_name}</output>
		<br /> 学号：
		<output>${stu.stu_code}</output>
		<br /> 请选择实习状态： <select id="state" name="state">
			<option value="100">没有实习单位需要推荐</option>
			<option value="110">没有实习单位不需要推荐</option>
			<option value="120">单位落实等待上班</option>
			<option value="130">正常实习中</option>
			<option value="140">实习中想换工作</option>
			<option value="150">实习中新单位已落实</option>
			<option value="210">已网签</option>
			<option value="220">已签劳动合同</option>
			<option value="160">自考本（没有实习单位）</option>
			<option value="170">准备专升本</option>
			<option value="173">专升本成功</option>
			<option value="176">专升本确定入学</option>
			<option value="180">征兵</option>
			<option value="190">创业</option>
			<option value="195">创业成功</option>
			<option value="200">出国</option>
			<option value="205">出国成功</option>
		</select><br />
		<br />
		<button id="sub" onclick="save()">保存</button>
	</form>
</body>
</html>
