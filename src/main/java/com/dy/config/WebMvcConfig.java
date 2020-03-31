package com.dy.config;/**
 * ClassName:WebMvcConfig
 * Package:com.dy.config
 * Description:
 *
 * @Date:2020/3/13 18:15
 * @Author:Dong
 */

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * ClassName:WebMvcConfig
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login/toLogin")
                .setViewName("system/login");
        registry.addViewController("/index/toIndex")
                .setViewName("system/index");
        registry.addViewController("/index/toDeskManager")
                .setViewName("system/deskManager");

        registry.addViewController("/sys/toMenuManager")
                .setViewName("system/menu/menuManager");
        registry.addViewController("/sys/loadMenuManagerLeft")
                .setViewName("system/menu/menuManagerLeft");
        registry.addViewController("/sys/loadMenuManagerRight")
                .setViewName("system/menu/menuManagerRight");

        registry.addViewController("/sys/toDeptManager")
                .setViewName("system/dept/deptManager");
        registry.addViewController("/sys/loadDeptManagerLeft")
                .setViewName("system/dept/deptManagerLeft");
        registry.addViewController("/sys/loadDeptManagerRight")
                .setViewName("system/dept/deptManagerRight");

        registry.addViewController("/sys/toCacheManager")
                .setViewName("system/cache/cacheManager");

        registry.addViewController("/sys/toPermissionManager")
                .setViewName("system/permission/permissionManager");
        registry.addViewController("/sys/loadPermissionManagerRight")
                .setViewName("system/permission/permissionManagerRight");

        registry.addViewController("/sys/toLogLoginManager")
                .setViewName("system/log/logLoginManager");
        registry.addViewController("/sys/toNoticeManager")
                .setViewName("system/notice/noticeManager");
        registry.addViewController("/sys/toRoleManager")
                .setViewName("system/role/roleManager");
        registry.addViewController("/sys/toUserManager")
                .setViewName("system/user/userManager");
        registry.addViewController("/sys/toUserInfo")
                .setViewName("system/user/userInfo");
        registry.addViewController("/sys/toChangePwd")
                .setViewName("system/user/changePwd");

        registry.addViewController("/bus/toCustomerManager")
                .setViewName("business/customer/customerManager");
        registry.addViewController("/bus/toProviderManager")
                .setViewName("business/provider/providerManager");
        registry.addViewController("/bus/toGoodsManager")
                .setViewName("business/goods/goodsManager");
        registry.addViewController("/bus/toInportManager")
                .setViewName("business/inport/inportManager");
        registry.addViewController("/bus/toExportManager")
                .setViewName("business/export/exportManager");
        registry.addViewController("/bus/toSalesManager")
                .setViewName("business/sales/salesManager");
        registry.addViewController("/bus/toSalesbackManager")
                .setViewName("business/salesback/salesbackManager");

        registry.addViewController("/sys/toLeavebillManager")
                .setViewName("system/leavebill/leavebillManager");
        registry.addViewController("/sys/toProcessManager")
                .setViewName("system/process/processManager");
        registry.addViewController("/sys/toTaskManager")
                .setViewName("system/task/taskManager");
        registry.addViewController("/sys/toAuditManager")
                .setViewName("system/audit/auditManager");
    }
}
