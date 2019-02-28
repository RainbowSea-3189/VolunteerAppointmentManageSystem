package com.fy.record.controller;

import com.fy.record.entity.AppointmentRecord;
import com.fy.record.entity.RecordInfo;
import com.fy.record.service.AppointmentRecordService;
import com.fy.record.service.RecordInfoService;
import com.fy.station.entity.Station;
import com.fy.station.service.StationService;
import com.fy.system.common.util.DateUtil;
import com.fy.system.entity.DataTable;
import com.fy.system.entity.ReturnBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 张彬
 * @version 1.0
 * @Description: 志愿者预约记录的控制层
 * @date 2018年11月24日
 */
@Controller
public class AppointmentRecordController {
    @Autowired
    private AppointmentRecordService appointmentRecordService;
    @Autowired
    private RecordInfoService recordInfoService;
    @Autowired
    private StationService stationService;
    @Autowired
    private HttpServletRequest request;

    /**
     * PC端志愿者预约记录页面
     * @return String
     */
    @GetMapping("record/list")
    public String list() {
        //获取所有志愿者岗位
        request.setAttribute("stationList", stationService.selectAll());
        return "pc/record/list";
    }

    /**
     * 志愿者预约记录（分页）
     * @param map 查询条件
     * @return String
     */
    @PostMapping("record/list")
    @ResponseBody
    public DataTable list(@RequestParam Map map) {
        return appointmentRecordService.selectList(map);
    }

    /**
     * 添加记录
     * @param appointmentRecord 预约记录对象
     * @param date 日期
     * @param begin 开始时间（小时）
     * @param end 结束时间（小时）
     * @return ReturnBean
     */
    @PostMapping("record/insert")
    @ResponseBody
        public ReturnBean insert(AppointmentRecord appointmentRecord, String date, Integer begin, Integer end) {
        if (request.getSession().getAttribute("userPhone") != null && !"".equals(request.getSession().getAttribute("userPhone"))) {
            Map map = new HashMap();
            map.put("date", date);
            map.put("begin", begin + 1);
            map.put("end", end);
            map.put("stationId", appointmentRecord.getStationId());
            //该志愿者该时段的人数
            Integer num = appointmentRecordService.selectRecordInfoNum(map);
            map.put("phone", appointmentRecord.getPhone());
            //该志愿者该时段该用户的记录数量
            Integer numSelf = appointmentRecordService.selectRecordInfoNum(map);
            //获取该志愿者对象
            Station station = stationService.selectEntityById(appointmentRecord.getStationId());
            if (num < station.getNum()) {//判断是否超过设定的人数
                if (numSelf == 0) {//判断用户自己是否已经预约
                    appointmentRecord.setAppointmentTime(DateUtil.stringToDate("yyyy-MM-dd", date));
                    appointmentRecord.setInserter(appointmentRecord.getName());
                    appointmentRecord.setInsertTime(new Date());
                    //插入预约记录主表
                    appointmentRecordService.insert(appointmentRecord);
                    RecordInfo recordInfo = new RecordInfo();
                    recordInfo.setPhone(appointmentRecord.getPhone());
                    recordInfo.setAppoId(appointmentRecord.getId());
                    recordInfo.setStationId(appointmentRecord.getStationId());
                    recordInfo.setAppoDate(appointmentRecord.getAppointmentTime());
                    recordInfo.setInserter(appointmentRecord.getName());
                    recordInfo.setInsertTime(new Date());
                    //插入预约记录详情表
                    recordInfoService.insert(recordInfo, begin, end);
                    return ReturnBean.ok();
                } else {
                    return ReturnBean.error("抱歉，该岗位在该时段已被您预约。");
                }
            } else {
                return ReturnBean.error("抱歉，该岗位在该时段已被预约。");
            }
        } else {
            return ReturnBean.error("redirect");
        }
    }

    /**
     * 添加记录
     * @param appointmentRecord 预约记录对象693988胡梦琪
     * @return ReturnBean
     */
    @PostMapping("record/insertOut")
    @ResponseBody
    public ReturnBean insert(AppointmentRecord appointmentRecord) {
        String[] names = appointmentRecord.getName().split(";");
        for (String name : names) {
            appointmentRecord.setName(name);
            appointmentRecord.setInsertTime(new Date());
            appointmentRecordService.insert(appointmentRecord);
        }
        return ReturnBean.ok();
    }

    /**
     * 更新预约记录
     * @param appointmentRecord 预约记录对象
     * @param date 日期
     * @param begin 开始时间（小时）
     * @param end 结束时间（小时）
     * @return ReturnBean
     */
//    @PostMapping("record/update")
//    @ResponseBody
//    public ReturnBean update(AppointmentRecord appointmentRecord, String date, Integer begin, Integer end) {
//        Map map = new HashMap();
//        map.put("date",date);
//        map.put("begin", begin + 1);
//        map.put("end", end);
//        map.put("stationId", appointmentRecord.getStationId());
//        map.put("appoId", appointmentRecord.getId());
//        //该志愿者该时段的人数
//        Integer num = appointmentRecordService.selectRecordInfoNum(map);
//        //获取该志愿者对象
//        Station station = stationService.selectEntityById(appointmentRecord.getStationId());
//        if (num < station.getNum()) {//判断是否超过设定的人数
//            appointmentRecord.setAppointmentTime(DateUtil.stringToDate("yyyy-MM-dd", date));
//            appointmentRecord.setUpdateTime(new Date());
//            //插入预约记录主表
//            appointmentRecordService.update(appointmentRecord);
//            //删除预约记录详情表
//            recordInfoService.deleteByStationId(appointmentRecord.getId());
//            RecordInfo recordInfo = new RecordInfo();
//            recordInfo.setPhone(appointmentRecord.getPhone());
//            recordInfo.setAppoId(appointmentRecord.getId());
//            recordInfo.setStationId(appointmentRecord.getStationId());
//            recordInfo.setAppoDate(appointmentRecord.getAppointmentTime());
//            recordInfo.setInsertTime(new Date());
//            //插入预约记录详情表
//            recordInfoService.insert(recordInfo, begin, end);
//            return ReturnBean.ok();
//        }else {
//            return ReturnBean.error("抱歉，该岗位在该时段已被预约。");
//        }
//    }

    /**
     * 修改预约记录状态
     * @param appointmentRecord 预约记录对象
     * @return ReturnBean
     */
    @PostMapping("record/updateStatus")
    @ResponseBody
    public ReturnBean updateStatus(AppointmentRecord appointmentRecord) {
        if (request.getSession().getAttribute("userPhone") != null && !"".equals(request.getSession().getAttribute("userPhone"))) {
            appointmentRecordService.update(appointmentRecord);
            return ReturnBean.ok();
        } else {
            return ReturnBean.error("redirect");
        }
    }

    /**
     * 删除预约记录
     * @param id 预约记录ID
     * @return ReturnBean
     */
    @RequestMapping("record/delete")
    @ResponseBody
    public ReturnBean delete(String id) {
        //删除预约主记录
        appointmentRecordService.delete(id);
        //删除预约详情记录
        recordInfoService.deleteByStationId(id);
        return ReturnBean.ok();
    }

    /**
     * 查询预约记录
     * @param id 预约记录ID
     * @return ReturnBean
     */
    @RequestMapping("record/selectById")
    @ResponseBody
    public ReturnBean selectById(Integer id) {
        //查询该ID的记录
        Map map = appointmentRecordService.selectById(id);
        if (map != null) {
            return ReturnBean.ok(map);
        } else {
            return ReturnBean.error("未找到该条记录！");
        }
    }

    /**
     * 查询预约该日期的人员姓名
     * @return Integer
     */
    @RequestMapping("record/selectName")
    @ResponseBody
    public ReturnBean selectName(String stationId, String date, Integer timeFrame) {
        return ReturnBean.ok(appointmentRecordService.selectName(stationId, date, timeFrame));
    }

}
