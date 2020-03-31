package com.dy.sys.service.impl;

import com.dy.common.ResultObj;
import com.dy.constast.SysConstast;
import com.dy.sys.entity.Leavebill;
import com.dy.sys.mapper.LeavebillMapper;
import com.dy.sys.service.ILeavebillService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author Doris
 * @since 2020-03-28
 */
@Service
@Transactional
public class LeavebillServiceImpl extends ServiceImpl<LeavebillMapper, Leavebill> implements ILeavebillService {

    @Autowired
    private ProcessServiceImpl processService;
    @Autowired
    private LeavebillMapper leavebillMapper;

    @Override
    public ResultObj submitLeavebill(Integer userId, Integer leavebillId) {
        try {
            //启动流程
            processService.startProcess(SysConstast.PROCESSDEFINITION_KEY_LEAVEBILL, userId, leavebillId);
            //修改请假单状态为审核中
            leavebillMapper.updateLeavebillState(SysConstast.LEAVEBILL_STATE_AUDITING, leavebillId);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.SUBMIT_ERROR;
        }
        return ResultObj.SUBMIT_SUCCESS;
    }
}
