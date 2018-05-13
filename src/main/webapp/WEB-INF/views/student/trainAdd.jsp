<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加实训作品</title>
<style type="text/css">
    h2 {
	   width: 100%;
	   height: 20px;
	   text-align: left;
        }
    </style>
    <!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<link href="/springmvc_mybatis/css/pageStyle.css" rel="stylesheet" type="text/css">
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
				 filesize = obj_file.files[0].size;  //单位为字节
                 filesizemb=filesize/1024;  //转换为kb
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
		var thesis_desc = document.getElementById("thesis_desc");
		if (practice_id.value == "0") {
			alert("请选择实训任务");
			return null;
		}
		if (thesis_name.value == "") {
			alert("请输入标题");
			thesis_name.focus();
			return null;
		}
		if (thesis_desc.value == "") {
			alert("请输入实训作品描述");
			thesis_desc.focus();
			return null;
		}else if(thesis_desc.length>70){
			alert("内容不能超过70个字");
		 	return null;
		}
		document.forms[0].submit();
	}
	function setValues() {
		var province = document.getElementById("practice_code");
		var pindex = province.selectedIndex;
		var pValue = province.options[pindex].value;
		var pText = province.options[pindex].text;
		document.getElementById("practice_name").value = pText;
	}
	/* function checkfile() {
		
	} */
</script>
</head>
<body>
	<h2>上传实训作品</h2>
	<form name="Form1" action="doAddGraduationThesis.do" method="post"
		enctype="multipart/form-data" >
		<!--  <input type="hidden"
			id="practice_id" name="practice_id"> --> 
		<input type="hidden" id="type" name="type" value="实训作品" >
		<img id="tempimg" dynsrc="" src="" style="display:none" />
		<input type="file" name="file" id="fileuploade" size="40" title="文件大小不能超过10M" onchange="fileChange(this);"/> 
		<!-- <input type="button" name="check" value="检查大小" onclick="checkfile()" /> -->
		<table border="0" width="1000">
			<tr>
				<td width="150">实训任务：</td>
				<td width="700">
						<select name="practice_id" id="practice_id"
							style="font-family: sans-serif" onchange="setValues()">
						<option value="0" >请选择</option> 
						<c:forEach var="gr" items="${practice_idList}" varStatus="status">
							<c:set var="pn" value="${gr.id}" scope="request"></c:set>
							<%
								String str_practice_id = (String) request.getAttribute("pn");
							%>
							 <option value="${gr.id}"> 
								<%
									out.println(DictionaryService.findPracticeTask(str_practice_id).getTask_name());
								%>
							</option> 
						</c:forEach>
						</select>
					</td>
			</tr>
			<tr>

				<td width="150">标题：</td>
				<td width="500"><input type="text" id="thesis_name"
					name="thesis_name" style="width:260px"></td>
			</tr>

			<tr>
				<td width="150">作品描述：</td>
				<td width="500">
		<textarea  style="resize:none" onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);" 
  					name="content" id="thesis_desc" cols="60" rows="4" style="overflow-y: scroll"></textarea> 
					 <div> 
						还可以输入<span style="font-family: Georgia; font-size: 26px;"
							id="wordCheck">70</span>个字符
					</div>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" onclick="doAdd()" value="保存" class="sjjx-button"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./trainList.do'" class="sjjx-button">返回</button>
		</div>
	</form>
</body>
</html>