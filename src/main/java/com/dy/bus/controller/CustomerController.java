package com.dy.bus.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dy.bus.entity.Customer;
import com.dy.bus.service.ICustomerService;
import com.dy.bus.vo.CustomerVo;
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
 *  前端控制器
 * </p>
 *
 * @author Doris
 * @since 2020-03-22
 */
@RestController
@RequestMapping("/bus/customer")
public class CustomerController {
    @Autowired
    private ICustomerService customerService;

    @RequestMapping("loadCustomer")
    public DataGridView loadCustomer(CustomerVo customerVo){
        QueryWrapper<Customer> queryWarpper = new QueryWrapper<>();
        String customername = customerVo.getCustomername();
        String telephone = customerVo.getTelephone();
        String connectionperson = customerVo.getConnectionperson();
        queryWarpper.eq("available", SysConstast.AVAILABLE)
                .like(StringUtils.isNotBlank(customername),"customername",customername)
                .like(StringUtils.isNotBlank(telephone),"telephone",telephone)
                .like(StringUtils.isNotBlank(connectionperson),"connectionperson",connectionperson);
        IPage<Customer> page = new Page<>(customerVo.getPage(),customerVo.getLimit());
        IPage<Customer> result = customerService.page(page, queryWarpper);
        return new DataGridView(result.getTotal(),result.getRecords());
    }
    @RequestMapping("addCustomer")
    public ResultObj addCustomer(CustomerVo customerVo){
        try {
            customerService.save(customerVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }
    @RequestMapping("updateCustomer")
    public ResultObj updateCustomer(CustomerVo customerVo){
        try {
            customerService.updateById(customerVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }
    @RequestMapping("deleteSingleCustomer")
    public ResultObj deleteSingleCustomer(Integer id){
        try {
            customerService.removeById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }
    @RequestMapping("deleteBatchCustomer")
    public ResultObj deleteBatchCustomer(Integer[] ids){
        try {
            customerService.removeByIds(Arrays.asList(ids));
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    @RequestMapping("getCustomer")
    public List<Customer> getCustomer(){
        return customerService.list();
    }

}

