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
<title>实习参数设置</title>
<link rel="stylesheet" href="/springmvc_mybatis/css/pageStyle.css"
	media="screen" type="text/css" />
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/tableCss.js"></script>
<script type="text/javascript">
	$(function() {
		var org_dept = $("#org_dept").val();
		if (org_dept == "0") {
			$("#grade").hide();
			$("#but").hide();
		} else {
			$("#grade").show();
			$("#but").show();
		}
	});
	function getOrg() {
		var dept = $("#dept").val();
		if (dept == "0") {
			$("#grade").hide();
			$("#but").hide();
		} else if (dept == "院系") {
			$("#but").show();
			$("#grade").hide();
		} else {
			$("#grade").show();
			$("#but").show();
		}
	}

	//添加
	function add() {
		window.location.href = "addOrg.do";
	}

	//修改

	function editMonth(id) {
		window.location.href = "editMonth.do?id=" + id;
	}

	function importClass(id, org_level) {

		window.location.href = "addClassImport.do";

	};
	//删除
	var a;
	//验证组织是否和学生或者老师关联

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

	//根据部门种类和年级得到相应组织
	function getClass() {
		$.ajax({
			type : "get",
			url : "ajaxGetOrgParameter.do?",
			data : getSendData(),
			dataType : "text",
			success : function(data) {
				showClass(data);
			},
			error : function(result, status) {
				if (status == 'error') {
					alert(status);
				}
			}
		});
	}
	function getSendData() {
		var grade = $("#grade").val();
		var dept = encodeURI($("#dept").val());
		var dataSend = "gradeAnddept=" + dept + "-" + grade;
		var content = encodeURI(dataSend);
		return content;
	}
	function showClass(ajaxData) {
		$("table[id='praTable'] tr[id!='biaotou']").remove();
		$("#biaotou").after(ajaxData);
	};
</script>
</head>
<body>
	<h2 align="left">实习参数列表</h2>
	<%-- <p>
		<b>条件查询：</b>
		<c:set var="defaultdept" value="${defaultdept}" scope="request"></c:set>
		<%
			String defaultdept = (String) request.getAttribute("defaultdept");
		%>
		<select id="dept" name="dept" style="width:100px" onchange="getOrg()">
			<option value="0" <%="0".equals(defaultdept) ? "selected" : ""%>>选择部门</option>
			<option value="院系" <%="院系".equals(defaultdept) ? "selected" : ""%>>院系</option>
			<option value="班级" <%="班级".equals(defaultdept) ? "selected" : ""%>>班级</option>
		</select>
		<c:set var="defaultgrade" value="${defaultgrade}" scope="request"></c:set>
		<%
			String defaultgrade = (String) request.getAttribute("defaultgrade");
		%>
		<select id="grade" name="grade" style="width:100px">
			<option value="20" <%="1".equals(defaultgrade) ? "selected" : ""%>>选择年级</option>
			<option value="2012" <%="12".equals(defaultgrade) ? "selected" : ""%>>2012</option>
			<option value="2013" <%="13".equals(defaultgrade) ? "selected" : ""%>>2013</option>
			<option value="2014" <%="14".equals(defaultgrade) ? "selected" : ""%>>2014</option>
			<option value="2015" <%="15".equals(defaultgrade) ? "selected" : ""%>>2015</option>
			<option value="2016" <%="16".equals(defaultgrade) ? "selected" : ""%>>2016</option>
			<option value="2017" <%="17".equals(defaultgrade) ? "selected" : ""%>>2017</option>
			<option value="2018" <%="18".equals(defaultgrade) ? "selected" : ""%>>2018</option>
			<option value="2019" <%="19".equals(defaultgrade) ? "selected" : ""%>>2019</option>
			<option value="2020" <%="20".equals(defaultgrade) ? "selected" : ""%>>2020</option>
		</select>
		<button onclick="getClass()" id="but">查询</button>
		&nbsp; &nbsp; 
	</p> --%>
	<input type="hidden" name="org_dept" id="org_dept"
		value="${defaultdept}" />
	<input type="hidden" name="org_grade" id="org_grade"
		value="${defaultgrade}" />
	<table border="1" width="1000" id="praTable" class="sjjx-table"
		cellspacing="0" cellpadding="0">
		<tr id="biaotou">
			<th width="130">部门</th>
			<th width="200">参数名称</th>
			<th width="130">月份</th>
			<th width="130">学年</th>
			<th width="130">学期</th>
			<th width="130">状态</th>
			<th width="130">操作</th>
		</tr>

		<c:forEach var="o" items="${params}" varStatus="stauts">
			<c:set var="department_id" value="${o.dept_id}" scope="request"></c:set>
			<%-- <%
				String department_id = (String) request
							.getAttribute("department_id");
			%>
			<c:set var="contacts" value="${o.contacts}" scope="request"></c:set>
			<%
				String contacts = (String) request.getAttribute("contacts");
			%> --%>
			<tr>
				<td>${org_name}</td>
				<td>${o.param_name}</td>
				<td><%-- <c:if test="${o.org_level=='2'}">
				 院级
				</c:if> <c:if test="${o.org_level=='3'}">
				 系级
				</c:if> <c:if test="${o.org_level=='5'}">
				 班级
				</c:if> --%>${o.param_value}</td>
				<td>
					<%-- <%
						try {
								out.println(DictionaryService.findTeacher(contacts)
										.getTrue_name());
							} catch (Exception e) {
								// TODO: handle exception
								out.println("无");
							}
					%> --%>
					${o.year}-${o.year+1}
				</td>
				<td>第${o.term}学期</td>
				<%-- <td>
					<%
						out.println(DictionaryService.findOrg(department_id)
									.getOrg_name());
					%>
				</td> --%>
				<td><c:if test="${o.state== 1}">
				 有效
				</c:if> <c:if test="${o.state!= 1}">
				 无效
				</c:if></td>
				<td><input type="button" value="修改参数"
					onclick=" editMonth('${o.id}');"></td>
				<%-- <input type="button" value="导入班级"   id="sb" onclick="importClass('${o.id}','${o.org_level}')" --%>
			</tr>
		</c:forEach>
	</table>

</body>
</html>

