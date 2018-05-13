package com.sict.message.resp;

/**
 * 消息基类（公众帐号 -> 普通用户）
 * 
 * @author deruiyu
 * @date 2014-07-28
 */
public class BaseMessage {
	// 接收方帐号（收到的OpenID）
	private String ToUserName;
	// 开发者微信号
	private String FromUserName;
	// 消息创建时间 （整型）
	private long CreateTime;
	// 消息类型
	private String MsgType;
private String Latitude;
private String Longitude;
private String Precision;
	public String getLatitude() {
	return Latitude;
}

public void setLatitude(String latitude) {
	Latitude = latitude;
}

public String getLongitude() {
	return Longitude;
}

public void setLongitude(String longitude) {
	Longitude = longitude;
}

public String getPrecision() {
	return Precision;
}

public void setPrecision(String precision) {
	Precision = precision;
}

	public String getToUserName() {
		return ToUserName;
	}

	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}

	public String getFromUserName() {
		return FromUserName;
	}

	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}

	public long getCreateTime() {
		return CreateTime;
	}

	public void setCreateTime(long createTime) {
		CreateTime = createTime;
	}

	public String getMsgType() {
		return MsgType;
	}

	public void setMsgType(String msgType) {
		MsgType = msgType;
	}
}
