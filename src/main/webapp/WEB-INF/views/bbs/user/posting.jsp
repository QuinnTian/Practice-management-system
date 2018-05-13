<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>

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
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">
</head>

<body>
	<div id="section_container">
		<section id="form_section" data-role="section" class="active">
			<header>
				<div class="titlebar">
					<a href="<%=path%>/weixin/index.do"><i
						class="iconfont iconline-arrow-left"></i> </a>
					<h1>发表主题</h1>
				</div>
			</header>
			<article data-role="article" id="group_article" class="active"
				data-scroll="verticle" style="top:45px;bottom:0px;">
				<div class="scroller">
					<form class="form-group" method="post" id="form" action="">
						<div class="card">
							<input type="text" id="title" placeholder="主题" class="noborder"
								name="title" style="width: 100%" required>
						</div>

						<div class="card">
							<textarea id="textarea" rows="15" class="noborder" name="content"
								required placeholder="说点什么..."></textarea>
						</div>
						<div class="card">
							<ul class="listitem">
								<li class="title">类型</li>
								<li class="nopadding"><a data-role="radio"> <label
										for="rdo1" class="black">校内生活</label> <input type="radio"
										checked="checked" name="type" id="rdo" value="1" /> </a>
								</li>
								<li class="nopadding"><a data-role="radio"> <label
										for="rdo2" class="black">校外实习</label> <input type="radio"
										name="type" id="rdo" value="2" /> </a>
								</li>
								<li class="nopadding"><a data-role="radio"> <label
										for="rdo3" class="black">人生感悟</label> <input type="radio"
										name="type" id="rdo" value="3" /> </a>
								</li>
							</ul>
						</div>
						<input type="hidden" id="test1" value="1" style="width: 100%">
						<input type="hidden" id="media_ids" name="media_ids" style="width: 100%">
						<div id="div"></div>
						<div class="card" id="btn_file">
								<input type="button"style="color: #000000;" value="请选择文件" class="link">
								<span style="float:right;margin-top:10px;margin-right:15px;    font-size: 20px;color:#aaa" class="iconfont iconline-file"></span>
							</div>
					</form>
					<div class="card">
						<button id="subut" class="bg-turquoise full">
							<i class="iconfont iconline-rdo-tick"></i>&nbsp;&nbsp;发表
						</button>
					</div>
				</div>
			</article>
		</section>
	</div>
	<!--- third --->
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
		src="<%=path%>/AgileLite//assets/component/timepicker/agile.timepicker.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/component/extend.js"></script>
	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/app/js/app.js"></script>
	<!-- wx -->
	<script type="text/javascript"
		src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
		$('#subut').on(A.options.clickEvent, function() {
			 var title = $("#title").val();
			if (title == "") {
				A.alert("提示", "请输入主题！");
				return;
			}
			$("#form").attr("action", "savePost.do");
			var ids = $("#test1").val();
			if(!ids=="1"){
				uploadImage();
			}else{
				$("#form").submit(); 
			}
			//
		});
	</script>
</body>
</html>
<script type="text/javascript">
(function() {
				$("#btn_file").on(A.options.clickEvent, function() {
					A.actionsheet([{
						text : '照片',
						handler : function() {
							chooseImage();
						}
					}]);
					return false;

				});
			})();

	wx.config({
		debug : false,
		appId : '${appId}',
		timestamp : '${timestamp}',
		nonceStr : '${nonceStr}',
		signature : '${signature}',
		jsApiList : [ 'checkJsApi', 'onMenuShareTimeline',
				'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareWeibo',
				'hideMenuItems', 'showMenuItems', 'hideAllNonBaseMenuItem',
				'showAllNonBaseMenuItem', 'translateVoice', 'startRecord',
				'stopRecord', 'onVoiceRecordEnd', 'playVoice', 'pauseVoice',
				'stopVoice', 'uploadVoice', 'downloadVoice', 'chooseImage',
				'previewImage', 'uploadImage', 'downloadImage',
				'getNetworkType', 'openLocation', 'getLocation',
				'hideOptionMenu', 'showOptionMenu', 'closeWindow',
				'scanQRCode', 'chooseWXPay', 'openProductSpecificView',
				'addCard', 'chooseCard', 'openCard' ]
	});
	function chooseImage() {
		//选择图片或拍照
		wx.chooseImage({
			count : 1, // 默认9
			sizeType : [ 'original', 'compressed' ], // 可以指定是原图还是压缩图，默认二者都有
			sourceType : [ 'album', 'camera' ], // 可以指定来源是相册还是相机，默认二者都有
			success : function(res) {
				var localIds = res.localIds;
				$("#test1").val(localIds);
				var ids = $("#test1").val();
				uploadImage();
			}
		});
	}
	//上传招照片
	function uploadImage() {
		var ids = $("#test1").val();
		var idarray = new Array();
		idarray=ids.split(",");
		var data="";
		$.each(idarray, function(i, val) {
			wx.uploadImage({
				localId : val, // 需要上传的图片的本地ID，由chooseImage接口获得
				isShowProgressTips : 1, // 默认为1，显示进度提示
				success : function(res) {
					var serverId = res.serverId; // 返回图片的服务器端ID
					data=data+serverId+"---";
					//存放serverID  (目前的问题！)异步上传 取不到多个serverid
					$("#media_ids").val(data);
					//$("#form").submit(); 
				}
			});
		});
	}
	wx.ready(function() {
	});
</script>



