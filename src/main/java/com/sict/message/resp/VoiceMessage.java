package com.sict.message.resp;

/**
 * 语音消息
 * 
 * @author deruiyu
 * @date 2014-07-28
 */
public class VoiceMessage extends BaseMessage {
	// 语音
	private Voice Voice;

	public Voice getVoice() {
		return Voice;
	}

	public void setVoice(Voice voice) {
		Voice = voice;
	}
}