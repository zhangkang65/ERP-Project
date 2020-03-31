package com.dy.common;/**
 * ClassName:RecyleTempFileTask
 * Package:com.dy.common
 * Description:
 *
 * @Date:2020/3/22 13:41
 * @Author:Dong
 */

import com.dy.constast.SysConstast;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;

/**
 *ClassName:RecyleTempFileTask
 */
@Component
@EnableScheduling  //开启定时任务
public class RecyleTempFileTask {
    /**
     * 每天中午13点执行
     */
    @Scheduled(cron="0 0 13 * * ?")
    public void recyleTempFile() {
        File file=new File(AppFileUtils.UPLOAD_PATH);
        deleteFile(file);
    }

    /**
     * 删除图片
     * @param file
     */
    public void deleteFile(File file) {
        if(null!=file) {
            File[] listFiles = file.listFiles();
            if(null!=listFiles&&listFiles.length>0) {
                for (File f : listFiles) {
                    if(f.isFile()) {
                        if(f.getName().endsWith(SysConstast.UPLOAD_FILE_TEMPSUFFIX)) {
                            f.delete();
                        }
                    }else {
                        //如果是文件夹，再递归删除
                        deleteFile(f);
                    }
                }
            }
        }
    }
}
