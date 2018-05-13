<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>菜单列表</title>
<script type="text/javascript">
	//添加
	function add() {
		window.location.href = "addSysMenu.do";
	}

	//
	function getByType() {
			$.ajax({
				type : "get",
				url : "getSysMenuListByType.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text",                
				success : function(data) { //成功时执行的方法					
					showSysMenuList(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
        function getSendData() {
			var temp1 = $("#temp1").val();	
			var dataSend = "temp1=" +temp1;			
			return dataSend;
		}
	function showSysMenuList(ajaxData) {
	     $("table[id='praTable'] tr[id!='biaotou']").remove();
	     $("#biaotou").after(ajaxData); 
		};

</script>

</head>
<body>
	&nbsp;&nbsp;&nbsp;
	<input type="button" onclick="javascript:add();" value="添加菜单" />
	<!-- <select id="temp1" name="temp1">
		<option value="1">管理员</option>
		<option value="2">教师</option>
		<option value="4">领导</option>
		<option value="3">学生</option>
		<option value="5">公司</option>
	</select>	<button  onclick="getByType();">查询</button>   wjg 以后加上模糊查询或者用框架-->
	<table border="1"  id="sysMenuList" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="">菜单名称</th>
			<th width="">菜单编码</th>
			<th width="">菜单标题</th>
			<th width="">父菜单名称</th>
			<th width="">菜单描述</th>
			<th width="">菜单级别</th>
			<th width="">菜单所属类别</th>
			<th width="">状态</th>
			<th width="">操作</th>
		</tr>
		<c:forEach var="g" items="${sysMenuList}" varStatus="stauts">
			<tr>
				<td><a href="sysMenuEdit.do?menuID=${g.id}">${g.sm_name}</a></td>
				<td>${g.sm_code}</td>
				<td>${g.sm_title}</td>
				<td>${g.sm_parent_name}</td>
				<td>${g.sm_description}</td>
				<td>${g.sm_istop_name}</td>
				<td>${g.sm_sort_name}</td>
				<td>${g.isused}</td>
				<td><a href="deleteSysMenu.do?menuID=${g.id}">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
