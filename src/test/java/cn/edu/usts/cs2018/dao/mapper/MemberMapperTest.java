package cn.edu.usts.cs2018.dao.mapper;

import cn.edu.usts.cs2018.pojo.Event;
import cn.edu.usts.cs2018.pojo.Member;
import cn.edu.usts.cs2018.pojo.User;
import cn.edu.usts.cs2018.utils.MyBatisUtilts;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class MemberMapperTest
{
    SqlSession sqlSession = MyBatisUtilts.getSession();
    MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

    @Test
    public void findAll()
    {
        List<Member> list=mapper.findAll();
        for (Member m:list)
        {
            System.out.println(m);
        }
    }

    @Test
    public void insert()
    {
        Member member = new Member();
        member.setEventid(48);
        member.setUid(2);
        member.setIsleader(1);
        member.setPayment(0);
        member.setAccept(0);
        mapper.insert(member);
        sqlSession.commit();
    }

    @Test
    public void delete()
    {
        mapper.delete(54,2);
//        sqlSession.commit();
    }

    @Test
    public void update()
    {
        Member member = new Member();
        member.setEventid(54);
        member.setUid(2);
        member.setIsleader(0);
        member.setPayment(0);
        member.setAccept(1);
        mapper.update(member);
//        sqlSession.commit();
    }

    @Test
    public void findEventsByUid()
    {
        List<Event> list=mapper.findEventsByUid(1);
        for (Event e:list)
        {
            System.out.println(e);
        }
    }

    @Test
    public void findUsersByEid()
    {
        List<User> list=mapper.findUsersByEid(54);
        for (User e:list)
        {
            System.out.println(e);
        }
    }

    @Test
    public void findNoByUid()
    {
        List<Event> list=mapper.findNoByUid(2);
        for (Event e:list)
        {
            System.out.println(e);
        }
    }

    @Test
    public void findLeader()
    {
        User user=mapper.findLeader(54);
        System.out.println(user);
    }
}
