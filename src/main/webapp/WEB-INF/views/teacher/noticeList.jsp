<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>通知管理</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript">
	//添加
	function add() {
		window.location.href = "addNotice.do";
	}
	//修改
	function doEditNotice(id) {
		window.location.href = "editlNotice.do?id=" + id;
	}
	//删除
	function doDel(id) {
		if (window.confirm("确定删除此公告?")) {
			window.location.href = "deleteNotice.do?id=" + id;
		}
	}
	//通知详情
	function doDetail(id) {
		window.location.href = "detailNotice.do?id=" + id;
	}
	//限制页面已加载时内容字符个数,
	$(function() {
		$('.content').each(function() {
			var maxwidth = 15;
			if ($(this).text().length > maxwidth) {
				$(this).text($(this).text().substring(0, maxwidth));
				$(this).html($(this).html() + '.....');
			}
		});
	});
	//判断并赋值
	$(function() {
		var countPage = parseInt($("#countPage").val());
		if (countPage == 0) {
			$("#nowPage").val("0");
		}

	});
	//跳转到给定的页面page
	function becomePage(page) {
		var toPage;//要跳转的页面
		var countPage;//一共的页数
		countPage = parseInt($("#countPage").val());
		if (page == "toPage") {
			toPage = $("#inpu").val();
		} else {
			var nowPage = $("#nowPage").val();
			toPage = parseInt(nowPage) + parseInt(page);
		}
		if (toPage < 1) {
			alert("超出最小页页码");
			return null;
		} else if (toPage > countPage) {
			alert("超出最大页页码");
			return null;
		}
		document.getElementById('inpu').value = "";
		url = "getNOticeByPage.do?toPage=" + toPage;
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
				var ss = result.split(",");
				$("table[id='notTable'] tr[id!='biaotou']").remove();
				$("#biaotou").after(ss[0]);
				document.getElementById('nowPage').value = ss[1];

			}
		};

		xmlHttp.open("GET", url, false);

		xmlHttp.send(null);
	}

	function download(file_id) {
		if (file_id == "") {
			alert("该通知没有资料下载！");
		} else {
			window.location.href = "downloadFile.do?file_id=" + file_id;
		}
	}
</script>
</head>
<body>
	<h2>通知公告列表</h2>
	<br>
	<h3>学院通知</h3>
	<table border="1" width="930"
		style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr>
			<th width="168">标题</th>
			<!-- <th width="70">类型</th> -->
			<th width="75">创建时间</th>
			<th width="160">内容</th>
			<th width="60">发布者</th>
			<th width="150">通知范围</th>
			<th width="130">操作</th>
		</tr>
		<c:forEach var="o" items="${college_NoticeList}" varStatus="stauts">
			<input type="hidden" id="id" name="id" value="${o.id}">
			<tr>
				<td class="left_td"><a href="detailNotice.do?id=${o.id}">${o.title}</a>
				</td>
				<td align="center"><fmt:parseDate value="${o.create_time}"
						var="create_time" /> <fmt:formatDate value="${create_time}"
						pattern="yyyy/MM/dd" />
				</td>
				<!-- <td align="center">院级通知</td> -->
				<td align="center" class="content">${o.content}</td>
				<td align="center"><c:set var="bl" value="${o.tea_id}"
						scope="request"></c:set> <%
 	String tea_id = (String) request.getAttribute("bl");
 %> <%
 	out.println(DictionaryService.findTeacher(tea_id)
 				.getTrue_name());
 %>
				</td>
				<td align="center"><c:set var="sts" value="${o.org_id}"
						scope="request"></c:set> <%
 	String org_id = (String) request.getAttribute("sts");
 %> <%
 	if (DictionaryService.findOrg(org_id) == null) {
 			out.print("");
 		} else {
 			out.print(DictionaryService.findOrg(org_id).getOrg_name());
 		}
 %>
				</td>
				<td class="left_td"><c:if test="${o.temp2==null}"> 没有附件</c:if> <c:if
						test="${o.temp2!=null}">
						<input type="button" value="下载附件"
							onclick="download('${o.temp2}');">
					</c:if>
				</td>
		</c:forEach>
	</table>
	<h3>
		本人发布通知 &nbsp; &nbsp;<input type="button" onclick="javascript:add();"
			value="发布通知" />
	</h3>

	<table border="1" width="990"
		style="overflow-x:hidden;overflow-y:hidden;" id="notTable"
		class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="168">标题</th>
			<!-- <th width="180">类型</th> -->
			<th width="75">创建时间</th>
			<th width="160">内容</th>
			<th width="60">发布者</th>
			<th width="150">通知范围</th>
			<th width="130">操作</th>
		</tr>
		<c:forEach var="n" items="${result}" varStatus="stauts">
			<input type="hidden" id="id" name="id" value="${n.id}">
			<tr>
				<td class="left_td"><a href="detailNotice.do?id=${n.id}">${n.title}</a>
				</td>
				<!-- <td align="center">
				指导教师通知
				</td> -->
				<td align="center"><fmt:parseDate value="${n.create_time}"
						var="create_time" /> <fmt:formatDate value="${create_time}"
						pattern="yyyy/MM/dd" />
				</td>
				<td align="center" class="content">${n.content}</td>
				<td align="center"><c:set var="bl" value="${n.tea_id}"
						scope="request"></c:set> <%
 	String tea_id = (String) request.getAttribute("bl");
 %> <%
 	out.println(DictionaryService.findTeacher(tea_id)
 				.getTrue_name());
 %>
				</td>
				<td class="left_td" class="name"><c:set var="sts"
						value="${n.stu_id}" scope="request"></c:set> <%
 	String stuIds = (String) request.getAttribute("sts");
 		String[] stu_ids = stuIds.split(",");
 		int showCount = 5;
 		if (stu_ids.length <= 5) {
 			showCount = stu_ids.length;
 			for (int i = 0; i < showCount; i++) {
 				if (DictionaryService.findStudent(stu_ids[i]) != null) {
 					out.print(DictionaryService.findStudent(stu_ids[i])
 							.getTrue_name() + " ");
 				}
 			}
 		} else {
 			String students = "";
 			for (int i = 0; i < showCount; i++) {
 				if (DictionaryService.findStudent(stu_ids[i]) == null) {
 					out.print(" ");
 				} else {
 					students = students
 							+ DictionaryService.findStudent(stu_ids[i])
 									.getTrue_name() + " ";
 				}

 			}
 			out.print(students + ".....");
 		}
 %>
				</td>
				<td class="left_td"><input type="button" value="修改"
					onclick="doEditNotice('${n.id}');"> <input type="button"
					value="删除" onclick="doDel('${n.id}');"> <%-- <c:if test="${o.temp2!=null}"> 没有附件</c:if> --%>

					<c:if test="${n.temp2!=null}">
						<input type="button" value="下载附件"
							onclick="download('${n.temp2}');">
					</c:if>
				</td>
		</c:forEach>
	</table>
	<div align="center">
		<input type="button" value="上一页" onclick="becomePage('-1')"> <input
			type="button" value="下一页" onclick="becomePage('1')"> <input
			type="text" id="inpu" name="inpu"
			onkeyup="value=value.replace(/[^\d]/g,'')" style="width:40px;"><input
			type="button" value="GO" onclick="becomePage('toPage')" /> 第<input
			type="text" name="nowPage" id="nowPage" value="${SelfnowPage}"
			style="width:20px;" disabled="disabled" />页 <input type="hidden"
			name="countPage" id="countPage" value="${SelfCount}">
		<!--  -->
		<b>共 <span id="cou">${SelfCount}</span> 页</b>
	</div>

</body>
</html>
