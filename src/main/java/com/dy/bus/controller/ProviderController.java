package com.dy.bus.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dy.bus.entity.Provider;
import com.dy.bus.service.IProviderService;
import com.dy.bus.vo.ProviderVo;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.constast.SysConstast;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Doris
 * @since 2020-03-22
 */
@RestController
@RequestMapping("/bus/provider")
public class ProviderController {
    @Autowired
    private IProviderService providerService;

    @RequestMapping("loadProvider")
    public DataGridView loadProvider(ProviderVo providerVo) {
        QueryWrapper<Provider> queryWarpper = new QueryWrapper<>();
        String providername = providerVo.getProvidername();
        String telephone = providerVo.getTelephone();
        String connectionperson = providerVo.getConnectionperson();
        queryWarpper.eq("available", SysConstast.AVAILABLE)
                .like(StringUtils.isNotBlank(providername),"providername",providername)
                .like(StringUtils.isNotBlank(telephone),"telephone",telephone)
                .like(StringUtils.isNotBlank(connectionperson),"connectionperson",connectionperson);
        IPage<Provider> page = new Page<>(providerVo.getPage(), providerVo.getLimit());
        IPage<Provider> result = providerService.page(page, queryWarpper);
        return new DataGridView(result.getTotal(), result.getRecords());
    }

    @RequestMapping("addProvider")
    public ResultObj addProvider(ProviderVo providerVo) {
        try {
            providerService.save(providerVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }

    @RequestMapping("updateProvider")
    public ResultObj updateProvider(ProviderVo providerVo) {
        try {
            providerService.updateById(providerVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }

    @RequestMapping("deleteSingleProvider")
    public ResultObj deleteSingleProvider(Integer id) {
        try {
            providerService.removeById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    @RequestMapping("deleteBatchProvider")
    public ResultObj deleteBatchProvider(Integer[] ids) {
        try {
            providerService.removeByIds(Arrays.asList(ids));
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }
    @RequestMapping("getProvider")
    public List<Provider> getProvider(Integer[] ids) {
        return providerService.list();
    }


}

