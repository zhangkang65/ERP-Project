package com.dy.sys.aspect;/**
 * ClassName:CacheAspect
 * Package:com.dy.sys.aspect
 * Description:
 *
 * @Date:2020/3/19 17:14
 * @Author:Dong
 */

import com.dy.common.CachePool;
import com.dy.sys.entity.Dept;
import com.dy.sys.vo.DeptVo;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;
import sun.misc.Cache;

import java.util.HashMap;
import java.util.Map;

/**
 * 切面缓存类
 * ClassName:CacheAspect
 */
@Aspect
@Component
public class SystemCacheAspect {
    //缓存容器
    private Map<String, Object> CACHE_CONTAINER = CachePool.CACHE_CONTAINER;

    //缓存前缀
    private static final String CACHE_DEPT_PROFIX = "dept:";

    //切入点
    public static final String POINTCUT_DEPT_UPDATE = "execution(* com.dy.sys.service.impl.DeptServiceImpl.updateById(..))";
    public static final String POINTCUT_DEPT_GET = "execution(* com.dy.sys.service.impl.DeptServiceImpl.getById(..))";
    public static final String POINTCUT_DEPT_DELETE = "execution(* com.dy.sys.service.impl.DeptServiceImpl.removeById(..))";

    //缓存切面-->查询
    @Around(POINTCUT_DEPT_GET)
    public Object cacheDeptGet(ProceedingJoinPoint point) throws Throwable {
        //得到参数
        Integer id = (Integer) point.getArgs()[0];
        if (CACHE_CONTAINER.containsKey(CACHE_DEPT_PROFIX + id)) {
            return CACHE_CONTAINER.get(CACHE_DEPT_PROFIX + id);
        }
        //放行
        Dept result = (Dept) point.proceed();
        //得到结果,存入缓存容器中
        CACHE_CONTAINER.put(CACHE_DEPT_PROFIX + result.getId(), result);
        return result;//返回值为切入方法的返回值
    }
    //缓存切面-->修改
    @Around(POINTCUT_DEPT_UPDATE)
    public Object cacheDeptUPDATE(ProceedingJoinPoint point) throws Throwable {
      //得到参数
        DeptVo deptVo= (DeptVo) point.getArgs()[0];
        //执行原方法
        Boolean result = (Boolean) point.proceed();
        //执行成功才进行缓存数据的更新
        if(result){
            Dept dept = (Dept) CACHE_CONTAINER.get(CACHE_DEPT_PROFIX + deptVo.getId());
            //如果容器中没有,创建赋值并存入
            if(dept==null){
                dept = new Dept();
            }
            //修改,将DeptVo中Dept有的属性赋给dept,两者有继承关系
            BeanUtils.copyProperties(deptVo,dept);
            CACHE_CONTAINER.put(CACHE_DEPT_PROFIX+dept.getId(),dept);
        }
        return result;
    }

    //缓存切面-->修改
    @Around(POINTCUT_DEPT_DELETE)
    public Object cacheDeptDELETE(ProceedingJoinPoint point) throws Throwable {
        //得到参数
        Integer id= (Integer) point.getArgs()[0];
        //执行原方法
        Boolean result = (Boolean) point.proceed();
        //执行成功,删除缓存数据
        if(result){
            CACHE_CONTAINER.remove(CACHE_DEPT_PROFIX+id);
        }
        return result;
    }
}








