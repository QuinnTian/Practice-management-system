<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>评分标准指标表</title>
    <script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
    <title>评分标准表</title>
    <script type="text/javascript">
    //通过时间和范围查出标准
	  function ajaxEvalIndex() {// 向服务器发送搜索请求
   			$.ajax({
   				type : "get",
				/* contentType : "application/json", */
				url : "getEvalIndex.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					showPractice(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
        function getSendData() {
        	var year = $("#year").val();	
			var scope =$("#scope").val();	
			var dataSend="tiaojian="+year+","+scope;
			return dataSend;
		}
	
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		 $("#id1").html(ajaxData); 
		};
 	//通过标准查出指标
 	 function getEvaluList() {
 	 $.ajax({
   				type : "get",
				/* contentType : "application/json", */
				url : "getEvaluList.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					showPractice(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
			  function getSendData() {
			var stand_id=$("#id1").val();
        	var dataSend="stand_id="+stand_id;
        	return dataSend;
		}
	
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#table1").html(ajaxData); 
		};
 	 }
	    //添加
		function add(){
		  window.location.href="addEvalsIndex.do";
		}
		
		//删除
		function doDel(id){
		  if(window.confirm("确定删除此评分标准?")){
           window.location.href="deleteEvalsIndex.do?id="+id;
		  }
		}
		//导入指标
		function importEvalsIndex(){
		window.location.href="importEvalsIndex.do";
		}
	
	</script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
	<script type="text/javascript">
		function doEdit(id){
			window.location.href="editEvalsIndex.do?id="+id;
		
		}
	</script>
  </head>
  
  <body>
  <h2>评分标准指标表</h2><br><hr>
     选择年份：&nbsp;&nbsp;<select name="year" id="year" style="width:80px">
        <option>请选择</option>
        <c:forEach var="year" items="${years}" varStatus="stauts">
        <option value="${year}">${year}</option>
        </c:forEach>
         </select>&nbsp;&nbsp;
        适用范围：&nbsp;&nbsp;<select name="scope" id="scope" style="width:110px" onchange="ajaxEvalIndex();">
    	<option>请选择</option>
    	<c:forEach var="org" items="${orgs}" varStatus="stauts">
        <option value="${org.id}">${org.org_name}</option>
        </c:forEach>
        </select>&nbsp;&nbsp;
     标准名称：&nbsp;&nbsp;<select name="id1" id="id1" style="width:210px">
    	<option>请选择</option>
    	</select>&nbsp;&nbsp;
    <input type="button" value="查询"id="seacher" onclick="getEvaluList();"/>
    <table border="1" width="950" id="table1">
		<tr>
			<th width="200">标准名称</th>
			<th width="200">指标名称</th>
			<th width="300">描述</th>
			<th width="50">分值</th>
			<th width="150">创建时间</th>
			<th width="50">操作</th>
		</tr>
			
		<c:forEach var="e" items="${result}" varStatus="stauts">
			<tr>
				<td width="150" align="center">
				<c:set var="standard_id" value="${e.standard_id}" scope="request"></c:set>
				<% String standard_id=(String)request.getAttribute("standard_id"); %>
				<%= DictionaryService.findEvaluateStandard(standard_id).getStandard_name() %>
				</td>				
				<td width="150" align="center"><a href="editEvalsIndex.do?id=${e.id}">${e.index_name}</a></td>
				<td width="150" align="center">${e.description}</td>
				<td width="150" align="center">${e.score}</td>
			<td width="150" align="center"><fmt:parseDate value="${e.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" /></td>
				<td width="150" align="center">
				<input type="button" value="修改" onClick="doEdit('${e.id}');">
				<input type="button" value="删除" onClick="doDel('${e.id}');"></td>
			</tr>
		</c:forEach>
	</table>
	<div style="margin-top:10px;margin-left:100px;">
		<input type="button" onClick="javascript:add();" value="添加指标"/>
		<input type="button" onClick="javascript:importEvalsIndex();" value="导入指标"/>
	</div>
  </body>
</html>
