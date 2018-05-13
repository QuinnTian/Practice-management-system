<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'test.jsp' starting page</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

</head>

<body>
	<button onclick="test()">test</button>
	
	<input value="${timestamp}"> 
	<input value="${nonceStr}"> 
	<input value="${signature}"> 
	<input value="${appId}"> 
	
	
	<a href="javascript:void(0);" id="btn1">onMenuShareAppMessage</a>
	<br />
	<br />
	<a href="javascript:void(0);" id="btn2">hideOptionMenu</a>
</body>
</html>
<script type="text/javascript">
	wx.config({
		debug : true,
		appId : '${appId}',
		timestamp : '${timestamp}',
		nonceStr : '${nonceStr}',
		signature : '${signature}',
		jsApiList : [ 'getLocation', 'openLocation', 'scanQRCode' ]
	});

	wx.checkJsApi({
		jsApiList : [ 'getLocation' ], // 需要检测的JS接口列表，所有JS接口列表见附录2,
		success : function(res) {
			// 以键值对的形式返回，可用的api值true，不可用为false
			// 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
		}
	});
	function test() {
		/*wx.openLocation({
		    latitude: 34, // 纬度，浮点数，范围为90 ~ -90
		    longitude:117, // 经度，浮点数，范围为180 ~ -180。
		    name: '不知道', // 位置名
		    address: '在说', // 地址详情说明
		    scale: 1, // 地图缩放级别,整形值,范围从1~28。默认为最大
		    infoUrl: 'www.baidu.com' // 在查看位置界面底部显示的超链接,可点击跳转
		});*/
		wx.scanQRCode({
			needResult : 0, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
			scanType : [ "qrCode", "barCode" ], // 可以指定扫二维码还是一维码，默认二者都有
			success : function(res) {
				var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
			}
		});
		
	}
	wx.ready(function() {
	});
</script>
