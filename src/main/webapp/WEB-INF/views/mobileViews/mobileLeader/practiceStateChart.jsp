<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" contentType="text/html; charset=UTF-8"	%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>领导首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
	//定义数据
	var data = eval("(" + "${cm}" + ")");
	
	$(function() {
		
		var chart = new iChart.Column2D({
			render : 'canvasDiv',
			data : data,
			title : {
				text : '${grade}级全校毕业实习统计--${stateName}',
				color : '#3e576f'
			},
			footnote : {
				text : '${calculateRules}  实践教学管理系统',
				color : '#909090',
				fontsize : 11,
				padding : '0 38'
			},
			width : 1000,
			height : 500,
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
				width : 950,
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
		chart.plugin(new iChart.Custom(
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
	
	
</script>
</head>

<body>
	<div id='canvasDiv'></div>
</body>
</html>
