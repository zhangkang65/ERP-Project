package com.dy.sys.mapper;

import com.dy.sys.entity.Leavebill;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Doris
 * @since 2020-03-28
 */
public interface LeavebillMapper extends BaseMapper<Leavebill> {
    void updateLeavebillState(@Param("state") Integer state, @Param("id") Integer id);
}
