<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
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
<title>修改成员</title>


<style type="text/css">
.div {
	border: 1px solid #F00;
	width: 300px;
}

#div1 {
	width: 600px;
	height: 300px;
	overflow: auto;
}

#div2 {
	width: 600px;
	height: 300px;
	overflow: auto;
}

#div4 {
	width: 600px;
	background: #FFFF66;
	float: left;
}

#div3 {
	width: 600px;
	background: #CCFFFF;
	float: left;
}

#div6 {
	margin-left: 15px;
	margin-right: 15px;
	height: 300px;
	float: left;
	width: 30px;
}

#div7 {
	margin-top: 20px;
}
</style>
</style>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>

<script type="text/javascript">
	//选择角色

	function changeJS() {
		//重置系部
		$("#xibu").val("0");
		$("#grade").val("0");
		$("#cla").val("0");
		$("#div1").empty();
		$("#div1").append("<table id='pTable'></table>");
		var org_lev = $("#jiaoSe").val();
		if (org_lev == "5") {
			$("#orgId").val(null);
			$("#org_level").val("5");
			$("#cla").removeAttr("disabled");
			$("#grade").removeAttr("disabled");
		} else {
			$("#orgId").val(null);
			$("#org_level").val("3");
			$("#cla").attr({
				disabled : 'disabled'
			});
			$("#grade").attr({
				disabled : 'disabled'
			});
		}
	}
	//判断查询班级或者查询老师
	function changeCK() {
		var org_lev = $("#jiaoSe").val();
		//删除div1中的所有学生
		var stuTab = document.getElementById("pTable");
		var i;
		for (i = stuTab.rows.length - 1; i >= 0; i--) {
			stuTab.deleteRow(i);
			console.log("删除表格中所有的内容");
		}
		//执行查询班级的代码
		if (org_lev == "5") {
			ajaxClass();
		}
		//执行查询老师的代码
		if (org_lev == "3") {
			var org_id = $("#xibu").val();
			$("#orgId").val(org_id);
			ajaxTeacher();
		}

	}
	
	//ajax 获取系级别的老师
	function ajaxTeacher() {// 向服务器发送搜索请求

		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxTeacher2.do?",
			data : getXiData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json                
			success : function(data) { //成功时执行的方法

				showTeachers(data);

			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {

				}
			}
		});
	}
	function showTeachers(ajaxData) {
		console.log(ajaxData);
		var teas = eval(ajaxData);//将json数据转为对象

		var stuTab = document.getElementById("pTable");
		var i;
		for (i = stuTab.rows.length - 1; i >= 0; i--) {
			stuTab.deleteRow(i);
			console.log("删除表格中所有的内容");

		}
		//获取div2中所有的人
		var cd = [];
		$('#div2 input[name="ck"]').each(function() {

			cd.push($(this).val());

		});

		if (teas.length > 0) {
			for (i = 0; i < teas.length; i++) {
				var org = teas[i].dept_id;
				var biaoShi = teas[i].id + "-" + org;
				var d = biaoShi.lastIndexOf("-");
				var jb = biaoShi.substring(0, d);
				//删除其他级别的数据
				console.log("删除div1里其他级别的数据");
				$('#div1 input[name="ck"]:checked').parent().parent().remove();

				//判断是否在此数组
				if (isInArray(cd, jb)) {

					console.log("div1跟div2有相同数据，不允许插入");//不写log，没有延迟，导致原来的数据没清除
					continue;
				} else {
					console.log("获取的是学生数据，执行插入学生格式");
					var nextRow = stuTab.insertRow(stuTab.rows.length);
					/* 			nextRow.insertCell().innerHTML ="<input type='text' id='biaoshi' value='teas[i].dept_id'>"; */
					nextRow.insertCell().innerHTML = "<input type='checkbox' id='teas[i].id' name='ck' value="+biaoShi+"> ";
					nextRow.insertCell().innerHTML = teas[i].true_name + "(老师)";

				}
			}
		}

	}
	function getXiData() {
		var val = $("#xibu").val();
		var grade = $("#grade").val();
		var dataSend = "xibu=" + val+"&grade="+grade;
		return dataSend;
	}

	//获取班级

	function ajaxClass() {// 向服务器发送搜索请求

		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxClass.do?",
			data : getXiData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json                
			success : function(data) { //成功时执行的方法

				showClass(data);

			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {

				}
			}
		});
	}
	//将获取到的班级加到select 
	function showClass(ajaxData) {
		//将获取到的班级加到select 
		$("#cla").empty();
		var cla = eval(ajaxData);
		$("#cla").append("	<option value=0>请选择</option>");
		var i;
		for (i = 0; i < cla.length; i++) {
			$("#cla").append(
					"	<option value="+cla[i].id+">" + cla[i].org_name
							+ "</option>");
		}

	}

	function ajaxPerson() {// 向服务器发送搜索请求

		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxPersons.do?",
			data : getCla(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json                
			success : function(data) { //成功时执行的方法

				showStudnets(data);

			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {

				}
			}
		});
	}

	function getCla() {
		var val = $("#cla").val();
		$("#orgId").val(val);
		var dataSend = "cla=" + val;
		return dataSend;

	}

	function showStudnets(ajaxData) {
		var stus = eval(ajaxData);//将json数据转为对象

		var stuTab = document.getElementById("pTable");
		var i;
		for (i = stuTab.rows.length - 1; i >= 0; i--) {
			stuTab.deleteRow(i);
			console.log("删除表格中所有的内容");

		}
		//获取div2中所有的人
		var cd = [];
		$('#div2 input[name="ck"]').each(function() {

			cd.push($(this).val());

		});

		if (stus.length > 0) {
			for (i = 0; i < stus.length; i++) {
				var org = stus[i].class_id;
				var biaoShi = stus[i].id + "-" + org;
				var d = biaoShi.lastIndexOf("-");
				var jb = biaoShi.substring(0, d);
				//删除其他级别的数据
				console.log("删除div1里其他级别的数据");
				$('#div1 input[name="ck"]:checked').parent().parent().remove();

				//判断是否在此数组
				if (isInArray(cd, jb)) {
					console.log("div1跟div2有相同数据，不允许插入");//不写log，没有延迟，导致原来的数据没清除
					continue;
				} else {
					console.log("获取的是学生数据，执行插入学生格式");
					var nextRow = stuTab.insertRow(stuTab.rows.length);
					nextRow.insertCell().innerHTML = "<input type='checkbox' id='stus[i].id' name='ck' value="+biaoShi+"> ";
					nextRow.insertCell().innerHTML = stus[i].true_name;

				}
			}
		}
	}
	//判断变量是否在数组中
	function isInArray(arr, val) {
		var testStr = ',' + arr.join(",") + ",";
		return testStr.indexOf("," + val + ",") != -1;
	}
	//查看小组成员是否已在数组，并放到输入框供传值
	function saveGroupMember() {//jquery获取复选框值
		var chk_value = [];
		$('#div2 input[name="ck"]').each(function() {
			chk_value.push($(this).val());
		});
		//需要删除的数据
		var del = [];
		$('#div8 input[name="ck"]:checked').each(function() {
			del.push($(this).val());
		});
		$("#del").val(del);
		console.log("删除数据：" + del);
		console.log("测试数组数据：" + chk_value);
		$("#shuZu").val(chk_value);

	}

	//添加小组成员
	function addGroupMember() {

		$('#div1 input[name="ck"]:checked').each(function() {
			$(this).parent().parent().appendTo("#div2");

		});

	}

	//移除右侧div2的成员
	function dele() {
		//判断是否是同一级别的人
		$('#div2 input[name="ck"]:checked').each(function() {
			var val = $("#orgId").val();
			console.log("val1111:" + val);
			var str = $('#div2 input[name="ck"]:checked:first').val();
			console.log("jjb:" + str);
			var d = str.lastIndexOf("-");
				var jb = str.substring(d + 1, str.length);
				if (jb == val) {
					$(this).parent().parent().appendTo("#div1");
				} else {
					$(this).parent().parent().remove();
				}
				$('#div2 input[name="ck"]:checked').each(function() {
					$(this).parent().parent().remove();

				});
			//判断是学生还是老师
			if (str.length > 16) {
				
			} else {
				/* alert("不允许删除教师！"); */
			}

		});

	}
	//全选按钮
	function getAllMembers1() {
		console.log($('#div1 input[name="ck"]'));
		$('#div1 input[name="ck"]').parent().parent().attr("checked",
				this.checked);

	}
</script>

<script type="text/javascript">
	function back() {
		history.back();
	}
</script>

<script type="text/javascript">
	//全选未分组的成员
	function selectAll() {
		var i = 1;
		$('#div1 input[name="ck"]').each(function() {
			$(this).attr("checked", true);
		});
	}
</script>

</head>

<body>
	<form name="Form2" action="updateGroups.do" method="post">
		<h1>修改分组成员</h1>
		<input type="hidden" id="orgId" name="orgId" value=""> <b>条件查询：</b>
		成员类型： <select id="jiaoSe" name="jiaose" onChange="changeJS()"
			style="width:100px">
			<option>请选择</option>
			<option value="3">教师</option>
			<option value="5">学生</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp; 请选择系部： <select id="xibu" name="xibu"
			onChange="changeCK()" style="width:100px">
			<option value="0">请选择</option>
			<c:forEach var="o" items="${xiliebiao}" varStatus="stauts">
				<option value="${o.id}">${o.org_name}</option>
			</c:forEach>
		</select>&nbsp;&nbsp;&nbsp;&nbsp; 请选择年级： <select id="grade" name="grade"
			onChange="changeCK()"  disabled="disabled" style="width:100px">
			<option value="0">请选择</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
			<option value="2016">2016</option>
			<option value="2017">2017</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp; 请选择班级： <select id="cla"
			onChange="ajaxPerson() " name="classId" disabled="disabled"
			style="width:150px">
			<option value="0">请选择</option>
		</select> &nbsp;&nbsp;&nbsp;



		<!-- style="display:none" -->
		<textarea id="shuZu" name="shuZu" style="display:none"> </textarea>
		<div id="div4">
			<h3>选择成员</h3>
			<!-- <input type="button" value="全选" onclick="getAllMembers1()"> -->
			<div id="div1">
				<table id="pTable"></table>
			</div>

		</div>
		<div id="div6">
			<br> <br> <br> <input type="button" value=">>"
				onclick="addGroupMember()" /> <br /> <br /> <br /> <br /> <br />
			<br /> <input type="button" onclick="dele()" value="<<"/>
		</div>
		<div id="div3">
			<h3>分组成员</h3>

			<div id="div2">
				<table>

					<c:forEach var="g" items="${groups}" varStatus="stauts">
						<tr>
							<td><c:set var="user_id" value="${g.user_id}"
									scope="request">
								</c:set> <%--作为已有成员的标识 			
				<%
		 					String user_id = (String) request.getAttribute("user_id");
		
		 					if (user_id.length() > 16) {	
		 							String org_id = DictionaryService.findStudent(user_id).getClass_id();
		 							request.setAttribute("org_id", org_id);
		 					} else {
		 							String org_id = DictionaryService.findTeacher(user_id).getDept_id();
		 							request.setAttribute("org_id", org_id);
		 					}
		 				%> 	 --%>
		 				 <input type='checkbox' id="${g.user_id}" name='ck'
								value="${g.user_id}"> 
								<%
							 	String user_id = (String) request.getAttribute("user_id");
							 		if (user_id.length() > 16) {
							 			out.println(DictionaryService.findStudent(user_id)
							 					.getTrue_name());
							 		} else {
							 			out.println(DictionaryService.findTeacher(user_id)
							 					.getTrue_name() + "(老师)");
							 		}
								 %>
								
							</td>
						</tr>
						<tr>
							
						
					</c:forEach>
				</table>

			</div>
		</div>


		<p>
			<input type="hidden" name='group_id' value="${group_id}">
			<input type="submit" value="保存" onclick="saveGroupMember();" />&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="全选" onclick="selectAll();" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="back()">返回</button>

		</p>


	</form>
</body>
</html>