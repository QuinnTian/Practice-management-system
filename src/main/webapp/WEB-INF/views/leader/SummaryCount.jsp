<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>商职学院月总结提交情况</title>
<!-- 引入 echarts.js -->
<script src="<%=path %>/js/echarts.min.js"></script>
<!-- <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div style="margin-left: 35%">
	选择年级：
	<input value="${ym}" id="year" name="year" style="width: 80px" class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy'})">
	年份：
	<input value="${ym}" id="grade" name="grade" style="width: 80px" class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy'})">
	<input type="button" id="bn" value="查询" onclick="ajaxToChart()">
	</div>
	<div id="lading"  align="center" style="position:absolute; background-color:white; display:none; top:0px; left:0px; right:0px; bottom:0px;z-index:1000" ><img alt="正在疯狂加载中..." style="margin-top: 15%;z-index:1000" src="<%=path%>/images/landing.gif"><p style="z-index:1000">正在疯狂统计中，请稍后...</p></div>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width:100%;height:800px;background-color: #cccccc;margin-top: 2%"></div>
	
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
	/**	var series=eval("${e}");
		var d=eval("${d}");
		var orgNameJson=eval("${orgNameJson}");
		// 指定图表的配置项和数据
		option = {
			title : {
				text : '商职学院签到使用比例情况',
				subtext : '月签到人数/该学院实习总人数'
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : orgNameJson
			},
			toolbox : {
				show : true,
				feature : {
					dataZoom : {},
					dataView : {
						readOnly : false
					},
					magicType : {
						type : [ 'line', 'bar' ]
					},
					restore : {},
					saveAsImage : {}
				}
			},
			xAxis : [ {
				type : 'category',
				boundaryGap : false,
				data :d
			} ],
			yAxis : [ {
				type : 'value',
				axisLabel : {
					formatter : '{value}%'
				}
			} ],
			series : series
		};
		
		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option); **/

		function ajaxToChart(){
			var year=$("#year").val();
			var grade=$("#grade").val();
			localStorage.grade =year;
			localStorage.year =grade;
			$("#lading").show();
			$.ajax({
				type : "get",
				url : "ajaxSummaryCount.do?",
				data : "year="+year+"&grade="+grade,
				dataType : "text",
				success : function(data) {
					tochart(data);
				},
				error : function(result, status) {
					if (status == 'error') {
						alert("请求出错，请稍后再试...");
					}
				}
			});
		}
		function tochart(data) {
			$("#lading").hide();
			if(data.length<425) {
				alert("暂无相应数据...");
				var arr=data.split("---");
				var series=eval(arr[0]);
				var d=eval(arr[1]);
				var orgNameJson=eval(arr[2]);
				setCharOption(series,d,orgNameJson);
			}else{
				var arr=data.split("---");
				var series=eval(arr[0]);
				var d=eval(arr[1]);
				var orgNameJson=eval(arr[2]);
				setCharOption(series,d,orgNameJson);
			}
		}
		
		function setCharOption(series,d,orgNameJson){
			option = {
					title : {
						text : '各二级学院月总结提交情况',
						subtext : '月总结提交人数/该学院实习总人数'
					},
					tooltip : {
						trigger : 'axis'
					},
					legend : {
						data : orgNameJson
					},
					toolbox : {
						show : true,
						feature : {
							dataZoom : {},
							dataView : {
								readOnly : false
							},
							magicType : {
								type : [ 'line', 'bar' ]
							},
							restore : {},
							saveAsImage : {}
						}
					},
					xAxis : [ {
						type : 'category',
						boundaryGap : false,
						data :d
					} ],
					yAxis : [ {
						type : 'value',
						axisLabel : {
							formatter : '{value}%'
						}
					} ],
					series : series
				};
			myChart.setOption(option);
		}
	</script>
	<script type="text/javascript" src="<%=path%>/js/localStorage.js"></script>
</body>
</html>