package com.server.common;

import java.io.Serializable;

public class CommonPage implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -737178242740410051L;
	/**
	 * 当前页数
	 */
	private int pageNo;
	/**
	 * 每页显示数量
	 */
	private int pageSize;
	/**
	 * 总的页数
	 */
	private int totalPage;
	/**
	 * 总的记录条数
	 */
	private int totalCount;

	public CommonPage() {

	}

	public CommonPage(int pageNo, int pageSize) {
		super();
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		this.totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "Page [pageNo=" + pageNo + ", pageSize=" + pageSize + ", totalPage=" + totalPage + ", totalCount="
				+ totalCount + "]";
	}

}
