<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>发布通知</title>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<!-- 字数限制 -->
<script type="text/javascript" src="/springmvc_mybatis/js/checkTextArea.js"></script>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript">
	//全选操作
	function checkAll(flag) {
		CBs = document.getElementsByName("students");
		for ( var i = 0; i < CBs.length; i++)
			CBs[i].checked = flag;
	}
	/**
	 查出该老师的所选实习任务对应的学生 
	 wl
	 */
	function changeCK() {
		var selectedValue = document.getElementById("practice_id");
		var selectedIndex = selectedValue.selectedIndex;
		var ajaxUrl = "studentListByPraCodeTeaCode.do?practice_id="
				+ selectedValue.options[selectedIndex].value;
		ajaxFunction(ajaxUrl);
	}
	/**
	 获取选中的学生 ，并赋值给输入框
	 wl
	 */
	function setVals() {
		var value = "";
		var name = "";
		var id = document.getElementsByName("students");//复选框的name
		for ( var i = 0; i < id.length; i++) {
			if (id[i].checked) {
				value += id[i].value + ",";
				name += id[i].nextSibling.nodeValue + ",";
			}
		}
		document.getElementById("notice_range").value = value;
		document.getElementById("temp1").value = name;
		document.getElementById("scope").style.display = "none";//隐藏div
		$("#editStudents").attr('type', 'button');//增加修改按钮
	}

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
				if (result.length == 20) {
					alert("此任务没有对应的学生");
					document.getElementById("scope").style.display = "none";//隐藏div
					return null;
				} else {
					document.getElementById("scope").style.display = "";
					$("#select").html(result);
				}

			}
		};

		xmlHttp.open("GET", url, false);

		xmlHttp.send(null);
	}
	function getPracticeTask() {// 向服务器发送搜索请求
		$.ajax({
			type : "get",
			/* contentType : "application/json", */
			url : "getPracticeTask.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
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
	function getSendData() {
		var grade = $("#year").val();
		var dataSend = "grade=" + grade;
		return dataSend;
	}
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#practice_id").html(ajaxData);
	};
	/*修改插入的学生  */
	function editStudent() {
		document.getElementById("scope").style.display = "";
		document.getElementById("notice_range").value = "";
		document.getElementById("temp1").value = "";
		$("#editStudents").attr('type', 'hidden');//隐藏修改学生按钮
	}
	function doAdd() {
		var obj_file = document.getElementById("fileuploade");
		if (obj_file.value != "") {
			var filesize = 0;
			if (browserCfg.firefox || browserCfg.chrome || browserCfg.opera
					|| browserCfg.qq) {
				filesize = obj_file.files[0].size; //单位为字节
				filesizemb = filesize / 1024; //转换为kb
			} else if (browserCfg.ie) {
				var obj_img = document.getElementById('tempimg');
				obj_img.dynsrc = obj_file.value;
				filesize = obj_img.fileSize;
			} else {
				alert(tipMsg);
				return;
			}
			if (filesize == -1) {
				alert(tipMsg);
				return;
			} else if (filesize > maxsize) {
				alert(errMsg);
				return;
			}
		}
		var content = $("#content").val();
		if (content.length > 200) {
			alert("内容不能超过200个字");
			return null;
		} else if (content == "") {
			alert("内容不能为空");
			return null;
		} else if ($("#title").val() == "") {
			alert("标题不能为空");
			return null;
		} else if ($("#notice_range").val() == "") {
			alert("通知范围不能为空");
			return null;
		} else {
			document.form1.submit();

		}

	}
						
</script>
 
</head>
<body >
	<h2>发布通知</h2>
	<br>
	
	<div>
		
	</div>
	<form name="form1" id="form1" method="post" action="doAddNotice.do"
		enctype="multipart/form-data">
		<img id="tempimg" dynsrc="" src="" style="display:none" />
		上传附件：&nbsp;&nbsp;&nbsp;<input type="file" name="file" id="fileuploade"
			size="30" title="文件大小不能超过10M" onchange="fileChange(this);" />
		<table border="0" width="500" height="238">
			<tr>
				<td style="width:100px">入学年份：</td>
				<td width="300">
					<select name="year" id="year"  style="width:100px ">     <!-- onChange="getPracticeTask()" --> 
						<option>请选择</option>
						
					<!-- 	源代码将其先注释 -->
						<%-- <c:forEach var="grade" items="${Grade}" varStatus="stauts">
							<option value="${grade.grade}">${grade.grade}</option> 
						</c:forEach>--%>
						
						<!-- 新增代码 -->
					<!-- 将取到的默认年份取出来放在变量 task_grade中 -->
 						 <c:set var="task_grade" value="${task_grade}" scope="request"></c:set> 
						<% 
						//取得var="task_grade"中的默认年份
 						String task_grade = (String) request.getAttribute("task_grade"); 
 						%> 
 							<!-- 得到的默认年份与静态年份匹配，成功着默认选 中-->
 							<option value="2012" <%="2012".equals(task_grade) ? "selected" : ""%>>2012</option> 
 							<option value="2013" <%="2013".equals(task_grade) ? "selected" : ""%>>2013</option> 
 							<option value="2014" <%="2014".equals(task_grade) ? "selected" : ""%>>2014</option> 
							<option value="2015" <%="2015".equals(task_grade) ? "selected" : ""%>>2015</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="270">实习任务：</td>
				<td width="700">
					<!-- 源代码将其注释 -->	
					<!-- <select name="practice_id" id="practice_id" style="width:290px" onChange="changeCK()" >
						<option value="0" >请选择任务</option>
					</select></td> -->
						
					<!-- 新增代码 -->
					<!--  得到map中的默认任务的名称-->
		<c:set var="defaultTaskName" value="${checkinfo_pullTaskName}" scope="request"></c:set>
		<%
			//取得var="defaultTaskName"中的默认年份对应的任务
			String defaultTaskName = (String) request.getAttribute("defaultTaskName");
		%>
		
		<select name="practice_id" id="practice_id" onChange="changeCK()"  style="width:260px">
			
			 <option value="请选择实习任务" <%="请选择实习任务".equals(defaultTaskName) ? "selected" : ""%>>请选择实习任务</option>
			 <!-- 将默认年份对应的任务与默认年份对应任务列表比对，比对成功将默认显示出来-->
			 <c:forEach var="taskList" items="${checkinfo_pulltaskList}" varStatus="stauts">
				<option value="${taskList.id}"
					<c:if test="${taskList.task_name==defaultTaskName}"> selected</c:if>>
					${taskList.task_name}</option>
			</c:forEach>
		</select> 
					
			</tr>
			<tr>
				<td width="100">标题：</td>
				<td style="width:100px"><input type="text" id="title"
					name="title" size="43" value="" "/></td>
			</tr>
			<tr>
				<td width="100">内容：</td>
				<td width="300">
					<div class="wordCount" id="wordCount">
						<textarea name="content" rows="5" cols="35" style="resize:none"
							id="content"></textarea>
						<span class="wordwrap"><var class="word">200</var>/200</span>
					</div>
				</td>
			</tr>
			<tr>
				<td width="120">通知范围：</td>
				<td width="300"><input id="notice_range" type="hidden"
					name="notice_range" /> <textarea rows="7" cols="35" id="temp1"
						name="temp1" disabled="disabled" style="resize:none"></textarea> <input
					type="hidden" value="修改学生" id="editStudents" name="editStudents"
					onClick="editStudent()" /></td>
			</tr>
		</table>
		<c:set var="student_name" value="${student_name}" scope="request"></c:set>
		<div id="scope" style="display: ">
			<br>学生列表：
			<div>
				<table border="1" id="table_StudentList">
					<%
						out.print(request.getAttribute("student_name"));
					%>
				</table>
			</div>
			<table border="1" >
				<tr id="select"> 	
				</tr>
			</table>
			
			全选：<input type="checkbox" value="全选" onClick="checkAll(this.checked)">&nbsp;&nbsp;
			<button type="button" onclick="setVals()">确定</button>
		</div>
		<div style="margin-top:20px;">
			<input type="button" value="发布通知" onclick="doAdd()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./noticeList.do'">返回</button>
		</div>
	</form>
	
	 <script type="text/javascript">
	 var getYear=document.getElementById("year");//获取当前年份
		getYear.addEventListener("change",getPracticeTask,false);//给当前年份添加事件
		getYear.addEventListener("change",hideAndCleranStudentList,false);//给当前年份添加事件
		function hideAndCleranStudentList(){//选中年份变化，执行该函数---清除默认学生
			var vtr=document.getElementById("table_StudentList");//获取table
			vtr.parentNode.removeChild(vtr);//删除table节点
			document.getElementById("scope").style.display = "none";//隐藏div
		}
	</script> 
	
	 
</body>
</html>

