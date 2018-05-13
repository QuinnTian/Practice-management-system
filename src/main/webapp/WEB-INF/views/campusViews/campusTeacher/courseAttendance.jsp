<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>

<title>课堂管理</title>
<script type="text/javascript">
	$(document).ready(function() {
		var y = $("#y").val();
		var s = $("#s").val();
		$("#schoolYear option[value="+y+"]").attr("selected", "selected");
		$("#semester option[value="+s+"]").attr("selected", "selected");
		ajaxGetClass();
	});		
	function gii(){
		var dataSend = "s=1";
		$.ajax({
				 type : "get",
				 url : "ajaxRefreshCount.do",
				 data : dataSend, //设置发送参数，即使参数为空，也需要设置                
				 dataType : "json", //返回的类型为json                
				 success : function(data) { //成功时执行的方法
						var json = eval(data);
						document.getElementById("nowPage").value= "1" ;
						 document.getElementById("countPage").value=json.AmPageCount;
						  document.getElementById("ap").value="共"+json.AmPageCount+"页";
				 },
				 error : function(result, status) { //出错时会执行这里的回调函数                     
					 if (status == 'error') {
					 		alert(status+result);
					 }
				 }
			}); 
			}
         function succFunction(ajaxDatatt) {  
	             var json = eval(ajaxDatatt); //数组         
	             $.each(json, function (index, item) {  
	                 //循环获取数据    
	                 var name = json[AmPageCount]; 
	                alert(name);
	             });
		}
	
	
	   function ajaxGetClass(){
	   		
	   		var schoolYear = $("#schoolYear").val(); //学年
			var semester = $("#semester").val(); //学期
			var dataSend = "schoolYear=" + schoolYear + "&semester=" + semester;
			 
			$.ajax({
				 type : "get",
				 url : "ajaxGetTClass.do",
				 data : dataSend, //设置发送参数，即使参数为空，也需要设置                
				 dataType : "text", //返回的类型为json                
				 success : function(data) { //成功时执行的方法
				
				 		$("select[id='tc_id']").remove();
				 		$("#ini").after(data);
				 },
				 error : function(result, status) { //出错时会执行这里的回调函数                     
					 if (status == 'error') {
					 		alert(status);
					 }
				 }
			}); 
			
		 }
		
	function btnQuery(){
	var schoolYear = $("#schoolYear").val(); //学年
		var semester = $("#semester").val(); //学期
		var tc_id = $("#tc_id").val(); //教学班id
		var begin_time = $("#begin_time").val(); //开始日期
		var end_time = $("#end_time").val();	//结束日期
		var scope = $("#scope").val(); //范围：点名/评价
			
		if(tc_id == null){
		alert("请选择教学班");
		return;
		}
		var dataSend = "schoolYear=" + schoolYear + "&semester=" + semester
				+ "&tc_id=" + tc_id+ "&begin_time=" + begin_time+ "&end_time=" 
				+ end_time + "&scope=" + scope;
	
		
		$.ajax({
				type : "get",
				url : "ajaxGetAttendance.do",
				data : dataSend, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法
					 $("tr[id='biaotou']").remove(); 
					$("#biaotou1").after(data); 
					 gii(); 
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					alert(status);
				}
			});
			
	}
	
	function exportExcel() {
		var scope = $("#scope").val(); //范围：点名/评价
		window.document.amReportForm.action = "exportAmExcel.do?scope="+scope;
		window.document.amReportForm.submit();
	}
</script>
<script type="text/javascript">
	function becomePage(page){
			var toPage;//要跳转的页面
			var countPage;//一共的页数
			countPage=parseInt($("#countPage").val());
			if(page=="toPage"){
				toPage = $("#inpu").val();
			}else
			{
				var nowPage=$("#nowPage").val();
				toPage=parseInt(nowPage)+parseInt(page);
			}
			if(toPage<1){
				alert("超出最小页页码");
				return null;
			}else if(toPage>countPage){
				alert("超出最大页页码");
				return null;
			}
			document.getElementById('inpu').value="";
			url="getStudentByPage.do?toPage="+toPage;
			ajaxFunction(url);
		}
		//转ajax
		function ajaxFunction(url) {
		//考虑到不同浏览器的兼容性，所以做出判断。
		var xmlHttp;
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveObject) {
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}
		//监控和接受后台传的字符串
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var result = xmlHttp.responseText;
				var ss=result.split("FENGETEACHER");
				$("tr[id='biaotou']").remove(); 
			/* 		$("#biaotou1").after(data); 
				$("table[id='teaTable'] tr[id!='biaotou']").remove(); */
	     		$("#biaotou1").after(ss[0]);
	     		document.getElementById('nowPage').value=ss[1];
			}
		};
		xmlHttp.open("GET", url, false);
		xmlHttp.send(null);
	}

</script>
</head>
<body>
  <h2 align='left'>学生考勤/课堂评价情况</h2>
  <form method="post" id="amReportForm" name="amReportForm"
		target=_blank>
  <input type="hidden" id="y" name="y" value="${nowYear}">
  <input type="hidden" id="s" name="s" value="${semester}">
  <p>
   	学年
	   	<select id="schoolYear" name="schoolYear" onchange="ajaxGetClass();">
		   	<option value="2016-2017" selected="selected">2016-2017</option>
		   	<option value="2017-2018">2017-2018</option>
		   	<option value="2018-2019">2018-2019</option>
	   	</select>
   	学期
	   	<select id="semester" name="semester" onchange="ajaxGetClass();">
	   		<option value="1">1</option>
	   		<option value="2">2</option>
	   	</select>
   	教学班<input type="hidden" id="ini" name="ini">
   		<select id="tc_id" name="tc_id">
   			<c:forEach var="t" items="${tc}">
   			<option value="${t.id}">${t.tc_name}</option>
   			</c:forEach>
   		</select> 
   	开始日期
   		<input id="begin_time" name="begin_time" value="${nowDate}"
		class="Wdate" type="text"
		onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"> 
   	结束日期
   		<input id="end_time"  name="end_time" value="${nowDate}"
		class="Wdate" type="text"
		onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
	查询项
		<select id="scope" name="scope" >
			<option value="1">考勤</option>
			<option value="2">评价</option>
		</select>
	<input type="button" name="smt" value='查询' onclick="btnQuery()">
	<input type="button" value="导出excel" onclick="exportExcel()">
	<br>
	<table border="1" width="1300" id="table1" 
		style="overflow-x:hidden;overflow-y:hidden;" 
		class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou1">
			<th colspan="5" width="250">教师情况</th>
			<th colspan="4" width="180">学生情况</th>
		</tr>
		<tr id="biaotou">
			<td width="10">序号</td>
			<td width="40">教师姓名</td>
			<td width="100">课程名称</td>
			<td width="60">日期</td>
			<td width="40">节次</td>

			<td width="60">班级</td>
			<td width="40">学生姓名</td>
			<td width="50">学号</td>
			<td width="120">请假/缺勤</td>
		</tr>
	</table>
	
	<div align="center">
		<input type="button" value="上一页"  onclick="becomePage('-1')">
		<input type="button" value="下一页" onclick="becomePage('1')">
		<input type="text" id="inpu" name="inpu" onkeyup="value=value.replace(/[^\d]/g,'')" style="width:40px;"><input type="button" value="GO" onclick="becomePage('toPage')"/>
		第<input type="text" name="nowPage" id="nowPage" value="${sessionScope.nowPage} " style="width:40px;"/>页
		<input type="hidden" name="countPage" id="countPage" value="${sessionScope.AmPageCount} "><!--  -->
		<b><input id="ap" type="button" value="共  ${sessionScope.AmPageCount}  页" />
	</div>
	
	</form>
</body>
</html>
