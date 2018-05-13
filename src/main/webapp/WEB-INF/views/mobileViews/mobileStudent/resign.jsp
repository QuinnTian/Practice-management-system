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
<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<title>更改实习单位</title>
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/agile.layout.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.component.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/flat.color.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">
</head>
<body>
	<div id="section_container">
		<section id="Upload_section" data-role="section">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>更改实习单位</h1>
					<a href="NewEnterprise.do"><i
						class="iconfont iconline-mark-plus"></i></a>

				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:0px;">
				<div class="scroller">
					<form class="form-square" method="post" id="form"
						action="saveResign.do">
						<input type="hidden" name="PracticeRecordId" id="PracticeRecordId"
							value="${PracticeRecordId} "><input type="hidden"
							name="id" id="id" value="${id} "> <label
							class="label-left">原工作单位</label> <label class="label-right">
							<input type="text" style="width: 100%" value="${comName}"
							readOnly="true" />
						</label> <label class="label-left">离职时间</label>
						<div data-role="date" class="label-right">
							<label>${time}</label> <input type="hidden" id="resignTime"
								name="resignTime" value="${time}" />
						</div>
						<label class="label-left">离职原因</label> <label class="label-right">
							<input type="text" style="width: 100%" name="resignCause"
							id="resignCause" />
						</label>
						<div data-role="fieldcontain">
							<label class="label-left" for="text" for="fullname">新入职公司查询：</label>
							<input class="label-right" type="text" name="companyName"
								id="companyName" placeholder="如:**公司，搜索不到请按右上角+按钮"
								onblur="search()"> <select style="width:100%"
								id="com_name" name="com_name">
								<option value="1">请选择实习单位</option>
							</select>
						</div>
						<label class="label-left">职位名称</label> <label class="label-right">
							<input type="text" style="width: 100%" name="position"
							id="position" required="required" />
						</label> <label class="label-left">部门领导</label> <label class="label-right">
							<input type="text" style="width: 100%" name="leader" id="leader" />
						</label> <label class="label-left">公司地区</label> <label class="label-right">
							<input type="text" style="width: 100%" name="orgion" id="orgion" />
						</label> <label class="label-left">入职时间</label>
						<div data-role="date" class="label-right">
							<label>${time}</label> <input type="hidden" id="workTime"
								name="workTime" value="${time}" />
						</div>



						<input type="button" id="da" value="提交" class="block">
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
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script>
		function search() {
			$
					.ajax({
						type : "get",
						url : "ajaxCompany.do?",
						data : getCanShu(), //设置发送参数，即使参数为空，也需要设置     
						dataType : "text", //返回的类型为json  
						contentType : "application/x-www-form-urlencoded; charset=utf-8",
						scriptCharset : "utf-8",
						success : function(data) {
							//成功时执行的方法		
							getPt(data);
						},
						error : function(result, status) { //出错时会执行这里的回调函数                     
							if (status == 'error') {
								alert(status);
							}
						}
					});
			return false;

		};
		function getPt(ajaxData) {//根据返回数据显示搜索结果
			console.log(ajaxData);
			$("#com_name").html(ajaxData);
		};
		function getCanShu() {
			//模糊查询 2015年7月3日 09:22:09邢志武
			var companyName = $("#companyName").val();
			var dataSend = "companyName=" + companyName;
			return dataSend;
		};
		(function() {
			$('#da').on(A.options.clickEvent, function() {
				var com_name = $("#com_name").val();
				var position = $("#position").val();
				var resignCause = $("#resignCause").val();
				var orgion = $("#orgion").val();
				var leader = $("#leader").val();
				if (resignCause == "") {
					A.alert("请输入离职原因");
					return;
				}

				if (com_name == "1") {
					A.alert("请选择新入职的实习单位");
					return;
				}
				if (position == "") {
					A.alert("请输入职位名称");
					return;
				}
				if (leader == "") {
					A.alert("请输入部门领导");
					return;
				}
				if (orgion == "") {
					A.alert("请输入公司地区");
					return;
				}

				$("#form").submit();

			});
		})();
	</script>
</body>
</html>
