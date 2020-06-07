package cn.edu.usts.cs2018.dao.mapper;

import cn.edu.usts.cs2018.pojo.User;
import cn.edu.usts.cs2018.utils.MyBatisUtilts;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class UserMapperTest
{
    SqlSession sqlSession = MyBatisUtilts.getSession();
    UserMapper mapper = sqlSession.getMapper(UserMapper.class);

    @Test
    public void findByUnamePwd()
    {
        User user = new User();
        user.setUsername("admin");
        user.setPassword("admin");
        user = mapper.findByUnamePwd(user);
        System.out.println(user);
    }

    @Test
    public void findByUid()
    {
        User user = mapper.findByUid(1);
        System.out.println(user);
    }

    @Test
    public void findAll()
    {
        List<User> list = mapper.findAll();
        for (User u : list)
        {
            System.out.println(list);
        }
    }

    @Test
    public void insert()
    {
        User user = new User();
        user.setUsername("link");
        user.setPassword("link");
        user.setGender("male");
        user.setPhone("18012616025");
        user.setIdentity(1);
        int i = mapper.insert(user);
        sqlSession.commit();
        System.out.println(i);
        System.out.println(user);
    }

    @Test
    public void delete()
    {
        int i=mapper.delete(6);
        sqlSession.commit();
        System.out.println(i);
    }

    @Test
    public void update()
    {
        User user = new User();
        user.setUid(6);
        user.setUsername("link");
        user.setPassword("link");
        user.setGender("male");
        user.setPhone("18012616025");
        user.setIdentity(0);
        int i = mapper.update(user);
        sqlSession.commit();
        System.out.println(i);
        System.out.println(user);
    }
}