<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getServerName() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>教师工作总结上传</title>
<script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="<%=path%>/css/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/checkTextArea.js"></script>
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
	function save() {
		/*try {
			var obj_file = document.getElementById("fileuploade");
			if (obj_file.value == "") {
				alert("请先选择上传文件");
				return;
			}
			var filesize = 0;
			if (browserCfg.firefox || browserCfg.chrome || browserCfg.opera
					|| browserCfg.qq) {
				filesize = obj_file.files[0].size; //单位为字节
				filesizemb = filesize / 1024; //转换为kb
			} else if (browserCfg.ie) {
				var obj_img = document.getElementById('tempimg');
				obj_img.dynsrc = obj_file.value;
				filesize = obj_img.fileSize;
			} else {
				alert(tipMsg);
				return;
			}
			if (filesize == -1) {
				alert(tipMsg);
				return;
			} else if (filesize > maxsize) {
				alert(errMsg);
				return;
			}
		} catch (e) {
			alert(e);
		}*/
		var practice_id = $("#practice_id").val();
		var year = $("#year").val();
		var title = $("#title").val();
		var direct_time = $("#direct_time").val();
		var temp2 = $("#temp2").val();
		var direct_place = $("#direct_place").val();
		var worktype=$("#worktype").val();
		var stu_id = $("#stu_id").val();
		var direct_desc = $("#content").val();
		if (year == "0") {
			alert("请选择入学年份！");
			return;
		}
		if (practice_id == "0") {
			alert("请选择实习任务！");
			return;
		}
		if (title == "") {
			alert("请填写标题！");
			return;
		}
		if (direct_time == "") {
			alert("请选择起始时间！");
			return;
		}
		if (temp2 == "") {
			alert("请选择结束时间！");
			return;
		}
		if (direct_place == "") {
			alert("请填写指导地点！");
			return;
		}
		if (worktype == "请选择") {
			alert("请填写工作类型！");
			return;
		}
		if (direct_desc == "") {
			alert("请填写文字描述！");
			return;
		}
		if (stu_id == "") {
			alert("请选择指导学生！");
			return;
		}
		 $("#form").submit();
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
<script type="text/javascript">
	//全选操作

	//2015-03-18 邢志武修改
	function checkAll(flag) {
		CBs = document.getElementsByName("students");
		for ( var i = 0; i < CBs.length; i++)
			CBs[i].checked = flag;
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
		document.getElementById("scope").style.display = "";
	}
	/**
	 获取选中的学生 ，并赋值给输入框
	 wl
	 */
	function setVals() {
		var value = "";
		var name="";
		var id = document.getElementsByName("students");//复选框的name
		for ( var i = 0; i < id.length; i++) {
			if (id[i].checked) {
				value += id[i].value + ",";
				name +=id[i].nextSibling.nodeValue+"、";
			}
		}
		document.getElementById("stu_name").value = name;
		document.getElementById("stu_id").value = value;
		document.getElementById("scope").style.display = "none";//隐藏div
	}
	
	function getTitle(){
		var direct_time = $("#direct_time").val();
		var a=direct_time.indexOf("-");
		var year=direct_time.substring(0,a);
		var month=direct_time.substring(5,7);
		/* var worktype = $("#worktype").find("option:selected").text(); */
		var teaName=$("#teaName").val();
	   	var title = "工作总结" + "-" + year+"年"+month+"月" + "-" + teaName ;
		$("#title").val(title);
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
				$("#select").html(result);
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

	var checkflag = "false";
	function check(fieldName) {
		var field = document.getElementsByName(fieldName);
		if (checkflag == "false") {
			for (i = 0; i < field.length; i++) {
				field[i].checked = true;
			}
			checkflag = "true";
			return "选中";
		} else {
			for (i = 0; i < field.length; i++) {
				field[i].checked = false;
			}
			checkflag = "false";
			return "未选中";
		}
	}
</script>

</head>
<body>
	<h2 align="left">教师工作总结上传</h2>
	<input type="hidden" value="${tea.true_name}" id="teaName" name="teaName" />
	<form name="form1" id="form" method="post" action="doAddTeacherSummary.do"
		enctype="multipart/form-data">
		上传文件：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img id="tempimg" dynsrc="" src="" style="display:none" />
		<input type="file" id="fileuploade" name="file" size="50" title="文件大小不能超过10M" onchange="fileChange(this);"> 
		<input type="hidden" name="id" value="0"><font color=red>因考虑安全，只允许上传zip和rar格式的文件</font>
		<table border="0" width="500">
			<tr>
				<td style="width:100px">入学年份：</td>
				<td width="500"><select name="year" id="year"
					onChange=getPracticeTask() style="width:300px">
						<option value="0">请选择</option>
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
						<option value="2018">2018</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="270">实习任务：</td>
				<td width="500"><select name="practice_id" id="practice_id"
					style="width:300px" >
						<option value="0">请选择</option>
				</select> 
			</tr>
			<tr>
				<td width="100">起始时间：</td>
				<td width="500">
					<div>
						<input value="${qn.startDate}" id="direct_time" name="direct_time" style="width:300px"
							class="Wdate" type="text" onClick="WdatePicker()"  onChange="getTitle();">
					</div>
				</td>
			</tr>
			<tr>
				<td width="100">结束时间：</td>
				<td width="500">
					<div>
						<input value="${qn.temp2}" id="temp2" name="temp2" style="width:300px"
							class="Wdate" type="text" onClick="WdatePicker()">
					</div>
				</td>
			</tr>
			<!-- <tr>
				<td style="width:100px">工作类型：</td>
				<td width="500"><select name="worktype" id="worktype" onChange="getTitle();" style="width:300px">
						<option value="请选择">请选择</option>
						<option value="1">工作总结</option>
						<option value="2">指导记录</option>
				</select>
				</td>
			</tr> -->
			<tr>
				<td width="100">标题：</td>
				<td width="500"><input type="text" name="title" id="title" style="width:300px">
				</td>
			</tr>
			<tr>
				<td width="100">指导地点：</td>
				<td width="500"><input type="text" name="direct_place" style="width:300px"
					id="direct_place">
				</td>
			</tr>
			<tr>
				<td width="100">描述：</td>
					<td width="500">
					<!-- <textarea  style="resize:none" onkeyup="javascript:checkWord(this);" 
					onmousedown="javascript:checkWord(this);" 
  					name="direct_desc" id="direct_desc"  rows="5" cols="30" style="overflow-y: scroll"></textarea>  -->
					
				
				<form>
        <textarea rows="5" cols="40" name="maxcharfield" id="maxcharfield" 
        onKeyDown="textCounter(this,'progressbar1',500)" 
        onKeyUp="textCounter(this,'progressbar1',500)" 
        onPaste="textCounter(this,'progressbar1',500)" 
        onFocus="textCounter(this,'progressbar1',500)" ></textarea>
</form>

     <div id="progressbar1" class="progress">	</div> 	您最多可以输入500个字符
					</td>
			</tr>
			<tr>
				<td width="100">指导学生：</td>
				<td width="500"><textarea  name="stu_ids" id="stu_id" style="display:none;" 
					readonly="true"></textarea>
					<textarea  name="stu_name" id="stu_name" style="resize:none" rows="3" cols="30"
					readonly="true" onfocus="changeCK()"></textarea></td>
			</tr>
		</table>
		<p>
		<div id="scope" style="display:none">
			<table>
				<tr id="select">
					<td>请选择</td>
				</tr>
			</table>
			<button type="button" onclick="setVals()">确定</button>
			<input type=button value="全选" onClick="this.value=check('students')">
		</div>
		<div style="margin-top:20px;">
			<input type="button" value="保存" onclick="save()" />&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="window.location='./teacherSummaryList.do'">返回</button>
		</div>
	</form>
	<script>textCounter(document.getElementById("maxcharfield"),"progressbar1",500)</script>
</body>
</html>





















