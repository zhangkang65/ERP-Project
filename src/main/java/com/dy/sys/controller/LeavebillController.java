package com.dy.sys.controller;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.constast.SysConstast;
import com.dy.sys.entity.ActCommentEntity;
import com.dy.sys.entity.Leavebill;
import com.dy.sys.service.ILeavebillService;
import com.dy.sys.service.IProcessService;
import com.dy.sys.service.impl.LeavebillServiceImpl;
import com.dy.sys.service.impl.ProcessServiceImpl;
import com.dy.sys.vo.ActiveUser;
import com.dy.sys.vo.LeavebillVo;
import org.activiti.engine.RuntimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.management.Query;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Doris
 * @since 2020-03-28
 */
@RestController
@RequestMapping("/sys/leavebill")
public class LeavebillController {

    @Autowired
    private ILeavebillService leavebillServicee;
    @Autowired
    private IProcessService processService;

    @RequestMapping("loadLeavelbill")
    public DataGridView loadLeavelbill(HttpSession session, LeavebillVo leavebillVo) {
        String title = leavebillVo.getTitle();
        String content = leavebillVo.getContent();
        Date begintime = leavebillVo.getBegintime();
        Date endtime = leavebillVo.getEndtime();
        Integer userid = ((ActiveUser) session.getAttribute("user")).getUser().getId();
        IPage<Leavebill> page = new Page<>(leavebillVo.getPage(), leavebillVo.getLimit());
        QueryWrapper<Leavebill> queryWartpper = new QueryWrapper<>();
        queryWartpper.eq("userid", userid)
                .like(StringUtils.isNotBlank(title), "title", title)
                .like(StringUtils.isNotBlank(content), "content", content)
                .gt(begintime != null, "leavetime", begintime)
                .lt(endtime != null, "leavetime", endtime)
                .orderByDesc("leavetime");
        IPage<Leavebill> result = leavebillServicee.page(page, queryWartpper);
        List<Leavebill> leavebills = result.getRecords();
        for (Leavebill leavebill : leavebills) {
            switch (leavebill.getState()) {
                case 0:
                    leavebill.setStateString(SysConstast.LEAVEBILL_STATE_NEW_STRING);
                    break;
                case 1:
                    leavebill.setStateString(SysConstast.LEAVEBILL_STATE_AUDITING_STRING);
                    break;
                case 2:
                    leavebill.setStateString(SysConstast.LEAVEBILL_STATE_AUDITED_STRING);
                    break;
                case 3:
                    leavebill.setStateString(SysConstast.LEAVEBILL_STATE_QUIT_STRING);
                    break;
            }
        }
        return new DataGridView(result.getTotal(), leavebills);
    }

    @RequestMapping("deleteSingleLeavelbill")
    public ResultObj deleteSingleLeavelbill(Integer id) {
        try {
            leavebillServicee.removeById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    @RequestMapping("deleteBatchLeavelbill")
    public ResultObj deleteBatchLeavelbill(Integer[] ids) {
        try {
            leavebillServicee.removeByIds(Arrays.asList(ids));
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    @RequestMapping("addLeavelbill")
    public ResultObj addLeavelbill(LeavebillVo leavebillVo, HttpSession session) {
        leavebillVo.setState(SysConstast.LEAVEBILL_STATE_NEW);
        leavebillVo.setUserid(((ActiveUser) session.getAttribute("user")).getUser().getId());
        try {
            leavebillServicee.save(leavebillVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }

    @RequestMapping("updateLeavelbill")
    public ResultObj updateLeavelbill(LeavebillVo leavebillVo) {
        try {
            leavebillServicee.updateById(leavebillVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }

    /**
     * 提交请假申请
     * 启动流程
     * 指定第一个流程的办理人
     *
     * @param leavebillVo
     * @return
     */
    @RequestMapping("submitLeavebill")
    public ResultObj submitLeavebill(LeavebillVo leavebillVo, HttpSession session) {
        //办理人
        Integer userid = ((ActiveUser) session.getAttribute("user")).getUser().getId();
        //业务Key
        Integer id = leavebillVo.getId();
        return leavebillServicee.submitLeavebill(userid, id);
    }

    @RequestMapping("getHistoryCommentByLeavebillId")
    public DataGridView getHistoryCommentByLeavebillId(Integer id) {
        ArrayList<ActCommentEntity> comments = new ArrayList<>();
        List<ActCommentEntity> data = processService.getHistoryCommentByBusinessKey(id.toString());
        return new DataGridView(data);
    }

}

