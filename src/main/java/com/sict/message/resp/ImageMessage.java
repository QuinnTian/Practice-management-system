package com.sict.message.resp;

/**
 * 图片消息
 * 
 * @author deruiyu
 * @date 2014-07-28
 */
public class ImageMessage extends BaseMessage {
	// 图片
	private Image Image;

	public Image getImage() {
		return Image;
	}

	public void setImage(Image image) {
		Image = image;
	}
}
