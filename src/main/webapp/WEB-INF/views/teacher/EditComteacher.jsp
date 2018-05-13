<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>审核企业老师</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
</head>
  <body>
<h2 align="left">审核此老师</h2>
<script>
function Edit(){
		 $.ajax({
			type : "get",
			url : "teacher/getLoginAndPass.do?",
			data : getId(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json   
			success : function(data) { //成功时执行的方法
				showLoginAndPass(data);
			},
			error : function(result, sid) { //出错时会执行这里的回调函数                     
				if (sid == 'error') {
					console.log("调用失败");
				}
			}
		});

	}
	
	function getId() {
		var id = $("#aaa").val();
		console.log("dddddddd+++:" + id);
		var dataId = "id=" + id;
		return dataId;
	}
	
	function showLoginAndPass(ajaxData) {
		console.log("ajaxData:" + ajaxData);
		var LoginAndPass = ajaxData;
			var arr = new Array();
		 arr= LoginAndPass.split("-");
		console.log("arr:" + arr);
		 	$("#login").val(arr[0]);
			$("#pass").val(arr[1]);
			alert("已经自动分配企业老师的用户名和密码！"); 
}

function check(){
    $("#biaotou").show();
var content=$("#content").val();
	  if(content==""){
	   	alert("请填写不通过的原因！");
	   		
	   	return null;
	   	}
	   	else{
	   	
	   	document.saveForm.submit();
	   
	   	}

}
function check2(){
var login=$("#login").val();
	  if(login==""){
	   	alert("请先分配用户名及密码！");
	   	}
	   		else{
	   	document.saveForm.submit();
	   	}
	   		
	   	return null;

}

//隐藏文本框

	 window.onload=function() {
	 
	    	$("#biaotou").hide();

}
 function getOrg() {
		
			}
	/* 	
		else if (dept == "院系") {
			$("#but").show();
			$("#grade").hide();
		} else {
			$("#grade").show();
			$("#but").show();
		} */

</script>
	<form  id="saveForm" name="saveForm" method="post" action="teacher/submitForm.do">
	
		
<table id="table" class="table" width="690"  align="left"  border="0">
 <c:set var="ss" value="${teacher}" scope="request">
 </c:set> 
	<input	type="hidden" id="aaa" name="aaa" value="${ss.id}"/>
	<tr>
			<td width="85" height="30px">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
			 <c:set var="ss" value="${ss.id}" scope="request">
             </c:set> 
              <td>
			<%
				String name = (String) request.getAttribute("ss");
				out.println(DictionaryService.findTeacher(name).getTrue_name());
				%>
			</td>
	</tr>
		<tr>
			<td width="85" height="30px">身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份：</td>
              <td>
			     企业老师
			</td>
	</tr>
	<tr>
			<td width="85" height="30px">联系&nbsp;方式：</td>
              <td>
			<%
				String phone = (String) request.getAttribute("ss");
				out.println(DictionaryService.findTeacher(phone).getPhone());
				%>
			</td>
	</tr>
	<tr>
			<td width="85" height="30px">所属&nbsp;企业：</td>
              <td>
			<%
				String comId = (String) request.getAttribute("ss");
			String com = DictionaryService.findTeacher(comId).getDept_id();
			if(DictionaryService.findCompany(com) !=null){
			out.println(DictionaryService.findCompany(com).getCom_name());
			}
			else{
			out.println("无企业名称！");
			}
				%>
			</td>
	</tr>
	<tr>
			<td width="85" height="30px">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
			<td>  <input id="login" name="login" type="text" value="" /></td>
	</tr>
	<tr>
			<td width="85" height="30px">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
			<td>  <input  id="pass" name="pass" type="text" value="" /></td>
	</tr>
			<tr>
				<td width="100">用户角色：</td>
				<td width="700"><select id="userrole" name="userrole"
					style="width:362px;">
						<c:forEach var="o" items="${rolelist}" varStatus="stauts">
							<option value="${o.id}">${o.role_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr id="biaotou">
				<td width="75" height="30px" valign="top">不通过的原因：</td>
				<td width="250"><textarea style="resize:none"
						onkeyup="javascript:checkWord(this);"
						onmousedown="javascript:checkWord(this);" name="content"
						id="content" cols="45" rows="4" style="overflow-y: scroll"></textarea>
					<div>
						还可以输入<span style="font-family: Georgia; font-size: 26px;"
							id="wordCheck">70</span>个字符
					</div></td>
			</tr>
			<tr>
	    <td  width="85" height="30px">操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作：</td>
	    <td>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   <input type="button" value="分配用户名密码"  onclick="Edit()"/>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	       <input type="button" value="通过" onclick="check2()"  />
		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="不通过" onclick="check()" />
		   </td>
	</tr>
</table>
</form>
 </body>
</html>
