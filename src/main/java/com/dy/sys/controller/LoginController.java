package com.dy.sys.controller;/**
 * ClassName:LoginController
 * Package:com.dy.sys.controller
 * Description:
 *
 * @Date:2020/3/17 10:02
 * @Author:Dong
 */

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.ShearCaptcha;
import com.dy.common.ResultObj;
import com.dy.sys.entity.LogLogin;
import com.dy.sys.entity.User;
import com.dy.sys.service.ILogLoginService;
import com.dy.common.WebUtils;
import com.dy.sys.vo.ActiveUser;
import com.dy.sys.vo.UserVo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

/**
 *ClassName:LoginController
 */
@RequestMapping("login")
@RestController
public class LoginController {
    @Autowired
    private ILogLoginService logLoginService;
    /**
     * 登录
     * @param userVo
     * @param session
     * @return
     */
    @RequestMapping("login")
    public ResultObj login(UserVo userVo, HttpSession session){
        String validation = userVo.getValidation();
        String trueValidation = (String) session.getAttribute("validation");
        //验证验证码
        if (validation.equals(trueValidation)) {
            Subject subject = SecurityUtils.getSubject();
            AuthenticationToken authenticationToken = new UsernamePasswordToken(userVo.getLoginname(),userVo.getPwd());
            try {
                //登录-->shiro作为中间
                subject.login(authenticationToken);
                ActiveUser user = (ActiveUser) subject.getPrincipal();
                System.out.println("========="+user.getUser().getPwd());
                //session记录当前user
                session.setAttribute("user",user);
                //日志记录登陆记录
                User u = user.getUser();
                LogLogin logLogin = new LogLogin();
                logLogin.setLoginname(u.getName()+"-"+u.getLoginname());
                logLogin.setLoginip(WebUtils.getRequestIp());
                logLogin.setLogintime(new Date());
                logLoginService.save(logLogin);
            } catch (AuthenticationException e) {
                e.printStackTrace();
                return ResultObj.LOGIN_NAMEPWD_ERROR;
            }
        }else{
            return ResultObj.LOGIN_VALIDATION_ERROR;
        }
        return ResultObj.LOGIN_SUCCESS;
    }

    /**
     * 获取验证码图片
     * @throws IOException
     */
    @RequestMapping("getValidation")
    public void getCode(HttpServletResponse response, HttpSession session) throws IOException {
        //获取验证码图片,返回给response
        ShearCaptcha captcha = CaptchaUtil.createShearCaptcha(116, 36, 4, 3);
        ServletOutputStream outputStream = response.getOutputStream();
        //将生成的验证码图片放入到响应流中
        ImageIO.write(captcha.getImage(), "JPEG", outputStream);
        //获取验证码结果,放到session中,登录时进行比对
        session.setAttribute("validation",captcha.getCode());
        System.out.println(captcha.getCode());
    }

}
