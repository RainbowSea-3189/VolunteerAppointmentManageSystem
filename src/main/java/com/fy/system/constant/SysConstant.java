package com.fy.system.constant;


/**
 * @author 张彬
 * @version 1.0
 * @Description: 系统全局常量
 * @date 2018年11月25日
 */
public class SysConstant {

	/**
	 * 超级管理员角色code
	 */
	public static final String ADMIN = "admin";
    /**
	 * 用户中心加密key
	 */
	public static String PASS_KEY="b0qk7cqwntc0ttqx";
	/**
	 * 字典顶级父id
	 */
	public static final String DIC_PID = "0";
	/**
	 * session用户key
	 */
	public static final String CURRENT_USER = "currentUser";
	/**
	 * 分页起始数
	 */
	public static final String START = "start";
	/**
	 * 每页显示数量
	 */
	public static final String LENGTH = "length";


	/**
	 * 日志类别
	 */
	public enum logType{
		/**
		 * 登录日志类别
		 */
		LOGIN("0"),
		/**
		 * 操作日志类别
		 */
		DO("1"),
		/**
		 * 异常日志类别
		 */
		EXCEPTION("2");

		logType(String type) {
			this.type = type;
		}

		private String type;

		public String getType() {
			return type;
		}
	}

	/**
	 * 任务状态
	 */
	public enum jobStaus{
		/**
		 * 启动任务
		 */
		START("0"),
		/**
		 * 停止任务
		 */
		STOP("1");

		jobStaus(String status) {
			this.status = status;
		}

		private String status;

		public String getStatus() {
			return status;
		}
	}

	/**
	 * 用户账号状态
	 */
	public enum userStatus{
		/**
		 * 正常的
		 */
		NORMAL("0"),
		/**
		 * 禁用的
		 */
		FORBIDDEN("1");

		userStatus(String status) {
			this.status = status;
		}

		private String status;

		public String getStatus() {
			return status;
		}
	}

}
