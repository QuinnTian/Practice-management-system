
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.sict.service.DictionaryService" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加小组</title>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<style type="text/css">

.progress{
 width: 1px;
 height: 14px;
 color: white;
 font-size: 12px;
    overflow: hidden;
 background-color: navy;
 padding-left: 5px;
}
</style>
<script type="text/javascript">
	//ajax 传递条件 获取相应的实践任务
	function ajaxShiJian() {
		$.ajax({
			type : "get",
			contentType : "application/json",
			url : "ajaxShiJian.do?",
			data : getShiJianData(), //设置发送参数，即使参数为空，也需要设置                
			dataType : "json", //返回的类型为json                
			success : function(data) { //成功时执行的方法					
				showShiJian(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
					alert(status);
				}
			}
		});

	}
	function getShiJianData() {
		var xi = $("#xueyuan").val();
		var nianji = $("#nianji").val();
		var dataSend = "data=" + xi + "-" + nianji;
		console.log("getShiJianData:" + dataSend);
		return dataSend;
	}

	function showShiJian(ajaxData) {
		var shijian = eval(ajaxData);
		console.log(ajaxData);
		var select = document.getElementById("renwu");
		select.options.length = 1;

		if (shijian.length > 0) {

			for ( var i = 0; i < shijian.length; i++) {
				console.log(shijian[i]);
				select.options.add(new Option(shijian[i].task_name,
						shijian[i].id));
			}
		}

	}
	function setShijianId() {
		var renwu = $("#renwu").val();
		$("#renWuId").val(renwu);
		var rName = $("#renwu").find("option:selected").text();
		$("#group_name").val(rName);
		$("#purpose").val(rName);
		$("#group_name").focus();
	}
</script>
<script type="text/javascript">
function back(){
history.back(); 
}

</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#tooltips").show();
	});
	function changeCK() {

	}
</script>
<!-- 字数限制 -->
<script>
	var maxstrlen = 70;
	function Q(s) {
		return document.getElementById(s);
	}

	function checkWord(c) {
		len = maxstrlen;
		var str = c.value;
		myLen = getStrleng(str);
		var wck = Q("wordCheck");

		if (myLen > len * 2) {
			c.value = str.substring(0, i + 1);
		} else {
			wck.innerHTML = Math.floor((len * 2 - myLen) / 2);
		}
	}

	function getStrleng(str) {
		myLen = 0;
		i = 0;
		for (; (i < str.length) && (myLen <= maxstrlen * 2); i++) {
			if (str.charCodeAt(i) > 0 && str.charCodeAt(i) < 128)
				myLen++;
			else
				myLen += 2;
		}
		return myLen;
	}
</script>
<script type="text/javascript">
	//判断分组名可不可用
	function checkGroupName() {
			
			$.ajax({
			type : "get",
			contentType : "application/json",
			url : "checkGroupName.do",
			data :getGroupName(), //设置发送参数，即使参数为空，也需要设置      
			dataType : "text", //返回的类型为json   
			success : function(data) { //成功时执行的方法					
				showHint(data);
			},
			error : function(result, status) { //出错时会执行这里的回调函数                     
				if (status == 'error') {
									}
			}
		});
	}
	function getGroupName() {
		var group_name=$('#group_name').val();
		return "group_name="+group_name;
	}
	function showHint(ajaxData) {
		console.log(ajaxData);
		document.getElementById("span").innerHTML=ajaxData;
	}
	
</script>
<script type="text/javascript">
/*验证 2015年5月6日 21:42:34*/
function doAdd() {
		var nianji = document.getElementById("nianji");
		var xueyuan = document.getElementById("xueyuan");
		var renwu = document.getElementById("renwu");
		var group_name = document.getElementById("group_name");
		var purpose = document.getElementById("purpose");
		var description = document.getElementById("description");
		if (nianji.value == "0") {
			alert("请选择年级！");
			return null;
		}
		if (xueyuan.value == "0") {
			alert("请选择院系");
			return null;
		}if (renwu.value == "0") {
			alert("请选择实践任务！");
			return null;
		}
		if (group_name.value == "") {
			alert("请填写小组名称！");
			return null;
		}if (purpose.value == "") {
			alert("请填写小组目的！");
			return null;
		}
		if (description.value == "") {
			alert("请选择上传的文件");
			return null;
		}
		
			document.forms[0].submit();
	}
	function textCounter(field,counter,maxlimit,linecounter) {
 // text width//
 var fieldWidth =  parseInt(field.offsetWidth);
 var charcnt = field.value.length;
 // trim the extra text
 if (charcnt > maxlimit) {
  field.value = field.value.substring(0, maxlimit);
 }
 else {
 // progress bar percentage
 var percentage = parseInt(100 - (( maxlimit - charcnt) * 100)/maxlimit) ;
 document.getElementById(counter).style.width =  parseInt((fieldWidth*percentage)/100)+"px";
 document.getElementById(counter).innerHTML="已输: "+percentage+"%"
 // color correction on style from CCFFF -> CC0000
 setcolor(document.getElementById(counter),percentage,"background-color");
 }
}
function setcolor(obj,percentage,prop){
 obj.style[prop] = "rgb(80%,"+(100-percentage)+"%,"+(100-percentage)+"%)";
}
</script>
</head>



<body>
	<form name="Form2" action="doAddGroups.do" method="post">
		<h1>添加分组${node.key}</h1>
		<table border="0" width="900">
		
			<tr>
				<td width="100">任务选择：</td>
				<td width="800">年级:<select name="nianji" id="nianji"
					onchange="ajaxShiJian()">
						<option value="0">请选择</option>

						<c:forEach var="g" items="${Grade }" varStatus="stauts">
							<option value="${g.grade}">${g.grade}</option>
						</c:forEach>


				</select>&nbsp;&nbsp;院系: <select name="xueyuan" id="xueyuan"
					onchange="ajaxShiJian()">
						<option value="0" selected="selected">请选择</option>
						<c:forEach var="o" items="${Org_Name }" varStatus="stauts">
							<option value="${o.id}">${o.org_name}</option>
						</c:forEach>

				</select> &nbsp;&nbsp;实践任务:<select name="renwu" id="renwu"
					onchange="setShijianId()">
						<option value="0" selected="selected">请选择</option>
				</select></td>
			</tr>

			<tr>

				<td width="100">小组名称：</td>
				<td width="900"><input type="text" name="group_name"
					style="width:500px;" id="group_name" onblur="checkGroupName()"><span id="span" ></span><br> <font color="red"
					size="2"><-推荐小组命名格式：**级-**(老师)-**(所带班级)</font></td>
			</tr>
			<tr>
				<td width="100">小组目的：</td>
				<td width="800"><input type="text" name="purpose" id="purpose"
					style="width:500px;"></td>
			</tr>
			<tr>
				<td width="100">小组描述：</td>
				<!-- <td width="800"><textarea name="description" id="description"
						style="width:500px;">无</textarea></td> -->
				<td width="800">
				 <div>您最多可以输入70个字符	</div>
        <textarea rows="5" cols="40" name="description" id="description" 
        onKeyDown="textCounter(this,'progressbar1',70)" 
        onKeyUp="textCounter(this,'progressbar1',70)" 
        onPaste="textCounter(this,'progressbar1',70)" 
        onFocus="textCounter(this,'progressbar1',70)" ></textarea>

     <div id="progressbar1" class="progress"></div> 
					
				</td>
			</tr>

		</table>
		<input type="hidden" id="renWuId" name="renWuId" value="">
		<div id="div7">
			<!-- 测试按钮不提交，判断小组成员是否正确 -->
			<input type="button" value="保存" onclick="doAdd()"/>&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="back()">返回</button>

		</div>
	</form>
	<script>textCounter(document.getElementById("description"),"progressbar1",70)</script>
</body>
</html>