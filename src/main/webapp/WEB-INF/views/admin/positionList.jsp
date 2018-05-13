<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
	<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
	<script type="text/javascript">
	
	    //添加
		function add(){
		  window.location.href="addPosition.do";
		}
		
		//删除
		function doDel(id){
		  if(window.confirm("确定删除此条吗?")){
           window.location.href="deletePosition.do?id="+id;
		  }
		}
	
	</script>
	<script type="text/javascript">
	function Select(state){
		window.location.href="PositionList.do?check_state="+state;
	}
	</script>
</head>
<body>
	<h2>企业岗位审核表：</h2>
	<p>
		<b>企业审核：</b>
		<a href="positionList.do?check_state=0">未审核（${check_count_0}）</a>
		<a href="positionList.do?check_state=1">已通过（${check_count_1}）</a>
		<a href="positionList.do?check_state=2">未通过（${check_count_2}）</a>
	</p>
	<table border="1" width="800">
		<tr>
			<th width="100">职位类别</th>
			<th width="150">岗位编码</th>
			<th width="300">岗位名称</th>
			<th width="150">岗位职责</th>
			<th width="150">父岗位id</th>
			<th width="150">审核备注</th>
			<th width="50">状态</th>
			<th width="50">操作</th>
		</tr>
			
		<c:forEach var="p" items="${result}" varStatus="stauts">
			<tr>
				<td align="center">${p.post_type}</td>
				<td align="center"><a href="editPosition.do?id=${p.id}">${p.post_code}</a></td>
				<td align="center"><a href="checkPosition.do?id=${p.id}">${p.post_name}</a></td>				
				<td align="center">${p.post_duties}</td>
				<td align="center">${p.parent_id}</td>
				<td align="center">${p.check_note}</td>
				<td align="center">
				<c:set var="state" value="${p.state}" scope="request"></c:set>
				<% 
					String state=(String)request.getAttribute("state");
					String stateName="有效";
					if(state.equals("0"))
						stateName="无效";
				%>
				 <%=stateName %>
				 </td>
				<td align="center"><input type="button" value="删除" onClick="doDel('${p.id}');"></td>
			</tr>
		</c:forEach>
	</table>
	<div style="margin-top:10px;margin-left:100px;">
		<input type="button" onClick="javascript:add();" value="添加"/>
	</div>
</body>
</html>
