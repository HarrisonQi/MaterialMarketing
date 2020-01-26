package com.server.common;

import java.io.Serializable;
import java.util.Date;

public class Response implements Serializable {

	private static final long serialVersionUID = 1033074173010414017L;
	/**
	 * 状�?�码, 0:成功, -1:失败, 1008:身份失效
	 */
	private int code;
	/**
	 * 提示信息
	 */
	private String msg;
	/**
	 * 返回结果
	 */
	private Object data;

	/**
	 * 服务器时�?
	 */
	private Date responseTime = new Date();

	public Response() {

	}

	public Response(Object result) {
		this(Constant.SUCCESS_CODE, "success", result);
	}

	public Response(int code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	public Response(int code, String msg, Object data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
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

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Date getResponseTime() {
		return responseTime;
	}

	public void setResponseTime(Date responseTime) {
		this.responseTime = responseTime;
	}

	/**
	 * 返回成功信息
	 * 
	 * @param value
	 * @return
	 */
	public static Response success(String msg) {
		return new Response(Constant.SUCCESS_CODE, msg);
	}

	/**
	 * 返回成功信息
	 * 
	 * @param msg
	 * @param data
	 * @return
	 */
	public static Response success(String msg, Object data) {
		Response resp = new Response(Constant.SUCCESS_CODE, msg);
		resp.setData(data);
		return resp;
	}

	/**
	 * 返回成功信息
	 * 
	 * @param value
	 * @param code
	 * @return
	 */
	public static Response success(int code, String msg) {
		return new Response(code, msg);
	}

	/**
	 * 返回错误信息
	 * 
	 * @param value
	 * @return
	 */
	public static Response error(String msg) {
		return error(Constant.ERROR_CODE, msg);
	}

	/**
	 * 返回错误信息
	 * 
	 * @param code
	 * @param value
	 * @return
	 */
	public static Response error(int code, String msg) {
		return new Response(code, msg);
	}

	/**
	 * 返回错误信息
	 * 
	 * @param code
	 * @param value
	 * @return
	 */
	public static Response error(int code, String msg, Object result) {
		return new Response(code, msg, result);
	}

	/**
	 * 返回错误信息
	 * 
	 * @param msg
	 * @param result
	 * @return
	 */
	public static Response error(String msg, Object result) {
		return new Response(Constant.ERROR_CODE, msg, result);
	}

	/**
	 * 返回结果
	 * 
	 * @param result
	 * @return
	 */
	public static Response result(Object result) {
		return new Response(result);
	}

	/**
	 * 返回分页结果
	 * 
	 * @param page
	 * @param result
	 * @return
	 */
	public static Response pageResult(CommonPage page, Object result) {
		return new PageResponse(page, result);
	}

	/**
	 * 判断是否成功
	 */
	public boolean isSuccess() {
		return getCode() == Constant.SUCCESS_CODE;
	}

}
