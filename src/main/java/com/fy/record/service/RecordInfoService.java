package com.fy.record.service;

import com.fy.record.entity.RecordInfo;
import com.fy.record.mapper.RecordInfoMapper;
import com.fy.system.constant.SysConstant;
import com.fy.system.entity.DataTable;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author 张彬
 * @version 1.0
 * @Description: 志愿者预约记录的服务层
 * @date 2018年11月24日
 */
@Service
public class RecordInfoService {
    @Autowired
    private RecordInfoMapper recordInfoMapper;

    /**
     * 插入
     *
     * @param recordInfo 预约记录详情对象
     * @return Integer
     */
    public Integer insert(RecordInfo recordInfo, Integer begin, Integer end) {
        for (int i = begin + 1; i <= end; i++) {
            recordInfo.setTimeFrame(i);
            recordInfoMapper.insert(recordInfo);
            recordInfo.setId(null);
        }
        return 1;
    }

    /**
     * 删除
     *
     * @param id 预约记录详情ID
     * @return Integer
     */
    public Integer delete(Integer id) {
        return recordInfoMapper.delete(id);
    }

    /**
     * 批量删除
     *
     * @param ids 预约记录详情ID数组
     * @return Integer
     */
    public Integer delete(String[] ids) {
        return recordInfoMapper.delete(ids);
    }


    /**
     * 删除
     *
     * @param appoId 预约记录详情ID
     * @return Integer
     */
    public Integer deleteByStationId(String appoId) {
        return recordInfoMapper.deleteByAppoId(appoId);
    }


    /**
     * 更新
     *
     * @param recordInfo 预约记录详情对象
     * @return Integer
     */
    public Integer update(RecordInfo recordInfo) {
        return recordInfoMapper.update(recordInfo);
    }

    /**
     * 根据ID查询
     *
     * @param id 预约记录详情ID
     * @return Map
     */
    public Map selectById(Integer id) {
        return recordInfoMapper.selectById(id);
    }

    /**
     * 根据ID查询实体
     *
     * @param id 预约记录详情ID
     * @return Station
     */
    public RecordInfo selectEntityById(Integer id) {
        return recordInfoMapper.selectEntityById(id);
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
        List<Map> list = recordInfoMapper.selectList(para);
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
        return recordInfoMapper.selectAll();
    }
}
