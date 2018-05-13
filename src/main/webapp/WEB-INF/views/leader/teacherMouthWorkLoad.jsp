<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户角色列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen"
		type="text/css" />
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
	<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
		var myDate = new Date();
		var month=myDate.getMonth()+1; 
		var day=myDate.getDate();   
		
		$(function(){ 
		var b=getMouth();
		$("#span").text(b);
		
		}); 
		//獲取當前可產看的月份
		function getMouth(){
			if(day>5){
				month=month;
			}else{
				month=month-1;
			}
			return month;
		}
		//下拉菜单能能够查看的月份
		/*function setSelectOption(){
			for(var i=1;i<month+1;i++){
				 $("#mouth").append("<option value='"+i+"'>"+i+"</option>"); 
			}
		}
		*/
		function changeYear(){
			var mouth= $("#mouth").val();
			if(mouth!="0"){
			 changeMouth();
			}
		
		}
		function changeMouth(){
			var mouth= $("#mouth").val();
			var year=$("#year").val();
			$("#span").text(mouth);
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "getTeacherMouthWorkload.do?",
				data : "mouth="+mouth+"&&year="+year, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					showTeacherMouthWorkload(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		
		}
		function showTeacherMouthWorkload(ajaxData){
			
			$("table[id='table'] tr[id!='biaotou']").remove();
			$("#biaotou").after(ajaxData); 
		}
	
</script>
</head>
<body>	
	<h2 align="left">${org_name}<span id="span" class="span"></span>月工作量统计</h2>
	工作量计算方法：（合格实习人数/50）*9*4*系数（1或0.7）[注：合格人数：以学生上传实习月总结并且老师已批阅的数量为准，系数：老师上传工作本月总结系数为1，未上传为0.7]
	<br>
	选择年份<select id="year" class="year" >
				<option value="50000">请选择查看的你年份</option>
				<option value="2015">2015</option>
				<option value="2016">2016</option>
				<option value="2017">2017</option>
		  </select>年
	
	选择月份<select id="mouth" class="mouth" >
				<option value="0">请选择查看的月份</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
		  </select>月
		  <button onclick="changeMouth()">查看</button>
	<table id="table" border="1" width="300" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<td width="10">序号</td>
			<td width="50">教师姓名</td>
			<td width="100">实习任务</td>
			<td width="30">合格人数</td>
			<td width="30">实习人数</td>
			<td width="30">月总结系数</td>
			<td width="30">月工作量</td>
			<td width="30">月完成度</td>
		</tr>
		<c:forEach var="listTeacher" items="${listTeacher}" varStatus="stauts">
			<tr>
			<c:set var="prc" value="${listTeacher.prac_id}" scope="request">
            </c:set> 
            	<td width="10">${stauts.index+1}</td>
				<td width="50">
				${listTeacher.true_name}
				</td>
				<td width="100" align="left">
				<%
				String prc_id = (String) request.getAttribute("prc");
				out.println(DictionaryService.findPracticeTask(prc_id).getTask_name());
				%>
				</td>
				<td width="30">
				${listTeacher.qualifiedCount}
				</td>
				<td width="30">
				${listTeacher.studentSize}
				</td >
				<td width="30">${listTeacher.yesOrNo}
				</td>
				<td width="30">${listTeacher.score}
				</td>
				<td width="30">
				${listTeacher.theoryApicScore}
				</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
