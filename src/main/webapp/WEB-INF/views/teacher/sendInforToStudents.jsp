<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>智能推送 添加通告</title>
<style type="text/css">
	h2{
	    width:100%; 
	    height:20px;
	    text-align:left;
	}
</style>
<script type="text/javascript">
	$(function() {
	//换行转回车
         var haha=document.getElementById("content").value;
         haha=haha.replace('<br />','/n');
         document.getElementById("content").value=haha;
	 });
	
	//全选操作
	function checkAll(flag){
		CBs=document.getElementsByName("students");
		for(var i=0;i<CBs.length;i++)
	    CBs[i].checked=flag;
	}
	/**
	 查出该老师的所选实习任务对应的学生 
	 wl
	 */
	function changeCK() {
		var selectedValue = document.getElementById("practice_id");
		var selectedIndex = selectedValue.selectedIndex;
		var ajaxUrl = "getStudents.do?practice_id="
				+ selectedValue.options[selectedIndex].value;
		ajaxFunction(ajaxUrl);
		document.getElementById("scope").style.display = "";
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
				if(result.length==20){
					alert("此任务没有对应的学生");
					document.getElementById("scope").style.display = "none";//隐藏div
					return null;
				}else{
					document.getElementById("scope").style.display = "";
					$("#select").html(result);
				}
			}
		};
		xmlHttp.open("GET", url, false);
		xmlHttp.send(null);
	}
	function getPracticeTask() {
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
	    function doAdd(){
		 var year = document.getElementById("year");
		 var practice_id = document.getElementById("practice_id");
		 var content = document.getElementById("content");
		 var notice_title = document.getElementById("notice_title");
		 	if (year.value == ""||year.value=="请选择入学年份") {
				alert("请选择入学年份");
				year.focus();
				return null;
			}	
		 	if (practice_id.value == ""||practice_id.value=="请选择任务") {
				alert("请选择任务");
				practice_id.focus();
				return null;
			}
			if (notice_title.value == "") {
				alert("请填写通知标题");
				notice_title.focus();
				return null;
			} 
			if (content.value == "") {
				alert("请填写内容");
				content.focus();
				return null;
			} 
		 	if($("#notice_range").val()==""){
		 		alert("通知范围不能为空");
		 		return null;
		 	}
		 	document.forms[0].submit();
		 }
</script>
</head>
<body>
<h2>推送招聘信息</h2><br>
	<form name="form1" id="myform" method="post" action="doAddRecruInfo.do">
		<table border="0" width="800" height="300">
			<tr>
					<td style="width:200px">入学年份：</td>
					<td width="700">
					<select name="year" id="year" onChange=getPracticeTask() style="width:260px">
							<option>请选择入学年份</option>
							<c:forEach var="grade" items="${Grade}" varStatus="stauts">
								<option value="${grade.grade}">${grade.grade}</option>
							</c:forEach>
					</select>
					</td>
			</tr>
			<tr>
				<td width="80">实习任务：</td>
				<td width="700">
				<select name="practice_id" id="practice_id" style="width:260px" onChange="changeCK()">
					<option value="0">请选择任务</option>
				</select></td>
			</tr>
			<tr>
		    <td width="80">通知标题：</td>
		    <td width="280"><input type="text" name="notice_title" id="notice_title" style="width:260px"></td>
	      	</tr> 
			<tr>
				<td width="80">推送内容：</td>
				<td width="700">
				<c:set var="com_id" value="${ri.com_id}" scope="request"></c:set>
				<c:set var="post_id" value="${ri.post_id}" scope="request"></c:set>
				<%String com_id = (String) request.getAttribute("com_id");%>
				<%String post_id = (String) request.getAttribute("post_id");%>
				<textarea name="content" id="content" rows="10" cols="50" style="resize:none" style="overflow-y:scroll">[开始时间:]<% out.println(); %><fmt:parseDate value="${ri.effect_time}" var="effect_time" /><fmt:formatDate value="${effect_time}" pattern="yyyy-MM-dd" /><% out.println(); %>[结束时间:]<% out.println(); %><fmt:parseDate value="${ri.end_time}" var="end_time" /><fmt:formatDate value="${end_time}" pattern="yyyy-MM-dd" /><% out.println(); %>[公司名称:]<% out.println(); %><%=DictionaryService.findCompany(com_id).getCom_name() %><% out.println(); %>[岗位名称:]<% out.println(); %>${ri.post_id}<% out.println(); %>[招聘描述:]<% out.println(); %>${ri.recruit_desc}<% out.println(); %>[招聘专业:]<% out.println(); %>${ri.recruit_prof}<% out.println(); %>[招聘人数:]<% out.println(); %>${ri.recruit_num}
				</textarea>
				</td>
			</tr>
			<tr>
				<td width="80">推送范围：</td>
				<td width="700">
				<input id="notice_range"  type="hidden" name="notice_range" onChange="setVals()" /> 
				<textarea rows="4" cols="40" id="temp1" name="temp1" disabled="disabled" style="resize:none"></textarea><font color="red" size="2px" id="font1">&lt;推送范围是暂时还没有工作的学生</font></td>
			</tr>
		</table>
		<p>
		<div id="scope" style="display:none">
			<table border="1">
				<tr id="select">
				</tr>
			</table>
			全选：<input type="checkbox" value="全选" onClick="checkAll(this.checked)">&nbsp;&nbsp;
			<button type="button" onclick="setVals()">确定</button>
		</div>
		<div style="margin-top:20px;">
			<input type="button" value="发送"  onclick="doAdd()"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./recruitInfoList.do'">返回</button>
		</div>
	</form>
</body>
</html>

