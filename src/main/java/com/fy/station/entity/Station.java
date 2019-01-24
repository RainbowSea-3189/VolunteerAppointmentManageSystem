package com.fy.station.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * @author 张彬
 * @version 1.0
 * @Description: 志愿者实体
 * @date 2018年11月24日
 */
public class Station implements Serializable {
    private String id;
    private String name;
    private String details;
    private Integer sort;
    private Integer num;
    private String inserter;
    private Date InsertTime;
    private String updateer;
    private Date updateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getInserter() {
        return inserter;
    }

    public void setInserter(String inserter) {
        this.inserter = inserter;
    }

    public Date getInsertTime() {
        return InsertTime;
    }

    public void setInsertTime(Date insertTime) {
        InsertTime = insertTime;
    }

    public String getUpdateer() {
        return updateer;
    }

    public void setUpdateer(String updateer) {
        this.updateer = updateer;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
