<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加实习任务</title>
<style type="text/css">
	h2 {
		width: 100%;
		height: 20px;
		text-align: left;
	}
	.div {
		border: 1px solid #F00;
		width: 300px;
	}
</style>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<link href="../css/pageStyle.css" rel="stylesheet" type="text/css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<script type="text/javascript">
	$(function() {
		var task_type = $("#task_type").val();
		if (task_type == "1") {
			 $("#TaskPlace").hide();
			 $("h2").text("添加实习任务");
		}else{
	   		 $("h2").text("添加实训任务");
	  }

	});
	//保存验证
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
		var begin_Time = document.getElementById("begin_Time");
		var end_Time = document.getElementById("end_Time");
		var task_Desc = document.getElementById("content");
		var task_name = document.getElementById("task_name");
		var task_namereplenish = document.getElementById("task_namereplenish");
		var information=$("#infor").html();
		var xibu = document.getElementById("xibu");
		var teacher = document.getElementById("teacher");
		var studyLength = document.getElementById("studyLength");
		if (studyLength.value=="0") {
			alert("请选择学制");
			return null;
		}
		if (begin_Time.value == "") {
			alert("请输入开始时间");
			begin_Time.focus();
			return null;
		}
		if (end_Time.value == "") {
			alert("请输入结束时间");
			end_Time.focus();
			return null;
		}
		if (end_Time.value < begin_Time.value) {
			alert("结束时间不能够早于开始时间，请重新选择！");
			return null;
		}
		if (xibu.value=="0") {
			alert("请先选择系部");
			return null;
		}
		if (teacher.value=="0"){
			alert("请选择负责教师");
			return null;
		} 
		if (task_namereplenish.value == "") {
			alert("请完善任务名称");
			task_namereplenish.focus();
			return null;
		}
		if (task_namereplenish.length >15) {
			alert("您的任务名过长，请缩短名称长度！");
			task_namereplenish.focus();
			return null;
		}
		if (information.length >=5) {
			alert("任务名重复，请重新输入");
			return null;
		}
		if (task_Desc.value == "") {
			alert("请输入任务描述");
			task_Desc.focus();
			return null;
		}else{
			document.forms[0].submit();
		}
	}
	//设置基本任务名
	function getTask_Name() {
		var grade = $("#grade").val();
		var tearcherName = $("#teacher").find("option:selected").text();
		var task_type = $("#task_type").val();
		if (task_type == "1") {
			var task_name = grade + "级实习" + "-" + tearcherName + "-";
		}else{
	   		var task_name = grade + "级实训" + "-" + tearcherName + "-";
	    }
		$("#task_name").val(task_name);
		console.log("task_name=" + task_name);
	}
	//ajax 获取系级别的老师
	function ajaxTeacher() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxPk_teacher.do?",
			data : getXiData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showTeachers(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}
	function showTeachers(ajaxData) {
		console.log(ajaxData);
		$("#teacher").html(ajaxData);
	}
	function getXiData() {
		var val = $("#xibu").val();
		var dataSend = "xibu=" + val;
		return dataSend;
	}

	//验证任务名是否重复
	function checkTaskNameRepeat() {
		$.ajax({
			type : "get",
			url : "checkTaskNameRepeat.do?",
			data : getTaskName(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为text                
			success : function(data) { //成功时执行的方法					
				showInfor(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getTaskName() {
		var a = $("#task_name").val();
		var b = $("#task_namereplenish").val();
		var c = a + b;
		var task_name = encodeURI(c);
		content = encodeURI(task_name);
		var dataSend = "content=" + content;
		return dataSend;
	}
	function showInfor(ajaxData) {
		 $("#infor").html(ajaxData); 
	}
</script>
</head>
<body>
	<h2></h2>
	<form name="Form2" action="doAddPracticeTask.do" method="post" id="formpractice" enctype="multipart/form-data" >
			<input type="hidden" name="fileid" value="${pt.file_id}">
			<input type="hidden" name="task_type" id="task_type" value="${task_type}">
			<img id="tempimg" dynsrc="" src="" style="display:none" /> 
	上传文件：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="file" id="fileuploade" size="30" title="文件大小不能超过10M" onchange="fileChange(this);"/> 
		<table border="0" width="1000">
			<tr>
				<td width="100">入学年份：</td>
				<td width="700"><select name="grade" id="grade"
					style="width:362px;" onchange="getTask_Name()">
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
				</select><font color="red" size="2px">&lt;-此选项保存后不能修改</font></td>
			</tr>
		    <tr >
				<td width="100">学制：</td>
				<td width="700">
				<select name="studyLength" id="studyLength">
						<option value="0">请选择</option>
						<option value="11">专科2.5+0.5</option>
						<option value="12">专科2+1</option>
						<option value="21">本科3+1</option>
						<option value="22">本科3.5+0.5</option>
						<option value="13">专科五年制</option>
						<option value="23">专本连读</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="100">开始时间：</td>
				<td width="700">
					<div>
						<input id="begin_Time" name="begin_Time" class="Wdate" type="text" onClick="WdatePicker()" size="50" placeholder="单击选择日期"> 
					</div>
				</td>
			</tr>
			<tr>
				<td width="100">结束时间：</td>
				<td width="700">
					<div>
						<input id="end_Time" name="end_Time" class="Wdate" type="text" onClick="WdatePicker()" size="50" placeholder="单击选择日期"> 
					</div>
				</td>
			</tr>

			<tr id="TaskPlace">
				<td width="100">任务地点：</td>
				<td width="700">
				<select name="task_Place" id="task_Place">
						<option value="校外">校外</option>
						<option value="校内">校内</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="100">选择系部：</td>
				<td width="700"><select id="xibu" name="xibu" onChange="ajaxTeacher()" style="width:362px;">
						<option value="0" selected="selected">请选择</option>
						<c:forEach var="o" items="${practiceTask_orgList}" varStatus="stauts">
							<option value="${o.id}">${o.org_name}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td width="100">教师：</td>
				<td width="700"><select id="teacher" name="tea_id" style="width:362px;" onchange="getTask_Name()">
						<option value="0" selected="selected">请选择</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="100">任务名称：</td>
				<td width="700">
				<input id="task_name" name="task_name" type="text" readonly> 
				<input id="task_namereplenish" name="task_namereplenish" type="text" onblur="checkTaskNameRepeat()" placeholder="请补充任务名称"> 
				<font color="read"><span id="infor"></span></font><br>
			<!-- 	<input type="text" value="" id="infor" disabled="disabled">  -->
				<font color="red" size="2px" id="font1">&lt;-推荐修改名称：2012级实习-负责人-所带班级.如：2012级实习-郑春光-精英班东忠班</font>
				<!-- <font color="red" size="2px" id="font2">&lt;-推荐修改名称：2012级实训-负责人-所带班级-课程名称.如：2012级实习-郑春光-精英班-java技术</font> -->
				</td>
			</tr>
			<tr>
				<td width="100">任务描述：</td>
				<td width="700">
				<textarea  style="resize:none" onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);" 
  				name="task_Desc" id="content" cols="60" rows="4" style="overflow-y: scroll"></textarea> 
					 <div> 
						还可以输入<span style="font-family: Georgia; font-size: 26px;"
							id="wordCheck">70</span>个字符
					</div></td>
			</tr>
		</table>
		<div style="margin-top:20px;" class=“sjjx-button-wrap”>
			<input type="button" class="sjjx-button" onclick="doAdd()" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="sjjx-button" onclick="window.location.href ='./backpracticetaskList.do'">返回</button>
		</div>
	</form>

</body>
</html>