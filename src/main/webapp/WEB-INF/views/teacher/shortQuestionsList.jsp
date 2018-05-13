<%@ page import="com.sict.service.DictionaryService" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.entity.Knowledge" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>专家指导回复</title>	
<script type="text/javascript">
//跳转到给定的页面page
		function becomePage(page){
			var toPage;//要跳转的页面
			var countPage;//一共的页数
			countPage=parseInt($("#countPage").val());
			if(page=="toPage"){
				toPage = $("#inpu").val();
			}else
			{
				var nowPage=$("#nowPage").val();
				toPage=parseInt(nowPage)+parseInt(page);
			}
			if(toPage<1){
				alert("超出最小页页码");
				return null;
			}else if(toPage>countPage){
				alert("超出最大页页码");
				return null;
			}
			document.getElementById('inpu').value="";
			url="getQuestionByPage.do?toPage="+toPage;
			ajaxFunction(url);
		}
		//转ajax
		function ajaxFunction(url) {
		//考虑到不同浏览器的兼容性，所以做出判断。
		var xmlHttp;
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveObject) {
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
		//监控和接受后台传的字符串
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var result = xmlHttp.responseText;
				var ss=result.split(",");
				$("table[id='questionTable'] tr[id!='biaotou']").remove();
	     		$("#biaotou").after(ss[0]);
	     		document.getElementById('nowPage').value=ss[1];
			}
		};
		xmlHttp.open("GET", url, false);
		xmlHttp.send(null);
	}

</script>
</head>
<body>
<h2>学生问题列表</h2>
	<table id="questionTable" border="1" width="1000"  style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="100">序号</th>
			<th width="400">问题</th>
			<th width="100">提问学生</th>
			<th width="100">学生所属班级</th>
			<th width="100">提问时间</th>
			<th width="100">状态</th>
			<th width="100">操作</th>
		</tr>
		
		<c:forEach var="k" items="${result}" varStatus="stauts">
			<tr>
				<td>${stauts.index+1}</td>
				<td>${k.question}</td>	
				<td>
				<c:set var="messenger_id" value="${k.messenger_id}" scope="request"></c:set>
				<% String messenger=(String)request.getAttribute("messenger_id"); %>
				<% out.println(DictionaryService.findStudent(messenger).getTrue_name()); %>
				</td>
				<td>
				<% String class_id=DictionaryService.findStudent(messenger).getClass_id();%>
				<% out.println(DictionaryService.findOrg(class_id).getOrg_name()); %>
				</td>
				<td>
				<fmt:parseDate value="${k.create_time}" var="create_time" />
				<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
				<td>
				<c:if test="${k.answer_time==null}"><font color="red">未解答</font></c:if>
				<c:if test="${k.answer_time!=null}"><font color="green">已解答</font></c:if>
				</td>
				
				<td>
				<c:if test="${k.answer_time==null}"><a href="shortQuestions.do?question_id=${k.id}"><font color="red">回答问题</font></a></c:if>
				<c:if test="${k.answer_time!=null}"><a href="shortQuestions.do?question_id=${k.id}"><font color="green">修改答案</font></a></c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div align="center">
		<input type="button" value="上一页"  onclick="becomePage('-1')">
		<input type="button" value="下一页" onclick="becomePage('1')">
		<input type="text" id="inpu" name="inpu" onkeyup="value=value.replace(/[^\d]/g,'')" style="width:40px;"><input type="button" value="GO" onclick="becomePage('toPage')"/>
		第<input type="text" name="nowPage" id="nowPage" value="${nowPage}" style="width:20px;" disabled="disabled"/>页
		<input type="hidden" name="countPage" id="countPage" value="${count}"><!--  -->
		<b><span id="cou">共  ${count} 页</span></b>
	</div>
</body>
</html>
