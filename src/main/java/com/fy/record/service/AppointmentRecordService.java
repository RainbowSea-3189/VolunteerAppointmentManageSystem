package com.fy.record.service;

import com.fy.record.entity.AppointmentRecord;
import com.fy.record.mapper.AppointmentRecordMapper;
import com.fy.system.constant.SysConstant;
import com.fy.system.entity.DataTable;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author 张彬
 * @version 1.0
 * @Description: 志愿者预约记录的服务层
 * @date 2018年11月24日
 */
@Service
public class AppointmentRecordService {
    @Autowired
    private AppointmentRecordMapper appointmentRecordMapper;

    /**
     * 插入
     *
     * @param appointmentRecord 预约记录对象
     * @return Integer
     */
    public Integer insert(AppointmentRecord appointmentRecord) {
        return appointmentRecordMapper.insert(appointmentRecord);
    }

    /**
     * 删除
     *
     * @param id 预约记录ID
     * @return Integer
     */
    public Integer delete(String id) {
        return appointmentRecordMapper.delete(id);
    }

    /**
     * 批量删除
     *
     * @param ids 预约记录ID数组
     * @return Integer
     */
    public Integer delete(String[] ids) {
        return appointmentRecordMapper.delete(ids);
    }

    /**
     * 更新
     *
     * @param appointmentRecord 预约记录对象
     * @return Integer
     */
    public Integer update(AppointmentRecord appointmentRecord) {
        return appointmentRecordMapper.update(appointmentRecord);
    }

    /**
     * 根据ID查询
     *
     * @param id
     * @return Map
     */
    public Map selectById(Integer id) {
        return appointmentRecordMapper.selectById(id);
    }

    /**
     * 根据ID查询实体
     *
     * @param id 预约记录ID
     * @return Station
     */
    public AppointmentRecord selectEntityById(Integer id) {
        return appointmentRecordMapper.selectEntityById(id);
    }

    /**
     * 分页查询
     *
     * @param para 查询条件
     * @return List<Map>
     */
    public DataTable selectList(Map para) {
        DataTable dataTable = new DataTable();
        // 下面两句要连着写在一起，就可以实现分页
        dataTable.setLength(Integer.valueOf(para.get(SysConstant.LENGTH).toString()));
        dataTable.setPageNum(Integer.valueOf(para.get(SysConstant.START).toString()));
        PageHelper.startPage(dataTable.getPageNum(), dataTable.getLength());
        List<Map> list = appointmentRecordMapper.selectList(para);
        // 下面这句是为了获取分页信息，比如记录总数等等
        PageInfo<Map> pageInfo = new PageInfo(list);
        dataTable.setData(list);
        dataTable.setRecordsFiltered(pageInfo.getTotal());
        return dataTable;
    }

    /**
     * 查询所有
     *
     * @return List
     */
    public List selectAll() {
        return appointmentRecordMapper.selectAll();
    }


    /**
     * 查询该岗位所有的预约记录
     *
     * @param stationId 志愿者ID
     * @return List
     */
    public List selectByStationId(Integer stationId) {
        return appointmentRecordMapper.selectByStationId(stationId);
    }

    /**
     * 查询该日期的时间段
     *
     * @param map 查询条件
     * @return Integer
     */
    public Integer selectRecordInfoNum(Map map) {
        return appointmentRecordMapper.selectRecordInfoNum(map);
    }

    /**
     * 查询该日期的人员姓名
     *
     * @param stationId 志愿者ID
     * @param date 日期
     * @param timeFrame 时间段
     * @return String
     */
    public String selectName(String stationId, String date, Integer timeFrame) {
        return appointmentRecordMapper.selectName(stationId, date, timeFrame);
    }

    /**
     * 获取排行榜
     * @param month 月份
     * @return List<Map>
     */
    public List<Map> selectRankingList(String month) {
        return appointmentRecordMapper.selectRankingList(month);
    }

    /**
     * 按条件查询预约记录
     *
     * @param map 查询条件
     * @return Integer
     */
    public List<Map> selectRecord(Map map) {
        return appointmentRecordMapper.selectList(map);
    }
}
