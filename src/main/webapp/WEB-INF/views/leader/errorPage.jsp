<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isErrorPage="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>系统错误界面</title>
    <style type="text/css">
       .style2
        {
            width: 79px;
        }
    </style>
</head>
  <body  bgcolor="#121212">
    <div align="center">
        <table style="height:85px; width:657px;">
            <tr>
                <td>
                	<img src="${pageContext.request.contextPath}/images/error02.jpg"></img>
                </td>
             </tr>
            <tr>
                <td class="style2" align="center"><font color="red" size="4" face=""><input type="button" value="返回主界面" onclick="window.location='./index.do'"/></font></td>
            </tr>
       </table>
    </div>
  </body>
</html>
