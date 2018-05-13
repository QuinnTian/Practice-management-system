<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page import="com.sict.service.DirectRecordService"%>
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
	//通过学号和实习id查出该学生的就业详细记录 by王磊 2015年5月29日
	function getMorePracticeRecord(stu_id,prac_id){
		  window.location.href="getMorePracticeRecordList.do?stu_id="+stu_id+"&prac_id="+prac_id;
	}
	//通过年级查出该老师的实习任务 by王磊2015年5月29日
	function getPracticeTask() {// 向服务器发送搜索请求
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "getPracticeTaskByGrade.do?",
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
			var grade = $("#grade").val();	
			var dataSend = "grade=" + grade;			
			return dataSend;
		}
		function showPractice(ajaxData) {//根据返回数据显示搜索结果
			$("#practice_id").html(ajaxData);
	    };
		//通过实习id查出此实习下的最近的就业记录 
		function getPracticeRecordById() {// 向服务器发送搜索请求
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "getPracticeRecordById.do?",
				data : getData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					showPracticeRecord(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
		function getData() {
			var practiceTaskId = $("#practice_id").val();	
			var dataSend = "practiceTaskId=" + practiceTaskId;	
			return dataSend;
		}
		//用来返回前一个页面的数据
	    function getPracticeRecordById2() {// 向服务器发送搜索请求
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "getPracticeRecordById.do?",
				data : getData2(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					showPracticeRecord(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
		function getData2() {
			var practiceTaskId = $("#practiceId1").val();	
			var dataSend = "practiceTaskId=" + practiceTaskId;	
			return dataSend;
		};
		window.onload = function() {
		var grade1=$("#grade1").val();
		var practiceId1 = $("#practiceId1").val();
		if((grade1 !=null && grade1 !="") && ( practiceId1 !=null && practiceId1 !="")){
				getPracticeTask();
				$("#hiddenBtn").click();
			}
		};
		function showPracticeRecord(ajaxData) {//根据返回数据显示搜索结果
			$("table[id='practiceRecordTable'] tr[id!='biaotou']").remove();
			$("#biaotou").after(ajaxData);
	    };
</script>
</head>
<body>
<h2>实习就业记录列表</h2>
		<input id="grade1" value="${practiceRecord_grade}" style="display:none;">
		<input id="practiceId1" value="${practiceRecord_practiceTaskId}" style="display:none;">
   		<button id="hiddenBtn" style="background-color:#666666; display:none;" onclick="getPracticeRecordById2();">Hidden</button> 
		<c:set var="grade1" value="${practiceRecord_grade}" scope="request"></c:set>
		<c:set var="practiceId1" value="${practiceRecord_practiceTaskId}" scope="request"></c:set>
		<%
			String grade1 = (String) request.getAttribute("grade1");
			String practiceId1 = (String) request.getAttribute("practiceId1");
		%>
	<p>
	实习年级:<select id="grade" name="grade" onChange="getPracticeTask()" style="width:70px">
		 	<c:forEach var="grade" items="${grades}" varStatus="stauts">
				<option value="${grade}" <c:if test="${grade==grade1}">selected</c:if>>${grade}</option>
			</c:forEach>
		</select>
	实习任务：
		<select id="practice_id" name="practice_id" style="width:200px">
		<c:forEach var="pts" items="${practiceTasks}" varStatus="stauts">
				<option value="${pts.id}" <c:if test="${pts.id==practiceId1}">selected</c:if>>${pts.task_name}</option>
		</c:forEach>
		</select>
	<input type="button" value="查询" onclick="getPracticeRecordById()"/>	
	</p>
	<table border="1" width="1500" id="practiceRecordTable" class="sjjx-table" cellspacing="0" cellpadding="0">
	<tr id="biaotou">
	<th width='70' align='center'>学号</th>
	<th width='70' align='center'>姓名</th>
	<!-- <th width='80' align='center'>实习任务</th> -->
	<th width='120' align='center'>企业名称</th>
	<th width='120' align='center'>核对时间</th>
	<th width='100' align='center'>岗位</th>
	<th width='50' align='center'>可否网签</th>
	<th width='50' align='center'>可否签合同</th>
	<th width='70' align='center'>企业指导老师</th>
	<th width='70' align='center'>企业指导老师电话</th>
	<!-- <th width='100' align='center'>公司地区</th> -->
	<th width='100' align='center'>工作地区</th>
	<th width='70' align="center">操作</th>
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
				<%-- <td>
				<c:set var="prac_id" value="${prl.practice_id}" scope="request"></c:set>
				<% 
				String prac_id = (String)request.getAttribute("prac_id");
				out.print(DictionaryService.findPracticeTask(prac_id).getTask_name());
				 %>
				</td> --%>
				<td>
				<c:set var="company_id" value="${prl.company_id}" scope="request"></c:set>
				<% 
				String company_id = (String)request.getAttribute("company_id");
				out.print(DictionaryService.findCompany(company_id).getCom_name());
				 %>
				</td>
				<td>
				<fmt:parseDate value="${prl.check_time}" var="check_time" />
					<fmt:formatDate value="${check_time}" pattern="yyyy/MM/dd" />
					</td>
				<td>${prl.post_id}</td>
				<td>
					<c:set var="is_netsign" value="${prl.is_netsign}" scope="request"></c:set>
				<% 
					String is_netsign=(String)request.getAttribute("is_netsign");
					String netsign="是";
					if(is_netsign.equals("2"))
						netsign="否";
				%>
				 <%=netsign %>
				</td>
				<td>
					<c:set var="is_contract" value="${prl.is_contract}" scope="request"></c:set>
				<% 
					String is_contract=(String)request.getAttribute("is_contract");
					String contract="是";
					if(is_netsign.equals("2"))
						contract="否";
				%>
				 <%=contract %>
				</td>
				<td>${prl.com_teacher}</td>
				<td>${prl.com_phone}</td>
				<%-- <td>${prl.com_orgion}</td> --%>
				<td>${prl.work_orgion}</td>	
				<td><input type="button" value="历史更多" onclick="getMorePracticeRecord('${prl.stu_id}','${prl.practice_id}');"></td>
			</tr>
		</c:forEach> 
	</table>
</body>
</html>
