<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改毕业论文</title>
     <style type="text/css">
    h2 {
	   width: 100%;
	   height: 20px;
	   text-align: left;
        }
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
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
    <script type="text/javascript" src="/springmvc_mybatis/js/checkWordLength.js"></script>
    <script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<script type="text/javascript">
	function doEdit() {
			try{  
                    var obj_file = document.getElementById("fileuploade");  
                    /* if(obj_file.value==""){  
                        alert("请先选择上传文件");  
                        return;  
                    } */  
                    var filesize = 0; 
                    if(obj_file.value!=""){
	                    if(browserCfg.firefox || browserCfg.chrome||browserCfg.opera|| browserCfg.qq){  
	                        filesize = obj_file.files[0].size;  
	                    }else if(browserCfg.ie){  
	                        var obj_img = document.getElementById('tempimg');  
	                        obj_img.dynsrc=obj_file.value;  
	                        filesize = obj_img.fileSize;  
	                    }else{  
	                        alert(tipMsg);  
	                    return;  
	                    } 
                    } 
                    if(filesize==-1){  
                        alert(tipMsg);  
                        return;  
                    }else if(filesize>maxsize){  
                        alert(errMsg);  
                        return;  
                    }  
                }catch(e){  
                    alert(e);  
                }  
			var thesis_name  = document.getElementById("thesis_name");
			var thesis_desc  = document.getElementById("content");
			var comment  = document.getElementById("comment");
			if (comment.value!="暂无"){
				alert("教师已评论，不可修改，请上传新版本");
				return ;
			}
			if (thesis_name.value==""){
				alert("请输入标题");
				thesis_name.focus();
				return ;
			}
			if (thesis_desc.value==""){
				alert("请输入描述");
				thesis_desc.focus();
				return ;
			}else if(thesis_desc.length>70){
				alert("内容不能超过70个字");
			 	return null;
			}
			document.forms[0].submit();
	}
         	
	//下载
	function downloadFile(id) {
			window.location.href = "downloadFile.do?file_id=" + id;
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
    <form name="Form2" action="doEditGraduationThesis.do" method="post"
		enctype="multipart/form-data">
   <input type="hidden"  name="id" value="${gthesis.id}">
   <h2>修改毕业论文</h2>
   <img id="tempimg" dynsrc="" src="" style="display:none" /> 
   <input type="file" name="file" id="fileuploade" value="${gthesis.file_id}" title="文件大小不能超过10M" onchange="fileChange(this);">
  <!--  <input type="button" name="check" value="检查文件大小" onclick="checkfile()" /> -->
  <input type="hidden" id="comment" name="comment" value="${gthesis.comment}">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
   <input type="button" onclick="downloadFile('${gthesis.file_id}');" value="下载论文" id="download" />  
	    <table border="0" width="1000">
			<%-- <tr>
				<td width="100">版本号：</td>
				<td width="300">${gthesis.version}</td>
			</tr>
			<tr>
				<td width="100">提交时间：</td>
				<td width="300"><fmt:parseDate value="${gthesis.create_time}" var="create_time"/><fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd"/>
				</td>
			</tr> --%>
			<%-- <tr>
				<td width="100">评论：</td>
				<td width="300">${gthesis.comment}<input type="hidden" id="comment" name="comment"
					value="${gthesis.comment}"></td>
			</tr> --%>
			<tr>
				<td width="100">论文标题：</td>
				<td width="300"><input type="text" name="thesis_name" id="thesis_name"
					value="${gthesis.thesis_name}">
				</td>
			</tr>
			<tr>
				<td width="100">论文描述：</td>
				<td width="300">
					 <div>您最多可以输入70个字符	</div>
				<form>
        <textarea rows="5" cols="40" name="maxcharfield" id="maxcharfield" 
        onKeyDown="textCounter(this,'progressbar1',70)" 
        onKeyUp="textCounter(this,'progressbar1',70)" 
        onPaste="textCounter(this,'progressbar1',70)" 
        onFocus="textCounter(this,'progressbar1',70)" ></textarea>
</form>

     <div id="progressbar1" class="progress"></div> 
				</td>
			</tr>
		</table>  
	    <div style="margin-top:20px;">
	      <input type="button"onclick ="doEdit()" value="保存"/>&nbsp;&nbsp;&nbsp;&nbsp;
	      <button type="button" onclick="window.location='./graduationThesisList.do'">返回</button>
	    </div>
	</form>
	<script>textCounter(document.getElementById("maxcharfield"),"progressbar1",70)</script>
  </body>
</html>
