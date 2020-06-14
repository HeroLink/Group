package cn.edu.usts.cs2018.controller;

import cn.edu.usts.cs2018.domain.AjaxResult;
import cn.edu.usts.cs2018.pojo.User;
import cn.edu.usts.cs2018.service.base.IUserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.naming.event.ObjectChangeListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/7/2020 3:00 PM
 */
@Controller
@RequestMapping("/user")
public class UserController
{
    @Autowired
    @Qualifier("userService")
    private IUserService userService;

    private String prefix = "/common";

    private Logger logger = LogManager.getLogger(UserController.class);

    public IUserService getUserService()
    {
        return userService;
    }

    public void setUserService(IUserService userService)
    {
        this.userService = userService;
    }

    @RequestMapping("/login")
    @ResponseBody
    public AjaxResult login(User entity, HttpServletRequest request, String validateCode, Boolean rememberMe)
    {
//        logger.info("请求已到达！");
//        String getcode=request.getParameter("validateCode");
//        logger.info("请求的验证码为：" + validateCode);
//        logger.info("是否保存密码：" + rememberMe);
        String verifycode = (String) request.getSession().getAttribute("verifycode");
        request.getSession().removeAttribute("verifyCode");
        if (Objects.equals(validateCode, verifycode))
        {
            User user = userService.login(entity);
            if (user != null)
            {
                logger.info("登陆成功！" + user.toString());
                request.getSession().setAttribute("user", user);
                // 0：管理员，1：用户
                if (user.getIdentity() == 0)
                {
                    return AjaxResult.success((Object) "admin");
                }
                return AjaxResult.success((Object) "user");
            }
            else
            {
                return AjaxResult.error("用户名或密码错误！");
            }
        }
        else
        {
            return AjaxResult.error("验证码错误！");
        }
    }

    @RequestMapping("/register")
    @ResponseBody
    public AjaxResult register(User entity, HttpServletRequest request, String validateCode)
    {
        String verifycode = (String) request.getSession().getAttribute("verifycode");
        request.getSession().removeAttribute("verifyCode");
        if (Objects.equals(validateCode, verifycode))
        {
            entity.setIdentity(1);
            int i = userService.register(entity);
            if (i > 0)
            {
                logger.info("注册成功！" + entity.toString());
                return AjaxResult.success();
            }
            else
            {
                if (i == 0)
                {
                    return AjaxResult.error("注册失败，用户名已存在！");
                }
                else
                {
                    return AjaxResult.error("注册失败！请联系管理员查找原因！");
                }
            }
        }
        else
        {
            return AjaxResult.error("验证码错误！");
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request)
    {
        request.getSession().invalidate();
        return prefix + "/login";
    }
}
