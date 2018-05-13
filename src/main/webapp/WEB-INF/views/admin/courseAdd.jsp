<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>
<title>添加课程</title>
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
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<script type="text/javascript" src="../js/jquery.validator.messages.js"></script>
<script type="text/javascript">
	function setValues() {
		var province = document.getElementById("id");
		var pindex = province.selectedIndex;
		var pValue = province.options[pindex].value;
		var pText = province.options[pindex].text;
		document.getElementById("org_name").value = pText;
	}
</script>
<script type="text/javascript">
	//判断课程名可不可用 邢志武 2015年5月28日 08:55:49

	/* 	$(function() {
	 $("#myform").validate({
	 rules : {
	 username : {
	 required : true,
	 minlength : 2
	 },
	 course_code: {
	 required : true,
	 minlength : 2
	 },
	
	 course_name: {
	 required : true,
	 minlength : 2
	 },
	
	 class_hour: {
	 required : true,
	 minlength : 2
	 },
	
	 description : {
	 required : true,
	 minlength : 2
	 },
	 },
	 messages : {
	 username : {
	 required : "必须填写",
	 minlength : "最少2个字符"
	 },
	 course_code: {
	 required : "必须填写",
	 minlength : "最少2个字符"
	 },
	
	 course_name: {
	 required : "必须填写",
	 minlength : "最少2个字符"
	 },
	
	 class_hour: {
	 required :"必须填写",
	 minlength : "最少2个字符"
	 },
	
	 description : {
	 required : "必须填写",
	 minlength :"最少2个字符"
	 },
	 }
	 }); */

	function checkForm() {

		var course_code = $("#course_code");
		var course_name = $("#course_name");
		var org_id = $("#org_id");
		var class_hour = $("#class_hour");
		var description = $("#description");

		if (course_code.val() == "") {
			alert("请输入课程编码");
			begin_Time.focus();
			return null;
		}
		if (course_name.val() == "") {
			alert("请输入课程名称");
			end_Time.focus();
			return null;
		}
		if (org_id.val() == "0") {
			alert("请选择组织名称");
			return null;
		}
		if (class_hour.val() == "") {
			alert("请输入课时，必须为数字！");
			return null;
		}
		//alert(teacher.value);
		if (description.val() == "") {
			alert("请添加对课程的描述");
			return null;
		}

		else {
			document.forms[0].submit();
		}
	}
	function checkCourseName() {

		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "checkCourseName.do",
			data : getCourseName(), //设置发送参数，即使参数为空，也需要设置      
			dataType : "text", //返回的类型为json   
			success : function(data) { //成功时执行的方法					
				showHint(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}

	function getCourseName() {
		var course_name = $('#course_name').val();
		return "course_name=" + course_name;
	}
	function showHint(ajaxData) {
		console.log(ajaxData);
		document.getElementById("span").innerHTML = ajaxData;
	}
</script>
<!-- 字数限制 -->
<script>
	var maxstrlen = 70;
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
	function textCounter(field, counter, maxlimit, linecounter) {
		// text width//
		var fieldWidth = parseInt(field.offsetWidth);
		var charcnt = field.value.length;
		// trim the extra text
		if (charcnt > maxlimit) {
			field.value = field.value.substring(0, maxlimit);
		} else {
			// progress bar percentage
			var percentage = parseInt(100 - ((maxlimit - charcnt) * 100)
					/ maxlimit);
			document.getElementById(counter).style.width = parseInt((fieldWidth * percentage) / 100)
					+ "px";
			document.getElementById(counter).innerHTML = "已输: " + percentage
					+ "%"
			// color correction on style from CCFFF -> CC0000
			setcolor(document.getElementById(counter), percentage,
					"background-color");
		}
	}
	function setcolor(obj, percentage, prop) {
		obj.style[prop] = "rgb(80%," + (100 - percentage) + "%,"
				+ (100 - percentage) + "%)";
	}
</script>
</head>
<body>
	<h1 align='left'>添加课程</h1>
	<form name="form1" id="myform" method="post" action="doAddCourses.do">
		<table border="0" width="1300">
			<tr>
				<td width="100">课程编码 ：</td>
				<td width="700"><input type="text" name="course_code"
					id="course_code"><span></span></td>
			</tr>

			<tr>
				<td width="100">课程名称：</td>
				<td width="700"><input type="text" name="course_name"
					id="course_name" onblur="checkCourseName()"><span id="span"></span>
				</td>
			</tr>
			<tr>
				<td width="100">组织ID：</td>
				<td><select name="org_id" id="org_id"
					style="font-family: sans-serif" onChange="setValues()">
						<option value="0">请选择</option>
						<c:forEach var="o" items="${teachers}" varStatus="stauts">
							<option value="${o.id}">${o.org_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td width="100">授课对象：</td>
				<td width="700"><select name="class_object" id="class_object">
						<option value="专科">专科</option>
						<option value="本科">本科</option>
				</select></td>

			</tr>
			<tr>
				<td width="100">课时：</td>
				<td width="700"><input type="number" name="class_hour"
					id="class_hour" /><span></span></td>
			</tr>
			<tr>
				<td width="100">描述：</td>
				<td width="700">
					<!-- <textarea rows="5" cols="20" name="description"></textarea> -->
					<div>您最多可以输入70个字符</div>
					<form>
						<textarea rows="5" cols="40" name="maxcharfield" id="maxcharfield"
							onKeyDown="textCounter(this,'progressbar1',70)"
							onKeyUp="textCounter(this,'progressbar1',70)"
							onPaste="textCounter(this,'progressbar1',70)"
							onFocus="textCounter(this,'progressbar1',70)"></textarea>
					</form>

					<div id="progressbar1" class="progress"></div>
				</td>
			</tr>
			<tr>
				<td width="100">状态：</td>
				<td width="700"><select name="state" id="state">
						<option value="1">有效</option>
						<option value="2">无效</option>
				</select></td>
			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="checkForm()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="window.location='./courseList.do'">返回</button>
		</div>
	</form>
	<script>
		textCounter(document.getElementById("maxcharfield"), "progressbar1", 70)
	</script>
</body>
</html>





















