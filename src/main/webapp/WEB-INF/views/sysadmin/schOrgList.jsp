<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%@ page import="com.sict.entity.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>参数列表</title>
<script type="text/javascript">
		//添加
		function add(){
		  window.location.href="schOrgAdd.do";
		}
</script>
</head>
<body>
  <h2 align='left'>校级组织管理</h2>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="button" value="添加" id="seacher" onclick="javascript:add();"/> 
  	<table id="orgListTable" border="1" width="1300"  style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<thead>
		<tr id="biaotou">
		    <th width="150" align="center">序号</th>
			<th width="150" align="center">组织编码</th>
			<th width="150" align="center">组织名称</th>
			<th width="150" align="center">组织级别</th>
			<th width="150" align="center">联系人</th>
			<th width="150" align="center">联系电话</th>
			<th width="150" align="center">上级部门</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="g" items="${orgList}" varStatus="stauts">
			<tr>
				<td>${stauts.index+1}</td>
				<td>${g.org_code}</td>
				<td>${g.org_name}</td>
				<td><c:if test="${g.org_level=='2'}">
				 院级
				</c:if>
				<c:if test="${g.org_level=='1'}">
				 校级
				</c:if></td>
				<td><c:set var="contacts" value="${g.contacts}" scope="request"></c:set>
				<% 
				String contacts = (String)request.getAttribute("contacts");
				if(contacts.length()>8){
						out.print(DictionaryService.findTeacher(contacts).getTrue_name());
					}else{
						out.print(contacts);
					}
				 %></td>
				<td>${g.phone}</td>
				
				
				
				<td>
				
			
				<c:set var="parent_id" value="${g.parent_id}" scope="request"></c:set>
				<%
				String parent_id = (String)request.getAttribute("parent_id");
				
				
				 Org org =   DictionaryService.findOrg(parent_id);
				 if(org!=null)
				 	out.println(org.getOrg_name());
				 %> 
				
			
				</td>
				 
				 
				 
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>
