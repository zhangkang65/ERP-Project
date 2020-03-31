package com.dy.sys.controller;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.entity.LogLogin;
import com.dy.sys.service.ILogLoginService;
import com.dy.sys.vo.LogLoginVo;
import org.apache.ibatis.annotations.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Doris
 * @since 2020-03-18
 */
@RestController
@RequestMapping("sys/loglogin")
public class LogLoginController {

    @Autowired
    private ILogLoginService logLoginService;

    /**
     * 删除单个登录日志
     * @param id
     * @return
     */
    @RequestMapping("deleteSingleLog")
    public ResultObj deleteSingleLog(Integer id){
        System.out.println(id);
        try {
            logLoginService.removeById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    /**
     * 批量删除日志
     * @param logLoginVo
     * @return
     */
    @RequestMapping("deleteBatchLog")
    public ResultObj deleteBatchLog(LogLoginVo logLoginVo){
        try {
            logLoginService.removeByIds(logLoginVo.getIds());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    /**
     * 查询登录日志
     * @param logLoginVo
     * @return
     */
    @RequestMapping("loadLog")
    public DataGridView loadLog(LogLoginVo logLoginVo){
        QueryWrapper<LogLogin> queryWarpper = new QueryWrapper<>();
        String loginname = logLoginVo.getLoginname();
        String loginip = logLoginVo.getLoginip();
        Date begintime = logLoginVo.getBegintime();
        Date endtime = logLoginVo.getEndtime();
        System.out.println(begintime);
        System.out.println(endtime);
        queryWarpper.like(loginname!=null&&loginname!="","loginname",loginname)
                .like(loginip!=null&&loginip!="","loginip",loginip)
                .ge(begintime!=null,"logintime",begintime)
                .le(endtime!=null,"logintime",endtime)
                .orderByDesc("logintime");
        IPage<LogLogin> page = new Page<>(logLoginVo.getPage(),logLoginVo.getLimit());
        logLoginService.page(page,queryWarpper);
        return new DataGridView(page.getTotal(),page.getRecords());
    }
}

