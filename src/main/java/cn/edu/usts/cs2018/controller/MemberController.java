package cn.edu.usts.cs2018.controller;

import cn.edu.usts.cs2018.domain.AjaxResult;
import cn.edu.usts.cs2018.page.Pagination;
import cn.edu.usts.cs2018.page.TableDataInfo;
import cn.edu.usts.cs2018.pojo.Event;
import cn.edu.usts.cs2018.pojo.Member;
import cn.edu.usts.cs2018.pojo.User;
import cn.edu.usts.cs2018.service.base.IEventService;
import cn.edu.usts.cs2018.service.base.IMemberService;
import cn.edu.usts.cs2018.service.base.IUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.lang.annotation.Documented;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/11/2020 12:43 PM
 */
@Controller
@RequestMapping("/member")
public class MemberController
{
    @Autowired
    @Qualifier("memberService")
    private IMemberService memberService;

    @Autowired
    @Qualifier("userService")
    private IUserService userService;

    @Autowired
    @Qualifier("eventService")
    private IEventService eventService;

    private String prefix = "/event";

    private Logger logger = LogManager.getLogger(MemberController.class);

    /**
     * 活动成员get
     *
     * @param eventid
     * @param map
     * @return
     */
    @GetMapping("/listmember/{eventid}")
    public String listMember(@PathVariable("eventid") Integer eventid, ModelMap map)
    {
//        List<User> list = memberService.findUsersByEid(eventid);
        Event event = eventService.findByEventId(eventid);
        User leader = memberService.findLeader(eventid);
        map.put("event", event);
        map.put("leader", leader);
        logger.info("查看活动ID：" + eventid + "，已返回");
        return prefix + "/member";
    }

    /**
     * 活动成员列表post
     *
     * @param eventid
     * @return
     */
    @PostMapping("/listmember/{eventid}")
    @ResponseBody
    public Map<String, Object> listMember(@PathVariable("eventid") Integer eventid)
    {
        List<User> list = memberService.findUsersByEid(eventid);
        Map<String, Object> map = new HashMap<>();
        User leader = memberService.findLeader(eventid);
        map.put("leader", leader);
        //配合table
        map.put("rows", list);
        map.put("code", 0);
        logger.info("查看活动成员详情：" + eventid + "，已返回");
        return map;
    }

    /**
     * 更换队长
     *
     * @param uid
     * @param eventid
     * @return
     */
    @RequestMapping("/leader")
    @ResponseBody
    public AjaxResult changeLeader(Integer uid, Integer eventid)
    {
        if (uid != null && eventid != null)
        {
            List<Member> list = memberService.findByEid(eventid);
            if (list == null)
            {
                return AjaxResult.error();
            }
            for (Member m : list)
            {
                m.setIsleader(0);
                if (m.getUid().equals(uid))
                {
                    m.setIsleader(1);
                }
                memberService.update(m);
            }
            User leader = memberService.findLeader(eventid);
            logger.info("更新leader成功，leader：" + leader);
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }

    /**
     * 删除成员
     *
     * @param ids
     * @param eventid
     * @return
     */
    @RequestMapping("/remove/{eventid}")
    @ResponseBody
    public AjaxResult remove(String ids, @PathVariable("eventid") Integer eventid)
    {
        if (eventid == null)
        {
            return AjaxResult.error();
        }
        String[] list = ids.split(",");
        logger.info("删除成员的ID：" + ids);
        for (String s : list)
        {
            int result = memberService.delete(eventid, Integer.valueOf(s));
            if (result <= 0)
            {
                return AjaxResult.error();
            }
        }
        logger.info("删除成功！");
        return AjaxResult.success();
    }


    /**
     * 非成员用户列表get
     *
     * @param eventid
     * @param map
     * @return
     */
    @GetMapping("/listuser/{eventid}")
    public String listUser(@PathVariable("eventid") Integer eventid, ModelMap map)
    {
//        List<User> list = memberService.findUsersByEid(eventid);
        Event event = eventService.findByEventId(eventid);
        map.put("event", event);
        return prefix + "/invite";
    }


    /**
     * 删除已存在的成员
     *
     * @param list
     * @param exist
     */
    private void removeExist(List<User> list, List<User> exist)
    {
        for (User u1 : exist)
        {
            list.removeIf(u2 -> u1.getUid().equals(u2.getUid()));
            logger.info("移除成功！");
        }
    }

    /**
     * 非成员用户列表post
     *
     * @param pagination
     * @param uid
     * @param username
     * @param eventid
     * @return
     */
    @PostMapping("/listuser/{eventid}")
    @ResponseBody
    public TableDataInfo listUser(Pagination pagination, Integer uid, String username, @PathVariable("eventid") Integer eventid)
    {
        List<User> list = new ArrayList<>();
        if (pagination.getPageNum() != null && pagination.getPageSize() != null && eventid != null)
        {
            List<User> userList = userService.findAll();
            for (User u : userList)
            {
                u.setPassword(null);
            }
            List<User> exist = memberService.findUsersByEid(eventid);
            removeExist(userList, exist);
            int pageNum = pagination.getPageNum();
            int pageSize = pagination.getPageSize();
            logger.info("分页信息：" + pagination);
            String orderBy = pagination.getOrderByColumn();
            // 此方法配合前端完成自动分页，需要在mybatis-config.xml中配置默认的拦截器
            PageHelper.startPage(pageNum, pageSize, orderBy);
            if (uid != null && "".equals(username))
            {
                logger.info("查询ID:" + uid);
                for (User u : userList)
                {
                    if (u.getUid().equals(uid))
                    {
                        list.add(u);
                        logger.info(u);
                        break;
                    }
                }
            }
            if (!"".equals(username) && uid == null)
            {
                logger.info("查询用户名:" + username);
                for (User u : userList)
                {
                    if (u.getUsername().equals(username))
                    {
                        list.add(u);
                        logger.info(u);
                        break;
                    }
                }
            }
            if (uid != null && !"".equals(username))
            {
                logger.info("查询ID和用户名分别为:" + uid + "," + username);
                for (User u : userList)
                {
                    if (u.getUsername().equals(username) && u.getUid().equals(uid))
                    {
                        list.add(u);
                        logger.info(u);
                        break;
                    }
                }
            }
            if (uid == null && "".equals(username))
            {
                list = userList;
            }
        }
        else
        {
            list = userService.findAll();
        }
        return getDataTable(list);
    }


    /**
     * 邀请成员
     *
     * @param ids
     * @param eventid
     * @return
     */
    @RequestMapping("/invite/{eventid}")
    @ResponseBody
    public AjaxResult invite(String ids, @PathVariable("eventid") Integer eventid)
    {
        logger.info("邀请的ids：" + ids);
        logger.info("邀请的活动id：" + eventid);
        if (ids != null && eventid != null)
        {
            Member member = new Member();
            member.setEventid(eventid);
            member.setPayment(0);
            member.setAccept(0);
            member.setIsleader(0);
            String[] list = ids.split(",");
            for (String s : list)
            {
                member.setUid(Integer.valueOf(s));
                memberService.insert(member);
            }
            logger.info("发送邀请成功！");
            return AjaxResult.success("邀请成功用户ID:" + ids + "成功，请等待对方同意！");
        }
        return AjaxResult.error("邀请失败！");
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    protected TableDataInfo getDataTable(List<?> list)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(0);
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }
}
