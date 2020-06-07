package cn.edu.usts.cs2018.service.impl;

import cn.edu.usts.cs2018.dao.mapper.UserMapper;
import cn.edu.usts.cs2018.pojo.User;
import cn.edu.usts.cs2018.service.base.IUserService;
import cn.edu.usts.cs2018.utils.MyBatisUtilts;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

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
    public boolean register(User user)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        int i = mapper.insert(user);
        sqlSession.commit();
        sqlSession.close();
        return i > 0;
    }

    @Override
    public boolean modify(User user)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(UserMapper.class);
        int i = mapper.update(user);
        sqlSession.commit();
        sqlSession.close();
        return i > 0;
    }
}
