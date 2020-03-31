package com.dy.sys.controller;/**
 * ClassName:ProcessController
 * Package:com.dy.sys.controller
 * Description:
 *
 * @Date:2020/3/28 18:07
 * @Author:Dong
 */

import com.dy.common.DataGridView;
import com.dy.common.ResultObj;
import com.dy.sys.service.IProcessService;
import com.dy.sys.vo.ProcessVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.InputStream;

/**
 *ClassName:ProcessController
 */
@RestController
@RequestMapping("sys/process")
public class ProcessController {
    @Autowired
    private IProcessService processService;

    @RequestMapping("loadDeployment")
    public DataGridView loadDeployment(ProcessVo processVo){
        return processService.queryProcessDeployment(processVo);
    }

    @RequestMapping("loadProcessDefine")
    public DataGridView loadProcessDefine(ProcessVo processVo){
        return processService.queryProcessDefine(processVo);
    }

    @RequestMapping("deleteSingleDeployment")
    public ResultObj deleteSingleDeployment(ProcessVo processVo){
        return processService.deleteSingleDeployment(processVo.getDeploymentId());
    }

    @RequestMapping("deleteBatchDeployment")
    public ResultObj deleteBatchDeployment(ProcessVo processVo){
        return processService.deleteBatchDeployment(processVo.getDeploymentIds());
    }

    /**
     * 根据流程ID查看流程图,response返回图片流
     * @param processVo
     */
    @RequestMapping("viewProcessImg")
    public void viewProcessImg(ProcessVo processVo, HttpServletResponse response){
        //调用Service方法返回图片流
        InputStream inputStream = processService.getProcessImg(processVo.getDeploymentId());
        try {
            //获取response的输出流
            ServletOutputStream outputStream = response.getOutputStream();
            //通过ImageIO将普通流转化为图片流
            BufferedImage image = ImageIO.read(inputStream);
            //通过ImageIO图片流将返回的字节流输出到response流中
            ImageIO.write(image,"JPEG",outputStream);
            //关闭流
            outputStream.close();
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    @RequestMapping("addProcess")
    public ResultObj addProcess(MultipartFile mf,ProcessVo processVo){
        try{
            String deploymentName = processVo.getDeploymentName();
            InputStream inputStream = mf.getInputStream();
            processService.addProcess(inputStream,deploymentName);
        }catch(Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
        return ResultObj.ADD_SUCCESS;
    }

}
