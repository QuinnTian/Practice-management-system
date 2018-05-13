<%@page import="com.sict.service.DirectRecordService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<style type="text/css">
	h2{
	    width:100%; 
	    height:20px;
	    text-align:left;
	}
</style>

<script type="text/javascript">
</script>
</head>
<body>
<h2>就业记录详细列表</h2>
	<table border="1" width="1500" id="table" class="sjjx-table" cellspacing="0" cellpadding="0">
	<tr id="header">
	<th width='70' align='center'>学号</th>
	<th width='70' align='center'>姓名</th>
	<th width='80' align='center'>实习任务</th>
	<th width='100' align='center'>企业名称</th>
	<th width='100' align='center'>岗位</th>
	<th width='50' align='center'>可否网签</th>
	<th width='50' align='center'>可否签合同</th>
	<th width='70' align='center'>企业指导老师</th>
	<th width='70' align='center'>企业指导老师电话</th>
	<th width='100' align='center'>公司地区</th>
	<th width='100' align='center'>工作地区</th>
	</tr>
	<c:forEach var="prl" items="${practiceRecordList}" varStatus="stauts">
			<tr>
				<td>
				<c:set var="stu_id" value="${prl.stu_id}" scope="request"></c:set>
				<% 
				String stu_id=(String)request.getAttribute("stu_id");
				out.print(DictionaryService.findStudent(stu_id).getStu_code());
				 %>
				</td>
				<td>
				<% 
				 out.print(DictionaryService.findStudent(stu_id).getTrue_name());
				 %>
				</td>
				<td>
				<c:set var="prac_id" value="${prl.practice_id}" scope="request"></c:set>
				<% 
				String prac_id = (String)request.getAttribute("prac_id");
				out.print(DictionaryService.findPracticeTask(prac_id).getTask_name());
				 %>
				</td>
				<td>
				<c:set var="company_id" value="${prl.company_id}" scope="request"></c:set>
				<% 
				String company_id = (String)request.getAttribute("company_id");
				out.print(DictionaryService.findCompany(company_id).getCom_name());
				 %>
				</td>
				<td>${prl.post_id}</td>
				<td>${prl.is_netsign}</td>
				<td>${prl.is_contract}</td>
				<td>${prl.com_teacher}</td>
				<td>${prl.com_phone}</td>
				<td>${prl.com_orgion}</td>
				<td>${prl.work_orgion}</td>	
			</tr>
		</c:forEach> 
	</table>
	<input type="button" value="返回" onclick="location.href='javascript:history.go(-1);'"/>
</body>
</html>
