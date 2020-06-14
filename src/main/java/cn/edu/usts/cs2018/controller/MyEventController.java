package cn.edu.usts.cs2018.controller;

import cn.edu.usts.cs2018.domain.AjaxResult;
import cn.edu.usts.cs2018.pojo.Event;
import cn.edu.usts.cs2018.pojo.Member;
import cn.edu.usts.cs2018.service.base.IEventService;
import cn.edu.usts.cs2018.service.base.IMemberService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Link Chen
 * @project Group
 * @description 用户中我的活动
 * @date 6/13/2020 11:23 AM
 */
@Controller
@RequestMapping("/myevent")
public class MyEventController
{

    @Autowired
    @Qualifier("eventService")
    private IEventService eventService;

    @Autowired
    @Qualifier("memberService")
    private IMemberService memberService;

    private Logger logger = LogManager.getLogger(MyEventController.class);

    /**
     * 返回个人参与的活动以及待加入的活动
     *
     * @return
     */
    @RequestMapping("/listall/{uid}")
    @ResponseBody
    public Map<String, Object> listAll(@PathVariable("uid") Integer uid)
    {
        List<Event> list = memberService.findAllEventsByUid(uid);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("rows", list);
        return map;
    }

    @RequestMapping("/listnotjoin")
    @ResponseBody
    public AjaxResult listNotJoin(Integer uid)
    {
        List<Event> notJoin = memberService.findNoByUid(uid);
        return AjaxResult.success(notJoin);
    }

    @RequestMapping("/accept")
    @ResponseBody
    public AjaxResult accept(Integer uid, Integer eventid)
    {
        List<Member> members = memberService.findByEid(eventid);
        for (Member m : members)
        {
            if (m.getUid().equals(uid))
            {
                m.setAccept(1);
                memberService.update(m);
                logger.info("加入成功！"+m.toString());
                return AjaxResult.success();
            }
        }
        return AjaxResult.error();
    }

    @RequestMapping("/refuse")
    @ResponseBody
    public AjaxResult refuse(Integer uid, Integer eventid)
    {
        int i = memberService.delete(eventid, uid);
        if (i > 0)
        {
            logger.info("删除成功！");
            return AjaxResult.success();
        }
        return AjaxResult.error();
    }
}
