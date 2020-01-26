package com.server.common;

public class PageResponse extends Response {

	private static final long serialVersionUID = 9025785970927403535L;

	private CommonPage page;

	public PageResponse() {

	}

	public PageResponse(CommonPage page, Object value) {
		super(value);
		this.page = page;
	}

	public CommonPage getPage() {
		return page;
	}

	public void setPage(CommonPage page) {
		this.page = page;
	}

}
