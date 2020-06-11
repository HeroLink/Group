package cn.edu.usts.cs2018.dao.mapper;

import cn.edu.usts.cs2018.dao.base.IBaseDao;
import cn.edu.usts.cs2018.pojo.Event;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/10/2020 8:45 PM
 */
public interface EventMapper extends IBaseDao<Event>
{
    List<Event> findByEventName(String eventname);

    Event findByEventId(Integer eventid);

    Event findByEidEname(@Param("eventid") Integer eventid, @Param("eventname") String eventname);
}
