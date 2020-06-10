package cn.edu.usts.cs2018.service.impl;

import cn.edu.usts.cs2018.dao.mapper.UserMapper;
import cn.edu.usts.cs2018.pojo.User;
import cn.edu.usts.cs2018.service.base.IUserService;
import cn.edu.usts.cs2018.utils.MyBatisUtilts;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/7/2020 2:56 PM
 */
@Service("userService")
public class UserServiceImpl implements IUserService
{
    SqlSession sqlSession;
    UserMapper mapper;

    @Override
    public User login(User user)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        user = mapper.findByUnamePwd(user);
        sqlSession.close();
        return user;
    }

    @Override
    public int register(User user)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        int i;
        // 用户已存在
        if (mapper.findByUname(user.getUsername()) != null)
        {
            i = 0;
        }
        else
        {
            // 注册成功
            if (mapper.insert(user) > 0)
            {
                sqlSession.commit();
                user = mapper.findByUid(user.getUid());
                i = 1;
            }
            else
            {
                i = -1;
            }
        }
        sqlSession.close();
        return i;
    }

    @Override
    public User findByUnamePwd(User user)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        user = mapper.findByUnamePwd(user);
        sqlSession.close();
        return user;
    }

    @Override
    public User findByUid(Integer id)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        User user = mapper.findByUid(id);
        sqlSession.close();
        return user;
    }

    @Override
    public User findByUname(String username)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        User user = mapper.findByUname(username);
        sqlSession.close();
        return user;
    }

    @Override
    public User findByUidUname(Integer id, String username)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        User user = mapper.findByUidUname(id, username);
        sqlSession.close();
        return user;
    }

    @Override
    public List<User> findAll()
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        List<User> list = mapper.findAll();
        sqlSession.close();
        return list;
    }

    @Override
    public int insert(User entity)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        int i = mapper.insert(entity);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    @Override
    public int delete(Integer id)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        int i = mapper.delete(id);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    @Override
    public int update(User entity)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        int i = mapper.update(entity);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }
}
