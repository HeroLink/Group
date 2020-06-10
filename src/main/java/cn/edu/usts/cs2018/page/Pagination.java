package cn.edu.usts.cs2018.page;

import java.util.Objects;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/10/2020 9:30 AM
 */
public class Pagination
{
    /**
     * 当前记录起始索引
     */
    private Integer pageNum;
    /**
     * 每页显示记录数
     */
    private Integer pageSize;
    /**
     * 排序列
     */
    private String orderByColumn;
    /**
     * 排序的方向 "desc" 或者 "asc".
     */
    private String isAsc;

    public Pagination()
    {
    }

    public Integer getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(Integer pageNum)
    {
        this.pageNum = pageNum;
    }

    public Integer getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(Integer pageSize)
    {
        this.pageSize = pageSize;
    }

    public String getOrderByColumn()
    {
        return orderByColumn;
    }

    public void setOrderByColumn(String orderByColumn)
    {
        this.orderByColumn = orderByColumn;
    }

    public String getIsAsc()
    {
        return isAsc;
    }

    public void setIsAsc(String isAsc)
    {
        this.isAsc = isAsc;
    }

    @Override
    public String toString()
    {
        return "Pagination{" +
                "pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", orderByColumn='" + orderByColumn + '\'' +
                ", isAsc='" + isAsc + '\'' +
                '}';
    }
}
