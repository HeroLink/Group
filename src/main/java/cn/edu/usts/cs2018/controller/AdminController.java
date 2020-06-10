package cn.edu.usts.cs2018.controller;

import cn.edu.usts.cs2018.domain.AjaxResult;
import cn.edu.usts.cs2018.page.Pagination;
import cn.edu.usts.cs2018.page.TableDataInfo;
import cn.edu.usts.cs2018.pojo.User;
import cn.edu.usts.cs2018.service.base.IUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.weaver.loadtime.Aj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/9/2020 4:02 PM
 */
@Controller
@RequestMapping("/admin")
public class AdminController
{
    @Autowired
    @Qualifier("userService")
    private IUserService userService;

    //    必须加/则会理解成相对路径
    private String prefix = "/admin";

    private Logger logger = LogManager.getLogger(AdminController.class);

    public IUserService getUserService()
    {
        return userService;
    }

    public void setUserService(IUserService userService)
    {
        this.userService = userService;
    }


    //    java.lang.IllegalStateException: Optional int parameter 'pageSize' is present but cannot be translated into a null value due to being declared as a primitive type. Consider declaring it as object wrapper for the corresponding primitive type.
    //    所以封装的时候使用Integer而不是int
    // 无法使用，因为js做了处理，必须要ajax消息状态码返回0
//    public Map<String, Object> list()
//    {
//        List<User> list = userService.findAll();
//        Map<String, Object> map = new HashMap<>();
//        map.put("rows", list);
//        return map;
//    }

    @RequestMapping("/list")
    @ResponseBody
    public TableDataInfo list(Pagination pagination, Integer uid, String username)
    {
        List<User> list = new ArrayList<>();
        if (pagination.getPageNum() != null && pagination.getPageSize() != null)
        {
            int pageNum = pagination.getPageNum();
            int pageSize = pagination.getPageSize();
            logger.info("分页信息：" + pagination);
            String orderBy = pagination.getOrderByColumn();
            // 此方法配合前端完成自动分页，需要在mybatis-config.xml中配置默认的拦截器
            PageHelper.startPage(pageNum, pageSize, orderBy);
            if (uid != null && "".equals(username))
            {
                logger.info("查询ID:" + uid);
                logger.info(userService.findByUid(uid));
                if (userService.findByUid(uid) == null)
                {
                    list = null;
                }
                else
                {
                    list.add(userService.findByUid(uid));
                }
            }
            if (!"".equals(username) && uid == null)
            {
                logger.info("查询用户名:" + username);
                logger.info(userService.findByUname(username));
                if (userService.findByUname(username) == null)
                {
                    list = null;
                }
                else
                {
                    list.add(userService.findByUname(username));
                }
            }
            if (uid != null && !"".equals(username))
            {
                logger.info("查询ID和用户名分别为:" + uid + "," + username);
                logger.info(userService.findByUidUname(uid, username));
                if (userService.findByUidUname(uid, username) == null)
                {
                    list = null;
                }
                else
                {
                    list.add(userService.findByUidUname(uid, username));
                }
            }
            if (uid == null && "".equals(username))
            {
                list = userService.findAll();
            }
        }
        else
        {
            list = userService.findAll();
        }
        return getDataTable(list);
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

    @RequestMapping("/add")
    @ResponseBody
    public AjaxResult add(User entity)
    {
        logger.info("请求添加的用户：" + entity);
        int i = userService.register(entity);
        if (i > 0)
        {
            logger.info("添加成功，获得ID：" + entity.getUid());
            return AjaxResult.success(entity.toString());
        }
        if (i == 0)
        {
            return AjaxResult.error("用户名已存在！");
        }
        return AjaxResult.error();
    }

    @GetMapping("/update/{uid}")
    public String update(@PathVariable("uid") Integer uid, ModelMap map)
    {
        User user = userService.findByUid(uid);
        map.put("user", user);
        logger.info("修改请求ID的用户信息：" + user);
        return prefix + "/update";
    }

    @PostMapping("/update")
    @ResponseBody
    public AjaxResult update(User entity)
    {
        logger.info("修改用户为：" + entity);
        int i = userService.update(entity);
        if (i > 0)
        {
            logger.info("修改成功：" + entity);
            return AjaxResult.success(entity.toString());
        }
        return AjaxResult.error();
    }

    @RequestMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        String[] list = ids.split(",");
        logger.info("删除请求的ID：" + ids);
        for (String s : list)
        {
            int result = userService.delete(Integer.valueOf(s));
            if (result <= 0)
            {
                return AjaxResult.error();
            }
        }
        logger.info("删除成功！");
        return AjaxResult.success();
    }
}
