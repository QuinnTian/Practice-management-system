package com.sict.message.req;

/**
 * 文本消息
 * 
 * @author deruiyu
 * @date 2014-07-28
 */
public class TextMessage extends BaseMessage {
	// 消息内容
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}
