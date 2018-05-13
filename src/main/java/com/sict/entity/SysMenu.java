package com.sict.entity;

import java.util.List;

/**
 * SysMenu entity.
 * 
 * @author 吴敬国
 */

public class SysMenu implements java.io.Serializable {

	// Fields

	private String id;
	private String sm_name;// 菜单名称
	private String sm_code;//
	private String sm_title;//
	private String sm_parent;// id
	private String sm_page_phone;
	private String sm_page;
	private String sm_description;
	private String sm_used;
	private String sm_icon_name;// 图标样式
	private String sm_shortcut_key;// 快速导航键
	private String sm_is_top;// 菜单级别
	private String sm_cotain_page;
	private String temp1;// 菜单所属类型
	private String temp2;
	private String temp3;
	private String temp4;
	private String temp5;
	// 逻辑字段开始
	private String sm_parent_name;// 逻辑字段
	private String sm_istop_name;// 菜单级别名称
	private String sm_sort_name;// 菜单级别名
	private String isused;//菜单有效
	private List<SysMenu> sysMenuList;// 子菜单列表
	private int childSysMenuNum;// 子菜单列表个数
	private boolean isleaf;// 是否为叶子节点
	private boolean ischecked;// 菜单是否选中

	// 逻辑字段结束
	public boolean isIschecked() {
		return ischecked;
	}

	public void setIschecked(boolean ischecked) {
		this.ischecked = ischecked;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSm_name() {
		return sm_name;
	}

	public void setSm_name(String sm_name) {
		this.sm_name = sm_name;
	}

	public String getSm_code() {
		return sm_code;
	}

	public void setSm_code(String sm_code) {
		this.sm_code = sm_code;
	}

	public String getSm_title() {
		return sm_title;
	}

	public void setSm_title(String sm_title) {
		this.sm_title = sm_title;
	}

	public String getSm_parent() {
		return sm_parent;
	}

	public void setSm_parent(String sm_parent) {
		this.sm_parent = sm_parent;
	}

	public String getSm_page() {
		return sm_page;
	}

	public void setSm_page(String sm_page) {
		this.sm_page = sm_page;
	}

	public String getSm_description() {
		return sm_description;
	}

	public void setSm_description(String sm_description) {
		this.sm_description = sm_description;
	}

	public String getSm_used() {
		return sm_used;
	}

	public void setSm_used(String sm_used) {
		this.sm_used = sm_used;
	}

	public String getSm_is_top() {
		return sm_is_top;
	}

	public void setSm_is_top(String sm_is_top) {
		this.sm_is_top = sm_is_top;
	}

	public String getSm_cotain_page() {
		return sm_cotain_page;
	}

	public void setSm_cotain_page(String sm_cotain_page) {
		this.sm_cotain_page = sm_cotain_page;
	}

	public String getTemp1() {
		return temp1;
	}

	public void setTemp1(String temp1) {
		this.temp1 = temp1;
	}

	public String getTemp2() {
		return temp2;
	}

	public void setTemp2(String temp2) {
		this.temp2 = temp2;
	}

	public String getTemp3() {
		return temp3;
	}

	public void setTemp3(String temp3) {
		this.temp3 = temp3;
	}

	public String getTemp4() {
		return temp4;
	}

	public void setTemp4(String temp4) {
		this.temp4 = temp4;
	}

	public String getTemp5() {
		return temp5;
	}

	public List<SysMenu> getSysMenuList() {
		return sysMenuList;
	}

	public void setSysMenuList(List<SysMenu> sysMenuList) {
		this.sysMenuList = sysMenuList;
	}

	public String getSm_parent_name() {
		return sm_parent_name;
	}

	public void setSm_parent_name(String sm_parent_name) {
		this.sm_parent_name = sm_parent_name;
	}

	public void setTemp5(String temp5) {
		this.temp5 = temp5;
	}

	public String getSm_istop_name() {
		return sm_istop_name;
	}

	public void setSm_istop_name(String sm_istop_name) {
		this.sm_istop_name = sm_istop_name;
	}

	public String getSm_sort_name() {
		return sm_sort_name;
	}

	public void setSm_sort_name(String sm_sort_name) {
		this.sm_sort_name = sm_sort_name;
	}

	public int getChildSysMenuNum() {
		return childSysMenuNum;
	}

	public void setChildSysMenuNum(int childSysMenuNum) {
		this.childSysMenuNum = childSysMenuNum;
	}

	public boolean isIsleaf() {
		return isleaf;
	}

	public void setIsleaf(boolean isleaf) {
		this.isleaf = isleaf;
	}

	public String getSm_page_phone() {
		return sm_page_phone;
	}

	public void setSm_page_phone(String sm_page_phone) {
		this.sm_page_phone = sm_page_phone;
	}

	public String getSm_icon_name() {
		return sm_icon_name;
	}

	public void setSm_icon_name(String sm_icon_name) {
		this.sm_icon_name = sm_icon_name;
	}

	public String getSm_shortcut_key() {
		return sm_shortcut_key;
	}

	public void setSm_shortcut_key(String sm_shortcut_key) {
		this.sm_shortcut_key = sm_shortcut_key;
	}

	public String getIsused() {
		return isused;
	}

	public void setIsused(String isused) {
		this.isused = isused;
	}

	@Override
	public String toString() {
		return "SysMenu [id=" + id + ", sm_name=" + sm_name + ", sm_code="
				+ sm_code + ", sm_title=" + sm_title + ", sm_parent="
				+ sm_parent + ", sm_page_phone=" + sm_page_phone + ", sm_page="
				+ sm_page + ", sm_description=" + sm_description + ", sm_used="
				+ sm_used + ", sm_icon_name=" + sm_icon_name
				+ ", sm_shortcut_key=" + sm_shortcut_key + ", sm_is_top="
				+ sm_is_top + ", sm_cotain_page=" + sm_cotain_page + ", temp1="
				+ temp1 + ", temp2=" + temp2 + ", temp3=" + temp3 + ", temp4="
				+ temp4 + ", temp5=" + temp5 + "]";
	}

}