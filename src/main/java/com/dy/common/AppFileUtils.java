package com.dy.common;/**
 * ClassName:AppFileUtils
 * Package:com.dy.utils
 * Description:
 *
 * @Date:2020/3/21 19:34
 * @Author:Dong
 */

import cn.hutool.core.io.FileUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Properties;

/**
 *ClassName:AppFileUtils
 */
@PropertySource("classpath:file.properties")
public class AppFileUtils {
    //文件上传的保存路径
    @Value("${filepath}")
    public static  String UPLOAD_PATH="E:/upload/";//默认值

    /**
     * 文件下载
     * @param path
     * @return
     */
    public static ResponseEntity<Object> downloadFile(HttpServletResponse response, String path, String oldName) {
        //1,构造文件对象
        File file=new File(UPLOAD_PATH, path);
        if(file.exists()) {
            try {
            //将下载的文件，封装byte[]
            byte[] bytes=null;
            try {
                bytes = FileUtil.readBytes(file);
            } catch (Exception e) {
                e.printStackTrace();
            }

            //创建封装响应头信息的对象
            HttpHeaders header=new HttpHeaders();
            //封装响应内容类型(APPLICATION_OCTET_STREAM 响应的内容不限定)
            header.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            //设置下载的文件的名称
            //header.setContentDispositionFormData("attachment", oldName);
            //创建ResponseEntity对象
            ResponseEntity<Object> entity=
                    new ResponseEntity<Object>(bytes, header, HttpStatus.CREATED);
            return entity;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }else {
            PrintWriter out;
            try {
                out = response.getWriter();
                out.write("文件不存在");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }

    }

    /**
     * 根据相对路径删除硬盘上文件
     * @param path
     */
    public static void deleteFileUsePath(String path) {
        String realPath=UPLOAD_PATH+path;
        //根据文件
        File file=new File(realPath);
        if(file.exists()) {
            file.delete();
        }
    }

    /**
     * 删除文件临时后缀
     * @param imgPath 带后缀的原文件全名
     * @param suffix 要删除的文件后缀名
     * @return 修改后名称
     */
    public static String updateFileName(String imgPath,String suffix) {
        //找到文件
        try {
            File file=new File(UPLOAD_PATH,imgPath);
            if(file.exists()) {
                file.renameTo(new File(UPLOAD_PATH,imgPath.replace(suffix, "")));
                return imgPath.replace(suffix, "");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据路径 删除图片
     * @param imgName
     */
    public static void removeFileByPath(String imgName) {
        try {
            File file=new File(UPLOAD_PATH,imgName);
            if(file.exists()) {
                file.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
