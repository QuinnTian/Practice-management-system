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
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconline.css">
<style>
input[type="checkbox"] {
	display: block;
}

.outer {
	border: 1px solid #ccc;
	border-radius: 6px;
}

.accordionbar {
	display: block;
	padding: 10px;
	border-bottom: 1px solid #ccc;
	background-color: #efefef;
	color: #444;
}

.accordionbar.active {
	color: #aaa;
}

[data-role="accordion"] {
	overflow: hidden;
	height: 0px;
	/*可以适当加一些动画*/
	z-index: 10;
	-webkit-transition: height 0.3s ease-in-out, box-shadow 0.6s linear;
	-moz-transition: height 0.3s ease-in-out, box-shadow 0.6s linear;
	-o-transition: height 0.3s ease-in-out, box-shadow 0.6s linear;
	-ms-transition: height 0.3s ease-in-out, box-shadow 0.6s linear;
	transition: height 0.3s ease-in-out, box-shadow 0.6s linear;
} /* 必须为被控制的组件添加默认样式不显示*/
[data-role="accordion"].active {
	border-bottom: 1px solid #ccc;
	height: auto;
	/*可以适当加一些动画*/
	-webkit-transition: height 0.5s ease-in-out, box-shadow 0.1s linear;
	-moz-transition: height 0.5s ease-in-out, box-shadow 0.1s linear;
	-o-transition: height 0.5s ease-in-out, box-shadow 0.1s linear;
	-ms-transition: height 0.5s ease-in-out, box-shadow 0.1s linear;
	transition: height 0.5s ease-in-out, box-shadow 0.1s linear;
	box-shadow: 0px 0px 0px 1px rgba(155, 155, 155, 0.3);
} /* 必须为被控制的组件添加active样式，显示组件*/
[data-role="accordionone"] {
	display: none;
} /* 必须为被控制的组件添加默认样式不显示*/
[data-role="accordionone"].active {
	display: block;
} /* 必须为被控制的组件添加active样式，显示组件*/
</style>
<script async src="http://c.cnzz.com/core.php"></script>
</head>
<body>
	<div id="section_container">
		<section id="work_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>扣分记录添加</h1>
				</div>
			</header>
			<article data-role="article" id="main_article" data-scroll="verticle"
				class="active" style="top:44px;bottom:55px;">
				<form  action="doSubmit.do" name="form"  id="form" method="post" >
<%-- 				<input type="hidden" id="mem" name="mem" value="${newmember}">
 --%>				<input type="hidden" id="man" name="man" value="">
 					<input type="hidden" id="reduce" name="reduce" value="">
 					<input type="hidden" id="list" name="list" value="">
				<div class="scroller padded">
					<div class="text-center padded ">作用对象：</div>
					
					
					<div class="outer">									
						<a class="accordionbar" data-role="accordionbar" data-toggle="accordion" href="#accordion3">请假人员名单</a>

						<ul data-role="accordion" id="accordion3" class="listitem">
						<c:forEach var="app" items="${approval}">
							<li>
								<div class="text">
								${app.temp1}
									<small>${app.temp2}至${app.temp3}</small>
								</div>
								<small class="rcaption">${app.temp4}</small>
							</li>
							</c:forEach>
						</ul>	
					<div class="outer">									
						<a class="accordionbar" data-role="accordionbar" data-toggle="accordion" href="#accordion1">班级</a>

						<ul data-role="accordion" id="accordion1" class="listitem">
						<c:forEach var="index" items="${index_name}">
							<li>
								<div class="text">
									<a data-role="checkbox" > <label for="class" class="black">${index.index_name}</label>
										<input type="checkbox" id="index" value="${index.id}" class="ck">
									</a>
								</div>
							</li>
							</c:forEach>
						</ul>
						<a class="accordionbar" data-role="accordionbar" data-toggle="accordion" href="#accordion2">个人</a>
						<ul data-role="accordion" id="accordion2" class="listitem active" >
							<c:forEach var="meb" items="${class_meb}" varStatus="stauts">
							<li>
								<div class="text">
									<a data-role="checkbox" id="mem" > <label for="class" class="black">${meb.true_name}</label>
										<input type="checkbox" name="member" id="mebs" value="${meb.id}" class="a">
									</a>
								</div>
							</li>
			
							
							</c:forEach>
						</ul>
						
					</div>

				</div>
	</form>
			</article>
		</section>
		<footer id="edit_footer" style="bottom: 0px;">
					<nav class="menubar">
						<a class="menu active"  id="submit">
							<span class="menu-icon iconfont iconline-rdo-tick"></span>
						    <span class="menu-text">确定</span>
						</a>
						
					</nav>
				</footer>
	</div>
	<%-- <c:forEach var="i" items="${n}"> --%>
		<div id="Points_modal" data-role="modal" class="modal bg-carrot" >
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i class="iconfont iconline-arrow-left"></i></a>
					<h1>添加扣分项</h1>
				</div>
			</header>
			<article data-role="article" id="modal_article" data-scroll="verticle"  class="active" style="top:44px;bottom:55px;" >
				<div class="scroller" >
					<form  class="form-group">
						<div class="card" id="list">
							<ul class="listitem" >
								<li class="title">
									请选择扣分项：
								</li>
								<c:forEach var="ind" items="${index_name}">
								<li class="nopadding">
									<a data-role="checkbox" id="in"> <label for="allcheck" class="black">${ind.index_name}</label>
									<input type="checkbox" name="inde" id="indes"  class="ckb2" value="${ind.id}" >
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>
					</form>
				</div>
			</article>
			<footer id="edit_footer" style="bottom: 0px;">
					<nav class="menubar">
						<a class="menu active"  id="sure">
							<span class="menu-icon iconfont iconline-rdo-tick"></span>
						    <span class="menu-text">确定</span>
						</a>
						<a class="menu active" id="cancle">
							<span class="menu-icon iconfont iconline-rdo-cancel"></span>
						    <span class="menu-text">取消</span>
						</a>
					</nav>
				</footer>
		</div>
	<%--  </c:forEach> --%>

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
	<script
		src="<%=path%>/AgileLite/assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>



	<script>
		(function() {
			//[必须]添加accordion控制器
			  A.Controller.add({
				accordion : {
					selector : '[data-toggle="accordion"]',
					isToggle : true,
				//仅控制目标显隐
				},
				accordionone : {
					selector : '[data-toggle="accordionone"]',
				}
			}); 
			//控制选择人员后model的弹出和关闭
			   $("a[id='mem']").each(function (index) {  
			      $(this).on(A.options.clickEvent, function(){
			    	  var member=$(this).find('input.a').val();
			    	  $('#man').attr("value",member);
			    	  $("input[name='inde']").attr("checked",false); 
 			    	  A.Controller.modal('#Points_modal');
			      	 });  
			   });
			//点击model的确定按钮
			var end=new Array();
			var i=0;
			   $('#sure').on(A.options.clickEvent, function(){
				   i++;
				   var member=$("#man").val();//获取当前点击对象的数值
				   var a=[];
					$.each($(".ckb2:checked"),function(i,n){
					    a[i]=n.value;
					});
				   end.push(member+":"+a);
				   end.push("-");
					A.Controller.modal('#Points_modal');
					 
			});  
			//点击扣分记录添加页面的确定按钮,实现最终提交
			$('#submit').on(A.options.clickEvent, function(){
				var b=[];
				$.each($(".ck:checked"),function(i,n){
				    b[i]=n.value;
				    $('#reduce').attr("value",b);
				});
				$('#list').attr("value",end);
				$('#form').submit();
			});
			$('#cancle').on(A.options.clickEvent, function(){
				A.Controller.modal('#Points_modal');
			});
			
		})();
	</script>

</body>
</html>