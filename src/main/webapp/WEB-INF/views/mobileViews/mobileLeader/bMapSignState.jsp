<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	href="<%=path%>/AgileLite/assets/component/timepicker/timepicker.css">
<link rel="stylesheet" href="<%=path%>/AgileLite/assets/app/css/app.css">
<link rel="stylesheet"
	href="<%=path%>/AgileLite/assets/agile/css/flat/iconform.css">
<style>
.photo {
	border-radius: 30px;
	width: 60px;
	height: 60px;
	overflow: hidden;
	background: url(<%=path%>/AgileLite/assets/app/img/aside/photo.png)
		center center;
	background-size: cover;
	display: inline-block;
	vertical-align: middle;
}
#scroller1{
	position: relative;
	font-size: 14px;
	float:right;
}
#aside_container aside {
	background: -webkit-linear-gradient(-45deg, #1b63ab 0%, #0e4882 75%);
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
	background-color: rgba(255, 255, 255, 0.2);
}

.side-list.active {
	background-color: rgba(255, 255, 255, 0.2);
}

.side-list.active div {
	background-color: rgba(255, 255, 255, 0.2);
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
	background-color: rgba(255, 255, 255, 0.2)
}

.side-list-round {
	width: 36px;
	height: 36px;
	border-radius: 18px;
	border: 1px solid rgba(255, 255, 255, 0.5);
	display: inline-block;
	text-align: center;
	font-size: 20px;
	color: white;
	position: relative;
	vertical-align: middle;
	margin-right: 4px;
}

.side-list-round img,.side-list-round .iconfont {
	position: absolute;
	top: 50%;
	left: 50%;
	display: block;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	width: 20px;
}

.side-list-round+span {
	margin-left: 6px;
	font-size: 14px;
}

 .connect a:link {
	color: #000000;
	text-decoration: none;
}

.connect a:visited {
	color: #000000;
	text-decoration: none;
}

.connect a:hover {
	color: #000000;
	text-decoration: none;
}

.connect a:active {
	color: #000000;
	text-decoration: none;
}
</style>
<script type="text/javascript">
	//定义数据jsonData
	
var data = eval("(" + "${cm}" + ")");
	console.log(data);

	$(function() {
		
		var chart = new iChart.Column2D({
			render : 'canvasDiv',
			data : data,
			title : {
				text : '${title}',
				color : '#3e576f'
			},
			subtitle : {
				text : '${provence}',
				color : '#6d869f'
			},
			footnote : {
				text : '${calculateRules}  实践教学管理系统     ',
				color : '#3e576f',
				fontsize : 11,
				padding : '10 50'
			},
			width : 1200,
			height : 400,
			label : {
				fontsize : 12,//x轴字体
				color : '#666666'
			},
			shadow : true,
			shadow_blur : 2,
			shadow_color : '#aaaaaa',
			shadow_offsetx : 1,
			shadow_offsety : 0,
			column_width : 62,
			sub_option : {
				listeners : {
					parseText : function(r, t) {
						return t + "%";
					}
				},
				label : {
					fontsize : 11,
					fontweight : 600,
					color : '#4572a7'
				},
				border : {
					width : 2,
					//radius : '5 5 0 0',//上圆角设置
					color : '#ffffff'
				}
			},
			coordinate : {
				background_color : null,
				grid_color : '#c0c0c0',
				width : 1000,
				axis : {
					color : '#c0d0e0',
					width : [ 0, 0, 1, 0 ]
				},
				scale : [ {
					position : 'left',
					start_scale : 0,
					end_scale : 60,
					scale_space : 10,
					scale_enable : false,
					label : {
						fontsize : 11,
						color : '#666666'
					}
				} ]
			}
		});
		/**
		 *利用自定义组件构造左侧说明文本。
		 */
		chart
				.plugin(new iChart.Custom(
						{
							drawFn : function() {
								/**
								 *计算位置
								 */
								var coo = chart.getCoordinate(), x = coo
										.get('originx'), y = coo.get('originy'), H = coo.height;
								/**
								 *在左侧的位置，设置逆时针90度的旋转，渲染文字。
								 */
								chart.target.textAlign('center').textBaseline(
										'middle').textFont('600 13px Verdana')
										.fillText('百分比',
												x - 40, y + H / 2, false,
												'#6d869f', false, false, false,
												-90);
							}
						}));
		chart.draw();
	});


function ajaxToChart() {
		var year=$("#year").val();
		var code=$("#sss").val();//向后台传两个数据
	
		 window.location.href="schoolBmapPie.do?year="+year+"&code="+code;	
	} 
	
	
</script>
	<script type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	
	<div id="section_container">
		<section id="aside_section" data-role="section" class="active"
			data-aside-left="#left_push_aside">
			<header>
				<div class="titlebar">
					<a data-toggle="back" href="#"><i
						class="iconfont iconline-arrow-left"></i></a>
					<h1>实践教学管理</h1>
				</div>
			</header>
			<article data-role="article" id="main_article" class="active"
				data-scroll="verticle" style="top:40px; overflow: auto;">
				 
				<div class="text-center padded"></div>
						<div class="scroller">
			<input value="${grade}" id="year" name="date" style="width: 80px" class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy'})">
			
			
							  <select style="width: 100%" name="code"  id="sss">
								<option value="1">请选择签到状态</option>
								<option value="2">未签到</option>
								<option value="3">签到</option>
						</select> 

						<input type="button" id="btn" value="查询" onclick="ajaxToChart()">
				<div id='canvasDiv'></div>
			<script type="text/javascript" src="<%=path%>/js/localStorage.js"></script>
					</div>
				<!-- </div>  -->
			</article> 
		</section>
	</div>
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
		
	 	<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/third/zepto/zepto.min.js"></script>
		<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/third/iscroll/iscroll.js"></script>
		<script type="text/javascript"
		src="<%=path%>/AgileLite/assets/third/arttemplate/template.js"></script>
	<!-- <script>
	var time = 100000;
		$('#slider_section').on('sectionshow', function() {
			A.Component.scroll('#tabbarOuter');
		});
		$('#main_article').on('articleload', function() {
			A.Slider('#slide', {
				dots : 'right',
				auto : true
			});
			A.Slider('#sliderPage', {
				dots : 'hide'
			});
		});
		
	</script> -->
</body>
</html>
