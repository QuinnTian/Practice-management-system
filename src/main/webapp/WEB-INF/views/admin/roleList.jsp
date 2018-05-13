<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>角色列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	
	    //添加
		function add(){
		  window.location.href="addRole.do";
		}
		
		//删除
		function doDel(id,isBeOccupied,role_name){
			//alert(isBeOccupied);
			
			if(isBeOccupied){
				alert("该角色已经有用户使用，不能删除哦");
			}else{
			   if(window.confirm("您确定删除"+role_name+"这个角色吗?")){
		           window.location.href="deleteRole.do?id="+id;
				  }
			}
		}
	
	</script>
</head>
<body>
<h2 align='center'>角色列表</h2>
	<div style="margin-top:10px;margin-left:100px;">
		<input type="button" onclick="javascript:add();" value="添加角色"/>
	</div>
	<table border="1" width="1200"  class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<td width="">角色编码</td>
			<td width="">角色名称</td>
			<td width="">角色描述</td>
			<td width="">角色类别</td>
			<td width="">所属组织</td>
			<!-- <td width="150">状态</td> -->
			<td width="">操作</td>
		</tr>
		<c:forEach var="r" items="${rolelist}" varStatus="stauts">
			<tr>
				<td>${r.role_code}</td>
				<td><a href="editRole.do?role_id=${r.id}">${r.role_name}</a></td>			
				<td>${r.role_desc}</td>
				<td>${r.role_type_name}</td>
				<td>${r.college_name}</td>
				<%-- <td>${r.state}</td> --%>
				<td><input type="button" value="删除角色" onclick="doDel('${r.id}','${r.isBeOccupied}','${r.role_name}');"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
