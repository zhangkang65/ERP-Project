package com.dy.sys.utils;/**
 * ClassName:PinYinUtils
 * Package:com.dy.sys.utils
 * Description:
 *
 * @Date:2020/3/21 14:41
 * @Author:Dong
 */

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

/**
 * ClassName:PinYinUtils
 */
public class PinYinUtils {
    /**
     * 用户姓名转换拼音获取首字母为用户名
     */
    public static String getPinYin(String inputString) {
        //创建格式化对象
        HanyuPinyinOutputFormat outputFormat = new HanyuPinyinOutputFormat();
        //设置声调格式
        outputFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
        //以V表示该字符，例如：lv
        outputFormat.setVCharType(HanyuPinyinVCharType.WITH_V);
        //设置小写
        outputFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);
        StringBuffer output = new StringBuffer();
        
        if (inputString != null && inputString.length() > 0 && !"null".equals(inputString)) {
            for (int i = 0; i < inputString.length(); i++) {
                try {
                    String[] strings = PinyinHelper.toHanyuPinyinStringArray(inputString.charAt(i), outputFormat);
                    output.append(strings[0].charAt(0));
                } catch (BadHanyuPinyinOutputFormatCombination badHanyuPinyinOutputFormatCombination) {
                    badHanyuPinyinOutputFormatCombination.printStackTrace();
                }
            }
        }
       return output.toString();
    }

/*    public static void main(String[] args) {
        System.out.println(getPinYin("张三"));
    }*/
}
