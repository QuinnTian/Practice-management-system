<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="../../titlebar.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">

<title>用户总结</title>
<style type="text/css">
.fullpage {
	margin: 0 auto;
	max-width: 100%;
}

.wordCount {
	position: relative; /* width: 495px;height: 145px */
}

.wordCount textarea {
	width: 100%;
	height: 100px;
}

.wordCount .wordwrap {
	position: absolute;
	right: 6px;
	bottom: 6px;
}

.wordCount .word {
	color: red;
	padding: 0 4px;;
}
</style>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script
	src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<script>
    $(function(){
        //先选出 textarea 和 统计字数 dom 节点
        var wordCount = $("#wordCount"),
            textArea = wordCount.find("textarea"),
            word = wordCount.find(".word");
        //调用
        statInputNum(textArea,word);
		
    });
    /*
    * 剩余字数统计
    * 注意 最大字数只需要在放数字的节点哪里直接写好即可 如：<var class="word">200</var>
    */
    function statInputNum(textArea,numItem) {
        var max = numItem.text(),
            curLength;
        textArea[0].setAttribute("maxlength", max);
        curLength = textArea.val().length;
        numItem.text(max - curLength);
        textArea.on('input propertychange', function () {
            numItem.text(max - $(this).val().length);
        });
    }
</script>

</head>
<body>
	<div class="container fullpage">
		<c:if test="${!empty result}">
			<font size="5" color="red">${result}</font>
		</c:if>
		<!-- 吴敬国 start 2015-6-24 -->
		<br /> <a class="btn btn-info btn-lg"
			href="javascript:history.go(-1);">返回</a>
		<h1 align="center">山东商业职业技术学院电子信息学院</h1>
		<h2 align="center">${year}年${month}月实习总结</h2>

		<div class="row">
			<div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="width: 20%;background-color:#888888;">姓名</th>
							<th style="width: 20%;background-color:#888888;">手机</th>
							<th style="width: 20%;background-color:#888888;">邮箱</th>
							<th style="width: 20%;background-color:#888888;">实习单位</th>
							<th style="width: 20%;background-color:#888888;">单位电话</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${student.true_name}</td>
							<td>${student.phone}</td>
							<td>${student.email}</td>
							<td>${com_name}</td>
							<td>${com_phone}</td>
						</tr>
					</tbody>
					<thead>
						<tr>
							<th style="width: 20%;background-color:#888888;">班级</th>
							<th style="width: 20%;background-color:#888888;">性别</th>
							<th style="width: 20%;background-color:#888888;">具体岗位</th>
							<th style="width: 20%;background-color:#888888;">单位指导老师姓名</th>
							<th style="width: 20%;background-color:#888888;">单位中指导老师的联系电话</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${class_name}</td>
							<td>${student.sex}</td>
							<td>${post}</td>
							<td>${com_teacher_name}</td>
							<td>${com_teacher_phone}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 吴敬国 end 2015-6-24 -->
		<div class="row">
			<div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>序号</th>
							<th style="width: 25%">总结问题</th>
							<th style="width: 70%">总结答案</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list}" varStatus="stauts">
							<tr>
								<td>${stauts.index+1}</td>
								<td>${list.title}</td>

								<td>${list.answertext}<c:if test="${list.type ==3}">
										<c:if test="${list.wordCount !=0}">
											<font color="#FF0000">共 ${list.wordCount}字</font>
										</c:if>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- <p><b>说明：</b>1、表中信息请务必填写完整。<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2、实习总结不少于500字，内容可以包括在实习岗位上取得的成绩、体会、存在问题、以及今后努力的方向。</p> -->
				<div class="wordCount" id="wordCount">
					<font>请输入评价：</font>
					<textarea name="content" id="content" rows="3"
						style="width:100%;height:100%;">${summaryQnAnswer.temp1}</textarea>
					<span class="wordwrap"><var class="word">500</var>/500</span>
				</div>
				<div>
					<a class="btn btn-info btn-lg" href="javascript:history.go(-1);">返回</a>
					<div class="pull-right">
						<input type="number" name="score" id="score"
							value="${summaryQnAnswer.score }" /> 分 <a
							class="btn btn-lg btn-info" onclick="save();">保存</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
		function dafen() {
			var fen = $("#score").val();
			if (parseInt(fen) > 100) {
				alert("得分不能大于100分，请重新输入");
				$("#score").val(100);
				return false;
			} 
			if (parseInt(fen) < 0) {
				alert("得分不能小于0分");
				$("#score").val(0);
				return false;
			}  
			else{
			return true;
			}
		}
		function save() {
			var data = {
				summaryQnAnswerID : "${summaryQnAnswer.id}",
				score : $("#score").val(),
				content : $("#content").val() 
			};
			if(score!=null){
				var state=dafen();
				if(state==true){
				$.ajax({
				type : "post",
				/* contentType : "application/json", */
				url : "<%=path%>/summary/queryUserSummary/summaryGrade.do",
								data : data, //设置发送参数，即使参数为空，也需要设置                
								dataType : "text", //返回的类型为json                
								success : function(data) { //成功时执行的方法					
									if (data == 0) {
										alert("保存失败");
									} else {
										alert("保存成功");
										history.go(-1);
										window.location.href = document.referrer;//返回上一页并刷新 
									}
								},
								error : function(result, status) { //出错时会执行这里的回调函数                     
									if (status == 'error') {
										alert(status);
									}
								}
							});
				}
			}
		}
	</script>

</body>
</html>
