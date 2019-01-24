package com.fy.record.mapper;


import com.fy.record.entity.RecordInfo;

import java.util.List;
import java.util.Map;

/**
 * @author 张彬
 * @version 1.0
 * @Description: 志愿者预约记录详情的映射层
 * @date 2018年11月24日
 */
public interface RecordInfoMapper {
    /**
     * 插入
     *
     * @param recordInfo 预约记录详情对象
     * @return Integer
     */
    Integer insert(RecordInfo recordInfo);

    /**
     * 删除
     *
     * @param id 预约记录详情ID
     * @return Integer
     */
    Integer delete(Integer id);

    /**
     * 批量删除
     *
     * @param ids 预约记录详情ID数组
     * @return Integer
     */
    Integer delete(String[] ids);

    /**
     * 删除
     *
     * @param appoId 预约记录详情ID
     * @return Integer
     */
    Integer deleteByAppoId(String appoId);

    /**
     * 更新
     *
     * @param recordInfo 预约记录详情对象
     * @return Integer
     */
    Integer update(RecordInfo recordInfo);

    /**
     * 根据ID查询
     *
     * @param id 预约记录详情ID
     * @return Map
     */
    Map selectById(Integer id);

    /**
     * 根据ID查询实体
     *
     * @param id 预约记录详情ID
     * @return RecordInfo
     */
    RecordInfo selectEntityById(Integer id);

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
}
