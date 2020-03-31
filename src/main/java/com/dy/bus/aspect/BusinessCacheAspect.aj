package com.dy.bus.aspect;

import com.dy.bus.entity.Customer;
import com.dy.bus.entity.Goods;
import com.dy.bus.entity.Provider;
import com.dy.common.CachePool;
import lombok.Data;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;

import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:BusinessCacheAspect
 * Package:com.dy.bus.aspect
 * Description:增删改的切面是更新缓存中内容,查是从缓存中获取内容
 * @Date:2020/3/23 11:13
 * @Author:Dong
 */
@Data
public class BusinessCacheAspect {
    /**
     * 日志出处
     */
    private Log log = LogFactory.getLog(BusinessCacheAspect.class);

    /**
     * 缓存容器
     */
    private Map<String,Object> cacheContainer = CachePool.CACHE_CONTAINER;

    /**
     * 商品切入点
     */
    public static final String POINTCUT_GOODS_GET="execution(* com.dy.bus.service.impl.GoodsServiceImpl.getById(..)";
    public static final String POINTCUT_GOODS_ADD="execution(* com.dy.bus.service.impl.GoodsServiceImpl.save(..)";
    public static final String POINTCUT_GOODS_UPDATE="execution(* com.dy.bus.service.impl.GoodsServiceImpl.updateById(..)";
    public static final String POINTCUT_GOODS_DELETE="execution(* com.dy.bus.service.impl.GoodsServiceImpl.removeById(..)";
    /**
     * 客户切入点
     */
    public static final String POINTCUT_CUSTOMER_GET="execution(* com.dy.bus.service.impl.CustomerServiceImpl.getById(..)";
    public static final String POINTCUT_CUSTOMER_ADD="execution(* com.dy.bus.service.impl.CustomerServiceImpl.save(..)";
    public static final String POINTCUT_CUSTOMER_UPDATE="execution(* com.dy.bus.service.impl.CustomerServiceImpl.updateById(..)";
    public static final String POINTCUT_CUSTOMER_DELETE="execution(* com.dy.bus.service.impl.CustomerServiceImpl.removeById(..)";
    /**
     * 供应商切入点
     */
    public static final String POINTCUT_PROVIDER_GET="execution(* com.dy.bus.service.impl.ProviderServiceImpl.getById(..)";
    public static final String POINTCUT_PROVIDER_ADD="execution(* com.dy.bus.service.impl.ProviderServiceImpl.save(..)";
    public static final String POINTCUT_PROVIDER_UPDATE="execution(* com.dy.bus.service.impl.ProviderServiceImpl.updateById(..)";
    public static final String POINTCUT_PROVIDER_DELETE="execution(* com.dy.bus.service.impl.ProviderServiceImpl.removeById(..)";

    public static final String CACHE_GOODS_PROFIX="goods:";
    public static final String CACHE_CUSTOMER_PROFIX="customer:";
    public static final String CACHE_PROVIDER_PROFIX="provider:";


    /**
     * 商品添加缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_GOODS_ADD)
    public Object cacheGoodsAdd(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取id
        Goods goods = (Goods) joinPoint.getArgs()[0];
        //执行后查看执行成功与否-->根据结果判断缓存处理
        Boolean result = (Boolean) joinPoint.proceed();
        if(result){
            cacheContainer.put(CACHE_GOODS_PROFIX+goods.getId(),goods);
        }
        return result;
    }
    /**
     * 商品修改缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_GOODS_UPDATE)
    public Object cacheGoodsUpdate(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取参数
        Goods goods = (Goods) joinPoint.getArgs()[0];
        //执行后查看执行成功与否-->根据结果判断缓存处理
        Boolean result = (Boolean) joinPoint.proceed();
        if(result){
            cacheContainer.put(CACHE_GOODS_PROFIX+goods.getId(),goods);
        }
        return result;
    }
    /**
     * 商品删除缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_GOODS_DELETE)
    public Object cacheGoodsDelete(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取参数
        Integer id = (Integer) joinPoint.getArgs()[0];
        //执行后查看执行成功与否-->根据结果判断缓存处理
        Boolean result = (Boolean) joinPoint.proceed();
        if(result){
            cacheContainer.remove(id);
        }
        return result;
    }
    /**
     * 商品查询缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_GOODS_GET)
    public Object cacheGoodsGet(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取参数
        Integer id = (Integer) joinPoint.getArgs()[0];
        //判断缓存中是否有
        Object o = cacheContainer.get(CACHE_GOODS_PROFIX + id);
        if (o != null) {
            return (Goods)o;
        }else{
            Goods goods = (Goods) joinPoint.proceed();
            cacheContainer.put(CACHE_GOODS_PROFIX+id,goods);
            log.info("未从缓存里面找到商品对象，去数据库查询并放到缓存"+CACHE_GOODS_PROFIX+id);
            return goods;
        }
    }
    /**
     * 客户添加缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_CUSTOMER_ADD)
    public Object cacheCustomerAdd(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取id
        Customer Customer = (Customer) joinPoint.getArgs()[0];
        //执行后查看执行成功与否-->根据结果判断缓存处理
        Boolean result = (Boolean) joinPoint.proceed();
        if(result){
            cacheContainer.put(CACHE_CUSTOMER_PROFIX+Customer.getId(),Customer);
        }
        return result;
    }
    /**
     * 客户修改缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_CUSTOMER_UPDATE)
    public Object cacheCustomerUpdate(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取参数
        Customer Customer = (Customer) joinPoint.getArgs()[0];
        //执行后查看执行成功与否-->根据结果判断缓存处理
        Boolean result = (Boolean) joinPoint.proceed();
        if(result){
            cacheContainer.put(CACHE_CUSTOMER_PROFIX+Customer.getId(),Customer);
        }
        return result;
    }
    /**
     * 客户删除缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_CUSTOMER_DELETE)
    public Object cacheCustomerDelete(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取参数
        Integer id = (Integer) joinPoint.getArgs()[0];
        //执行后查看执行成功与否-->根据结果判断缓存处理
        Boolean result = (Boolean) joinPoint.proceed();
        if(result){
            cacheContainer.remove(id);
        }
        return result;
    }
    /**
     * 客户查询缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_CUSTOMER_GET)
    public Object cacheCustomerGet(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取参数
        Integer id = (Integer) joinPoint.getArgs()[0];
        //判断缓存中是否有
        Object o = cacheContainer.get(CACHE_CUSTOMER_PROFIX + id);
        if (o != null) {
            return (Customer)o;
        }else{
            Customer Customer = (Customer) joinPoint.proceed();
            cacheContainer.put(CACHE_CUSTOMER_PROFIX+id,Customer);
            log.info("未从缓存里面找到客户对象，去数据库查询并放到缓存"+CACHE_CUSTOMER_PROFIX+id);
            return Customer;
        }
    }
    /**
     * 供应商添加缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_PROVIDER_ADD)
    public Object cacheProviderAdd(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取id
        Provider Provider = (Provider) joinPoint.getArgs()[0];
        //执行后查看执行成功与否-->根据结果判断缓存处理
        Boolean result = (Boolean) joinPoint.proceed();
        if(result){
            cacheContainer.put(CACHE_PROVIDER_PROFIX+Provider.getId(),Provider);
        }
        return result;
    }
    /**
     * 供应商修改缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_PROVIDER_UPDATE)
    public Object cacheProviderUpdate(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取参数
        Provider Provider = (Provider) joinPoint.getArgs()[0];
        //执行后查看执行成功与否-->根据结果判断缓存处理
        Boolean result = (Boolean) joinPoint.proceed();
        if(result){
            cacheContainer.put(CACHE_PROVIDER_PROFIX+Provider.getId(),Provider);
        }
        return result;
    }
    /**
     * 供应商删除缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_PROVIDER_DELETE)
    public Object cacheProviderDelete(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取参数
        Integer id = (Integer) joinPoint.getArgs()[0];
        //执行后查看执行成功与否-->根据结果判断缓存处理
        Boolean result = (Boolean) joinPoint.proceed();
        if(result){
            cacheContainer.remove(id);
        }
        return result;
    }
    /**
     * 供应商查询缓存切面
     * @param joinPoint
     * @return
     */
    @Around(value = POINTCUT_PROVIDER_GET)
    public Object cacheProviderGet(ProceedingJoinPoint joinPoint) throws Throwable {
        //执行前获取参数
        Integer id = (Integer) joinPoint.getArgs()[0];
        //判断缓存中是否有
        Object o = cacheContainer.get(CACHE_PROVIDER_PROFIX + id);
        if (o != null) {
            return (Provider)o;
        }else{
            Provider Provider = (Provider) joinPoint.proceed();
            cacheContainer.put(CACHE_PROVIDER_PROFIX+id,Provider);
            log.info("未从缓存里面找到供应商对象，去数据库查询并放到缓存"+CACHE_PROVIDER_PROFIX+id);
            return Provider;
        }
    }


}
