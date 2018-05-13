<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
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
<script src="//code.jquery.com/jquery-1.11.1.min.js"
	type="text/javascript"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	//全选操作
	function checkAll(flag){
	CBs=document.getElementsByName("students");
	for(var i=0;i<CBs.length;i++)
    CBs[i].checked=flag;
	}
	function getPracticeTask() {// 向服务器发送搜索请求
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "getPracticeTaskByGradeAndTeaId.do?",
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
	  function getStu() {
		if (document.getElementById("stu").style.display =="none") {
			document.getElementById("stu").style.display = "";

		} else {

			document.getElementById("stu").style.display = "none";

		}

	}
	function setvalue2() {
		var id = document.getElementsByName("students");
		var value="";
		var name = "";
		for ( var i = 0; i < id.length; i++) {
			if (id[i].checked){
				value += id[i].value + ",";
				name += id[i].nextSibling.nodeValue + ",";
				}
		}
		document.getElementById("xm").value = name;
		document.getElementById("stu_id").value = value;
		document.getElementById("stu").style.display ="none"; 
	}
	  //通过标准id查出指标列表
		function getIndex(){
		var selectedValue = document.getElementById("standard_id");
		var selectedIndex = selectedValue.selectedIndex;
		var ajaxUrl = "evaluateIdexList.do?standard_id="
				+  selectedValue.options[selectedIndex].value;
		ajaxFirstFunction(ajaxUrl);
	}
	function ajaxFirstFunction(url) {
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
				$("#evalName").html(result);

			}
		};

		xmlHttp.open("GET", url, false);

		xmlHttp.send(null);
	}
	/**
		查出该老师的所选实习任务对应的学生 by wl
	*/
	function changeCK() {
		var selectedValue = document.getElementById("practice_id");
		var selectedIndex = selectedValue.selectedIndex;
		var ajaxUrl = "studentListByPraCodeTeaCode.do?practice_id="
				+ selectedValue.options[selectedIndex].value;
		ajax(ajaxUrl);
		document.getElementById("scope").style.display = "";
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
				if(result.length=="20"){
					alert("此任务没有创建学生，请选择其他任务。");
				}
				$("#sel").html(result);
				
			}
		};

		xmlHttp.open("GET", url, false);

		xmlHttp.send(null);
	}
	
	 function doAdd(){
	 		var xm=$("#xm").val();
		 	if(xm.length==""){
		 		alert("请选择学生");
		 		return null;
		 	}else if($("#practice_id").val()=="0"){
		 		alert("实习任务不能为空");
		 		return null;
		 	}else if($("#standard_id").val()=="0"){
		 		alert("奖惩标准请选择");
		 		return null;
		 	}else if($("#evalName").val()=="0"){
		 		alert("奖惩指标不能为空");
		 		return null;
		 	}else if($("#standard_id").val()==""){
		 		alert("奖惩指标请选择");
		 		return null;
		 	}else if($("#time").val()==""){
		 		alert("奖惩时间不能为空");
		 		return null;
		 	}else if($("#place").val()==""){
		 		alert("奖惩地点不能为空");
		 		return null;
		 	}else if($("#description").val()==""){
		 		alert("奖惩描述不能为空");
		 		return null;
		 	}else{
		 		document.form1.submit();
		 	
		 	}
		 	
		 
		 }
</script>



</head>
<body>
<h2>添加奖惩信息</h2>
	<form name="form1" id="form1" method="post" action="addevaluate.do">
		<table border="0" width="500" height="238">
			<tr>
			<td width="120">入学年份：</td>
			<td width="300">
			<select name="year" id="year" onChange=getPracticeTask() style="width:100px">
			<option value="0">请选择</option>
			<c:forEach var="gr" items="${Grade}" varStatus="status">
			<option value="${gr.grade}">${gr.grade }</option>
		      </c:forEach>
		     </select>
			</td>
			</tr>
			<tr>
			<tr>
			<td width="120">选择实习任务</td>
			<td width="300">
			<select name="practice_id" id="practice_id" onChange="changeCK()" style="width:200px">
			<option value="0">请选择任务</option>
			</select>
			</td>
			</tr>
			<tr>
				<td width="120">选择奖惩标准：</td>
				<td width="300">
				<select name="standard_id" id="standard_id" style="width:200px" onChange="getIndex()">
				<option value="0">请选择标准</option>
				<c:forEach var="es" items="${evaResult}" varStatus="status">
				<option value="${es.id}">${es.standard_name}</option>
				</c:forEach>
				</select>
				</tr>
			<tr>
				<td width="100">请选择学生：</td>
				<td width="300"><input type="hidden" name="stu_id" id="stu_id" style="width:200px">
				<textarea style="resize:none" name="xm" id="xm" rows="4" disabled="disabled"></textarea>
				 <input type="button" name="but1" value="选择" onclick="getStu()"></td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="stu" style="display:none">
					<table border="1">
					<tr id="sel">
					</tr>
					</table>
						<br>
						全选：<input type="checkbox" value="全选" onClick="checkAll(this.checked)">&nbsp;&nbsp;
						<button type="button" onclick="setvalue2()">确定</button>
					</div></td>

			</tr>
			<tr>
				<td width="130">请选择奖惩类型：</td>
				<td width="300">
					<div>
						<select style="width:150px"  id="evalName" name="index_id">
							<option value="0">请选择类型</option>
						</select>
					</div>
					</td>
			</tr>
			
			<tr>
				<td width="80">发生时间：</td>
				<td width="300">
				<input type="text" name="time" id="time" class="Wdate" type="text"onClick="WdatePicker()"> 
				<font color=red>&lt;- 单击选择日期</font></td>
			</tr>
			<tr>
				<td width="80">发生地点：</td>
				<td width="300"><input type="text" id="place" name="place"></td>
			</tr>
			<tr>
				<td width="100">奖惩描述：</td>
				<td width="300"><textarea name="description" id="description" rows="4" style="resize:none"></textarea><span
					style="color:red;">&nbsp;*</span>
				</td>
			</tr>
		</table>
		<p>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doAdd()"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./evaluateList.do'">返回</button>
		</div>
	</form>
</body>
</html>
