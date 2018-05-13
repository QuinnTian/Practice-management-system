<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<title>发布通知</title>
<style type="text/css">
h2 {
	width: 100%;
	height: 20px;
	text-align: left;
}
</style>
<script type="text/javascript">
	//全选操作
	function checkAll(flag){
		CBs=document.getElementsByName("students");
		for(var i=0;i<CBs.length;i++)
	    CBs[i].checked=flag;
	}
	/**
	 查出该老师的所选实习任务对应的学生 
	 wl
	 */
	function changeCK() {
		var selectedValue = document.getElementById("practice_id");
		var selectedIndex = selectedValue.selectedIndex;
		var ajaxUrl = "studentListByPraCodeTeaCode.do?practice_id="
				+ selectedValue.options[selectedIndex].value;
		ajaxFunction(ajaxUrl);
	}
	/**
	 获取选中的学生 ，并赋值给输入框
	 wl
	 */
	function setVals() {
		var value = "";
		var name = "";
		var id = document.getElementsByName("students");//复选框的name
		for ( var i = 0; i < id.length; i++) {
			if (id[i].checked) {
				value += id[i].value + ",";
				name += id[i].nextSibling.nodeValue + ",";
			}
		}
		document.getElementById("notice_range").value = value;
		document.getElementById("temp1").value = name;
		document.getElementById("scope").style.display = "none";//隐藏div
		$("#editStudents").attr('type','button');//增加修改按钮
	}

	function ajaxFunction(url) {
		//考虑到不同浏览器的兼容性，所以做出判断。

		var xmlHttp;
		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveObject) {
			try {

				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");

			} catch (e) {

				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");

				} catch (e) {
				}
			}
		}
		//监控和接受后台传的字符串
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				var result = xmlHttp.responseText;
				if(result.length==20){
					alert("此任务没有对应的学生");
					document.getElementById("scope").style.display = "none";//隐藏div
					return null;
				}else{
					document.getElementById("scope").style.display = "";
					$("#select").html(result);
				}
				
			}
		};

		xmlHttp.open("GET", url, false);

		xmlHttp.send(null);
	}
	function getPracticeTask() {// 向服务器发送搜索请求
			$.ajax({
				type : "get",
				/* contentType : "application/json", */
				url : "getPracticeTask.do?",
				data : getSendData(), //设置发送参数，即使参数为空，也需要设置                
				dataType : "text", //返回的类型为json                
				success : function(data) { //成功时执行的方法					
					showPractice(data);
				},
				error : function(result, status) { //出错时会执行这里的回调函数                     
					if (status == 'error') {
						alert(status);
					}
				}
			});
		}
		function getSendData() {
			var grade = $("#year").val();	
			var dataSend = "grade=" + grade;			
			return dataSend;
		}
		function showPractice(ajaxData) {//根据返回数据显示搜索结果
		$("#practice_id").html(ajaxData);
	    };
	    /*修改插入的学生  */
	    function editStudent(){
	    	document.getElementById("scope").style.display = "";
	    	document.getElementById("notice_range").value = "";
	    	document.getElementById("temp1").value = "";
	    	$("#editStudents").attr('type','hidden');//隐藏修改学生按钮
		 }
		 function doAdd(){
		 	var content=$("#content").val();
		 	if(content.length>70){
		 		alert("内容不能超过70个字");
		 		return null;
		 	}else if(content==""){
		 		alert("内容不能为空");
		 		return null;
		 	}else if($("#title").val()==""){
		 		alert("标题不能为空");
		 		return null;
		 	}else if($("#notice_range").val()==""){
		 		alert("通知范围不能为空");
		 		return null;
		 	}else{
		 		document.form1.submit();
		 	
		 	}
		 	
		 
		 }
</script>
<!-- 字数限制 -->
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
	<h2>发布通知</h2>
	<br>
	<form name="form1" id="form1" method="post" action="doAddNotice.do">
		<table border="0" width="500" height="238">
			<tr>
				<td width="270">实习任务：</td>
				<td width="700">
				<input type="hidden" name="practice_id" id="practice_id" style="width:290px" value="${pk}">
				<c:set var="pk" value="${pk}" scope="request">
				</c:set> 
				<%
				String pk_id = (String) request.getAttribute("pk");
 				%> 
				
				<input type="text" name="practice_name" id="practice_name" 
				style="width:290px" value="<%=DictionaryService.findPracticeTask(pk_id).getTask_name()%>">
				</td>
			</tr>
			<tr>
				<td width="100">标题：</td>
				<td style="width:100px"><input type="text" id="title"
					name="title" size="43" value="" /></td>
			</tr>
			<tr>
				<td width="100">内容：</td>
				<td width="300">
					<div class="wordCount" id="wordCount">
						<textarea name="content" rows="5" cols="35" style="resize:none"
							id="content"></textarea>
						<span class="wordwrap"><var class="word">70</var>/70</span>
					</div></td>

			</tr>
			<tr>
				<td width="120">通知范围：</td>
				<td width="300"><input id="notice_range" type="hidden"
					name="notice_range"  value="${cd }"/> 
				<textarea rows="7" cols="35" id="temp1" name="temp1" disabled="disabled"  >
				<c:set var="stus" value="${cd }" scope="request"></c:set> 
			<%
				String stusId = (String) request.getAttribute("stus");
				String stusIdArray[] = stusId.split(",");  
				for(int i=0;i<stusIdArray.length;i++){
				String stu_id=stusIdArray[i];
				out.print(DictionaryService.findStudent(stu_id).getTrue_name()+" ");
				}
 			%> 
			</textarea> 
				</td>
			</tr>
		</table>
		<p>
		<div id="scope" style="display:none">
			<br>学生列表：
			<table border="1">
				<tr id="select">
				</tr>
			</table>
			全选：<input type="checkbox" value="全选" onClick="checkAll(this.checked)">&nbsp;&nbsp;
			<button type="button" onclick="setVals()">确定</button>
		</div>
		<div style="margin-top:20px;">
			<input type="button" value="发布通知" onclick="doAdd()" />&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</form>
</body>
</html>

