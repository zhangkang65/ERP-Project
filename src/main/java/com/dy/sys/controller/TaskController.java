package com.dy.sys.controller;/**
 * ClassName:TaskController
 * Package:com.dy.sys.controller
 * Description:
 *
 * @Date:2020/3/30 11:53
 * @Author:Dong
 */

import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.entity.ActCommentEntity;
import com.dy.sys.entity.AuditEntity;
import com.dy.sys.entity.Leavebill;
import com.dy.sys.service.ILeavebillService;
import com.dy.sys.service.IProcessService;
import com.dy.sys.vo.ActiveUser;
import com.dy.sys.vo.ProcessVo;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *ClassName:TaskController
 */
@RequestMapping("/sys/task")
@Controller
public class TaskController {

    @Autowired
    private IProcessService processService;
    @Autowired
    private ILeavebillService leavebillService;

    @RequestMapping("loadTask")
    @ResponseBody
    public DataGridView loadTask(ProcessVo processVo, HttpSession session){
        String assign = ((ActiveUser) session.getAttribute("user")).getUser().getId().toString();
        processVo.setAssign(assign);
        return processService.queryTaskByUserId(processVo);
    }

    /**
     * 加载工作台待办任务(请假单)
     * @param session
     * @param processVo
     * @return
     */
    @RequestMapping("getDeskTopWaitTask")
    @ResponseBody
    public DataGridView getDeskTopWaitTask(HttpSession session,ProcessVo processVo){
        String assign = ((ActiveUser) session.getAttribute("user")).getUser().getId().toString();
        processVo.setAssign(assign);
        List<Leavebill> leavebills = processService.queryTaskLeavebillByUserId(processVo);
        for (Leavebill l : leavebills) {
            l.setContentString("请假时间"+l.getDays()+"天");
        }
        return new DataGridView(leavebills);
    }
    /**
     * 通过任务ID获取请假单信息
     * @param id taskId
     * @return 返回data是Map(请假单,连线名List,批注List)
     */
    @ResponseBody
    @RequestMapping("getLeavelbillByTaskId")
    public DataGridView getLeavelbillByProcessDefinitionId(String id){
        Task task = processService.getTaskByTaskId(id);
        ProcessInstance processInstance = processService.getProcessInstanceByTask(task);
        ProcessDefinition processDefinition = processService.getProcessDefinitionByTask(task);
        //1.请假单
        String businessKey = processInstance.getBusinessKey();
        Leavebill leavebill = leavebillService.getById(Integer.parseInt(businessKey));
        //2.连线信息
        List<String> outcomes = processService.listOutCome(task,processInstance);
        //3.所有批注信息
        List<ActCommentEntity> comments = processService.listProcessInstanceComments(processInstance);
        HashMap<String, Object> data = new HashMap<>();
        data.put("leavebill",leavebill);
        data.put("outcomes",outcomes);
        data.put("comments",comments);
        //3.批注信息
        return new DataGridView(data);
    }

    /**
     * 完成任务
     * @param processVo
     * @return
     */
    @ResponseBody
    @RequestMapping("completeTask")
    public ResultObj completeTask(ProcessVo processVo){
        try {
            processService.completeTask(processVo);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.SUBMIT_ERROR;
        }
        return ResultObj.SUBMIT_SUCCESS;
    }

    @RequestMapping("viewProcessImgByTaskid")
    public String viewProcessImgByTaskid(ProcessVo processVo){
        //根据TaskId查询流程定义
        Task task = processService.getTaskByTaskId(processVo.getTaskId());
        ProcessDefinition processDefinition = processService.getProcessDefinitionByTask(task);
        //根据流程定义查询部署ID
        String deploymentId = processDefinition.getDeploymentId();
        return "forward:/sys/process/viewProcessImg?deploymentId="+deploymentId;

    }
    @ResponseBody
    @RequestMapping("getprocessImgBorder")
    public String getProcessImgBorder(ProcessVo processVo){
        Task task = processService.getTaskByTaskId(processVo.getTaskId());
        String activityId = processService.getActivityIdByTask(task);
        System.out.println(activityId);
        return activityId;
    }

    @ResponseBody
    @RequestMapping("loadAuditInfo")
    public DataGridView loadAuditInfo(ProcessVo processVo,HttpSession session){
        String assign = ((ActiveUser) session.getAttribute("user")).getUser().getId().toString();
        processVo.setAssign(assign);
        List<AuditEntity> audits = processService.loadAuditInfo(processVo);
        return new DataGridView(audits);
    }
}
