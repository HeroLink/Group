package cn.edu.usts.cs2018.dao.base;

import java.util.List;

public interface IBaseDao<T>
{
    List<T> findAll();

    int insert(T entity);

    int delete(Integer id);

    int update(T entity);
}
