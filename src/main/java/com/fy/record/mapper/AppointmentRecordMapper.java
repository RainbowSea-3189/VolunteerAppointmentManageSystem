package com.fy.record.mapper;

import com.fy.record.entity.AppointmentRecord;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
/**
 * @author 张彬
 * @version 1.0
 * @Description: 志愿者预约记录的映射层
 * @date 2018年11月24日
 */
public interface AppointmentRecordMapper {
    /**
     * 插入
     *
     * @param appointmentRecord 预约记录对象
     * @return Integer
     */
    Integer insert(AppointmentRecord appointmentRecord);

    /**
     * 删除
     *
     * @param id 预约记录ID
     * @return Integer
     */
    Integer delete(String id);

    /**
     * 批量删除
     *
     * @param ids 预约记录ID数组
     * @return Integer
     */
    Integer delete(String[] ids);

    /**
     * 更新
     *
     * @param appointmentRecord 预约记录对象
     * @return Integer
     */
    Integer update(AppointmentRecord appointmentRecord);

    /**
     * 根据ID查询
     *
     * @param id 预约记录ID
     * @return Map
     */
    Map selectById(Integer id);

    /**
     * 根据ID查询实体
     *
     * @param id 预约记录ID
     * @return AppointmentRecord
     */
    AppointmentRecord selectEntityById(Integer id);

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
     * 查询该岗位所有的预约记录
     *
     * @param stationId 志愿者ID
     * @return List
     */
    List selectByStationId(Integer stationId);

    /**
     * 查询该日期的时间段
     *
     * @param map 查询参数
     * @return Integer
     */
    Integer selectRecordInfoNum(Map map);

    /**
     * 查询该日期的人员姓名
     *
     * @param stationId 志愿者ID
     * @param date 日期
     * @param timeFrame 时间段
     * @return String
     */
    String selectName(String stationId, String date, Integer timeFrame);

    /**
     * 获取排行榜按月份
     * @param month 月份
     * @return List<Map>
     */
    List<Map> selectRankingList(@Param("month")String month);

    /**
     * 获取排行榜
     * @return List<Map>
     */
    List<Map> selectRankingListAll();

}
