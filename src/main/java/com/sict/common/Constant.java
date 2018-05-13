package com.sict.common;


import javax.servlet.http.HttpServletRequest;

public class Constant {

	public static final String UPLOADPATH_FILE = "upload.properties";

	public static final String UPLOADPATH_PATH = "path";
	
	public static final String getBasePath(HttpServletRequest request){
		
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + request.getContextPath()
				+ "/";
		return basePath;
		
	}
}
