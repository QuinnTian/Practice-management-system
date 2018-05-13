<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%
	String path = request.getContextPath();
	String basePath = request.getServerName() + "://"+request.getServerName() + ":" +request.getServerPort()+path+"/";
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改实训任务信息</title>
<link href="../css/pageStyle.css" rel="stylesheet" type="text/css">
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=path %>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<style type="text/css">
	h2{
	    width:100%; 
	    height:20px;
	    text-align:left;
	}



.progress{
 width: 1px;
 height: 14px;
 color: white;
 font-size: 12px;
    overflow: hidden;
 background-color: navy;
 padding-left: 5px;

</style>
<script type="text/javascript"> 
    //验证任务名重复性
	function checkTaskNameRepeat() {
		var ptask_name = $("#ptask_name").val();
		var task_name = $("#task_name").val();
		if(ptask_name!=task_name){
			$.ajax({
				type : "get",
				url : "checkTaskNameRepeat.do?",
				data : getTaskName(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为text                
				success : function(data) { //成功时执行的方法					
					showInfor(data);
				},
				error : function(result, status) {               
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
	}
	function getTaskName() {
		var a = $("#task_name").val();
		var task_name = encodeURI(a);
		content = encodeURI(task_name);
		var dataSend = "content=" + content;
		return dataSend;
	}
	function showInfor(ajaxData) {
	 	$("#infor").html(ajaxData);
	}
	//文件下载
	function downloadfile() {
		var fileid = $("input[name='fileid']").attr("value");
		if (fileid == "") {
			alert("此任务还没有文件，如果需要请点击浏览上传文件");
		} else {
			window.location.href = "downloadFile.do?file_id=" + fileid;
		}
	}
	//修改保存验证
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
		var information=$("#infor").html();
		var begin_time = document.getElementById("begin_time");
		var end_time = document.getElementById("end_time");
		var task_name = $("#task_name").val();
		if (task_name == ""){
			alert("请输入任务名称");
			task_name.focus();
			return null;
		}
		if (begin_time.value == "") {
			alert("请输入开始时间");
			begin_time.focus();
			return null;
		}
		if (end_time.value == "") {
			alert("请输入结束时间");
			end_time.focus();
			return null;
		}
		if (end_time.value < begin_time.value) {
			alert("结束时间不能够早于开始时间，请重新选择！");
			return null;
		}
		if (information.length >=5) {
			alert("任务名重复，请重新输入");
			return null;
		}
		document.forms[0].submit();
	}
	$(function() {
		var file = $("input[name='fileid']").attr("value");
		var task_type = $("#task_type").val();
		if (task_type == "1") {
			 $("h2").text("修改实习任务");
			 $("#download").attr("value","下载实习任务");
		}else{
	   		 $("h2").text("修改实训任务");
	   		 $("#download").attr("value","下载实训任务");
	  	}
		 var fileid = $("#fileid").val();
			 if(fileid==undefined||fileid==""){
			  $("table[id='attachmentTable'] tr[id!='attachment']").remove();
			  }
	});
	
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
    <h2></h2>
    <br>
	<form name="Form2" action="doEditPracticeTask.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${pt.id}">
        <input type="hidden" name="task_type" id="task_type" value="${task_type}">
		<input type="hidden" name="fileid" id="fileid" value="${file.id}">
		<input type="hidden" name="ptask_name" id="ptask_name" value="${pt.task_name}">
		<table border="0" width="1000">
			<tr>
				<td width="100">任务名称：</td>
				<td width="500"><input type="text" name="task_name" id="task_name"
					value="${pt.task_name}" size="55" onchange="checkTaskNameRepeat()">
					<font color="read"><span id="infor"></span></font>
					<!-- <input type="text" value="" id="infor" disabled="disabled"> -->
				</td>
			</tr> 
			<tr>
				<td width="100">开始时间：</td>
				<td width="500">
					<div>
						<input value="${pt.begin_time}" id="begin_time" name="begin_time"
							class="Wdate" type="text"
							onClick="WdatePicker()" size="50">
					</div> 
				</td>
			</tr>
			<tr>
				<td width="100">结束时间：</td>
				<td width="500">
					<div>
						<input value="${pt.end_time}" id="end_time" name="end_time"
							class="Wdate" type="text"
							onClick="WdatePicker()" size="50"> 
					</div> 
				</td>
			</tr>
			<tr>
				<td width="100">任务描述：</td>				
				<td width="500">
					 <div>您最多可以输入70个字符	</div>
        <textarea rows="5" cols="40" name="maxcharfield" id="maxcharfield" 
        onKeyDown="textCounter(this,'progressbar1',70)" 
        onKeyUp="textCounter(this,'progressbar1',70)" 
        onPaste="textCounter(this,'progressbar1',70)" 
        onFocus="textCounter(this,'progressbar1',70)" ></textarea>
     <div id="progressbar1" class="progress"></div> 

				</td>
			</tr>
			<%-- <tr>
				<td width="100">入学年份：</td>		
				<c:set var="grade" value="${pt.grade}" scope="request"></c:set>
			    <% String grade=(String)request.getAttribute("grade"); %>		
				<td width="500">
				<select name="grade" id="grade">
                  <option value="2012" <%="2012".equals(grade)?"selected":"" %>>2012</option>
                  <option value="2013" <%="2013".equals(grade)?"selected":"" %>>2013</option>
                  <option value="2014" <%="2014".equals(grade)?"selected":"" %>>2014</option>
                  <option value="2015" <%="2015".equals(grade)?"selected":"" %>>2015</option>
            </select>
				</td>
			</tr> --%>
		</table>
		
		<div>
		<hr width="900" align="left"/>
		附件(限制大小10M)
		<img id="tempimg" dynsrc="" src="" style="display:none" /> &nbsp;&nbsp;&nbsp;<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
		上传文件:
		<input type="file" name="file" id="fileuploade" value="${pt.file_id}" onchange="fileChange(this);"> 
		<table border="1" id="attachmentTable" class="sjjx-table" cellspacing="0" cellpadding="0">
	       <tr id="attachment">
	       	<th width="200">文件名称</th>
			<!-- <th width="200">文件大小</th> -->
			<th width="200">上传时间</th>
			<th width="200">下载</th></tr>	
			<tr>
			<%-- <c:set var="file_id" value="${practicefileid}" scope="request"></c:set>
			<%
				String file_id = (String) request.getAttribute("file_id");
				
			%> --%>
				<td>
				${file.file_name}
				</td>
				<%-- <td>
				${file.file_size}
				</td> --%>
				<td>
				${file.upload_time}
				</td>
				<td><input type="button" name="download" id="download" value="download" onclick="downloadfile()"></td>
			</tr>
		</table>
		</div>
		<div style="margin-top:20px;">
			<input type="button" onclick="doAdd()" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location.href ='./backpracticetaskList.do'">返回</button>
		</div>
	</form>
	<script>textCounter(document.getElementById("maxcharfield"),"progressbar1",70)</script>
</body>
</html>