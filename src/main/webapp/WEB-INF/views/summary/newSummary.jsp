<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../titlebar.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>创建月总结</title>
<style type="text/css">
img {
	border: none;
}

ul,ul li {
	list-style-type: none;
	margin: 0;
	padding: 0;
}

ul li.first {
	border-top: 1px solid #DFDFDF;
}

ul li.last {
	border: none;
}

ul p {
	float: left;
	margin: 0;
	width: 310px;
}

ul h3 {
	float: left;
	font-size: 14px;
	font-weight: bold;
	margin: 5px 0 0 0;
	width: 200px;
	margin-left: 20px;
}

.ului {
	border-bottom: 1px solid #DFDFDF;
	padding: 15px 0;
	width: 600px;
	overflow: hidden;
}

ul input[type="text"],ul input[type="password"] {
	width: 300px;
	padding: 5px;
	position: relative;
	border: solid 1px #666;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
}

ul input.required {
	border: solid 1px #f00;
}
</style>
<script src="http://cdn.bootcss.com/jquery/1.3.2/jquery.min.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
        $(document).ready(function() {
            $("#summarySumbit").click(function() {

                resetFields();
                var emptyfields = $("input[value=]");
                if (emptyfields.size() > 0) {
                    emptyfields.each(function() {
                        $(this).stop()
                            .animate({ left: "-10px" }, 100).animate({ left: "10px" }, 100)
                            .animate({ left: "-10px" }, 100).animate({ left: "10px" }, 100)
                            .animate({ left: "0px" }, 100)
                            .addClass("required");
                    });
                }
            });
        });
        function resetFields() {
            $("input[type=text], input[type=password]").removeClass("required");
        }
    </script>
</head>
<body>
	<center>
		<c:if test="${!empty result}">
			<font color="red">${result}</font>
		</c:if>
		<br /> <br />
		<h2>
			<c:if test="${summary.id == null }">创建</c:if>
			<c:if test="${summary.id != null }">更新</c:if>
			月总结
		</h2>
		<form action="<%=path %>/summary/newSummary.do?qn_id=${summary.id}"
			method="post">
			<input type="hidden" id="id" name="id" value="${summary.id}">
			<ul class="ului">
				<li class="first ului">
					<h3>总结标题</h3>
					<p>

						<input type="text" value="${summary.title}" id="title"
							name="title" placeholder="请输入XX月总结" />

					</p></li>
				<li class="ului">
					<h3>总结使用对象</h3>
					<p>
						<select id="user_type" name="user_type" class="form-control">
							<!-- 								<option <c:if test="${summary.user_type == 1}">selected</c:if> -->
							<!-- 									value="1">教师</option> -->
							<option <c:if test="${summary.user_type == 2}">selected</c:if>
								value="2">学生</option>
						</select>
					</p></li>
				<li class="ului">

					<h3>总结使用单位</h3>
					<p>
						<select id="department" name="department" class="form-control">

							<c:forEach var="org" items="${org}">
								<option
									<c:if test="${summary.department == org.id}">selected</c:if>
									value="${org.id}">${org.org_name}</option>
							</c:forEach>

						</select>
					</p></li>
				<li class="ului">

					<h3>学制</h3>
					<p>
						<select id="studyLength" name="studyLength" class="form-control">
							<option <c:if test="${summary.studyLength == 11}">selected</c:if>
								value="11">专科2.5+0.5</option>
							<option <c:if test="${summary.studyLength == 12}">selected</c:if>
								value="12">专科2+1</option>
							<option <c:if test="${summary.studyLength == 13}">selected</c:if>
								value="13">专科五年制</option>
							<option <c:if test="${summary.studyLength == 21}">selected</c:if>
								value="21">本科3+1</option>
							<option <c:if test="${summary.studyLength == 22}">selected</c:if>
								value="22">本科3.5+0.5</option>
							<option <c:if test="${summary.studyLength == 23}">selected</c:if>
								value="23">专本连读</option>
						</select>
					</p></li>
				<li class="ului">
					<h3>年级</h3>
					<p>
						<select id="year" name="year" class="form-control">
							<option <c:if test="${summary.year == 2012}">selected</c:if>
								value="2012">2012</option>
							<option <c:if test="${summary.year == 2013}">selected</c:if>
								value="2013">2013</option>
							<option <c:if test="${summary.year == 2014}">selected</c:if>
								value="2014">2014</option>
							<option <c:if test="${summary.year == 2015}">selected</c:if>
								value="2015">2015</option>
							<option <c:if test="${summary.year == 2016}">selected</c:if>
								value="2016">2016</option>
						</select>
					</p></li>
				<li class="ului">
					<h3>总结类型</h3>
					<p>
						<select id="type" name="type" class="form-control">
							<!-- 								<option onclick="div_data_display(1)" -->
							<!-- 									<c:if test="${summary.type == 1}">selected</c:if> value="1">年总结</option> -->
							<option <c:if test="${summary.type == 2}">selected</c:if>
								value="2">月总结</option>
							<!-- 								<option disabled="disabled" -->
							<!-- 									<c:if test="${summary.type == 3}">selected</c:if> value="3">周总结</option> -->
							<!-- 								<option disabled="disabled" -->
							<!-- 									<c:if test="${summary.type == 4}">selected</c:if> value="4">日总结</option> -->
						</select>
					</p></li>
				<li class="ului">
					<h3>开始时间</h3>
					<p>
						<input id="startDate" value="${summary.startDate}" id="startDate"
							name="startDate" class="Wdate" type="text"
							onClick="WdatePicker({dateFmt:'yyyy-MM'})"> <font
							color=red>&and;- 单击选择日期</font>
					</p></li>
				<li class="ului">
					<h3>结束时间</h3>
					<p>
						<input id="endDate" value="${summary.endDate }" id="endDate"
							name="endDate" class="Wdate" type="text"
							onClick="WdatePicker({dateFmt:'yyyy-MM'})"
							onchange="checkTimeRepeat();"> <font color=red>&and;-
							单击选择日期</font><font color="red"><span id="infor"></span> </font>
					</p></li>
				<li class="last ului"><input style="width: 30%"
					class="btn btn-lg btn-info" onclick="return sumbitCheck()"
					id="summarySumbit" type="submit" value="确定">
				</li>
			</ul>
		</form>
	</center>

	<script type="text/javascript">
	
		function sumbitCheck(){
		
			if($("#title").val() == ""){
				return false
			}
			if($("#startDate").val() == ""){
				return false
			}
			if($("#endDate").val() == ""){
				return false
			}
		
		}
	
		function div_data_display(type) {
		}
		function div_data_display_all_none() {
			document.getElementById("div_month").style.display = 'none';
			document.getElementById("div_year").style.display = 'none';
		}
		//验证创建时间是否有交叉
		//吴敬国 2015-6-16 
		function checkTimeRepeat() {
			var data = {
				startDate : document.getElementById("startDate").value,
				endDate : document.getElementById("endDate").value
			};
	
			$.ajax({
				type : "get",
				url : "<%=path%>/summary/checkTimeRepeat.do",
				data : data,
				dataType : "json", //返回的类型为text                 
				success : function(data) { //成功时执行的方法					
					showInfor(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
		function showInfor(ajaxData) {
			var obj = eval(ajaxData);
			if (obj == "1") {
				/* alert("时间可用"); */
			} else {
				alert("创建时间不能和已有的时间段重叠。");
			}
		}
	</script>
</body>
</html>
