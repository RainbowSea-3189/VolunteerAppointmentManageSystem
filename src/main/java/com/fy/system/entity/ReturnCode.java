package com.fy.system.entity;


/**
 * @author 张彬
 * @version 1.0
 * @Description: 全局返回码
 * @date 2018年11月24日
 */
public enum ReturnCode {

    /**
     * 成功
     */
    OK(0, "操作成功"),
    /**
     * 失败
     */
    ERROR(-1, "操作失败");


    private int code;

    private String msg;


    ReturnCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

}
