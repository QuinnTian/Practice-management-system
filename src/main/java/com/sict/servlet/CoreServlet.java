package com.sict.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sict.service.CoreService;
import com.sict.util.SignUtil;

/**
 * 请求处理的核心类
 * 
 * @author mengfanzhen
 * @date 2014-07-02
 */

public class CoreServlet extends HttpServlet {
	private static final long serialVersionUID = 4440739483644821986L;

	CoreService coreService;

	/**
	 * 请求校验（确认请求来自微信服务器）
	 */

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * System.out.println("调用doGet方法"); // 微信加密签名 String signature =
		 * request.getParameter("signature"); // 时间戳 String timestamp =
		 * request.getParameter("timestamp"); // 随机数 String nonce =
		 * request.getParameter("nonce"); // 随机字符串 String echostr =
		 * request.getParameter("echostr");
		 * 
		 * PrintWriter out = response.getWriter();
		 */

		if (request.getParameter("ceshi").equals("ceshi")) {
			System.out.println("进入测试方法");

		}
		/*
		 * // 请求校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败 if
		 * (SignUtil.checkSignature(signature, timestamp, nonce)) {
		 * out.print(echostr); } out.close(); out = null;
		 */
	}

	/**
	 * 请求校验与处理
	 * @param session 
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("调用doPost方法");
		// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 接收参数微信加密签名、 时间戳、随机数
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");

		PrintWriter out = response.getWriter();
		// 请求校验
		if (SignUtil.checkSignature(signature, timestamp, nonce)) {
			// 调用核心服务类接收处理请求
			String respXml = coreService.processRequest(request);
			out.print(respXml);
		}
		out.close();
		out = null;
	}
}
