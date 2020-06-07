package cn.edu.usts.cs2018.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/7/2020 1:55 PM
 */
public class MyBatisUtilts
{
    private static SqlSessionFactory sqlSessionFactory = null;

    static
    {
        try
        {
            String resource = "mybatis-config.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    public static SqlSession getSession()
    {
        return sqlSessionFactory.openSession();
    }
}
