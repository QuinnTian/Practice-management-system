<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加毕业论文信息</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
.progress{
 width: 1px;
 height: 14px;
 color: white;
 font-size: 12px;
    overflow: hidden;
 background-color: navy;
 padding-left: 5px;
}
</style>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<script type="text/javascript">
	function doAdd() {
		try {
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
		} catch (e) {
			alert(e);
		}
		var practice_id = document.getElementById("practice_id");
		var thesis_name = document.getElementById("thesis_name");
		var thesis_desc = document.getElementById("content");
		if (practice_id.value == "0") {
			alert("请先选择实习任务");
			return;
		}
		if (thesis_name.value == "") {
			alert("请输入论文标题");
			thesis_name.focus();
			return null;
		}
		if (thesis_desc.value == "") {
			alert("请输入本次论文描述");
			thesis_desc.focus();
			return null;
		} else if (thesis_desc.length > 70) {
			alert("内容不能超过70个字");
			return null;
		}
		document.forms[0].submit();
	}
	function textCounter(field,counter,maxlimit,linecounter) {
 // text width//
 var fieldWidth =  parseInt(field.offsetWidth);
 var charcnt = field.value.length;
 // trim the extra text
 if (charcnt > maxlimit) {
  field.value = field.value.substring(0, maxlimit);
 }
 else {
 // progress bar percentage
 var percentage = parseInt(100 - (( maxlimit - charcnt) * 100)/maxlimit) ;
 document.getElementById(counter).style.width =  parseInt((fieldWidth*percentage)/100)+"px";
 document.getElementById(counter).innerHTML="已输: "+percentage+"%"
 // color correction on style from CCFFF -> CC0000
 setcolor(document.getElementById(counter),percentage,"background-color");
 }
}
function setcolor(obj,percentage,prop){
 obj.style[prop] = "rgb(80%,"+(100-percentage)+"%,"+(100-percentage)+"%)";
}
</script>
</head>
<body>
	<form name="thesis_Form" action="doAddGraduationThesis.do" method="post"
		enctype="multipart/form-data">
		<h2>上传毕业论文</h2>
		<img id="tempimg" dynsrc="" src="" style="display:none" /> <input type="file" name="file"
			id="fileuploade" size="40" title="文件大小不能超过10M" onchange="fileChange(this);" />
		<!-- <input type="hidden" name="id" value="1"> -->
		<table border="0" width="1300">
			<tr>
				<td width="150">实习任务：</td>
				<td width="700"><select name="practice_id" id="practice_id" style="font-family: sans-serif"
						onchange="setValues()">
						<option value="0">请选择实习任务</option>
						<c:forEach var="practice_idList" items="${practice_idList}" varStatus="status">
							<c:set var="pn" value="${practice_idList.id}" scope="request"></c:set>
							<%
								String str_practice_id = (String) request.getAttribute("pn");
							%>
							<option value="${practice_idList.id}">
								<%
									out.println(DictionaryService.findPracticeTask(str_practice_id)
												.getTask_name());
								%>
							</option>
						</c:forEach>
					</select></td>
			</tr>
			<tr>
				<td width="70">版本号：</td>
				<td width="300">${currentVersion}<input type="hidden" name="version"
					value="${currentVersion}"></td>
			</tr>
			<tr>
				<td width="70">论文标题：</td>
				<td width="300"><input type="text" id="thesis_name" name="thesis_name" style="width:290px"></td>
			</tr>
			<tr>
				<td width="70">描述：</td>
				<td width="300">
					 <div>您最多可以输入70个字符	</div>
				<form>
        <textarea rows="5" cols="40" name="maxcharfield" id="maxcharfield" 
        onKeyDown="textCounter(this,'progressbar1',70)" 
        onKeyUp="textCounter(this,'progressbar1',70)" 
        onPaste="textCounter(this,'progressbar1',70)" 
        onFocus="textCounter(this,'progressbar1',70)" ></textarea>
</form>

     <div id="progressbar1" class="progress"></div> 
				</td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" id="save" value="保存" onclick="doAdd();" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./graduationThesisList.do'">返回</button>
		</div>
	</form>
	<script>textCounter(document.getElementById("maxcharfield"),"progressbar1",70)</script>
</body>
</html>