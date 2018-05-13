<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户角色列表</title>
	<script type="text/javascript">
	
	    /* //添加
		function add(){
		  window.location.href="addRole.do";
		}
		
		//删除
		function doDel(id){
		  if(window.confirm("确定删除此角色吗?")){
           window.location.href="deleteRole.do?id="+id;
		  }
		} */
	
	</script>
</head>
<body>
<h2 align='center'>用户角色列表</h2>
	<form name="doinitCollegeRole" id="doinitCollegeRoleform" method="post" action="doinitCollegeRole.do">
		 <table border="0" width="1000">
		 	<tr>
				<td width="100">选择学院：</td>
				<td width="700">
				<select id="college_id" name="college_id" style="width:200px">
						<option value="无">无</option>
						<c:forEach var="orgList" items="${orgList}" varStatus="stauts">
							<option value="${orgList.id}">${orgList.org_name}</option>
						</c:forEach>
				</select>
				</td>
			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="submit" value="初始化角色及菜单" />&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</form>
</body>
</html>
