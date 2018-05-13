<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML>
<html>
<head>
<title>学生信息列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	//添加
	function add() {
		var class_id = document.getElementById('classId').value;
		if (class_id == "请选择班级") {
			alert("请先选择班级！！");
			return null;
		} else {
			window.location.href = "studentImport.do?class_id=" + class_id;
		}
	}

	//删除
	function doDel(id) {
		if (window.confirm("确定删除学生?")) {
			window.location.href = "deleteStudentImport.do?id=" + id;
		}
	}
	//查出系部所对应的班级 
	function changeCK() {
		$.ajax({
			type : "get",
			/* contentType : "application/json", */
			url : "classList.do?",
			data : getCanShu(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				showPractice(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getCanShu() {
		var grade = $("#grade").val();
		var xibu = $("#xibu").val();
		var dataSend = "tiaojian=" + grade + "," + xibu;
		return dataSend;
	}
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#classId").html(ajaxData);
	};
	function studList() {
		var selectedValue = document.getElementById("classId");
		var selectedIndex = selectedValue.selectedIndex;
		if ((selectedValue.options[selectedIndex].value == "请选择班级")) {
			alert("请先选择班级");
			return null;
		}
		var ajaxUrl = "studentList.do?ClassId="
				+ selectedValue.options[selectedIndex].value;
		Students(ajaxUrl);
	}

	/**
		by李秋林
	 */
	// 向服务器发送搜索请求
	function searchPerson() {
		var keyword = $("#keyword").val();
		var dataSend = "keyword=" + keyword;
		if (keyword == null || keyword == "") {
			alert("请输入   姓名  或  学号！！！");
			return null;
		}
		$.ajax({
			type : "post",
			url : "searchPerson.do",
			data : dataSend, //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				$("#table1").html(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});

	}
	//跳转到给定的页面page

	function ajaxFunction(url) {
		//考虑到不同浏览器的兼容性，所以做出判断。
		var xmlHttp;
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveObject) {
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
		//监控和接受后台传的字符串
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var result = xmlHttp.responseText;
				var ss = result.split("FENGECOMPANY");
				$("table[id='companyTable'] tr[id!='biaotou']").remove();
				$("#biaotou").after(ss[0]);
				document.getElementById('nowPage').value = ss[1];
			}
		};
		xmlHttp.open("GET", url, false);
		xmlHttp.send(null);
	}
	function Students(url) {
		$("#information").empty();
		//考虑到不同浏览器的兼容性，所以做出判断。
		var xmlHttp;
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveObject) {
			try {

				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");

			} catch (e) {

				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");

				} catch (e) {
				}
			}
		}
		//监控和接受后台传的字符串
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var result = xmlHttp.responseText;
				$("#table1").html(result);
			}
		};

		xmlHttp.open("GET", url, false);

		xmlHttp.send(null);
	}
	//用来返回上一个界面的数据
	function studList2() {
		var class_id1 = $("#class_id1").val();
		var ajaxUrl = "studentList.do?ClassId=" + class_id1;
		Students2(ajaxUrl);
	}
	function Students2(url) {
		$("#information").empty();
		//考虑到不同浏览器的兼容性，所以做出判断。
		var xmlHttp;
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveObject) {
			try {

				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");

			} catch (e) {

				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");

				} catch (e) {
				}
			}
		}
		//监控和接受后台传的字符串
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var result = xmlHttp.responseText;
				$("#table1").html(result);
			}
		};

		xmlHttp.open("GET", url, false);

		xmlHttp.send(null);
	}
	window.onload = function() {
		var grade1 = $("#grade1").val();
		var dept_id1 = $("#dept_id1").val();
		var class_id1 = $("#class_id1").val();
		if (class_id1 != null && class_id1 != "") {
			changeCK();
			$("#hiddenBtn").click();
		}
	};
	//重置按钮
	function reset() {
		$("#grade").find("option[value='0']").attr("selected", true);
		$("#xibu").find("option[value='0']").attr("selected", true);
		$("#classId")
				.html(
						"<select id='classId' name='tea_id' style='width:100px'> <option value='请选择班级'>请选择班级</option></select>");
	}
	//goBack()
	function goBack() {
		window.location.href = "studentImportList.do?type=" + "1";
	}

	//删除所有学生   by syj 20160330 
	function doDelAll() {
		var class_id1 = $("#class_id1").val();
		var class_name = $("#classId").find("option:selected").text();
		var classId=$("#classId").val();
		if (classId=="请选择班级"){
		alert("请选择班级后点击！");
		return;
		}
		else{
		if(window.confirm("确定删除" + class_name + "所有学生?(点击两次删除按钮生效)")) {
			window.location.href = "deleteAllStudentImport.do?id=" + class_id1;
		}} 
	}
	function rePwd(id) {
		if (window.confirm("确定重置此学生密码?")) {
			window.location.href = "reStudentImport.do?id=" + id;
		}
	}
	
	//注销微信号  by syj 20160620
	function cancelWXNum(id) {
		if (window.confirm("确定注销此学生微信号?")) {
			window.location.href = "cancelWXNum.do?id=" + id;
		}
	}
</script>
</head>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<body>
	<h2>学生信息列表</h2>
	<input id="grade1" value="${student_grade}"
		style="background-color:#666666; display:none;">
	<input id="dept_id1" value="${student_dept_id}"
		style="background-color:#666666; display:none; ">
	<input id="class_id1" value="${student_class_id}"
		style="background-color:#666666; display:none;">
	<button id="hiddenBtn" style="background-color:#666666; display:none;"
		onclick="studList2();">Hidden Button</button>
	<c:set var="grade1" value="${student_grade}" scope="request"></c:set>
	<c:set var="dept_id1" value="${student_dept_id}" scope="request"></c:set>
	<c:set var="class_id1" value="${student_class_id}" scope="request"></c:set>
	<%
		String grade1 = (String) request.getAttribute("grade1");
		String dept_id1 = (String) request.getAttribute("dept_id1");
		String class_id1 = (String) request.getAttribute("class_id1");
	%>
	入学年份
	<select id="grade" name="grade" style="width:100px"
		onChange="changeCK()">
		<option value="0">请选择年级</option>
		<c:forEach var="grade" items="${grade}" varStatus="stauts">
			<option value="${grade}"
				<c:if test="${grade==grade1}">selected</c:if>>${grade}</option>
		</c:forEach>
	</select>&nbsp;&nbsp;&nbsp;&nbsp; 所属院系
	<select id="xibu" name="xibu" onChange="changeCK()" style="width:100px">
		<option value="0">请选择系部</option>
		<c:forEach var="o" items="${o}" varStatus="stauts">
			<option value="${o.id}"
				<c:if test="${o.id==dept_id1}">selected</c:if>>${o.org_name}</option>
		</c:forEach>
	</select>&nbsp;&nbsp;&nbsp;&nbsp; 所在班级
	<select id="classId" name="classId" style="width:150px">
		<option value="请选择班级">请选择班级</option>
	</select>
	<input type="button" onclick="studList()" value="查询" />
	<!-- <input type="button" value="重置" id="reset" onClick="reset();"/> -->
	<input type="button" value="重置" id="reset" onClick="goBack();" />
	<input type="button" onclick="javascript:add();" value="导入学生" />

	<!--
	李秋林
		 -->
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入姓名或学号：
	<input type="text" id="keyword" name="keyword" value="" />
	<input type="button" onclick="searchPerson()" value="详细搜索" />
	<!-- ---------------------------------------------------------------------- -->

	<span><font color="read" id="information">${success}</font> </span>
	<input type="button" name="deleteAll" onclick="doDelAll()" value="删除所有">
	<table border="1" width="1300" id="table1" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr>
			<td width="100" align="center"><b>学号</b></td>
			<td width="60" align="center"><b>姓名</b></td>
			<td width="40" align="center"><b>性别</b></td>
			<td width="100" align="center"><b>身份证号</b></td>
			<td width="100" align="center"><b>手机号</b></td>
			<td width="100" align="center"><b>班级名称</b></td>
			<td width="100" align="center"><b>家庭电话</b></td>
			<td width="300" align="center"><b>籍贯</b></td>
			<td width="150" align="center"><b>空间主页</b></td>
		</tr>
		<c:forEach var="stu" items="${tt}" varStatus="stauts">
			<tr>
				<td align="center">${stu.stu_code}</td>
				<td align="center">${stu.true_name}</td>
				<td align="center">${stu.sex}</td>
				<td align="center">${stu.id_card}</td>
				<td align="center">${stu.phone}</td>
				<td align="center"><c:set var="classId" value="${stu.class_id}"
						scope="request"></c:set> <%
 	String classId = (String) request.getAttribute("classId");
 		out.print(DictionaryService.findOrg(classId).getOrg_name());
 %></td>
				<td align="center">${stu.home_phone}</td>
				<td align="center">${stu.birthplace}</td>
				<td align="center">${stu.homepage}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
