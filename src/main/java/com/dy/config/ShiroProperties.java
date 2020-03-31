package com.dy.config;/**
 * ClassName:ShiroProperties
 * Package:com.dy.config
 * Description:
 *
 * @Date:2020/3/13 17:05
 * @Author:Dong
 */

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 *ClassName:ShiroProperties
 */
@ConfigurationProperties(prefix = "shiro")
@Data
public class ShiroProperties {
    private String hashAlgorithmName="md5";

    private Integer hashIterations=2;

    /*
     * 未登录跳转的登陆页面
     */
    private String loginUrl;
     /*
      * 未授权的登陆页面
      */
    private String unauthorizedUrl;
    /*
     * 放行的地址(不需要进行认证授权的地址)
     */
    private String[] anonUrls;
    /*
     * 注销的地址(一个)
     */
    private String logoutUrl;
    /*
     * 需要认证的地址
     */
    private String[] authUrls;

}
