package com.fy.system.common.util;

import com.alibaba.fastjson.JSONObject;
import org.springframework.scheduling.annotation.Scheduled;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

/**
 * @Description: Token工具类
 * @author 张彬
 * @date 2019年12月11日
 * @version 1.0
 */
public class WeiXInUtil {

    //企业ID
    private static String corpid = "wxc4b817ab27010402";

    //应用ID
    private static String corpsecret = "NFn7KQdn_g7ctCeiJ6CGWJNP1hd2StsJ4DwfyMCcHBw";

    //应用ID
    private static String agentid = "1000023";

    //Token
    private static String token = "";

    /**
     * 获取token
     * @return String
     */
    public static String getToken() {
        String resultDate = HttpUtil.doGet("https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=" + corpid + "&corpsecret=" + corpsecret, null);
        JSONObject jsonDate = JSONObject.parseObject(resultDate);
        token = jsonDate.getString("access_token");
        return token;
    }

    /**
     * 更新token
     * @return String
     */
    public static String updateToken() {
        return getToken();
    }

    /**
     * 获取访问用户身份
     * @param code 企业微信code
     * @return JSONObject
     */
    public static JSONObject getUser(String code) {
        if (token == null || "".equals(token)) {
            updateToken();
        }
        String resultDate = HttpUtil.doGet("https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo?access_token=" + token + "&code=" + code, null);
        JSONObject jsonDate = JSONObject.parseObject(resultDate);
        return jsonDate;
    }

    /**
     * 读取成员
     * @param userId 企业微信用户ID
     * @return JSONObject
     */
    public static JSONObject getUserInfo(String userId) {
        if (token == null || "".equals(token)) {
            updateToken();
        }
        String resultDate = HttpUtil.doGet("https://qyapi.weixin.qq.com/cgi-bin/user/get?access_token=" + token + "&userid=" + userId, null);
        JSONObject jsonDate = JSONObject.parseObject(resultDate);
        return jsonDate;
    }

    /**
     * 获取部门列表
     * @param id 企业微信部门ID
     * @return JSONObject
     */
    public static JSONObject getDepartment(String id) {
        if (token == null || "".equals(token)) {
            updateToken();
        }
        String resultDate = HttpUtil.doGet("https://qyapi.weixin.qq.com/cgi-bin/department/list?access_token=" + token + "&id=" + id, null);
        JSONObject jsonDate = JSONObject.parseObject(resultDate);
        return jsonDate;
    }

    /**
     * 发送微信消息
     * @param userId 企业微信用户ID
     * @param content 消息内容
     * @return
     */
    public static JSONObject markMsg(String userId, String content) {
        if (token == null || "".equals(token)) {
            updateToken();
        }
        Map postData = new HashMap();
        postData.put("touser", userId);
        postData.put("msgtype", "text");
        postData.put("agentid", agentid);
        Map text = new HashMap();
        text.put("content", content);
        postData.put("text", text);
        postData.put("safe", "0");
        JSONObject postJson = new JSONObject(postData);
        postJson.getByte("UTF-8");
        Map header = new HashMap();
        header.put("content-type", "charset=UTF-8");
        String resultDate = HttpUtil.doPost("https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=" + token, header, postJson.toJSONString());
        JSONObject jsonDate = JSONObject.parseObject(resultDate);
        return jsonDate;
    }

    public static void main(String[] args) {
        WeiXInUtil.markMsg("18370850492","您好,张轩豪,您预约了明天的张轩豪的志愿者岗位,请您安排好自己的时间,完成好志愿服务工作,谢谢！");
    }
}
