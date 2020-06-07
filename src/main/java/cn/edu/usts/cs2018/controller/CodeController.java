package cn.edu.usts.cs2018.controller;

import cn.edu.usts.cs2018.utils.CreateCodeImage;
import cn.edu.usts.cs2018.utils.CreateVerifyCode;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Link Chen
 * @project Group
 * @description
 * @date 6/7/2020 5:42 PM
 */
@Controller
public class CodeController
{
    @RequestMapping("/getcode")
    public void getCode(HttpServletRequest request, HttpServletResponse resp) throws IOException
    {
        String verifyCode = CreateVerifyCode.getSecurityCode();
        request.getSession().setAttribute("verifycode", verifyCode);
        //设置返回的内容
        resp.setContentType("img/jpg");
        //浏览器不缓存响应内容--验证码图片，点一次就要刷新一次，所以不能有缓存出现
        resp.setHeader("Pragma", "No-cache");
        resp.setHeader("Cache-Control", "no-cache");
        //设置验证码失效时间
        resp.setDateHeader("Expires", 0);
        //以字节流发过去，交给img的src属性去解析即可
        ImageIO.write(new CreateCodeImage(verifyCode).createImage(), "jpg", resp.getOutputStream());
        Logger logger = Logger.getLogger(CodeController.class);
        logger.info("验证码创建成功:" + verifyCode);
    }
}
