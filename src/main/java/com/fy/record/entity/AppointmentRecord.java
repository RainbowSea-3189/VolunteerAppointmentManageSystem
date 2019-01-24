package com.fy.record.entity;

import com.github.pagehelper.Page;

import java.io.Serializable;
import java.util.Date;
/**
 * @author 张彬
 * @version 1.0
 * @Description: 志愿者预约记录实体
 * @date 2018年11月24日
 */
public class AppointmentRecord implements Serializable {
    private String id;
    private String name;
    private String wxUserId;
    private Integer depId;
    private String depName;
    private String phone;
    private String stationId;
    private Date appointmentTime;
    private Date beginTime;
    private Date endTime;
    private Integer status;
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

    public String getWxUserId() {
        return wxUserId;
    }

    public void setWxUserId(String wxUserId) {
        this.wxUserId = wxUserId;
    }

    public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStationId() {
        return stationId;
    }

    public void setStationId(String stationId) {
        this.stationId = stationId;
    }

    public Date getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(Date appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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
