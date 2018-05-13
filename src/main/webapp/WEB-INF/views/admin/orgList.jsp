<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>组织列表</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css" media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	
	$(function() {
		var org_dept = $("#org_dept").val();
		if (org_dept == "请选择部门") {
			$("#grade").hide();
			$("#but").hide();
			$("#importclass").hide();
		} else if (dept == "院系") {
			$("#but").show();
			$("#grade").hide();
			$("#importclass").hide();
		}else{
			$("#grade").show();
			$("#but").show();
			$("#importclass").show();
		}
	});
	//根据部门类别设置年级和查询按钮的显示和隐藏
	function showGradeAndbut() {
		var dept = $("#dept").val();
		if (dept == "请选择部门") {
			$("#grade").hide();
			$("#but").hide();
			$("#importclass").hide();
		} else if (dept == "院系") {
			$("#but").show();
			$("#grade").hide();
			$("#importclass").hide();
		} else {
			$("#grade").show();
			$("#but").show();
			$("#importclass").show();
		}
	}
	//根据部门种类和年级得到相应组织
	function getOrg() {
		var dept = $("#dept").val();
		var grade = $("#grade").val();
		if(dept=="班级" && grade=="请选择年级"){
			alert("请选择年级！");
		}else{
			$.ajax({
					type : "get",
					url : "ajaxGetOrg.do?",
					data : getSendData(),
					dataType : "text",
					success : function(data) {
						showOrg(data);
					},
					error : function(result, status) {
						if (status == 'error') {
							alert(status);
						}
					}
				});
		}
	}
	//ajax获取发送的方法
	function getSendData() {
		var grade = $("#grade").val();
		var dept = encodeURI($("#dept").val());
		var dataSend = "gradeAnddept=" + dept + "-" + grade;
		var content = encodeURI(dataSend);
		return content;
	}
	function showOrg(ajaxData) {
		$("table[id='praTable'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	};
	//添加组织
	function add() {
		window.location.href = "addOrg.do";
	}

	//修改组织
	function editOrg(id, org_level) {
		if (org_level == 2) {
			alert("院级组织不能修改。");
		} 
		if (org_level != 2) {//系级或者班级
			window.location.href = "editOrg.do?id=" + id + "&org_level=" + org_level;
		}
	};
	
	/* function editMonth(id) {
		window.location.href = "editMonth.do?id=" + id;
	}

	function importClass(id, org_level) {
		window.location.href = "addClassImport.do";
	}; */
	//删除
	var a;
	//验证组织是否和学生或者老师关联
	function doDel(id) {
		a = id;//记录id
		$.ajax({
			type : "get",
			url : "checkOrgConnStu.do?",
			data : getOrgid(id), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为text                
			success : function(data) { //成功时执行的方法					
				showInfor(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getOrgid(id) {
		var org_id = id;
		var dataSend = "org_id=" + org_id;
		return dataSend;
	}
	function showInfor(ajaxData) {
		var obj = eval(ajaxData);
		if (obj == "1") {
			if (window.confirm("确定删除此组织吗?")) {
				window.location.href = "deleteOrg.do?id=" + a;
			}
		} else {
			alert("此组织关联学生或者教师，不能删除！");
		}
	}
	//导入班级
	function importDept() {
	 	window.location.href = "addDeptImport.do";
		/* var grade = $("#grade").val();
		if(grade=="请选择年级"){
			alert("请选择年级!");
		}else{
		    window.location.href = "addDeptImport.do?grade=" + grade;
		} */
	}
</script>
</head>
<body>
	<h2 align="left">组织列表</h2>
	<p>
		<b>条件查询：</b>
		<c:set var="checkedDept" value="${checkedDept}" scope="request"></c:set>
		<%
			String checkedDept = (String) request.getAttribute("checkedDept");
		%>
		<select id="dept" name="dept" style="width:100px" onchange="showGradeAndbut()">
			<option value="请选择部门" <%="请选择部门".equals(checkedDept) ? "selected" : ""%>>请选择部门</option>
			<option value="院系" <%="院系".equals(checkedDept) ? "selected" : ""%>>院系</option>
			<option value="班级" <%="班级".equals(checkedDept) ? "selected" : ""%>>班级</option>
		</select>
		<c:set var="checkedGrade" value="${checkedGrade}" scope="request"></c:set>
		<%
			String checkedGrade = (String) request.getAttribute("checkedGrade");
		%>
		<select id="grade" name="grade" style="width:100px">
			<option value="请选择年级" <%="请选择年级".equals(checkedGrade) ? "selected" : ""%>>请选择年级</option>
			<option value="2012" <%="2012".equals(checkedGrade) ? "selected" : ""%>>2012</option>
			<option value="2013" <%="2013".equals(checkedGrade) ? "selected" : ""%>>2013</option>
			<option value="2014" <%="2014".equals(checkedGrade) ? "selected" : ""%>>2014</option>
			<option value="2015" <%="2015".equals(checkedGrade) ? "selected" : ""%>>2015</option>
			<option value="2016" <%="2016".equals(checkedGrade) ? "selected" : ""%>>2016</option>
			<option value="2017" <%="2017".equals(checkedGrade) ? "selected" : ""%>>2017</option>
			<option value="2018" <%="2018".equals(checkedGrade) ? "selected" : ""%>>2018</option>
			<option value="2019" <%="2019".equals(checkedGrade) ? "selected" : ""%>>2019</option>
			<option value="2020" <%="2020".equals(checkedGrade) ? "selected" : ""%>>2020</option>
		</select>
		<button onclick="getOrg()" id="but">查询</button>
		&nbsp; &nbsp; 
		<input type="button" onclick="javascript:add();" value="添加组织" />
		<input type="button" onclick="importDept()" id="importclass" value="导入班级" />
	</p>
	<input type="hidden" name="org_dept" id="org_dept" value="${checkedDept}" />
	<input type="hidden" name="org_grade" id="org_grade" value="${checkedGrade}" />
	<table border="1" width="1000" id="praTable" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="130">组织编码</th>
			<th width="130">组织名称</th>
			<th width="130">组织级别</th>
			<th width="130">联系人</th>
			<th width="130">联系电话</th>
			<th width="130">上级部门</th>
			<th width="130">状态</th>
			<th width="130">操作</th>
		</tr>
		<c:forEach var="o" items="${departmentlist}" varStatus="stauts">
			<c:set var="department_id" value="${o.parent_id}" scope="request"></c:set>
			<%
				String department_id = (String) request.getAttribute("department_id");
			%>
			<c:set var="contacts" value="${o.contacts}" scope="request"></c:set>
			<%
				String contacts = (String) request.getAttribute("contacts");
			%>
			<tr>
				<td>${o.org_code}</td>
				<td>${o.org_name}</td>
				<td><c:if test="${o.org_level=='2'}">
				 院级
				</c:if> <c:if test="${o.org_level=='3'}">
				 系级
				</c:if> <c:if test="${o.org_level=='5'}">
				 班级
				</c:if></td>
				<td>
					<%
						try {
								out.println(DictionaryService.findTeacher(contacts)
										.getTrue_name());
							} catch (Exception e) {
								out.println("无");
							}
					%>
				</td>
				<td>${o.phone}</td>
				<td>
					<%
						out.println(DictionaryService.findOrg(department_id)
									.getOrg_name());
					%>
				</td>
				<td><c:if test="${o.state== 1}">
				 有效
				</c:if> <c:if test="${o.state!= 1}">
				 无效
				</c:if></td>
				<td><input type="button" value="修改"
					onclick="editOrg('${o.id}','${o.org_level}')">&nbsp;&nbsp;<input
					type="button" value="删除" onclick="doDel('${o.id}');">
					</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>
