package com.dy.sys.service.impl;/**
 * ClassName:ProcessServiceImpl
 * Package:com.dy.sys.service.impl
 * Description:
 *
 * @Date:2020/3/28 18:10
 * @Author:Dong
 */

import cn.hutool.Hutool;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.common.WebUtils;
import com.dy.constast.SysConstast;
import com.dy.sys.entity.*;
import com.dy.sys.service.ILeavebillService;
import com.dy.sys.service.IProcessService;
import com.dy.sys.service.IUserService;
import com.dy.sys.vo.ActiveUser;
import com.dy.sys.vo.ProcessVo;
import org.activiti.bpmn.model.BpmnModel;
import org.activiti.bpmn.model.Process;
import org.activiti.bpmn.model.SequenceFlow;
import org.activiti.bpmn.model.UserTask;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.Execution;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.*;
import java.util.zip.ZipInputStream;

/**
 * 流程管理的Service
 * 流程部署,删除,运行办理等操作
 * ClassName:ProcessServiceImpl
 */
@Service
public class ProcessServiceImpl implements IProcessService {

    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private HistoryService historyService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private IdentityService identityService;
    @Autowired
    private FormService formService;
    @Autowired
    private ManagementService managementService;
    @Autowired
    private IUserService userService;
    @Autowired
    private ILeavebillService leavebillService;

    /**
     * 查询流程部署信息
     * 需要条件查询+分页
     * 因为操作表不是我们自己去操作表,不能使用插件进行分页的操作
     * 只能使用原生的分页查询 构造limit(,),返回总数据条数,
     */
    public DataGridView queryProcessDeployment(ProcessVo processVo) {
        String deploymentName = processVo.getDeploymentName();
        //条件模糊查询-->需要判断条件非null-->此处不可拼接SQL,所以不模糊查询可以做成"%%",相当于没有
        if (deploymentName == null) {
            processVo.setDeploymentName("");
        }
        //通过responsityService查询
        DeploymentQuery deploymentQuery = repositoryService.createDeploymentQuery()
                .deploymentNameLike("%" + processVo.getDeploymentName() + "%");
        //1.总条数
        long count = deploymentQuery.count();
        //2.分页数据
        int page = (processVo.getPage() - 1) * processVo.getLimit();
        int limit = processVo.getLimit();
        List<Deployment> deployments = deploymentQuery.listPage(page,limit);
        ArrayList<ActDeploymentEntity> data = new ArrayList<>();
        for (Deployment source : deployments) {
            ActDeploymentEntity target = new ActDeploymentEntity();
            BeanUtil.copyProperties(source,target);
            data.add(target);
        }
        return new DataGridView(count, data);
    }

    /**
     * 查询流程定义信息
     * 根据流程部署名称
     *
     * @param processVo
     * @return
     */
    public DataGridView queryProcessDefine(ProcessVo processVo) {
        //根据流程部署id查询
        String deploymentName = processVo.getDeploymentName();
        //条件模糊查询-->需要判断条件非null-->此处不可拼接SQL,所以不模糊查询可以做成"%%",相当于没有
        if (deploymentName == null) {
            processVo.setDeploymentName("");
        }
        //1.查出对应的流程部署id的集合
        DeploymentQuery deploymentQuery = repositoryService.createDeploymentQuery()
                .deploymentNameLike("%" + processVo.getDeploymentName() + "%");
        List<Deployment> deployments = deploymentQuery.list();
        if(deployments!=null && deployments.size()!=0){
            Set<String> deploymentIds = new HashSet<>();
            for (Deployment deployment : deployments) {
                deploymentIds.add(deployment.getId());
            }
            ProcessDefinitionQuery processDefinitionQuery = repositoryService.createProcessDefinitionQuery()
                    .deploymentIds(deploymentIds);
            //1.总条数
            long count = processDefinitionQuery.count();
            //2.分页数据
            int page = (processVo.getPage() - 1) * processVo.getLimit();
            int limit = processVo.getLimit();
            List<ProcessDefinition> processDefinitions = processDefinitionQuery.listPage(page, limit);
            ArrayList<ActProcessDefinitionEntity> data = new ArrayList<>();
            for (ProcessDefinition source : processDefinitions) {
                ActProcessDefinitionEntity target = new ActProcessDefinitionEntity();
                BeanUtils.copyProperties(source,target);
                data.add(target);
            }
            return new DataGridView(count, data);
        }else{
            return new DataGridView(null);
        }

    }

    /**
     * 删除单个流程部署
     * @param id 部署ID
     * @return
     */
    public ResultObj deleteSingleDeployment(String id) {
        try {
            //查看是否有正在执行的该部署ID
            //1.部署ID->流程ID
            String processDefinitionId = repositoryService.createProcessDefinitionQuery().deploymentId(id).singleResult().getId();
            List<Execution> executionlist = runtimeService.createExecutionQuery().processDefinitionId(processDefinitionId).list();
            if(executionlist.size()>0){
                return ResultObj.DELETE_DEPLOYMENT_ERROR_EXISTEXECUTION;
            }else{
                repositoryService.deleteDeployment(id);
                return ResultObj.DELETE_SUCCESS;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    @Override
    public ResultObj deleteBatchDeployment(String[] deploymentids) {

        try {
            for (String id : deploymentids) {
                ResultObj r = deleteSingleDeployment(id);
                if(r.getCode()<0){
                    throw new RuntimeException(r.getMsg());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }

    @Override
    public InputStream getProcessImg(String deploymentId) {
        //1.根据部署ID查询流程定义对象
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().deploymentId(deploymentId).singleResult();
        //2.从流程定义中获取资源名称
        String resourceName = processDefinition.getDiagramResourceName();
        //3.根据部署ID+资源名称获取图片流
        InputStream imgResource = repositoryService.getResourceAsStream(deploymentId, resourceName);
        return imgResource;
    }

    @Override
    public void addProcess(InputStream inputStream, String deploymentName) {
        try {
            //包装传递的文件流为Zip输入流
            ZipInputStream zipInputStream = new ZipInputStream(inputStream);
            repositoryService.createDeployment()
                    .name(deploymentName)
                    .addZipInputStream(zipInputStream)
                    .deploy();
            zipInputStream.close();
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 启动流程
     * @param processDefinitionKey 流程定义Key
     * @param userId 第一道流程的办理人用户Id
     * @param businessKey 绑定的业务ID
     */
    @Override
    public void startProcess(String processDefinitionKey,Integer userId, Integer businessKey) {
        //1.指定办理人
        HashMap<String, Object> variables = new HashMap<>();
        variables.put("userId",userId);
        //2.启动流程
        runtimeService.startProcessInstanceByKey(
                processDefinitionKey,
                businessKey.toString(),
                variables
                );
    }

    @Override
    public DataGridView queryTaskByUserId(ProcessVo processVo) {
        TaskQuery taskQuery = taskService.createTaskQuery().taskAssignee(processVo.getAssign());
        int page = processVo.getLimit()*(processVo.getPage()-1);
        int limit = processVo.getLimit();
        long count = taskQuery.count();
        List<Task> tasks = taskQuery.listPage(page, limit);
        ArrayList<ActTaskEntity> data = new ArrayList<>();
        for (Task source : tasks) {
            ActTaskEntity target = new ActTaskEntity();
            BeanUtils.copyProperties(source,target);
            int id = Integer.parseInt(source.getAssignee());
            User user = userService.getById(id);
            target.setAssigneeName(user.getName());
            data.add(target);
        }
        return new DataGridView(count,data);
    }
    @Override
    public Task getTaskByTaskId(String id){
        return taskService.createTaskQuery().taskId(id).singleResult();
    }

    @Override
    public ProcessInstance getProcessInstanceByTask(Task task) {
        String processInstanceId = task.getProcessInstanceId();
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        return processInstance;
    }
    @Override
    public ProcessDefinition getProcessDefinitionByTask(Task task) {
        String processDefinitionId = task.getProcessDefinitionId();
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
        return processDefinition;
    }

    @Override
    public List<String> listOutCome(Task task, ProcessInstance processInstance) {
        ArrayList<String> outcomeList = new ArrayList<>();
        //1.通过流程定义Id获取流程XML信息
        BpmnModel bpmnModel = repositoryService.getBpmnModel(task.getProcessDefinitionId());
        Process process = bpmnModel.getProcesses().get(0);
        //2.获取全部UserTask节点数据
        List<UserTask> allElement = process.findFlowElementsOfType(UserTask.class);
        //3.通过流程实例获取当前活动节点ID

        //4.遍历所有节点
        for (UserTask userTask : allElement) {
            String taskId = userTask.getId();
            String activityId = getActivityIdByTask(task);
            if(taskId.equals(activityId)){
                //获取节点的出线信息
                List<SequenceFlow> outgoingFlows = userTask.getOutgoingFlows();
                for (SequenceFlow flow : outgoingFlows) {
                    outcomeList.add(flow.getName());
                }
                break;
            }
        }
        return outcomeList;
    }
    @Override
    public String getActivityIdByTask(Task task){
        String executionId = task.getExecutionId();
        Execution execution = runtimeService.createExecutionQuery().executionId(executionId).singleResult();
        String activityId = execution.getActivityId();
        return activityId;
    }

    @Override
    public List<ActCommentEntity> listProcessInstanceComments(ProcessInstance processInstance) {
        List<Comment> comments = taskService.getProcessInstanceComments(processInstance.getId());
        ArrayList<ActCommentEntity> data = new ArrayList<>();
        if (comments!=null&&comments.size()>0) {
            for (Comment resource : comments) {
                ActCommentEntity target = new ActCommentEntity();
                BeanUtils.copyProperties(resource,target);
                target.setUserName(userService.getById(Integer.parseInt(resource.getUserId())).getName());
                data.add(target);
            }
        }
        return data;
    }

    /**
     * 办理任务
     * 第一级通过启动时设定办理人,第二三级通过监听器设置办理人
     * 还要通过传递的outcome,指定流程走向
     * 任务:办理任务-->判断流程是否结束-->如果结束,改变请假单状态
     * @param processVo
     */
    @Override
    public void completeTask(ProcessVo processVo) {
        String comment = processVo.getComment();
        String taskId = processVo.getTaskId();
        String outcome = processVo.getOutcome();
        Integer leavebillId = processVo.getLeavebillId();
        //添加批注信息
        String processInstanceId = taskService.createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
          //批注人
        String userId = ((ActiveUser) WebUtils.getHttpSession().getAttribute("user")).getUser().getId().toString();
        Authentication.setAuthenticatedUserId(userId);
        taskService.addComment(taskId,processInstanceId,"["+outcome+"]"+comment);//这种方法只添加批注信息,没有批注人
        //完成任务
        Map<String, Object> variables = new HashMap<>();
        variables.put("outcome",outcome);
        taskService.complete(taskId,variables);
        //判断流程是否结束-->runTimeService中查找流程实例,是否还存在
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
        Leavebill leavebill = leavebillService.getById(leavebillId);
        if(processInstance==null){
            //改变请假单状态
                //1>新增->放弃
            if(SysConstast.OUTCOME_GIVEUP.equals(outcome)){
                leavebill.setState(SysConstast.LEAVEBILL_STATE_QUIT);
            }
                //2>审核中->审核完成
            if(SysConstast.OUTCOME_AGREE.equals(outcome)){
                leavebill.setState(SysConstast.LEAVEBILL_STATE_AUDITED);
            }
            leavebillService.updateById(leavebill);
        }
    }

    @Override
    public List<ActCommentEntity> getHistoryCommentByBusinessKey(String businessKey) {
        ArrayList<ActCommentEntity> comments = new ArrayList<>();
        //1.通过BusinessKey查询历史流程实例-->(通常有多个业务Key-->需要不同的前缀组装key)
        HistoricProcessInstance historicProcessInstance = historyService.createHistoricProcessInstanceQuery().processInstanceBusinessKey(businessKey).singleResult();
        //2.通过流程实例id查询历史批注
        List<Comment> commentList = taskService.getProcessInstanceComments(historicProcessInstance.getId());
        for (Comment resource : commentList) {
            ActCommentEntity target = new ActCommentEntity();
            BeanUtils.copyProperties(resource,target);
            target.setUserName(userService.getById(target.getUserId()).getName());
            comments.add(target);
        }
        return comments;
    }

    @Override
    public List<Leavebill> queryTaskLeavebillByUserId(ProcessVo processVo) {
        ArrayList<Leavebill> leavebills = new ArrayList<>();
        //1.通过办理人查询任务
        List<Task> taskList = taskService.createTaskQuery().taskAssignee(processVo.getAssign()).list();
        //2.通过任务查出流程实例
        for (Task task : taskList) {
            //3.通过流程实例查出业务Key
            ProcessInstance p = runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
            //4.通过业务key查出请假单
            int leavebillId = Integer.parseInt(p.getBusinessKey());
            Leavebill leavebill = leavebillService.getById(leavebillId);
            leavebills.add(leavebill);
        }
        return leavebills;
    }

    @Override
    public List<AuditEntity> loadAuditInfo(ProcessVo processVo) {
        ArrayList<AuditEntity> audits = new ArrayList<>();
        ArrayList<String> ids = new ArrayList<>();
        //查出所有的历史实例Id+正在执行的实例
        List<HistoricProcessInstance> historyProcessInstances = historyService.createHistoricProcessInstanceQuery().list();
        List<ProcessInstance> processInstances = runtimeService.createProcessInstanceQuery().list();
        for (HistoricProcessInstance instance : historyProcessInstances) {
            ids.add(instance.getId());
        }
        for (ProcessInstance instance : processInstances) {
            ids.add(instance.getId());
        }
        //循环实例Id,获取对应的批注信息,如果批注信息的Userid有对应的id则返回,并查出对应的业务信息
        for (String id : ids) {
            //3.通过流程实例查询业务Key
            String leavelbillId;
            HistoricProcessInstance processInstance = historyService.createHistoricProcessInstanceQuery().processInstanceId(id).singleResult();
            if(processInstance==null){
                ProcessInstance processInstance1 = runtimeService.createProcessInstanceQuery().processInstanceId(id).singleResult();
                leavelbillId = processInstance1.getBusinessKey();
            }else{
                leavelbillId = processInstance.getBusinessKey();
            }
            Leavebill leavebill = leavebillService.getById(leavelbillId);
            User user = userService.getById(leavebill.getUserid());
            String leavelTime = DateUtil.formatDate(leavebill.getLeavetime());
            leavebill.setContentString(user.getName()+"从"+leavelTime+"开始请假"+leavebill.getDays()+"天");
            //4.通过业务Key
            //5.通过流程实例查询到对应的历史批注
            List<Comment> comments = taskService.getProcessInstanceComments(id);
            for (Comment comment : comments) {
                if(comment.getUserId().equals(processVo.getAssign())){
                    AuditEntity audit = new AuditEntity();
                    audit.setAuditComment(comment.getFullMessage());
                    audit.setAuditDate(comment.getTime());
                    audit.setAuditSomething(leavebill.getContentString());
                    audits.add(audit);
                }
            }
        }
        return audits;
    }


}
