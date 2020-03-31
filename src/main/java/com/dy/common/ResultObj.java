package com.dy.common;/**
 * ClassName:ResultObj
 * Package:com.dy.common
 * Description:
 *
 * @Date:2020/3/17 10:04
 * @Author:Dong
 */

import com.dy.constast.SysConstast;
import lombok.Data;

/**
 *ClassName:ResultObj
 */
@Data
public class ResultObj {



    //业务响应码
    private Integer code;
    //业务消息
    private String msg;

    private ResultObj(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public static final ResultObj OPERATE_SUCCESS = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATE_SUCCESS);
    public static final ResultObj OPERATE_ERROR = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATE_ERROR);
    public static final ResultObj ADD_SUCCESS = new ResultObj(SysConstast.CODE_SUCCESS, SysConstast.ADD_SUCCESS);
    public static final ResultObj ADD_ERROR = new ResultObj(SysConstast.CODE_ERROR, SysConstast.ADD_ERROR);
    public static final ResultObj EXPORT_SUCCESS = new ResultObj(SysConstast.CODE_SUCCESS, SysConstast.EXPORT_SUCCESS);
    public static final ResultObj EXPORT_ERROR = new ResultObj(SysConstast.CODE_ERROR, SysConstast.EXPORT_ERROR);
    public static final ResultObj DELETE_SUCCESS = new ResultObj(SysConstast.CODE_SUCCESS, SysConstast.DELETE_SUCCESS);
    public static final ResultObj DELETE_ERROR = new ResultObj(SysConstast.CODE_ERROR, SysConstast.DELETE_ERROR);
    public static final ResultObj DELETE_HASCHILDREN = new ResultObj(SysConstast.CODE_ERROR, SysConstast.DELETE_HASCHILDREN);
    public static final ResultObj UPDATE_SUCCESS = new ResultObj(SysConstast.CODE_SUCCESS, SysConstast.UPDATE_SUCCESS);
    public static final ResultObj UPDATE_ERROR = new ResultObj(SysConstast.CODE_ERROR, SysConstast.UPDATE_ERROR);
    public static final ResultObj LOGIN_SUCCESS = new ResultObj(SysConstast.CODE_SUCCESS, SysConstast.LOGIN_SUCCESS);
    public static final ResultObj LOGIN_NAMEPWD_ERROR = new ResultObj(SysConstast.CODE_ERROR, SysConstast.LOGIN_NAMEPWD_ERROR);
    public static final ResultObj LOGIN_VALIDATION_ERROR = new ResultObj(SysConstast.CODE_ERROR, SysConstast.LOGIN_VALIDATION_ERROR);
    public static final ResultObj DISPATCH_SUCCESS = new ResultObj(SysConstast.CODE_SUCCESS, SysConstast.DISPATCH_SUCCESS);
    public static final ResultObj DISPATCH_ERROR = new ResultObj(SysConstast.CODE_SUCCESS, SysConstast.DISPATCH_SUCCESS);
    public static final ResultObj CHANGEPWD_SUCCESS = new ResultObj(SysConstast.CODE_SUCCESS, SysConstast.CHANGEPWD_SUCCESS);
    public static final ResultObj CHANGEPWD_ERROR = new ResultObj(SysConstast.CODE_ERROR, SysConstast.CHANGEPWD_ERROR);
    public static final ResultObj CHANGEPWD_COMFIRMPWD_ERROR = new ResultObj(SysConstast.CODE_ERROR, SysConstast.CHANGEPWD_COMFIRMPWD_ERROR);
    public static final ResultObj CHANGEPWD_OLDPWD_ERROR = new ResultObj(SysConstast.CODE_ERROR, SysConstast.CHANGEPWD_OLDPWD_ERROR);
    public static final ResultObj EXPORT_GOODS_SHORT = new ResultObj(SysConstast.CODE_ERROR,SysConstast.EXPORT_GOODS_SHORT);
    public static final ResultObj SUBMIT_ERROR = new ResultObj(SysConstast.CODE_ERROR,SysConstast.SUBMIT_ERROR);
    public static final ResultObj SUBMIT_SUCCESS = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.SUBMIT_SUCCESS);

    public static final ResultObj DELETE_DEPLOYMENT_ERROR_EXISTEXECUTION = new ResultObj(SysConstast.CODE_ERROR,SysConstast.DELETE_DEPLOYMENT_ERROR_EXISTEXECUTION);
}
