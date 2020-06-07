package cn.edu.usts.cs2018.controller;

import cn.edu.usts.cs2018.domain.AjaxResult;
import cn.edu.usts.cs2018.pojo.User;
import cn.edu.usts.cs2018.service.base.IUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    private Logger logger = Logger.getLogger(UserController.class);

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
                // 0：管理员，1：用户
                if (user.getIdentity() == 0)
                {
                    return AjaxResult.success((Object) "admin");
                }
                else
                {
                    return AjaxResult.success((Object) "user");
                }
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


    public String register()
    {
        return "error";
    }
}
