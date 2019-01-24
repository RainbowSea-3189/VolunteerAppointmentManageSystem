package com.fy.system.entity;

import java.io.Serializable;

/**
 * @author 张彬
 * @version 1.0
 * @Description: 返回实体类
 * @date 2018年11月24日
 */
public class ReturnBean<T> implements Serializable {

    public int code;

    public String msg;

    public T data;

    /**
     * 构造方法
     */
    public ReturnBean() {

    }

    public ReturnBean(int code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    /**
     * 成功
     *
     * @return
     */
    public static ReturnBean ok() {
        return new ReturnBean(ReturnCode.OK.getCode(), ReturnCode.OK.getMsg(), null);
    }

    /**
     * 成功
     *
     * @param msg
     * @return
     */
    public static ReturnBean ok(String msg) {
        return new ReturnBean(ReturnCode.OK.getCode(), msg, null);
    }

    /**
     * 成功
     *
     * @param data
     * @return
     */
    public static ReturnBean ok(Object data) {
        return new ReturnBean(ReturnCode.OK.getCode(), ReturnCode.OK.getMsg(), data);
    }


    /**
     * 失败
     *
     * @return
     */
    public static ReturnBean error() {
        return new ReturnBean(ReturnCode.ERROR.getCode(), ReturnCode.ERROR.getMsg(), null);
    }

    /**
     * 自定义失败信息(自定义错误msg)
     *
     * @return
     */
    public static ReturnBean error(String msg) {
        return new ReturnBean(ReturnCode.ERROR.getCode(), msg, null);
    }

    /**
     * 自定义失败信息(使用全局的响应码和消息提示)
     *
     * @param rc
     * @return
     */
    public static ReturnBean error(ReturnCode rc) {
        return new ReturnBean(rc.getCode(), rc.getMsg(), null);
    }

    /**
     * 自定义失败信息
     *
     * @param rc
     * @return
     */
    public static ReturnBean error(ReturnCode rc, String msg) {
        return new ReturnBean(rc.getCode(), msg, null);
    }
}