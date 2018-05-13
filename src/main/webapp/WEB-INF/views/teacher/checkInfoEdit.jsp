<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getServerName() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>修改核对信息</title>
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
<script src="//code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.min.js" type="text/javascript"></script>
<script language="javascript"  type="text/javascript" src="<%=path %>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script type="text/javascript">
function dosave() {
			var begin_time  = document.getElementById("begin_time");
			var end_time  = document.getElementById("end_time");
			var task_desc  = document.getElementById("maxcharfield");
			var task_name  = document.getElementById("task_name");
			if(begin_time.value==""){
			    alert("请输入开始时间");
				begin_time.focus();
				return ;
			}
			if(end_time.value==""){
				alert("请输入结束时间");
				end_time.focus();
				return ;
			}
			if(end_time.value < begin_time.value) {
				alert("结束时间不能够早于开始时间，请重新选择!");
				end_time.focus();
				return ;
			}
			if(task_desc.value==""){
				alert("请输入任务描述");
				task_desc.focus();
				return ;
			}
			if(task_name.value==""){
				alert("任务名称不能为空");
				teacher.focus();
				return ;
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
	<form name="Form2" action="doEditCheckInfo.do" method="post">
		<input type="hidden" name="id" value="${ic.id}">
		<h2>修改核对信息</h2>
		<br>
		<table border="0" width="1000">
			<tr>
				<td width="100">任务标题：</td>
				<td width="270"><input type="text" name="task_name" id="task_name"
					style="width:230px;" value="${ic.task_name}"></td>
			</tr>
			<tr>
				<td width="100">开始时间：</td>
				<td width="500">
					<div>
						<input value="${ic.begin_time}" id="begin_time" name="begin_time"
							class="Wdate" type="text"
							onClick="WdatePicker()" size="50">
					</div> 
				</td>
			</tr>
			<tr>
				<td width="100">结束时间：</td>
				<td width="500">
					<div>
						<input value="${ic.end_time}" id="end_time" name="end_time"
							class="Wdate" type="text"
							onClick="WdatePicker()" size="50"> 
					</div> 
				</td>
			</tr>
		
			<tr>
				<td width="100">任务描述：</td>
				<td width="270">
				<%-- <textarea name="task_desc" id="task_desc" cols="25" rows="2">${ic.task_desc}</textarea> --%>
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
			<input type="button" value="保存" onclick="dosave()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./backcheckInfoList.do'">返回</button>
		</div>
	</form>
	<script>textCounter(document.getElementById("maxcharfield"),"progressbar1",70)</script>
</body>
</html>
