package cn.edu.usts.cs2018.controller;

import cn.edu.usts.cs2018.domain.AjaxResult;
import cn.edu.usts.cs2018.page.Pagination;
import cn.edu.usts.cs2018.page.TableDataInfo;
import cn.edu.usts.cs2018.pojo.Event;
import cn.edu.usts.cs2018.pojo.Event;
import cn.edu.usts.cs2018.service.base.IEventService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/10/2020 1:17 PM
 */
@Controller
@RequestMapping("/event")
public class EventController
{
    @Autowired
    @Qualifier("eventService")
    private IEventService eventService;

    private String prefix = "/event";

    private Logger logger = LogManager.getLogger(EventController.class);

    public IEventService getEventService()
    {
        return eventService;
    }

    public void setEventService(IEventService eventService)
    {
        this.eventService = eventService;
    }


    /**
     * 日期格式设置
     *
     * @param request
     * @param binder
     */
    @InitBinder
    protected void init(HttpServletRequest request, ServletRequestDataBinder binder)
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    }

    /**
     * 分页活动列表
     *
     * @param pagination
     * @param eventid
     * @param eventname
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public TableDataInfo list(Pagination pagination, Integer eventid, String eventname)
    {
        List<Event> list = new ArrayList<>();
        if (pagination.getPageNum() != null && pagination.getPageSize() != null)
        {
            int pageNum = pagination.getPageNum();
            int pageSize = pagination.getPageSize();
            logger.info("分页信息：" + pagination);
            String orderBy = pagination.getOrderByColumn();
            // 此方法配合前端完成自动分页，需要在mybatis-config.xml中配置默认的拦截器
            PageHelper.startPage(pageNum, pageSize, orderBy);
            if (eventid != null && "".equals(eventname))
            {
                logger.info("查询活动ID:" + eventid);
                logger.info(eventService.findByEventId(eventid));
                if (eventService.findByEventId(eventid) == null)
                {
                    list = new ArrayList<>();
                }
                else
                {
                    list.add(eventService.findByEventId(eventid));
                }
            }
            if (!"".equals(eventname) && eventid == null)
            {
                logger.info("查询活动名:" + eventname);
                logger.info(eventService.findByName(eventname));
                if (eventService.findByName(eventname) == null)
                {
                    list = new ArrayList<>();
                }
                else
                {
                    list = eventService.findByName(eventname);
                }
            }
            if (eventid != null && !"".equals(eventname))
            {
                logger.info("查询活动ID和活动名分别为:" + eventid + "," + eventname);
                logger.info(eventService.findByEidEname(eventid, eventname));
                if (eventService.findByEidEname(eventid, eventname) == null)
                {
                    list = new ArrayList<>();
                }
                else
                {
                    list.add(eventService.findByEidEname(eventid, eventname));
                }
            }
            if (eventid == null && "".equals(eventname))
            {
                list = eventService.findAll();
            }
        }
        else
        {
            list = eventService.findAll();
        }
        return getDataTable(list);
    }

    /**
     * 返回分页列表
     *
     * @param list
     * @return
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    protected TableDataInfo getDataTable(List<?> list)
    {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(0);
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

    @RequestMapping("/add")
    @ResponseBody
    public AjaxResult add(Event entity)
    {
        logger.info("请求添加的活动：" + entity);
        int i = eventService.insert(entity);
        if (i > 0)
        {
            logger.info("添加成功，获得ID：" + entity.getEventid());
            return AjaxResult.success(entity.toString());
        }
        return AjaxResult.error();
    }

    /**
     * 更新活动get
     *
     * @param eventid
     * @param map
     * @return
     */
    @GetMapping("/update/{eventid}")
    public String update(@PathVariable("eventid") Integer eventid, ModelMap map)
    {
        Event event = eventService.findByEventId(eventid);
        map.put("event", event);
        logger.info("修改请求ID的活动信息：" + event);
        return prefix + "/update";
    }

    /**
     * 更新活动post
     *
     * @param entity
     * @return
     */
    @PostMapping("/update")
    @ResponseBody
    public AjaxResult update(Event entity)
    {
        logger.info("修改活动为：" + entity);
        int i = eventService.update(entity);
        if (i > 0)
        {
            logger.info("修改成功：" + entity);
            return AjaxResult.success(entity.toString());
        }
        return AjaxResult.error();
    }

    /**
     * 删除活动
     *
     * @param ids
     * @return
     */
    @RequestMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        String[] list = ids.split(",");
        logger.info("删除请求的ID：" + ids);
        for (String s : list)
        {
            int result = eventService.delete(Integer.valueOf(s));
            if (result <= 0)
            {
                return AjaxResult.error();
            }
        }
        logger.info("删除成功！");
        return AjaxResult.success();
    }
}
