package com.fy.station.mapper;

import com.fy.station.entity.Station;

import java.util.Date;
import java.util.List;
import java.util.Map;
/**
 * @author 张彬
 * @version 1.0
 * @Description: 志愿者的映射层
 * @date 2018年11月24日
 */
public interface StationMapper {
    /**
     * 插入
     *
     * @param station 志愿者对象
     * @return Integer
     */
    Integer insert(Station station);

    /**
     * 删除
     *
     * @param id 志愿者ID
     * @return Integer
     */
    Integer delete(Integer id);

    /**
     * 批量删除
     *
     * @param ids 志愿者ID数组
     * @return Integer
     */
    Integer delete(String[] ids);

    /**
     * 更新
     *
     * @param station 志愿者对象
     * @return Integer
     */
    Integer update(Station station);

    /**
     * 根据ID查询
     *
     * @param id 志愿者ID
     * @return Map
     */
    Map selectById(Integer id);

    /**
     * 根据ID查询实体
     *
     * @param id 志愿者ID
     * @return Station
     */
    Station selectEntityById(String id);

    /**
     * 分页查询
     *
     * @param map 查询条件
     * @return List<Map>
     */
    List<Map> selectList(Map map);

    /**
     * 查询所有
     *
     * @return List
     */
    List selectAll();

    /**
     * 查询该岗位ID有多少条记录
     *
     * @param stationId 志愿者ID
     * @return Integer
     */
    Integer selectRecordByStationId(Integer stationId);

    /**
     * 查询该时段空闲的志愿者
     * @param appoTime 日期
     * @param beginTime 开始时间
     * @param endTime 结束时间
     * @return List<Map>
     */
    List<Map> selectStationByTime(Date appoTime, Integer beginTime, Integer endTime);
}
