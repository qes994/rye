package edu.wandongli.rye.controller;

import com.google.code.kaptcha.impl.DefaultKaptcha;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@RestController
public class PageController {

    @Autowired
    DefaultKaptcha defaultKaptcha;

    @GetMapping("/")
    public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/home/page/main");
        return modelAndView;
    }

    @RequestMapping(value = "/verification")
    public void getVerification(HttpServletRequest request, HttpServletResponse response) throws IOException {
        byte[] verByte = null;
        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
        try {
            //生产验证码字符串并保存到session中
            String createText = defaultKaptcha.createText();
            request.getSession().setAttribute("verify_session_Code", createText);
            //使用生产的验证码字符串返回一个BufferedImage对象并转为byte写入到byte数组中
            BufferedImage challenge = defaultKaptcha.createImage(createText);
            request.getSession().setAttribute("code", createText);
            // System.out.println(createText+"////////////////////////////////////");
            ImageIO.write(challenge, "jpg", jpegOutputStream);
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        } catch (IOException e) {
            e.printStackTrace();
        }
        //定义response输出类型为image/jpeg类型，使用response输出流输出图片的byte数组
        verByte = jpegOutputStream.toByteArray();
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/jpeg");
        ServletOutputStream responseOutputStream = response.getOutputStream();
        responseOutputStream.write(verByte);
        responseOutputStream.flush();
        responseOutputStream.close();
    }

    //上传图片
    @RequestMapping(value = "/upload/image", method = RequestMethod.POST)
    public ModelMap getUploadFile(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        ModelMap map = new ModelMap();
        String filePath = "D:\\upload\\images\\";
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String contentType = file.getContentType();
        String suffix = contentType.substring(contentType.indexOf("/") + 1);
        String fileName = uuid + "." + suffix;
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHH");
        String datePath = dateFormat.format(date);
        System.out.println(datePath);
        String dirPath = filePath + File.separator + datePath;
        File imageDir = new File(dirPath);
        if (!imageDir.isDirectory()) {
            imageDir.mkdirs();
        }
        try {
            file.transferTo(new File(imageDir + File.separator + fileName));
            String url = "/" + datePath + "/" + fileName;
            //System.out.println("文件路径:"+url);
            map.put("code", 1);
            map.put("msg", "上传成功！");
            map.put("url", url);
        } catch (IOException e) {
            e.printStackTrace();
            map.put("code", 0);
            map.put("msg", "上传失败！");
        }
        return map;
    }


}
