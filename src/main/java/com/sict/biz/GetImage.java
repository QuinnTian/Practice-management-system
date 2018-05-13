package com.sict.biz;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class GetImage {
	/**
	 * ����
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		String url = "http://mmbiz.qpic.cn/mmbiz/E7dFrZibHrWibtFKS29RrKhqRyibpwooLPibdVicSspBgr40Ue5MP1IREOGarPuErCDlqXvqpz5p2jSntHlf2ckUvNg/0";
		byte[] btImg = getImageFromNetByUrl(url);
		if (null != btImg && btImg.length > 0) {
			System.out.println("��ȡ����" + btImg.length + " �ֽ�");
			System.out.println(System.getProperty("user.dir"));
			String fileurl = System.getProperty("user.dir") + "\\Image";
			String fileName = "\\�ٶ�.jpg";
			System.out.println(fileurl + fileName);
			writeImageToDisk(btImg, fileurl + fileName);
		} else {
			System.out.println("û�дӸ����ӻ������");
		}
	}

	/**
	 * ��ͼƬд�뵽����
	 * 
	 * @param img
	 *            ͼƬ�����
	 * @param fileName
	 *            �ļ�����ʱ�����
	 */
	public static void writeImageToDisk(byte[] img, String fileName) {
		try {
			File file = new File(fileName);
			FileOutputStream fops = new FileOutputStream(file);
			fops.write(img);
			fops.flush();
			fops.close();
			System.out.println("ͼƬ�Ѿ�д�뵽" + fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * ��ݵ�ַ�����ݵ��ֽ���
	 * 
	 * @param strUrl
	 *            �������ӵ�ַ
	 * @return
	 */
	public static byte[] getImageFromNetByUrl(String strUrl) {
		try {
			URL url = new URL(strUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setConnectTimeout(5 * 1000);
			InputStream inStream = conn.getInputStream();// ͨ����������ȡͼƬ���
			byte[] btImg = readInputStream(inStream);// �õ�ͼƬ�Ķ��������
			return btImg;
		} catch (Exception e) {
			e.printStackTrace();
		}
		// http://jngczx.jsp.jspee.cn/springmvc_mybatis/wx/index.do
		return null;
	}

	/**
	 * ���������л�ȡ���
	 * 
	 * @param inStream
	 *            ������
	 * @return
	 * @throws Exception
	 */
	public static byte[] readInputStream(InputStream inStream) throws Exception {
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, len);
		}
		inStream.close();
		return outStream.toByteArray();
	}
}