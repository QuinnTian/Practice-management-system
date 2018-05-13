<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<title>参数列表</title>
<script type="text/javascript">
//查出学院所对应的系部名称
	function changexibu(){
	var Org_Name=$("#org_name").val();
	    $.ajax({
				type : "get",
				url : "xibuList.do?Org_Name="+Org_Name, 
				data:Org_Name,
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
				showPractice1(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
	    }
		function showPractice1(ajaxData) {//根据返回数据显示搜索结果
		$("#xi_id").html(ajaxData);
	    }; 
	 function findList(){
	 	//查找学年
	 	var year=$("#grade").val();
	 	//查找学院
	 	var org_id=$("#org_name").val();
	 	//查找系部
	 	/* var selectedValue = document.getElementById("xi_id");
	 	var selectedIndex = selectedValue.selectedIndex;
	 	var xibu=selectedValue.options[selectedIndex].value; */
	 	var xibu=$("#xi_id").val();
	 	$.ajax({
	 	type:"post",
	 	datetype:"text",
	 	date:"",
	 	url:"findList.do?year="+year+"&org_id="+org_id+"&xibu="+xibu,
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
	 	function showPractice(data){
	 	$("table[id='paramtable'] tr[id!='biaotou']").remove();
	 	$("#biaotou").after(data);
	 	}

function doAdd(){
window.location.href="paramAdd.do";
}
 function doEdit(id){
$.ajax({
				type : "post",
				url : "paramEdit.do?param_id="+id,
				data:id,
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法	
				alert("确定进行修改吗？");	
				window.location.href="paramEdit.do?param_id="+id;			
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
}
 function doDel(delete_id){
if (window.confirm("确定删除该参数吗?")) {
			window.location.href = "deleteParam.do?delete_id=" + delete_id;
		}
} 

</script>
</head>
<body>
  <h2 align='left'>参数列表</h2>
  <!-- 丁乐晓 -->
  <b>条件查询：</b>
  <p>
  	<input id="grade1" value="${student_grade}"style="background-color:#666666; display:none;">
	<input id="dept_id1" value="${student_dept_id}"style="background-color:#666666; display:none; ">
    <button id="hiddenBtn" style="background-color:#666666; display:none;" onclick="paramList();">Hidden
		Button</button>
  		<c:set var="grade1" value="${student_grade}" scope="request"></c:set>
		<c:set var="dept_id1" value="${student_dept_id}" scope="request"></c:set>
		<%  String grade1 = (String) request.getAttribute("grade1");
			String dept_id1 = (String) request.getAttribute("dept_id1");
			 %>
  	<span>学年范围：</span>
		<select id="grade" name="grade" style="width:120px">
		<option value="0">请选择学年</option>
			<c:forEach var="grade" items="${grade}" varStatus="stauts">
				<option value="${grade}" <c:if test="${grade==grade1}"> selected</c:if>>${grade}</option>
			</c:forEach>
		</select>&nbsp;&nbsp;
		<span>学院名称：</span>
		<select id="org_name" name="org_name" style="width:120px" onchange="changexibu()">
		<option value="0">请选择学院</option>
			<c:forEach var="orgList" items="${orgList}" varStatus="stauts">
				<option value="${orgList.id}"  name="or_name" id="or_name">${orgList.org_name}</option>
			</c:forEach>
		</select>&nbsp;&nbsp;
		<span>系部名称：</span>
		<select id="xi_id" name="xi_id"  style="width:120px">
  			<option value="请选择系部">请选择系部</option>
  			<%-- <c:forEach var="xibuList" items="${xibuList}" varStatus="stauts">
				<option value="${xibuList.id}">${xibuList.org_name}</option>
			</c:forEach> --%>
  	</select>
  	 <input type="button" value="查询" id="seacher" onclick="findList();"/> 
  	 <input type="button" value="新增" id="seacher" onclick="doAdd();"/> 
  </p>
  <!-- 1月12 -->
  	<table id="paramtable" border="1" width="1300"  style="overflow-x:hidden;overflow-y:hidden;" class="sjjx-table" cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="150" align="center">编号</th>	
			<th width="150" align="center">参数编码</th>
			<th width="150" align="center">参数名称</th>
			<th width="150" align="center">参数数值</th>
			<th width="150" align="center">部门名称</th>
			<th width="150" align="center">学期</th>
			<th width="150" align="center">状态</th>
			<th width="50" 	align="center">修改</th>
			<th width="50" 	align="center">操作</th>
		</tr>
	</table>
	<div align="center">
		<input type="button" value="上一页"  onclick="becomePage('-1')">
		<input type="button" value="下一页" onclick="becomePage('1')">
		<input type="text" id="inpu" name="inpu" onkeyup="value=value.replace(/[^\d]/g,'')" style="width:40px;"><input type="button" value="GO" onclick="becomePage('toPage')"/>
		第<input type="text" name="nowPage" id="nowPage" value="${nowPage}" style="width:40px;"/>页
		<input type="hidden" name="countPage" id="countPage" value="${count}"><!--  -->
		<b><span id="cou">共  ${count} 页</span></b>
	</div>
	<!-- <div style="margin-top:10px;margin-left:100px;">
		<input type="button" onclick="javascript:add();" value="添加教师"/>
	</div> -->
</body>
</html>
