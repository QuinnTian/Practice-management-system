<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>组织修改</title>
<style type="text/css">
	.div {
		border: 1px solid #F00;
		width: 300px;
	}
	h2 {
			width: 100%;
			height: 20px;
			text-align: left;
		}
</style>
<script language="javascript" type="text/javascript" src="<%=path %>/css/My97DatePicker/WdatePicker.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script>
	$(function(){
	 var org_level=$("#level").val();
	 if (org_level == 3) {
			$("#grade").hide();
			$("#parent_dept").hide();
			$("#header").hide();
			$("#counsellor").hide();
			$("#contact").show();
			$("#con").show();
		} else {
			$("#contact").hide();
			$("#grade").show();
			$("#parent_dept").show();
			$("#header").show();
			$("#counsellor").show();
			$("#con").hide();
		} 
	});

	function doEdit() {
		var org_name = document.getElementById("org_name");
		if (org_name.value == "") {
			alert("组织名称不能为空！");
			org_name.focus();
			return null;
		}
		var phone = $("#phone").val();
		var orgName_infor=$("#orgName_infor").html();
		if (orgName_infor.length >=5) {
				alert("任务名称重复，请重新输入");
				return null;
			}
		if (phone == "") {
			alert("请填写手机号！");
			return;
		}
		var isMobile=/^(?:13\d|17\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/; //手机号码验证规则
		var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;   //座机验证规则
		if(!isMobile.test(phone) && !isPhone.test(phone)){ //如果用户输入的值不同时满足手机号和座机号的正则
		    alert("请正确填写电话号码，例如:13415764179或0321-4816048");  //就弹出提示信息
		    $("#phone").focus();       //输入框获得光标
		    return false;         //返回一个错误，不向下执行
		}
		window.document.editform.submit();
	}
	//验证任务名是否重复
	function ajaxOrgNameRepeat() {
		$.ajax({
			type : "get",
			url : "ajaxOrgNameRepeat.do?",
			data : getOrgName(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为text                
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
	function getOrgName() {
		var a = $("#org_name").val();
		var org_name = encodeURI(a);
		content = encodeURI(org_name);
		var dataSend = "content=" + content;
		return dataSend;
	}
	function showInfor(ajaxData) {
		 $("#orgName_infor").html(ajaxData); 
	}
	//ajax 获取联系人
	function ajaxTeacher() {
		$.ajax({
			type : "get",
			url : "ajaxPk_teacher.do?",
			data : getXiData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
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
		$("#contacts").html(ajaxData);
	}
	function getXiData() {
		var val = $("#xibu").val();
		var dataSend = "xibu=" + val;
		return dataSend;
	}
	
	
	//ajax 获取班主任
	function ajaxHeader() {
		$.ajax({
			type : "get",
			url : "ajaxPk_teacher.do?",
			data : getXiheaderData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showHeaders(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}
	function showHeaders(ajaxData) {
		$("#contactss").html(ajaxData);
	}
	function getXiheaderData() {
		var val = $("#headerss").val();
		var dataSend = "xibu=" + val;
		return dataSend;
	}
	
	
	//ajax 获取辅导员老师
	function ajaxCounsellor() {
		$.ajax({
			type : "get",
			url : "ajaxPk_teacher.do?",
			data : getXicounsellorData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showCounsellors(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}
	function showCounsellors(ajaxData) {
		$("#counsellorss").html(ajaxData);
	}
	function getXicounsellorData() {
		var val = $("#counsellors").val();
		var dataSend = "xibu=" + val;
		return dataSend;
	}
</script>
</head>
<body>
<h2>组织修改</h2>
	<form name="editform" id="editform" method="post" action="doEditOrg.do">
		<input type="hidden" name="id" id="id" value="${org.id}">
		<input type="hidden" name="level" id="level" value="${org_level}">
		<table border="0" width="1000">
			<tr>
				<td width="100">组织编码：</td>
				<%-- <input type="hidden" name="org_code" value="${org.org_code}"> --%>
				<td width="700"><input type="text" name="org_code"  disabled="disabled" value="${org.org_code}"></td>
			</tr>
			<tr>
				<td width="100">组织名称：</td>
				<td width="700"><input type="text" name="org_name" id="org_name" value="${org.org_name}" onblur="ajaxOrgNameRepeat()"><font color="red"><span id="orgName_infor"></span></font><br></td>
			</tr>
			<tr>
				<td width="100">联系电话：</td>
				<td width="700"><input type="text" name="phone" id="phone" value="${org.phone}" /></td>
			</tr>
				<tr id="contact">
				<td width="120">联系人所在系部：</td>
				<td width="700">
				<c:set var="contactsInOrgId" value="${contactsInOrgId}" scope="request"></c:set>
	      		<% String contactsInOrgId=(String)request.getAttribute("contactsInOrgId"); %>
				<select id="xibu" name="xibu"
					onChange="ajaxTeacher()" style="width:200px;">
						<option value="请选择" selected="selected"></option>
						<c:forEach var="o" items="${collegeAndAllDeptList}" varStatus="stauts">
							<option value="${o.id}" <c:if test="${o.id==contactsInOrgId}"> selected</c:if>>${o.org_name}</option>
						</c:forEach>
				</select>
				</td>
				</tr>
				<tr id="con">
					<td width="100">联系人：</td>
					<td width="700">
					<c:set var="contactsid" value="${contacts}" scope="request"></c:set>
	      			<% String contactsid=(String)request.getAttribute("contactsid"); %>
					<select name="contacts" id="contacts" style="width:200px;">
						<c:forEach var="tea" items="${teaListWhisContacts}" varStatus="stauts">
							<option value="${tea.id}" <c:if test="${tea.id==contactsid}"> selected</c:if>>${tea.true_name}</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr id="grade">
				<td width="100">入学年级：</td>
				<td width="700">
				<c:set var="grade" value="${grade}" scope="request"></c:set>
	      			<% String grade=(String)request.getAttribute("grade"); %>
				<%-- <input type="text" name="begin_Time"
					id="begin_Time" class="Wdate" onClick="WdatePicker()"
					placeholder="单击选择日期" value="${org.begin_time}"><font
					color="red" size="2px">&lt;-选择该班级的入学年级。比如：精英1301班-选择2013年9月份的一天即可，不是当前的创建时间</font> --%>
				<select name="begin_Time" id="begin_Time" style="width:362px;">
						<option value="2012" <%="2012".equals(grade) ? "selected" : ""%>>2012级</option>
						<option value="2013" <%="2013".equals(grade) ? "selected" : ""%>>2013级</option>
						<option value="2014" <%="2014".equals(grade) ? "selected" : ""%>>2014级</option>
						<option value="2015" <%="2015".equals(grade) ? "selected" : ""%>>2015级</option>
						<option value="2016" <%="2016".equals(grade) ? "selected" : ""%>>2016级</option>
						<option value="2017" <%="2017".equals(grade) ? "selected" : ""%>>2017级</option>
						<option value="2018" <%="2018".equals(grade) ? "selected" : ""%>>2018级</option>
						<option value="2019" <%="2019".equals(grade) ? "selected" : ""%>>2019级</option>
						<option value="2020" <%="2020".equals(grade) ? "selected" : ""%>>2020级</option>
				</select>
				</td>
				</tr>
				<tr id="header">
					<td width="120">班主任所在系部：</td>
					<td width="700">
					<c:set var="headTeaInOrgId" value="${headTeaInOrgId}" scope="request"></c:set>
	      			<% String headTeaInOrgId=(String)request.getAttribute("headTeaInOrgId"); %>
					<select id="headerss" name="headerss"
						onChange="ajaxHeader()" style="width:200px;">
							<option value="请选择" selected="selected">请选择</option>
							<c:forEach var="o" items="${collegeAndAllDeptList}" varStatus="stauts">
								<option value="${o.id}" <c:if test="${o.id==headTeaInOrgId}"> selected</c:if>>${o.org_name}</option>
							</c:forEach>
					</select>
					班主任：
					<c:set var="headTea" value="${headTea}" scope="request"></c:set>
	      			<% String headTea=(String)request.getAttribute("headTea"); %>
					<select name="contactss" id="contactss" style="width:200px;">
						<c:forEach var="tea" items="${teaListWhisHeadTea}" varStatus="stauts">
							<option value="${tea.id}" <c:if test="${tea.id==headTea}"> selected</c:if>>${tea.true_name}</option>
						</c:forEach>
					</select>
					</td>
				</tr>
				<tr id="counsellor">
					<td width="120">辅导员所在系部：</td>
					<td width="700">
					<c:set var="counselorInOrgId" value="${counselorInOrgId}" scope="request"></c:set>
	      			<% String counselorInOrgId=(String)request.getAttribute("counselorInOrgId"); %>
					<select id="counsellors" name="counsellors"
						onChange="ajaxCounsellor()" style="width:200px;">
							<option value="请选择" selected="selected">请选择</option>
							<c:forEach var="o" items="${collegeAndAllDeptList}" varStatus="stauts">
								<option value="${o.id}" <c:if test="${o.id==counselorInOrgId}"> selected</c:if>>${o.org_name}</option>
							</c:forEach>
					</select>
					<c:set var="counselor" value="${counselor}" scope="request"></c:set>
	      			<% String counselor=(String)request.getAttribute("counselor"); %>
					辅导员：
					<select name="counsellorss" id="counsellorss"style="width:200px;">
							<c:forEach var="teaListWhisCounselor" items="${teaListWhisCounselor}" varStatus="stauts">
								<option value="${teaListWhisCounselor.id}" <c:if test="${teaListWhisCounselor.id==counselor}"> selected</c:if>>${teaListWhisCounselor.true_name}</option>
							</c:forEach>
					</select>
					</td>
				</tr>
				<tr id="parent_dept">
					<td width="100">上级组织：</td>
					<td width="700">
					<c:set var="parent_id" value="${parent_id}" scope="request"></c:set>
	      			 <% String parent_id=(String)request.getAttribute("parent_id"); %>
					<select id="par_dept" name="par_dept" style="width:200px">
							<c:forEach var="collegeAndAllDeptList" items="${collegeAndAllDeptList}" varStatus="stauts">
								<option value="${collegeAndAllDeptList.id}" <c:if test="${collegeAndAllDeptList.id==parent_id}"> selected</c:if>>${collegeAndAllDeptList.org_name}</option>
							</c:forEach>
					</select>
					</td>
				</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doEdit()"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./backOrgList.do'">返回</button>
		</div>
	</form>
</body>
</html>