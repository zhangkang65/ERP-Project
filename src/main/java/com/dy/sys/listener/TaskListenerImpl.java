package com.dy.sys.listener;/**
 * ClassName:TaskListenerImpl
 * Package:com.dy.sys.listener
 * Description:
 *
 * @Date:2020/3/29 20:20
 * @Author:Dong
 */

import com.dy.common.WebUtils;
import com.dy.sys.entity.User;
import com.dy.sys.vo.ActiveUser;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;

/**
 *ClassName:TaskListenerImpl
 * 指定办理人
 * 此Listener在Activiti中是使用new 创建的
 */
public class TaskListenerImpl implements TaskListener {

    @Override
    public void notify(DelegateTask delegateTask) {
        //1.得到当前用户
        User user = ((ActiveUser) WebUtils.getHttpSession().getAttribute("user")).getUser();
        //2.取出领导id
        Integer mgrId = user.getMgr();
        //3.设置办理人(用户id)
        delegateTask.setAssignee(mgrId.toString());
    }
}
