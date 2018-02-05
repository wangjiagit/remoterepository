package com.dyne.maven.mybatis.plugin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by steven on 2017/7/4.
 */
public class PageParams {
    //第几页
    private Integer page;
    //每页限制条数
    private Integer pageSize;
    //是否启动插件，如果不启动，则不作分页
    private Boolean useFlag;
    //是否检测页码的有效性，如果为true，而页码大于最大页数，则抛出异常
    private Boolean checkFlag;
    //是否清除最后order by 后面的语句
    private Boolean cleanOrderBy;
    //总条数，插件会回填这个值
    private Integer total;
    //总页数，插件会回填这个值.
    private Integer totalPage;
    // 直接自行返回了draw计数器,应该由后台返回
    private Integer row;

    private String order;

    private String orderName;
    //对应的当前页记录  
    private List<Map<String, Object>> results;
    //其他的参数我们把它分装成一个Map对象  
    private Map<String, Object> params = new HashMap<String, Object>();

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Boolean getUseFlag() {
        return useFlag;
    }

    public void setUseFlag(Boolean useFlag) {
        this.useFlag = useFlag;
    }

    public Boolean getCheckFlag() {
        return checkFlag;
    }

    public void setCheckFlag(Boolean checkFlag) {
        this.checkFlag = checkFlag;
    }

    public Boolean getCleanOrderBy() {
        return cleanOrderBy;
    }

    public void setCleanOrderBy(Boolean cleanOrderBy) {
        this.cleanOrderBy = cleanOrderBy;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }


    public Integer getRow() {
        return row;
    }

    public void setRow(Integer row) {
        this.row = row;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public List<Map<String, Object>> getResults() {
		return results;
	}

	public void setResults(List<Map<String, Object>> results) {
		this.results = results;
	}

	public Map<String, Object> getParams() {
		return params;
	}

	public void setParams(Map<String, Object> params) {
		this.params = params;
	}

	@Override
    public String toString() {
        return "PageParams{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", useFlag=" + useFlag +
                ", checkFlag=" + checkFlag +
                ", cleanOrderBy=" + cleanOrderBy +
                ", total=" + total +
                ", totalPage=" + totalPage +
                ", row=" + row +
                ", order='" + order + '\'' +
                ", orderName='" + orderName + '\'' +
                '}';
    }
}
