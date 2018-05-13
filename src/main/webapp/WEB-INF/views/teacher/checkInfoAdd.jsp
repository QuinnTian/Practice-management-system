<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%	String path = request.getContextPath();%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加核对信息任务</title>
<%-- <style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<link rel="stylesheet" type="text/css"	href="<%=path%>/js/cal/calendar-system.css" /> --%>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=path %>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script type="text/javascript">
		/**
		查出该老师的所选实习任务对应的学生 by wl
	*/
	function changeCK() {
		var selectedValue = document.getElementById("practice_id");
		var selectedIndex = selectedValue.selectedIndex;
		var ajaxUrl = "studentListByPraCodeTeaCode.do?practice_id="
				+ selectedValue.options[selectedIndex].value;
		ajax(ajaxUrl);
		document.getElementById("divSelStu").style.display = "";
	}	
	function ajax(url) {
	//考虑到不同浏览器的兼容性，所以做出判断。
		var xmlHttp;
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveObject) 
		{
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
				$("#sel").html(result);
				
			}
		};

		xmlHttp.open("GET", url, false);

		xmlHttp.send(null);
	}
	function getScope() {

	}
	
	function getPracticeTask() {// 向服务器发送搜索请求,根据年级选择相应的实践任务
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
		var grade = $("#grade").val();
		var dataSend = "grade=" + grade;
		return dataSend;
	}
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#practice_id").html(ajaxData);
	};
	
	function setvalue2() {
		var id = document.getElementsByName("students");
		var value = "";
		var name = "";
		for ( var i = 0; i < id.length; i++) {
			if (id[i].checked) {
				value += id[i].value + ",";
				name += id[i].nextSibling.nodeValue + ",";
			}
		}
		document.getElementById("xm").value = name;
		document.getElementById("stu_range").value = value;
		document.getElementById("divSelStu").style.display = "none";
	}
	function getStu() {
		if (document.getElementById("divSelStu").style.display == "none") {
			document.getElementById("divSelStu").style.display = "";

		} else {

			document.getElementById("divSelStu").style.display = "none";

		}

	}
	//全选操作
	function checkAll(flag){
		CBs=document.getElementsByName("students");
		for(var i=0;i<CBs.length;i++)
	    CBs[i].checked=flag;
	}
	function doAdd() {
			var begin_Time  = document.getElementById("begin_Time");
			var end_Time  = document.getElementById("end_Time");
		    var practice_id  = document.getElementById("practice_id"); 
			var task_name  = document.getElementById("task_name"); 
			var task_Desc  = document.getElementById("content");
			var xm  = document.getElementById("xm");
			if (begin_Time.value==""){
				alert("请输入开始时间");
				begin_Time.focus();
				return ;
			}
			if (end_Time.value==""){
				alert("请输入结束时间");
				end_Time.focus();
				return ;
			}
			if(end_Time.value<begin_Time.value){
			    alert("结束时间不能够早于开始时间，请重新选择！");
			    return;
			}
			if (practice_id.value==""){
				alert("请选择实践任务");
				task_Place.focus();
				return ;
			} 
			if (task_name.value==""){
				alert("请输入核对任务标题");
				task_name.focus();
				return ;
			}
			if (task_Desc.value==""){
				alert("请输入任务描述");
				task_Desc.focus();
				return ;
			}
			if (xm.value==""){
				alert("请先选择入学年份和实习任务.如果没有学生,请确定管理员分配此任务");
				teacher.focus();
				return ;
			}
			if($("#stu_range").val()==""){
		 		alert("学生范围不能为空");
		 		return null;
		 	}
			document.forms[0].submit();
	}

</script>
</head>
<body>
	<form name="Form2" action="doAddCheckInfo.do" method="post">
		<h2>新增信息核对任务</h2>
		<table border="0" width="1000">
			<!--   <tr>
		    <td width="120">任务编码：</td>
		    <td width="280"><input type="text" name="practice_code" id="practice_code"></td>
	      </tr>  -->
			<tr>
				<td width="120">入学年份：</td>
				<td width="300"><select name="grade" id="grade"	onChange=getPracticeTask() style="width:260px">
						<option value="00">请选择</option>
						<c:forEach var="gr" items="${Grade}" varStatus="status">
							<option value="${gr.grade}">${gr.grade }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td width="120">选择实习任务：</td>
				<td width="300">
					<select name="practice_id" id="practice_id"	onChange="changeCK()" style="width:260px">
							<option value="0">请选择</option>
					</select></td>
			</tr>
			<tr>
		    <td width="120">核对任务标题：</td>
		    <td width="280"><input type="text" name="task_name" id="task_name" ></td>
	      	</tr> 
			<tr>
				<td width="100">开始时间：</td>
				<td width="500">
					<div>
						<input id="begin_Time" name="begin_Time" class="Wdate" type="text"
							onClick="WdatePicker()" size="50">
					</div>
				</td>
			</tr>
			<tr>
				<td width="100">结束时间：</td>
				<td width="500">
					<div>
						<input id="end_Time" name="end_Time" class="Wdate" type="text"
							onClick="WdatePicker()" size="50">
					</div>
				</td>
			</tr>
			<!-- <tr>
				<td width="120">任务地点：</td>
				<td width="280"><input type="text" name="task_place" id="task_place">
				</td>
			</tr> -->
			<tr>
				<td width="120">任务描述：</td>
				<td width="500">
				<!-- <textarea id="task_desc" name="task_desc" rows="4" cols="40" style="resize:none"></textarea> -->
				<textarea  style="resize:none" onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);" 
  					name="task_desc" id="content" cols="60" rows="4" style="overflow-y: scroll" maxlength="70"></textarea> 
					 <div> 
						还可以输入<span style="font-family: Georgia; font-size: 26px;"
							id="wordCheck">70</span>个字符
					</div>
				</td>
			</tr>
			<tr>
				<td width="100">请选择学生：</td>
				<td width="300"><input type="hidden" name="stu_range"  id="stu_range"
					style="width:200px"> <textarea style="resize:none"
						name="xm" id="xm" rows="4" disabled="disabled"></textarea> <input
					type="button" name="but1" value="选择学生" onclick="getStu()">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="divSelStu" style="display:none">
						<table border="1"><tr id="sel">	</tr></table>
						全选：<input type="checkbox" value="全选" onClick="checkAll(this.checked)">&nbsp;&nbsp;
						<button type="button" onclick="setvalue2()">确定</button>
					</div>
				</td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" onclick="doAdd()" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./backcheckInfoList.do'">返回</button>
		</div>
	</form>
</body>
</html>