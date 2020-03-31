package com.dy.bus.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dy.bus.entity.Salesback;
import com.dy.bus.entity.Goods;
import com.dy.bus.entity.Customer;
import com.dy.bus.entity.Salesback;
import com.dy.bus.service.ICustomerService;
import com.dy.bus.service.IGoodsService;
import com.dy.bus.service.ISalesbackService;
import com.dy.bus.vo.SalesbackVo;
import com.dy.bus.vo.SalesbackVo;
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
 *  前端控制器
 * </p>
 *
 * @author Doris
 * @since 2020-03-22
 */
@RestController
@RequestMapping("/bus/salesback")
public class SalesbackController {
    
    @Autowired
    private ISalesbackService salesbackService;
    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private ICustomerService customerService;

    /**
     * 客户退货
     * @param salesbackVo
     * @param session
     * @return
     */
    @RequestMapping("addSalesback")
    public ResultObj addSalesback(SalesbackVo salesbackVo, HttpSession session){
        Goods goods = goodsService.getById(salesbackVo.getGoodsid());
        //退货数量校验
        if(goods.getNumber()<salesbackVo.getNumber()){
            return ResultObj.EXPORT_GOODS_SHORT;
        }
        try {
            //退货单添加退货信息
            salesbackVo.setSalesbacktime(new Date());
            String name = ((ActiveUser) session.getAttribute("user")).getUser().getName();
            salesbackVo.setOperateperson(name);
            //商品数量增加
            Integer number = salesbackVo.getNumber();

            goods.setNumber(goods.getNumber()+number);
            salesbackService.save(salesbackVo);
            goodsService.updateById(goods);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.EXPORT_ERROR;
        }
        return ResultObj.EXPORT_SUCCESS;
    }
    @RequestMapping("loadSalesback")
    public DataGridView loadSalesback(SalesbackVo salesbackVo){
        Date begintime = salesbackVo.getBegintime();
        Date endtime = salesbackVo.getEndtime();
        Integer customerid = salesbackVo.getCustomerid();
        Integer goodsid = salesbackVo.getGoodsid();
        QueryWrapper<Salesback> queryWarpper = new QueryWrapper<>();
        queryWarpper.eq(customerid!=null&&customerid!=0,"customerid",customerid)
                .eq(goodsid!=null&&goodsid!=0,"goodsid",goodsid)
                .gt(begintime!=null,"begintime",begintime)
                .lt(endtime!=null,"endtime",endtime);
        IPage<Salesback> page = new Page<>(salesbackVo.getPage(),salesbackVo.getLimit());
        IPage<Salesback> result = salesbackService.page(page, queryWarpper);
        //返回供应商,商品名
        List<Customer> customerList = customerService.list();
        Map<Integer,Customer> customerMap = new HashMap<>();
        for (Customer customer : customerList) {
            customerMap.put(customer.getId(),customer);
        }
        List<Goods> goodsList = goodsService.list();
        Map<Integer,Goods> goodsMap = new HashMap<>();
        for (Goods goods : goodsList) {
            goodsMap.put(goods.getId(),goods);
        }
        List<Salesback> salesbacks = result.getRecords();
        for (Salesback salesback : salesbacks) {
            salesback.setCustomername(customerMap.get(salesback.getCustomerid()).getCustomername());
            salesback.setGoodsname(goodsMap.get(salesback.getGoodsid()).getGoodsname());
        }
        return new DataGridView(result.getTotal(),salesbacks);
    }

    @RequestMapping("deleteSalesback")
    public ResultObj deleteSalesback(Integer id){
        try {
            salesbackService.removeById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }
}

