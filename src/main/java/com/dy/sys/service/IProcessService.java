package com.dy.sys.service;

import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.entity.ActCommentEntity;
import com.dy.sys.entity.AuditEntity;
import com.dy.sys.entity.Leavebill;
import com.dy.sys.vo.ProcessVo;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import java.io.InputStream;
import java.util.List;

/**
 * ClassName:IProcessService
 * Package:com.dy.sys.service
 * Description:
 *
 * @Date:2020/3/28 18:09
 * @Author:Dong
 */
public interface IProcessService {
    DataGridView queryProcessDeployment(ProcessVo processVo);
    DataGridView queryProcessDefine(ProcessVo processVo);
    ResultObj deleteSingleDeployment(String id);
    ResultObj deleteBatchDeployment(String[] deploymentIds);

    InputStream getProcessImg(String deploymentId);

    void addProcess(InputStream inputStream, String deploymentName);

    void startProcess(String processDefinitionKey,Integer userId, Integer id);

    DataGridView queryTaskByUserId(ProcessVo processVo);

    Task getTaskByTaskId(String id);

    ProcessInstance getProcessInstanceByTask(Task task);

    ProcessDefinition getProcessDefinitionByTask(Task task);

    List<String> listOutCome(Task task, ProcessInstance processInstance);

    String getActivityIdByTask(Task task);

    List<ActCommentEntity> listProcessInstanceComments(ProcessInstance processInstance);

    void completeTask(ProcessVo processVo);

    List<ActCommentEntity> getHistoryCommentByBusinessKey(String toString);

    List<Leavebill> queryTaskLeavebillByUserId(ProcessVo processVo);

    List<AuditEntity> loadAuditInfo(ProcessVo processVo);
}
