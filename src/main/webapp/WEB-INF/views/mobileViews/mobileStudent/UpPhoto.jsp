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


<script type="text/javascript">

	function doAdd() {
		var maxsize = 5 * 1024 * 1024; //10M
		var kbsize = 1 * 1024 * 1024; //1M  
		var errMsg = "上传的附件文件不能超过5M！！！";
		var tipMsg = "您的浏览器不支持，建议您使用Firefox 或者Chrome ,IE浏览器";
		try {
			var obj_file = document.getElementById("fileuploade");
			if (obj_file.value == "") {
				alert("请先选择上传文件");
				return;
			}
			var filesize = 0;
			if (true) {
				filesize = obj_file.files[0].size; //单位为字节
				filesizemb = filesize / 1024; //转换为kb
			}  else {
				alert(tipMsg);
				return;
			}
			if (filesize == -1) {
				alert(tipMsg);
				return;
			} else if (filesize > maxsize) {
				alert(errMsg);
				return;
			}
		} catch (e) {
			alert(e);
		}
		document.forms[0].submit();
	}
</script>
</head>
<body>
	<div id="section_container">
		<section id="aside_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
						<a data-toggle="back" href="javascript:history.go(-1)
"><i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>实习照片</h1>
				</div>
			</header>
			<article data-role="article" id="practice_article"
				data-scroll="verticle" class="active" style="top:44px;bottom:0px;">
				<div class="scroller">

					<form name="Photo_Form" action="<%=path%>/MobileStudent/doAddPhoto.do" method="post"
						enctype="multipart/form-data" class="card">
						<div class="card">
							<img id="tempimg" src="" style="display:none" /> 上传照片:<input
								type="file" name="file" id="fileuploade" size="40"
								title="文件大小不能超过5M" onchange="fileChange(this);" />
							<span  id="fileSize"  ></span><br>
							<span id="fileType"></span>
						</div>
						<div class="card">
							照片月份: <select id="photoMonth" name="photoMonth">

								<option>07</option>
								<option>08</option>
								<option>09</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
								<option>01</option>
								<option>02</option>
								<option>03</option>
								<option>04</option>
								<option>05</option>
								<option>06</option>
							</select>
						</div>
						<div class="card">
							<input type="button" onclick="doAdd()" value="上传" />
						</div>
					</form>

				</div>
			</article>

		</section>
	</div>




	<!--- third --->
	<script
		src="<%=path%>/AgileLite/assets/third/jquery/jquery-2.1.3.min.js"></script>
	<script src="<%=path%>/AgileLite/assets/third/zepto/zepto.min.js"></script>
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



	<script type="text/javascript">
		function imgShow(outdiv, indiv, bigimg, _this) {
			var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
			$(bigimg).attr("src", src);//设置#bigimg元素的src属性
			/*获取当前点击图片的真实大小，并显示弹出层及大图*/
			$("<img/>").attr("src", src).load(
					function() {
						//获取当前窗口宽度
						var windowW = window.innerWidth
								|| document.documentElement.clientWidth
								|| document.body.clientWidth;
						//获取当前窗口高度
						var windowH = window.innerWideth
								|| document.documentElement.clientHeight
								|| document.body.clientHeight;
						var realWidth = this.width;//获取图片真实宽度
						var realHeight = this.height;//获取图片真实高度
						var imgWidth, imgHeight;
						var scale = 0.6;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放

						if (realHeight > windowH * scale) {//判断图片高度
							imgHeight = windowH * scale;//如大于窗口高度，图片高度进行缩放
							imgWidth = imgHeight / realHeight * realWidth;//等比例缩放宽度
							if (imgWidth > windowW * scale) {//如宽度扔大于窗口宽度
								imgWidth = windowW * scale;//再对宽度进行缩放
							}
						} else if (realWidth > windowW * scale) {//如图片高度合适，判断图片宽度
							imgWidth = windowW * scale;//如大于窗口宽度，图片宽度进行缩放
							imgHeight = imgWidth / realWidth * realHeight;//等比例缩放高度
						} else {//如果图片真实高度和宽度都符合要求，高宽不变
							imgWidth = realWidth;
							imgHeight = realHeight;
						}
						$(bigimg).css("width", imgWidth);//以最终的宽度对图片缩放
						var w = (windowW - imgWidth) / 2;//计算图片与窗口左边距
						var h = (windowH - imgHeight) / 8;//计算图片与窗口上边距
						$(indiv).css({
							"top" : h,
							"left" : w,
						});//设置#indiv的top和left属性
						$(outdiv).fadeIn("fast");//淡入显示#outdiv及.imgclass
					});

			$(outdiv).click(function() {//再次点击淡出消失弹出层
				$(this).fadeOut("fast");
			});
		}
	</script>
</body>



</html>
