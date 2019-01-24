package com.fy.station.controller;

import com.fy.station.entity.Station;
import com.fy.station.service.StationService;
import com.fy.system.entity.DataTable;
import com.fy.system.entity.ReturnBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @author 张彬
 * @version 1.0
 * @Description: 志愿者的控制层
 * @date 2018年11月24日
 */
@Controller
public class StationController {
    @Autowired
    private StationService stationService;

    /**
     * 志愿者页面
     * @return String
     */
    @GetMapping("station/list")
    public String list() {
        return "pc/station/list";
    }

    /**
     * 获取志愿者分页数据
     * @param map 查询条件
     * @return DataTable
     */
    @PostMapping("station/list")
    @ResponseBody
    public DataTable list(@RequestParam Map map) {
        return stationService.selectList(map);
    }

    /**
     * 添加志愿者
     * @param station 志愿者对象
     * @return ReturnBean
     */
    @PostMapping("station/insert")
    @ResponseBody
    public ReturnBean insert(Station station) {
        stationService.insert(station);
        return ReturnBean.ok();
    }

    /**
     * 更新志愿者
     * @param station 志愿者对象
     * @return ReturnBean
     */
    @PostMapping("station/update")
    @ResponseBody
    public ReturnBean update(Station station) {
        stationService.update(station);
        return ReturnBean.ok();
    }

    /**
     * 删除志愿者
     * @param id 志愿者ID
     * @return ReturnBean
     */
    @PostMapping("station/delete")
    @ResponseBody
    public ReturnBean delete(Integer id) {
        stationService.delete(id);
        return ReturnBean.ok();
    }

    /**
     * 根据ID查询志愿者
     * @param id 志愿者ID
     * @return ReturnBean
     */
    @PostMapping("station/selectById")
    @ResponseBody
    public ReturnBean selectById(Integer id) {
        Map map = stationService.selectById(id);
        if (map != null) {
            return ReturnBean.ok(map);
        } else {
            return ReturnBean.error("没有该岗位！");
        }
    }

    /**
     * 查询该志愿者ID有多少条记录
     * @param stationId 志愿者ID
     * @return ReturnBean
     */
    @PostMapping("station/selectByStationId")
    @ResponseBody
    public ReturnBean selectByStationId(Integer stationId) {
        return ReturnBean.ok(stationService.selectRecordByStationId(stationId));
    }

}
