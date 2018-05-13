<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="<%=path%>/js/ichart.1.2.min.js"></script>
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<title>任务完成度</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
	//定义数据
	var data = eval("(" + "${cm}" + ")");
	var stateCode=${StateCode};
	console.log(data);
	$(function(){	
			var chart = new iChart.Column2D({
				render : 'canvasDiv',//渲染的Dom目标,canvasDiv为Dom的ID
				data: data,//绑定数据
				title : {
					text : '${college_name}${grade}级毕业实习百分比',
				color : '#3e576f'
			},
			subtitle : {
				text : '--${stateName}',
				color : '#6d869f'
			},
			footnote : {
				text : '实践教学管理系统',
				color : '#909090',
				fontsize : 11,
				padding : '0 38'
			},
				width : 800,//设置宽度，默认单位为px
				height : 500,//设置高度，默认单位为px
				label : {
					fontsize : 21,//x轴字体
					color : '#666666'
				},
				shadow:true,//激活阴影
				shadow_color:'#c7c7c7',//设置阴影颜色
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
					width : 680,
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
				
				},
				sub_option : {
				listeners : {
					beforedraw : function(s) {
						if (s.abc) {
							return false;
						}
						return true;
					},
					/**
					 * r:iChart.Sector2D对象
					 * e:eventObject对象
					 * m:额外参数
					 */
					click : function(s, e, m) {
					
					//window.location.href="<%=path%>/leader/practiceStateCharTeacher.do?DepartmentName=" +s.get('name')+"&&stateCode="+stateCode;
						
						}
					}
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
			//调用绘图方法开始绘图
			chart.draw();
		});
	
</script>

</head>

<body>
	<div id='canvasDiv'></div>
</body>
</html>
