<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加毕业论文</title>
	<style type="text/css">
	h2 {
		width: 100%;
		height: 20px;
		text-align: left;
	}
	</style>
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<!-- 	<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
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
			}/* else if(filesize<kbsize){  
						                        alert("您的文件大小为："+(filesize/1024).toFixed(2)+"kb,文件大小符合要求.");  
						                        return;  
						                    }else{  
						                        alert("您的文件大小为："+(filesize/1024/1024).toFixed(2)+"MB,小于10MB,"+"文件大小符合要求.");  
						                        return;  
						                    }  */
		} catch (e) {
			alert(e);
		}
		var materials_type = document.getElementById("materials_type");
		var materials_name = document.getElementById("materials_name");
		var practice_id = document.getElementById("practice_id");
		if (practice_id.value == "0") {
			alert("请先选择实习任务");
			return;
		}
		if (materials_type.value == "") {
			alert("请输入材料类型");
			materials_type.focus();
			return;
		}
		if (materials_name.value == "") {
			alert("请输入本次材料名称");
			materials_name.focus();
			return;
		}
		document.forms[0].submit();
	}
</script>
</head>
<body>
	<form name="Materials_Form" action="doAddGraduationMaterials.do"
		method="post" enctype="multipart/form-data">
		<h2>上传就业材料</h2>
		<img id="tempimg" dynsrc="" src="" style="display:none" /> <input
			type="file" name="file" id="fileuploade" size="40"
			title="文件大小不能超过10M" onchange="fileChange(this);" />&nbsp;&nbsp; <input
			type="button" name="check" value="检查大小"
			style="background-color:#666666; display:none;" />
		<table border="0" width="1300">
			<tr>
				<td width="100">实习任务：</td>
				<td width="700"><select name="practice_id" id="practice_id"
					style="font-family: sans-serif" onchange="setValues()">
						<option value="0">请选择任务</option>
						<c:forEach var="ptList" items="${ptList}" varStatus="status">
							<c:set var="ptList_id" value="${ptList.id}" scope="request"></c:set>
							<%
								String str_practice_id = (String) request
											.getAttribute("ptList_id");
							%>
							<option value="${ptList.id}">
								<%
									out.println(DictionaryService.findPracticeTask(str_practice_id)
												.getTask_name());
								%>
							</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td width="100">材料名称：</td>
				<td width="300"><input type="text" id="materials_name" name="materials_name"  style="width:290px">
				</td>
			</tr>
			<tr>
				<td width="100">材料类型：</td>
				<td width="300"><select name="materials_type" id="materials_type" style="font-family: sans-serif ;width:290px" >
						<option value="身份证扫描件">身份证扫描件</option>
						<option value="合同扫描件">合同扫描件</option>
						<option value="获奖扫描件">获奖扫描件</option>
				</select></td>
			</tr>
			<!-- <tr>
				<td width="100">材料类型：</td>
				<td>
						 <textarea  style="resize:none" onkeyup="javascript:checkWord(this);"
							onmousedown="javascript:checkWord(this);" name="content"
							   cols="90" rows="10" style="overflow-y: scroll"></textarea> 
					 <div> 
						还可以输入<span style="font-family: Georgia; font-size: 26px;"
							id="wordCheck">70</span>个字符
					</div>
				</td>
			</tr> -->

		</table>
		<div style="margin-top:20px;">
			<input type="button" onclick="doAdd()" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button"
				onclick="window.location='./graduationMaterialsList.do'">返回</button>
		</div>
	</form>
</body>
</html>