<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.sict.service.DictionaryService"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<title>用户角色添加</title>
<script type="text/javascript">
//ajax 获取系级别的老师
	function getSysMenu() {
		getRoleCode();
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "role_getSysMenuByRoletype.do?",
			data : getSend(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "text", //返回的类型为json                
			success : function(data) { //成功时执行的方法
				showSysMenu(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
				}
			}
		});
	}
	function showSysMenu(ajaxData) {
		console.log(ajaxData);
		$("#sysMenu").html(ajaxData);
	}
	function getSend() {
		var val = $("#role_type").val();
		var dataSend = "role_type=" + val;
		return dataSend;
	}
	
	 function allSelect( name, value )
	{
		var selectedBox = $("tr[id="+name+"] input:checkbox");
		for(var i=0; i<selectedBox.length; i++)
		{
			selectedBox[i].checked = value;
		}
	}
	function getRoleCode() {
		var role_type = $("#role_type").val();
		var collegeCode = $("#collegeCode").val();
		var roletype;
		if(role_type=="2"){
			roletype="ROLE_TEACHER";
		}else if(role_type=="3"){
			roletype="ROLE_STUDENT";
		}else if(role_type=="4"){
			roletype="ROLE_LEADER";
		}else if(role_type=="5"){
			roletype="ROLE_COMPANY";
		}else {
			roletype="ROLE_OTHER";
		}
		
		var RoleCode=roletype+"_"+collegeCode+"_";
		$("#basicRole").val(RoleCode);
	}
	
</script>
</head>
<body>
<h2 align='center'>用户角色添加</h2>
	<form name="form1" id="myform" method="post" action="doAddRole.do">
		 <table border="0" width="1000" id="role">
		 	<input type="hidden" name="collegeCode" id="collegeCode" value="${collegeCode}"/>
		 	<tr>
				<td width="100">角色所属类别：</td>
				<td width="700">
				<select name="role_type" id="role_type" onchange="getSysMenu();"   style="width:180px">
						<option value="请选择">请选择</option>
						<!-- <option value="1">管理员</option> -->
						<option value="2">教师</option>
						<option value="4">领导</option>
						<option value="3">学生</option>
						<option value="5">公司</option>
				</select></td>
			</tr>
			<tr>
				<td width="100">角色编码：</td>
				<td width="300"><input id="basicRole" name="basicRole" type="text" value="" readonly> 
				<input type="text" name="role_code" id="role_code"/>
				<font color="red" size="2px" id="font1">&lt;-角色编码：角色类型_学院_角色编码.</font>
				</td>
			</tr>
			<tr>
				<td width="100">角色名称：</td>
				<td width="300"><input type="text" name="role_name" id="role_name"/><font color="red" size="2px" id="font1">&lt;-例：电子信息学院校外实习教师</font>
				</td>
			</tr>
			<tr>
				<td width="100">角色描述：</td>
				<td width="300"><input type="text" name="role_desc" id="role_desc" style="width:600px"/>
				</td>
			</tr>
		</table>
		<div id="sysMenu"></div>
		<%-- <table width="100%" border="1">
			<tr>
				<td>
					用户角色资源
				</td>
				<td >
				 <table border="1"  width="100%">
						<c:forEach var="sysMenuOne" items="${sysMenuList}" varStatus="stauts">
							<c:if test="${sysMenuOne.sm_is_top=='1'}">
								<tr id="<c:out value="${sysMenuOne.id}"/>">
									<td>
											<div class="checkbox">
												<label> 
												<input type="checkbox" onclick="return allSelect('<c:out value="${sysMenuOne.id}"/>',this.checked)"  value="${sysMenuOne.id}"> ${sysMenuOne.sm_name}</label>
											</div>
									</td>
									<c:if test="${sysMenuOne.isleaf}">
										 <td></td> 
									</c:if>
									<c:if test="${!sysMenuOne.isleaf}">
									<td>
										<table border="1" width="100%">
											<c:forEach var="sysMenuTwo" items="${sysMenuOne.sysMenuList}">
											<tr id="<c:out value="${sysMenuTwo.id}"/>">
												<td>
													<div class="checkbox">
													<label> 
													<input type="checkbox" onclick="return allSelect('<c:out value="${sysMenuTwo.id}"/>',this.checked)"  value="${sysMenuTwo.id}"> ${sysMenuTwo.sm_name}</label>
													</div>
												</td>
												<c:if test="${sysMenuTwo.isleaf}">
													<!--  <td></td>  -->
												</c:if>
												<c:if test="${!sysMenuTwo.isleaf}">
													<td>
														 <table  width="100%">
															<c:forEach var="sysMenuThree" items="${sysMenuTwo.sysMenuList}">
															<tr>
																<td>
																	<div class="checkbox">
																	<label> 
																	<input type="checkbox"  name="<c:out value="${sysMenuThree.id}"/>" value="${sysMenuThree.id}"> ${sysMenuThree.sm_name}</label>
																	</div>								
																</td>
															</tr>
															</c:forEach>
														</table> 
													</td>
												</c:if>
											</tr>
											</c:forEach>
										</table>
									</td>
									</c:if>
								</tr>
							</c:if>
						</c:forEach>
				 </table>
				</td>
			</tr>
			</table> --%>
		<div style="margin-top:20px;">
			<input type="submit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./roleList.do'">返回</button>
		</div>
	</form>
</body>
</html>