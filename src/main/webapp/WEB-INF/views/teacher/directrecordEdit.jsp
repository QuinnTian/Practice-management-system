<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkTextArea.js"></script>
<style type="text/css">
.progress {
	width: 1px;
	height: 14px;
	color: white;
	font-size: 12px;
	overflow: hidden;
	background-color: navy;
	padding-left: 5px;
}
</style>
<script type="text/javascript">
	function download() {
		var fileid = $("#file_id").val();
		console.log(fileid);

		if (fileid == "") {
			alert("此任务还没有文件，如果需要请点击浏览上传文件");
		} else {
			window.location.href = "downloadFile.do?file_id=" + fileid;
		}
	}

	function checkForm() {
		var title = $("#title").val();
		var titleLen = title.length;
		if (titleLen > 60) {
			alert("您输入的标题太长，请勿超过60字！");
			return null;
		} else {
			document.forms[0].submit();
		}
	}
</script>
<script type="text/javascript">
	function textCounter(field, counter, maxlimit, linecounter) {
		// text width
		var fieldWidth = parseInt(field.offsetWidth);
		var charcnt = field.value.length;
		// trim the extra text
		if (charcnt > maxlimit) {
			field.value = field.value.substring(0, maxlimit);
		} else {
			// 进度条百分比
			var percentage = parseInt(100 - ((maxlimit - charcnt) * 100)
					/ maxlimit);
			document.getElementById(counter).style.width = parseInt((fieldWidth * percentage) / 100)
					+ "px";
			document.getElementById(counter).innerHTML = "已输: " + percentage
					+ "%";
			// color correction on style from CCFFF -> CC0000
			setcolor(document.getElementById(counter), percentage,
					"background-color");
		}
	}
	function setcolor(obj, percentage, prop) {
		obj.style[prop] = "rgb(80%," + (100 - percentage) + "%,"+ (100 - percentage) + "%)";
	}
</script>
<!-- 字数限制 -->
<script>
	var maxstrlen = 500;
	function Q(s) {
		return document.getElementById(s);
	}

	function checkWord(c) {
		len = maxstrlen;
		var str = c.value;
		myLen = getStrleng(str);
		var wck = Q("wordCheck");

		if (myLen > len * 2) {
			c.value = str.substring(0, i + 1);
		} else {
			wck.innerHTML = Math.floor((len * 2 - myLen) / 2);
		}
	}

	function getStrleng(str) {
		myLen = 0;
		i = 0;
		for (; (i < str.length) && (myLen <= maxstrlen * 2); i++) {
			if (str.charCodeAt(i) > 0 && str.charCodeAt(i) < 128)
				myLen++;
			else
				myLen += 2;
		}
		return myLen;
	}
</script>
<title>教师记录修改</title>
</head>
<body>
	<h2 align="left">教师指导记录修改</h2>
	<button onclick="download()">下载指导任务</button>
	<form name="form1" method="post" action="doEditdirectrecord.do">
		<input type="hidden" id="id" name="id" value="${directrecord.id}">
		<input type="hidden" id="file_id" name="file_id" value="${directrecord.file_id}">
		<table border="0" width="1000">
			<tr>
				<c:set var="p_id" value="${directrecord.practice_id}" scope="request"></c:set>
				<%
					String practice_id = (String) request.getAttribute("p_id");
				%>
				<td width="100">实习名称 ：</td>
				<td width="300">
					<%
						out.println(DictionaryService.findPracticeTask(practice_id).getTask_name());
					%>
				</td>
			</tr>
			<tr>
				<td width="100">标题：</td>
				<td width="500"><input type="text" name="title" id="title" value="${directrecord.title}" style="width:230px;"></td>
			</tr>
			<tr>
				<td width="100">起始时间：</td>
				<td width="300">
				<fmt:parseDate value="${directrecord.direct_time}" var="direct_time" /> 
				<fmt:formatDate	value="${direct_time}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td width="100">结束时间：</td>
				<td width="300">${directrecord.temp2}</td>
			</tr>
			<tr>
				<td width="100">指导地点：</td>
				<td width="300"><input type="text" name="direct_place" value="${directrecord.direct_place}" style="width:230px;" /></td>
			</tr>
			<tr><br><br>
				<td width="100">描述：</td>
				<td width="800">
					<div style="color:#F00">您最多可以输入500个字符</div> 
					<textarea rows="5" cols="40" name="maxcharfield" id="maxcharfield"
						onKeyDown="textCounter(this,'progressbar1',500)"
						onKeyUp="textCounter(this,'progressbar1',500)"
						onPaste="textCounter(this,'progressbar1',500)"
						onFocus="textCounter(this,'progressbar1',500)">
					</textarea>
					<div id="progressbar1" class="progress"></div></td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="checkForm()"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./directrecordList.do'">返回</button>
		</div>
	</form>
	<script>
		textCounter(document.getElementById("maxcharfield"), "progressbar1",500);
	</script>
</body>
</html>
