<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改通知公告</title>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script><!-- 字数限制 -->
<script type="text/javascript" src="/springmvc_mybatis/js/checkTextArea.js"></script>
<script type="text/javascript">
	function doEdit() {
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
		var content = $("#content").val();
		if (content.length > 200) {
			alert("内容不能超过200个字");
			return null;
		} else if (content == "") {
			alert("内容不能为空");
			return null;
		} else if ($("#title").val() == "") {
			alert("标题不能为空");
			return null;
		} else {
			document.form1.submit();
		}
	}
</script>
</head>

<body>
	<h2>修改通知公告</h2>
	<form name="form1" id="form1" method="post" action="doEditlNotice.do" enctype="multipart/form-data">
		<img id="tempimg" dynsrc="" src="" style="display:none" /> 
		上传附件：&nbsp;&nbsp;&nbsp;<input type="file" name="file" id="fileuploade" size="30" title="文件大小不能超过10M" onchange="fileChange(this);"/> 
		<input type="hidden" name="id" name="id" value="${notice.id}">
		<table border="1" width="630">
			<tr>
				<th width="130">发布时间：</th>
				<td width="500"><input type="text"
					value="${notice.create_time}" disabled="disabled"
					style="width:100%;height:100%;" />
				</td>
			</tr>
			<tr>
				<th width="130">发布人</th>
				<td width="500"><c:set var="tea_id" value="${notice.tea_id}"
						scope="request"></c:set> <%
						 	String tea_id = (String) request.getAttribute("tea_id");
						 %>
					<input type="text"
					value="<%=DictionaryService.findTeacher(tea_id).getTrue_name()%>"
					disabled="disabled" style="width:100%;height:100%;" />
				</td>
			</tr>
			<tr>
				<th width="130">类型：</th>
				<td width="500"><c:set var="notice_type"
						value="${notice.notice_type}" scope="request"></c:set> <input
					type="text"
					value=<%String notice_type = (String) request.getAttribute("notice_type");
							if (notice_type.equals("1")) {
								out.print("院级通知");
							} else if (notice_type.equals("2")) {
								out.print("指导老师通知");
							} else {
								out.print("信息核对通知");
							}%>
					disabled="disabled" style="width:100%;height:100%;" /></td>
			</tr>
			<tr>
				<th width="130">标题：</th>
				<td width="500"><input type="text" name="title" id="title"
					value="${notice.title}" style="width:100%;height:100%;" />
				</td>
			</tr>
			<tr>
				<th width="130">内容：</th>
				<td width="500"><%-- <textarea name="content" id="content" rows="5"
						style="width:100%;height:100%;">${notice.content}</textarea> --%>
						<div class="wordCount" id="wordCount">
						<textarea name="content" rows="5" cols="35" style="resize:none"
							id="content">${notice.content}</textarea>
						<span class="wordwrap"><var class="word">200</var>/200</span>
					</div>
						
				</td>
			</tr>

			<tr>
				<th width="130">通知范围：</th>
				<td width="500"><textarea name="soid" rows="5"
						style="width:100%;height:100%;" disabled="disabled">
						<c:set var="sts" value="${notice.stu_id}" scope="request"></c:set>
						<c:set var="orgs" value="${notice.org_id}" scope="request"></c:set>
				<%
					String[] stu_ids = null;
					String stuIds = (String) request.getAttribute("sts");
					String orgs = (String) request.getAttribute("orgs");
					if (stuIds.length() == 0) {
						if (DictionaryService.findOrg(orgs) == null) {
							out.print(DictionaryService.findOrg(orgs).getOrg_name());
						} else {
							out.print("");
						}
					} else {
						stu_ids = stuIds.split(",");
						for (int i = 0; i < stu_ids.length; i++) {
							if (DictionaryService.findStudent(stu_ids[i]) != null) {
								out.print(DictionaryService.findStudent(stu_ids[i])
										.getTrue_name() + " ");
							} else {
								out.print(" ");
							}
						}
					}
				%>
		</textarea></td>
			</tr>
		</table>
		<div></div>
		<br>
		<input type="button" onClick="doEdit()" value="保存修改" />&nbsp;&nbsp;
		<button type="button" onClick="window.location='noticeList.do'">返回</button>
	</form>
</body>
</html>
