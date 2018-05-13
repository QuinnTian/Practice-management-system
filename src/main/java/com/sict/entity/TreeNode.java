package com.sict.entity;

import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * TreeNode entity. @author MyEclipse Persistence Tools
 */

public class TreeNode {
	private String title;    //显示的文本
	private String key;      //文本所对应的编号-例如员工表，key对应着员工编号
	private boolean lazy;    //延迟处理
	private boolean folder;  //文件夹
	
	@JsonIgnore
	private int childNum;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public boolean isLazy() {
		return lazy;
	}
	public void setLazy(boolean lazy) {
		this.lazy = lazy;
	}
	public int getChildNum() {
		return childNum;
	}
	public void setChildNum(int childNum) {
		this.childNum = childNum;
	}
	public boolean isFolder() {
		return folder;
	}
	public void setFolder(boolean folder) {
		this.folder = folder;
	}
}
