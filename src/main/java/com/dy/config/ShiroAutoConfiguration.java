package com.dy.config;/**
 * ClassName:ShiroAutoConfiguration
 * Package:com.dy.config
 * Description:
 *
 * @Date:2020/3/13 17:04
 * @Author:Dong
 */

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import com.dy.shiro.UserRealm;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.servlet.DispatcherServletAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.DelegatingFilterProxy;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:ShiroAutoConfiguration
 */
@Configuration
@EnableConfigurationProperties(value = {ShiroProperties.class})
public class ShiroAutoConfiguration {
    @Autowired
    private ShiroProperties shiroProperties;

    /**
     * 创建凭证匹配器
     */
    @Bean
    public HashedCredentialsMatcher credentialsMatcher() {
        HashedCredentialsMatcher credentialsMatcher = new HashedCredentialsMatcher();
        credentialsMatcher.setHashAlgorithmName(this.shiroProperties.getHashAlgorithmName());
        credentialsMatcher.setHashIterations(this.shiroProperties.getHashIterations());
        return credentialsMatcher;
    }

    /**
     * 创建Realm
     */
    @Bean
    public UserRealm userRealm(CredentialsMatcher credentialsMatcher) {
        UserRealm userRealm = new UserRealm();
        userRealm.setCredentialsMatcher(credentialsMatcher);
        return userRealm;
    }

    /**
     * 创建安全管理器
     */
    @Bean("securityManager")
    public SecurityManager securityManager(UserRealm userRealm) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(userRealm);
        return securityManager;
    }

    /**
     * 创建Shiro过滤器Factory
     *
     * @param securityManager
     * @return
     */
    @Bean("shiroFilter")
    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager) {
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
        bean.setSecurityManager(securityManager);
        bean.setLoginUrl(shiroProperties.getLoginUrl());
        bean.setUnauthorizedUrl(shiroProperties.getUnauthorizedUrl());
        Map<String, String> filterChainDefinition = new HashMap<>();
        String[] anonUrls = shiroProperties.getAnonUrls();
        String[] authUrls = shiroProperties.getAuthUrls();
        String logoutUrl = shiroProperties.getLogoutUrl();
        if (anonUrls != null && anonUrls.length > 0) {
            for (String anonUrl : anonUrls) {
                filterChainDefinition.put(anonUrl, "anon");
            }
        }
        if (logoutUrl != null) {
            filterChainDefinition.put(logoutUrl, "logout");
        }
        if (authUrls != null && authUrls.length > 0) {
            for (String authUrl : authUrls) {
                filterChainDefinition.put(authUrl, "authc");
            }
        }
        bean.setFilterChainDefinitionMap(filterChainDefinition);
        return bean;
    }

    /**
     * 注册过滤器
     */
    @Bean
    public FilterRegistrationBean<DelegatingFilterProxy> delegatingFilterProxyFilterRegistrationBean() {
        FilterRegistrationBean<DelegatingFilterProxy> registrationBean = new FilterRegistrationBean<>();
        //创建过滤器
        DelegatingFilterProxy filterProxy = new DelegatingFilterProxy();
        registrationBean.setFilter(filterProxy);
        registrationBean.addInitParameter("targetFilterLifecycle", "true");
        registrationBean.addInitParameter("targetBeanName", "shiroFilter");
        Collection<String> servletNames = new ArrayList<>();
        servletNames.add(DispatcherServletAutoConfiguration.DEFAULT_DISPATCHER_SERVLET_BEAN_NAME);
        registrationBean.setServletNames(servletNames);
        return registrationBean;
    }

    /**
     * 这里是为了能在html页面引用shiro标签，上面两个函数必须添加，不然会报错
     */
    @Bean(name = "shiroDialect")
    public ShiroDialect shiroDialect() {
        return new ShiroDialect();
    }

}
