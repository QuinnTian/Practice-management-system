<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="errorPage.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<title>学生问题回复</title>	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
/*验证 2015年6月9日 11:50:24*/
  function  sub() {
          
		var answer = document.getElementById("maxcharfield");
		if (answer.value == "") {
			alert("问题答案不允许为空！");
		}else {
			document.form.submit();
		}		
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

textCounter(document.getElementById("answer"),"progressbar1",400)


</script>
  </head>
  
  <body>
  <h2>学生问题回复</h2>
  <form  name="form"  id="form" method="post" action="teacher/doSavaShortQuestion.do">
  <table border="1" width="1300" id="table" >
		<tr>
		<td>问题</td>
		<td>
		<input type="hidden" id="question_id" name="question_id" value="${knowledge.id}">
		${knowledge.question}</td>
		</tr>
		<tr>
		<td>答案</td>
		<td>
		<div> 最多输入400字 <div id="progressbar1" class="progress">	</div> </div>
		<!-- <textarea id="answer" name="answer" style="width:900px; height: 100;  border: 0;"></textarea> -->
		
		<textarea rows="5" cols="40" name="maxcharfield" id="maxcharfield" 
        onKeyDown="textCounter(this,'progressbar1',400)" 
        onKeyUp="textCounter(this,'progressbar1',400)" 
        onPaste="textCounter(this,'progressbar1',400)" 
        onFocus="textCounter(this,'progressbar1',400)" >${knowledge.answer}</textarea>
		
		</td>
		</tr>
		
	</table>
	 <input type="button" value="确认回复"  onclick="sub()"/>
	 </form>
	 
  </body>
 
</html>
