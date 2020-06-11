package cn.edu.usts.cs2018.dao.mapper;

import cn.edu.usts.cs2018.pojo.Event;
import cn.edu.usts.cs2018.utils.MyBatisUtilts;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

public class EventMapperTest
{
    SqlSession sqlSession = MyBatisUtilts.getSession();
    EventMapper mapper = sqlSession.getMapper(EventMapper.class);

    @Test
    public void findAll()
    {
        List<Event> list = mapper.findAll();
        for (Event e : list)
        {
            System.out.println(e);
        }
    }

    @Test
    public void insert()
    {
        Event event = new Event();
        event.setEventname("test");
        event.setContent("This is a test event!");
        event.setStarttime(new Date());
        event.setLength(2);
        event.setTotalmoney(1000);
        mapper.insert(event);
//        sqlSession.commit();
    }

    @Test
    public void delete()
    {
        mapper.delete(52);
//        sqlSession.commit();
    }

    @Test
    public void update()
    {
        Event event = new Event();
        event.setEventid(3);
        event.setEventname("test");
        event.setContent("This is a test event!");
        event.setStarttime(new Date());
        event.setLength(2);
        event.setMaxperson(5);
        event.setTotalmoney(1000);
        mapper.update(event);
//        for (int i = 4; i < 52; i++)
//        {
//            event.setEventid(i);
//            event.setEventname("test" + (i - 3));
//            event.setContent("This is a test event!");
//            event.setStarttime(new Date());
//            event.setLength(2);
//            event.setMaxperson(5);
//            event.setTotalmoney(1000);
//            mapper.update(event);
//        }
        sqlSession.commit();
    }

    @Test
    public void findByEventName()
    {
        List<Event> list = mapper.findByEventName("test");
        for (Event e : list)
        {
            System.out.println(e);
        }
    }

    @Test
    public void findByEventId()
    {
        Event event = mapper.findByEventId(1);
        System.out.println(event);
    }

    @Test
    public void findByEidEname()
    {
        Event event = mapper.findByEidEname(1, "test");
        System.out.println(event);
    }
}