<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
<script type="text/javascript">
	//document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
	//	WeixinJSBridge.call('hideOptionMenu');
	//	WeixinJSBridge.call('showToolbar');
	//});
</script>
<title>实习记录</title>
</head>

<body>
	<div data-role="content" data-theme="e"
		onclick="WeixinJSBridge.call('closeWindow');">
		<div data-role="footer" data-theme="e"
			onclick="WeixinJSBridge.call('closeWindow');">
			<script>
				document.onclick = Hanlder;
				function Hanlder(e) {

				}
			</script>
			<div data-role="header" data-theme="e">
				<h1>实习申请</h1>
			</div>
			<div data-role="content" data-theme="e">
				<p>${des }</p>
			</div>

			<div data-role="footer" data-theme="e">
				<h1>返回微信</h1>
			</div>
		</div>
	</div>
</body>

</html>


