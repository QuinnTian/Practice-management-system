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
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>任务完成度</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
	//定义数据
	var data = eval("(" + "${cm}" + ")");
	console.log(data);
	$(function(){	
			var chart = new iChart.Column2D({
				render : 'canvasDiv',//渲染的Dom目标,canvasDiv为Dom的ID
				data: data,//绑定数据
				title : {
				text : '${title}',
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
				shadow:true,//激活阴影
				shadow_color:'#c7c7c7',//设置阴影颜色
				coordinate:{//配置自定义坐标轴
					scale:[{//配置自定义值轴
						 position:'left',//配置左值轴	
						 start_scale:0,//设置开始刻度为0
						 end_scale:100,//设置结束刻度为26
						 scale_space:10,//设置刻度间距
						 listeners:{//配置事件
							parseText:function(t,x,y){//设置解析值轴文本
								return {text:t+" %"};
							}
						}
					}]
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
						/* alert(s.get('name') ); 
						alert(s.get('text') ); */
						window.location.href="<%=path%>/admin/taskAccomplishDepartments.do?stateText="+ s.get('name');
							}
						}
			}
			});
			
			//调用绘图方法开始绘图
			chart.draw();
		});
	
</script>

</head>

<body>
	<div id='canvasDiv'></div>
</body>
</html>
