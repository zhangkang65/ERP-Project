package com.dy.bus.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dy.bus.entity.Customer;
import com.dy.bus.entity.Goods;
import com.dy.bus.entity.Sales;
import com.dy.bus.service.ICustomerService;
import com.dy.bus.service.IGoodsService;
import com.dy.bus.service.ISalesService;
import com.dy.bus.vo.SalesVo;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.vo.ActiveUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Doris
 * @since 2020-03-22
 */
@RestController
@RequestMapping("/bus/sales")
public class SalesController {
    @Autowired
    private ISalesService salesService;
    @Autowired
    private ICustomerService customerService;
    @Autowired
    private IGoodsService goodsService;

    @RequestMapping("loadSales")
    public DataGridView loadSales(SalesVo salesVo) {
        Date begintime = salesVo.getBegintime();
        Date endtime = salesVo.getEndtime();
        Integer customerid = salesVo.getCustomerid();
        Integer goodsid = salesVo.getGoodsid();
        QueryWrapper<Sales> queryWarpper = new QueryWrapper<>();
        queryWarpper.eq(customerid != null && customerid != 0, "customerid", customerid)
                .eq(goodsid != null && goodsid != 0, "goodsid", goodsid)
                .gt(begintime != null, "salestime", begintime)
                .lt(endtime != null, "salestime", endtime);
        IPage<Sales> page = new Page<>(salesVo.getPage(), salesVo.getLimit());
        IPage<Sales> result = salesService.page(page, queryWarpper);
        //返回客户,商品名
        List<Customer> customerList = customerService.list();
        Map<Integer, Customer> customerMap = new HashMap<>();
        for (Customer customer : customerList) {
            customerMap.put(customer.getId(), customer);
        }
        List<Goods> goodsList = goodsService.list();
        Map<Integer, Goods> goodsMap = new HashMap<>();
        for (Goods goods : goodsList) {
            goodsMap.put(goods.getId(), goods);
        }
        List<Sales> saless = result.getRecords();
        for (Sales sales : saless) {
            sales.setCustomername(customerMap.get(sales.getCustomerid()).getCustomername());
            sales.setGoodsname(goodsMap.get(sales.getGoodsid()).getGoodsname());
        }
        return new DataGridView(result.getTotal(), saless);
    }

    /**
     * 增加销售单
     * 增加商品
     *
     * @param salesVo
     * @param session
     * @return
     */
    @RequestMapping("addSales")
    public ResultObj addSales(SalesVo salesVo, HttpSession session) {
        try {
            //增加销售单
            salesVo.setSalestime(new Date());
            String name = ((ActiveUser) session.getAttribute("user")).getUser().getName();
            salesVo.setOperateperson(name);
            salesService.save(salesVo);
            //修改商品数量
            Integer goodsid = salesVo.getGoodsid();
            Goods goods = goodsService.getById(goodsid);
            goods.setNumber(goods.getNumber() - salesVo.getNumber());
            goodsService.updateById(goods);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }

    @RequestMapping("updateSales")
    public ResultObj updateSales(SalesVo salesVo) {
        try {
            salesService.updateById(salesVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }

    @RequestMapping("deleteSales")
    public ResultObj deleteSales(Integer id) {
        try {
            salesService.removeById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

}

