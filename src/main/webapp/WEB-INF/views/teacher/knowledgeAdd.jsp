<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>常见问题添加</title>
<style>
	h2{
		text-align:left;
	}
</style>
<script type="text/javascript">
	function doAdd(){
		if($("#scope").val()=="请选择范围"){
			alert("请选择适用范围");
			return null;
		}else if($("#question").val()==""){
			alert("问题名称不能为空");
			return null;
		}else if($("#answer").val()==""){
			alert("问题答案不能为空");
			return null;
		}else{
		document.form1.submit();
		}
	}
</script>
</head>
<body>
<h2>常见问题添加</h2>
	<form name="form1" id="myform" method="post" action="doAddKnowledge.do">
	<p><b>适用范围：</b>&nbsp;&nbsp;&nbsp;
	<select id="scope" name="scope" style="width:120px">
	<option value="请选择范围">请选择范围</option>
	<c:forEach var="o" items="${orgs}" varStatus="stauts">
	<option value="${o.id}">${o.org_name}</option>
	</c:forEach>
	</select>
	</p>
		 <table border="0" width="400">
		 
			
			<tr>
				<th width="100">问题：</th>
				<td width="300"><input type="text" name="question" id="question" style="width:100%"/>
				</td>
			</tr>

			<tr>
				<th width="100">答案：</th>
				<td width="300"><textarea name="answer" rows="8" cols="30" id="answer" style="width:100%"></textarea>
				</td>
			</tr>
		</table>

		<div style="margin-top:20px;">
		<input type="button" onclick="doAdd();" value="保存" />
			<!-- <input type="submit" value="保存" /> -->&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./knowledgeList.do'">返回</button>
		</div>
	</form>
</body>
</html>

