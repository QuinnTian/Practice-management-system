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
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<title>角色模板修改</title>
<script >
 function allSelect( name, value )
	{
		var selectedBox = $("tr[id="+name+"] input:checkbox");
		for(var i=0; i<selectedBox.length; i++)
		{
			selectedBox[i].checked = value;
		}
	}

</script>
</head>
<body>
	<h2 align='center'>角色模板修改</h2>
	<form name="templateRoleEditform" method="post"
		action="doEditTemplateRole.do">
		<input type="hidden" name="role_id" id="role_id" value="${role.id}">
		<table border="0" width="1200">
			<tr>
				<td width="100">角色编码：</td>
				<td width="700">${role.role_code}</td>
			</tr>

			<tr>
				<td width="100">角色名称：</td>
				<td width="700"><input type="text" name="role_name" id="role_name"
					value="${role.role_name}" style="width:700px"></td>
			</tr>
			<tr>
				<td width="100">角色描述：</td>
				<td width="700"><input type="text" name="role_desc" 
					value="${role.role_desc}" style="width:700px"></td>
			</tr>
			<tr>
				<td width="100">要同步的角色：</td>
				<td>
						<c:forEach var="role" items="${roleListByRoleTemplate}"
								varStatus="stauts">
								<input type="checkbox" name="rolelist" value="${role.role_code}">${role.role_name}<br/>
						</c:forEach>
				</td>
			</tr>
			<tr>
				<td width="100">菜单编辑：</td>
				<td width="700"></td>
			</tr>
		</table>

		<table width="100%" class="sjjx-table">
			<tr valign="middle">
				<td align="right">用户角色资源</td>
				<td>
					<table border="1" cellpadding="1" cellspacing="1" width="100%">
						<c:forEach var="sysMenuOne" items="${sysMenuLists}"
							varStatus="stauts">
							<c:if test="${sysMenuOne.sm_is_top=='1'}">
								<tr id="${sysMenuOne.id}">
									<td>
										<div class="checkbox">
											<c:if test="${sysMenuOne.ischecked=='true'}">
												<label> <input checked="checked" type="checkbox"
													name="sysMenu"
													onclick="return allSelect('<c:out value="${sysMenuOne.id}"/>',this.checked)"
													value="${sysMenuOne.id}"> ${sysMenuOne.sm_name}</label>
											</c:if>
											<c:if test="${sysMenuOne.ischecked=='false'}">
												<label> <input type="checkbox" name="sysMenu"
													value="${sysMenuOne.id}"
													onclick="return allSelect('<c:out value="${sysMenuOne.id}"/>',this.checked)">
													${sysMenuOne.sm_name}</label>
											</c:if>
										</div></td>
									<c:if test="${sysMenuOne.isleaf}">
										<td></td>
									</c:if>
									<c:if test="${!sysMenuOne.isleaf}">
										<td>
											<table border="1" cellpadding="0" cellspacing="0"
												width="100%">
												<c:forEach var="sysMenuTwo"
													items="${sysMenuOne.sysMenuList}">
													<tr id="${sysMenuTwo.id}">
														<td>
															<div class="checkbox">
																<c:if test="${sysMenuTwo.ischecked=='true'}">
																	<label> <input checked="checked"
																		type="checkbox" name="sysMenu" id="sysMenuTwo"
																		value="${sysMenuTwo.id}"
																		onclick="return allSelect('<c:out value="${sysMenuTwo.id}"/>',this.checked)">
																		${sysMenuTwo.sm_name}</label>
																</c:if>
																<c:if test="${sysMenuTwo.ischecked=='false'}">
																	<label> <input type="checkbox" name="sysMenu"
																		onclick="return allSelect('<c:out value="${sysMenuTwo.id}"/>',this.checked)"
																		id="sysMenuTwo" value="${sysMenuTwo.id}">
																		${sysMenuTwo.sm_name}</label>
																</c:if>
															</div></td>
														<c:out value=""></c:out>
														<c:if test="${!sysMenuTwo.isleaf}">
															<td>
																<table border="0" cellpadding="0" cellspacing="0"
																	width="100%">
																	<c:forEach var="sysMenuThree"
																		items="${sysMenuTwo.sysMenuList}">
																		<tr>
																			<td>
																				<div class="checkbox">
																					<c:if test="${sysMenuThree.ischecked=='true'}">
																						<label> <input checked="checked"
																							type="checkbox" name="sysMenu"
																							value="${sysMenuThree.id}">
																							${sysMenuThree.sm_name}</label>
																					</c:if>
																					<c:if test="${sysMenuThree.ischecked=='false'}">
																						<label> <input type="checkbox"
																							name="sysMenu" value="${sysMenuThree.id}">
																							${sysMenuThree.sm_name}</label>
																					</c:if>
																				</div></td>
																			<c:if test="${sysMenuThree.isleaf}">
																				<td></td>
																			</c:if>
																		</tr>
																	</c:forEach>
																</table></td>
														</c:if>
													</tr>
												</c:forEach>
											</table></td>
									</c:if>
								</tr>
							</c:if>
						</c:forEach>
					</table></td>
			</tr>
		</table>

		<div style="margin-top:20px;">
			<input type="submit" value="保存" />&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <button type="button" onclick="window.location='./roleList.do'">返回</button> -->
		</div>
	</form>
</body>
</html>