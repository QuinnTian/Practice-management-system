<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加通告</title>
<style type="text/css">
        body,a{ font-size: 14px; color: #555;;}
        .wordCount{ position:relative;width: 495px;height: 145px }
        .wordCount textarea{ width: 100%; height: 100px;}
        .wordCount .wordwrap{ position:absolute; right: 6px; bottom: 6px;}
        .wordCount .word{ color: red; padding: 0 4px;;}
</style>
	<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
	<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script><!-- 字数限制 -->
	<script type="text/javascript" src="/springmvc_mybatis/js/checkTextArea.js"></script>
<script type="text/javascript">
	function doAdd(){
			var content=$("#content").val();
		 	if(content==""){
		 		alert("内容不能为空");
		 		return null;
		 	}else if($("#title").val()==""){
		 		alert("标题不能为空");
		 		return null;
		 	}else{
		 		document.form1.submit();
		 	}
		 }
</script>
</head>
<body>
<h2>添加通知</h2>
	<form name="form1" id="form1" method="post" action="doAddNotice.do" enctype="multipart/form-data">
		<img id="tempimg" dynsrc="" src="" style="display:none" /> 
		上传附件：&nbsp;&nbsp;&nbsp;<input type="file" name="file" id="fileuploade" size="30" title="文件大小不能超过10M" onchange="fileChange(this);"/> 
		<table border="1" width="600" height="190">
			<tr height="40">
				<th width="100">标题：</th>
				<td width="500"><input type="text" name="title" id="title" style="width:100%;height:100%;"/></td>
			</tr>
			<tr height="150">
				<th width="100">内容：</th>
				<td width="500">
				<div class="wordCount" id="wordCount" >
				<textarea name="content" id="content" rows="6" style="width:100%;height:100%;"></textarea>
				<span class="wordwrap"><var class="word">200</var>/200</span>
				</div>
				</td>
			</tr>
		</table>
	<div style="margin-top:20px;">
			<input type="button" value="发布通知"  onClick="doAdd()"/>
			<button type="button" onclick="window.location='./noticeList.do'">返回</button>
		</div>
	</form>
</body>
</html>

