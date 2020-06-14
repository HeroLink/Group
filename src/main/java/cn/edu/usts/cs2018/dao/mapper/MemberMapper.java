package cn.edu.usts.cs2018.dao.mapper;

import cn.edu.usts.cs2018.dao.base.IBaseDao;
import cn.edu.usts.cs2018.pojo.Event;
import cn.edu.usts.cs2018.pojo.Member;
import cn.edu.usts.cs2018.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/10/2020 8:45 PM
 */
public interface MemberMapper extends IBaseDao<Member>
{
    /**
     * 找出当前uid同意加入的所有活动
     *
     * @param uid
     * @return
     */
    List<Event> findEventsByUid(Integer uid);

    /**
     * 找出当前活动中所有的用户
     *
     * @param evntid
     * @return
     */
    List<User> findUsersByEid(Integer evntid);

    /**
     * 根据uid找出所有尚未同意加入的活动
     *
     * @param uid
     * @return
     */
    List<Event> findNoByUid(Integer uid);

    int delete(@Param("eventid") Integer eventid, @Param("uid") Integer uid);

    User findLeader(Integer eventid);

    List<Member> findByEid(Integer eventid);

    /**
     * 找出所有当前uid的参与和待加入的活动
     * @param uid
     * @return
     */
    List<Event> findAllEventsByUid(Integer uid);
}
