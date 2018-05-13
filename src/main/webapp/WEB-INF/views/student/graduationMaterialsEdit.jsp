<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorPage.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改就业材料</title>
     <style type="text/css">
    h2 {
	   width: 100%;
	   height: 20px;
	   text-align: left;
        }
    </style>
<!--     <script src="http://cdn.bootcss.com/jquery/1.7.2/jquery.min.js"></script> -->
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.min.js"></script>
<script type="text/javascript" src="/springmvc_mybatis/js/fileUploadCheck.js"></script>
<script type="text/javascript">
		  
		function doEdit() {
				try{  
                    var obj_file = document.getElementById("fileuploade");  
                    /* if(obj_file.value==""){  
                        alert("请先选择上传文件");  
                        return;  
                    }  */ 
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
                    }/* else{  
                        alert("您的文件大小为："+filesize+"字节,小于10MB,"+"大小符合要求.");  
                        return;  
                    } */  
                }catch(e){  
                    alert(e);  
                }  
			var materials_name  = document.getElementById("materials_name");
			/* var materials_note  = document.getElementById("materials_note"); */
			if (materials_name.value==""){
				alert("就业材料名称不能为空");
				return ;
			}
			/* if (materials_note.value==""){
				alert("请输入备注信息");
				thesis_name.focus();
				return ;
			} */
			document.forms[0].submit();
	} 
           
     //下载
	function downloadFile(id) {
			window.location.href = "downloadFile.do?file_id=" + id;
	}  	
	
</script>
 </head> 
 <body>
   <h2>修改就业材料</h2>
   <form name="Form2" action="doEditGraduationMaterials.do" method="post"enctype="multipart/form-data">
   <input type="hidden"  name="materialsId" value="${graduationMaterials.id}">
   <img id="tempimg" dynsrc="" src="" style="display:none" /> 
   <input type="file" name="file" id="fileuploade" value="${graduationMaterials.file_id}" title="文件大小不能超过10M" onchange="fileChange(this);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
   <!-- <input type="button" name="check" value="检查文件大小" onclick="checkfile()" /> -->
   <input type="button" onclick="downloadFile('${graduationMaterials.file_id}');" value="下载就业材料" id="download" /> 
	    <table border="0" width="1000">
			<tr>
				<td width="100">材料类型：</td>
				<td width="300">
				<c:set var="materials_type" value="${materials_type}" scope="request"></c:set>
			    <% String materials_type=(String)request.getAttribute("materials_type"); %>
				<select name="materials_type" id="materials_type" style="font-family: sans-serif">
						<option value="身份证扫描件"  <%="身份证扫描件".equals(materials_type)?"selected":"" %>>身份证扫描件</option>
						<option value="合同扫描件" <%="合同扫描件".equals(materials_type)?"selected":"" %>>合同扫描件</option>
						<option value="获奖扫描件" <%="获奖扫描件".equals(materials_type)?"selected":"" %>>获奖扫描件</option>
				</select>
				</td>
			</tr>
			<tr>
				<td width="100">材料名称：</td>
				<td width="300"><input type="text" name="materials_name" id="materials_name"
					value="${graduationMaterials.materials_name}">
				</td>
			</tr>
			<%-- <tr>
				<td width="100">提交时间：</td>
				<td width="300">
				<fmt:parseDate value="${graduationMaterials.create_time}" var="create_time"/>
				<fmt:formatDate value="${create_time}" pattern="yyyy/MM/dd"/>
				</td>
			</tr> --%>
			<%-- <tr>
				<td width="100">材料备注：</td>
				<td width="300"><textarea name="materials_note" id="materials_note"
					rows="4" cols="70" >${graduationMaterials.note}</textarea>
				</td>
			</tr> --%>
		</table>  
	    <div style="margin-top:20px;">
	      <input type="button" onclick="doEdit()" value="保存"/>&nbsp;&nbsp;
	      <button type="button" onclick="window.location='./graduationMaterialsList.do'">返回</button>
	    </div>
	</form>
  </body>
</html>
