<%--
 这个主装饰器应用于所有的页面.它包含标准的缓存, 样式表, 头部, 底部和版权声明.
 --%>
<%-- <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %> --%>
<%--  <%@ include file="/includes/cache.jsp" %> --%>
<%@ page import="com.sict.service.DictionaryService" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.sict.service.SysMenuService"%>
<%@ page import="com.sict.entity.SysMenu"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.web.context.*"%>
<%@ page import="org.springframework.web.context.support.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><sitemesh:write property='title' /></title>
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
	<link rel="shortcut icon" type="image/x-icon" href="/springmvc_mybatis/images/sict.png">

<link rel="stylesheet" href="/springmvc_mybatis/css/style1.css" media="screen"
	type="text/css" />
<!-- <style type='text/css'>
.mainBody {
	padding: 10px;
	border: 1px solid #555555;
}

.disclaimer {
	text-align: center;
	border-top: 1px solid #cccccc;
	margin-top: 40px;
	color: #666666;
	font-size: smaller;
}
</style> -->

<sitemesh:write property='head' />
<script type="text/javascript" src="/springmvc_mybatis/js/changeRoles.js"></script>
</head>
<body bgcolor="#FFFFFF">
	<%@ include file="/includes/header.jsp"%>
	<%-- <div class="form-group" align="right">
		<label for="user_role">选择用户角色</label> 
			<select name="roles" id="roles"	style="width:15%;" onchange="toMainPage()">
						<%
							String current_role_selected =  (String)session.getAttribute("current_role_selected");//用户角色列表
						%>
				<c:forEach var="role" items="${user_role}" varStatus="stauts">
					<option value="${role}"
						<c:if test="${role=='current_role_selected'}"> selected</c:if>>
						<c:set var="ro" value="${role}" scope="request"></c:set>
						<%
							String id = (String) request.getAttribute("ro");
						%>
						<%
							out.println(DictionaryService.findRole(id).getRole_name());
						%>
					</option>
				</c:forEach>
			</select>
		<a href="/springmvc_mybatis/logout.do">退出系统</a>
	</div> --%>
	<div class="form-group" align="right">
			<label for="user_role">选择用户角色</label> <select name="roles" id="roles"
				style="width:15%;" onchange="toMainPage()">
						<%
							String current_role_selected =  (String)session.getAttribute("current_role_selected");//用户角色列表
						%>
				<c:forEach var="role" items="${user_role}" varStatus="stauts">
					<option value="${role}"
						<c:if test="${role==current_role_selected}"> selected</c:if>>
						<c:set var="ro" value="${role}" scope="request"></c:set>
						<%
							String id = (String) request.getAttribute("ro");
						%>
						<%
							out.println(DictionaryService.findRole(id).getRole_name());
						%>
					</option>
				</c:forEach>
			</select>
			<!-- <button class="btn btn-lg btn-primary btn-block" type="button"
			onclick="toMainPage()">切换 </button> -->
			<a href="/springmvc_mybatis/logout.do">退出系统</a>
	</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<!-- <tr>
			<td height="20" nowrap></td>
		</tr> -->

		<!--菜单栏  -->
		<div id="menu">
			<ul class="menu">
				<li>
					<!-- 一级菜单 --> <a title="首页" href="index.do"><span id="logo-menu">首页</span> </a>
				</li>
				<%
				ServletContext servletContext = request.getSession().getServletContext();
				WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(servletContext);
				SysMenuService sysMenuService = (SysMenuService) wac.getBean(SysMenuService.class);
				List<SysMenu> sysMenuList=sysMenuService.selectByRoleId(current_role_selected);
				for(SysMenu s :sysMenuList){
					if(s.getSm_is_top().equals("1")){
						if(s.getSm_page().equals("#")){
							out.println("<li><a href='"+s.getSm_page()+"' class='parent'><span>"+s.getSm_name()+"</span></a>");
						}else{
							out.println("<li><a href='"+path+s.getSm_page()+"' class='parent'><span>"+s.getSm_name()+"</span></a>");
						}
						if(!s.isIsleaf()){
							out.println("<div><ul>");
							List<SysMenu> twoList=s.getSysMenuList();
							 for(int i=0;i<twoList.size();i++){
								if(!twoList.get(i).isIsleaf()){
								    out.println("<li><a class='parent'><span>"+twoList.get(i).getSm_name()+">>"+"&nbsp;&nbsp;</span></a>");
									out.println("<div><ul>");
									List<SysMenu> threeList=twoList.get(i).getSysMenuList();
										for(int j=0;j<threeList.size();j++){
											if(threeList.get(j).getSm_name().equals("学生总结管理")){
												 out.println("<li><a target='_Blank' href='"+path+threeList.get(j).getSm_page()+"'class='parent'><span>"+threeList.get(j).getSm_name()+"</span></a>");
												}else{
											    out.println("<li><a href='"+path+threeList.get(j).getSm_page()+"'class='parent'><span>"+threeList.get(j).getSm_name()+"</span></a>");
												}
										}
									out.println("</ul></div>");
									out.println("</li>");
								}else {
									out.println("<li><a href='"+path+twoList.get(i).getSm_page()+"'class='parent'><span>"+twoList.get(i).getSm_name()+"&nbsp;&nbsp;</span></a>");
									out.println("</li>");
								} 
							} 
							out.println("</ul></div>");
						}
						out.println("</li>");
					}
				}	
		    %>
				<!-- <li>
					一级菜单 <a href="#" class="parent"><span>校外实习</span> </a>
					<div>
						<ul>
							二级菜单
							<li><a href="practiceTaskList.do"><span>实习任务下载</span></a></li>
							<li><a href="seeMyNotice.do"><span>查看通知</span></a></li>
							<li><a href="graduationThesisList.do"><span>毕业论文管理</span></a></li>
							<li><a href="graduationMaterialsList.do"><span>就业材料管理</span></a></li>
							<li><a href="photoUpload.do"><span>实习照片上传</span></a></li>
						</ul>
					</div>
				</li> -->
				<!-- <li>
				一级菜单 <a href="#" class="parent"><span>整周实训</span> </a>
					<div>
						<ul>
							<li><a href="trainList.do"><span>实训作品管理</span></a></li>
						</ul>
					</div>
				</li> -->

		<%-- <li><a href="<%=path%>/wjdc/user/home.htm" title="学生调查问卷"><span>学生调查问卷</span></a></li> --%>
		<%--  <li><a href="<%=path%>/summary/user/home.htm" title="学生总结"><span>学生总结</span>	</a></li>  --%>
		<li><a href="passwordEdit.do" title="修改密码"><span>修改密码</span>
		</a>
		</li>
		<li><a href="personInforEdit.do" title="个人信息"><span>个人信息</span>
		</a>
		</li>
			<li><a href="#" class="parent" title="帮助"><span>帮助</span>
		</a>
		<div>
			<ul>
		     	<li><a href="helpsDownload.do?type=cjwt"><span>常见问题下载</span></a></li>
		     	<li><a href="helpsDownload.do?type=sxjd"><span>实习鉴定表下载</span></a></li>
				<li><a href="helpsDownload.do?type=stuWeb"><span>学生web用户手册下载</span></a></li>
				<li><a href="helpsDownload.do?type=stuWX"><span>学生微信用户手册下载</span></a></li>
			</ul>
		</div>
		</li>
		<li><a href="<%=path%>/student/contactUS.do" class="parent" title="联系我们"><span>联系我们</span></a>
		</li>
		<!-- 在校生以后加着里面先 -->
		<%-- <li><a href="<%=path%>/student/seeStuUnonOrAssociation.do" class="parent" title="学生会社团"><span>学生会社团</span></a></li> --%>
		<!-- 在校生以后加着里面先  -->
		</ul>
		</div>
		<div id="menu1" style="float:right; text-align:right;">
			<span>欢迎您&nbsp;:&nbsp;&nbsp;${sessionScope.current_user.true_name}同学 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</span>
		</div>
		<!-- <td width="2%" nowrap></td> -->
		<tr>
		<td valign="top"> 
		<script type="text/javascript">
			window.status = "Loading: Document body...";
		</script>
			<div class="conbgbtm" id="conbgbtm">
				<sitemesh:write property='body'></sitemesh:write>
			</div></td>
		<!-- <td width="1%" nowrap></td> -->
		</tr>
	</table>
	<%--  <%@ include file="/includes/footer.jsp" %> --%>
	<%@ include file="/includes/copyright.jsp"%>
	<script type="text/javascript">
		window.status = "Done";
	</script>
<!-- 	<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script> -->
	<script src="/springmvc_mybatis/js/menu.js"></script>
	<style type="text/css">
    #conbgbtm{
    height:auto!important;  	
    height:500px;
    min-height:500px;
    }
	</style>
</body>
</html>
