package com.fy.record.entity;

import java.io.Serializable;
import java.util.Date;

public class RecordInfo implements Serializable {
    private String id;
    private String phone;
    private String appoId;
    private String stationId;
    private Date appoDate;
    private Integer timeFrame;
    private String inserter;
    private Date InsertTime;

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAppoId() {
        return appoId;
    }

    public void setAppoId(String appoId) {
        this.appoId = appoId;
    }

    public String getStationId() {
        return stationId;
    }

    public void setStationId(String stationId) {
        this.stationId = stationId;
    }

    public Date getAppoDate() {
        return appoDate;
    }

    public void setAppoDate(Date appoDate) {
        this.appoDate = appoDate;
    }

    public Integer getTimeFrame() {
        return timeFrame;
    }

    public void setTimeFrame(Integer timeFrame) {
        this.timeFrame = timeFrame;
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
}