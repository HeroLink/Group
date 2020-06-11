package cn.edu.usts.cs2018.service.impl;

import cn.edu.usts.cs2018.dao.mapper.EventMapper;
import cn.edu.usts.cs2018.pojo.Event;
import cn.edu.usts.cs2018.service.base.IEventService;
import cn.edu.usts.cs2018.utils.MyBatisUtilts;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/10/2020 9:29 PM
 */
@Service("eventService")
public class EventServiceImpl implements IEventService
{
    SqlSession sqlSession;
    EventMapper mapper;

    @Override
    public List<Event> findByName(String eventname)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(EventMapper.class);
        List<Event> list = mapper.findByEventName(eventname);
        sqlSession.close();
        return list;
    }

    @Override
    public Event findByEventId(Integer eventid)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(EventMapper.class);
        Event event = mapper.findByEventId(eventid);
        sqlSession.close();
        return event;
    }

    @Override
    public Event findByEidEname(Integer eventid, String eventname)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(EventMapper.class);
        Event event = mapper.findByEidEname(eventid, eventname);
        sqlSession.close();
        return event;
    }

    @Override
    public List<Event> findAll()
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(EventMapper.class);
        List<Event> list = mapper.findAll();
        sqlSession.close();
        return list;
    }

    @Override
    public int insert(Event entity)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(EventMapper.class);
        int i = mapper.insert(entity);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    @Override
    public int delete(Integer id)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(EventMapper.class);
        int i = mapper.delete(id);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }

    @Override
    public int update(Event entity)
    {
        sqlSession = MyBatisUtilts.getSession();
        mapper = sqlSession.getMapper(EventMapper.class);
        int i = mapper.update(entity);
        sqlSession.commit();
        sqlSession.close();
        return i;
    }
}
