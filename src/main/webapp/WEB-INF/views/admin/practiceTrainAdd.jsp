<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加实训任务</title>
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
<link href="../css/pageStyle.css" rel="stylesheet" type="text/css">
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
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
	 //文件上传的验证
	var maxsize = 10 * 1024 * 1024; //10M
	var kbsize = 1 * 1024 * 1024; //1M
	var errMsg = "上传的附件文件不能超过10M！！！";
	var tipMsg = "您的浏览器不支持，建议您使用Firefox 或者Chrome ,IE浏览器";
	var browserCfg = {};
	var ua = window.navigator.userAgent;
	if (ua.indexOf("MSIE") >= 1) {
		browserCfg.ie = true;
	} else if (ua.indexOf("Firefox") >= 1) {
		browserCfg.firefox = true;
	} else if (ua.indexOf("Chrome") >= 1) {
		browserCfg.chrome = true;
	} else if (ua.indexOf("opera") >= 1) {
		browserCfg.opera = true;
	}
	function fileChange(target, id) {
		var filesize = 0;
		var filetypes = [".jpg", ".png", ".rar", ".txt", ".zip", ".doc", ".ppt",".pptx", ".xls", ".pdf", ".docx", ".xlsx" ];
		var filepath = target.value;
		var filemaxsize = 1024 * 10;
		if (filepath) {
			var isnext = false;
			var fileend = filepath.substring(filepath.indexOf("."));
			if (filetypes && filetypes.length > 0) {
				for ( var i = 0; i < filetypes.length; i++) {
					if (filetypes[i] == fileend) {
						isnext = true;
						break;
					}
				}
			}
			if (!isnext) {
				alert("不接受此文件类型！");
				target.value = "";
				return false;
			}
		} else {
			return false;
		}
		var obj_file = document.getElementById("fileuploade");
		if (obj_file.value == "") {
				alert("请先选择上传文件");
				return;
			}
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
		var size = filesize / 1024;
		if (size > filemaxsize) {
			alert("附件大小不能大于" + filemaxsize / 1024 + "M！");
			target.value = "";
			return false;
		}
		if (size <= 0) {
			alert("附件大小不能为0M！");
			target.value = "";
			return false;
		}
	}
	
	
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
		var task_namereplenish1 = document.getElementById("task_namereplenish1");
		
		var information=$("#infor").html();
		var xibu = document.getElementById("xibu");
		var teacher =document.getElementById("teacher");
		
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
		//alert(teacher.value);
		if (teacher.value=="请选择"){
			alert("请选择负责教师");
			return null;
		} 
		if (task_namereplenish.value == "") {
			alert("请完善班级名称");
			task_namereplenish.focus();
			return null;
		}
		if (task_namereplenish1.value == "") {
			alert("请完善课程名称");
			task_namereplenish1.focus();
			return null;
		}
		if (task_namereplenish.length >15) {
			alert("您的班级名称过长，请缩短名称长度！");
			task_namereplenish.focus();
			return null;
		}
		if (task_namereplenish1.length >15) {
			alert("您的课程名称过长，请缩短名称长度！");
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
		var c = $("#task_namereplenish1").val();
		var d = a + b+c;
		var task_name = encodeURI(d);
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
				</select><font color="red" size="2px">&lt;-此选项保存后不能修改</font></td>
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
				<input id="task_namereplenish" name="task_namereplenish" type="text"  placeholder="请补充班级名称"> 
				<input id="task_namereplenish1" name="task_namereplenish1" type="text" onblur="checkTaskNameRepeat()" placeholder="请补充课程名称"> 
				<font color="read"><span id="infor"></span></font><br>
				<font color="red" size="2px" id="font1">&lt;-推荐修改名称：2012级实训-负责人-所带班级-课程名称.如：2012级实训-郑春光-精英班-java技术</font>
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