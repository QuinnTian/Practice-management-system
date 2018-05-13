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

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<title>实践教学管理</title>
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/agile.layout.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.component.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.color.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">

<script>
	function doAdd() {
		var industry = document.getElementById("industry");
		if (industry.value == "请选择行业") {
			alert("请选择行业");
			return;
		}
		/* $("#form").submit();  */
	}
</script>
</head>
<body>
	<div id="section_container">
		<section id="aside_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"> <i
						class="iconfont iconline-arrow-left"></i></a> 
					<h1>新增单位</h1>
				</div>
			</header>
			<article data-role="article" id="practice_article"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form autocomplete="off" id="form" name="form" method="post"
						action="saveCom.do"
						oninput="range_output.value=parseInt(range.value)"
						class="form-common">
						<label class="label-left" for="com_name">企业名称：</label> <label
							class="label-right"> <input id="com_name" name="com_name"
							type="text" value="" required />
						</label>
						<hr />
						<label class="label-left" for="short_name">企业短名：</label> <label
							class="label-right"> <input id="short_name" type="text"
							name="short_name" value="" required />
						</label>
						<hr />

						<!-- <label class="label-left" for="email">行业范围：</label> <label class="label-right"> <input
							id="user" type="text" name="com_name" value="" />
						</label> -->
						<div data-role="fieldcontain">
							<label for="fullname">行业范围 *：</label><select id="industry"
								name="industry"><option>请选择行业</option>
								<c:forEach var="industry" items="${mapIndustry}"
									varStatus="stauts">
									<option value="${industry.key}">${industry.value}</option>
								</c:forEach>
							</select>
						</div>
						<!-- <hr /> -->
						<!-- <button class="block submit outline">
							<span>查询</span>
						</button>
 -->
						<hr />

						<label class="label-left" for="contacts">企业联系人：</label> <label
							class="label-right"> <input id="contacts" name="contacts"
							type="text" value="" required />
						</label>
						<hr />
						<label class="label-left" for="phone">联系人电话：</label> <label
							class="label-right">
							
							
							<input type="text" id="phone" name="phone" autocomplete="off" pattern="^1[345678][0-9]{9}$" required  />
							
							
						</label>
						<hr />
						<label class="label-left" for="user">企业地址：</label> <label
							class="label-right"> <input id="user" name="" type="text"
							value="" required />
						</label>
						<hr />
						<label class="label-left" for="email">E-mail：</label> <label
							class="label-right"> <input id="email" name="email"
							type="email" value="" required />
						</label><input type="hidden" name="check_state" id="check_state"
							value="${company.check_state}"> <input type="hidden"
							name="applicable_scope" id="applicable_scope"
							value="${company.applicable_scope}">
						<hr />
						</ul>
						<button class="block submit" id="submitForm" onclick="doAdd()">
							<i class="iconfont iconline-rdo-tick"></i> <span>提交</span>
						</button>

					</form>

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
	<script type="text/javascript">
		$(function() {
			$('submitForm').on(A.options.clickEvent, function() {
				$("form").submit();
				return false;
			});

		});
	</script>
</body>

</html>