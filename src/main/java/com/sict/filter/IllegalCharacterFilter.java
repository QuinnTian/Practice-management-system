package com.sict.filter;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.filefilter.IOFileFilter;

public class IllegalCharacterFilter implements Filter{
	private static final long serialVersionUID = -5916500037685553487L; 
	public void destroy() { 
	   // TODO Auto-generated method stub 
	} 

	@SuppressWarnings("unchecked") 
	public void doFilter(ServletRequest request, ServletResponse response, 
	    FilterChain arg2) throws IOException, ServletException { 
	   HttpServletRequest servletrequest = (HttpServletRequest) request; 
	   //新加代码http://www.2cto.com/kf/201512/455191.html
	   HttpServletResponse servletresponse = (HttpServletResponse) response; 
	   String param = ""; 
	   String paramValue = ""; 

	   servletresponse.setContentType("text/html"); 
	   servletresponse.setCharacterEncoding("UTF-8"); 
	   servletrequest.setCharacterEncoding("UTF-8"); 
	   java.util.Enumeration params = request.getParameterNames(); 
	   while (params.hasMoreElements()) { 

	    param = (String) params.nextElement(); 
	    String[] values = servletrequest.getParameterValues(param);//获得每个参数的value 
	   
	    for (int i = 0; i < values.length; i++) { 

	     paramValue = values[i]; 
	    
	     
	     paramValue = paramValue.replaceAll("<script>", "(*"); 
	     paramValue = paramValue.replaceAll("</script>", ")"); 
	     paramValue = paramValue.replaceAll("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]", ""); //过滤emoji表情
	    
	     
	    //这里还可以增加，如领导人 自动转义成****,可以从数据库中读取非法关键字。 
	     values[i] = paramValue; 
	    } 

	//把转义后的参数重新放回request中 
	    request.setAttribute(param, paramValue); 
	   } 
	   //继续向下 

	   arg2.doFilter(request, response); 

	} 

	public void init(FilterConfig arg0) throws ServletException { 
	   // 初始化 

	} 


	//过滤emoji表情
	public static String filterEmoji(String source) {  
        if(source != null)
        {
            Pattern emoji = Pattern.compile ("[\ud83c\udc00-\ud83c\udfff]|[\ud83d\udc00-\ud83d\udfff]|[\u2600-\u27ff]",Pattern.UNICODE_CASE | Pattern . CASE_INSENSITIVE ) ;
            Matcher emojiMatcher = emoji.matcher(source);
            if ( emojiMatcher.find()) 
            {
                source = emojiMatcher.replaceAll("");
                return source ; 
            }
        return source;
       }
       return source;  
    }
	
}
