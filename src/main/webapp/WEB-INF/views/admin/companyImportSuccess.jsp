<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title></title>
	<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: center;
}
</style>
	<script type="text/javascript">
	
	    //添加
		function backList(){
		  window.location.href="companyList.do?type="+"1";
		}
	</script>
</head>
<body>
	<h2>成功导入企业列表</h2>
	<input type="button" value="返回首页" onclick="backList()">
  	 <table border="1" width="1300" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="40">序号</th>
			<th width="180">企业名称</th>
			<th width="60">联系人</th>
			<th width="100">联系电话</th>
			<th width="250">企业地址</th>
			<th width="300">适用范围</th>
			<th width="150">行业</th>
			<th width="40">状态</th>
		</tr>
			
		<c:forEach var="c" items="${companyImportList}" varStatus="stauts">
			<tr>
				<td align="center">${stauts.index+1}</td>
				<td align="center">${c.com_name}</td>
				<td align="center">${c.contacts}</td>
				<td align="center">${c.phone}</td>
				<td align="center">${c.address}</td>
				<td align="center">
				<c:set var="scope" value="${c.applicable_scope}" scope="request"></c:set>
				<% 
				   String scope=(String)request.getAttribute("scope"); 
				   String[] coll_id = scope.split(",");
				   for(int i=0;i<coll_id.length;i++){
				   out.print(DictionaryService.findOrg(coll_id[i]).getOrg_name()+" ");
				   }
				   
	             %>
				</td>
				<td align="center">
				<c:set var="industry" value="${c.industry}" scope="request"></c:set>
				<%
				String industry =(String)request.getAttribute("industry");
				out.print(DictionaryService.getmapIndustryClassificationCode().get(industry));%></td>
				<td align="center">
				<%="有效" %>
				</td>
				</tr>
		</c:forEach>
	</table>
</body>
</html>
