package com.dy.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.entity.Notice;
import com.dy.sys.service.INoticeService;
import com.dy.sys.vo.ActiveUser;
import com.dy.sys.vo.NoticeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
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
@RequestMapping("sys/notice")
public class NoticeController {

    @Autowired
    private INoticeService noticeService;

    /**
     * 加载公告
     * @param noticeVo
     * @return
     */
    @RequestMapping("loadNotice")
    public DataGridView loadNotice(NoticeVo noticeVo){
        //标题 内容 开始时间 结束时间
        Date begintime = noticeVo.getBegintime();
        Date endtime = noticeVo.getEndtime();
        String title = noticeVo.getTitle();
        String content = noticeVo.getContent();
        QueryWrapper<Notice> queryWarpper = new QueryWrapper<>();
        queryWarpper.like(title!=null&&title!="","title",title)
                .like(content!=null&&content!="","content",content)
                .ge(begintime!=null,"createtime",begintime)
                .le(endtime!=null,"createtime",endtime)
                .orderByDesc("createtime");
        IPage<Notice> page = new Page<>(noticeVo.getPage(),noticeVo.getLimit());
        noticeService.page(page,queryWarpper);
        return new DataGridView(page.getTotal(),page.getRecords());
    }

    @RequestMapping("addNotice")
    public ResultObj addNotice(NoticeVo noticeVo, HttpSession session){
        try {
            String opername = ((ActiveUser) session.getAttribute("user")).getUser().getName();
            noticeVo.setOpername(opername);
            noticeVo.setCreatetime(new Date());
            noticeService.save(noticeVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }

    /**
     * 删除单个公告
     * @param id
     * @return
     */
    @RequestMapping("deleteSingleNotice")
    public ResultObj deleteSingleNotice(Integer id){
        try {
            noticeService.removeById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    /**
     * 批量删除公告
     * @param
     * @return
     */
    @RequestMapping("deleteBatchNotice")
    public ResultObj deleteNotice(NoticeVo noticeVo){
        try {
            noticeService.removeByIds(noticeVo.getIds());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    /**
     * 更新公告
     * @param
     * @return
     */
    @RequestMapping("updateNotice")
    public ResultObj updateNotice(NoticeVo noticeVo){
        try {
            noticeService.updateById(noticeVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
        return ResultObj.UPDATE_SUCCESS;
    }
    @RequestMapping("getNoticeByid")
    public DataGridView getNoticeByid(Integer id){
        Notice notice = noticeService.getById(id);
        return new DataGridView(notice);
    }

}

