package com.dy.constast;/**
 * ClassName:SysConstat
 * Package:com.dy.constat
 * Description:
 *
 * @Date:2020/3/17 10:07
 * @Author:Dong
 */

/**
 *ClassName:SysConstat
 */
public class SysConstast {

    public static final Integer CODE_SUCCESS = 200;
    public static final Integer CODE_ERROR = -1;

    public static final String ADD_SUCCESS = "添加成功";
    public static final String ADD_ERROR = "添加失败";
    public static final String UPDATE_SUCCESS = "更新成功";
    public static final String UPDATE_ERROR = "更新失败";
    public static final String DELETE_SUCCESS = "删除成功";
    public static final String DELETE_ERROR = "删除失败";
    public static final String LOGIN_SUCCESS = "登录成功";
    public static final String LOGIN_VALIDATION_ERROR = "验证码错误";
    public static final String LOGIN_NAMEPWD_ERROR = "用户名或密码错误";
    public static final Integer MENU_SPREAD_OPEN = 1;
    public static final Integer MENU_SPREAD_FALSE = 0;
    public static final Integer AVAILABLE = 1;
    public static final Integer UNAVAILABLE = 0;
    public static final String PERMISSION_TYPE_MENU = "menu";
    public static final String PERMISSION_TYPE_PERMISSION = "permission";
    public static final String DELETE_HASCHILDREN = "此菜单有子菜单,不可对其进行删除!";
    public static final String TREENODE_CHECKED = "1";
    public static final String TREENODE_UNCHECKED = "0";
    public static final String DISPATCH_SUCCESS = "分配成功";
    public static final String DISPATCH_ERROR = "分配失败";
    public static final String LAY_CHECKED = "LAY_CHECKED";
    public static final String DEFAULT_USER_PWD = "123456";
    public static final String DEFAULT_USER_HEADIMG = "/resources/images/defaultuserhead.jpg";
    /**
     * 超级管理员
     */
    public static final Integer USER_TYPE_SUPERMANAGER = 0;
    /**
     * 普通用户
     */
    public static final Integer USER_TYPE_NORMALUSER = 2;
    public static final String CHANGEPWD_SUCCESS ="密码修改成功";
    public static final String CHANGEPWD_ERROR ="密码修改失败";
    public static final String CHANGEPWD_COMFIRMPWD_ERROR ="两次输入的密码不一致";
    public static final String CHANGEPWD_OLDPWD_ERROR = "旧密码输入错误";

    public static final String UPLOAD_FILE_TEMPSUFFIX = "_temp";
    public static final String DOWNLOADFILE_TODO_DEFAULT_GOODSIMG = "goods";
    public static final String DEFAULT_GOODS_IMG = "images/defaultgoodsImg.jpg";
    public static final String EXPORT_SUCCESS = "退货成功";
    public static final String EXPORT_ERROR = "退货失败";
    public static final String EXPORT_GOODS_SHORT = "商品短缺,退货失败";
    public static final String OPERATE_SUCCESS = "操作成功";
    public static final String OPERATE_ERROR = "操作失败";
    /**
     * 请假单状态:新建(未提交)
     */
    public static final Integer LEAVEBILL_STATE_NEW = 0;
    public static final String LEAVEBILL_STATE_NEW_STRING = "新建";
    /**
     * 审核中
     */
    public static final Integer LEAVEBILL_STATE_AUDITING = 1;
    public static final String LEAVEBILL_STATE_AUDITING_STRING = "审核中";
    /**
     * 审核完成
     */
    public static final Integer LEAVEBILL_STATE_AUDITED = 2;
    public static final String LEAVEBILL_STATE_AUDITED_STRING = "审核完成";
    /**
     * 已放弃
     */
    public static final Integer LEAVEBILL_STATE_QUIT = 3;
    public static final String LEAVEBILL_STATE_QUIT_STRING = "已放弃";

    public static final String PROCESSDEFINITION_KEY_LEAVEBILL = "leaveBillProcess";
    public static final String SUBMIT_ERROR = "提交失败";
    public static final String SUBMIT_SUCCESS = "提交成功";
    public static final String DELETE_DEPLOYMENT_ERROR_EXISTEXECUTION = "删除失败,该部署存在正在执行的流程实例!";
    public static final String OUTCOME_GIVEUP = "放弃";
    public static final String OUTCOME_AGREE ="同意" ;
}
