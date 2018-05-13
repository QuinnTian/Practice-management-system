<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>实习照片</title>
<%-- <base href="<%=basePath%>"> --%>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style type="text/css">
table.imagetable {
	font-family: verdana,arial,sans-serif;
	font-size:16px;
	color:#333333;
	width:100%;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.imagetable th {
	background:#b5cfd2 url('cell-blue.jpg');
	border-width: 0px;
	padding: 0px;
	border-style: solid;
	border-color: #999999;
}
table.imagetable td {
	border-width: 1px;
	padding: 0px;
	border-style: solid;
}
</style>
<style type="text/css">
.result {
	position: fixed;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.7);
	z-index:2;
	width: 100%;
	height: 100%;
	display: none;
}

.imgresult {
	border: 5px solid #fff;
}

#indiv {
	position: absolute;
}
</style>
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript">
	var maxsize = 5 * 1024 * 1024; //10M
	var kbsize = 1 * 1024 * 1024; //1M  
	var errMsg = "上传的附件文件不能超过5M！！！";
	var tipMsg = "您的浏览器不支持，建议您使用Firefox 或者Chrome ,IE浏览器";
	var browserCfg = {};
	var ua = window.navigator.userAgent;
	if (ua.indexOf("MSIE") >= 1) {
		browserCfg.ie = true;
	} else if (ua.indexOf("Firefox") >= 1) {
		browserCfg.firefox = true;
	} else if (ua.indexOf("Chrome") >= 1) {
		browserCfg.chrome = true;
	} else if (ua.indexOf("opera") >= 1) {
		browserCfg.opera = true;
	}
	function fileChange(target, id) {
		var filesize = 0;
		var filetypes = ["jpg","png"];
		var filepath = target.value;
		var filemaxsize = 1024 * 5;
		if (filepath) {
			var isnext = false;
			var fileend=(filepath.substring(filepath.lastIndexOf(".")+1,filepath.length)).toLowerCase();
			if (filetypes && filetypes.length > 0) {
				for ( var i = 0; i < filetypes.length; i++) {
					if (filetypes[i] == fileend) {
						isnext = true;
						break;
					}
				}
			}
			if (!isnext) {
				alert("不接受此文件类型！仅支持jpg和png格式的文件。");
				target.value = "";
				return false;
			}
		} else {
			return false;
		}
		var obj_file = document.getElementById("fileuploade");
		if (obj_file.value == "") {
			alert("请先选择上传文件");
			return;
		}
		var filesize = 0;
		if (browserCfg.firefox || browserCfg.chrome || browserCfg.opera
				|| browserCfg.qq) {
			filesize = obj_file.files[0].size; //单位为字节
			filesizemb = filesize / 1024; //转换为kb
		} else if (browserCfg.ie) {
			var obj_img = document.getElementById('tempimg');
			obj_img.dynsrc = obj_file.value;
			filesize = obj_img.fileSize;
		} else {
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
		var size = filesize / 1024;
		if (size > filemaxsize) {
			alert("附件大小不能大于" + filemaxsize / 1024 + "M！");
			target.value = "";
			return false;
		}
		if (size <= 0) {
			alert("附件大小不能为0M！");
			target.value = "";
			return false;
		}
	}
	
	function doAdd(){
	try {
			var obj_file = document.getElementById("fileuploade");
			if (obj_file.value == "") {
				alert("请先选择上传文件");
				return;
			}
			var filesize = 0;
			if (browserCfg.firefox || browserCfg.chrome || browserCfg.opera
					|| browserCfg.qq) {
				filesize = obj_file.files[0].size; //单位为字节
				filesizemb = filesize / 1024; //转换为kb
			} else if (browserCfg.ie) {
				var obj_img = document.getElementById('tempimg');
				obj_img.dynsrc = obj_file.value;
				filesize = obj_img.fileSize;
			} else {
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
	function doDelete(id){
		 if(window.confirm("确定删除这张照片?")){
	           window.location.href="photoDelete.do?id="+id;
			  }
	}
</script>
</head>
<body>
	<h1>实习照片</h1>
	<form name="Photo_Form" action="doAddPhoto.do" method="post" enctype="multipart/form-data">
	<img id="tempimg" dynsrc="" src="" style="display:none" /> 
	上传照片:<input type="file" name="file" id="fileuploade" size="40" title="文件大小不能超过5M" onchange="fileChange(this);" />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/><br/>
	照片月份: <select id="photoMonth" name="photoMonth" >
				<%-- <option>${month}月</option> --%>
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
	<input type="button" onclick="doAdd()" value="保存" />
	</form><br/>
	<table border="1" class="imagetable">
		<tr>
			<th>实习照片</th>
			<th>详细信息</th>
		</tr>
		<c:forEach var="s" items="${myPhotos}" varStatus="stauts">
			
			<tr>
				<td width="200" headers="200"><img class="imgclass" 
					src="<%=path%>/uploadedfiles/Photos/${s.file_name}" width="200"
					height="200">
					</td>
				<td rowspan="2"> <%-- 描述：${s.description} --%> <br> 上传时间：${s.upload_time}<br>名称：${s.file_name}</td>
				
			</tr>
			<tr>
				<td align="center" >
				<c:set var="testStr" value="${s.file_name}"></c:set> <c:choose>
						<c:when test="${fn:length(testStr) > 10}">
							<c:out value="${fn:substring(testStr, 5, 7)}月照片" />
						</c:when>
						<c:otherwise>
							<c:out value="${testStr}" />
						</c:otherwise>
					</c:choose>
					<br/>
					<button onclick="doDelete('${s.id}');">删除照片</button>
				</td>
				<td ></td>
			</tr>
			
		</c:forEach>
		<c:if test="${myPhotos == '[]'}">
		<tr>
			<td width="200"><img class="imgclass" title="点击查看大图"
				src="<%=path%>/images/lf.png" width="200" height="200">
			</td>
			<td>描述：还没有上传过实习照片<br>上传时间：****-**-** **:**:**.*</td>
		</tr>
		</c:if>
		<c:if test="${myPhotos != '[]'}">
		</c:if>
		
	</table>
	
	<div class="result" id="outdiv">
		<div id="indiv">
			<img class="imgresult" id="bigimg" src="" />
		</div>
	</div>
	<script type="text/javascript">
		/* $(function() {
			$(".imgclass").click(function() {
				var thiselement = $(this);
				imgShow("#outdiv", "#indiv", "#bigimg", thiselement);
			});
		}); */

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
