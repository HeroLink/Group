package cn.edu.usts.cs2018.service.base;

import java.util.List;

public interface IBaseService<T>
{
    List<T> findAll();

    int insert(T entity);

    int delete(Integer id);

    int update(T entity);
}
