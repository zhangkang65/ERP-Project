package com.dy.bus.mapper;

import com.dy.bus.entity.Goods;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Doris
 * @since 2020-03-22
 */
public interface GoodsMapper extends BaseMapper<Goods> {

    List<Goods> selectDangerGoods();
}
