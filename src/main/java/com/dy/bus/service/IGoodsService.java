package com.dy.bus.service;

import com.dy.bus.entity.Goods;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Doris
 * @since 2020-03-22
 */
public interface IGoodsService extends IService<Goods> {

    List<Goods> loadDangerGoods();
}
