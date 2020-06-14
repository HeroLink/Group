package cn.edu.usts.cs2018.service.impl;

import cn.edu.usts.cs2018.dao.mapper.MemberMapper;
import cn.edu.usts.cs2018.pojo.Event;
import cn.edu.usts.cs2018.pojo.Member;
import cn.edu.usts.cs2018.pojo.User;
import cn.edu.usts.cs2018.service.base.IMemberService;
import cn.edu.usts.cs2018.utils.MyBatisUtilts;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/11/2020 2:47 PM
 */
@Service("memberService")
public class MemberServiceImpl implements IMemberService
{
    SqlSession sqlSession;
    MemberMapper mapper;

    @Override
    public List<Event> findAllEventsByUid(Integer uid)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(MemberMapper.class);
        List<Event> list = mapper.findAllEventsByUid(uid);
        sqlSession.close();
        return list;
    }

    @Override
    public List<Event> findEventsByUid(Integer uid)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(MemberMapper.class);
        List<Event> list = mapper.findEventsByUid(uid);
        sqlSession.close();
        return list;
    }

    @Override
    public List<User> findUsersByEid(Integer evntid)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(MemberMapper.class);
        List<User> list = mapper.findUsersByEid(evntid);
        sqlSession.close();
        return list;
    }

    @Override
    public List<Event> findNoByUid(Integer uid)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(MemberMapper.class);
        List<Event> list = mapper.findNoByUid(uid);
        sqlSession.close();
        return list;
    }

    @Override
    public int delete(Integer eventid, Integer uid)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(MemberMapper.class);
        int i = mapper.delete(eventid, uid);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    @Override
    public User findLeader(Integer eventid)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(MemberMapper.class);
        User user = mapper.findLeader(eventid);
        sqlSession.close();
        return user;
    }

    @Override
    public List<Member> findByEid(Integer eventid)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(MemberMapper.class);
        List<Member> list = mapper.findByEid(eventid);
        sqlSession.close();
        return list;
    }

    @Override
    public List<Member> findAll()
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(MemberMapper.class);
        List<Member> list = mapper.findAll();
        sqlSession.close();
        return list;
    }

    //需要将对应的其他表属性也增加
    @Override
    public int insert(Member entity)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(MemberMapper.class);
        int i = mapper.insert(entity);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    @Deprecated
    @Override
    public int delete(Integer id)
    {
        return 0;
    }

    @Override
    public int update(Member entity)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(MemberMapper.class);
        int i = mapper.update(entity);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }
}
