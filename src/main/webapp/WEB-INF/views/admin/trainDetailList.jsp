<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>实训安排列表</title>
<style type="text/css">
    h2 {
	   width: 100%;
	   height: 20px;
	   text-align: left;
        }
    </style>

	<script type="text/javascript">
	
	    //添加
		function trainDetailImport(){
		  window.location.href="trainDetailImport.do";
		}
		
		//删除
		function doDel(id){
		  if(window.confirm("确定删除此实训安排?")){
           window.location.href="deleteTrainDetail.do?id="+id;
		  }
		}
		//修改
		function doEdit(id){
			 window.location.href="editTrainDetail.do?id="+id;
		}
	</script>
	<script type="text/javascript">
	//获得管理员所管理系的老师
	function getTeacher() {// 向服务器发送搜索请求
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "getTeacherByDeptId.do?",
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
			var dept_id = $("#dept_id").val();	
			var dataSend = "dept_id=" + dept_id;			
			return dataSend;
		}
		function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#tea_id").html(ajaxData);
	    };
	    //通过教师id和入学年份得到老师所对应的任务
	   /*  function getPracticeTask(){
	    $.ajax({
				type : "get",
				url : "getPracticeTaskByYearAndTeacher.do?",
				data : getCanShu(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					getPt(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
	    }
	    function getCanShu() {
			var grade = $("#grade").val();	
			var tea_id=$("#tea_id").val();
			if(tea_id==0){
				tea_id=$("#tea_id1").val();
			}
			var dataSend = "tiaojian=" + grade+","+tea_id;	
			return dataSend;
		}
		function getPt(ajaxData) {//根据返回数据显示搜索结果
		$("#practiceTask_id").html(ajaxData);
	    }; */
	    //通过实践教学任务的id。//再次修改。
	     function getTrainDetail(){
	     var year = $("#year").val();
	     var dept_id = $("#dept_id").val();	
	     if (year=="0"){
	     	alert("请选择实训年份");
	     	return null;
	     }else if(dept_id=="0"){
	     	alert("请选择部门");
	     	return null;
	     }else{
	    $.ajax({
				type : "get",
				url : "getTrainDetailByTaskId.do?",
				data : getCanShu1(), //设置发送参数，即使参数为空，也需要设置                
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
	    }
	    function getCanShu1() {
			var year = $("#year").val();
			var dept_id = $("#dept_id").val();
			var term=$("#term").val();
			var tea_id = $("#tea_id").val();
			//var practiceTask_id = $("#practiceTask_id").val();	
			var dataSend = "tiaojian=" + year+","+dept_id+","+tea_id+","+term;			
			return dataSend;
		}
		//返回上一个界面
		//得到实践任务列表
		  function getTrainDetail2(){
	       $.ajax({
				type : "get",
				url : "getTrainDetailByTaskId.do?",
				data : getCanShu1(), //设置发送参数，即使参数为空，也需要设置                
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
	    function getCanShu2() {
			var year = $("#year1").val();
			var dept_id = $("#dept_id1").val();
			var team=$("#term1").val();
			var tea_id = $("#tea_id1").val();
			var dataSend = "tiaojian=" + year+","+dept_id+","+tea_id+","+team;			
			return dataSend;
		}
		function getTrain(ajaxData) {//根据返回数据显示搜索结果
			$("#table").html(ajaxData); 
	    };
	    window.onload = function() {
	    var dept_id = $("#dept_id1").val();
		if((dept_id !=null && dept_id !="")){
			getTeacher();
			$("#hiddenBtn").click();
			}
		};
/* 		 //重置按钮
		function reset(){
			$("#year").find("option[value='0']").attr("selected",true); 
			$("#dept_id").find("option[value='0']").attr("selected",true); 
			$("#tea_id").find("option[value='0']").attr("selected",true);
			$("#term").find("option[value='1']").attr("selected",true);
		} */
		//goBack()
		function goBack(){
			window.location.href="trainDetailList.do?type="+"1";
		}
</script>
</head>
<body>	
    <h2>实训安排列表</h2>
    <br>
    	<input id="year1" value="${year1}"style="background-color:#666666;display:none;">
		<input id="dept_id1" value="${dept_id1}"style="background-color:#666666;display:none;">
		<input id="tea_id1" value="${tea_id1}"style="background-color:#666666;display:none;">
		<input id="term1" value="${term1}"style="background-color:#666666;display:none;">
   		<button id="hiddenBtn" style="background-color:#666666; display:none;" onclick="getTrainDetail2();">Hidden
		Button</button>
		<c:set var="year1" value="${year1}" scope="request"></c:set>
		<c:set var="dept_id1" value="${dept_id1}" scope="request"></c:set>
		<c:set var="tea_id1" value="${tea_id1}" scope="request"></c:set>
		<c:set var="term1" value="${term1}" scope="request"></c:set>
		<%
			String year1 = (String) request.getAttribute("year1");
			String dept_id1 = (String) request.getAttribute("dept_id1");
			String term1 = (String) request.getAttribute("term1");
		%>
    条件查询:实训时间:<select id="year" name="year">
    			<option value="0">请选择实训年份</option>
    			<c:forEach var="finalYear" items="${finalYears}" varStatus="stauts">
    			<option value="${finalYear}" <c:if test="${finalYear==year1}"> selected</c:if>>${finalYear}</option>
    			</c:forEach>
    			 </select>
    	      学期:<select id="term" name="term">
    			<option value="1" <%="1".equals(term1) ? "selected" : ""%>>1</option>
    			<option value="2" <%="2".equals(term1) ? "selected" : ""%>>2</option>
    			 </select>
                         范围:<select id="dept_id" onChange=getTeacher()>
                 <option value="0">请选择部门</option>  
                 <c:forEach var="org" items="${orgs}" varStatus="stauts"> 
                 	<option value="${org.id}" <c:if test="${org.id==dept_id1}">selected</c:if>>${org.org_name}</option>
                 </c:forEach>   
                 </select>
                      负责的老师:<select id="tea_id" name="tea_id" style='width:100px' onChange=getPracticeTask()>
                  		<option value="0">请选择老师</option>
                  </select>
                    <!--   实践任务:<select id="practiceTask_id" name="practiceTask_id" style='width:230px'>
                  		<option value="0">请选择实践任务</option>
                 </select> -->
     <input type="button" value=" 查 询 " onclick=getTrainDetail()>
     <input type="button" onclick="javascript:trainDetailImport();" value="导入实训"/>
  	<button type="button"
				onclick="goBack()">重置</button> 
	<!-- <input type="button" value="重置" id="reset" onClick="reset();"/> -->
	<table border="1" width="1200" id="table" style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="250">任务名称</th>
			<th width="200">小组名称</th>
			<th width="100">课程名称</th>
			<th width="60">教师</th>
			<th width="120">实训时间</th>
			<th width="150">实训地点</th>
			<th width="50">周次</th>
			<th width="100">节次</th>
			<th width="50">修改</th>
			<th width="50">操作</th>
		</tr>	
	 	<c:forEach var="t" items="${lists}" varStatus="stauts">
	 	<c:set var="task_id" value="${t.task_id}" scope="request"></c:set>
	 	<c:set var="group_id" value="${t.group_id}" scope="request"></c:set>
	 	<c:set var="course_id" value="${t.course_id}" scope="request"></c:set>
	 	<c:set var="tea_id" value="${t.tea_id}" scope="request"></c:set>
			<tr>
				<td align="center">
				<% String task_id=(String)request.getAttribute("task_id");
				   String group_id=(String)request.getAttribute("group_id");
				   String course_id=(String)request.getAttribute("course_id");
				   String tea_id=(String)request.getAttribute("tea_id");
				   out.println(DictionaryService.findPracticeTask(task_id).getTask_name()); 
				%>
				</td>
				<td align="center">
				<%
					 out.println(DictionaryService.findGroups(group_id).getGroup_name());
				 %>
				</td>			
				<td align="center">
				<%
					 out.println(DictionaryService.findCourses(course_id).getCourse_name());
				 %>
				 </td>
				<td align="center">
				<%
					 out.println(DictionaryService.findTeacher(tea_id).getTrue_name());
				 %>
				</td>
                <td align="center"><fmt:parseDate value="${t.train_time}" var="train_time"/><fmt:formatDate value="${train_time}" pattern="yyyy/MM/dd"/></td>
				<td align="center">${t.train_place}</td>	
				<td align="center">${t.week_num}</td>
				<td align="center">${t.class_num}</td>
				<td align="center"><input type="button" value="修改" onclick="doEdit('${t.id}')"/></td>
				<td align="center"><input type="button" value="删除" onclick="doDel('${t.id}')"/></td>
			</tr>
		</c:forEach> 
	</table>
<!-- 	<div style="margin-top:10px;margin-left:100px;">
		<input type="button" onclick="javascript:trainDetailImport();" value="导入实训安排"/>
	</div> -->
</body>
</html>
