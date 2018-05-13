<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>实习申请详细记录</title>

<!-- 弹窗js和css 邢志武-->
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.reveal.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/company.css">
<script type="text/javascript">
	window.onload = function() {
		var companyState = document.getElementById("compayCheckState").value;

		if (companyState != 0) {
			document.getElementById("checkbox").checked = true;
		} else {
			document.getElementById("checkbox").checked = false;
		}

	};
	//实习申请通过之后处理的方法
	function doCheck(state) {
		//var id=document.getElementById("id").value;
		//var note=document.getElementById("note").value;
		//window.location.href="check.do?check_state="+state+"&id="+id+"&note="+ encodeURI(encodeURI(note));
		//上面方法乱码，改用下面的表单提交方式。
		if (document.getElementById("checkbox").checked) {

			if (document.getElementById("compayCheckState").value == 1) {

				var url = "check.do?check_state=" + state;
				document.form1.action = url;
				document.form1.submit();
			} else if (document.getElementById("compayCheckState").value == 2) {
				alert("该学生申请的公司已经有人审核且公司审核失败，如有疑问，点击审核公司了解详情");

			} else {
				alert("请先点击审核企业，审核企业信息！");
			}

		} else {
			alert("请先点击审核企业，审核企业信息！");
		}
	}
	//实习申请不通过之后处理的方法
	function doCheck2(state) {

		if (document.getElementById("note").value == "") {
			alert("请在备注填写不通过原因！");
		} else {
			var url = "check.do?check_state=" + state;
			document.form1.action = url;
			document.form1.submit();
		}
	}
	//公司审核通过之后处理的方法
	function doCheck3(state) {

		document.getElementById("compayCheckNote").value = "";
		document.getElementById("compayCheckState").value = state;
		var TeaID = document.getElementById("checkCompanyTeaID").value;
		document.getElementById("checkTeaID").value = TeaID;
		document.getElementById("checkbox").checked = true;
	}
	//公司审核不通过之后处理的方法
	function doCheck4(state) {

		if (document.getElementById("CheckNote").value == "") {
			alert("请在备注填写不通过原因！");
		} else {

			document.getElementById("compayCheckState").value = state;
			var note = document.getElementById("CheckNote").value;
			document.getElementById("compayCheckNote").value = note;
			document.getElementById("checkbox").checked = true;

		}
		;
	}
</script>
</head>

<body>
	<h1 align="left" style="margin-left: 35px">审批实习申请</h1>
	<form name="form1" method="post" action="">
		<input type="hidden" id="id" name="id" value="${practicerecord.id}">
		<table border="0" width="870">
			<c:set var="si" value="${practicerecord.stu_id}" scope="request"></c:set>
			<%
				String stu_id = (String) request.getAttribute("si");
			%>
			<c:set var="ci" value="${practicerecord.company_id}" scope="request"></c:set>
			<%
				String company_id = (String) request.getAttribute("ci");
			%>
			<c:set var="createStuId" value="${createStu_id}" scope="request"></c:set>
			<%
				String createStu_id = (String) request.getAttribute("createStuId");
			%>
			<%-- <c:set var="sh" value="${CheckMan}" scope="request"></c:set>
			<%
				String tea_id = (String) request.getAttribute("sh");
			%> --%>

			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：
					<%
					out.println(DictionaryService.findStudent(stu_id).getStu_code());
				%>
				</td>
				<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名： <%
					out.println(DictionaryService.findStudent(stu_id).getTrue_name());
				%>
				</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企业名称：
				<c:if test="${company.com_name=='未添加'}">
					<font color="red">未申请企业，不应通过申请</font>
				</c:if>
				<c:if test="${company.com_name!='未添加'}">
					${company.com_name} <input type="checkbox" id="checkbox">&nbsp;
					<a href="javascript:void(0);" data-reveal-id="myModal">审核企业</a>
				</c:if>
				</td>
				<!-- 实习申请内容 2015-01-25 邢志武修改 -->

			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;岗位名称：
					${practicerecord.post_id}</td>
				<td>部门领导： <c:if test="${practicerecord.leader==''}">
					未填写
					</c:if>
					<c:if test="${practicerecord.leader==null}">
					未填写
					</c:if> <c:if test="${practicerecord.leader!=null}">
					${practicerecord.leader}
				</c:if></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;可否网签： <c:if
						test="${practicerecord.is_netsign==1}">
					可以
					</c:if> <c:if test="${practicerecord.is_netsign==2}">
					不可以
					</c:if></td>
				<td>可否签合同： <c:if test="${practicerecord.is_contract==1}">
					可以
					</c:if> <c:if test="${practicerecord.is_contract==2}">
					不可以
					</c:if></td>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;企业老师：
					${practicerecord.com_teacher}</td>
				<td>老师电话：${practicerecord.com_phone}</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;到岗时间： <c:if
						test="${practicerecord.work_time==null}">
					无
					</c:if> <c:if test="${practicerecord.work_time!=null}">
					${practicerecord.work_time}
					</c:if></td>
				<td>协议时间： <c:if
						test="${practicerecord.prct_contract_time==null}">
					无
					</c:if> <c:if test="${practicerecord.prct_contract_time!=null}">
					${practicerecord.work_time}
					</c:if></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公司地区：${practicerecord.com_orgion}
				</td>
				<td>工作地区：${practicerecord.work_orgion}</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请时间：${practicerecord.apply_time}</td>
				<td></td>

			</tr>
			<tr>
				<td><input type="hidden" name="compayCheckState"
					id="compayCheckState" value="${state}" />
					<input type="hidden"
					name="compayCheckNote" id="compayCheckNote" value="${CheckNote}" />
					<input type="hidden" name="checkTeaID" id="checkTeaID"
					value="${CheckManName}" /><input type="hidden" name="check_state" id="check_state"
					value="${check_state}" />
					</td>
				<!-- 用来获取审核老师id -->
			</tr>
			<tr>
				<td>
				</td>
				<td></td>

			</tr>

		</table>
		<div style="margin-left: 50px">
				<button type="button" onclick="window.location='./getPracticeRecode.do?check_state=${check_state}'">返回</button>
					&nbsp;&nbsp;&nbsp; 
					<input type="button" value="通过" onclick="doCheck('1');">
					&nbsp;&nbsp;&nbsp; 
					<input type="button" value="不通过" onclick="doCheck2('2');">	
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					备注：<textarea id="note" name="note" style="height: 90px;width: 250px;"
					value="${practicerecord.note}"></textarea>
		</div>
		<!--公司审核  2015-01-25 邢志武修改-->

		<div id="myModal" class="reveal-modal" align="center">
			<h2>公司审核</h2>
			<input type="hidden" id="id" name="id" value="">
			<table border="0" width="550">
				<tr>
					<td>企业名称：${company.com_name} <input type="hidden"
						name="companyId" value="${company.id }" />
					</td>
					<td>创建人&nbsp;&nbsp;&nbsp;&nbsp;：<%
						out.println(DictionaryService.findStudent(createStu_id)
								.getTrue_name());
					%>
					</td>
				</tr>

				<tr>
					<td>企业短名： ${company.short_name}</td>
					<td>企业地址：${company.address }</td>


				</tr>

				<tr>
					<td>联系人&nbsp;&nbsp;&nbsp;&nbsp;：${company.contacts }</td>
					<td>联系电话：${company.phone}</td>
				<tr>
					<td>EMAIL&nbsp;&nbsp;&nbsp;&nbsp;：${company.email }</td>
					<%-- <%out.println(DictionaryService.findTeacher(tea_id).getTrue_name());%> --%>
					<td>审核教师：${CheckManName}</td>
				</tr>
				<tr>
					<td>创建时间：${company.create_time }</td>

					<c:if test="${company.check_state ==0}">
						<td>审核状态：<b style="color: red">未审核</b> <input type="hidden"
							name="checkCompanyTeaID" id="checkCompanyTeaID" value="${tea_id}" />
						</td>

						<br>
						<div>
							<input type="button" value="通过" class="close-reveal-modal"
								onclick="doCheck3('1');">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
								value="不通过" class="close-reveal-modal" onclick="doCheck4('2');">
							&nbsp; 审核备注： <input type="text" id="CheckNote" name="CheckNote"
								value="${company.check_note }">
						</div>
					</c:if>
					<c:if test="${company.check_state ==1 }">
						<td>审核状态：<b style="color: red">已审核成功</b>
						</td>

					</c:if>
					<c:if test="${company.check_state ==2}">
						<td>审核状态：<b style="color: red">已审核失败</b>
						</td>

					</c:if>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
