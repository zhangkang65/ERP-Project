package com.dy.common;/**
 * ClassName:FileController
 * Package:com.dy.common
 * Description:
 *
 * @Date:2020/3/21 19:52
 * @Author:Dong
 */

import cn.hutool.core.date.DateUtil;
import com.dy.constast.SysConstast;
import com.dy.sys.vo.ActiveUser;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *ClassName:FileController
 */
@Controller
@RequestMapping("file")
public class FileController {
    /**
     * 上传文件,异步上传,首先保存为临时文件
     * @throws IOException
     * @throws IllegalStateException
     */
    @RequestMapping("uploadFile")
    @ResponseBody
    public DataGridView uploadFile(MultipartFile mf) throws IllegalStateException, IOException {
        // 文件上传的父目录
        String parentPath = AppFileUtils.UPLOAD_PATH;
        // 得到当前日期作为文件夹名称
        String dirName = DateUtil.format(new Date(),"yyyy-MM-dd");
        // 构造文件夹对象
        File dirFile = new File(parentPath, dirName);
        if (!dirFile.exists()) {
            dirFile.mkdirs();// 创建文件夹
        }
        // 得到文件原名
        String oldName = mf.getOriginalFilename();
        // 根据文件原名得到有临时后缀名的新名-->此时使用旧文件名只是获取后缀名
        String newName = RandomUtils.createFileNameUseTime(oldName, SysConstast.UPLOAD_FILE_TEMPSUFFIX);
        File dest = new File(dirFile, newName);
        mf.transferTo(dest);

        Map<String,Object> map=new HashMap<>();
        //返回上传文件的路径,以供数据库中存储
        map.put("src", dirName+"/"+newName);
        return new DataGridView(map);
    }

    /**
     * 下载图片
     * @param path
     * @param response
     * @return
     */
    @RequestMapping("downloadFile")
    public ResponseEntity<Object> downloadFile(String path,String todo, HttpServletResponse response, HttpSession session) {
        if(path==null||"".equals(path)){
            if(SysConstast.DOWNLOADFILE_TODO_DEFAULT_GOODSIMG.equals(todo)){
                path = SysConstast.DEFAULT_GOODS_IMG;
            }else{
                path = ((ActiveUser)session.getAttribute("user")).getUser().getImgpath();
            }
        }
        //不是真正意义的下载图片,只是显示图片
        String oldName="";
        return AppFileUtils.downloadFile(response, path, oldName);
    }


}
