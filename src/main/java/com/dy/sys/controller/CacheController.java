package com.dy.sys.controller;/**
 * ClassName:CacheController
 * Package:com.dy.sys.controller
 * Description:
 *
 * @Date:2020/3/24 17:31
 * @Author:Dong
 */

import com.dy.common.CachePool;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.utils.CacheBean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import sun.misc.Cache;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *ClassName:CacheController
 */
@RestController
@RequestMapping("sys/cache")
public class CacheController {

    //因为返回的是Json字符串,而直接返回的Map不合适,需要中间CacheBean进行值的过度

    /**
     * 查询所有缓存
     * @return
     */
    @RequestMapping("loadCache")
    public DataGridView loadCache(){
        List<CacheBean> result = new LinkedList<>();
        Map<String, Object> cacheContainer = CachePool.CACHE_CONTAINER;
        Set<Map.Entry<String, Object>> entries = cacheContainer.entrySet();
        for (Map.Entry<String, Object> entry : entries) {
            result.add(new CacheBean(entry.getKey(),entry.getValue()));
        }
        return new DataGridView(result);
    }

    /**
     * 清除所有缓存
     * @return
     */
    @RequestMapping("clearCache")
    public ResultObj clearCache(){
        try {
            CachePool.removeAll();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    /**
     * 删除缓存
     */
    @RequestMapping("deleteCache")
    public ResultObj deleteCache(String key) {
        try {
            CachePool.removeCacheByKey(key);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    /**
     * 同步缓存
     */
    @RequestMapping("syncCache")
    public ResultObj syncCache() {
        try {
            CachePool.syncData();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.OPERATE_ERROR;
        }
        return ResultObj.OPERATE_SUCCESS;
    }


}
