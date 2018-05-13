<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>企业老师管理</title>

<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript"
	src="/springmvc_mybatis/js/checkWordLength.js"></script>
<script type="text/javascript"
	src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script>
function check(state,Com_teacher_id,stu_code) {
	if(state=="已审核"){
		alert("您已经审核过该老师!");
		return null;
	}else if(state=="未通过"){
   //var stu_code = stu_code;//就想知道谁写的！
   //var Com_teacher_id = Com_teacher_id;//就想知道谁写的！
	location.href="checkLogin.do?Com_teacher_id=" + Com_teacher_id+"&stu_code="+stu_code;
	return null;
   }else if(state=="未审核"){
    //var stu_code = stu_code;//就想知道谁写的！
   	//var Com_teacher_id = Com_teacher_id;//就想知道谁写的！
	location.href="checkLogin.do?Com_teacher_id=" + Com_teacher_id+"&stu_code="+stu_code;
   }else{
	alert("暂无老师的信息!");
	}
} 
function change(stu_id) {
//前台js向后台传值
	//var stu_id = stu_id; //就想知道谁写的！
	location.href="../company/historyEval.do?stu_id=" + stu_id;
	
	}
	//页面刷新调用方法
	$(function() {
		var stuList_practiceId = $("#stuList_practiceId").val();
		var stulist_grade = $("#stulist_grade").val();
		if ((stuList_practiceId != null && stuList_practiceId != "")|| (stulist_grade != null && stulist_grade != "")) {
			if (stulist_grade != null || stuList_practiceId != null) {
				getPracticeTask();
			}
		}
	});
	//根据年级得到实习任务     by 贾建昶
	function getPracticeTask() {
		$.ajax({
			type : "get",
			url : "ajaxchangeGrade.do?",
			data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //dataType属性，接受数据格式（这里有很多,常用的有html,xml,js,json，text）             
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
	//获得入学年份，以作为传入ajax的数据  by 贾建昶 
	function getSendData() {
		var grade = $("#year").val();
		var dataSend = "grade=" + grade;
		return dataSend;
	}
	
	//将ajax返回的结果添加到实习任务下拉列表中
	function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#practice_id").html(ajaxData);
		$("#seacher").click();
	};
	/* //查出该老师的所选实习任务对应的学生 
	function changeCK() {
		table.ajax.url("/springmvc_mybatis/teacher/ComTeaManageByPraId.do?"+getPraId()).load();
	}*/
	function getPraId() {
		var practice_id = $("#practice_id").val();
		var year = $("#year").val();
		var dataSend = "practice_id=" + practice_id + "&&year=" + year;
		return dataSend;
	} 
	function changeCK() {
		$.ajax({
			type : "get",
			url : "ComTeaManageByPraId.do?",
			data : getPraId(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //dataType属性，接受数据格式（这里有很多,常用的有html,xml,js,json，text）             
			success : function(data) { //成功时执行的方法		
			 console.log(data);
			  $("table[id='praTable'] tr[id!='tr']").remove();
		      $("#tr").after(data);
		      console.log("ajax返回成功！");
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					/* alert("出错啦"+status); */
				}
			}
		});
	}
	
	</script>
</head>
<body>
	<h2 align="left">企业老师管理</h2>
	<!--贾建昶  -->
	<input id="stuList_practiceId" value="${stuList_practiceId}"
		style="background-color:#666666;display:none;">
	<input id="stulist_grade" value="${stulist_grade}"
		style="background-color:#666666;display:none;"> &nbsp;查询：
	<select id="year" name="year" style="width:100px"
		onChange=getPracticeTask()>
		<option value="入学年份">入学年份</option>
		<c:forEach var="grade" items="${grades}" varStatus="stauts">
			<option value="${grade}"
				<c:if test="${grade==stulist_grade}">selected</c:if>>${grade}</option>
		</c:forEach>
	</select>&nbsp;
	<select onchange="changeCK()" name="practice_id" id="practice_id"
		style="width:260px">
		<option value="请选择实习任务">请选择实习任务</option>
	</select>
	<input type="button" value="查询" id="seacher" onclick="changeCK();" />

	<table border="1" width="980" id="praTable" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr id="tr">
			<th width="40">序号</th>
			<th width="130">学生学号</th>
			<th width="120">学生姓名</th>
			<th width="300">企业名称</th>
			<th width="100">企业老师</th>
			<th width="110">企业老师电话</th>
			<th width="100">状态</th>
			<th width="60">操作</th>
			<th width="80">操作</th>
		</tr>
		<%-- <c:forEach var="s" items="${hs}" varStatus="hs">
			<c:set var="ss" value="${s}" scope="request">
			</c:set>
			<tr>
				<td align="center">${hs.index+1}</td>
				<td>
					<%
				String stu_code = (String) request.getAttribute("ss");
				%> <%
				out.println(DictionaryService.findStudent(stu_code).getStu_code());
				%>
				</td>
				<td>
					<%
				String stu_name = (String) request.getAttribute("ss");
				%> <%
				out.println(DictionaryService.findStudent(stu_name).getTrue_name());
				%>
				</td>
				<td>
					<%
				   String stuID = (String) request.getAttribute("ss");
					String com_teacher_id = DictionaryService.findStudent(stuID).getCom_teacher_id();
			        if(DictionaryService.findTeacher(com_teacher_id) != null){
			     	String com_id = DictionaryService.findTeacher(com_teacher_id).getDept_id();
			     	if(DictionaryService.findCompany(com_id) !=null){
			     	out.println(DictionaryService.findCompany(com_id).getCom_name());
			     	}
				}
				else{
						out.println("无");
				} 
				%>
				</td>
				<td>
					<%
				String tea_name = (String) request.getAttribute("ss");
				String Com_teacher_id = DictionaryService.findStudent(tea_name).getCom_teacher_id();
				if(DictionaryService.findTeacher(Com_teacher_id) != null){
				out.println(DictionaryService.findTeacher(Com_teacher_id).getTrue_name());
				}
				else{
					out.println("无");
				} 
				%>
				</td>
				<td>
					<%
				String tea_phone = (String) request.getAttribute("ss");
				String Com_teacher_phone = DictionaryService.findStudent(tea_name).getCom_teacher_id();
				if(DictionaryService.findTeacher(Com_teacher_phone) != null){
				out.println(DictionaryService.findTeacher(Com_teacher_phone).getPhone());
				}
				else{
					out.println("无");
				} 
				%>
				</td>
				<td>
					<%
				String tea_state = (String) request.getAttribute("ss");
				String Com_teacher_state = DictionaryService.findStudent(tea_name).getCom_teacher_id();
				String a="";
				if(DictionaryService.findTeacher(Com_teacher_state) != null){
	            a = DictionaryService.findTeacher(Com_teacher_state).getState();
	            if(a.equals("3")){
	            out.println("未审核");
	            }
	             if(a.equals("1")){
	            out.println("已审核");
	            }
	             if(a.equals("2")){
	            out.println("未通过");
	            }
				}
				else{
					out.println("暂无状态");
					
				} 
				%>
				</td>
				<td><button onclick="check('<%=a%>','<%=Com_teacher_id%>','<%=stu_code%>')">审核</button>
				</td>
				<td><input type="button" value="查看企业评价"
					onclick="change('<%=stu_code%>')"></td>
			</tr>
		</c:forEach> --%>
	</table>

</body>
</html>
