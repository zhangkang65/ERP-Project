package com.dy.bus.controller;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dy.bus.entity.Export;
import com.dy.bus.entity.Goods;
import com.dy.bus.entity.Inport;
import com.dy.bus.entity.Provider;
import com.dy.bus.service.IExportService;
import com.dy.bus.service.IGoodsService;
import com.dy.bus.service.IProviderService;
import com.dy.bus.vo.ExportVo;
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
@RequestMapping("/bus/export")
public class ExportController {

    @Autowired
    private IExportService exportService;
    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private IProviderService providerService;

    @RequestMapping("addExport")
    public ResultObj addExport(ExportVo exportVo, HttpSession session){
        Goods goods = goodsService.getById(exportVo.getGoodsid());
        //退货数量校验
        if(goods.getNumber()<exportVo.getNumber()){
            return ResultObj.EXPORT_GOODS_SHORT;
        }
        try {
            //退货单添加退货信息
            exportVo.setExporttime(new Date());
            String name = ((ActiveUser) session.getAttribute("user")).getUser().getName();
            exportVo.setOperateperson(name);
            //商品数量减少
            Integer goodsid = exportVo.getGoodsid();
            Integer number = exportVo.getNumber();

            goods.setNumber(goods.getNumber()-number);
            exportService.save(exportVo);
            goodsService.updateById(goods);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.EXPORT_ERROR;
        }
        return ResultObj.EXPORT_SUCCESS;
    }

    @RequestMapping("loadExport")
    public DataGridView loadExport(ExportVo exportVo){
        Date begintime = exportVo.getBegintime();
        Date endtime = exportVo.getEndtime();
        Integer providerid = exportVo.getProviderid();
        Integer goodsid = exportVo.getGoodsid();
        QueryWrapper<Export> queryWarpper = new QueryWrapper<>();
        queryWarpper.eq(providerid!=null&&providerid!=0,"providerid",providerid)
                .eq(goodsid!=null&&goodsid!=0,"goodsid",goodsid)
                .gt(begintime!=null,"begintime",begintime)
                .lt(endtime!=null,"endtime",endtime);
        IPage<Export> page = new Page<>(exportVo.getPage(),exportVo.getLimit());
        IPage<Export> result = exportService.page(page, queryWarpper);
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
        List<Export> exports = result.getRecords();
        for (Export export : exports) {
            export.setProvidername(providerMap.get(export.getProviderid()).getProvidername());
            export.setGoodsname(goodsMap.get(export.getGoodsid()).getGoodsname());
        }
        return new DataGridView(result.getTotal(),exports);
    }

    @RequestMapping("deleteExport")
    public ResultObj deleteExport(Integer id){
        try {
            exportService.removeById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }
}

