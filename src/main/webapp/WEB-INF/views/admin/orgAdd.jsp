<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>添加组织</title>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<!-- <script type="text/javascript" src="/springmvc_mybatis/js/org/ajaxCheckOrgCode.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/org/ajaxOrgNameRepeat.js"></script> -->
<script type="text/javascript" src="/springmvc_mybatis/js/org/saveValidate.js"></script>
<style type="text/css">
h2 {  
	width: 100%;
	height: 20px;
	text-align: left;
}

.div {
	border: 1px solid #F00;
	width: 300px;
}
</style>
<script type="text/javascript">
	$(function() {
			$("#grade").hide();
			$("#header").hide();
			$("#counsellor").hide();
			$("#parent_dept").hide();
	});
	
	function showGrade() {
		var progress = $('input:radio[name="org_level"]:checked').val();
		if (progress == "3") {
			$("#grade").hide();
			$("#parent_dept").hide();
			$("#header").hide();
			$("#counsellor").hide();
			$("#contact").show();
			$("#con").show();
		} else if (progress == undefined) {
			$("#grade").hide();
			$("#parent_dept").hide();
			$("#header").hide();
			$("#counsellor").hide();
			$("#contact").show();
			$("#con").hide();
		} else {//班级
			$("#contact").hide();
			$("#con").hide();
			$("#grade").show();
			$("#parent_dept").show();
			$("#header").show();
			$("#counsellor").show();
		}
	}
	//判断组织编码是否为空，如果为空，进行提示。如果不为空，调用Ajax验证编码是否重复
	function ajaxCheckOrgCode1() {
		var org_code = document.getElementById("org_code").value;
		//var strExp = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]$/;
		if (org_code == "") {
			var a = window.document.getElementById("infor");
			a.style.color = "#FF0000";
			a.innerHTML = "组织编码不能为空！";
		} else {
			/* if (strExp.test(org_code.value)) { */
				ajaxCheckOrgCode();
			/* } */ 
		}
	}
	
	//ajax 进行组织编码是否重复验证
	function ajaxCheckOrgCode() {
		$.ajax({
			type : "get",
			url : "checkOrgCode.do?",
			data : getOrgCode(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showOrgCode(data);
			},
			error : function(result, ocode) { //出错时会执行这里的回调函数                     
				if (ocode == 'error') {
				}
			}
		});
	}
	//得到组织编码
	function getOrgCode() {
		var org_code = document.getElementById("org_code").value;
		var oc = "org_code=" + org_code;
		return oc;
	}
	//显示ajax查询结果
	function showOrgCode(ajaxData) {
		/* alert(ajaxData); */
		/* var showOrgCode = eval(ajaxData);
		alert(showOrgCode); */
		$("#infor").html(ajaxData);
		/* if (ajaxData =="可用") {
			alert("s");
			var a = window.document.getElementById("infor");
			a.style.color = "008B00";
			a.innerHTML = "组织编码可用";
		} else {
			var a = window.document.getElementById("infor");
			a.style.color = "#DC143C";
			a.innerHTML = "组织编码在数据库中有重复！";
		} */
	}
	
	//ajax验证组织名是否重复
	function ajaxOrgNameRepeat() {
		var org_name = $("#org_name").val();
		if(org_name==""){
			var a = window.document.getElementById("orgName_infor");
			a.style.color = "#FF0000";
			a.innerHTML = "组织名称不能为空！";
		}else{
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
		};
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
	

	//ajax 根据联系人部门获取联系人
	function ajaxTeacher() {
		$.ajax({
			type : "get",
			url : "ajaxPk_teacher.do?",
			data : getDeptData(), //设置发送参数，即使参数为空，也需要设置                
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
	function getDeptData() {
		var val = $("#contactDept").val();
		var dataSend = "xibu=" + val;
		return dataSend;
	}
	
	
	//ajax 获取系级别的班主任老师
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
	
	
	//ajax 获取系级别的辅导员老师
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
	<h2>添加组织</h2>
	<br>
	<form name="orgForm" id="orgForm" method="post" action="doAddOrg.do">
		<table border="0" width="1000">
			<tr>
				<td width="100">组织编码：</td>
				<td width="700"><input type="text" name="org_code"
					id="org_code" onblur="ajaxCheckOrgCode1();" placeholder="示例:jyb1301" />
					<font color="red" size="2px"><span id="infor"></span></font>
				</td>
			</tr>
			<tr>
				<td width="100">组织名称：</td>
				<td width="700"><input type="text" name="org_name"
					id="org_name" onblur="ajaxOrgNameRepeat();" placeholder="示例：精英班1301" />
					<font color="red" ><span id="orgName_infor"></span></font><br>
				</td>
			</tr>
			<tr>
				<td width="100">组织级别：</td>
				<td width="700"><input type="radio" name="org_level"
					id="org_level" value="3" onchange="showGrade();" checked>系级 <input
					type="radio" name="org_level" id="org_level" value="5"
					onchange="showGrade();">班级
			</tr>
			<tr>
				<td width="100">组织联系电话：</td>
				<td width="700"><input type="text" name="phone" id="phone" />
				<font color="red" size="2px">&lt;-输入的格式如:13415764179或0321-4816048</font></td>
			</tr>
			<tr id="grade">
				<td width="100">入学年级：</td>
				<td width="700"><select name="begin_Time" id="begin_Time"
					style="width:362px;">
						<option value="2012">2012级</option>
						<option value="2013">2013级</option>
						<option value="2014">2014级</option>
						<option value="2015">2015级</option>
						<option value="2016">2016级</option>
						<option value="2017">2017级</option>
						<option value="2018">2018级</option>
						<option value="2019">2019级</option>
						<option value="2020">2020级</option>
				</select></td>
			</tr>
			<!-- <tr id="grade">
				<td width="100">入学年级：</td>
				<td width="700"><input type="text" name="begin_Time"
					id="begin_Time" class="Wdate" onClick="WdatePicker()"
					placeholder="单击选择日期"><font
					color="red" size="2px">&lt;-选择该班级的入学年级。比如：精英1301班-选择2013年9月份的一天即可，不是当前的创建时间</font></td>
			</tr> -->
			<tr id="contact">
				<td width="120">联系人所在系部：</td>
				<td width="700"><select id="contactDept" name="contactDept"
					onChange="ajaxTeacher()" style="width:200px;">
						<option value="请选择" selected="selected">请选择</option>
						<c:forEach var="o" items="${collegeAndAllDeptList}" varStatus="stauts">
							<option value="${o.id}">${o.org_name}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr id="con">
				<td width="100">联系人：</td>
				<td width="700">
				<select name="contacts" id="contacts"
					style="width:200px;">
				</select></td>
			</tr>
			
			<tr id="header">
				<td width="120">班主任所在系部：</td>
				<td width="700"><select id="headerss" name="headerss"
					onChange="ajaxHeader()" style="width:200px;">
						<option value="请选择" selected="selected">请选择</option>
						<c:forEach var="o" items="${collegeAndAllDeptList}" varStatus="stauts">
							<option value="${o.id}">${o.org_name}</option>
						</c:forEach>
				</select>
				班主任：<select name="contactss" id="contactss"
					style="width:200px;" /></select>
				</td>
			</tr>
			<tr id="counsellor">
				<td width="120">辅导员所在系部：</td>
				<td width="700"><select id="counsellors" name="counsellors"
					onChange="ajaxCounsellor()" style="width:200px;">
						<option value="请选择" selected="selected">请选择</option>
						<c:forEach var="o" items="${collegeAndAllDeptList}" varStatus="stauts">
							<option value="${o.id}">${o.org_name}</option>
						</c:forEach>
				</select>
				辅导员：<select name="counsellorss" id="counsellorss"
					style="width:200px;" /></select>
				</td>
			</tr>
			<tr id="parent_dept">
				<td width="100">上级组织：</td>
				<td width="700"><select id="par_dept" name="par_dept"
					style="width:200px">
						<option value="请选择" selected="selected">请选择</option>
						<c:forEach var="departmentlist" items="${departmentlist}"
							varStatus="stauts">
							<option class="${departmentlist.org_level}"
								value="${departmentlist.id}">${departmentlist.org_name}</option>
						</c:forEach>
				</select></td>
			</tr>
		</table>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="doAdd()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onClick="window.location='./backOrgList.do'">返回</button>
		</div>
	</form>
</body>
</html>
