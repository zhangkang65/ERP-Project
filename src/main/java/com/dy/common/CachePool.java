package com.dy.common;/**
 * ClassName:CachePool
 * Package:com.dy.common
 * Description:
 *
 * @Date:2020/3/24 17:03
 * @Author:Dong
 */

import com.dy.bus.entity.Customer;
import com.dy.bus.entity.Goods;
import com.dy.bus.entity.Provider;
import com.dy.bus.mapper.CustomerMapper;
import com.dy.bus.mapper.GoodsMapper;
import com.dy.bus.mapper.ProviderMapper;
import com.dy.sys.entity.Dept;
import com.dy.sys.entity.User;
import com.dy.sys.mapper.DeptMapper;
import com.dy.sys.mapper.UserMapper;
import lombok.Data;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 *ClassName:CachePool
 */
public class CachePool {
    /**
     *所有缓存数据集中于这个CACHE_CONTAINER中,类似于Redis
     */
    public static Map<String, Object> CACHE_CONTAINER = new ConcurrentHashMap<>();

    /**
     * 删除单个缓存
     */
    public static void removeCacheByKey(String key){
        if(CACHE_CONTAINER.containsKey(key)){
            CACHE_CONTAINER.remove(key);
        }
    }

    /**
     * 清除所有缓存
     */
    public static void removeAll(){
        CACHE_CONTAINER.clear();
    }

    /**
     * 同步缓存
     */
    public static void syncData() {
        //同步部门数据
        DeptMapper deptMapper = SpringUtils.getBean(DeptMapper.class);
        List<Dept> deptList = deptMapper.selectList(null);
        for (Dept dept : deptList) {
            CACHE_CONTAINER.put("dept:"+dept.getId(), dept);
        }
        //同步用户数据
        UserMapper userMapper = SpringUtils.getBean(UserMapper.class);
        List<User> userList = userMapper.selectList(null);
        for (User user : userList) {
            CACHE_CONTAINER.put("user:"+user.getId(), user);
        }
        //同步客户数据
        CustomerMapper customerMapper = SpringUtils.getBean(CustomerMapper.class);
        List<Customer> customerList = customerMapper.selectList(null);
        for (Customer customer : customerList) {
            CACHE_CONTAINER.put("customer:"+customer.getId(), customer);
        }
        //同步供应商数据
        ProviderMapper providerMapper = SpringUtils.getBean(ProviderMapper.class);
        List<Provider> providerList = providerMapper.selectList(null);
        for (Provider provider : providerList) {
            CACHE_CONTAINER.put("customer:"+provider.getId(), provider);
        }
        //同步商品数据
        GoodsMapper goodsMapper=SpringUtils.getBean(GoodsMapper.class);
        List<Goods> goodsList = goodsMapper.selectList(null);
        for (Goods goods : goodsList) {
            CACHE_CONTAINER.put("goods:"+goods.getId(), goods);
        }
    }





}
