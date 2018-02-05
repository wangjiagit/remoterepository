package com.dyne.maven.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Pattern;

public class CommonUtil {
    public final static String NUMBER_PATTEN = "\"[0-9]*\"";

    /**
     * @Title: isEmpty
     * @Description: 判断任意对象为空 
     * @param obj 
     * @return boolean 
     * @throws
     */
    public static boolean isEmpty(Object obj) {
        if (obj == null) {
            return true;
        } else if (obj instanceof String) {
            String instance = (String) obj;
            if (instance.trim().length() <= 0 || "null".equalsIgnoreCase(instance)) {
                return true;
            }
        } else if (obj instanceof Integer) {
            Integer instance = (Integer) obj;
            if (instance < 0) {
                return true;
            }
        } else if (obj instanceof List<?>) {
            List<?> instance = (List<?>) obj;
            if (instance.size() <= 0) {
                return true;
            }
        } else if (obj instanceof Map<?, ?>) {
            Map<?, ?> instance = (Map<?, ?>) obj;
            if (instance.size() <= 0) {
                return true;
            }
        } else if (obj instanceof Object[]) {
            Object[] instance = (Object[]) obj;
            if (instance.length <= 0) {
                return true;
            }
        } else if (obj instanceof Long) {
            Long instance = (Long) obj;
            if (instance < 0) {
                return true;
            }
        }
        return false;
    }

    /**
     * @Title: notEmpty 
     * @Description: 判断任意对象不为空
     * @param obj 
     * @return boolean 
     * @throws
     */
    public static boolean notEmpty(Object obj) {
        return !isEmpty(obj);
    }

    /**
     * @Title: isEmpty 
     * @Description: TODO 
     * @param s @return boolean 
     * @throws
     */
    public static boolean isEmpty(String s) {
        return s == null || s.equals("");
    }

    /**
     * @Title: isLongEmpty 
     * @Description: TODO 
     * @param s 
     * @return boolean 
     * @throws
     */
    public static boolean isLongEmpty(Long s) {
        return null == s || s < 1;
    }

    /**
     * @Title: isIntegerEmpty 
     * @Description: TODO 
     * @param s 
     * @return boolean 
     * @throws
     */
    public static boolean isIntegerEmpty(Integer s) {
        return null == s || s < 1;
    }

    /**
     * @Title: isShortEmpty 
     * @Description: TODO 
     * @param s 
     * @return boolean 
     * @throws
     */
    public static boolean isShortEmpty(Short s) {
        return null == s || s < 1;
    }

    /**
     * @Title: parseInt 
     * @Description: 字符串转换
     * int @param s 
     * @param defaultValue 如果字符串为空返回默认值 
     * @return int 
     * @throws
     */
    public static int parseInt(String s, int defaultValue) {
        if (s == null || "".equals(s)) {
            return defaultValue;
        }

        int nValue = defaultValue;
        try {
            nValue = Integer.parseInt(s);
        } catch (Exception e) {
        }
        return nValue;
    }

    /**
     * @Title: isOutLength 
     * @Description: 判断长度是否超出
     * @param s 
     * @param l 
     * @return boolean
     * @throws
     */
    public static boolean isOutLength(String s, int l) {
        if (null == s || 0 == s.length()) {
            return false;
        }
        if (s.length() > l) {
            return true;
        }
        return false;
    }

    /**
     * @Title: normalizeString 
     * @Description: 字符串去空格
     * @param strValue 
     * @return String
     * @throws
     */
    public static String normalizeString(String strValue) {
        return ((strValue == null) ? "" : strValue.trim());
    }

    /**
     * @Title: getDateStringByPattern 
     * @Description: 获取当前日期按照传入的格式 
     * @param pattern
     * @return String 
     * @throws
     */
    public static String getDateStringByPattern(String pattern) {
        Date date = new Date();
        return getDateStringByPattern(date, pattern);
    }

    /**
     * @Title: getDateStringByPattern 
     * @Description: 格式化日期函数
     * @param date 
     * @param pattern
     *  @return String 
     *  @throws
     */
    public static String getDateStringByPattern(Date date, String pattern) {
        if (date == null) {
            return "";
        }
        SimpleDateFormat sf = new SimpleDateFormat(pattern);
        String str = sf.format(date);

        return str;
    }

    /**
     * @Title: getDate 
     * @Description: 获取当前时间按yyyy-mm-dd 
     * @return String 
     * @throws
     */
    public static String getDate() {
        StringBuffer sb = new StringBuffer();
        Calendar c = Calendar.getInstance();
        ;
        sb.append(c.get(Calendar.YEAR) + 1900);
        sb.append("-");
        int month = c.get(Calendar.MONTH) + 1;
        sb.append(month < 10 ? "0" + month : month);
        sb.append("-");
        int d = c.get(Calendar.DATE);
        sb.append(d < 10 ? "0" + d : d);
        return sb.toString();
    }

    public static Timestamp getDateTime() {
        Date date = new Date();
        return (new Timestamp(date.getTime()));
    }

    /**
     * @Title: parseDate 
     * @Description: 字符串转日期
     * @param strDate 
     * @param pattern 
     * @return
     * Date @throws
     */
    public static Date parseDate(String strDate, String pattern) {
        if (isEmpty(strDate)) {
            return null;
        }
        SimpleDateFormat fmtDate = null;
        java.text.ParsePosition pos = new java.text.ParsePosition(0);
        fmtDate = new SimpleDateFormat(pattern);

        Date dtRet = null;
        try {
            return dtRet = fmtDate.parse(strDate, pos);
        } catch (Exception e) {

        }
        return dtRet;

    }

    /**
     * @Title: exactEqual 
     * @Description: 判断两字符串相等
     * @param source 
     * @param target 
     * @return boolean
     * @throws
     */
    public static boolean exactEqual(String source, String target) {
        if (source == null || target == null) {
            return false;
        }
        if (source.length() != target.length()) {
            return false;
        }

        char[] sc = source.toCharArray();
        char[] tc = target.toCharArray();
        for (int i = 0; i < sc.length; i++) {
            if (sc[i] == tc[i]) {
                continue;
            } else {
                return false;
            }
        }
        return true;
    }

    /**
     * 获取系统绝对路径
     *
     * @return
     */
    public final static String getPath() {
        CommonUtil function = new CommonUtil();
        return function.getUrlPath();
    }

    /**
    * @Title: getUrlPath
    * @Description: TODO
    * @return String
    * @throws
    */ 
    private final String getUrlPath() {

        String path = "";
        try {
            path = URLDecoder.decode(this.getClass().getResource("/").toString(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        if (System.getProperties().get("os.name").toString().toLowerCase().contains("windows")) {
            path = path.substring(6, path.indexOf("WEB-INF"));
        } else {
            path = path.substring(5, path.indexOf("WEB-INF"));
        }
        return path;
    }

    /**
    * @Title: extractText
    * @Description: 提取含html标签的字符串的纯文本
    * @param htmlStr
    * @return String
    * @throws
    */ 
    public static String extractText(String htmlStr) {
        String textStr = "";
        Pattern pScript;
        java.util.regex.Matcher mScript;
        Pattern pStyle;
        java.util.regex.Matcher mStyle;
        Pattern pHtml;
        java.util.regex.Matcher mHtml;

        try {
            String regExScript = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; // 定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script>
            // }
            String regExStyle = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; // 定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style>
            // }
            String regExHtml = "<[^>]+>"; // 定义HTML标签的正则表达式

            pScript = Pattern.compile(regExScript, Pattern.CASE_INSENSITIVE);
            mScript = pScript.matcher(htmlStr);
            htmlStr = mScript.replaceAll(""); // 过滤script标签

            pStyle = Pattern.compile(regExStyle, Pattern.CASE_INSENSITIVE);
            mStyle = pStyle.matcher(htmlStr);
            htmlStr = mStyle.replaceAll(""); // 过滤style标签

            pHtml = Pattern.compile(regExHtml, Pattern.CASE_INSENSITIVE);
            mHtml = pHtml.matcher(htmlStr);
            htmlStr = mHtml.replaceAll(""); // 过滤html标签

            textStr = htmlStr;

        } catch (Exception e) {

        }

        return textStr;
    }

    /**
    * @Title: safelyToLowerCase
    * @Description: 获取小写字符串
    * @param input
    * @return String
    * @throws
    */ 
    public static String safelyToLowerCase(String input) {
        if (input != null) {
            return input.toLowerCase();
        }
        return input;
    }

    /**
    * @Title: safelyToUpperCase
    * @Description: 获取大写字符串
    * @param input
    * @return String
    * @throws
    */ 
    public static String safelyToUpperCase(String input) {
        if (input != null) {
            return input.toUpperCase();
        }
        return input;
    }

    /**
     * 日期格式化
     *
     * @param date
     *            待转日期
     * @param pattern
     *            格式
     * @return
     */
    public static String forMatDate(String date, String pattern) {
        try {
            return getDateStringByPattern(new Date(Long.valueOf(date)), pattern);
        } catch (Exception e) {
            return getDateStringByPattern(pattern);
        }
    }

    /***
     * 查看是否是视频文件格式
     *
     * @param fileName
     *            文件名
     * @return boolean
     */
    public static boolean getFileFormat(String fileName) {
        // 可以转换的文件格式
        String formatStr = "asx|asf|mpg|wmv|3gp|mp4|mov|avi|flv|wmv9|rm|rmvb";
        // 得到文件的扩展名
        String type = getFileSuffix(fileName);
        return formatStr.indexOf(type) >= 0 ? true : false;
    }

    /**
     * 是否是OpenOffice能转换的格式
     *
     * @param fileName
     *            文件名
     * @return boolean
     */
    public static boolean isDocumentType(String fileName) {
        // 能转换的文档 的扩展名
        String formatStr = "pdf|xhtml|html|odt|sxw|doc|docx|rtf|wpd|txt|wikitext"
                + "|ods|sxc|xls|xlsx|csv|tsv|odp|sxi|ppt|pptx|odg|svg";
        // 得到文件的扩展名
        String type = getFileSuffix(fileName);
        return formatStr.indexOf(type) >= 0 ? true : false;
    }

    /**
     * 是否为图片格式
     *
     * @param fileName
     *            文件名
     * @return boolean
     */
    public static boolean isImagesType(String fileName) {
        // 图片格式的扩展名
        String formatStr = "jpg|gif|bmp";
        // 得到文件的扩展名
        String type = getFileSuffix(fileName);
        return formatStr.indexOf(type) >= 0 ? true : false;
    }

    public static String getFileSuffix(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()).toLowerCase();
    }

    /**
     * 是否为Flash格式
     *
     * @param fileName
     *            文件名
     * @return boolean
     */
    public static boolean isFlashType(String fileName) {
        // flash格式的扩展名
        String formatStr = "swf";
        // 得到文件的扩展名
        String type = getFileSuffix(fileName);
        return formatStr.indexOf(type) >= 0 ? true : false;
    }

    /**
     * 得到文件后缀名
     *
     * @param fileName
     * @return
     */
    public static String getFileSuffixName(String fileName) {
        // 得到文件的扩展名
        String suffixName = fileName.substring(fileName.lastIndexOf("."), fileName.length()).toLowerCase();
        return suffixName;

    }

    /**
     * 查看文件是否属于校验 格式
     *
     * @param fileName
     *            文件名
     * @param formatType
     *            校验格式
     * @return
     */
    public static boolean isDocumentType(String fileName, String formatType) {
        String type = getFileSuffix(fileName);

        return formatType.indexOf(type) >= 0 ? true : false;
    }

    /**
     * 得到inputFile的保存位置
     *
     * @param inputFile
     *            文件路径
     * @return String
     */
    public static String getInputFilePath(String inputFile) {
        inputFile = inputFile.replace("\\", "/");
        inputFile = inputFile.replace("//", "/");
        String path = inputFile.substring(0, inputFile.lastIndexOf("/") + 1);
        return path;
    }

    /**
     * 更新文件的扩展名
     *
     * @param fileName
     * @param format
     * @return
     */
    public static String getModefyFormat(String fileName, String format) {
        return fileName.substring(0, fileName.lastIndexOf(".") + 1) + format;
    }

    /**
     * 得到文件的文件名 如d:/a/b.doc 得到 b
     *
     * @param fileName
     *            文件 路径
     * @return String
     */
    public static String getFileName(String fileName) {
        fileName = fileName.replace("\\", "/");
        fileName = fileName.replace("//", "/");
        return fileName.substring(fileName.lastIndexOf("/") + 1, fileName.lastIndexOf("."));

    }

    /**
    * @Title: isDocument
    * @Description: 判断是否是文档
    * @param fileName
    * @return boolean
    * @throws
    */ 
    public static boolean isDocument(String fileName) {
        String formatType = "doc,docx,ppt,pptx,rtf,xls,pdf";
        String type = getFileSuffix(fileName);
        return formatType.indexOf(type) >= 0 ? true : false;

    }

    /**
     * 查看文件夹下所有文件
     *
     * @param fileName
     *            文件夹名
     * @return List<String>
     */
    public static int getFileAll(String fileName) {

        File file = new File(fileName);
        File[] fileArray = file.listFiles();
        int fileSize = 0;
        try {
            fileSize = fileArray.length;

        } catch (Exception ex) {

        }
        return fileSize;

    }

    /**
     * 复制整个文件夹内容
     *
     * @param oldPath
     * @param newPath
     */
    public static void copyFolder(String oldPath, String newPath) {
        try {
            // 创建目标文件夹
            (new File(newPath)).mkdirs();
            // 获取源文件夹当前下的文件或目录
            File[] file = (new File(oldPath)).listFiles();
            for (int i = 0; i < file.length; i++) {
                if (file[i].isFile()) {
                    // 复制文件
                    copyFile(file[i], new File(newPath + "/" + file[i].getName()));
                }
                if (file[i].isDirectory()) {
                    // 复制目录
                    String sourceDir = oldPath + File.separator + file[i].getName();
                    String targetDir = newPath + File.separator + file[i].getName();
                    copyDirectiory(sourceDir, targetDir);
                }
            }

            // (new File(newPath)).mkdirs(); // 如果文件夹不存在 则建立新文件夹
            // File a = new File(oldPath);
            // String[] file = a.list();
            // File temp = null;
            // for (int i = 0; i < file.length; i++) {
            // if (oldPath.endsWith(File.separator)) {
            // temp = new File(oldPath + file[i]);
            // } else {
            // temp = new File(oldPath + File.separator + file[i]);
            // }
            //
            // if (temp.isFile()) {
            // FileInputStream input = new FileInputStream(temp);
            // FileOutputStream output = new FileOutputStream(newPath
            // + "/" + (temp.getName()).toString());
            // byte[] b = new byte[1024 * 5];
            // int len;
            // while ((len = input.read(b)) != -1) {
            // output.write(b, 0, len);
            // }
            // output.flush();
            // output.close();
            // input.close();
            // }
            // if (temp.isDirectory()) {// 如果是子文件夹
            // copyFolder(oldPath + "/" + file[i], newPath + "/" + file[i]);
            // }
            // }
        } catch (Exception e) {
            System.out.println("复制整个文件夹内容操作出错");
            e.printStackTrace();

        }
    }

    /**
    * @Title: copyFile
    * @Description: 复制文件
    * @param sourceFile
    * @param targetFile
    * @throws IOException void
    * @throws
    */ 
    public static void copyFile(File sourceFile, File targetFile) throws IOException {
        // 新建文件输入流并对它进行缓冲
        FileInputStream input = new FileInputStream(sourceFile);
        BufferedInputStream inBuff = new BufferedInputStream(input);

        // 新建文件输出流并对它进行缓冲
        FileOutputStream output = new FileOutputStream(targetFile);
        BufferedOutputStream outBuff = new BufferedOutputStream(output);

        // 缓冲数组
        byte[] b = new byte[1024 * 5];
        int len;
        while ((len = inBuff.read(b)) != -1) {
            outBuff.write(b, 0, len);
        }
        // 刷新此缓冲的输出流
        outBuff.flush();

        // 关闭流
        inBuff.close();
        outBuff.close();
        output.close();
        input.close();
    }

    /**
    * @Title: copyDirectiory
    * @Description: 复制文件夹
    * @param sourceDir
    * @param targetDir
    * @throws IOException void
    * @throws
    */ 
    public static void copyDirectiory(String sourceDir, String targetDir) throws IOException {
        // 新建目标目录
        (new File(targetDir)).mkdirs();
        // 获取源文件夹当前下的文件或目录
        File[] file = (new File(sourceDir)).listFiles();
        for (int i = 0; i < file.length; i++) {
            if (file[i].isFile()) {
                // 源文件
                File sourceFile = file[i];
                // 目标文件
                File targetFile = new File(new File(targetDir).getAbsolutePath() + File.separator + file[i].getName());
                copyFile(sourceFile, targetFile);
            }
            if (file[i].isDirectory()) {
                // 准备复制的源文件夹
                String dir1 = sourceDir + "/" + file[i].getName();
                // 准备复制的目标文件夹
                String dir2 = targetDir + "/" + file[i].getName();
                copyDirectiory(dir1, dir2);
            }
        }
    }

    /**
     * 将字符编码修改为utf-8
     *
     * @param str
     * @return
     */
    public static String setStr2utf8(String str) {
        String s = "";
        try {
            s = new String(str.getBytes("ISO-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return s;
    }
    
    /**
     * 转gbk
     *
     * @param str
     * @return
     */
    public static String iso2gbk(String str) {
        try {
            return new String(str.getBytes("ISO8859-1"), "gb2312");
        } catch (UnsupportedEncodingException ex) {
            return str;
        }
    }

    /**
     * 设置字符的编码格式
     *
     * @param str
     * @return
     */
    public static String setStr2Encoding(String str, String encoding) {
        String s = "";
        try {
            s = new String(str.getBytes("ISO-8859-1"), encoding);
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return s;
    }

    /**
     * 获取随机数
     *
     * @param count
     *            多少位
     * @return
     */
    public static String getRandomByCount(int count) {
        Random random = new Random();
        String result = "";
        for (int i = 0; i < count; i++) {
            result += random.nextInt(10);
        }
        return result;
    }

    /**
     * 获取以yyyy-MM-dd HH:mm:ss格式的 时间
     *
     * @return
     */
    public static String getDateStrNow() {
        return CommonUtil.getDateStringByPattern("yyyy-MM-dd HH:mm:ss");
    }


    /**
     * 简单介绍：根据文件获取文件头的类型码<br>
     * 详细介绍：<br>
     * 
     * @param file
     *            需要判断的文件
     * @return 返回文件头类型码：如Excel2003:D0CF11E0;Excel2007:504B0304等等
     * @throws Exception
     * @version 1.1 2014-4-28
     * @autor liangyongtong
     */
    @SuppressWarnings("resource")
    public static String getFileHeadTypeString(File file) throws Exception {
        FileInputStream is = new FileInputStream(file);
        byte[] src = new byte[4];
        is.read(src, 0, src.length);
        StringBuilder sb = new StringBuilder();
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                sb.append(0);
            }
            sb.append(hv);
        }
        is.close();
        return sb.toString().toUpperCase();
    }

    /**
     * 简单介绍：复制对象<br>
     * 详细介绍：<br>
     * 
     * @version 1.1 2014-5-9
     * @autor wuxiao
     */

    public final static Object objectCopy(Object oldObj) {
        Object newObj = null;

        try {
            ByteArrayOutputStream bo = new ByteArrayOutputStream();
            ObjectOutputStream oo = new ObjectOutputStream(bo);
            oo.writeObject(oldObj);// 源对象
            ByteArrayInputStream bi = new ByteArrayInputStream(bo.toByteArray());
            ObjectInputStream oi = new ObjectInputStream(bi);
            newObj = oi.readObject();// 目标对象
        } catch (IOException e) {

        } catch (ClassNotFoundException e) {

        }

        return newObj;
    }

    /**
     * 简单介绍：返回一个日期列表<br>
     * 详细介绍：根据参数，返回当天以前的length天内的一个日期列表，包含当天<br>
     * 
     * @param length
     *            需要的天数
     * @return 日期列表 如果length小于0，返回null
     * @version 1.1 2014-5-9
     * @autor liangyongtong
     */
    public static List<String> getDateList(int length) {
        if (length < 0) {
            return null;
        }
        List<String> list = new ArrayList<String>();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        for (int i = length - 1; i >= 0; i--) {
            String time = df.format(System.currentTimeMillis() - i * 24 * 60 * 60 * 1000);
            list.add(time);
        }
        return list;
    }

    /**
     * 判断字符串是否为数字
     */
    public static boolean isNumber(String str) {
        Pattern pattern = Pattern.compile(NUMBER_PATTEN);
        return pattern.matcher(str).matches();
    }


    /**
     * 将String转为bytes字节
     * 
     * @param str
     * @param encoding
     * @return
     */
    public static String string2Bytes(String str, String encoding) {
        String s = "";
        try {
            if (CommonUtil.isEmpty(str)) {
                s = new String(str.getBytes());
            } else {
                s = new String(str.getBytes(encoding));
            }
        } catch (UnsupportedEncodingException e) {
        }
        return s;
    }

    public static List<Integer> idsToArray(String ids) {
        List<Integer> list = new ArrayList<Integer>();
        for (String id : ids.split(",")) {
            list.add(Integer.parseInt(id));
        }
        return list;
    }

    public static String getRandomFileName(int randomLength, String suffix) {
        return CommonUtil.getDateStringByPattern("yyyyMMddHHmmss") + "_" + CommonUtil.getRandomByCount(randomLength)
                + "." + suffix;
    }

    @SuppressWarnings("unchecked")
    public static <T> Map<String, T> asMap(Object... args) {
        if (args.length % 2 != 0) {
            throw new IllegalArgumentException("args.length = " + args.length);
        }

        Map<String, T> map = new HashMap<String, T>();
        for (int i = 0; i < args.length - 1; i += 2) {
            map.put(String.valueOf(args[i]), (T) args[i + 1]);
        }
        return map;
    }

    public static Map<String, String> asStringMap(Object... args) {
        if (args.length % 2 != 0) {
            throw new IllegalArgumentException("args.length = " + args.length);
        }

        Map<String, String> map = new HashMap<String, String>();
        for (int i = 0; i < args.length - 1; i += 2) {
            map.put(String.valueOf(args[i]), args[i + 1] == null ? null : String.valueOf(args[i + 1]));
        }
        return map;
    }
}
