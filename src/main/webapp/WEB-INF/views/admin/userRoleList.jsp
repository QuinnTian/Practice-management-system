<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户角色分配</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	//添加
	function add() {
		window.location.href = "addUserRole.do";
	}

	//删除
	function doDel(id) {
		if (window.confirm("确定删除此用户的该角色吗?")) {
			window.location.href = "deleteUserRole.do?id=" + id;
		}
	}
	function ajaxUserRole() {// 向服务器发送搜索请求
		$.ajax({
			type : "get",
			/* contentType : "application/json", */
			url : "ajaxUserRole.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text",              
			success : function(data) { //成功时执行的方法					
				showUserRole(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getSendData() {
		var department_id = $("#department_id").val();
		var dataSend = "department_idAndrole_id=" + department_id;
		return dataSend;
	}

	function showUserRole(ajaxData) {//根据返回数据显示搜索结果
		/*  $("#mydiv").remove(); */
		$("table[id='praTable'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	};
</script>

</head>
<body>
	<h2>用户角色列表</h2>
	<p>
		<%-- <c:if test="${departmentlist.org_name==dept_name}"> selected</c:if> --%>
		<b>条件查询：</b> <select name="department_id" id="department_id">
			<c:forEach var="departmentlist" items="${departmentlist}"
				varStatus="stauts">
				<option value="${departmentlist.id}" <c:if test="${departmentlist.org_name==dept_name}"> selected</c:if>>
					${departmentlist.org_name}</option>
			</c:forEach>
		</select> &nbsp;&nbsp;
	<%-- 	<c:set var="roleList" value="${roleList}" scope="request"></c:set>
	  <% String roleList=(String)request.getAttribute("roleList"); %>  --%>
	<%-- 角色<select name="roleList" id="roleList" >
      <c:forEach var="roleList" items="${roleList}" varStatus="stauts">
      <option value="${roleList.id}"
      <c:if test="${roleList.org_name==dept_name}"> selected</c:if>>
      ${roleList.role_name}</option>
      </c:forEach>
       </select> --%>
		<input type="button" value="查询" id="seacher" onclick="ajaxUserRole();" />
		<input type="button" onclick="javascript:add();" value="用户角色分配" />
	</p>
	<table border="1" width="800" id="praTable" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="150">教师姓名</th>
			<th width="150">角色名称</th>
			<th width="150">状态</th>
			<th width="200">操作人和时间</th>
			<th width="150">操作</th>
		</tr>
		 <c:forEach var="t" items="${result}" varStatus="stauts">
			<tr>
				<td><c:set var="user_id" value="${t.user_id}" scope="request"></c:set>
					<%
						String user_id = (String) request.getAttribute("user_id");
					%> 
					<% out.println(DictionaryService.findTeacher(user_id).getTrue_name()); %>
				</td>
				<td><c:set var="role_id" value="${t.role_id}" scope="request"></c:set>
					<%
						String rid = (String) request.getAttribute("role_id");
					%> 
					<%
					 	out.println(DictionaryService.findRole(rid).getRole_name());
					 %>
				</td>
				<td>
				<c:if test="${t.state=='1'}">
				 有效
				</c:if>
				<c:if test="${t.state!='1'}">
				 无效
				</c:if>
				</td>
				<td>
				<c:if test="${t.temp1==null}">
				 无
				</c:if>
				<c:if test="${t.temp1!=null}">
				 ${t.temp1}
				</c:if>
				</td>
				<td><input type="button" value="删除" onclick="doDel('${t.id}');">
				</td>
			</tr>
		</c:forEach> 
	</table>
	
</body>
</html>
