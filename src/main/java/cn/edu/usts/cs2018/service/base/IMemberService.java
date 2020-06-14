package cn.edu.usts.cs2018.service.base;

import cn.edu.usts.cs2018.pojo.Event;
import cn.edu.usts.cs2018.pojo.Member;
import cn.edu.usts.cs2018.pojo.User;


import java.util.List;

public interface IMemberService extends IBaseService<Member>
{
    List<Event> findAllEventsByUid(Integer uid);

    List<Event> findEventsByUid(Integer uid);

    List<User> findUsersByEid(Integer eventid);

    List<Event> findNoByUid(Integer uid);

    int delete(Integer eventid, Integer uid);

    User findLeader(Integer eventid);

    List<Member> findByEid(Integer eventid);
}
