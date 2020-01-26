package com.server.entity;

import java.sql.Date;

public class Message {
	private String message;
	private String username;
	private Integer id;
	private Date opt_time;

	public Date getOpt_time() {
		return opt_time;
	}

	public void setOpt_time(Date opt_time) {
		this.opt_time = opt_time;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
