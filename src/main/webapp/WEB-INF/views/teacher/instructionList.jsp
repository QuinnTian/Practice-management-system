<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>就业指导</title>
 <link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	    //添加
		function add(){
		  window.location.href="instructionAdd.do";
		}
		//查看详细通知公告
		function doCheck(id){
		 
           window.location.href="checkNotice.do?id=";
		
		}
		//修改通知公告
		function doEdit(id){
		 
           window.location.href="editInstruction.do?id="+id;
		
		}
		//删除通知公告
		function doDelete(id){
		 if(window.confirm("确定删除此条吗?")){
           window.location.href="deleteInstruction.do?id="+id;
		}
		}
		//返回到上一个界面
	 	function doBack() {
	  		window.location.href = "studentList.do";
	 	}
	</script>
</head>
<body>
<h2>就业指导列表</h2>
	<table border="1" width="1040" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr>
			<th width="80">时间</th>
			<th width="80">类型</th>
			<th width="140">标题</th>
			<th width="400">内容</th>
			<th width="200">指导范围</th>
			<th width="140">操作</th>
		
		</tr>
		<c:forEach var="n" items="${result}" varStatus="stauts">
			<tr>
				<td  align="center">
				<fmt:parseDate value="${n.create_time}" var="create_time" />
				<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd" />
				</td>
				<td  align="center">
				就业指导
				</td>
				<td  align="center"><a href="instructionDetail.do?id=${n.id}">${n.title}</a></td>
				<td  align="center" class="content">${n.content}</td>
				<td  align="center">
				<c:set var="sts" value="${n.stu_id}" scope="request"></c:set>
				<% 
				   String stuIds=(String)request.getAttribute("sts"); 
				   String[] stu_ids = stuIds.split(",");
				   int showCount=5;
				   if(stu_ids.length<=5){
				   	showCount=stu_ids.length;
				   for(int i=0;i<showCount;i++){
				   	if(DictionaryService.findStudent(stu_ids[i]) !=null){
				   	out.print(DictionaryService.findStudent(stu_ids[i]).getTrue_name()+" ");
				   	}
				   }
				   }else{
				   String students="";
				    for(int i=0;i<showCount;i++){
				    	if(DictionaryService.findStudent(stu_ids[i])==null){
							out.print(" ");
						}else{
							students=students+DictionaryService.findStudent(stu_ids[i]).getTrue_name()+" ";
						 }
				   		
				   	}
				   	out.print(students+".....");
				   }
	             %>
				</td>
				<td align="center">
				<input type="button" value="修改" onclick="doEdit('${n.id}');">
				<input type="button" value="删除" onClick="doDelete('${n.id}');">
				</td>
			</tr>
		</c:forEach>
	</table>
	<div style="margin-top:10px;margin-left:100px;">
		<input type="button" onclick="javascript:add();" value="添加指导"/>
		   <button type="button" onClick="doBack();">返回学生列表</button>
	</div>
</body>
</html>
