<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>未签到列表</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=XHDPar7ajC4hcnQZS5DPimj1"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.reveal.js"></script>
<script type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/BMap.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/BMapUnSin.css">
<script>
//全选方法   <贾建昶>

	window.onload = function() {
		$("#all").click(function() {
			$("table :checkbox").prop("checked", $(this).prop("checked"));
		});
		//模拟获取到右下角坐标点(后台运算)
		var Xmax =(document.getElementById('Xmax').value) * 1;
		console.log("Xmax:"+Xmax);
		var Ymax =(document.getElementById('Ymax').value) * 1;
		console.log("Ymax:"+Ymax);
		//模拟获取到左上角坐标点
		var Xmin = (document.getElementById('Xmin').value) * 1;
		console.log("Xmin:"+Xmin);
		var Ymin = (document.getElementById('Ymin').value) * 1;
		console.log("Ymin:"+Ymin);
		//获取当前时间
		var date = new Date();	
		console.log("当前时间:"+date);
		// 百度地图API功能
		// 创建Map实例,设置地图允许的最小/大级别
		var map = new BMap.Map("allmap", {
			minZoom : 5,
			maxZoom : 18
		});
		//求出显示地图范围的中点
		var point = new BMap.Point((Xmax + Xmin) / 2, (Ymin + Ymax) / 2);
		console.log("地图中点:"+((Xmax + Xmin) / 2)+","+((Ymin + Ymax) / 2));
		//启用滚轮放大缩小，默认禁用
		if(((Xmax + Ymax) / 2)==0){
			point=new BMap.Point(103.40, 36);
		}
		map.enableScrollWheelZoom();
		//添加比例尺控件
		map.addControl(new BMap.NavigationControl());
		//控制地图初始显示的范围大小
		map.centerAndZoom(point, 4);
		var a = '${sJson}';
		console.log(a);
		var Stu = eval(a);
		console.log("----------------") ;
			var student_id;
		for ( var i = 0; i < Stu.length; i++) {
			//获取所需要显示的相关信息
			for ( var j = 0; j < Stu[i].length; j++) {
				console.log(Stu[i][j].stu_code);
				var stu_id=Stu[i][j].stu_code;
				var y = Stu[i][j].latitude;
				var x = Stu[i][j].longitude;
				var Name = Stu[i][j].true_name;
				var Classes = Stu[i][j].org_name;
				var Phone = Stu[i][j].phone;
				var sign_time = Stu[i][j].sign_time;
				var signTime=stringToDate1(sign_time,"-");
				console.log("签到时间："+sign_time);
				console.log("转化后："+signTime);
				var begin=Stu[i][j].begin_time;
				console.log("开始时间："+begin);
				var begin_time=stringToDate(begin,"-");
				console.log("转化后："+begin_time);
				//获取同学合理地区结束时间
				var end=Stu[i][j].end_time;
				console.log("结束时间："+end);
				var end_time=stringToDate2(end,"-");
				console.log("转化后："+end_time);
				//获取时间差
				var deltaT = processingTime(sign_time);
				var jdy= Stu[i][j].latitude_r;
				var jdx = Stu[i][j].longitude_r;
				pointA = new BMap.Point(x, y);
				pointB = new BMap.Point(jdx, jdy);
			   	student_id=Stu[i][j].stu_id;
			    console.log("学生id:"+student_id);
				
				if(begin_time<signTime && signTime<end_time){
				
				//判断是否是今天签到（否）
				if (deltaT >= 24) {
					//灰色图标标注最后签到的日期
					addMarker(pointA, 11, Name, Classes, Phone,stu_id,student_id,sign_time);
				} else {

					//获取实际位置与公司位置之间的距离
					var dist = map.getDistance(pointA, pointB).toFixed(2);
					//判断是否在规定的范围内（是）
					if (dist < 30000) {
						//正常签到，绿色标注
						addMarker(pointA, 12, Name, Classes, Phone,stu_id,student_id,sign_time);
					} else {
						//异常，红色跳动标注
						redMarker(pointA, Name, Classes, Phone,stu_id,student_id,sign_time);
					}
				}
				}else{
						//异常，红色跳动标注
						redMarker(pointA, Name, Classes, Phone,stu_id,student_id,sign_time);
				}
			}
		}

		function showInfo() {
			var opts = {
				width : 250, // 信息窗口宽度
				height : 160, // 信息窗口高度
				title : '学生信息'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path%>/teacher/showLatitude.do?id='+this.student_id +'">修改合理区域</a>'// 信息窗口标题
			};
			// 创建信息窗口对象
			var infoWindow = new BMap.InfoWindow("姓名：" + this.Name 
					+ "</br> 班级：" + this.Classes + "</br> 学号：" + this.stu_id+ "</br> 联系电话：" + this.Phone+ "</br>签到时间：" +this.sign_time,
					opts);
			// 打开信息窗口
			this.openInfoWindow(infoWindow);
		}
		
		function redMarker(pointA, Name, Classes, Phone,stu_id,student_id,sign_time){
						//异常签到，红色跳动标注
						var marker = new BMap.Marker(pointA);
						
						//为marker添加新属性
						marker.Name = Name;
						marker.Classes = Classes;
						marker.Phone = Phone;
						marker.stu_id=stu_id;
						marker.student_id=student_id;
						marker.sign_time=sign_time;
						// 将标注添加到地图中
						map.addOverlay(marker);
						//跳动的动画
						marker.setAnimation(BMAP_ANIMATION_BOUNCE);
						//设置监听
						marker.addEventListener("click", showInfo);
		}
		
		function addMarker(point, index, name, classes, phone,stu_id,student_id,sign_time) {
			// 创建图标对象
			var myIcon = new BMap.Icon("<%=path%>/images/markers.png",
					new BMap.Size(23, 25), {

						// 指定定位位置。
						// 当标注显示在地图上时，其所指向的地理位置距离图标左上
						// 角各偏移10像素和25像素。您可以看到在本例中该位置即是
						// 图标中央下端的尖角位置。
						offset : new BMap.Size(10, 25),
						// 设置图片偏移。
						// 当您需要从一幅较大的图片中截取某部分作为标注图标时，您
						// 需要指定大图的偏移位置，此做法与css sprites技术类似。
						imageOffset : new BMap.Size(0, 0 - index * 25)
					// 设置图片偏移
					});

			// 创建标注对象并添加到地图
			var marker = new BMap.Marker(point, {
				icon : myIcon
			});
			//将标注添加到地图上
			map.addOverlay(marker);
			//添加监听事件
			marker.addEventListener("click", showInfo);
			//给marker赋新属性
			marker.Name = name;
			marker.Classes = classes;
			marker.Phone = phone;
			marker.stu_id = stu_id;
			marker.student_id = student_id;
			marker.sign_time=sign_time;
		}

		//处理时间的方法，用来判断是否今天签到
		function processingTime(time) {
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			var d = date.getDate();
			var nowTime = y * 12 * 30 * 24 + m * 30 * 24 + d * 24;
			//json字符串时间转换成小时
			var a = time.substr(0, 4); // 获取子字符串。
			var b = time.substr(5, 2);
			var c = time.substr(8, 2);
			var jsonTime = a * 12 * 30 * 24 + b * 30 * 24 + c * 24;
			//获取时间差
			deltaT = nowTime - jsonTime;
			console.log("++++++++++deltaT:" + deltaT);
			return deltaT;
		}

		//json字符串转化成时间类型的方法 处理开始时间
		function stringToDate(dateStr, separator) {
			if (!separator) {
				separator = "-";
			}
			var dateArr = dateStr.split(separator);
			var year = parseInt(dateArr[0]);
			var month;
			if (dateArr[1].indexOf("0") == 0) {
				month = parseInt(dateArr[1].substring(1));
			} else {
				month = parseInt(dateArr[1]);
			}
			var day = parseInt(dateArr[2]);
			var date = new Date(year, month - 1, day - 1);
			return date;
		}
		//json字符串转化成时间类型的方法 处理签到时间
		function stringToDate1(dateStr, separator) {
			if (!separator) {
				separator = "-";
			}
			var dateArr = dateStr.split(separator);
			var year = parseInt(dateArr[0]);
			var month;
			if (dateArr[1].indexOf("0") == 0) {
				month = parseInt(dateArr[1].substring(1));
			} else {
				month = parseInt(dateArr[1]);
			}
			var day = parseInt(dateArr[2]);
			var date = new Date(year, month - 1, day);
			return date;
		}
		//json字符串转化成时间类型的方法 处理结束时间
		function stringToDate2(dateStr, separator) {
			if (!separator) {
				separator = "-";
			}
			var dateArr = dateStr.split(separator);
			var year = parseInt(dateArr[0]);
			var month;
			if (dateArr[1].indexOf("0") == 0) {
				month = parseInt(dateArr[1].substring(1));
			} else {
				month = parseInt(dateArr[1]);
			}
			var day = parseInt(dateArr[2]);
			var date = new Date(year, month - 1, day + 1);
			return date;
		}
		var grade='${grade}';
		console.log("grade:"+grade);
		$("#year").val(grade);
		$("#pk_id").change();
	};
</script>

<script type="text/javascript">
//筛选
function change() {
		$.ajax({
				type : "get",
				contentType : "application/json",
				url : "ajaxPk_id.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "json", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
				//实现小组无人签到时，弹出对话框
				var Stu = eval(data);
				var a=0;
				for(var i=0;i<Stu.length;i++){
				if(Stu[i].length==0){
				a=a+1;
				}
				if(a==Stu.length){
				alert("该任务小组未有人签到，查看详情请点击“从未签到”按钮查看！");
				}
				}
				bmap(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
	}
	
	function changeYear() {
		$.ajax({
				type : "get",
				contentType : "application/json",
				url : "ajaxYear.do?",
				data : getYear(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
				setGroup(data);
				console.log("ajaxData:"+data);
				
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
	}
	
		function getYear(){
			var year=$("#year").val();
			var dataSend = "year="+year;
			return dataSend;
		}
		function setGroup(ajaxData){
		 
		  $("#pk_id"). html(ajaxData);
		 
		}
	
	     function getSendData() {
			var pk_id = $("#pk_id").val();
			var year=$("#year").val();
			console.log("year:"+year);
			var dataSend = "pk_id="+pk_id+"&year="+year;		
			console.log(dataSend);
			return dataSend;
		}
		
		function getUnSinStus(){
		
			$.ajax({
				type : "get",
				contentType : "application/json",
				url : "ajaxStusSinState.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
				setUnSinStus(data);
				console.log("ajaxDataUnSin:"+data);
				
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
		function getMoth(){
		/* var moth=$("#moth").val(); */
		var ym=$("#ym").val();
		$("#all").prop("checked",false);
		var pk_id = $("#pk_id").val();
		$.ajax({
				type : "get",
				contentType : "application/json",
				url : "ajaxStusSinState2.do?",
				data : "ym="+ym+"&pk_id="+pk_id, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
				setUnSinStus(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
		function setUnSinStus(ajaxData){
		$("table[id='table'] tr[id!='tr']").remove();
		$("#tr").after(ajaxData);
		console.log("ajax返回成功！");
		
		
		}
		
		
		

	function bmap(ajaxData){
				//模拟获取到右下角坐标点(后台运算)
		var Xmax =(document.getElementById('Xmax').value) * 1;
		console.log("Xmax:"+Xmax);
		var Ymax =(document.getElementById('Ymax').value) * 1;
		console.log("Ymax:"+Ymax);
		//模拟获取到左上角坐标点
		var Xmin = (document.getElementById('Xmin').value) * 1;
		console.log("Xmin:"+Xmin);
		var Ymin = (document.getElementById('Ymin').value) * 1;
		console.log("Ymin:"+Ymin);
		//获取当前时间
		var date = new Date();	
		console.log("当前时间:"+date);
		// 百度地图API功能
		// 创建Map实例,设置地图允许的最小/大级别
		var map = new BMap.Map("allmap", {
			minZoom : 5,
			maxZoom : 18
		});
		//求出显示地图范围的中点
		var point = new BMap.Point((Xmax + Xmin) / 2, (Ymin + Ymax) / 2);
		console.log("地图中点:"+((Xmax + Xmin) / 2)+","+((Ymin + Ymax) / 2));
		//启用滚轮放大缩小，默认禁用
		if(((Xmax + Ymax) / 2)==0){
			point=new BMap.Point(103.40, 36);
		}
		map.enableScrollWheelZoom();
		//添加比例尺控件
		map.addControl(new BMap.NavigationControl());
		//控制地图初始显示的范围大小
		map.centerAndZoom(point, 4);
		var Stu = eval(ajaxData);
		console.log("----------------");
		var student_id;
		for ( var i = 0; i < Stu.length; i++) {
			//获取所需要显示的相关信息
			for ( var j = 0; j < Stu[i].length; j++) {
				console.log(Stu[i][j].stu_code);
				var stu_id=Stu[i][j].stu_code;
				var y = Stu[i][j].latitude;
				var x = Stu[i][j].longitude;
				var Name = Stu[i][j].true_name;
				var Classes = Stu[i][j].org_name;
				var Phone = Stu[i][j].phone;
				var sign_time = Stu[i][j].sign_time;
				var signTime=stringToDate1(sign_time,"-");
				console.log("签到时间："+sign_time);
				console.log("转化后："+signTime);
				var begin=Stu[i][j].begin_time;
				console.log("开始时间："+begin);
				var begin_time=stringToDate(begin,"-");
				console.log("转化后："+begin_time);
				//获取同学合理地区结束时间
				var end=Stu[i][j].end_time;
				console.log("结束时间："+end);
				var end_time=stringToDate2(end,"-");
				console.log("转化后："+end_time);
				//获取时间差
				var deltaT = processingTime(sign_time);
				var jdy= Stu[i][j].latitude_r;
				var jdx = Stu[i][j].longitude_r;
				pointA = new BMap.Point(x, y);
				pointB = new BMap.Point(jdx, jdy);
			   	student_id=Stu[i][j].stu_id;
			    console.log("学生id:"+student_id);
				
				if(begin_time<signTime && signTime<end_time){
				
				//判断是否是今天签到（否）
				if (deltaT >= 24) {
					//灰色图标标注最后签到的日期
					addMarker(pointA, 11, Name, Classes, Phone,stu_id,student_id,sign_time);
				} else {

					//获取实际位置与公司位置之间的距离
					var dist = map.getDistance(pointA, pointB).toFixed(2);
					//判断是否在规定的范围内（是）
					if (dist < 30000) {
						//正常签到，绿色标注
						addMarker(pointA, 12, Name, Classes, Phone,stu_id,student_id,sign_time);
					} else {
						//异常，红色跳动标注
						redMarker(pointA, Name, Classes, Phone,stu_id,student_id,sign_time);
					}
				}
				}else{
						//异常，红色跳动标注
						redMarker(pointA, Name, Classes, Phone,stu_id,student_id,sign_time);
				}
			}
		}

		function showInfo() {
			var opts = {
				width : 250, // 信息窗口宽度
				height : 160, // 信息窗口高度
				title : '学生信息'+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=path%>/teacher/showLatitude.do?id='+this.student_id +'">修改合理区域</a>'// 信息窗口标题
			};
			// 创建信息窗口对象
			var infoWindow = new BMap.InfoWindow("姓名：" + this.Name 
					+ "</br> 班级：" + this.Classes + "</br> 学号：" + this.stu_id+ "</br> 联系电话：" + this.Phone+ "</br>签到时间：" +this.sign_time,
					opts);
			// 打开信息窗口
			this.openInfoWindow(infoWindow);
		}
		
		function redMarker(pointA, Name, Classes, Phone,stu_id,student_id,sign_time){
						//异常签到，红色跳动标注
						var marker = new BMap.Marker(pointA);
						//为marker添加新属性
						marker.Name = Name;
						marker.Classes = Classes;
						marker.Phone = Phone;
						marker.stu_id=stu_id;
						marker.student_id=student_id;
						marker.sign_time=sign_time;
						// 将标注添加到地图中
						map.addOverlay(marker);
						//跳动的动画
						marker.setAnimation(BMAP_ANIMATION_BOUNCE);
						//设置监听
						marker.addEventListener("click", showInfo);
		}
		
		function addMarker(point, index, name, classes, phone,stu_id,student_id,sign_time) {
			// 创建图标对象
			var myIcon = new BMap.Icon("<%=path%>/images/markers.png",
					new BMap.Size(23, 25), {

						// 指定定位位置。
						// 当标注显示在地图上时，其所指向的地理位置距离图标左上
						// 角各偏移10像素和25像素。您可以看到在本例中该位置即是
						// 图标中央下端的尖角位置。
						offset : new BMap.Size(10, 25),
						// 设置图片偏移。
						// 当您需要从一幅较大的图片中截取某部分作为标注图标时，您
						// 需要指定大图的偏移位置，此做法与css sprites技术类似。
						imageOffset : new BMap.Size(0, 0 - index * 25)
					// 设置图片偏移
					});

			// 创建标注对象并添加到地图
			var marker = new BMap.Marker(point, {
				icon : myIcon
			});
			//将标注添加到地图上
			map.addOverlay(marker);
			//添加监听事件
			marker.addEventListener("click", showInfo);
			//给marker赋新属性
			marker.Name = name;
			marker.Classes = classes;
			marker.Phone = phone;
			marker.stu_id = stu_id;
			marker.student_id = student_id;
			marker.sign_time = sign_time;
		}

		//处理时间的方法，用来判断是否今天签到
		function processingTime(time) {
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			var d = date.getDate();
			var nowTime = y * 12 * 30 * 24 + m * 30 * 24 + d * 24;
			//json字符串时间转换成小时
			var a = time.substr(0, 4); // 获取子字符串。
			var b = time.substr(5, 2);
			var c = time.substr(8, 2);
			var jsonTime = a * 12 * 30 * 24 + b * 30 * 24 + c * 24;
			//获取时间差
			deltaT = nowTime - jsonTime;
			console.log("++++++++++deltaT:" + deltaT);
			return deltaT;
		}

		//json字符串转化成时间类型的方法 处理开始时间
		function stringToDate(dateStr, separator) {
			if (!separator) {
				separator = "-";
			}
			var dateArr = dateStr.split(separator);
			var year = parseInt(dateArr[0]);
			var month;
			if (dateArr[1].indexOf("0") == 0) {
				month = parseInt(dateArr[1].substring(1));
			} else {
				month = parseInt(dateArr[1]);
			}
			var day = parseInt(dateArr[2]);
			var date = new Date(year, month - 1, day - 1);
			return date;
		}
		//json字符串转化成时间类型的方法 处理签到时间
		function stringToDate1(dateStr, separator) {
			if (!separator) {
				separator = "-";
			}
			var dateArr = dateStr.split(separator);
			var year = parseInt(dateArr[0]);
			var month;
			if (dateArr[1].indexOf("0") == 0) {
				month = parseInt(dateArr[1].substring(1));
			} else {
				month = parseInt(dateArr[1]);
			}
			var day = parseInt(dateArr[2]);
			var date = new Date(year, month - 1, day);
			return date;
		}
		//json字符串转化成时间类型的方法 处理结束时间
		function stringToDate2(dateStr, separator) {
			if (!separator) {
				separator = "-";
			}
			var dateArr = dateStr.split(separator);
			var year = parseInt(dateArr[0]);
			var month;
			if (dateArr[1].indexOf("0") == 0) {
				month = parseInt(dateArr[1].substring(1));
			} else {
				month = parseInt(dateArr[1]);
			}
			var day = parseInt(dateArr[2]);
			var date = new Date(year, month - 1, day + 1);
			return date;
		}

	}
	function setNotice(){
	var pk_id = $("#pk_id").val();
	var cd = [];
	$('#table input[name="ck"]:checked').each(function() {
		cd.push($(this).val());
	});
		$.ajax({
				type : "get",
				contentType : "application/json",
				url : "setNotic.do?",
				data : "pk_id="+pk_id+"&cd="+cd, //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
				window.location.href = "<%=path%>/teacher/setNotic.do?pk_id="+pk_id+"&cd="+cd;
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
	}
	
	
</script>


</head>
<body>
	<div>
		<input type="hidden" value='${Xmax}' id="Xmax"> <input
			type="hidden" value='${Xmin}' id="Xmin"> <input type="hidden"
			value='${Ymax}' id="Ymax"> <input type="hidden"
			value='${Ymin}' id="Ymin">
		<div id="container">
			<div id="menu" align="right"
				style="width: 100%;background: #09c;margin-bottom: 5px;margin: 0 auto;height: 25px;">
				选择年级:<select id="year" onchange="changeYear()">
					<option value="12222">请选择</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					<option value="2014">2014</option>
					<option value="2015">2015</option>
					<option value="2016">2016</option>
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>

				</select> 选择任务: <select id="pk_id" onchange="change()" style="width: 250px	;">
					<%--  <option value="${pk_id}" selected="selected">${pk_name}</option> 
						<option value="0">请选择</option> --%>
					<c:forEach var="pks" items="${pks}" varStatus="stauts">
						<option value="${pks.id}">${pks.task_name}</option>
					</c:forEach>

				</select>
				<button id="abcd" data-reveal-id="myModal" onclick="getUnSinStus()">本月签到情况</button>
				查询的时间:
				<lable>${nowTime}</lable>

			</div>
			<div id="mainContent">

				<div id="allmap" align="center"></div>
			</div>

		</div>
	</div>
	<div id="myModal" class="reveal-modal" style="width: 590px; "
		align="center">

		<h2>学生签到情况</h2>
		<div style="width:590px " align="left">
			<font size="3px">选择签到时间：</font>
			<input value="${ym}" id="ym" name="ym"  class="Wdate" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM'})">
			<input type="button" value="查看" onclick="getMoth()" style="height: 30px; width:50px "></font> &nbsp;&nbsp;&nbsp;
			<button style="height: 30px; width:50px " onclick="setNotice()">通知</button>
		</div>
		<br>
		<table id="table" class="table" width="580" border="1">
			<tr id="tr" class="tr">
				<td width="50">序号</td>
				<td width="75">姓名</td>
				<td width="80">本月签到次数</td>
				<td width="100">学号</td>
				<td width="115">班级</td>
				<td width="120">联系方式</td>
				<td width="50">全选<input type="checkbox" name="all" id="all" /></td>
				
		</table>
		<a class="close-reveal-modal">&#215;</a> 
	</div>
</body>
</html>



