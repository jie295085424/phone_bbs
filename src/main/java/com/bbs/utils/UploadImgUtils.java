package com.bbs.utils;
import org.springframework.web.multipart.MultipartFile;  
import javax.servlet.http.HttpServletRequest;  
import java.io.File;  
import java.io.IOException;  
 
  
/**  
 * Created by shhao.  
 * Date: 14-9-1  
 * Time:下午4:12  
 */  
public class UploadImgUtils {  
  
    public static final String FILE_PATH = "/upload/";  
  
    //文件上传  
    public static String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException {  
    	   if (file!=null) {// 判断上传的文件是否为空
               String path=null;// 文件路径
               String type=null;// 文件类型
               String fileName=file.getOriginalFilename();// 文件原名称
               System.out.println("上传的文件原名称:"+fileName);
               // 判断文件类型
               type=fileName.indexOf(".")!=-1?fileName.substring(fileName.lastIndexOf(".")+1, fileName.length()):null;
               if (type!=null) {// 判断文件类型是否为空
                   if ("GIF".equals(type.toUpperCase())||"PNG".equals(type.toUpperCase())||"JPG".equals(type.toUpperCase())) {
                       // 项目在容器中实际发布运行的根路径
                       String realPath=request.getSession().getServletContext().getRealPath("/");
                       // 自定义的文件名称
                       String trueFileName=String.valueOf(System.currentTimeMillis())+fileName;
                       // 设置存放图片文件的路径
                       path=realPath+"img\\portrait\\"+trueFileName;
                       System.out.println("存放图片文件的路径:"+path);
                       // 转存文件到指定的路径
                       file.transferTo(new File(path));
                       System.out.println("文件成功上传到指定目录下");
                       return "img\\portrait\\"+trueFileName;
                   }else {
                       System.out.println("不是我们想要的文件类型,请按要求重新上传");
                       return null;
                   }
               }else {
                   System.out.println("文件类型为空");
                   return null;
               }
           }else {
               System.out.println("没有找到相对应的文件");
               return null;
           }
          
}  }