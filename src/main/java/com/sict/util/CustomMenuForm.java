package com.sict.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.sict.entity.SysMenu;
import com.sict.service.DictionaryService;

public class CustomMenuForm {
	// 禁止创建对象
	private CustomMenuForm() {
	};

	/**
	 * 拼写用户菜单资源HTML table (PC)
	 * 
	 * @Description
	 * @author 吴宝
	 * @param custom_menu_ids
	 *            用户自定义菜单
	 * @param listall
	 *            资源菜单
	 * @return
	 */

	public static StringBuffer menuResourceForm(String custom_menu_ids,
			List<SysMenu> listall) {
		List<SysMenu> li = new ArrayList<SysMenu>();// 二级菜单
		List<SysMenu> lis = new ArrayList<SysMenu>();// 三级菜单
		if (custom_menu_ids == null || custom_menu_ids.equals("")) {
			StringBuffer sb = new StringBuffer();
			sb.append("<table>");
			int idd = 0;
			int iddd = 0;
			for (SysMenu s : listall) {
				if (!s.isIsleaf()) {// 判断是否有子菜单，有则显示，没有则不显示
					sb.append("<tr><td>" + s.getSm_name() + "</td></tr>");
					li = s.getSysMenuList();// 二级菜单
					int row1 = 0;// 列
					for (SysMenu sy : li) {
						if (!sy.isIsleaf()) {
							lis.add(sy);
						} else {
							if (row1 % 4 == 0) {// 子菜单一行显示5个
								sb.append("<tr>");
								sb.append("<td></td>");// 空出一个单元格
							}
							sb.append("<td><input id=\"row1"
									+ idd
									+ "\" type=\"checkbox\" name=\"CsysMenu\" value=\""
									+ sy.getId() + "\"/><label for=\"row1"
									+ idd + "\">" + sy.getSm_name()
									+ "</label></td>");

							if (row1 + 1 % 4 == 0) {
								sb.append("</tr>");
							}
							row1++;
							idd++;
						}
					}
					if (row1 < 3) {
						sb.append("</tr>");
					}
					if (lis.size() > 0) {// 判断是否有三级菜单---此处可判断是否有四级菜单参考上文
						for (int j = 0; j < lis.size(); j++) {
							sb.append("<tr><td>"+ lis.get(j).getSm_name() + "</td></tr>");
							List<SysMenu> san = lis.get(j).getSysMenuList();
							int row2 = 0;
							for (SysMenu sys : san) {
								if (row2 % 4 == 0) {
									sb.append("<tr><td></td>");
								}
								sb.append("<td><input id=\"row2"
										+ iddd
										+ "\" type=\"checkbox\" name=\"CsysMenu\" value=\""
										+ sys.getId() + "\"/><label for=\"row2"
										+ iddd + "\">" + sys.getSm_name()
										+ "</label></td>");
								if (row2 + 1 % 4 == 0) {
									sb.append("</tr>");
								}
								row2++;
								iddd++;
							}
							if (row2 < 2) {
								sb.append("</tr>");
							}
						}
					}
				}
			}
			sb.append("</table>");
			return sb;
		} else {
			StringBuffer sb = new StringBuffer();
			sb.append("<table>");
			int idd = 0;
			int iddd = 0;
			for (SysMenu s : listall) {
				if (!s.isIsleaf()) {// 判断是否有子菜单，有则显示，没有则不显示
					sb.append("<tr><td>" + s.getSm_name() + "</td></tr>");
					li = s.getSysMenuList();// 二级菜单
					int row1 = 0;// 列
					for (SysMenu sy : li) {
						if (!sy.isIsleaf()) {
							lis.add(sy);
						} else {
							if (row1 % 4 == 0) {// 子菜单一行显示5个
								sb.append("<tr>");
								sb.append("<td></td>");// 空出一个单元格
							}
							if (custom_menu_ids.contains(sy.getId())) {// 之前此菜单是否被用户所选定，有的话加被点击属性
								sb.append("<td><input id=\"row1"
										+ idd
										+ "\" type=\"checkbox\" name=\"CsysMenu\" value=\""
										+ sy.getId()
										+ "\" checked=\"checked\" /><label for=\"row1"
										+ idd + "\">" + sy.getSm_name()
										+ "</label></td>");
							} else {
								sb.append("<td><input id=\"row1"
										+ idd
										+ "\" type=\"checkbox\" name=\"CsysMenu\" value=\""
										+ sy.getId() + "\"/><label for=\"row1"
										+ idd + "\">" + sy.getSm_name()
										+ "</label></td>");
							}
							if (row1 + 1 % 4 == 0) {
								sb.append("</tr>");
							}
							row1++;
							idd++;
						}
					}
					if (row1 < 3) {
						sb.append("</tr>");
					}
					if (lis.size() > 0) {// 判断是否有三级菜单---此处可判断是否有四级菜单参考上文
						for (int j = 0; j < lis.size(); j++) {
							sb.append("<tr><td>"
									+ lis.get(j).getSm_name() + "</td></tr>");
							List<SysMenu> san = lis.get(j).getSysMenuList();
							int row2 = 0;
							for (SysMenu sys : san) {
								if (row2 % 4 == 0) {
									sb.append("<tr><td></td>");
								}
								if (custom_menu_ids.contains(sys.getId())) {
									sb.append("<td><input id=\"row2"
											+ iddd
											+ "\" type=\"checkbox\" name=\"CsysMenu\" value=\""
											+ sys.getId()
											+ "\" checked=\"checked\" /><label for=\"row2"
											+ iddd + "\">" + sys.getSm_name()
											+ "</label></td>");
								} else {
									sb.append("<td><input id=\"row2"
											+ iddd
											+ "\" type=\"checkbox\" name=\"CsysMenu\" value=\""
											+ sys.getId()
											+ "\"/><label for=\"row2" + iddd
											+ "\">" + sys.getSm_name()
											+ "</label></td>");
								}
								if (row2 + 1 % 4 == 0) {
									sb.append("</tr>");
								}
								row2++;
								iddd++;
							}
							if (row2 < 2) {
								sb.append("</tr>");
							}
						}
					}
				}
			}
			sb.append(hideMenuResourceFormMP(custom_menu_ids));
			sb.append("</table>");
			return sb;
		}
	}

	/**
	 * 拼写用户自定菜单的显示 (pc)
	 * 
	 * @Description
	 * @author 吴宝
	 * @param custom_menu_ids
	 *            用户自定义菜单
	 * @return
	 */

	public static StringBuffer saveMenuForm(String custom_menu_ids) {
		List<SysMenu> listSysmenu = new ArrayList<SysMenu>();
		if (custom_menu_ids == null) {
			return null;
		}
		if (custom_menu_ids.equals("")) {
			return null;
		}
		String[] menuId = custom_menu_ids.split(",");
		for (int i = 0; i < menuId.length; i++) {
			listSysmenu.add(DictionaryService.findMapSysmenu(menuId[i]));
		}
		if (menuId.length > 0) {
			StringBuffer sb = new StringBuffer();
			int  i=0;
			for (SysMenu sysmenu : listSysmenu) {
				String strUrl = sysmenu.getSm_page();
				i++;
				if (strUrl.equals("") || strUrl == null || strUrl.equals("#")) {// 判断是否是电脑的快速导航菜单
					continue;
				}
				String strmenu = sysmenu.getSm_name();
			sb.append("<table>");
				sb.append("<tr>");
				sb.append("<td></td>");
				sb.append("<td><a href=\".." + strUrl + "\">" + strmenu
						+ "</a></td>");
				sb.append("<tr>");
				if(i%1==0){/*添加快捷导航项  显示为1行  by syj 20160405*/
					
					sb.append("<table>");
					sb.append("<br/>");
				}
			}
			return sb;
		} else {
			return null;
		}
	}

	/**
	 * 拼写用户菜单资源HTML table (MP)
	 * 
	 * @Description
	 * @author 吴宝
	 * @param custom_menu_ids
	 *            用户自定义菜单
	 * @param listall
	 *            资源菜单
	 * @return
	 */

	public static StringBuffer menuResourceFormMP(String custom_menu_ids,
			List<SysMenu> listall) {
		StringBuffer sb = new StringBuffer();
		if (custom_menu_ids == null || custom_menu_ids.equals("")) {
			for (SysMenu s : listall) {
				String[] str = s.getSm_icon_name().split(",");
				sb.append("<div class=\"grid-cell div_class\"style=\" background-color:#ededed; \"><div class=\"grid-img \" style=\"background-color:"
						+ str[1]
						+ ";\"><span class=\""
						+ str[0]
						+ "\"></span></div><a  data-role=\"checkbox\" class=\"grid-label\" style=\"position: relative;left:10%\">"
						+ "<input type=\"checkbox\" name=\"roleIdMenu\"/value=\""
						+ s.getId()
						+ "\"><label>"
						+ s.getSm_name()
						+ "</label></a></div>");
			}

			return sb;
		} else {
			for (SysMenu s : listall) {
				if (s.getSm_page_phone() != null
						&& !s.getSm_page_phone().equals("")) {// 判断是否是手机端
					if (custom_menu_ids.contains(s.getId())) {// 判断是否已被选择，被选择添加被点击状态
						String[] str = s.getSm_icon_name().split(",");
						sb.append("<div class=\"grid-cell div_class\"style=\" background-color:#ededed; \"><div class=\"grid-img \" style=\"background-color:"
								+ str[1]
								+ ";\"><span class=\""
								+ str[0]
								+ "\"></span></div><a  data-role=\"checkbox\" class=\"grid-label\" style=\"position: relative;left:10%\">"
								+ "<input checked=\"checked\" type=\"checkbox\" name=\"roleIdMenu\"/value=\""
								+ s.getId()
								+ "\"><label >"
								+ s.getSm_name()
								+ "</label></a></div>");
					} else {
						String[] str = s.getSm_icon_name().split(",");
						sb.append("<div class=\"grid-cell div_class\"style=\" background-color:#ededed; \"><div class=\"grid-img \" style=\"background-color:"
								+ str[1]
								+ ";\"><span class=\""
								+ str[0]
								+ "\"></span></div><a  data-role=\"checkbox\" class=\"grid-label\" style=\"position: relative;left:10%\">"
								+ "<input type=\"checkbox\" name=\"roleIdMenu\"/value=\""
								+ s.getId()
								+ "\"><label >"
								+ s.getSm_name()
								+ "</label></a></div>");
					}
				}
			}
			return sb;
		}
	}

	/**
	 * 拼写用户自定菜单的显示 (MP)
	 * 
	 * @Description
	 * @author 吴宝
	 * @param custom_menu_ids
	 * @return
	 */

	public static StringBuffer saveMenuFormMP(String custom_menu_ids) {
		if (custom_menu_ids == null) {
			return null;
		}
		if (custom_menu_ids.equals("")) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		String[] menuId = custom_menu_ids.split(",");
		List<SysMenu> listSysmenu = new ArrayList<SysMenu>();
		for (int i = 0; i < menuId.length; i++) {
			listSysmenu.add(DictionaryService.findMapSysmenu(menuId[i]));
		}
		for (SysMenu s : listSysmenu) {
			if (s.getSm_page_phone() == null || s.getSm_page_phone().equals("")) {// 判断是否是手机端不是则就不显示
				continue;
			}
			String[] str = s.getSm_icon_name().split(",");
			sb.append("<div class=\"grid-cell\"><a href=\".."
					+ s.getSm_page_phone()
					+ "\"> "
					+ "<div class=\"grid-img\" style=\"width:40px;height:40px;background-color:"
					+ str[1] + ";\">" + "<span class=\"" + str[0]
					+ "\"></span></div><label class=\"grid-label black\">"
					+ s.getSm_name() + "</label></a></div>");
		}
		return sb;
	}

	/**
	 * 手机端隐藏pc菜单列表
	 * 
	 * @Description
	 * @author 吴宝
	 * @param custom_menu_ids
	 *            用户自定义菜单
	 * @return
	 */

	public static StringBuffer hideMenuResourceFormPC(String custom_menu_ids) {
		StringBuffer sb = new StringBuffer();
		sb.append("");
		List<SysMenu> listSysmenu = new ArrayList<SysMenu>();
		if (custom_menu_ids == null || custom_menu_ids.equals("")) {
			return sb;
		}
		String[] menuId = custom_menu_ids.split(",");
		for (int i = 0; i < menuId.length; i++) {
			listSysmenu.add(DictionaryService.findMapSysmenu(menuId[i]));
		}
		for (SysMenu s : listSysmenu) {
			if (s.getSm_shortcut_key() == null
					|| s.getSm_shortcut_key().equals("")) {
				sb.append("<a data-role=\"checkbox\" style=\"display:none;\"><input name=\"roleIdMenu\" checked=\"checked\" type=\"checkbox\" value=\""
						+ s.getId() + "\" /></a>");
			}
		}
		return sb;
	}

	/**
	 * 电脑端隐藏
	 * 
	 * @Description
	 * @author 吴宝
	 * @param custom_menu_ids
	 *            用户自定义菜单
	 * @return
	 */

	public static StringBuffer hideMenuResourceFormMP(String custom_menu_ids) {
		StringBuffer sb = new StringBuffer();
		sb.append("");
		List<SysMenu> listSysmenu = new ArrayList<SysMenu>();
		String[] menuId = custom_menu_ids.split(",");
		for (int i = 0; i < menuId.length; i++) {
			listSysmenu.add(DictionaryService.findMapSysmenu(menuId[i]));
		}
		for (SysMenu s : listSysmenu) {
			if (s.getSm_shortcut_key() == null
					|| s.getSm_shortcut_key().equals("")) {// 判断是否是手机的快速导航说
				continue;
			} else {
				if (s.getSm_page() == null || s.getSm_page().equals("")) {// 判断只显示手机特有的快速导航
					sb.append("<input type=\"checkbox\" name=\"CsysMenu\" value=\""
							+ s.getId()
							+ "\" checked=\"checked\" style=\"display:none;\"/>");
				}
			}
		}
		return sb;
	}
}
