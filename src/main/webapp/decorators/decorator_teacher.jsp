<%--
 这个主装饰器应用于所有的页面.它包含标准的缓存, 样式表, 头部, 底部和版权声明.
 --%>
<%-- <%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %> --%>
<%--  <%@ include file="/includes/cache.jsp" %> --%>
<%@ page import="com.sict.service.DictionaryService" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sict.service.*"%>
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

<link rel="shortcut icon" type="image/x-icon"
	href="/springmvc_mybatis/images/sict.png">
<link rel="stylesheet" href="/springmvc_mybatis/css/style1.css" type="text/css" />
<script type="text/javascript"
	src="/springmvc_mybatis/js/changeRoles.js"></script>
<style type='text/css'>
.head {
	float: left;
}
</style>

<sitemesh:write property='head' />
<%-- <script type="text/javascript">
			function toMainPage(){
				var sele=$("#roles option:selected").val();
				var mainPage="";
				if(sele=="ROLE_ADMIN")
				{
					mainPage="<%=path%>/admin/index.do";
				}
				else if(sele=="ROLE_TEACHER")
				{
					mainPage="<%=path%>/teacher/index.do";
				}
				else if(sele=="ROLE_LEADER"||sele=="ROLE_LEADER_COLLEGE")
				{
					mainPage="<%=path%>/leader/index.do";
				}

		window.location.href = mainPage;
	}
</script> --%>
</head>
<body bgcolor="#FFFFFF">
	<div>
		<%@ include file="/includes/header.jsp"%>
		<div class="form-group" align="right">
			<label for="user_role">选择用户角色</label> <select name="roles" id="roles"
				style="width:15%;" onchange="toMainPage()">
				<%
					String current_role_selected = "";
					Cookie[] cookie = request.getCookies();
					for (int i = 0; i < cookie.length; i++) {
						Cookie cook = cookie[i];
						if (cook.getName().equalsIgnoreCase("ck")) { //获取键 
							current_role_selected = cook.getValue().toString(); //获取值 
						}
					}
					
					if(current_role_selected.equals("")){
					  current_role_selected=(String)session.getAttribute("current_role_selected");
					}
				%>
				<c:forEach var="role" items="${user_role}" varStatus="stauts">
					<option value="${role}"
						<c:if test="${role==cookie.ck.value}"> selected</c:if>>
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
	</div>
	<div id="menu">
		<ul class="menu">
			<li><a title="首页" href="index.do"><span id="logo-menu">首页</span></a></li>
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
			<!-- 一级菜单 -->
			<%-- <li><a href="#" class="parent"><span>实习管理</span></a>
			<!-- 一级菜单 -->
				<div>
					<ul>
						<!-- 二级菜单 -->
						<li><a href="" class="parent"><span>通知招聘管理&nbsp;&nbsp;>></span>
						</a>
							<div>
								<ul>
									<li><a href="<%=path%>/teacher/noticeList.do"><span>通知信息</span>
									</a>
									</li>
									<li><a href="<%=path%>/teacher/recruitInfoList.do"><span>招聘信息</span>
									</a>
									</li>
								</ul>
							</div>
						</li>
						<li><a href="<%=path%>/teacher/teaPraTaskList.do?tasktype=1"><span>实习任务查看</span></a></li>
						<li><a href="#" class="parent"><span>学生实习管理&nbsp;&nbsp;>></span></a>
							<div>
								<ul>
									<!-- 三级菜单 -->
									<li><a href="<%=path%>/teacher/checkPracticeList.do"><span>实习申请审批</span>
									</a>
									</li>
									<li><a href="<%=path%>/teacher/bMap.do"><span>学生签到管理</span>
									</a>
									</li>
									<li><a href="<%=path%>/summary/user/home.htm"><span>学生总结管理</span>
									</a>
									</li>
									<li><a href="<%=path%>/teacher/checkThesisList.do"><span>毕业论文审批</span>
									</a>
									</li>
									<li><a href="<%=path%>/zxcy/home.htm"><span>在线测验管理</span>
									</a>
									</li>
									<li><a href="<%=path%>/teacher/evaluateList.do?type='1'"><span>奖惩信息管理</span>
									</a>
									</li>
									<li><a href="<%=path%>/teacher/coreList.do"><span>实习成绩查看</span>
									</a>
									</li>
									<li><a href="<%=path%>/teacher/checkInfoList.do"><span>信息核对任务管理</span>
									</a>
									</li>
									<li><a href="<%=path%>/teacher/practiceRecord.do?type='1'"><span>实习就业记录</span>
									</a>
									</li>
								</ul>
							</div></li>
						<li><a href="<%=path%>/teacher/studentList.do?type='1'"><span>学生信息管理</span>
						</a>
						</li>
						<li><a href="<%=path%>/teacher/getStudentCityStatistics.do"><span>学生实习分布</span></a></li>
						<li><a href="<%=path%>/teacher/ComTeaManage.do"><span>企业老师管理</span></a></li>
						
						<li><a href="<%=path%>/teacher/directrecordList.do"><span>指导记录管理</span></a></li>
						<li><a href="<%=path%>/teacher/teacherSummaryList.do"><span>教师总结管理</span></a></li>
						<li><a href="<%=path%>/teacher/toShortQuestionsList.do"><span>专家问题解答</span></a></li>
						<li><a href="<%=path%>/teacher/teacherMouthWorkload.do"><span>教师月工作量查看</span></a>
						</li>
						<li><!-- <a href="#" class="parent"><span>实习报表</span>
						</a> -->
							<div>
								<ul>
									<!-- 三级菜单 -->
									<!-- <li><a href=""><span>信息核对报表（未做）</span></a></li>
						<li><a href=""><span>签到汇总报表（未做）</span></a></li>
						<li><a href=""><span>实习比例报表（未做）</span></a></li> -->
								</ul>
							</div></li>
					</ul>
				</div>
				</li>
			<li><a href="#" class="parent"><span>整周实训</span></a>
			<!-- 一级菜单 -->
				<div>
					<ul>
						<!-- 二级菜单 -->
						<li><a href="<%=path%>/teacher/teaPraTaskList.do?tasktype=2"><span>实训任务查看</span>
						</a>
						</li>
						<li><a href="<%=path%>/teacher/groupsList.do"><span>实训分组管理</span>
						</a>
						</li>
						<li><a href="<%=path%>/teacher/getTrainDetailReport.do"><span>实训安排报表</span>
						</a>
						</li>
						<li><a href="<%=path%>/teacher/checkTrainList.do"><span>实训作品审阅</span>
						</a>
						</li>
					</ul>
				</div></li>
			<li><a href="<%=path%>/teacher/knowledgeList.do?type='1'" title="常见问题管理"><span>常见问题管理</span></a></li> --%>


			<li><a href="#" class="parent"><span>个人信息</span> </a> <!-- 一级菜单 -->
				<div>
					<ul>
						<!-- 二级菜单 -->
						<li><a href="editmyInfo.do"><span>信息维护</span> </a></li>
						<li><a href="passwordEdit.do"><span>修改密码</span> </a></li>
					</ul>
				</div></li>
			<li><a href="#" class="parent" title="帮助"><span>帮助</span> </a>
				<div>
					<ul>
						<!-- 二级菜单 -->
						<li><a href="helpsUserdownload.do?type=teaWeb"><span>教师web端用户手册下载</span></a></li>
						<li><a href="helpsUserdownload.do?type=stuWeb"><span>学生web端用户手册下载</span></a></li>
						<li><a href="helpsUserdownload.do?type=stuWX"><span>学生微信端用户手册下载</span></a></li>
					</ul>
				</div></li>
			<li><a href="<%=path%>/teacher/contactUS.do" class="parent"
				title="联系我们"><span>联系我们</span></a></li>
			<!-- 在校生以后加着里面先  -->
			<%-- <li><a href="<%=path%>/teacher/associationList.do" class="parent" title="社团"><span>社团</span></a></li> --%>

			<!-- 在校生以后加着里面先  -->
		</ul>
	</div>


	<div id="menu1" style="float:right;">
		<span>欢迎您&nbsp;:&nbsp;&nbsp;${sessionScope.current_user.true_name}老师，当前角色：教师</span>
	</div>


	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<!-- <tr>
			<td height="20" nowrap></td>
		</tr> -->
		<tr>
			<td valign="top"><script type="text/javascript">
				window.status = "Loading: Document body...";
			</script>
				<div class="conbgbtm" id="conbgbtm">
					<sitemesh:write property='body'></sitemesh:write>
				</div></td>
			<!-- <td width="1%" nowrap></td> -->
		</tr>
	</table>
	<%--  <%@ include file="/includes/footer.jsp" %> --%>
	<style type="text/css">
#conbgbtm {
	height: auto !important;
	height: 500px;
	min-height: 500px;
}
</style>
	<%@ include file="/includes/copyright.jsp"%>
	<script type="text/javascript">
		window.status = "Done";
		
		function New_blank(){
			window.location.reload();
			window.open('<%=path%>/summary/user/home.htm', '_blank');
		}
	</script>
</body>
</html>
