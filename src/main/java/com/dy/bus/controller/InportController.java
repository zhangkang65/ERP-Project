package com.dy.bus.controller;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dy.bus.entity.Goods;
import com.dy.bus.entity.Inport;
import com.dy.bus.entity.Provider;
import com.dy.bus.service.IGoodsService;
import com.dy.bus.service.IInportService;
import com.dy.bus.service.IProviderService;
import com.dy.bus.vo.InportVo;
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
@RequestMapping("/bus/inport")
public class InportController {
    @Autowired
    private IInportService inportService;
    @Autowired
    private IProviderService providerService;
    @Autowired
    private IGoodsService goodsService;

    @RequestMapping("loadInport")
    public DataGridView loadInport(InportVo inportVo){
        Date begintime = inportVo.getBegintime();
        Date endtime = inportVo.getEndtime();
        Integer providerid = inportVo.getProviderid();
        Integer goodsid = inportVo.getGoodsid();
        QueryWrapper<Inport> queryWarpper = new QueryWrapper<>();
        queryWarpper.eq(providerid!=null&&providerid!=0,"providerid",providerid)
                .eq(goodsid!=null&&goodsid!=0,"goodsid",goodsid)
                .gt(begintime!=null,"inporttime",begintime)
                .lt(endtime!=null,"inporttime",endtime);
        IPage<Inport> page = new Page<>(inportVo.getPage(),inportVo.getLimit());
        IPage<Inport> result = inportService.page(page, queryWarpper);
        //返回供应商,商品名
        List<Provider> providerList = providerService.list();
        Map<Integer,Provider> providerMap = new HashMap<>();
        for (Provider provider : providerList) {
            providerMap.put(provider.getId(),provider);
        }
        List<Goods> goodsList = goodsService.list();
        Map<Integer,Goods> goodsMap = new HashMap<>();
        for (Goods goods : goodsList) {
            goodsMap.put(goods.getId(),goods);
        }
        List<Inport> inports = result.getRecords();
        for (Inport inport : inports) {
            inport.setProvidername(providerMap.get(inport.getProviderid()).getProvidername());
            inport.setGoodsname(goodsMap.get(inport.getGoodsid()).getGoodsname());
        }
        return new DataGridView(result.getTotal(),inports);
    }

    /**
     * 增加进货单
     * 增加商品
     * @param inportVo
     * @param session
     * @return
     */
    @RequestMapping("addInport")
    public ResultObj addInport(InportVo inportVo, HttpSession session){
        try {
            //增加进货单
            inportVo.setInporttime(new Date());
            String name = ((ActiveUser) session.getAttribute("user")).getUser().getName();
            inportVo.setOperateperson(name);
            inportService.save(inportVo);
            //修改商品数量
            Integer goodsid = inportVo.getGoodsid();
            Goods goods = goodsService.getById(goodsid);
            goods.setNumber(goods.getNumber()+inportVo.getNumber());
            goodsService.updateById(goods);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }
    @RequestMapping("updateInport")
    public ResultObj updateInport(InportVo inportVo){
        try {
            inportService.updateById(inportVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }

    @RequestMapping("deleteInport")
    public ResultObj deleteInport(Integer id){
        try {
            inportService.removeById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }
}

