package com.fy.system.common.util;


import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.Map;
import java.util.Set;

/**
 * @Description: HTTP工具类
 * @author 张彬
 * @date 2019年12月11日
 * @version 1.0
 */
public class HttpUtil {

//	private final static Logger logger = LoggerFactory.getLogger(HttpUtil.class);

	/**
	 * 使用Get方式获取数据
	 * @param url
	 * @param header
	 * @return
	 */
	public static String doGet(String url,Map header) {
		String result = "";
		BufferedReader in = null;
		try {
			URL realUrl = new URL(url);
			// 打开和URL之间的连接
			URLConnection connection = realUrl.openConnection();
			// 设置通用的请求属性
			connection.setRequestProperty("accept", "*/*");
			connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			setHeader(connection,header);
			// 建立实际的连接
			connection.connect();
			// 定义 BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			e.printStackTrace();
//			logger.error("发送GET请求出现异常！", e);
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * POST请求，字符串形式数据
	 * @param url
	 * @param header
	 * @param param
	 * @return
	 */
	public static String doPost(String url,Map header,String param ) {

		PrintWriter out = null;
		BufferedReader in = null;
		String result = "";
		try {
			URL realUrl = new URL(url);
			// 打开和URL之间的连接
			URLConnection conn = realUrl.openConnection();
			// 设置通用的请求属性
			conn.setRequestProperty("accept", "*/*");
			conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			setHeader(conn,header);
			// 发送POST请求必须设置如下两行
			conn.setDoOutput(true);
			conn.setDoInput(true);
			// 获取URLConnection对象对应的输出流
			OutputStreamWriter outWriter = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
			out = new PrintWriter(outWriter);
			// 发送请求参数
			out.print(param);
			// flush输出流的缓冲
			out.flush();
			// 定义BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {
			result = null;
//			logger.error("发送POST请求出现异常！", e);
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * 设置头属性
	 * @param connection
	 * @param header
	 */
	private static void setHeader(URLConnection connection, Map header) {
		if(header!=null) {
			Set<Map.Entry<String, Object>> entrySet = header.entrySet();
			for (Map.Entry<String, Object> entry : entrySet) {
				String key = entry.getKey();
				String value = entry.getValue().toString();
				connection.setRequestProperty(key, value);
			}
		}
	}

	public static void main(String[] args) {
		String str = doGet("https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=wxc4b817ab27010402&corpsecret=NFn7KQdn_g7ctCeiJ6CGWJNP1hd2StsJ4DwfyMCcHBw",null);
		System.out.println(str);
	}

}
