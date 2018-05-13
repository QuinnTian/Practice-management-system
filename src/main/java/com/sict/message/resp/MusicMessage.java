package com.sict.message.resp;

/**
 * 音乐消息
 * 
 * @author deruiyu
 * @date 2014-07-28
 */
public class MusicMessage extends BaseMessage {
	// 音乐
	private Music Music;

	public Music getMusic() {
		return Music;
	}

	public void setMusic(Music music) {
		Music = music;
	}
}
