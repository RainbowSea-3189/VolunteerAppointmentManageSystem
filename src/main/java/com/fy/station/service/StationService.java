package com.fy.station.service;

import com.fy.station.entity.Station;
import com.fy.station.mapper.StationMapper;
import com.fy.system.common.util.DateUtil;
import com.fy.system.constant.SysConstant;
import com.fy.system.entity.DataTable;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author 张彬
 * @version 1.0
 * @Description: 志愿者的服务层
 * @date 2018年11月24日
 */
@Service
public class StationService {
    @Autowired
    private StationMapper stationMapper;
    /**
     * 插入
     *
     * @param station 志愿者对象
     * @return Integer
     */
    public Integer insert(Station station) {
        station.setInsertTime(new Date());
        return stationMapper.insert(station);
    }

    /**
     * 删除
     *
     * @param id 志愿者ID
     * @return Integer
     */
    public Integer delete(Integer id) {
        return stationMapper.delete(id);
    }

    /**
     * 批量删除
     *
     * @param ids 志愿者ID数组
     * @return Integer
     */
    public Integer delete(String[] ids) {
        return stationMapper.delete(ids);
    }

    /**
     * 更新
     *
     * @param station 志愿者对象
     * @return Integer
     */
    public Integer update(Station station) {
        station.setUpdateTime(new Date());
        return stationMapper.update(station);
    }

    /**
     * 根据ID查询
     *
     * @param id 志愿者ID
     * @return Map
     */
    public Map selectById(Integer id) {
        return stationMapper.selectById(id);
    }

    /**
     * 根据ID查询实体
     *
     * @param id 志愿者ID
     * @return Station
     */
    public Station selectEntityById(String id) {
        return stationMapper.selectEntityById(id);
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
        List<Map> list = stationMapper.selectList(para);
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
        return stationMapper.selectAll();
    }

    /**
     * 查询该志愿者ID有多少条记录
     *
     * @param stationId 志愿者ID
     * @return Integer
     */
    public Integer selectRecordByStationId(Integer stationId) {
        return stationMapper.selectRecordByStationId(stationId);
    }

    /**
     * 查询该时段空闲的志愿者
     * @param appoTime 日期
     * @param beginTime 开始时间
     * @param endTime 结束时间
     * @return List<Map>
     */
    public List<Map> selectStationByTime(Date appoTime, Integer beginTime, Integer endTime) {
        return stationMapper.selectStationByTime(appoTime,beginTime, endTime);
    }
}
