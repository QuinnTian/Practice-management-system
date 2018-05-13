<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>实习管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">

<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/agile.layout.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.component.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.color.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">
<style>
			.photo {
				border-radius: 30px;
				width: 60px;
				height: 60px;
				overflow: hidden;
				background: url(assets/app/img/aside/photo.png) center center;
				background-size: cover;
				display: inline-block;
				vertical-align: middle;
			}
			#aside_container aside {
				background: -webkit-linear-gradient(-45deg, #1b63ab 0%,#0e4882 75%);
			}

			#section_container_mask {
				background-color: #000;
				opacity: .3;
			}

			/*侧滑列表-列表样式*/
			.side-list {
				padding: 10px 20px;
				border-top: 1px solid #1B63AB;
			}
			.side-list:last-child {
				border-bottom: 1px solid #1B63AB;
			}
			.side-list:active {
				background-color: rgba(255,255,255,0.2);
			}
			.side-list.active {
				background-color: rgba(255,255,255,0.2);
			}
			.side-list.active div {
				background-color: rgba(255,255,255,0.2);
			}
			.side-list a {
				color: #fff;
			}
			.side-list-btn {
				font-size: 14px;
				border: 1px solid white;
				width: 80%;
				padding: 6px 0;
				text-align: center;
				position: relative;
				left: 50%;
				-webkit-transform: translateX(-50%);
				margin-bottom: 10px;
			}
			.side-list-btn:active {
				background-color: rgba(255,255,255,0.2)
			}

			.side-list-round {
				width: 36px;
				height: 36px;
				border-radius: 18px;
				border: 1px solid rgba(255,255,255,0.5);
				display: inline-block;
				text-align: center;
				font-size: 20px;
				color: white;
				position: relative;
				vertical-align: middle;
				margin-right: 4px;
			}
			.side-list-round img, .side-list-round .iconfont {
				position: absolute;
				top: 50%;
				left: 50%;
				display: block;
				-webkit-transform: translate(-50%,-50%);
				transform: translate(-50%,-50%);
				width: 20px;
			}
			.side-list-round + span {
				margin-left: 6px;
				font-size: 14px;
			}

		</style>
	</head>
	<body>
		<div id="section_container">
			<section id="aside_section" data-role="section" class="active" >
				<header>
					<div class="titlebar">
							<a data-toggle="back" onclick="window.open('<%=path%>/MobileTeacher/index.do')"><i class="iconfont iconline-arrow-left"></i></a>
						<h1>实习管理</h1>
						
					</div>
				</header>
				<article data-role="article" id="practice_article" data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
					<div class="scroller">
						<ul class="listitem">
							<li class="sliver" >
								学生实习管理
							</li>
							<li>
								<i class="icon iconfont iconline-fav"></i>
								<div class="text" href="internshipApproval.do" data-toggle="html">
									实习申请审批
								</div>
							</li>
							<li>
								<i class="icon iconfont iconline-fav"></i>
								<div class="text" href="InternshipStudentList.do"data-toggle="html">
									实习学生查看
								</div>
							</li>
							<li href="StudentAttendance.do"data-toggle="html">
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									学生签到管理
								</div>
							</li>
							<li>
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									学生总结管理
								</div>
							</li>
							<li>
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									在线测验管理
								</div>
							</li>
							<li href="InternshipTaskViewList.do"data-toggle="html">
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									实习成绩查看
								</div>
							</li>
							<li  href="InformationCheckList.do"data-toggle="html">
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									信息核对列表
								</div>
							</li>
							<li href="RewardPunishmentList.do"data-toggle="html">
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									奖惩管理
								</div>
							</li>
							<li class="sliver">
								通知招聘管理
							</li>
							<li href="NoticeList.do"data-toggle="html">
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									通知信息
								</div>
							</li>
							<li href="RecruitmentInformationList.do"data-toggle="html">
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									招聘信息
								</div>
							</li>
							<li class="sliver">
								教师任务
							</li>
							<li href="GuideRecordManagement.do"data-toggle="html">
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									指导记录管理
								</div>
							</li>
							<li href="TeacherSummary.do"data-toggle="html">
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									教师总结管理
								</div>
							</li>
							<li href="WorkloadView.do"data-toggle="html">
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									工作量查看
								</div>
							</li>
							<li href="StudentQuestionsList.do"data-toggle="html">
								<i class="icon iconfont iconline-fav"></i>
								<div class="text">
									专家解答
								</div>
							</li>
						</ul>
					</div>
				</article>

			</section>
		</div>
	<!--- third --->
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery-2.1.3.min.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery.mobile.custom.min.js"></script>
	<script src="<%=path%>/AgileLite/assets/third/iscroll/iscroll-probe.js"></script>
	<script
		src="<%=path%>/AgileLite/assets/third/arttemplate/template-native.js"></script>
	<!-- agile -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/agile/js/agile.js"></script>
	<!--- bridge --->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/exmobi.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/bridge/agile.exmobi.js"></script>
	<!-- app -->
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
	
</body>
</html>
