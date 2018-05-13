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


</head>
<body>
	<div id="section_container">
			<section id="aside_section" data-role="section" class="active" >
				<header>
					<div class="titlebar">
						<a data-toggle="back" href="#"> <i class="iconfont iconline-arrow-left"></i></a>
						<h1>信息核对</h1>
					</div>
				</header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i></a>
					<h1>公司查询（请输入关键字，点击查询，选择实习单位【没有实习单位，如，专升本，请填写专升本点击查询，选择专升本】）</h1>
				</div>

				<article data-role="article" id="practice_article" data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
					<div class="scroller">
						<form autocomplete="off" 
action="saveComTeaccher.do" class="form-square">

							<label class="label-left" for="email">姓名</label>
							<label class="label-right">
								<input id="email" type="text" value="${stu_name}"/>
							</label>
							
							<label class="label-left" for="email">企业名称</label>
							<label class="label-right">
								<input type="text" value="${com_name} "/>
							</label>
							
							<label class="label-left" for="teacher" >企业老师：</label>
							<div data-role="select"class="label-right">
							<select id="sel" style="width: 50%" onchange="test()"  name="comTeacher">
							<c:forEach var="comTeacher" items="${comTeachers}"
									varStatus="stauts">
									<option value="${comTeacher.id}">${comTeacher.true_name}</option>
								</c:forEach>
								<option value="1" id ="addTeacher" onclick="test()">添加企业老师 </option>
							</select>
							</div>
							
							<button class="block submit" onclick="save()">
								<i class="iconfont iconline-rdo-tick"></i>
								<span>提交 </span>
							</button>
						</form>
					</div>

				</article>
				<!--<div id="textareaDiv" style=" top:30%;left:10%;width:80%;background-color: #E8E8E8 ;display: none"id="login_template">-->
					<script type="text/html" id="login_template">
					<div style="padding:10px 20px;">
						<div style="text-align:center;font-size:20px;color:#3498DB;font-weight:600;">
							添加企业老师
						</div>
						
						<input id="textarea"  type="text" name="name" class="full-width" placeholder="教师姓名"  required="required"/>

						<input type="text" name="phone" class="full-width" placeholder="联系电话"   required="required"/>
						<form autocomplete="off" oninput="range_output.value=parseInt(range.value)" class="form-common">
						<label class="label-left"style="width:45%">教师性别：</label>
						    <label class="label-right"style="width:55%">
						    	<a href="#" data-role="radio">
						    		<input type="radio" name="sex" id="male" style="left:0;right:auto;"/>
						  			<label for="male" class="black" checked>男</label>
						  		</a>
						  		<a href="#" data-role="radio">
						  			<input type="radio" name="sex" id="female" style="left:0;right:auto;"/>
						  			<label for="female" class="black">女</label>
						  		</a>
						    </label>
						    </form>
						   
						    <button class="width-full" >
							保存信息
						</button>

					</div>
				</script>

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
		<script>
		function save(){
		
				A.Controller.html('#DoHomework');
			}
		
			function test() {
				var value = $("#sel").val();
				if (value == "1") {
					/*document.getElementById("textareaDiv").style.display = "";*/
					var $popup = A.popup({
			   		html: $('#login_template').html(),
			        css : {width:'auto'},
			        pos : 'center'
			    });
			     $popup.popup.find('button').on(A.options.clickEvent, function(){
			     
			    	A.confirm('提示','确定添加吗？', function(){
			    		/*alert('<option>'+$('#textarea').val()+'</option>');*/
			    		$('#addTeacher').before('<option>'+$('#textarea').val()+'</option>');
			    	
			    		$("#sel").val($('#textarea').val());
			    		
						
			    		$popup.close();
			    	},function(){
			    		
			    		$popup.close();
			    	}
			    	);
			    });
			    return false;
				} 

			}
			
		</script>
</body>

</html>
