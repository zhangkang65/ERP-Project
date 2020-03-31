package com.dy.sys.service;

import com.dy.common.ResultObj;
import com.dy.sys.entity.Leavebill;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Doris
 * @since 2020-03-28
 */
public interface ILeavebillService extends IService<Leavebill> {

    ResultObj submitLeavebill(Integer userId,Integer leavebillId);

}
