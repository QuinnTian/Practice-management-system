<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	errorPage="errorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>个人信息修改</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script>
	var maxstrlen = 70;

	$(function() {
		var home_addr = document.getElementById("home_addr").value;
		checkWord(home_addr);
	});
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
	//编辑
	function doEdit() {
		var email = $("#email").val();
		var qqnum = $("#qqnum").val();
		var phone = $("#phone").val();
		var home_phone = $("#home_phone").val();
		var id_card = $("#id_card").val();
		var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		var b = reg.test(email);
		var phoneLength = phone.length;
		if (b == false) {
			alert("E-mail格式错误");
			return null;
		}
		if (isNaN(qqnum) == true) {
			alert("QQ号只能为数字");
			return null;
		}
		if (phoneLength != 11) {
			alert("手机号码应为11位");
			return null;
		}
		if (isNaN(phone) == true) {
			alert("手机号只能为数字");
			return null;
		}
		if (isNaN(home_phone) == true) {
			alert("家庭电话只能为数字");
			return null;
		}
		
		var isIDCard1=/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/; 
		var id = isIDCard1.test(id_card);
		if(id == false){
		alert("身份验证格式错误,查看位数或者输入的字符是否正确！");
		return null;
		}
		document.form1.submit();
	}
	
</script>
</head>
<body>
	<h2>修改学生信息</h2>
	<br>
	<input type="hidden" name="id_card1" id="id_card1" value="${student.id_card}" />
	<form name="form1" method="post" action="doEditStudent.do">
		<input type="hidden" name="id" name="id" value="${student.id}">
		<table border="0" width="1300">
			<tr>
				<td width="100">学&nbsp;&nbsp;号：</td>
				<td width="400">${student.stu_code}<%-- <input type="text" id="stu_code" name="stu_code"
					value="${student.stu_code}" onkeyup="value=value.replace(/[^\d]/g,'')"> --%>
				</td>
				<td width="100">姓&nbsp;&nbsp;名：</td>
				<td width="400">
					<%-- <input type="text" name="true_name"
					value="${student.true_name}"> --%>${student.true_name}
				</td>
				<td width="100">入学年份：</td>
				<td width="400">${student.entry_year}</td>
			</tr>
			<tr>
				<td width="110">Q&nbsp;Q&nbsp;号：</td>
				<td width="400"><input type="text" name="qqnum" id="qqnum"
					onkeyup="value=value.replace(/[^\d]/g,'')" value="${student.qqnum}"></td>
				<td width="110">手&nbsp;机&nbsp;号：</td>
				<td width="400"><input type="text" name="phone" id="phone"
					onkeyup="value=value.replace(/[^\d]/g,'')" value="${student.phone}"></td>
				<td width="110">家庭电话：</td>
				<td width="400"><input type="text" name="home_phone" id="home_phone"
					onkeyup="value=value.replace(/[^\d]/g,'')" value="${student.home_phone}"></td>
			</tr>
			<tr>
				<td width="100">身&nbsp;份&nbsp;证：</td>
				<td width="400"><input type="text" name="id_card" id="id_card" value="${student.id_card}">
				</td>
				<td width="110">EMAIL：</td>
				<td width="400"><input type="text" name="email" id="email" value="${student.email}">
				</td>
				<td width="110">云空间地址：</td>
				<td width="400"><input type="text" name="homepage" id="homepage"
					value="${student.homepage}"></td>
			</tr>
			<tr>
				<td width="110">家庭住址：</td>
				<td width="400"><textarea name="home_addr" id="home_addr" rows="4" cols="40"
						onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);"
						style="resize:none" style="overflow-y:scroll">${student.home_addr}</textarea>
					<div>
						还可以输入<span style="font-family: Georgia; font-size: 26px;" id="wordCheck">70</span>个字符
					</div></td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doEdit();" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./index.do'">返回</button>
		</div>
	</form>
</body>
</html>
