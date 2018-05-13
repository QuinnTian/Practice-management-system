<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改实训作品</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
<link href="/springmvc_mybatis/css/pageStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function doEdit() {
			try{  
                    var obj_file = document.getElementById("fileuploade");  
                    var filesize = 0;
                    if(obj_file.value!=""){  
	                    if(browserCfg.firefox || browserCfg.chrome||browserCfg.opera|| browserCfg.qq){  
	                        filesize = obj_file.files[0].size;  
	                    }else if(browserCfg.ie){  
	                        var obj_img = document.getElementById('tempimg');  
	                        obj_img.dynsrc=obj_file.value;  
	                        filesize = obj_img.fileSize;  
	                    }else{  
	                        alert(tipMsg);  
	                    return;  
	                    }
                    }  
                    if(filesize==-1){  
                        alert(tipMsg);  
                        return;  
                    }else if(filesize>maxsize){  
                        alert(errMsg);  
                        return;  
                    } 
                }catch(e){  
                    alert(e);  
                } 
			
			var thesis_name  = document.getElementById("thesis_name");
			var thesis_desc  = document.getElementById("content");
			/* var comment  = document.getElementById("comment"); 教师评阅后无法应该修改
			if (comment.value!=""){
				alert("教师已评论，不可修改，请上传新版本");
				return ;
			} */
			if (thesis_name.value==""){
				alert("请输入标题");
				thesis_name.focus();
				return ;
			}
			if (thesis_desc.value==""){
				alert("请输入描述");
				thesis_desc.focus();
				return ;
			}else if(thesis_desc.length>70){
				alert("内容不能超过70个字");
			 	return ;
			}
			document.forms[0].submit();
	}  	
	//下载
	function downloadFile(id) {
			window.location.href = "downloadFile.do?file_id=" + id;
	}
	
</script>
</head>
<body>
	<h2>修改实训作品</h2>
	<form name="Train_Form" action="doEditGraduationThesis.do" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="id" value="${gthesis.id}"> 
		<img id="tempimg" dynsrc="" src="" style="display:none" /> 
		<input type="file" name="file" id="fileuploade" value="${gthesis.file_id}" title="文件大小不能超过10M" onchange="fileChange(this);">
		<!-- <input type="button" name="check" value="检查文件大小" onclick="checkfile()" /> -->
		<!-- <font color=red>&lt;- 文件大小不能超过10M</font> -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="button" onclick="downloadFile('${gthesis.file_id}');" value="下载实训作品" id="download" /> 
		<input type="hidden" name="file_id" value="${gthesis.file_id}" />
		<table border="0" width="1000">
			<tr>
				<td width="100">标题：</td>
				<td width="300"><input type="text" name="thesis_name" id="thesis_name"
					value="${gthesis.thesis_name}"></td> 
			</tr>
			<tr>
				<td width="100">作品描述：</td>
				<td width="300">
				<textarea name="content" id="content" style="resize:none" onkeyup="javascript:checkWord(this);" onmousedown="javascript:checkWord(this);" 
  				 cols="60" rows="4" style="overflow-y: scroll">${gthesis.thesis_desc}</textarea> 
					 <div> 
						还可以输入<span style="font-family: Georgia; font-size: 26px;"
							id="wordCheck">70</span>个字符
					</div>
				</td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick ="doEdit()" class="sjjx-button"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./trainList.do'" class="sjjx-button">返回</button>
		</div>
	</form>
</body>
</html>
