<%@ tag body-content="tagdependent" pageEncoding="UTF-8" description="主菜单实现" %>

<%
	String path = request.getContextPath();
%>
<script>
	$(function() {
		$("li").find("ul").prev().click(function(event) {
			event.preventDefault();   // 阻止链接默认行为，实现有子菜单的父菜单链接失效的效果
			$(this).next().toggle();
		});
		
		$("li:has(ul)").find("ul").hide();
	});
</script>

<div id="navigation">
	<!-- <ul id="listUL"> -->
	
<!-- 菜单定义开始 -->
<ul id="accordion1" class="accordion">
	<!-- 一级菜单 -->
	<li><a title="首页" href="<%=path%>/admin/index.do"> <div class="link"><span id="logo-menu">首页</span></div></a></li>
	<li>						
		<div class="link">基础设置<i class="fa fa-chevron-down"></i></div>
		<ul class="submenu"><!-- 二级菜单 -->
			<li><a href="teacherList.do">教师管理</a></li>
			<li><a href="teacherImportList.do">教师导入</a></li>
			<li><a href="studentImportList.do">学生导入</a></li>
			<li><a href="<%=path%>/admin/orgList.do">组织管理</a></li>
			<li><a href="roleList.do">角色管理</a></li>
			<li><a href="userRoleList.do">权限分配</a></li>
			<li><a href="groupsList.do">小组管理</a></li>
			<li><a href="#">学生报表(未做)</a></li>
		</ul>
	</li>
					<!-- 一级菜单 --> 
					<li><div class="link">校外实习<i class="fa fa-chevron-down"></i></div>
						<ul class="submenu"><!-- 二级菜单 -->
							<li><a href="<%=path %>/admin/practicetaskList.do">发布实践教学任务</a></li>
							<li><a href="noticeList.do">发布通知公告</a></li>
							<li><a href="companyList.do">企业审核与维护</a></li>
							<li><a href="positionList.do">企业岗位审核与维护</a></li>
							<li><a href="<%=path%>/wjdc/user/home.htm">管理问卷</a></li>
							<li><a href="<%=path%>/summary/user/home.htm">管理总结</a></li>
							<li><a href="recruitInfoList.do">招聘信息</a></li>
							<li><a href="">查看就业材料汇总（未做）</a></li>
							<li><a href="">查看实习成绩汇总（未做）</a></li>
							<li><a href="">查看就业率（未做）</a></li>
							<li><a href="">查看实习违纪汇总（未做）</a></li>
							<li><a href="">查看信息核对汇总（未做）</a></li>
							
						</ul></li>
					<li>
						<!-- 一级菜单 --> 
						<div class="link">整周实训<i class="fa fa-chevron-down"></i></div>
						<ul class="submenu">
							<li><a href="<%=path %>/admin/practicetaskList.do">发布实践教学任务</a></li>
							<li><a href="<%=path %>/admin/courseList.do">课程维护</a></li>
							<li><a href="<%=path %>/admin/practiceTask.do">查看实训任务</a></li>
							<li><a href="<%=path %>/admin/trainDetailList.do">上传实训安排</a></li>
							<li><a href="#">查看实训成绩（未做）</a></li>
							<li><a href="#">查看实训违纪汇总（未做）</a></li>
						</ul></li>
					<li><div class="link">
						<!-- 一级菜单 --> 评分管理<i class="fa fa-chevron-down"></i></div>
						<ul class="submenu">
							<li><a
								href="evaluateStandardList.do">评分标准管理</a>
							</li>
							<li><a href="evalsIndexList.do">评分标准指标管理</a>
							</li>

						</ul>
					</li>
					<li><a href="editmyInfo.do"><div class="link">个人信息维护</div></a></li>
					<li><a href="passwordEdit.do"><div class="link">修改密码</div></a></li>
					<li>
				<!-- 一级菜单 --> <a href="/springmvc_mybatis/logout.do"><div class="link">退出系统</div></a></li>
						
	<%-- 
	
		<li><a  href="<%=path%>/admin/index.do">首页</a>
		</li>
		<li><a href="#">ajax演示</a>
			<ul>
				<li><a href="<%=path%>/admin/ajaxtest.do">数据查询</a>
				</li>				
			</ul></li>
		<li><a href="#">报表演示</a>
			<ul>
				<li><a href="<%=path%>/admin/getpdfReport.do">pdf报表</a>
				</li>
				<li><a href="<%=path%>/admin/getExcelEmployees.do">员工报表</a>
				</li>
			</ul></li>
		<li><a href="#">图表演示</a>
			<ul>
				<li><a href="<%=path%>/admin/toChengjiFenxi.do">成绩分析</a>
				</li>				
			</ul></li>	
		<li><a href="<%=path%>/admin/upDownloadFiles.do">文件操作</a>
		</li>	
		<li><a  href="<%=path%>/admin/treedemo.do">组织树示例</a>
		</li>	
		<li><a  href="<%=path%>/admin/datetest.do">日期存取</a>
		</li> --%>
	</ul>
</div>