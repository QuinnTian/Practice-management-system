<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>实习成绩查看</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	/*2015-01-26 邢志武重新修改  */
	function doSerch() {
		var a = $("#month").val();
		var b = $("#thesis").val();
		var c = $("#evaluate").val();
		var d = parseInt(a * 100);
		var f = parseInt(b * 100);
		var g = parseInt(c * 100);
		var sum = (d + f + g);
		console.log("==" + sum);
		var term = $("#term").val();
		var stuyear = $("#stuyear").val();
		var practice_id = $("#practice_id").val();
		if (practice_id == "") {
			alert("请选择实习任务！");
			return;
		}
		if (stuyear == "") {
			alert("请选择学年！ ");
			return;
		}
		if (term == "") {
			alert("请选择学期！ ");
			return;
		}
		if (sum == 100) {
			$.ajax({
				type : "get",
				contentType : "application/json",
				url : "ajaxSerchStus.do?",
				data : "practice_id=" + practice_id + "&month=" + a
						+ "&thesis=" + b + "&evaluate=" + c + "&term=" + term
						+ "&stuyear=" + stuyear,
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法
					console.log("ajax返回成功");
					if (data == (-1)) {
						alert("数据为空，请确认信息!");
					} else {
						showStus(data);
					}

				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		} else {
			alert("权重之和要求100%，请重新选择权重");
		}
	}

	function getStusData() {
		var practice_id = $("#practice_id").val();
		var month1 = $("#month").val();
		var thesis1 = $("#thesis").val();
		var evaluate1 = $("#evaluate").val();
		var dataSend = "practice_id=" + practice_id + "&month=" + month
				+ "&thesis=" + thesis + "&evaluate=" + evaluate;
		console.log("dataSend:" + dataSend);
		return dataSend;
	}
	function showStus(ajaxData) {
		$("table[id='stuTab'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	}
</script>

<script type="text/javascript">
	function getWeight() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxGetWeight.do?",
			data : getWeightData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				console.log("ajax返回成功");
				showWeight(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});

	}
	function getWeightData() {
		var practice_id = $("#practice_id").val();
		var dataSend = "practice_id=" + practice_id;
		console.log("dataSend:" + dataSend);
		return dataSend;
	}
	function showWeight(ajaxData) {
		var result = ajaxData.split("_");

		var weight_summary = result[0];
		var weight_thesis = result[1];
		var weight_evaluate = result[2];
		var default_year = trim(result[3]);

		console.log(weight_summary);
		console.log(weight_thesis);
		console.log(weight_evaluate);

		$("#month").val(weight_summary);
		$("#thesis").val(weight_thesis);
		$("#evaluate").val(weight_evaluate);
		//设置默认学年、学期
		$("#stuyear").val(default_year);
		$("#term").val(1);
	}
	//清除空格
	function trim(str) { //删除左右两端的空格
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}
	function getMessage(bl) {
		var term = $("#term").val();
		var stuyear = $("#stuyear").val();
		if (bl == "term") {
			if (term == "") {
				alert("请选择学期！ ");
				return;
			}
		}
		if (stuyear == "") {
			alert("请选择学年！ ");
			return;
		}

		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxSerchMess.do?",
			data : "term=" + term + "&stuyear=" + stuyear,
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				console.log("ajax返回成功");
				showMessage(data);

			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});

	}

	function showMessage(ajaxData) {
		var message = document.getElementById("message");
		var result = "";

		//根据数据长度判断是否能获取到起止月份
		if (ajaxData.length == 17) {
			result = "实习起止月份：      " + ajaxData;
			message.style.color = "black";
		} else {
			result = "该学期没有设置实习起止年月,请联系管理员!";
			message.style.color = "red";
		}
		message.innerHTML = result;

	}
</script>
</head>

<body>
	实习任务：
	<select name="practice_id" id="practice_id" onchange="getWeight();">
		<option value="">请选择</option>
		<c:forEach var="s" items="${result}" varStatus="stauts">
			<option value="${s.id}">${s.task_name}</option>
		</c:forEach>
	</select> &nbsp;请选择学年和学期：&nbsp;
	<select id="stuyear" name="stuyear" onchange="getMessage('stuyear')"><option
			value="">请选择学年</option>
		<option value="2013">2013-2014</option>
		<option value="2014">2014-2015</option>
		<option value="2015">2015-2016</option>
		<option value="2016">2016-2017</option>
	</select> &nbsp;
	<select id="term" name="term" onchange="getMessage('term')"><option
			value="">请选择学期</option>
		<option value="1">上学期</option>
		<option value="2">下学期</option>
	</select> &nbsp;
	<span id="message" name="message"></span>
	<br /> 设置权重:&nbsp; 月总结:
	<select id="month" name="month">
		<option value="0.0">0%</option>
		<option value="0.1">10%</option>
		<option value="0.2">20%</option>
		<option value="0.3">30%</option>
		<option value="0.4">40%</option>
		<option value="0.5">50%</option>
		<option value="0.6">60%</option>
		<option value="0.7">70%</option>
		<option value="0.8">80%</option>
		<option value="0.9">90%</option>
		<option value="1.0">100%</option>
	</select> 论文 :
	<select id="thesis" name="thesis">
		<option value="0.0">0%</option>
		<option value="0.1">10%</option>
		<option value="0.2">20%</option>
		<option value="0.3">30%</option>
		<option value="0.4">40%</option>
		<option value="0.5">50%</option>
		<option value="0.6">60%</option>
		<option value="0.7">70%</option>
		<option value="0.8">80%</option>
	</select> 奖惩 :
	<select id="evaluate" name="evaluate">
		<option value="0.0">0%</option>
		<option value="0.1">10%</option>
		<option value="0.2">20%</option>
		<option value="0.3">30%</option>
		<option value="0.4">40%</option>
		<option value="0.5">50%</option>
		<option value="0.6">60%</option>
		<option value="0.7">70%</option>
		<option value="0.8">80%</option>
	</select>
	<input type="button" id="score" name="score" onclick="doSerch()"
		value="生成总成绩" width="200"></input>
	<table border="1" width="1000" id="stuTab" cellspacing="0"
		cellpadding="0" class="sjjx-table">
		<tr id="biaotou">

			<th width="150">班级</th>
			<th width="150">学号</th>
			<th width="100">姓名</th>
			<th width="150">联系电话</th>
			<th width="100">实习月总结成绩</th>
			<th width="100">论文成绩</th>
			<th width="100">奖惩成绩</th>
			<th width="100">总成绩</th>
		</tr>
	</table>
	<input type="hidden" id="k" name="practice_id" value="${practice_id}">
	<input type="hidden" id="r" name="myYear" value="${myYear}">
	<input type="hidden" id="t" name="term" value="${term}">

</body>

</html>
