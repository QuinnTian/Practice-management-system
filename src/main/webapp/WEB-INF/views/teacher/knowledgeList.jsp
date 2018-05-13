<%@ page import="com.sict.service.DictionaryService" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.entity.Knowledge" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="/springmvc_mybatis/css/datatables/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
 
<!-- DataTables -->
<script type="text/javascript" 	src="/springmvc_mybatis/js/datatables/jquery.dataTables.min.js"></script>

<title>常见问题列表</title>
 <style>
	h2{
		text-align:left;
	}
 </style>
	<script type="text/javascript">
	$(document).ready( function () {
    $('#table_id').DataTable();
} );
	    //添加
		function add(){
		  window.location.href="addKnowledge.do";
		}
		
		//删除
		function doDel(id,tea_id,creator_id){
		if(tea_id!=creator_id)
		{
			alert("只能删除本人发布的常见问题！");
			return null;
		}
			
		if(window.confirm("确定删除此问题吗?")){
           window.location.href="deleteKnowledge.do?id="+id;
		  }
		}
		//修改
		function editKnowledge(id){
			window.location.href="editKnowledge.do?id="+id;
			onclick="doEdit(${k.id},${tea_id},${k.messenger_id}";
		}
		function getTeacher() {// 向服务器发送搜索请求
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "getTeacherByDeptId.do?",
				data : getData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					showTeachers(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
		function getData() {
			var partId = $("#partId").val();	
			var dataSend = "partId=" + partId;			
			return dataSend;
		}
		function showTeachers(ajaxData) {//根据返回数据显示搜索结果
		$("#tea_id").html(ajaxData);
	    }; 
	   	//根据条件得到问题
	     function getKnowledge(){
	    $.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "getKnowledgeByConditions.do?",
				data : getCanShu(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					getTrain(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
	    }
	    //用来返回前一个页面的数据
	     function getKnowledge2(){
	    $.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "getKnowledgeByConditions.do?",
				data : getCanShu2(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					getTrain(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
	    }
	    function getCanShu() {
	    	var partId=$("#partId").val();
	    	var tea_id = $("#tea_id").val();
			var content = encodeURI($("#content").val());  
       			content = encodeURI(content);  
       		var dataSend = "tiaojian=" + partId+","+tea_id+","+content;		
			return dataSend;
		}
		 function getCanShu2() {
	    	var partId=$("#partId1").val();
	    	var tea_id = $("#tea_id1").val();
			var content = encodeURI($("#content1").val());  
       			content = encodeURI(content);  
       		var dataSend = "tiaojian=" + partId+","+tea_id+","+content;	
       		return dataSend;
		}
		window.onload = function() {
		var partId1=$("#partId1").val();
		var tea_id1 = $("#tea_id1").val();
		var content = $("#content1").val();
		if((partId1 !=null && partId1 !="") ||( tea_id1 !=null && tea_id1 !="")|| (content !="问题或答案或年份过滤")){
			if((partId1 !=null && partId1 !="0"||( tea_id1 !=null && tea_id1 !="0"))){
				getTeacher();
			}
			$("#hiddenBtn").click();
			}
		};
		function getTrain(ajaxData) {//根据返回数据显示搜索结果
		var infor=$("#content").val();
		if(infor !="问题或答案或年份过滤"){
			document.getElementById('content').style.color = "black";
		}
		$("table[id='table'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData); 
	    };
	   //重置按钮
		function reset(){
			$("#partId").find("option[value='0']").attr("selected",true); 
			$("#tea_id").html("<select id='tea_id' name='tea_id' style='width:100px'> <option value='0'>请选择老师</option></select>");
			document.getElementById("content").value="问题或答案或年份过滤";
		}
	    //判断 
		$(function(){ 
			$('.content').bind({ 
				focus:function(){ 
					if (this.value == "问题或答案或年份过滤"){ 
						this.value=""; 
					} 
				}, 
				blur:function(){ 
					if (this.value == ""){ 
						this.value = "问题或答案或年份过滤"; 
				} 
				} 
				}); 
			}); 
		//goBack()
		function goBack(){
			window.location.href="knowledgeList.do?type="+"1";
		}
	</script>
</head>
<body>
<h2>常见问题列表</h2>
<p>
		<input id="partId1" value="${knowledge_part_Id}"style="background-color:#666666; display:none;">
		<input id="tea_id1" value="${knowledge_tea_id}"style="background-color:#666666; display:none;">
		<input id="content1" value="${knowledgecontent}"style="background-color:#666666; display:none;">
   		<button id="hiddenBtn" style="background-color:#666666; display:none;" onclick="getKnowledge2();">Hidden
		Button</button>
		<c:set var="partId1" value="${knowledge_part_Id}" scope="request"></c:set>
		<%
			String partId1 = (String) request.getAttribute("partId1");
		%>
	范围：
		<select id="partId" name="partId" onChange="getTeacher()" style="width:120px">
		 <option value="0">请选择范围</option>
			<c:forEach var="o" items="${orgs}" varStatus="stauts">
				<option value="${o.id}" <c:if test="${o.id==partId1}">selected</c:if>>${o.org_name}</option>
			</c:forEach>
		</select>
		&nbsp;教师：
		<select id="tea_id" name="tea_id" style="width:100px">
		 <option value="0">请选择老师</option>
		</select>
		&nbsp;关键字：
		<input type="text" name="content" id="content" class="content" value="${knowledgecontent}">
		<input type="button" value="查询" onclick="getKnowledge();"/>
		&nbsp;&nbsp;
		<!-- <input type="button" value="重置" id="reset" onClick="reset();"/> --> 
		<input type="button" value="重置" id="reset" onClick="goBack();"/> 
		&nbsp;&nbsp;
		<input type="button" onclick="javascript:add();" value="新增常见问题"/>
		</p>
		<input type="hidden" value="${tea_id}">
	<table border="1" width="1300" id="table_id" style="overflow-x:hidden;overflow-y:hidden;"  class="display" cellspacing="0" cellpadding="0">
		<thead><tr id="biaotou">
			<th width="30">序号</th>
			<th width="200">问题</th>
			<th width="400">答案</th>
			<th width="100">发布人</th>
			<th width="250">适用范围</th>
			<th width="100">发布时间</th>
			<th width="50">修改</th>
			<th width="50">操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="k" items="${result}" varStatus="stauts">
			<tr>
				<td align="center">${stauts.index+1}</td>
				<td align="center">${k.question}</td>	
				<td align="center">${k.answer}</td>
				<td align="center"><c:set var="kt" value="${k.messenger_id}" scope="request"></c:set>
					<% String tea_id=(String)request.getAttribute("kt"); %>
					<% out.println(DictionaryService.findTeacher(tea_id).getTrue_name()); %>
				</td>
				<td align="center"><c:set var="or" value="${k.scope}" scope="request"></c:set>
					<% String org_id=(String)request.getAttribute("or"); %>
					<% out.println(DictionaryService.findOrg(org_id).getOrg_name()); %>
				</td>
				<td align="center"><fmt:parseDate value="${k.create_time}" var="create_time" />
					<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" /></td>
				<td align="center">
					<input type="button" value="修改" onclick="editKnowledge('${k.id}');">
				</td>
				<td align="center">
				<input type="button" value="删除" onclick="doDel('${k.id}','${tea_id}','${k.messenger_id}');"></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
</body>
</html>
