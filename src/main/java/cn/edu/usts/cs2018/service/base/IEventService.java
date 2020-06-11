package cn.edu.usts.cs2018.service.base;

import cn.edu.usts.cs2018.pojo.Event;

import java.util.List;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/10/2020 9:24 PM
 */
public interface IEventService extends IBaseService<Event>
{
    List<Event> findByName(String eventname);

    Event findByEventId(Integer eventid);

    Event findByEidEname(Integer eventid, String eventname);
}
