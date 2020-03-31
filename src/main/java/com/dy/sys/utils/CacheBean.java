package com.dy.sys.utils;/**
 * ClassName:CacheBean
 * Package:com.dy.sys.utils
 * Description:
 *
 * @Date:2020/3/24 17:31
 * @Author:Dong
 */

import com.alibaba.fastjson.JSON;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 *ClassName:CacheBean
 */
@AllArgsConstructor
@NoArgsConstructor
public class CacheBean {
    private String key;
    private Object value;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Object getValue() {
        return JSON.toJSON(value).toString();
    }

    public void setValue(Object value) {
        this.value = value;
    }
}
