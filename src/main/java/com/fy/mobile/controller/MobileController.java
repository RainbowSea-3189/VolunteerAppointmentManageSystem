package com.fy.mobile.controller;

import com.alibaba.fastjson.JSONObject;
import com.fy.record.service.AppointmentRecordService;
import com.fy.record.service.RecordInfoService;
import com.fy.station.service.StationService;
import com.fy.system.common.util.DateUtil;
import com.fy.system.common.util.HttpUtil;
import com.fy.system.common.util.WeiXInUtil;
import com.fy.system.entity.ReturnBean;
import jdk.nashorn.internal.parser.Token;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.UserAgent;
import eu.bitwalker.useragentutils.Version;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author 张彬
 * @version 1.0
 * @Description: 手机页面的控制层
 * @date 2018年11月29日
 */
@Controller
public class MobileController {
    @Autowired
    private StationService stationService;
    @Autowired
    private AppointmentRecordService appointmentRecordService;
    @Autowired
    private HttpServletRequest request;

    /**
     * 设置预约时间页面
     * @return String
     */
    @GetMapping("mobile/setTime")
    public String setTime() {
        return "mobile/set_time";
    }

    /**
     * 在设置时间里的志愿者页面
     * @param appoTime 日期
     * @param begin 开始时间（小时）
     * @param end 结束时间（小时）
     * @return String
     */
    @GetMapping("mobile/stationList")
    public String stationList(String appoTime, Integer begin, Integer end) {
        //获取该时间内的志愿者数据
        List stationList = stationService.selectStationByTime(DateUtil.stringToDate("yyyy-MM-dd", appoTime), begin, end);
        request.setAttribute("stationList", stationList);
        request.setAttribute("beginTime", DateUtil.stringToDate("yyyy-MM-dd hh:mm:ss", appoTime + begin.toString() + ":00:00"));
        request.setAttribute("endTime", DateUtil.stringToDate("yyyy-MM-dd hh:mm:ss", appoTime + end.toString() + ":00:00"));
        request.setAttribute("appoTime", appoTime);
        request.setAttribute("begin", begin);
        request.setAttribute("end", end);
        return "mobile/station_list";
    }

    /**
     * 所有志愿者的页面
     * @return String
     */
    @GetMapping("mobile/allStation")
    public String allStation() {
        request.setAttribute("stationList", stationService.selectAll());
        //获得微信code
        String code = request.getParameter("code");
        if (request.getSession().getAttribute("userPhone") == null || "".equals(request.getSession().getAttribute("userPhone"))) {
            WeiXInUtil.getToken();
            //获取用户企业微信ID
            String userId = WeiXInUtil.getUser(code).getString("UserId");
            //获取用户详细信息
            JSONObject userData = WeiXInUtil.getUserInfo(userId);
            //获取用户部门信息
            String[] depIds = userData.getString("department").substring(1, userData.getString("department").indexOf("]")).split(",");
            JSONObject depDate = WeiXInUtil.getDepartment(depIds[depIds.length - 1]).getJSONArray("department").getJSONObject(0);
            request.getSession().setAttribute("userName", userData.getString("name"));
            request.getSession().setAttribute("userId", userId);
            request.getSession().setAttribute("userPhone", userData.getString("mobile"));
            request.getSession().setAttribute("userDepId", depDate.getString("id"));
            request.getSession().setAttribute("userDepName", depDate.getString("name"));
        }
        return "mobile/all_station_list";
    }

    /**
     * 日历页面
     * @param stationId 志愿者ID
     * @param stationName 志愿者名字
     * @return String
     */
    @GetMapping("mobile/calendar")
    public String calendar(Integer stationId, String stationName) {
        //获取当天之后的志愿者预约信息
        request.setAttribute("calendars", appointmentRecordService.selectByStationId(stationId));
        request.getSession().setAttribute("stationId", stationId);
        request.getSession().setAttribute("stationName", stationName);
//        Boolean sign = true;
//        Cookie[] cookies = request.getCookies();
//        for (Cookie cookie :
//                cookies) {
//            if ("userPhone".equals(cookie.getName())) {
//                sign = false;
//            }
//        }
//        if (request.getSession().getAttribute("userPhone") == null) {
//            WeiXInUtil.getToken();
//            String userId = WeiXInUtil.getUser(request.getParameter("code")).getString("UserId");
//            JSONObject userData = WeiXInUtil.getUserInfo(userId);
//            JSONObject depDate =  WeiXInUtil.getDepartment(userData.getString("department")).getJSONArray("department").getJSONObject(0);
//            request.getSession().setAttribute("userName", userData.getString("name"));
//            request.getSession().setAttribute("userId", userId);
//            request.getSession().setAttribute("userPhone", userData.getString("mobile"));
//            request.getSession().setAttribute("userDepId", depDate.getString("id"));
//            request.getSession().setAttribute("userDepName", depDate.getString("name"));
//        }
//        if (sign == true) {
//            WeiXInUtil.getToken();
//            String userId = WeiXInUtil.getUser(request.getParameter("code")).getString("UserId");
//            JSONObject userData = WeiXInUtil.getUserInfo(userId);
//            JSONObject depDate =  WeiXInUtil.getDepartment(userData.getString("department")).getJSONArray("department").getJSONObject(0);
//            Cookie userNameCookie = new Cookie("userName", userData.getString("name"));
//            userNameCookie.setMaxAge(10);
//            response.addCookie(userNameCookie);
//            Cookie userPhoneCookie = new Cookie("userPhone", userData.getString("mobile"));
//            userPhoneCookie.setMaxAge(10);
//            response.addCookie(userPhoneCookie);
//            Cookie userDepIdCookie = new Cookie("userDepId", depDate.getString("id"));
//            userDepIdCookie.setMaxAge(10);
//            response.addCookie(userDepIdCookie);
//            Cookie userDepNameCookie = new Cookie("userDepName", depDate.getString("name"));
//            userDepNameCookie.setMaxAge(10);
//            response.addCookie(userDepNameCookie);
//        }
        return "mobile/calendar";
    }

    /**
     * 外来志愿者登记页面
     * @param stationId 志愿者ID
     * @param stationName 志愿者名字
     * @return String
     */
    @GetMapping("mobile/insertOut")
    public String insertOut(Integer stationId, String stationName) {
        //获取当天之后的志愿者预约信息
        request.getSession().setAttribute("stationId", stationId);
        request.getSession().setAttribute("stationName", stationName);
        return "mobile/insert_out";
    }


    /**
     * 志愿者排行榜页面(按月份)
     * @param month 月份
     * @return
     */
    @GetMapping("mobile/getRankingList")
    public String getRankingList(String month) {
        request.setAttribute("month", month);
        //获取该月的志愿者排行榜
        request.setAttribute("list", appointmentRecordService.selectRankingList(month));
        return "mobile/ranking_list";
    }

    /**
     * 志愿者排行榜页面(总)
     * @return
     */
    @GetMapping("mobile/getRankingListAll")
    public String getRankingListAll() {
        //总的的志愿者排行榜
        request.setAttribute("list", appointmentRecordService.selectRankingListAll());
        return "mobile/ranking_list";
    }

    /**
     * 用户预约记录页面
     * @param phone 企业微信用户电话
     * @return
     */
    @GetMapping("mobile/getRecord")
    public String getRecord(String phone) {
        Map map = new HashMap();
        map.put("phone", phone);
        //获取该用户的预约记录
        request.setAttribute("recordList", appointmentRecordService.selectRecord(map));
        return "mobile/record";
    }

    /**
     * 管理志愿者预约记录页面
     * @param map 检索条件
     * @return
     */
    @GetMapping("mobile/settingRecord")
    public String settingRecord(@RequestParam Map map) {
        request.setAttribute("map", map);
        //获取这些条件下的志愿者预约记录
        request.setAttribute("recordList", appointmentRecordService.selectRecord(map));
        return "mobile/setting_record";
    }

    /**
     * 编写建议意见页面
     */
    @GetMapping("mobile/opinion")
    public String opinion(Integer appoID) {
        request.setAttribute("appoId", appoID);
        //获得微信code
        String code = request.getParameter("code");
        if (code != null && "".equals(code)) {
            WeiXInUtil.getToken();
            //获取用户企业微信ID
            String userId = WeiXInUtil.getUser(code).getString("UserId");
            //获取用户详细信息
            JSONObject userData = WeiXInUtil.getUserInfo(userId);
            request.getSession().setAttribute("userName", userData.getString("name"));
            request.getSession().setAttribute("userId", userId);
            request.getSession().setAttribute("userPhone", userData.getString("mobile"));
        }
        return "mobile/opinion";
    }

    /**
     * 浏览建议页面
     */
    @GetMapping("mobile/opinion_list")
    public String opinionList(@RequestParam Map map) {
        map.put("opinion", "true");
        request.setAttribute("recordList", appointmentRecordService.selectRecord(map));
        return "mobile/opinion_list";
    }

    /**
     * 定时任务：发送志愿者提醒
     */
    @Scheduled(cron="0 0 17 * * ? ")//每天17：00执行
    public void task(){
        Map map = new HashMap();
        map.put("appointmentTime", DateUtil.getTheNextDate(DateUtil.getDate()));
        //获取明天的志愿者预约记录
        List<Map> tomorrowRecords =  appointmentRecordService.selectRecord(map);
        for (Map record : tomorrowRecords) {
            //发送企业微信消息
            WeiXInUtil.markMsg((String) record.get("WX_USER_ID"), "您好," + record.get("NAME") + ",您预约了明天的" + record.get("STATIONNAME") + "的志愿者岗位,请您安排好自己的时间，完成好志愿服务工作，谢谢!");
        }
        map.put("appointmentTime", DateUtil.getDate("yyyy-MM-dd"));
        List<Map> todayRecord =  appointmentRecordService.selectRecord(map);
        for (Map record : todayRecord) {
            //发送企业微信消息
            String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc4b817ab27010402&redirect_uri=http%3a%2f%2fwww.gyyfy.com%3a9075%2fVAMS%2fmobile%2fopinion%3fappoID%3d"+record.get("ID")+"&response_type=code&scope=snsapi_base&state=#wechat_redirect";
//            String url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxc4b817ab27010402&redirect_uri=http%3a%2f%2fwww.gyyfy.com%3a9075%2fVAMS%2fmobile%2fopinion%3fappoID%3d70&response_type=code&scope=snsapi_base&state=#wechat_redirect";
            WeiXInUtil.markMsg((String) record.get("WX_USER_ID"), "您好" + record.get("NAME") + ",您已完成今天的志愿者服务，感谢您的参与。您可以对我们的志愿服务工作提出建议，我们将积极听取，认真采纳。谢谢！ <a href=\"" + url + "\">点击此处</a>");
        }
    }

}
