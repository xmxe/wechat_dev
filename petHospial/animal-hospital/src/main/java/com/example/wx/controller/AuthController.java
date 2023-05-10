package com.example.wx.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.sys.common.ActiverUser;
import com.example.sys.common.ResultObj;
import com.example.sys.common.WebUtils;
import com.example.sys.domain.Loginfo;
import com.example.sys.domain.User;
import com.example.sys.service.UserService;
import com.example.wx.util.JacksonUtil;
import com.example.wx.util.ResponseUtil;
import com.example.wx.util.UserTokenManager;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 鉴权服务
 */
@RestController
@RequestMapping("/wx/auth")
@Validated
public class AuthController {

    @Autowired
    private UserService userService;


    @Value("${example.wx.app-id}")
    String wxspAppid;

    @Value("${example.wx.app-secret}")
    String wxspSecret;

    String grant_type = "authorization_code";

    /**
     * 账号登录
     *
     * @param body    请求内容，{ username: xxx, password: xxx }
     * @param request 请求对象
     * @return 登录结果
     */
    @PostMapping("login")
    public Object login(@RequestBody String body, HttpServletRequest request) {
        String username = JacksonUtil.parseString(body, "username");
        String password = JacksonUtil.parseString(body, "password");
        if (username == null || password == null) {
            return ResponseUtil.badArgument();
        }
        Subject subject = SecurityUtils.getSubject();
        AuthenticationToken authenticationToken=new UsernamePasswordToken(username, password);
        try {
            subject.login(authenticationToken);
            ActiverUser activerUser=(ActiverUser) subject.getPrincipal();

            WebUtils.getSession().setAttribute("user", activerUser.getUser());
            // token
            String token = UserTokenManager.generateToken(activerUser.getUser().getId());

            Map<Object, Object> result = new HashMap<Object, Object>();
            result.put("token", token);
            result.put("userInfo", activerUser.getUser());
            return ResponseUtil.ok(result);
        } catch (AuthenticationException e) {
            e.printStackTrace();
            return ResultObj.LOGIN_ERROR_PASS;
        }

        // userInfo


    }


}
