package com.dy.bus.controller;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.Query;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dy.bus.entity.Goods;
import com.dy.bus.entity.Provider;
import com.dy.bus.service.IGoodsService;
import com.dy.bus.service.IProviderService;
import com.dy.bus.vo.GoodsVo;
import com.dy.common.AppFileUtils;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.constast.SysConstast;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.xml.crypto.Data;
import java.util.HashMap;
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
@RequestMapping("/bus/goods")
public class GoodsController {

    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private IProviderService providerService;

    @RequestMapping("loadGoods")
    public DataGridView loadGoods(GoodsVo goodsVo) {
        Integer providerid = goodsVo.getProviderid();
        String goodsname = goodsVo.getGoodsname();
        String productcode = goodsVo.getProductcode();
        String promitcode = goodsVo.getPromitcode();
        String description = goodsVo.getDescription();
        String size = goodsVo.getSize();
        IPage<Goods> page = new Page<>(goodsVo.getPage(), goodsVo.getLimit());
        QueryWrapper<Goods> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(providerid != null && providerid != 0, "providerid", providerid)
                .like(StringUtils.isNotBlank(goodsname), "goodsname", goodsname)
                .like(StringUtils.isNotBlank(productcode), "productcode", productcode)
                .like(StringUtils.isNotBlank(promitcode), "promitcode", productcode)
                .like(StringUtils.isNotBlank(description), "description", description)
                .like(StringUtils.isNotBlank(size), "size", size);
        IPage<Goods> result = goodsService.page(page, queryWrapper);
        List<Goods> goodses = page.getRecords();
        List<Provider> list = providerService.list();
        HashMap<Integer, Provider> providerMap = new HashMap<>();
        for (Provider provider : list) {
            providerMap.put(provider.getId(), provider);
        }
        for (Goods goods : goodses) {
            goods.setProvidername(providerMap.get(goods.getProviderid()).getProvidername());
        }
        return new DataGridView(result.getTotal(), goodses);
    }

    @RequestMapping("deleteGoods")
    public ResultObj deleteGoods(Integer id) {
        try {
            goodsService.removeById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    /**
     * 增加商品
     * @param goodsVo
     * @return
     */
    @RequestMapping("addGoods")
    public ResultObj addGoods(GoodsVo goodsVo) {
        try {
            //获取图片地地址,判断是否是临时文件
            String goodsimg = goodsVo.getGoodsimg();
            if (goodsimg.endsWith(SysConstast.UPLOAD_FILE_TEMPSUFFIX)) {
                //临时文件转正
                goodsimg = AppFileUtils.updateFileName(goodsimg, SysConstast.UPLOAD_FILE_TEMPSUFFIX);
                //转正文件地址更新
                goodsVo.setGoodsimg(goodsimg);
            }
            //添加商品
            goodsService.save(goodsVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }
    @RequestMapping("updateGoods")
    public ResultObj uploadGoods(GoodsVo goodsVo) {
        try {
            //获取图片地地址,判断是否是临时文件
            String goodsimg = goodsVo.getGoodsimg();
            if (goodsimg.endsWith(SysConstast.UPLOAD_FILE_TEMPSUFFIX)) {
                //临时文件转正
                goodsimg = AppFileUtils.updateFileName(goodsimg, SysConstast.UPLOAD_FILE_TEMPSUFFIX);
                //转正文件地址更新
                goodsVo.setGoodsimg(goodsimg);
                //删除原有的图片
                String oldGoodsImg = goodsService.getById(goodsVo.getId()).getGoodsimg();
                AppFileUtils.deleteFileUsePath(oldGoodsImg);
            }
            //添加商品
            goodsService.updateById(goodsVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }

    @RequestMapping("getGoods")
    public List<Goods> getGoods(){
        return goodsService.list();
    }
    @RequestMapping("getGoodsById")
    public Goods getGoodsById(Integer id){
        return goodsService.getById(id);
    }
    @RequestMapping("loadDangerGoods")
    public List<Goods> loadDangerGoods(){
        return goodsService.loadDangerGoods();
    }


}

